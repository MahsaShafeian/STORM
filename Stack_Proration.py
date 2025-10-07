#!/usr/bin/env python3
"""
stack_proration.py

Best-effort implementation of the "proration" algorithm you described.

Features implemented:
- Parse an x86-64 AT&T-style assembly file (single function or whole file).
- Parse a profiling JSON that maps stack-relative names like "-152(%rbp)" to
  write_count and size.
- Identify "hot" stack slots (based on a threshold / target writes-per-slot)
  and compute a proration factor (number of alternate slots to allocate).
- Expand the function stack frame (adjust `subq $N, %rsp` in the function
  prologue) to allocate extra padding for the new slots.
- Remap *write* instructions that target a hot stack offset so that they rotate
  among alternate slots (round-robin per write occurrence).
- For each basic block, ensure the *first read* of a hot variable uses the same
  physical slot as the *last write* of its predecessors. If predecessor blocks
  used different slots, insert (conservative) memory-to-memory copies via
  `movq src, %rax; movq %rax, dest` in the predecessor blocks to reconcile
  the slot used.

Limitations and conservative behaviors (important):
- This tool is best-effort and conservative. It does NOT do full assembler/
  linker-aware transformations; it edits textual assembly only.
- It assumes AT&T syntax where the destination operand is last.
- It uses simple heuristics to detect reads vs writes based on operand position.
- It inserts `movq`/`movl` copies using %rax as a temporary register. This may
  clobber caller-saved state; you should validate/adjust the register choices
  and calling convention for production use.
- It handles only stack-memory references of the form `-NUM(%rbp)`.
- If a function uses stack frame pointers differently or uses %rsp-relative
  addressing, this script may need adjustments.

Usage:
    python3 stack_proration.py \
        --asm INPUT.S \
        --json profile.json \
        --func SolveCubic \
        --out OUTPUT.S

Options allow tuning the `target_writes_per_slot` and the maximum factor.

This is intended to be a starting automation — please test the generated
assembly heavily and adapt to your assembler / platform.
"""

import re
import json
import argparse
from collections import defaultdict, namedtuple
import math
import os

# Data structures
Block = namedtuple('Block', ['name', 'start', 'end', 'lines'])
InstrInfo = namedtuple('InstrInfo', ['line_idx', 'text', 'mem_ops'])

MEM_RE = re.compile(r'(-?\d+)\(%rbp\)')  # captures offset like -152
LABEL_RE = re.compile(r'^([A-Za-z_\.\$][A-Za-z0-9_\.\$@]*)\s*:$')
SUBQ_RE = re.compile(r'\bsubq\s+\$(\d+),\s*%rsp\b')
JUMP_RE = re.compile(r'\b(jmp|je|jne|jz|jnz|jg|jl|jge|jle|ja|jb|jae|jbe|jne)\s+([A-Za-z_\.\$@0-9][A-Za-z0-9_\.\$@]*)')
UNCOND_JUMP_RE = re.compile(r'\bjmp\s+([A-Za-z_\.\$@0-9][A-Za-z0-9_\.\$@]*)')
RET_RE = re.compile(r'\bretq?\b')


def parse_profiling_json(path):
    with open(path, 'r') as f:
        data = json.load(f)
    # Accept either a list or dict. We expect entries with keys: name, size, write_count
    mapping = {}
    if isinstance(data, list):
        for entry in data:
            name = entry.get('name')
            if name:
                mapping[name.strip()] = entry
    elif isinstance(data, dict):
        # If top-level dict maps names to entries
        # e.g. {"-152(%rbp)": {...}}
        for k, v in data.items():
            # If v itself has "name", use it; else use k
            name = v.get('name') if isinstance(v, dict) and 'name' in v else k
            mapping[name.strip()] = v
    else:
        raise ValueError('Unexpected JSON root structure')
    return mapping


