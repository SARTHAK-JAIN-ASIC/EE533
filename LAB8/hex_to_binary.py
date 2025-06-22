def hex_to_binary(hex_string):
    """Convert a hexadecimal string to a binary string."""
    # Remove any leading/trailing whitespace
    hex_string = hex_string.strip()
    
    # Convert hex to binary
    binary_string = bin(int(hex_string, 16))[2:].zfill(len(hex_string) * 4)
    
    return binary_string

def parse_hex_file(input_file, output_file):
    """Read a file containing hex values, convert to binary, and write to output file."""
    try:
        with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
            for line in infile:
                # Skip empty lines
                if not line.strip():
                    continue
                
                # Convert each line from hex to binary
                binary_data = hex_to_binary(line)
                
                # Write the binary data to the output file
                outfile.write(binary_data + '\n')
                
        print(f"Successfully converted hex data from '{input_file}' to binary and saved to '{output_file}'.")
    except Exception as e:
        print(f"An error occurred: {e}")

if __name__ == "__main__":
    # Specify the input and output file paths
    input_file = 'input_hex.txt'  # Replace with your input file name
    output_file = 'output_binary.txt'  # Replace with your output file name
    
    # Parse the hex file and convert to binary
    parse_hex_file(input_file, output_file)