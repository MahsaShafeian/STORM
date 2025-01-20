import json
import numpy as np
import random

num_of_set = 128 
num_of_columns = 16
blk_size = 64

def generate_write_list(variable_list, usage_array):

    write_list = []
    for variable in variable_list:
        _, size, write_count = variable
        repeat_count = size // 4 
        write_list.extend([write_count] * repeat_count)
    
    if len(usage_array) != len(write_list):
        raise ValueError("usage_array and write_list must have the same length.")
    
    write_array = np.array(write_list)
    
    combined_array = usage_array + write_array
    
    max_value = np.max(combined_array)

    # print(f"Combined Array: {combined_array}")
    # print(f"Maximum Value: {max_value}")

    return combined_array, max_value

def alternating_crossover(parent1, parent2):
    child = []
    used_genes = set()
    for i in range(len(parent1)):
        if i % 2 == 0:  
            if parent1[i] not in used_genes:
                child.append(parent1[i])
                used_genes.add(parent1[i])
        else:  
            if parent2[i] not in used_genes:
                child.append(parent2[i])
                used_genes.add(parent2[i])
    print(f"parent1:{parent1}, parent2:{parent2}")
    print(f"child:{child}")
    return child

def merge_parents(parents):
    for i in range(10):
        parent1 = parents[i]
        parent2 = parents[(i + 1) % 10]
        # print(f"parent1:{parent1}, parent2:{parent2}")
        child = alternating_crossover(parent1, parent2)
        parents.append(child)
    return parents

def genetic_algorithm(variable_count,variable_list):
    # parents = []
    # for i in range(10):
    #     c1 = []
    #     while len(c1) < variable_count:
    #         random_number = random.randint(0, variable_count-1)
    #         if random_number in c1:
    #             continue
    #         c1.append(random_number)
    #     p1 = []
    #     for i in c1:
    #         p1.append(variable_list[i])
        
    #     parents.append(p1)
    # merge_parents(parents)
    
    return variable_list
    
def find_tree(local_list, variable_list, index):
    if len(variable_list) > 0:
        check_list = {}
        for i in range(len(variable_list)):
            key = str(variable_list[i][1]) + str(variable_list[i][2])
            if key in check_list:
                continue
            else:
                check_list[key] = 1
            variable_list2 = variable_list[:]
            local_list2 = local_list[:]
            var_t = variable_list2.pop(i)
            local_list2.append(var_t)
            find_tree(local_list2, variable_list2, 0)
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
                local_addr = [(None, 0) for _ in range(local_addr_size)]  # (variable_name, write_count, used_lines, variable_size)
                usage_array = np.zeros(local_addr_size, dtype=int)  
                
                for i in range(len(usage_array)):
                    usage_array[i] = usage_matrix[(label + (i // 16)) % num_of_set, i % 16]
                
                current_index = 4 
                variable_list = []  # List to store variable tuples (name, size, write_count)
                for variable in function.get('variables', []):
                    variable_name = variable['name']
                    variable_size = variable['size']
                    total_variable_size = function.get('total_variable_size')
                    write_count = len(variable['lines']['write'])
                    used_lines = variable['lines']['write'] + variable['lines']['read']
                    # variable_count = len(function.get('variables', []))
                    
                    variable_list.append((variable_name, write_count,used_lines, variable_size))
                    
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
                    variable_list.append((f"emptyV{i}", 4, 0))
                
                variable_details[function_name] = variable_list
                
                
                temp_list = {}
                for _v in variable_list:
                    key = str(_v[1]) + str(_v[2])
                    if key in temp_list:
                        temp_list[key] += 1
                        continue
                    else:
                        temp_list[key] = 1
                variable_count = len(variable_list)
                # combined_array, max_value = generate_write_list(variable_list, usage_array)
                if variable_count < 4 :
                    find_tree([], variable_list, 0)
                else:
                    locatins = genetic_algorithm(variable_count,variable_list)

                
                # find_tree([], variable_list, 0)
                
                
                
                for index in range(len(locatins)):
                    local_variable = locatins[index]
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
                
                for i in range(len(locatins)):
                    if locatins[i][0] is not None:
                        if locatins[i] == "depend":
                            usage_matrix[(label + (i // 16)) % num_of_set, i % 16] += locatins[i-1][1]
                            # print(f"usage_matrix[{(label + (i // 16)) % num_of_set}, {i % 16}] += {local_addr[i-1][1]}")
                        else:
                            usage_matrix[(label + (i // 16)) % num_of_set, i % 16] += locatins[i][1]
                            # print(f"usage_matrix[{(label + (i // 16)) % num_of_set}, {i % 16}] += {local_addr[i][1]}")
                    # else:
                        # print("none!")
                            
                function_usage_arrays[function_name] = local_addr
            with open(assembly_file[:-2]+"_final.s", 'w') as out_file:
                out_file.write(('\n'.join(asm_lines).replace(' ', '\t')) + '\n')
                
        with open(output_file, 'w') as out_file:
            for row in usage_matrix:
                out_file.write('\t'.join(map(str, row)) + '\n')
            for function_name, locatins in function_usage_arrays.items():
                out_file.write(f"{function_name}:\t" + '\t'.join([f"({x[0]}, {x[1]})" for x in locatins]) + '\n')
                
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