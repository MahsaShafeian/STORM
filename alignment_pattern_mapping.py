import math
import re

def modify_assembly_file(input_path, output_path):
    modified_lines = []
    inside_function = False
    has_stack_operation = False
    function_lines = []
    local_offsets = []  

    try:
        with open(input_path, 'r') as f:
            lines = f.readlines()

        for i, line in enumerate(lines):
            if '.cfi_startproc' in line: 
                inside_function = True
                has_stack_operation = False
                function_lines = []
                local_offsets = []

            if inside_function:
                function_lines.append(line)

                if ('subq' in line or 'addq' in line) and '%rsp' in line:
                    has_stack_operation = True

                if '(' in line and '%rbp' in line:
                    match = re.search(r'(-?\d+)\(%rbp\)', line)
                    if match:
                        try:
                            offset = int(match.group(1))  
                            local_offsets.append(offset)
                        except ValueError:
                            pass
            
            if '.cfi_endproc' in line and inside_function:
                inside_function = False
                
                if not modified_lines or '.cfi_endproc' not in modified_lines[-1:]:
                    function_lines.append(line)

                max_offset = -min(local_offsets, default=0) 
                stack_adjustment = max_offset if max_offset > 0 else 48  
                
                for func_line in function_lines:
                    modified_lines.append(func_line)
                    if '.cfi_def_cfa_register' in func_line and not has_stack_operation:
                        modified_lines.append(f"    subq    ${stack_adjustment}, %rsp\n")

                function_lines = []

            if not inside_function:
                modified_lines.append(line)

        cleaned_lines = []
        for line in modified_lines:
            if line.strip() == '.cfi_endproc' and (cleaned_lines and cleaned_lines[-1].strip() == '.cfi_endproc'):
                continue
            cleaned_lines.append(line)
        modified_lines = cleaned_lines

        with open(output_path, 'w') as output_file:
            output_file.writelines(modified_lines)

    except FileNotFoundError:
        print(f"Error: The file {input_path} does not exist.")
    except IOError:
        print("Error: An error occurred while reading or writing to the file.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

def detect_stack_operations_in_functions(input_path, output_path):
    current_function = None
    inside_function = False
    stack_balance = 0
    final_value = 0
    last_subq_index = -1
    last_subq_value = 0
    last_addq_index = -1
    last_addq_value = 0
    modified_lines = []

    try:
        with open(input_path, 'r') as f:
            lines = f.readlines()
            modified_lines = lines[:]

            for i, line in enumerate(lines):
                clean_line = line.strip()

                if '.cfi_startproc' in clean_line:
                    function_name_line = lines[i - 2].strip() if i >= 2 else ""
                    if function_name_line and not function_name_line.startswith('.') and function_name_line.endswith(':'):
                        current_function = function_name_line[:-1]  
                        print(f"\nProcessing Function: {current_function}")
                    inside_function = True
                    stack_balance = 0  
                    last_subq_index = -1
                    last_subq_value = 0
                    last_addq_index = -1
                    last_addq_value = 0
                
                elif '.cfi_endproc' in clean_line and inside_function:
                    inside_function = False

                    stack_balance += 16
                    
                    final_value = 64 * math.ceil(stack_balance / 64) if stack_balance > 0 else 0
                    adjustment_value = final_value - stack_balance

                    print(f"  Adjusted Stack Balance (after adding 16): {stack_balance}")
                    print(f"  Final Adjusted Value (aligned to 64): {final_value}")
                    print(f"  Adjustment Value to add to last subq: {adjustment_value}")

                    if last_subq_index != -1:
                        new_subq_value = last_subq_value + adjustment_value
                        modified_lines[last_subq_index] = f"    subq    ${new_subq_value}, %rsp\n"
                        print(f"  Updated last subq to: subq ${new_subq_value}, %rsp")
                    if last_addq_index != -1:
                        new_addq_value = last_addq_value - adjustment_value
                        modified_lines[last_addq_index] = f"    addq    ${new_addq_value}, %rsp\n"
                        print(f"  Updated last addq to: addq ${new_addq_value}, %rsp")
                    
                    current_function = None
                
                elif inside_function and current_function and ('subq' in clean_line or 'addq' in clean_line) and '%rsp' in clean_line:
                    operation, value = clean_line.split()[0], int(clean_line.split('$')[1].split(',')[0])
                    if operation == "subq":
                        stack_balance += value
                        last_subq_index = i 
                        last_subq_value = value 
                    elif operation == "addq":
                        stack_balance -= value
                        last_addq_index = i 
                        last_addq_value = value
                    print(f"    Stack operation: {clean_line} (Updated Balance: {stack_balance})")

        with open(output_path, 'w') as output_file:
            output_file.writelines(modified_lines)

    except FileNotFoundError:
        print(f"Error: The file {input_path} does not exist.")
    except IOError:
        print("Error: An error occurred while reading the file.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

def replace_popq_with_leave(input_path, output_path):
    """
    Replace all occurrences of 'popq %rbp' with 'leave' in the input assembly file.
    Save the modified content to the output file.
    """
    try:
        with open(input_path, 'r') as f:
            lines = f.readlines()

        modified_lines = []
        for line in lines:
            if "add" in line and "rsp" in line:
                continue 
            if "pop" in line and "%rbp" in line:
                print(f"Replacing: {line.strip()} -> leave")
                modified_lines.append("    leave\n")
            else:
                modified_lines.append(line)

        with open(output_path, 'w') as f:
            f.writelines(modified_lines)

        print(f"Replacement completed. Modified file saved to: {output_path}")

    except FileNotFoundError:
        print(f"Error: The file {input_path} does not exist.")
    except IOError:
        print("Error: An error occurred while reading or writing to the file.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        
# def detect_stack_modifying_loops(input_path):
#     """
#     Detect loops in an assembly file that modify the stack size.
#     """
#     try:
#         with open(input_path, 'r') as f:
#             lines = f.readlines()

#         labels = {}
#         loops = []

#         # شناسایی تمام لیبل‌ها و موقعیت‌هایشان
#         for i, line in enumerate(lines):
#             match = re.match(r'^(\.L\w+):', line.strip())
#             if match:
#                 label = match.group(1)
#                 labels[label] = i

#         # بررسی دستورهای پرش برای پیدا کردن لوپ
#         for i, line in enumerate(lines):
#             clean_line = line.strip()
#             if any(jmp in clean_line for jmp in ["jmp", "jne", "je", "jg", "jl", "loop"]):
#                 match = re.search(r'(\.L\w+)', clean_line)
#                 if match:
#                     target_label = match.group(1)
#                     if target_label in labels and labels[target_label] < i:
#                         # بررسی دستورات بین لیبل هدف و دستور پرش
#                         start_line = labels[target_label]
#                         loop_instructions = lines[start_line:i]
#                         stack_modifying = any(
#                             re.search(r'\b(subq|addq)\s+\$[-+]?\d+,\s*%rsp', instr.strip())
#                             for instr in loop_instructions
#                         )
#                         if stack_modifying:
#                             loops.append((i, target_label, start_line))

#         # چاپ لوپ‌ها
#         for loop in loops:
#             jump_line, target_label, target_line = loop
#             print(f"Stack-modifying loop detected: Jump at line {jump_line + 1} to label {target_label} (line {target_line + 1})")

#     except FileNotFoundError:
#         print(f"Error: The file {input_path} does not exist.")
#     except Exception as e:
#         print(f"An unexpected error occurred: {e}")

def remove_stack_modifying_loop(input_path, output_path):
    """
    Detect and remove stack-modifying loops, replacing them with equivalent instructions
    directly at the location of the removed loop. The stack size is computed based on the
    last access to %rbp, and if any other stack modifications exist, `orq $0, (%rsp)` is added
    exactly where the previous stack modification was done.
    """
    try:
        with open(input_path, 'r') as f:
            lines = f.readlines()

        labels = {}
        modified_lines = lines[:]
        changes_made = False

        for i, line in enumerate(lines):
            match = re.match(r'^(\.L\w+):', line.strip())
            if match:
                label = match.group(1)
                labels[label] = i

        stack_modifying_found = False 
        insertion_point = None 

        for i, line in enumerate(lines):
            clean_line = line.strip()

            if any(jmp in clean_line for jmp in ["jmp", "jne", "je", "jg", "jl", "loop"]):
                match = re.search(r'(\.L\w+)', clean_line)
                if match:
                    target_label = match.group(1)
                    if target_label in labels and labels[target_label] < i:
                        start_line = labels[target_label]
                        loop_instructions = lines[start_line:i]

                        stack_modifying = any(
                            re.search(r'\b(subq|addq)\s+\$[-+]?\d+,\s*%rsp', instr.strip())
                            for instr in loop_instructions
                        )
                        if stack_modifying:
                            stack_modifying_found = True  

                            last_rbp_access = None
                            rbp_offsets = []
                            for j in range(len(lines)):
                                match = re.search(r'(-\d+)\(%rbp\)', lines[j])
                                if match:
                                    try:
                                        offset = int(match.group(1))
                                        rbp_offsets.append(offset)
                                    except ValueError:
                                        continue

                            if rbp_offsets:
                                stack_size = -min(rbp_offsets) 
                            else:
                                stack_size = 0  

                            for j in range(start_line, i + 1):
                                modified_lines[j] = ''

                            new_instructions = [
                                f"    subq    ${stack_size}, %rsp\n"
                            ]
                            modified_lines.insert(start_line, ''.join(new_instructions))
                            insertion_point = start_line + len(new_instructions) 
                            changes_made = True
                            print(f"Loop removed and replaced with stack adjustment at line {start_line + 1} with stack size: {stack_size}")

        if stack_modifying_found and insertion_point is not None:
            modified_lines.insert(insertion_point, "    orq     $0, (%rsp)\n")
            print(f"Added 'orq $0, (%rsp)' after stack adjustment at line {insertion_point + 1}")

        if changes_made:
            with open(output_path, 'w') as f:
                f.writelines(modified_lines)
            print(f"Modifications saved to: {output_path}")
        else:
            print("No stack-modifying loops found.")

    except FileNotFoundError:
        print(f"Error: The file {input_path} does not exist.")
    except Exception as e:
        print(f"An unexpected error occurred: {e}")

def main():
    # input_path = "/home/mahsa/Documents/MiBench_project/susan/susan.s"
    # output_path = "/home/mahsa/Documents/MiBench_project/susan/susan_alignment.s"
    # input_path = "/home/mahsa/Documents/MiBench_project/qsort/qsort_small.s"
    # output_path = "/home/mahsa/Documents/MiBench_project/qsort/qsort_small_alignment.s"
    
    # file_paths = []
    # file_number = int(input("Number of files to process: "))
    input_path = input(f"Enter path for file: ")
    output_path = input("Enter output assembly file path: ")

    replace_popq_with_leave(input_path, output_path)
    remove_stack_modifying_loop(output_path, output_path)
    modify_assembly_file(output_path, output_path)
    detect_stack_operations_in_functions(output_path, output_path)

if __name__ == "__main__":
    main()
