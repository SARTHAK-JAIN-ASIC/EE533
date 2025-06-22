//create a byte addressable memory

module instruction_memory
#(
   parameter INSTR_WIDTH = 32,
   parameter BYTE        = 8,
   parameter DATA_WIDTH  = 64
)
(
   input       [DATA_WIDTH  - 1 : 0] PC,
   output reg  [INSTR_WIDTH - 1 : 0] CPU_Instruction
);

   reg [BYTE-1 : 0] inst_mem [0 : 255];

   initial 
   begin
      //$readmemh("bubblesort.hex", inst_mem);
      // ADD X12, X3, X4
      inst_mem[0]    = 'b10001011;
      inst_mem[1]    = 'b00000100;
      inst_mem[2]    = 'b00000000;
      inst_mem[3]    = 'b01101100;

      //SUB X11, X2, X3
      inst_mem[4]    = 'b11001011;
      inst_mem[5]    = 'b00000011;
      inst_mem[6]    = 'b00000000;
      inst_mem[7]    = 'b01001011;

      // ADD X12, X3, X4
      inst_mem[8]    = 'b10001011;
      inst_mem[9]    = 'b00000100;
      inst_mem[10]   = 'b00000000;
      inst_mem[11]   = 'b01101100;
   end

   always @(*)
   begin
      CPU_Instruction[31 : 24] = inst_mem[PC];
      CPU_Instruction[23 : 16] = inst_mem[PC + 1];
      CPU_Instruction[15 :  8] = inst_mem[PC + 2];
      CPU_Instruction[7  :  0] = inst_mem[PC + 3];
   end

endmodule