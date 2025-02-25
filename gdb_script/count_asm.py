import gdb
import re

class AsmCounter(gdb.Command):
    """Counts execution of assembly instructions and maps them to source files."""

    def __init__(self):
        super(AsmCounter, self).__init__("count_asm", gdb.COMMAND_USER)
        self.counts = {}  # Counts the execution at each file:line
        self.visited_addresses = set()  # Keeps track of addresses already visited
        self.is_running = False
        self.breakpoints = []  # Stores breakpoints
        self.original_stop_handler = None  # Holds original stop handler to restore later

    def invoke(self, arg, from_tty):
        if self.is_running:
            print("Already running.")
            return

        print("Starting assembly instruction counting...")
        gdb.execute("set pagination off", to_string=True)
        gdb.execute("set confirm off", to_string=True)

        function_names = self.get_all_functions()

        # Set breakpoints at each assembly instruction address
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
                            print(f"Setting breakpoint at {addr} for instruction: {instruction}")
                            try:
                                bp = gdb.Breakpoint(f"*{addr}", internal=True)
                                bp.silent = True  # Make breakpoint silent
                                self.breakpoints.append(bp)
                                self.visited_addresses.add(addr)
                            except gdb.error as e:
                                print(f"Error setting breakpoint at {addr}: {e}")

            except gdb.error as e:
                print(f"Error disassembling {function_name}: {e}")

        # Connect stop event to track execution
        if gdb.events.stop is not None:
            self.original_stop_handler = gdb.events.stop

        gdb.events.stop.connect(self.track_execution)

        # Start the program execution
        print("Running the program...")
        self.is_running = True
        try:
            gdb.execute("run")
        except gdb.error as e:
            print(f"Error during execution: {e}")
            self.is_running = False

    def get_all_functions(self):
        """Gets a list of all function names in the program."""
        functions = []
        output = gdb.execute("info functions", to_string=True)
        lines = output.split("\n")
        for line in lines:
            match = re.match(r".*\s([a-zA-Z0-9_]+)\s*\(", line)
            if match:
                function_name = match.group(1)
                functions.append(function_name)
        return functions

    def track_execution(self, event):
        if not self.is_running:
            return

        try:
            frame = gdb.selected_frame()
            if frame is None:
                print("No frame selected.")
                return

            pc = frame.pc()
            if pc is None:
                print("Program counter is None.")
                return

            addr = int(pc)

            # Get source file and line number corresponding to the PC
            sal = gdb.find_pc_line(pc)
            if sal.symtab:
                file_name = sal.symtab.filename
                line_number = sal.line
                key = (file_name, line_number)
            else:
                key = ("unknown", -1)

            # Count execution at this source file and line
            self.counts[key] = self.counts.get(key, 0) + 1

            # Continue execution after each instruction
            gdb.execute("continue", to_string=True)

        except Exception as e:
            print(f"Error while tracking execution: {e}")
            self.is_running = False
            if self.original_stop_handler:
                gdb.events.stop.disconnect(self.track_execution)

    def on_program_exit(self, event):
        self.is_running = False

        print("\nInstruction Execution Counts:")
        # Display counts of executed instructions per source file:line
        for (file_name, line_number), count in sorted(self.counts.items()):
            print(f"{file_name}:{line_number} executed {count} times")

        # Cleanup breakpoints and reset
        for bp in self.breakpoints:
            bp.delete()
        self.breakpoints = []
        self.visited_addresses = set()
        self.counts = {}

        if self.original_stop_handler:
            gdb.events.stop.disconnect(self.track_execution)

        if hasattr(event, 'exit_code'):
            exit_code = event.exit_code
            print(f"Program finished with exit code {exit_code}.")
        else:
            print("Program finished.")

print("Registering GDB command: count_asm")
counter = AsmCounter()
gdb.events.exited.connect(counter.on_program_exit)
gdb.execute("count_asm")

