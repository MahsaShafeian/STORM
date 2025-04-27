import json
import graphviz
import os

# 1. JSON Data (as a Python dictionary)
#    (Keep the same data structure as before)
data = {
    "main": {
        "nodes": [
            {
                "id": "B1",
                "start": 14,
                "end": 33,
                "type": "entry"
            },
            {
                "id": "B2",
                "start": 33,
                "end": 47,
                "type": "conditional"
            },
            {
                "id": "B3",
                "start": 48,
                "end": 61,
                "type": "conditional"
            },
            {
                "id": "B4",
                "start": 61,
                "end": 70,
                "type": "conditional"
            },
            {
                "id": "B5",
                "start": 71,
                "end": 86,
                "type": "normal"
            },
            {
                "id": "B6",
                "start": 86,
                "end": 90,
                "type": "conditional"
            },
            {
                "id": "B7",
                "start": 91,
                "end": 97,
                "type": "conditional"
            },
            {
                "id": "B8",
                "start": 97,
                "end": 99,
                "type": "normal"
            },
            {
                "id": "B9",
                "start": 99,
                "end": 103,
                "type": "exit"
            }
        ],
        "edges": [
            {
                "from": "B1",
                "to": "B6",
                "type": "jg"
            },
            {
                "from": "B1",
                "to": "B2",
                "type": "fall-through"
            },
            {
                "from": "B2",
                "to": "B7",
                "type": "jmp"
            },
            {
                "from": "B3",
                "to": "B5",
                "type": "jne"
            },
            {
                "from": "B3",
                "to": "B4",
                "type": "fall-through"
            },
            {
                "from": "B4",
                "to": "B6",
                "type": "jmp"
            },
            {
                "from": "B5",
                "to": "B6",
                "type": "fall-through"
            },
            {
                "from": "B6",
                "to": "B3",
                "type": "jne"
            },
            {
                "from": "B7",
                "to": "B9",
                "type": "je"
            },
            {
                "from": "B7",
                "to": "B8",
                "type": "fall-through"
            },
            {
                "from": "B8",
                "to": "B9",
                "type": "fall-through"
            }
        ]
    },
    "sha_transform": {
        "nodes": [
            {
                "id": "B1",
                "start": 7,
                "end": 26,
                "type": "entry"
            },
            {
                "id": "B2",
                "start": 27,
                "end": 40,
                "type": "normal"
            },
            {
                "id": "B3",
                "start": 40,
                "end": 43,
                "type": "conditional"
            },
            {
                "id": "B4",
                "start": 43,
                "end": 47,
                "type": "conditional"
            },
            {
                "id": "B5",
                "start": 48,
                "end": 85,
                "type": "normal"
            },
            {
                "id": "B6",
                "start": 85,
                "end": 88,
                "type": "conditional"
            },
            {
                "id": "B7",
                "start": 88,
                "end": 112,
                "type": "conditional"
            },
            {
                "id": "B8",
                "start": 113,
                "end": 155,
                "type": "normal"
            },
            {
                "id": "B9",
                "start": 155,
                "end": 158,
                "type": "conditional"
            },
            {
                "id": "B10",
                "start": 158,
                "end": 162,
                "type": "conditional"
            },
            {
                "id": "B11",
                "start": 163,
                "end": 200,
                "type": "normal"
            },
            {
                "id": "B12",
                "start": 200,
                "end": 203,
                "type": "conditional"
            },
            {
                "id": "B13",
                "start": 203,
                "end": 207,
                "type": "conditional"
            },
            {
                "id": "B14",
                "start": 208,
                "end": 251,
                "type": "normal"
            },
            {
                "id": "B15",
                "start": 251,
                "end": 254,
                "type": "conditional"
            },
            {
                "id": "B16",
                "start": 254,
                "end": 258,
                "type": "conditional"
            },
            {
                "id": "B17",
                "start": 259,
                "end": 297,
                "type": "normal"
            },
            {
                "id": "B18",
                "start": 297,
                "end": 300,
                "type": "conditional"
            },
            {
                "id": "B19",
                "start": 300,
                "end": 340,
                "type": "conditional"
            },
            {
                "id": "B20",
                "start": 340,
                "end": 342,
                "type": "normal"
            },
            {
                "id": "B21",
                "start": 342,
                "end": 346,
                "type": "exit"
            }
        ],
        "edges": [
            {
                "from": "B1",
                "to": "B3",
                "type": "jmp"
            },
            {
                "from": "B2",
                "to": "B3",
                "type": "fall-through"
            },
            {
                "from": "B3",
                "to": "B2",
                "type": "jle"
            },
            {
                "from": "B3",
                "to": "B4",
                "type": "fall-through"
            },
            {
                "from": "B4",
                "to": "B6",
                "type": "jmp"
            },
            {
                "from": "B5",
                "to": "B6",
                "type": "fall-through"
            },
            {
                "from": "B6",
                "to": "B5",
                "type": "jle"
            },
            {
                "from": "B6",
                "to": "B7",
                "type": "fall-through"
            },
            {
                "from": "B7",
                "to": "B9",
                "type": "jmp"
            },
            {
                "from": "B8",
                "to": "B9",
                "type": "fall-through"
            },
            {
                "from": "B9",
                "to": "B8",
                "type": "jle"
            },
            {
                "from": "B9",
                "to": "B10",
                "type": "fall-through"
            },
            {
                "from": "B10",
                "to": "B12",
                "type": "jmp"
            },
            {
                "from": "B11",
                "to": "B12",
                "type": "fall-through"
            },
            {
                "from": "B12",
                "to": "B11",
                "type": "jle"
            },
            {
                "from": "B12",
                "to": "B13",
                "type": "fall-through"
            },
            {
                "from": "B13",
                "to": "B15",
                "type": "jmp"
            },
            {
                "from": "B14",
                "to": "B15",
                "type": "fall-through"
            },
            {
                "from": "B15",
                "to": "B14",
                "type": "jle"
            },
            {
                "from": "B15",
                "to": "B16",
                "type": "fall-through"
            },
            {
                "from": "B16",
                "to": "B18",
                "type": "jmp"
            },
            {
                "from": "B17",
                "to": "B18",
                "type": "fall-through"
            },
            {
                "from": "B18",
                "to": "B17",
                "type": "jle"
            },
            {
                "from": "B18",
                "to": "B19",
                "type": "fall-through"
            },
            {
                "from": "B19",
                "to": "B21",
                "type": "je"
            },
            {
                "from": "B19",
                "to": "B20",
                "type": "fall-through"
            },
            {
                "from": "B20",
                "to": "B21",
                "type": "fall-through"
            }
        ]
    },
    "byte_reverse": {
        "nodes": [
            {
                "id": "B1",
                "start": 351,
                "end": 378,
                "type": "entry"
            },
            {
                "id": "B2",
                "start": 379,
                "end": 427,
                "type": "normal"
            },
            {
                "id": "B3",
                "start": 427,
                "end": 431,
                "type": "conditional"
            },
            {
                "id": "B4",
                "start": 431,
                "end": 436,
                "type": "conditional"
            },
            {
                "id": "B5",
                "start": 436,
                "end": 438,
                "type": "normal"
            },
            {
                "id": "B6",
                "start": 438,
                "end": 442,
                "type": "exit"
            }
        ],
        "edges": [
            {
                "from": "B1",
                "to": "B3",
                "type": "jmp"
            },
            {
                "from": "B2",
                "to": "B3",
                "type": "fall-through"
            },
            {
                "from": "B3",
                "to": "B2",
                "type": "jl"
            },
            {
                "from": "B3",
                "to": "B4",
                "type": "fall-through"
            },
            {
                "from": "B4",
                "to": "B6",
                "type": "je"
            },
            {
                "from": "B4",
                "to": "B5",
                "type": "fall-through"
            },
            {
                "from": "B5",
                "to": "B6",
                "type": "fall-through"
            }
        ]
    },
    "sha_init": {
        "nodes": [
            {
                "id": "B1",
                "start": 448,
                "end": 488,
                "type": "exit"
            }
        ],
        "edges": []
    },
    "sha_update": {
        "nodes": [
            {
                "id": "B1",
                "start": 494,
                "end": 522,
                "type": "entry"
            },
            {
                "id": "B2",
                "start": 522,
                "end": 530,
                "type": "normal"
            },
            {
                "id": "B3",
                "start": 530,
                "end": 556,
                "type": "conditional"
            },
            {
                "id": "B4",
                "start": 557,
                "end": 582,
                "type": "normal"
            },
            {
                "id": "B5",
                "start": 582,
                "end": 585,
                "type": "conditional"
            },
            {
                "id": "B6",
                "start": 585,
                "end": 602,
                "type": "exit"
            }
        ],
        "edges": [
            {
                "from": "B1",
                "to": "B3",
                "type": "jnb"
            },
            {
                "from": "B1",
                "to": "B2",
                "type": "fall-through"
            },
            {
                "from": "B2",
                "to": "B3",
                "type": "fall-through"
            },
            {
                "from": "B3",
                "to": "B5",
                "type": "jmp"
            },
            {
                "from": "B4",
                "to": "B5",
                "type": "fall-through"
            },
            {
                "from": "B5",
                "to": "B4",
                "type": "jg"
            },
            {
                "from": "B5",
                "to": "B6",
                "type": "fall-through"
            }
        ]
    },
    "sha_final": {
        "nodes": [
            {
                "id": "B1",
                "start": 608,
                "end": 647,
                "type": "entry"
            },
            {
                "id": "B2",
                "start": 647,
                "end": 683,
                "type": "conditional"
            },
            {
                "id": "B3",
                "start": 684,
                "end": 701,
                "type": "normal"
            },
            {
                "id": "B4",
                "start": 701,
                "end": 726,
                "type": "exit"
            }
        ],
        "edges": [
            {
                "from": "B1",
                "to": "B3",
                "type": "jle"
            },
            {
                "from": "B1",
                "to": "B2",
                "type": "fall-through"
            },
            {
                "from": "B2",
                "to": "B4",
                "type": "jmp"
            },
            {
                "from": "B3",
                "to": "B4",
                "type": "fall-through"
            }
        ]
    },
    "sha_stream": {
        "nodes": [
            {
                "id": "B1",
                "start": 732,
                "end": 757,
                "type": "entry"
            },
            {
                "id": "B2",
                "start": 758,
                "end": 766,
                "type": "normal"
            },
            {
                "id": "B3",
                "start": 766,
                "end": 779,
                "type": "conditional"
            },
            {
                "id": "B4",
                "start": 779,
                "end": 788,
                "type": "conditional"
            },
            {
                "id": "B5",
                "start": 788,
                "end": 790,
                "type": "normal"
            },
            {
                "id": "B6",
                "start": 790,
                "end": 794,
                "type": "exit"
            }
        ],
        "edges": [
            {
                "from": "B1",
                "to": "B3",
                "type": "jmp"
            },
            {
                "from": "B2",
                "to": "B3",
                "type": "fall-through"
            },
            {
                "from": "B3",
                "to": "B2",
                "type": "jg"
            },
            {
                "from": "B3",
                "to": "B4",
                "type": "fall-through"
            },
            {
                "from": "B4",
                "to": "B6",
                "type": "je"
            },
            {
                "from": "B4",
                "to": "B5",
                "type": "fall-through"
            },
            {
                "from": "B5",
                "to": "B6",
                "type": "fall-through"
            }
        ]
    },
    "sha_print": {
        "nodes": [
            {
                "id": "B1",
                "start": 805,
                "end": 839,
                "type": "exit"
            }
        ],
        "edges": []
    }
}