def split_into_functions(asm_lines):
    """Return a dict func_name->(start_idx,end_idx)
    where start_idx is the line of the label and end_idx is exclusive.
    We detect labels that look like function symbols and use a heuristic: a
    label followed by a `.LFB` or typical function prologue lines.
    """
    funcs = {}
    label_lines = {}
    for i, l in enumerate(asm_lines):
        m = LABEL_RE.match(l.strip())
        if m:
            label = m.group(1)
            label_lines[i] = label
    # Heuristic: a label followed shortly by 'subq $..., %rsp' is a function
    next_idx = None
    keys = sorted(label_lines.keys())
    for idx_pos, idx in enumerate(keys):
        label = label_lines[idx]
        # search forward until next label or eof
        end = keys[idx_pos+1] if idx_pos+1 < len(keys) else len(asm_lines)
        funcs[label] = (idx, end)
    return funcs


def parse_basic_blocks(func_lines, func_start_idx):
    # Identify block boundaries by labels within the function and fall-through/jumps
    # We'll treat any label inside the function as block start. Also the first line is a start.
    local_labels = {}
    for i, l in enumerate(func_lines):
        m = LABEL_RE.match(l.strip())
        if m:
            local_labels[i] = m.group(1)
    # Block starts at 0 and at every label
    starts = set([0] + list(local_labels.keys()))
    # Additionally, any instruction immediately after an unconditional jump or ret starts a new block
    for i, l in enumerate(func_lines[:-1]):
        if UNCOND_JUMP_RE.search(l) or RET_RE.search(l):
            starts.add(i+1)
    starts = sorted([s for s in starts if s < len(func_lines)])
    blocks = []
    for i, s in enumerate(starts):
        e = starts[i+1] if i+1 < len(starts) else len(func_lines)
        name = None
        if s in local_labels:
            name = local_labels[s]
        else:
            name = f'.Lblock_{s+func_start_idx}'
        block_lines = func_lines[s:e]
        blocks.append(Block(name=name, start=s+func_start_idx, end=e+func_start_idx, lines=block_lines))
    return blocks


def find_cfg_edges(blocks):
    # Map block index to successors and predecessors. We use text of last instruction.
    succs = defaultdict(list)
    preds = defaultdict(list)
    label_to_block = {}
    for i, b in enumerate(blocks):
        # if block has label as first line, map it
        m = LABEL_RE.match(b.lines[0].strip()) if b.lines else None
        if m:
            label_to_block[m.group(1)] = i
    for i, b in enumerate(blocks):
        if not b.lines:
            continue
        last = b.lines[-1].strip()
        # unconditional jmp -> single successor
        um = UNCOND_JUMP_RE.search(last)
        if um:
            tgt = um.group(1)
            if tgt in label_to_block:
                succs[i].append(label_to_block[tgt])
                preds[label_to_block[tgt]].append(i)
            continue
        # conditional jumps: target + fallthrough
        jm = JUMP_RE.search(last)
        if jm:
            tgt = jm.group(2)
            if tgt in label_to_block:
                succs[i].append(label_to_block[tgt])
                preds[label_to_block[tgt]].append(i)
        # fallthrough
        if i+1 < len(blocks):
            succs[i].append(i+1)
            preds[i+1].append(i)
    return succs, preds


def extract_mem_operands(instr_text):
    # Return list of (offset_str, operand_position) where operand_position is 0-based index
    # in operand list. For AT&T syntax, operands are comma separated.
    ops = [op.strip() for op in instr_text.split('\t')[-1].split(',')]
    found = []
    for pos, op in enumerate(ops):
        m = MEM_RE.search(op)
        if m:
            off = int(m.group(1))
            found.append((off, pos, op))
    return found


def is_write_operand(pos, num_ops):
    # In AT&T syntax, destination is last operand
    return pos == (num_ops - 1)


def assemble_offset_str(off):
    return f"{off}(%rbp)"


def choose_proration_factor(write_count, size, target_per_slot=20000, max_factor=16):
    if write_count <= target_per_slot:
        return 1
    factor = math.ceil(write_count / target_per_slot)
    return min(max(1, factor), max_factor)


