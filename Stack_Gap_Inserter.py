import json
import re
from pathlib import Path

# ----------------------
# Utility Functions
# ----------------------

def load_profiling(json_path):
    with open(json_path, "r") as f:
        return json.load(f)


def load_assembly(asm_path):
    with open(asm_path, "r") as f:
        return f.read()


def save_assembly(output_path, asm_code):
    with open(output_path, "w") as f:
        f.write(asm_code)

# ----------------------
# Gap Insertion Algorithm
# ----------------------

def insert_static_gap(asm_code, func_name, gap_size):
    """Insert static gap before the stack frame of a given function."""
    pattern = rf"({func_name}:\n[\s\S]*?movq[\s]+%rsp, %rbp)"
    replacement = rf"\1\n    subq    ${gap_size}, %rsp   # static gap inserted"
    return re.sub(pattern, replacement, asm_code)


def generate_gap_wrapper(func_name):
    """Generate a wrapper for a hot function that applies the dynamic gap before calling it."""
    return f"""
.globl gap_{func_name}
.type gap_{func_name}, @function
gap_{func_name}:
    pushq   %rbp
    movq    %rsp, %rbp
    leaq    global_counter(%rip), %rdx
    movq    (%rdx), %rax
    subq    %rax, %rsp
    andq    $1024, %rax
    addq    $64, %rax
    leaq    global_counter(%rip), %rdx
    movq    %rax, (%rdx)
    call    {func_name}@PLT
    leave
    ret
    .size   gap_{func_name}, .-gap_{func_name}
"""


def inject_gap_logic_main(asm_code, hot_funcs):
    """Injects the dynamic gap wrappers and global counter into the main assembly file."""
    gap_header = ".section .data\nglobal_counter:\n    .quad    64\n"
    wrappers = "\n".join([generate_gap_wrapper(f) for f in hot_funcs])
    return asm_code + "\n" + gap_header + "\n" + wrappers


def replace_calls_with_gaps(asm_code, hot_funcs):
    """Replace calls to hot functions with calls to their gap wrappers."""
    for f in hot_funcs:
        asm_code = re.sub(rf"call[\s]+{f}@PLT", f"call    gap_{f}", asm_code)
    return asm_code

# ----------------------
# Strategy Derivation from Profiling JSON
# ----------------------

def derive_strategy(func_info):
    # Find max write count among variables
    max_write = 0
    hottest_var_size = 8
    for var in func_info.get("variables", []):
        wc = var.get("write_count", 0)
        if wc > max_write:
            max_write = wc
            hottest_var_size = var.get("size", 8)

    if max_write > 10000:
        return {"strategy": "dynamic", "gap_size": 2 * hottest_var_size}
    elif max_write > 500:
        return {"strategy": "static", "gap_size": 2 * hottest_var_size}
    else:
        return {"strategy": "none"}

# ----------------------
# Main Transformation
# ----------------------

def apply_gap_strategy(profiling_path, output_dir):
    profiling = load_profiling(profiling_path)

    # Group functions by source file
    files_map = {}
    for func_info in profiling:
        src_file = Path(func_info["source_file"])
        if src_file not in files_map:
            files_map[src_file] = []
        files_map[src_file].append(func_info)

    # Identify main file and hot functions
    hot_funcs = []
    main_file = None
    for func_info in profiling:
        if func_info["function_name"] == "main":
            main_file = Path(func_info["source_file"])
        else:
            strategy = derive_strategy(func_info)
            if strategy["strategy"] == "dynamic":
                hot_funcs.append(func_info["function_name"])

    for asm_file, funcs in files_map.items():
        if not asm_file.exists():
            print(f"[!] Assembly file not found: {asm_file}")
            continue

        asm_code = load_assembly(asm_file)

        # Apply static gaps
        for func_info in funcs:
            func_name = func_info["function_name"]
            strategy_info = derive_strategy(func_info)
            if strategy_info["strategy"] == "static":
                gap_size = strategy_info["gap_size"]
                asm_code = insert_static_gap(asm_code, func_name, gap_size)
                print(f"[+] Inserted static gap ({gap_size}) in {func_name} of {asm_file.name}")

        # Replace calls to hot functions with gap wrappers
        if hot_funcs:
            asm_code = replace_calls_with_gaps(asm_code, hot_funcs)

        # Inject gap wrappers only into main file
        if asm_file == main_file and hot_funcs:
            asm_code = inject_gap_logic_main(asm_code, hot_funcs)
            print(f"[+] Injected dynamic gap wrappers into {asm_file.name}")

        output_path = Path(output_dir) / asm_file.name
        save_assembly(output_path, asm_code)
        print(f"[✓] Saved transformed assembly to {output_path}")

# ----------------------
# Example Usage
# ----------------------
if __name__ == "__main__":
    profiling_file = "/home/mahsa/Documents/MiBench/Pseudo_added/basicmath_pseudo_added/Modification/basicmath_stack_profiling.json"
    output_dir = "/home/mahsa/Documents/MiBench/Pseudo_added/basicmath_pseudo_added/My_gap"

    Path(output_dir).mkdir(parents=True, exist_ok=True)
    apply_gap_strategy(profiling_file, output_dir)
