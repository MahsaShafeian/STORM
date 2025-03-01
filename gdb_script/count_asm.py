import gdb
import re
import os
import json


class AsmCounter(gdb.Command):
    """Counts execution of assembly instructions and shows source line numbers."""
    
    def add_write_count_to_variable(self, function_name, variable_name, write_count):
        for function in self.json_data:
            if function['function_name'] == function_name:
                for variable in function['variables']:
                    if variable['name'] == variable_name:
                        if write_count in variable:
                            variable['write_count'] += write_count
                        else:
                            variable['write_count'] = write_count
                        print(f"Updated {variable_name} in {function_name} with write_count: {write_count}")
                        return True
        print(f"Could not find variable {variable_name} in function {function_name}")
        return False

    def __init__(self):
        super(AsmCounter, self).__init__("count_asm", gdb.COMMAND_USER)
        self.counts = {}
        self.asm_lines = {}
        self.line_numbers = {}
        self.visited_addresses = set()
        self.breakpoints = []
        self.address_map = {}
        self.directory = os.getcwd()
        self.json_files = ""
        for filename in os.listdir(self.directory):
            if filename.endswith('.json'):
                self.json_files = filename
                print("json file:", self.json_files)
                with open(self.json_files, 'r') as f:
                    self.json_data = json.load(f)

    def invoke(self, arg, from_tty):
        print("Starting instruction tracking...")
        gdb.execute("set pagination off", to_string=True)
        gdb.execute("set confirm off", to_string=True)

        function_names = self.get_all_functions()

        for function_name in function_names:
            try:
                output = gdb.execute(f"disassemble {function_name}", to_string=True)
                print("---------------------- output ----------------------")
                print(output)
                print("---------------------- output ----------------------")
                lines = output.split("\n")
                for line in lines:
                    match = re.match(r"\s*(0x[0-9a-f]+)\s*<.*>:\s*(.*)", line)
                    match_write = re.match(r"\s*0x[0-9a-f]+ <\+[0-9a-f]*>:\smov[a-z]*  %[a-z0-9]+,-0x[0-9a-f]*\(%rbp\)", line)
                    if match and "rbp" in line and match_write:
                        addr = match.group(1).strip()
                        instruction = match.group(2).strip()
                        if addr not in self.visited_addresses:
                            self.breakpoints.append(addr)
                            self.visited_addresses.add(addr)
                            self.counts[addr] = 0
                            self.asm_lines[addr] = instruction
                            line_number = self.get_source_line(addr)
                            self.line_numbers[addr] = line_number
                            self.address_map[addr] = function_name
                            BreakpointAtAddress(addr, self)
            except gdb.error as e:
                print(f"Error disassembling {function_name}: {e}")

        print("Running the program...")
        gdb.execute("run", to_string=True)
        self.print_results()

    def get_all_functions(self):
        functions = []
        output = gdb.execute("info functions", to_string=True)
        lines = output.split("\n")
        for line in lines:
            match = re.match(r".*\s([a-zA-Z0-9_]+)\s*\(", line)
            if match:
                functions.append(match.group(1))
        return functions

    def get_source_line(self, addr):
        """Returns the corresponding source code line number for an assembly address."""
        try:
            output = gdb.execute(f"info line *{addr}", to_string=True)
            match = re.search(r"Line (\d+) of \"([^\"]+)\"", output)
            if match:
                return f"{match.group(2)}:{match.group(1)}"
        except gdb.error:
            return "Unknown"

    def print_results(self):
        print("\nFinal Execution Counts:")
        for addr, count in sorted(self.counts.items(), key=lambda x: x[1], reverse=True):
            instruction = self.asm_lines.get(addr, "Unknown instruction")
            line_info = self.line_numbers.get(addr, "Unknown")
            print(f"{self.address_map[addr]} -> {instruction} executed {count} times")
            var_name = instruction.split(',')[1]
            var_name = "-" + str(int(var_name.split("(")[0][1:], 16)) + "(%rbp)"
            self.add_write_count_to_variable(self.address_map[addr], var_name, count)
        
        with open(self.json_files, 'w') as f:
            json.dump(self.json_data, f, indent=2)
            print(f"\nModified data saved to {self.json_files}")

class BreakpointAtAddress(gdb.Breakpoint):
    """Breakpoint that counts execution at a given address."""

    def __init__(self, addr, counter):
        super().__init__(f"*{addr}", gdb.BP_BREAKPOINT, internal=False)
        self.addr = addr
        self.counter = counter

    def stop(self):
        """Increment count and continue execution."""
        self.counter.counts[self.addr] += 1
        return False  # Continue execution automatically

print("Registering GDB command: count_asm")
AsmCounter()

gdb.execute("count_asm")