def apply_proration(asm_lines, profile_map, func_name=None, target_per_slot=20000, max_factor=16, verbose=True):
    # Find functions
    funcs = split_into_functions(asm_lines)
    if func_name is None:
        # pick the first function in the file
        func_name = next(iter(funcs.keys()))
        if verbose:
            print(f"No function name provided -- targeting first function: {func_name}")
    if func_name not in funcs:
        raise ValueError(f"Function {func_name} not found in assembly")
    fstart, fend = funcs[func_name]
    func_lines = asm_lines[fstart:fend]

    # Find original frame size
    orig_subq = None
    orig_subq_line = None
    for i, l in enumerate(func_lines[:40]):
        m = SUBQ_RE.search(l)
        if m:
            orig_subq = int(m.group(1))
            orig_subq_line = fstart + i
            break
    if orig_subq is None:
        print("Warning: could not find `subq $N, %rsp` in prologue; assume 0")
        orig_subq = 0

    # Parse basic blocks
    blocks = parse_basic_blocks(func_lines, fstart)
    succs, preds = find_cfg_edges(blocks)

    # Analyze memory accesses per instruction and per block
    # We'll map global instruction indices relative to asm_lines
    instrs = []  # list of InstrInfo
    for bidx, b in enumerate(blocks):
        for j, l in enumerate(b.lines):
            global_idx = b.start + j
            memops = extract_mem_operands(l)
            if memops:
                instrs.append(InstrInfo(line_idx=global_idx, text=l, mem_ops=memops))

    # Build per-block access lists for each profiled var
    # map var_name -> offset int
    profile_offsets = {}
    for k, v in profile_map.items():
        # name looks like "-152(%rbp)"
        m = MEM_RE.search(k)
        if m:
            profile_offsets[int(m.group(1))] = v

    # Decide which offsets to prorate
    hot_offsets = {}
    for off, info in profile_offsets.items():
        wc = info.get('write_count', 0)
        size = info.get('size', 8)
        factor = choose_proration_factor(wc, size, target_per_slot, max_factor)
        if factor > 1:
            hot_offsets[off] = {'write_count': wc, 'size': size, 'factor': factor}
            if verbose:
                print(f"Will prorate offset {off} (%rbp): write_count={wc} size={size} factor={factor}")

    if not hot_offsets:
        if verbose:
            print("No hot offsets found (no proration needed). Returning original assembly.")
        return asm_lines

    # Compute additional frame bytes required
    total_extra = 0
    for off, d in hot_offsets.items():
        total_extra += (d['factor'] - 1) * d['size']

    if verbose:
        print(f"Total extra stack bytes required: {total_extra}")

    # Create new slot offsets for each hot var. Strategy: keep original offset as slot0;
    # allocate additional slots by subtracting cumulative offset starting from orig_subq boundary.
    # We'll keep a running allocator that places new slots below the existing frame area.
    # Compute lowest allocation start (most negative offset) = - (orig_subq + total_extra) + 8 ?
    # Simpler: for each var, produce slots adjacent to original offset by stepping down.
    new_slots = {}
    # We'll track already-used offsets to avoid clashes
    used_offsets = set(profile_offsets.keys())

    # We will allocate additional slots by moving away from other existing offsets using stepping by size.
    for off, d in hot_offsets.items():
        size = d['size']
        k = d['factor']
        slots = [off]
        cur = off
        added = 0
        # create k-1 additional slots by moving downward (more negative)
        while added < (k-1):
            cur = cur - size
            if cur in used_offsets:
                # skip collisions
                cur = cur - size
            slots.append(cur)
            used_offsets.add(cur)
            added += 1
        new_slots[off] = slots
        if verbose:
            print(f"Slots for {off} -> {slots}")

    # Now map write occurrences to rotating slots. We'll scan instructions in textual order and
    # for each write to a hot offset choose the next slot.
    write_counters = {off: 0 for off in new_slots}
    # We'll need a mapping for each instruction line index to new text
    new_lines = list(asm_lines)

    # Also record last write slot per block for each hot var (to reconcile with successor first reads)
    last_write_slot_in_block = {bidx: {} for bidx in range(len(blocks))}
    # And first_read occurrences per block for each hot var: store (instr_idx, slot_requirement)
    first_read_instr_in_block = {bidx: {} for bidx in range(len(blocks))}

    # First pass: remap writes and detect reads
    for bidx, b in enumerate(blocks):
        for j, l in enumerate(b.lines):
            gidx = b.start + j
            memops = extract_mem_operands(l)
            if not memops:
                continue
            # find number of operands
            ops = [op.strip() for op in l.split('\t')[-1].split(',')]
            num_ops = len(ops)
            modified = False
            new_text = l
            for (off, pos, rawop) in memops:
                if off not in new_slots:
                    # not hot
                    # but we still might need to record first read if it matches a hot var? no
                    continue
                if is_write_operand(pos, num_ops):
                    # write -> remap to rotating slot
                    slots = new_slots[off]
                    cnt = write_counters[off]
                    slot_idx = cnt % len(slots)
                    write_counters[off] += 1
                    new_off = slots[slot_idx]
                    # replace the occurrence of the offset text in the operand
                    old_optext = rawop
                    old_off_text = f"{off}(%rbp)"
                    new_off_text = f"{new_off}(%rbp)"
                    new_text = new_text.replace(old_off_text, new_off_text, 1)
                    modified = True
                    # record as last write in this block
                    last_write_slot_in_block[bidx][off] = new_off
                else:
                    # read operand
                    # If this is the first read of this hot var in the block, record it
                    if off not in first_read_instr_in_block[bidx]:
                        first_read_instr_in_block[bidx][off] = gidx
            if modified:
                new_lines[gidx] = new_text

    # Second pass: ensure first reads align with predecessor last writes.
    # For each block b and each hot var 'off' that has a first read in b:
    # - gather set of predecessor last-write slots (if predecessor didn't write, ignore)
    # - If all predecessors that write have the same slot, rewrite the first read operand to that slot.
    # - If predecessors disagree, choose one canonical slot (we'll pick the slot used by the first predecessor)
    #   and insert mov copies at end of each predecessor that used a different slot to move its value into the canonical slot.
    
    # Helper: replace first read operand in instruction gidx to use new offset value
    def replace_first_read_operand(gidx, original_off, target_off):
        line = new_lines[gidx]
        # find the first occurrence of original offset string in the line
        oldtxt = f"{original_off}(%rbp)"
        if oldtxt not in line:
            # Maybe the original read was not yet changed; try matching any slot for this var
            for cand in new_slots[original_off]:
                candtxt = f"{cand}(%rbp)"
                if candtxt in line:
                    line = line.replace(candtxt, f"{target_off}(%rbp)", 1)
                    new_lines[gidx] = line
                    return True
            return False
        line = line.replace(oldtxt, f"{target_off}(%rbp)", 1)
        new_lines[gidx] = line
        return True

    # Build quick map from global line index to block idx
    lineidx_to_block = {}
    for bidx, b in enumerate(blocks):
        for j in range(b.start, b.end):
            lineidx_to_block[j] = bidx

    # For blocks in order, reconcile
    for bidx, b in enumerate(blocks):
        frmap = first_read_instr_in_block[bidx]
        if not frmap:
            continue
        for off, gidx in frmap.items():
            # gather predecessor slots
            pred_slots = []
            for p in preds.get(bidx, []):
                if off in last_write_slot_in_block.get(p, {}):
                    pred_slots.append(last_write_slot_in_block[p][off])
            if not pred_slots:
                # no predecessor wrote to it (maybe initialized earlier) -> nothing to do
                continue
            unique_slots = sorted(set(pred_slots))
            if len(unique_slots) == 1:
                chosen = unique_slots[0]
                # ensure the first read uses 'chosen'
                replace_first_read_operand(gidx, off, chosen)
            else:
                # conflict: multiple preds used different slot values
                # choose canonical = pred_slots[0]
                canonical = pred_slots[0]
                replace_first_read_operand(gidx, off, canonical)
                # insert copies in predecessors that used other slots
                for p in preds.get(bidx, []):
                    p_last = last_write_slot_in_block.get(p, {}).get(off, None)
                    if p_last is None or p_last == canonical:
                        continue
                    # Insert copy in block p before its terminal instruction
                    # Build mov sequence: movq p_last(%rbp), %rax; movq %rax, canonical(%rbp)
                    insert_idx = blocks[p].end - 1  # global idx of last line in that block
                    # if the last line is a ret/jmp, insert before it
                    lastline = new_lines[insert_idx]
                    # find insertion point: before terminal control-flow instruction if present
                    if RET_RE.search(lastline) or UNCOND_JUMP_RE.search(lastline) or JUMP_RE.search(lastline):
                        insert_pos = insert_idx
                    else:
                        insert_pos = insert_idx + 1
                    seq = []
                    seq.append(f"\t# proration reconcile: copy {p_last}(%rbp) -> {canonical}(%rbp)")
                    seq.append(f"\tmovq\t{p_last}(%rbp), %rax")
                    seq.append(f"\tmovq\t%rax, {canonical}(%rbp)")
                    # Insert into new_lines at insert_pos (which is index in new_lines)
                    # Because new_lines is a plain list, we can splice
                    if verbose:
                        print(f"Inserting copy in predecessor block {blocks[p].name} at line {insert_pos}: {seq}")
                    for s in reversed(seq):
                        new_lines.insert(insert_pos, s + '\n')
                    # Adjust block boundaries (simple conservative update: shift subsequent block start/end by len(seq))
                    shift = len(seq)
                    for bb in range(p+1, len(blocks)):
                        # shift start/end indices
                        blocks[bb] = Block(blocks[bb].name, blocks[bb].start + shift, blocks[bb].end + shift, blocks[bb].lines)
                    # Also update mapping structures is complex; for simplicity we do not recompute everything.
                    # This naive insertion may desync indices for later operations in complex cases.

    # Update prologue 'subq $N, %rsp' to add total_extra
    if orig_subq_line is not None and total_extra > 0:
        old = asm_lines[orig_subq_line]
        m = SUBQ_RE.search(old)
        if m:
            new_amount = orig_subq + total_extra
            new_lines[orig_subq_line] = old.replace(f"${orig_subq}", f"${new_amount}")
            if verbose:
                print(f"Adjusted prologue frame allocation: {orig_subq} -> {new_amount}")

    return new_lines

