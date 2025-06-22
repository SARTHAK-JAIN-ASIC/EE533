# with open("generated_ports.v", "w") as f:
    # for i in range(740):
        # f.write(f"\t.data_out_{i:d}  (wire_weight_from_rom[{i}]),\n")
        
# with open("generated_weights.v", "w") as f:
     # for i in range(740):
         # f.write(f"AAAA\n")
         
# with open("for_rom.v", "w") as f:
     # for i in range(740):
         # f.write(f"output reg [15:0] data_out_{i},\n")
         
with open("for_rom_alwaysblock.v", "w") as f:
     for i in range(740):
         f.write(f"data_out_{i}  <= rom_data[{i}];\n")

