import json
import numpy as np

num_of_set = 128 
num_of_columns = 16
blk_size = 64

def process_json_file(file_path, output_file):
    try:
        with open(file_path, 'r') as file:
            data = json.load(file)
        
        
        asm_lines = []
        asm_file_path = ""
        
        function_usage_arrays = {}
        usage_matrix = np.zeros((num_of_set, num_of_columns), dtype=int)
        
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
                for variable in function.get('variables', []):
                    variable_name = variable['name']
                    variable_size = variable['size']
                    write_count = len(variable['lines']['write'])
                    used_lines = variable['lines']['write'] + variable['lines']['read']
                    if variable_size == 8:
                        if current_index + 1 < local_addr_size:
                            local_addr[current_index] = (variable_name, write_count, used_lines, variable_size)
                            local_addr[current_index + 1] = "depend"
                            current_index += 2
                    elif 0 <= variable_size <= 4:
                        if current_index < local_addr_size:
                            local_addr[current_index] = (variable_name, write_count, used_lines, variable_size)
                            current_index += 1
                
                # 1 part
                for i in range(4, len(usage_array) - 2):
                    if local_addr[i] == "depend" or local_addr[i+1] == "depend":
                        continue
                    for j in range(i + 1, len(usage_array)-2, 1):
                        if local_addr[j] == "depend" or local_addr[j+1] == "depend":
                            continue

                        write_count_i = local_addr[i][1] if local_addr[i][0] is not None else 0
                        write_count_i1 = local_addr[j][1] if local_addr[j][0] is not None else 0
                        
                        sum_case_1 = write_count_i + usage_array[i]
                        sum_case_2 = write_count_i + usage_array[j]
                        sum_case_3 = write_count_i1 + usage_array[i]
                        sum_case_4 = write_count_i1 + usage_array[j]
                        
                        max_value1 = max(sum_case_1, sum_case_4)
                        max_value2 = max(sum_case_2, sum_case_3)
                        
                        if max_value1 < max_value2:
                            continue  
                        elif max_value1 > max_value2:
                            local_addr[i], local_addr[j] = local_addr[j], local_addr[i]
                
                # 2 part
                for i in range(4, len(usage_array) - 2):
                    if local_addr[i] == "depend" or local_addr[i+2] == "depend" :
                        continue
                    for j in range(i + 1, len(usage_array)-2, 1):
                        if local_addr[j] == "depend" or local_addr[j+2] == "depend":
                            continue
                        
                        # print(f"{local_addr[i+1][0]}, {local_addr[j+1][0]}")
                        write_count_i = (local_addr[i][1] if local_addr[i][0] is not None else 0) + (local_addr[i+1][1] if local_addr[i+1][0] is not None and local_addr[i+1][0] != "d" else 0)
                        write_count_i1 = (local_addr[j][1] if local_addr[j][0] is not None else 0) + (local_addr[j+1][1] if local_addr[j+1][0] is not None and local_addr[j+1][0] != "d" else 0)
                        
                        sum_case_1 = write_count_i + usage_array[i] + usage_array[i+1]
                        sum_case_2 = write_count_i + usage_array[j] + usage_array[j+1]
                        sum_case_3 = write_count_i1 + usage_array[i] + usage_array[i+1]
                        sum_case_4 = write_count_i1 + usage_array[j] + usage_array[j+1]
                        
                        max_value1 = max(sum_case_1, sum_case_4)
                        max_value2 = max(sum_case_2, sum_case_3)
                        
                        if max_value1 < max_value2:
                            # print(f"if max_value1:{max_value1}, max_value2:{max_value2}")
                            continue  
                        elif max_value1 > max_value2:
                            # print(f"elif max_value1:{max_value1}, max_value2:{max_value2}")
                            local_addr[i], local_addr[i+1], local_addr[j], local_addr[j+1] = local_addr[j], local_addr[j+1], local_addr[i], local_addr[i+1]

                for index in range(len(local_addr)):
                    local_variable = local_addr[index]
                    if local_variable != "depend" and local_variable[0] is not None:
                        for line_p in local_variable[2]:
                            line = line_p - 1
                            offset_from_rbp = -((index-3) * 4) - (4 if local_variable[3] == 8 else 0)
                            target_address = f"{offset_from_rbp}(%rbp)"
                            print(f"pre: {asm_lines[line]}, target address = {target_address}, line:{line+1}, on file:{assembly_file}")
                            line_arry = asm_lines[line].split(' ')
                            for part in range(len(line_arry)):
                                if 'rbp' in line_arry[part]:
                                    if ',' in line_arry[part]:
                                        line_arry[part] = target_address + ','
                                    else:
                                        line_arry[part] = target_address
                            
                            asm_lines[line] = (' '.join(line_arry)) + "\t\t#this_line_update!"
                            print(f"==> {asm_lines[line]}")
                
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