# =============================
# CONFIG SECTION
# =============================
ASM_FILE = "/home/mahsa/Documents/MiBench/Pseudo_added/basicmath_pseudo_added/My_proration/cubic_alignment.s"     # list of assembly file paths
PROFILE_JSON = "/home/mahsa/Documents/MiBench/Pseudo_added/basicmath_pseudo_added/Modification/basicmath_stack_profiling.json"           # profiling JSON file path
OUTPUT_PATH = "/home/mahsa/Documents/MiBench/Pseudo_added/basicmath_pseudo_added/My_proration/cubic_alignment.s"                # output file (or directory if SPLIT_OUTPUTS)
TARGET_FUNC = None                       # function name to target (None = all)
TARGET_PER_SLOT = 20000                  # target writes per slot before prorating
MAX_FACTOR = 16                          # max proration factor
SPLIT_OUTPUTS = False                    # if True, write one file per input file

def main():
    profile_map = parse_profiling_json(PROFILE_JSON)

    with open(ASM_FILE, 'r') as f:
        asm_lines = f.readlines()

    header_comment = f"\n# ===== Start of transformed file: {ASM_FILE} =====\n"
    footer_comment = f"# ===== End of transformed file: {ASM_FILE} =====\n\n"

    if TARGET_FUNC:
        transformed = apply_proration(
            asm_lines, profile_map, func_name=TARGET_FUNC,
            target_per_slot=TARGET_PER_SLOT, max_factor=MAX_FACTOR
        )
    else:
        funcs = split_into_functions(asm_lines)
        transformed = list(asm_lines)
        for fn in funcs.keys():
            transformed = apply_proration(
                transformed, profile_map, func_name=fn,
                target_per_slot=TARGET_PER_SLOT, max_factor=MAX_FACTOR
            )

    transformed_with_path = [header_comment] + transformed + [footer_comment]

    with open(OUTPUT_PATH, 'w') as f:
        f.writelines(transformed_with_path)

    print(f"Wrote transformed assembly to {OUTPUT_PATH}")

if __name__ == '__main__':
    main()
