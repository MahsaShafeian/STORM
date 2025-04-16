import json
import re

def read_json(file_path):
    with open(file_path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    return data

def identify_basic_blocks(json_data):
    functions_blocks = {}
    
    for function_data in json_data:
        assembly_path = function_data.get("source_file", "")
        function_name = function_data.get("function_name", "Unknown Function")
        
        if not assembly_path:
            print(f"Assembly file path not found for function {function_name}.")
            continue
        
        with open(assembly_path, 'r', encoding='utf-8') as f:
            asm_code = f.readlines()
        
        blocks = []
        start_line = None
        current_block = []
        inside_function = False
        
        for i, line in enumerate(asm_code):
            line = line.rstrip()
            
            if re.match(rf'^\s*{function_name}:\s*$', line):
                inside_function = True
                start_line = i
                current_block.append(line)
                continue
            
            if inside_function:
                if "cfi_endproc" in line:
                    if current_block:
                        blocks.append((start_line + 1, i + 1))
                    break
                
                if re.match(r'^\s*.[a-zA-Z_][a-zA-Z0-9_]*:\s*$', line) or re.search(r'\b(jmp|je|jne|jg|jl|jge|jle|jb|jbe|ja|jnb)\b', line):
                    if current_block:
                        if (i + 1) - (start_line + 1) > 1:
                            blocks.append((start_line + 1, i + 1))
                        current_block = []
                        start_line = i
                current_block.append(line)
        
        functions_blocks[function_name] = blocks
        
        print(f"Function: {function_name}")
        for idx, (start, end) in enumerate(blocks, 1):
            print(f"  Block {idx}: Start Line {start}, End Line {end}")
        print("-" * 40)
    
    return functions_blocks

def identify_frequent_variables(json_data, functions_blocks):
    frequent_vars_by_function = {}
    
    for function_data in json_data:
        function_name = function_data.get("function_name", "Unknown Function")
        variables = function_data.get("variables", [])
        basic_blocks = functions_blocks.get(function_name, [])
        
        frequent_vars = [var for var in variables if var.get("write_count", 0) > 500]
        
        if not frequent_vars:
            continue
        
        frequent_vars_by_function[function_name] = frequent_vars
        
        print(f"Function: {function_name}")
        for var in frequent_vars:
            var_name = var.get("name", "Unknown Variable")
            var_line = var.get("line", -1)
            block_id = None
            
            for idx, block in enumerate(basic_blocks, 1):
                start, end = block
                if start <= var_line <= end:
                    block_id = idx
                    break
            
            print(f"  Variable: {var_name}, Write Count: {var['write_count']}")
        print("-" * 40)
    
    return frequent_vars_by_function

def map_variables_to_blocks(json_data, functions_blocks, frequent_vars_by_function):
    block_variable_map_all = {}
    
    for function_data in json_data:
        function_name = function_data.get("function_name", "Unknown Function")
        basic_blocks = functions_blocks.get(function_name, [])
        variables = frequent_vars_by_function.get(function_name, [])
        
        if not variables:
            continue
        
        # دیکشنری برای نگه داشتن تعداد نوشتن در هر بلاک
        block_variable_map = {idx + 1: {} for idx in range(len(basic_blocks))}
        
        for var in variables:
            var_name = var.get("name", "Unknown Variable")
            write_lines = var.get("lines", {}).get("write", [])
            
            for line in write_lines:
                for idx, (start, end) in enumerate(basic_blocks, 1):
                    if start <= line <= end:
                        if var_name not in block_variable_map[idx]:
                            block_variable_map[idx][var_name] = 0
                        block_variable_map[idx][var_name] += 1
                        break
        
        block_variable_map_all[function_name] = block_variable_map
        
        print(f"Function: {function_name}")
        for block_id, vars_in_block in block_variable_map.items():
            if vars_in_block:
                print(f"  Block {block_id}: {vars_in_block}")
        print("-" * 40)
    
    return block_variable_map_all


def construct_cfg(functions_blocks, asm_files):
    cfg = {}
    
    for function_name, blocks in functions_blocks.items():
        nodes = []
        edges = []
        block_map = {}
        block_types = {}
        
        asm_code = []
        if function_name in asm_files:
            with open(asm_files[function_name], 'r', encoding='utf-8') as f:
                asm_code = f.readlines()
        
        for i, (start, end) in enumerate(blocks, 1):
            block_id = f"B{i}"
            block_map[(start, end)] = block_id
            block_types[block_id] = "normal"
            nodes.append({
                "id": block_id,
                "start": start,
                "end": end,
                "type": "normal"
            })
        
        for (start, end), block_id in block_map.items():
            last_instr = asm_code[end - 1] if end - 1 < len(asm_code) else ""
            
            jump_match = re.search(r'\b(jmp|je|jne|jg|jl|jge|jle|jb|jbe|ja|jnb)\s+([\.\w]+)', last_instr)
            if jump_match:
                jump_type, target_label = jump_match.groups()
                target_found = False
                
                for (s, e), target_id in block_map.items():
                    target_match = re.match(r'^\s*' + re.escape(target_label) + r'\s*:', asm_code[s-1])
                    if target_match:
                        edges.append({"from": block_id, "to": target_id, "type": jump_type})
                        block_types[block_id] = "conditional" if jump_type.startswith("j") else "jump"
                        target_found = True
                        break
                
                if not target_found:
                    print(f"Warning: Target label {target_label} not found in function {function_name}")
                
                if jump_type.startswith("j"):
                    for (s, e), next_id in block_map.items():
                        if s == end:
                            edges.append({"from": block_id, "to": next_id, "type": "fall-through"})
                            break
            else:
                for (s, e), next_id in block_map.items():
                    if s == end:
                        edges.append({"from": block_id, "to": next_id, "type": "fall-through"})
                        break
        
        entry_block = "B1"
        block_types[entry_block] = "entry"
        exit_blocks = {b for b in block_map.values() if not any(e["from"] == b for e in edges)}
        for b in exit_blocks:
            block_types[b] = "exit"
        
        for node in nodes:
            node["type"] = block_types[node["id"]]
        
        cfg[function_name] = {
            "nodes": nodes,
            "edges": edges
        }
    
    return cfg

import json

def assign_variables_to_blocks(profiling_json, proration_json):
    try:
        with open(profiling_json, 'r') as file:
            profiling_data = json.load(file)

        with open(proration_json, 'r') as file:
            proration_data = json.load(file)

        variable_block_mapping = {}

        for function in profiling_data:
            function_name = function.get("function_name")
            
            blocks = proration_data.get(function_name, {}).get("nodes", [])
            variables = function.get("variables", [])

            if function_name not in variable_block_mapping:
                variable_block_mapping[function_name] = {}

            for variable in variables:
                var_name = variable['name']
                write_lines = variable.get('lines', {}).get('write', [])
                read_lines = variable.get('lines', {}).get('read', [])

                if var_name not in variable_block_mapping[function_name]:
                    variable_block_mapping[function_name][var_name] = {
                        "read": [],
                        "write": []
                    }

                for block in blocks:
                    block_id = block['id']
                    block_start = block['start']
                    block_end = block['end']

                    for line in read_lines:
                        if block_start <= line <= block_end:
                            if block_id not in variable_block_mapping[function_name][var_name]["read"]:
                                variable_block_mapping[function_name][var_name]["read"].append(block_id)

                    for line in write_lines:
                        if block_start <= line <= block_end:
                            if block_id not in variable_block_mapping[function_name][var_name]["write"]:
                                variable_block_mapping[function_name][var_name]["write"].append(block_id)

        return variable_block_mapping

    except FileNotFoundError:
        print("Json file not found.")
    except json.JSONDecodeError:
        print("Error in opening json.")


def extract_cfg_from_assembly(json_data):
    functions_blocks = identify_basic_blocks(json_data)
    asm_files = {func["function_name"]: func["source_file"] for func in json_data if "source_file" in func}

    return construct_cfg(functions_blocks, asm_files)


def assign_new_stack_space(block_variable_map_all):
    for function_name, blocks in block_variable_map_all.items():
        print(f"Analyzing function: {function_name}")
        for block_id, vars_in_block in blocks.items():
            for var, write_count in vars_in_block.items():
                if write_count > 2:
                    print(f"  Allocating new stack space for variable {var} in Block {block_id} (Writes: {write_count})")
        print("-" * 40)

def main():
    json_file = input("Enter JSON file path: ")
    output_file = input("Enter output JSON file path: ")
    json_data = read_json(json_file)
    functions_blocks = identify_basic_blocks(json_data)
    frequent_vars_by_function = identify_frequent_variables(json_data, functions_blocks)
    block_variable_map_all = map_variables_to_blocks(json_data, functions_blocks, frequent_vars_by_function)
    # assign_new_stack_space(block_variable_map_all)
    
    variable_blocks = assign_variables_to_blocks(json_file, output_file)
    for function_name, variables in variable_blocks.items():
        print(f"function_name: {function_name}")
        for var_name, blocks in variables.items():
            print(f"variable: {var_name} -> blocks: {blocks}")
        print("-" * 40)
    cfg = extract_cfg_from_assembly(json_data)
    
    with open(output_file, "w", encoding="utf-8") as f:
        json.dump(cfg, f, indent=4)
    
    print(f"CFG saved to {output_file}")

if __name__ == "__main__":
    main()
