import gdb
import re

class AsmCounter(gdb.Command):
    """Counts execution of assembly instructions in batch mode."""

    def __init__(self):
        super(AsmCounter, self).__init__("count_asm", gdb.COMMAND_USER)
        self.counts = {}
        self.asm_lines = {}
        self.visited_addresses = set()
        self.breakpoints = []

    def invoke(self, arg, from_tty):
        print("Starting instruction tracking...")
        gdb.execute("set pagination off", to_string=True)
        gdb.execute("set confirm off", to_string=True)

        function_names = self.get_all_functions()

        for function_name in function_names:
            try:
                output = gdb.execute(f"disassemble {function_name}", to_string=True)
                lines = output.split("\n")
                for line in lines:
                    match = re.match(r"\s*(0x[0-9a-f]+)\s*<.*>:\s*(.*)", line)
                    if match:
                        addr = match.group(1).strip()
                        instruction = match.group(2).strip()
                        if addr not in self.visited_addresses:
                            self.breakpoints.append(addr)
                            self.visited_addresses.add(addr)
                            self.counts[addr] = 0
                            self.asm_lines[addr] = instruction
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

    def print_results(self):
        print("\nFinal Execution Counts:")
        for addr, count in sorted(self.counts.items(), key=lambda x: x[1], reverse=True):
            instruction = self.asm_lines.get(addr, "Unknown instruction")
            print(f"{addr} -> {instruction} executed {count} times")

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
