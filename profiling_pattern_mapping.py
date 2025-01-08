import re
import logging
import json

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

blk_size = 64
num_of_set = 128

class AssemblyParser:
    """Class to parse and analyze assembly files, extracting instructions, stack frames, and program flow."""

    def __init__(self):
        self.instructions = []
        self.functions = {}
        self.stack_frames = {}
        self.function_calls = {}
        self.call_labels = {}
        self.stack_access = {}
        self.function_files = {}  # Mapping of functions to their source files
        self.function_call_counts = {}  # Count of how many times each function is called
        self.loops = {}
        self.function_lines = {}  # Store line numbers for each function
        self.jump_in_loop_labels = {}


    def read_files(self, file_paths):
        """Reads multiple assembly files and returns all lines with their source filenames and line numbers."""
        all_lines_with_files = []
        for file_path in file_paths:
            try:
                with open(file_path, 'r') as asm_file:
                    lines = asm_file.readlines()
                    all_lines_with_files.extend(((line, file_path, line_number) for line_number, line in enumerate(lines, start=1)))
            except FileNotFoundError:
                logging.error(f"File {file_path} not found.")
                raise
            except Exception as e:
                logging.error(f"An error occurred while reading the file {file_path}: {str(e)}")
                raise
        return all_lines_with_files

    def clean_line(self, line):
        """Cleans a line by removing comments and unnecessary whitespace."""
        line = re.sub(r';.*$', '', line)
        return line.strip()

    def get_operand_size(self, operand, opcode):
        """Determine the size of an operand based on the opcode and operand type."""
        if operand.startswith('$'):  # Immediate value
            if opcode.endswith('b'):  # Byte-sized instruction
                return 1
            elif opcode.endswith('w'):  # Word-sized instruction (16-bit)
                return 2
            elif opcode.endswith('l'):  # Double-word-sized instruction (32-bit)
                return 4
            elif opcode.endswith('q'):  # Quad-word-sized instruction (64-bit)
                return 8
        elif re.match(r'-?\d+\(%(rbp|rsp)\)', operand):  # Stack offset
            if opcode.endswith('b'):
                return 1
            elif opcode.endswith('w'):
                return 2
            elif opcode.endswith('l'):
                return 4
            elif opcode.endswith('q'):
                return 8
        return 0  # Default for unknown cases

    def parse_instruction(self, line):
        """Parses a single line of assembly code into a structured format."""
        parts = re.split(r'\s+', line, 1)
        if len(parts) == 2:
            opcode, operands = parts
            operands = [op.strip() for op in operands.split(',')]
            operand_sizes = [self.get_operand_size(op, opcode) for op in operands]
            return (opcode, operands, operand_sizes)
        return None
    
    def analyze_loops_in_function(self, function_name, function_lines, loop_labels, all_lines_with_files):
        """Analyze loops within a single function."""
        loops = []
        for line, file_name, line_number in function_lines:
            clean_line = self.clean_line(line)
            if clean_line:
                instruction = self.parse_instruction(clean_line)
                if instruction:
                    opcode, operands, _ = instruction

                    if opcode.startswith('j') and ("jmp" not in opcode and "je" not in opcode) and operands:
                        target_label = operands[0]
                        
                        if target_label in loop_labels:
                            initial_value = None
                            step_value = None
                            iterations = None
                            final_value = None
                            # print(f"function_name:{function_name},target_label:{target_label}")

                            function_start_line = self.function_lines[function_name][0]
                            function_instructions_with_lines = [
                                (all_lines_with_files[i - 1][0], all_lines_with_files[i - 1][2]) 
                                for i in self.function_lines[function_name] if function_start_line <= i < line_number
                            ]

                            for prev_line, prev_line_number in reversed(function_instructions_with_lines):
                                clean_prev_line = self.clean_line(prev_line)
                                
                                if "movl" in clean_prev_line or "addl" in clean_prev_line or "subl" in clean_prev_line:
                                      if "movl" in clean_prev_line:
                                          if prev_line_number > function_start_line:
                                            next_line_data = next((ln_data for ln_data in function_instructions_with_lines if ln_data[1] == prev_line_number+1), None)
                                            if next_line_data:
                                               next_line = self.clean_line(next_line_data[0])
                                               next_instruction = self.parse_instruction(next_line)
                                               if (next_instruction and next_instruction[0]=='jmp') :
                                                  pass
                                               else:
                                                  continue
        
                                      prev_instruction = self.parse_instruction(clean_prev_line)
                                      if prev_instruction:
                                          op, ops, _ = prev_instruction
                                          if "movl" in op and initial_value is None:
                                              initial_value = int(ops[0][1:]) if ops[0].startswith('$') else None
                                            #   print(f"function_name:{function_name},prev_instruction:{prev_instruction}")
                                          elif ("addl" in op or "subl" in op) and step_value is None:
                                              step_value = int(ops[0][1:]) if ops[0].startswith('$') else None
                                            #   print(f"function_name:{function_name},prev_instruction:{prev_instruction}")

                                if initial_value and step_value:
                                    break
                            

                            for prev_line, _ in reversed(function_instructions_with_lines):
                                clean_prev_line = self.clean_line(prev_line)
                                if "cmp" in clean_prev_line:
                                    prev_instruction = self.parse_instruction(clean_prev_line)
                                    if prev_instruction:
                                        _, ops, _ = prev_instruction
                                        if len(ops) > 0 and ops[0].startswith('$'):
                                            try:
                                                final_value = int(ops[0][1:])
                                            except ValueError:
                                                logging.warning(f"Invalid final value conversion in cmp: {ops[0]}")
                                            break
                                

                            if initial_value is not None and step_value is not None and final_value is not None:
                                iterations = ((final_value - initial_value) // step_value) + 1
                                
                            

                            loops.append({
                                "loop_label": target_label,
                                "start_line": loop_labels[target_label],
                                "end_line": line_number,
                                "initial_value": initial_value,
                                "step_value": step_value,
                                "final_value": final_value,
                                "iterations": iterations
                            })

        return loops


    def parse_lines(self, lines_with_files):
        """Parses the lines of the assembly files to extract instructions, functions, and stack frame sizes."""
        current_function = None
        recording_function = False
        stack_size = 0
        loop_labels = {}

        for line, file_name, line_number in lines_with_files:
            clean_line = self.clean_line(line)
            if clean_line:
                if not clean_line.startswith('.') and clean_line.endswith(':') and not recording_function:
                    current_function = clean_line[:-1]
                if clean_line.startswith('.') and clean_line.endswith(':'):
                    label = clean_line[:-1]
                    loop_labels[label] = line_number
                    

                elif '.cfi_startproc' in clean_line and current_function:
                    recording_function = True
                    self.functions[current_function] = []
                    self.function_calls[current_function] = []
                    self.function_call_counts[current_function] = 0
                    self.stack_access[current_function] = {}
                    self.function_files[current_function] = file_name
                    self.function_lines[current_function] = [line_number]
                    stack_size = 0
                    self.loops[current_function] = []

                elif '.cfi_endproc' in clean_line and recording_function:
                    recording_function = False
                    stack_size += 16 if stack_size > 0 else -16
                    self.stack_frames[current_function] = stack_size

                    # Analyze loops for the current function
                    function_lines = [line for line in lines_with_files if line[1] == file_name and line[2] in self.function_lines[current_function]]
                    # print(f"current_function:{current_function},function_lines:{function_lines}")
                    self.loops[current_function] = self.analyze_loops_in_function(current_function, function_lines, loop_labels, lines_with_files)

                    current_function = None

                elif recording_function:
                    instruction = self.parse_instruction(clean_line)
                    if instruction and current_function:
                        self.functions[current_function].append(instruction)
                        self.function_lines[current_function].append(line_number)

                        stack_size += self.get_stack_size_change(instruction)
                        self.check_stack_access(instruction, current_function, line_number)

    def get_stack_size_change(self, instruction):
        """Calculate the change in stack size based on stack manipulation instructions."""
        opcode, operands, _ = instruction
        if opcode in ('subq', 'addq') and operands[0].startswith('$') and operands[1] in ('%rsp', '%esp'):
            try:
                size_change = int(operands[0][1:])
                return size_change if opcode == 'subq' else -size_change
            except ValueError:
                logging.warning(f"Unable to parse stack size change for instruction: {instruction}")
        return 0

    def check_stack_access(self, instruction, current_function, line_number):
        """Check if an instruction writes to or reads from the stack."""
        opcode, operands, operand_sizes = instruction

        if len(operands) > 1:
            for i, op in enumerate(operands):
                if not isinstance(op, str):
                    logging.warning(f"Operand is not a valid string: {op}")
                    continue
                print(f"Operands at line {line_number}: {operands}")
                match = re.match(r'(-?\d+)?\((%[a-z]+)(?:,([a-z%]+),(\d+))?\)', op)
                if match:
                    address = match.group(1)
                    action = 'write' if i == 1 and opcode.startswith('mov') else 'read'
                    size = operand_sizes[i]
                    if address not in self.stack_access[current_function]:
                        self.stack_access[current_function][address] = {
                            "lines": {"read": [], "write": []},
                            "size": size
                        }
                    self.stack_access[current_function][address]["lines"][action].append(line_number)

    def assign_labels(self, start, func_name):
        """Assign a label to each function based on its stack size and position."""
        label = (start // blk_size) % num_of_set
        self.call_labels[func_name] = label
        for f in self.function_calls[func_name]:
            self.assign_labels(start + self.stack_frames[func_name], f)

    def calculate_variable_distances(self):
        """Calculate distances between each variable and the closest lower variable."""
        for func_name, variables in self.stack_access.items():
            sorted_addresses = sorted(variables.keys(), key=lambda x: int(re.search(r'-\d+', x).group()))
            for i, address in enumerate(sorted_addresses):
                if i + 1 < len(sorted_addresses):
                    current_offset = int(re.search(r'-\d+', address).group())
                    next_offset = int(re.search(r'-\d+', sorted_addresses[i + 1]).group())
                    distance = abs(current_offset - next_offset)
                    self.stack_access[func_name][address]["size"] = distance

    def get_json_data(self):
        """Organize the data in JSON format with stack read/write access."""
        json_data = []
        for func_name in self.functions:
            formatted_variables = [
                {
                    "name": address,
                    "lines": details["lines"],
                    "size": details["size"]
                }
                for address, details in self.stack_access.get(func_name, {}).items()
            ]
            json_data.append({
                "function_name": func_name,
                "source_file": self.function_files.get(func_name, ""),
                "label": self.call_labels.get(func_name, 0),
                "stack_size": self.stack_frames.get(func_name, ""),
                "call_count": self.function_call_counts.get(func_name, 0),
                "variables": formatted_variables,
                "loops": self.loops.get(func_name, []),
                #  "jump_in_loop_labels": self.jump_in_loop_labels.get(func_name, [])
            })
        return json_data

    def save_to_json(self, output_file):
        """Save the organized data to a JSON file."""
        with open(output_file, 'w') as f:
            json.dump(self.get_json_data(), f, indent=4)


def main():
    """Main function to execute the assembly parser."""
    file_paths = []
    file_number = int(input("Number of files to process: "))
    for i in range(file_number):
        file_path = input(f"Enter path for file {i + 1}: ")
        file_paths.append(file_path)

    output_file = input("Enter output JSON file path: ")

    parser = AssemblyParser()
    try:
        lines_with_files = parser.read_files(file_paths)
        parser.parse_lines(lines_with_files)
        parser.assign_labels(0, 'main')
        parser.calculate_variable_distances()
        parser.save_to_json(output_file)
    except Exception as e:
        logging.error(f"Error during processing: {e}")

if __name__ == '__main__':
    main()