# --- Configuration ---
OUTPUT_DIR = "cfg_graphs_detailed" # Changed directory name slightly
OUTPUT_FORMAT = "pdf"
VIEW_AFTER_RENDER = True

# --- Create output directory ---
if not os.path.exists(OUTPUT_DIR):
    os.makedirs(OUTPUT_DIR)

# --- Node Styling ---
def get_node_attributes(node_type):
    """Returns graphviz attributes based on node type."""
    if node_type == "entry":
        return {'shape': 'ellipse', 'style': 'filled', 'fillcolor': 'lightblue'}
    elif node_type == "exit":
        return {'shape': 'ellipse', 'style': 'filled', 'fillcolor': 'lightcoral'}
    elif node_type == "conditional":
        # Make diamond slightly wider to accommodate text
        return {'shape': 'diamond', 'width': '1.2', 'height': '0.8'}
    elif node_type == "normal":
        return {'shape': 'box'}
    else:
        return {'shape': 'box'}

# --- Edge Styling ---
def get_edge_attributes(edge_type):
    """Returns graphviz attributes based on edge type."""
    attributes = {'label': edge_type}
    if edge_type == "fall-through":
        attributes['style'] = 'dashed'
    elif "j" in edge_type and edge_type != "jmp": # Conditional jumps
         attributes['color'] = 'blue'
    return attributes


