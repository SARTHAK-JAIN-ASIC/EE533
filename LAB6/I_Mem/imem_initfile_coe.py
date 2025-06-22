# This is used to create the .coe file that will initialize the instruction memory.

# Open the COE file in write mode
with open('imem32x512.coe', 'w') as f:
    # Write the header for COE
    f.write('memory_initialization_radix=2;\n')
    f.write('memory_initialization_vector=\n')

    # Write the first 6 entries manually
    f.write('01000000010000000000000000000000,\n')
    f.write('01000000011000000000000000000000,\n')
    f.write('00000000000000000000000000000000,\n')
    f.write('00000000000000000000000000000000,\n')
    f.write('00000000000000000000000000000000,\n')
    f.write('10010011000000000000000000000000,\n')

    # Write the remaining 506 entries (addresses 110 to 111111111) as zeros
    for i in range(6, 512):  # Loop should go from 6 to 511 (making 512 total entries)
        # Address as a 9-bit binary string
        address = format(i, '09b')
        # Add a comma for all but the last entry
        if i == 511:
            f.write('00000000000000000000000000000000;\n')  # Last entry without comma
        else:
            f.write('00000000000000000000000000000000,\n')

    # End of COE file
    f.write(';\n')

print("COE file generated successfully!")
