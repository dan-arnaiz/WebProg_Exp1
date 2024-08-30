import pandas as pd
import pydot

# Function to create a class diagram from CSV
def create_class_diagram(csv_file, output_image):
    try:
        # Load the CSV file into a DataFrame
        df = pd.read_csv(csv_file)

        # Initialize a new Dot object
        graph = pydot.Dot(graph_type='digraph')

        # Extract entities and attributes
        entities = df[df['Name'] == 'Entity']
        lines = df[df['Name'] == 'Line']

        # Add nodes for each entity
        for index, entity in entities.iterrows():
            entity_name = entity['Text Area 1']
            entity_attributes = entity[['Text Area 2', 'Text Area 3', 'Text Area 4', 'Text Area 5', 'Text Area 6', 
                                        'Text Area 7', 'Text Area 8', 'Text Area 9', 'Text Area 10']].dropna().values
            
            label = f"{entity_name} | " + "\\l".join([f"{attr}" for attr in entity_attributes]) + "\\l"
            node = pydot.Node(entity_name, shape="record", label=f"{{{label}}}")
            graph.add_node(node)

        # Add edges for relationships
        for index, line in lines.iterrows():
            try:
                source = entities.loc[entities['Id'] == line['Line Source'], 'Text Area 1'].values[0]
                destination = entities.loc[entities['Id'] == line['Line Destination'], 'Text Area 1'].values[0]
                graph.add_edge(pydot.Edge(source, destination))
            except IndexError:
                print(f"Error: Line source or destination not found for line {index}")

        # Save the graph to a file
        graph.write_png(output_image)
        print(f"Class diagram saved as {output_image}")
    except Exception as e:
        print(f"An error occurred: {e}")

# Usage
csv_file = 'mdg-erd.csv'  # Replace with your CSV file path
output_image = 'class_diagram.png'  # Desired output image file
create_class_diagram(csv_file, output_image)