import os
import re

# The markdown string provided
markdown = '''
pytest-guide/
├── README.md                       # Main documentation overview
├── 1_introduction/
│   ├── README.md                   # Introduction to pytest and testing concepts
│   └── why_pytest.md               # Comparison with other testing frameworks
├── 2_installation/
│   ├── README.md                   # Installation instructions for different environments
│   └── verifying_installation.md   # How to verify your installation
├── 3_getting_started/
│   ├── README.md                   # Quick start guide
│   ├── first_test.py               # Example of a basic test
│   └── test_discovery.md           # How pytest discovers tests
├── 4_writing_tests/
│   ├── README.md                   # Test writing fundamentals
│   ├── assertions.md               # Guide to assertions
│   ├── test_classes.py             # Using classes for tests
│   └── test_functions.py           # Function-based tests
├── 5_running_tests/
│   ├── README.md                   # Running tests guide
│   ├── command_line_options.md     # CLI options for pytest
│   └── test_selection.md           # How to select specific tests
'''

def parse_markdown(md_text: str) -> dict:
    """Parses markdown text to extract the folder structure as a dictionary."""
    structure = {}
    current_path = []
    
    for line in md_text.strip().splitlines():
        # Ignore comment lines
        if '#' in line:
            line = line.split('#')[0].strip()
        
        # Ignore empty lines
        if not line.strip():
            continue

        # Determine the depth of the line (number of '│', '├', '└' characters)
        depth = len(re.match(r"^[\s│]*", line).group())
        
        # Remove tree characters and strip leading/trailing whitespace
        line = re.sub(r"[├─└│]+", '', line).strip()
        
        # Handle folder or file creation
        if line.endswith('/'):
            folder_name = line[:-1]
            # Update the current path
            current_path = current_path[:depth] + [folder_name]
            # Create nested dictionary structure
            current_dict = structure
            for part in current_path:
                if part not in current_dict:
                    current_dict[part] = {}
                current_dict = current_dict[part]
        else:
            # It's a file, add it to the current path's dictionary
            current_dict = structure
            for part in current_path:
                current_dict = current_dict[part]
            current_dict[line] = None  # Files have no further nesting
            
    return structure

def create_files_and_folders(base_path: str, structure: dict):
    """Creates folders and files based on the provided dictionary structure."""
    for name, content in structure.items():
        path = os.path.join(base_path, name)
        
        if isinstance(content, dict):  # It's a folder
            os.makedirs(path, exist_ok=True)
            create_files_and_folders(path, content)
        else:  # It's a file
            with open(path, 'w') as file:
                file.write("")  # Create an empty file

# Parse the markdown to get the folder structure
folder_structure = parse_markdown(markdown)
print(folder_structure)

# Create the folders and files on disk
output_path = "pytest-guide"  # Change this to your desired output location
create_files_and_folders(output_path, folder_structure)

print("Folders and files created successfully!")
