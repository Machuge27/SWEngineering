import os
import re
import sys
from pathlib import Path

def parse_markdown(md_file_path: str) -> dict:
    """Parses a markdown file to extract the folder structure and file content as a dictionary."""
    structure = {}
    current_path = []
    
    try:
        with open(md_file_path, 'r') as file:
            lines = file.readlines()
    except FileNotFoundError:
        print(f"Error: The file '{md_file_path}' does not exist.")
        sys.exit(1)
        
    for line in lines:
        # Capture comments (used as placeholder content)
        comment_content = None
        if '#' in line:
            line, comment_content = line.split('#', 1)
            line = line.strip()
            comment_content = comment_content.strip()
        
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
            current_dict[line] = comment_content  # Store the comment as placeholder content
            
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
                # Write placeholder content if available
                if content:
                    file.write(f"# {content}\n")
                else:
                    file.write("")  # Create an empty file if no content is provided

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python generate_structure.py <target_directory>")
        sys.exit(1)

    # Read the target directory argument
    target_directory = sys.argv[1]

    # Hardcoded path to structure.md on the Desktop
    desktop_path = Path.home() / "Desktop"
    md_file_path = os.path.join(desktop_path, "structure.md")
    
    # Ensure the parent directory is always 'pytest-guide'
    final_output_path = os.path.join(target_directory, "generated-folder")
    
    # Parse the markdown file
    folder_structure = parse_markdown(md_file_path)

    # Create files and folders
    create_files_and_folders(final_output_path, folder_structure)

    print(f"✅ Files and folders created successfully under '{final_output_path}'!")