# --- Processing and Drawing ---
for func_name, graph_data in data.items():
    print(f"Processing function: {func_name}")

    dot = graphviz.Digraph(
        name=func_name,
        comment=f'Control Flow Graph for {func_name}',
    )

    # Add nodes
    if "nodes" in graph_data:
        for node in graph_data["nodes"]:
            node_id = node['id']
            node_type = node.get('type', 'normal')
            node_start = node.get('start', '?') # Use get() for safety
            node_end = node.get('end', '?')     # Use get() for safety

            # *** MODIFIED LABEL ***
            # Create a multi-line label using \n for newline
            label = f"{node_id}\nStart: {node_start}\nEnd: {node_end}"
            # Or a more compact version:
            # label = f"{node_id}\n[{node_start} - {node_end}]"

            attrs = get_node_attributes(node_type)
            dot.node(node_id, label=label, **attrs)
    else:
        print(f"  Warning: No 'nodes' found for function {func_name}")


    # Add edges
    if "edges" in graph_data:
        for edge in graph_data["edges"]:
            from_node = edge['from']
            to_node = edge['to']
            edge_type = edge.get('type', '')
            attrs = get_edge_attributes(edge_type)
            dot.edge(from_node, to_node, **attrs)
    else:
         print(f"  Warning: No 'edges' found for function {func_name}")

    # Render the graph
    output_filename = os.path.join(OUTPUT_DIR, f"{func_name}_cfg")
    try:
        dot.render(output_filename, format=OUTPUT_FORMAT, view=VIEW_AFTER_RENDER, cleanup=True)
        print(f"  Graph saved to {output_filename}.{OUTPUT_FORMAT}")
    except Exception as e:
         print(f"  Error rendering graph for {func_name}: {e}")
         print("  Make sure Graphviz executables are installed and in your system's PATH.")

print("\nProcessing complete.")