module instruction_parser
#(
   parameter DATA_WIDTH = 0,
   parameter ADDRESS_WDITH = 0
)
(
   input  [INSTR_WIDTH-1 : 0]  instruction_i,
   output [11:0] Opcode,
   output [4 :0] Rn, Rm, Rd,
   output [5 :0] Shamt
)


   always @(*)
   begin
      Opcode = instruction_i[INSTR_WIDTH - 1 : 21];
      Rn     = instruction_i[9 : 5];
      Rm     = instruction_i[20 : 16];
      Rd     = instruction_i[4:0];
      Shamt  = instruction_i[15 : 10];
   end

endmodule