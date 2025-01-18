import json
from collections import defaultdict
import matplotlib.pyplot as plt

def count_variable_writes(json_file):
    """
    Reads a JSON file and counts the number of writes for each variable in each function.
    :param json_file: Path to the JSON file.
    :return: Dictionary with function names as keys and lists of write counts for each variable as values.
    """
    with open(json_file, 'r') as file:
        data = json.load(file)

    # Dictionary to hold write counts per function
    function_writes = defaultdict(list)

    # Check if the data is a list
    if isinstance(data, list):
        for function in data:
            function_name = function.get("function_name")
            variables = function.get("variables", [])

            for variable in variables:
                write_lines = variable.get("lines", {}).get("write", [])
                write_count = len(write_lines)

                function_writes[function_name].append(write_count)
    else:
        function_name = data.get("function_name")
        variables = data.get("variables", [])

        for variable in variables:
            write_lines = variable.get("lines", {}).get("write", [])
            write_count = len(write_lines)

            function_writes[function_name].append(write_count)

    return function_writes

def plot_boxplot(data):
    """
    Plots a boxplot for the given data.
    :param data: Dictionary with function names as keys and lists of values as data.
    """
    labels = list(data.keys())
    values = list(data.values())

    plt.figure(figsize=(10, 6))
    plt.boxplot(values, labels=labels, patch_artist=True, boxprops=dict(facecolor="lightblue"))
    plt.title("Boxplot of Variable Write Counts per Function")
    plt.xlabel("Function Names")
    plt.ylabel("Write Counts")
    plt.xticks(rotation=45, ha="right")
    plt.tight_layout()
    plt.show()

def plot_scatter(data):
    """
    Plots a scatter plot for the given data, with point sizes based on write counts.
    :param data: Dictionary with function names as keys and lists of values as data.
    """
    plt.figure(figsize=(10, 6))

    for i, (function_name, values) in enumerate(data.items()):
        x = [i + 1] * len(values)  # Position for each function
        sizes = [(v * 10 if v > 0 else 10) for v in values]  # Ensure minimum size for points with write count 0
        plt.scatter(x, values, s=sizes, label=function_name, alpha=0.6)

    plt.title("Scatter Plot of Variable Write Counts per Function")
    plt.xlabel("Function Names")
    plt.ylabel("Write Counts")
    plt.xticks(range(1, len(data) + 1), data.keys(), rotation=45, ha="right")
    plt.legend(loc="upper right")
    plt.tight_layout()
    plt.show()

# Example usage
if __name__ == "__main__":
    json_path = "/home/mahsa/Documents/MiBench_project/dijkstra/dijkstra_stack.json"  
    result = count_variable_writes(json_path)
    # print(json.dumps(result, indent=4))
    plot_boxplot(result)
    plot_scatter(result)
