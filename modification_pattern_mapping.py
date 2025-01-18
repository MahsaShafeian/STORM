import json
import numpy as np

num_of_set = 128 
num_of_columns = 16
blk_size = 64

def find_tree(local_list,variable_list):
    if len(variable_list) > 0:
        for i in range(len(variable_list)):
            variable_list2 = variable_list[:]
            local_list2 = local_list[:]
            var_t = variable_list2.pop(i)
            local_list2.append(var_t)
            find_tree(local_list2, variable_list2)
    else:
        # print(f"local list:{local_list}, variable list: {variable_list}")
        return

def process_json_file(file_path, output_file):
    try:
        with open(file_path, 'r') as file:
            data = json.load(file)
        
        
        asm_lines = []
        asm_file_path = ""
        
        function_usage_arrays = {}
        usage_matrix = np.zeros((num_of_set, num_of_columns), dtype=int)
        variable_details = {} 
        for function in data:
            function_name = function['function_name']
            label = function['label']
            assembly_file = function.get('source_file')
            stack_size = function.get('stack_size', 64)
            
            if not assembly_file:
                print(f"Assembly files not specified for function {function_name}. Skipping.")
                continue
            
            if asm_file_path != assembly_file:
                try:
                    with open(assembly_file, 'r') as asm_file:
                        asm_lines = asm_file.readlines()
                        asm_file_path = assembly_file
                    
                    asm_lines = [line.replace('\n', '').replace('\t', ' ') for line in asm_lines]
                except FileNotFoundError:
                    print(f"Assembly file '{assembly_file}' not found for function {function_name}. Skipping.")
                    continue
            
            if 0 <= label < num_of_set:
                local_addr_size = abs(stack_size // 4)
                local_addr = [(None, 0) for _ in range(local_addr_size)]  # (variable_name, write_count)
                usage_array = np.zeros(local_addr_size, dtype=int)  
                
                for i in range(len(usage_array)):
                    usage_array[i] = usage_matrix[(label + (i // 16)) % num_of_set, i % 16]
                
                current_index = 4 
                variable_list = []  # List to store variable tuples (name, size)
                for variable in function.get('variables', []):
                    variable_name = variable['name']
                    variable_size = variable['size']
                    total_variable_size = function.get('total_variable_size')
                    write_count = len(variable['lines']['write'])
                    used_lines = variable['lines']['write'] + variable['lines']['read']
                    
                    variable_list.append((variable_name, variable_size))
                    
                    if variable_size == 8:
                        if current_index + 1 < local_addr_size:
                            local_addr[current_index] = (variable_name, write_count, used_lines, variable_size)
                            local_addr[current_index + 1] = "depend"
                            current_index += 2
                    elif 0 <= variable_size <= 4:
                        if current_index < local_addr_size:
                            local_addr[current_index] = (variable_name, write_count, used_lines, variable_size)
                            current_index += 1
                variable_details[function_name] = variable_list
                
                # Calculate A and number of empty locations
                A = stack_size - total_variable_size
                empty_locations = A // 4
                
                # Add empty locations to the variable list
                for i in range(empty_locations):
                    variable_list.append((f"emptyV{i}", 4))
                
                variable_details[function_name] = variable_list
                
                find_tree([], variable_list)
                
                for index in range(len(local_addr)):
                    local_variable = local_addr[index]
                    if local_variable != "depend" and local_variable[0] is not None:
                        for line_p in local_variable[2]:
                            line = line_p - 1
                            offset_from_rbp = -((index-3) * 4) - (4 if local_variable[3] == 8 else 0)
                            target_address = f"{offset_from_rbp}(%rbp)"
                            # print(f"pre: {asm_lines[line]}, target address = {target_address}, line:{line+1}, on file:{assembly_file}")
                            line_arry = asm_lines[line].split(' ')
                            for part in range(len(line_arry)):
                                if 'rbp' in line_arry[part]:
                                    if ',' in line_arry[part]:
                                        line_arry[part] = target_address + ','
                                    else:
                                        line_arry[part] = target_address
                            
                            asm_lines[line] = (' '.join(line_arry)) + "\t\t#this_line_update!"
                            # print(f"==> {asm_lines[line]}")
                
                for i in range(len(local_addr)):
                    if local_addr[i][0] is not None:
                        if local_addr[i] == "depend":
                            usage_matrix[(label + (i // 16)) % num_of_set, i % 16] += local_addr[i-1][1]
                            # print(f"usage_matrix[{(label + (i // 16)) % num_of_set}, {i % 16}] += {local_addr[i-1][1]}")
                        else:
                            usage_matrix[(label + (i // 16)) % num_of_set, i % 16] += local_addr[i][1]
                            # print(f"usage_matrix[{(label + (i // 16)) % num_of_set}, {i % 16}] += {local_addr[i][1]}")
                    # else:
                        # print("none!")
                            
                function_usage_arrays[function_name] = local_addr
            with open(assembly_file[:-2]+"_final.s", 'w') as out_file:
                out_file.write(('\n'.join(asm_lines).replace(' ', '\t')) + '\n')
                
        with open(output_file, 'w') as out_file:
            for row in usage_matrix:
                out_file.write('\t'.join(map(str, row)) + '\n')
            for function_name, local_addr in function_usage_arrays.items():
                out_file.write(f"{function_name}:\t" + '\t'.join([f"({x[0]}, {x[1]})" for x in local_addr]) + '\n')
                
            out_file.write("\nVariable Details:\n")
            for function_name, variables in variable_details.items():
                out_file.write(f"{function_name}: {variables}\n")


    except FileNotFoundError:
        print(f"The file '{file_path}' was not found.")
    except json.JSONDecodeError:
        print("Error decoding JSON. Please check the file format.")
        
def main():
    json_file_path = input("profiling json file:")
    output_file_path = input("log file:")
    # assembly_file_path = input("input assembly file:")
    # modified_assembly_file_path = input("output assembly file:")
    
    process_json_file(json_file_path, output_file_path)

if __name__ == "__main__":
    main()