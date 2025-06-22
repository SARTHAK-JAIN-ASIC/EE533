def process_input(bit_input, filename):
    # Ensure bit_input is 64 bits
    if isinstance(bit_input, int):
        bit_input = format(bit_input, '064b')
    elif isinstance(bit_input, str):
        if len(bit_input) != 64 or any(c not in '01' for c in bit_input):
            raise ValueError("Input must be a 64-bit binary string.")
    else:
        raise TypeError("Input must be a string or integer.")

    # Read decimal values from the file
    with open(filename, 'r') as f:
        values = [float(line.strip()) for line in f.readlines()]

    if len(values) != 64:
        raise ValueError("The file must contain exactly 64 decimal values.")

    # Apply mask
    selected = [val if bit == '1' else 0.0 for bit, val in zip(bit_input, values)]

    total = sum(selected)
    print(f"Selected Values: {selected}")
    print(f"Total Sum: {total}")
    return total


# Example usage
if __name__ == "__main__":
    input_bits = '0011100001101000010010000001110000111000001100000011000000100000'
    filename = 'values.txt'  # Ensure this file contains 64 lines of decimal values
    process_input(input_bits, filename)
