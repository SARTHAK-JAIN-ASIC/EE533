#!/bin/bash

# Check if the source file was passed as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <source_file.c>"
  exit 1
fi

SOURCE_FILE=$1
BASE_NAME=$(basename "$SOURCE_FILE" .c)  # Extract the base name without extension

# Step 1: Generate Assembly Code
echo "Generating Assembly Code for $SOURCE_FILE..."
arm-none-eabi-gcc -S -march=armv8-a "$SOURCE_FILE" -o "$BASE_NAME.s"

# Step 2: Convert Assembly Code to Machine Code
echo "Converting Assembly Code to Machine Code..."
arm-none-eabi-as -o "$BASE_NAME.o" "$BASE_NAME.s"

# Step 3: Produce ELF file
echo "Producing ELF file..."
arm-none-eabi-gcc -o "$BASE_NAME.elf" "$BASE_NAME.o" -nostdlib

# Step 4: View ELF in readable hex format (Disassembly)
echo "Disassembling ELF to readable format..."
arm-none-eabi-objdump -d "$BASE_NAME.elf" > "$BASE_NAME"_disassembly.txt

# Step 5: Generate Machine Binary
echo "Generating Machine Binary..."
arm-none-eabi-objcopy -O binary "$BASE_NAME.elf" "$BASE_NAME.bin"

# Step 6: Generate Binary Output Text in Binary and Hex Formats
echo "Generating Binary Output in Binary and Hex formats..."

# Binary Output
xxd -b "$BASE_NAME.bin" > "$BASE_NAME"_binary.txt

# Hexadecimal Output
xxd "$BASE_NAME.bin" > "$BASE_NAME"_hexadecimal.txt

# Inform the user that the process is complete
echo "Process complete. Files generated:"
echo "$BASE_NAME"_disassembly.txt "(disassembly of ELF)"
echo "$BASE_NAME"_binary.txt "(binary output)"
echo "$BASE_NAME"_hexadecimal.txt "(hexadecimal output)"
