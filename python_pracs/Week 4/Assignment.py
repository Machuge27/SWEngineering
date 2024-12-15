
# File Read & Write Challenge 🖋️: 
# Create a program that reads a file and writes a modified version to a new file.
# Error Handling Lab 🧪: 
# Ask the user for a filename and handle errors if it doesn’t exist or can’t be read.
try:
    input_filename = input("Enter the filename to read: ")
    with open(input_filename, 'r') as infile:
        data = infile.readlines()
    
    output_filename = 'modified_' + input_filename
    with open(output_filename, 'w') as outfile:
        for line in data:
            modified_line = line.upper()  # Convert line content to uppercase
            outfile.write(modified_line)
    
    print(f"Modified file has been written to {output_filename}")

except FileNotFoundError:
    print("Error: The file does not exist.")
except IOError:
    print("Error: Could not read the file.")