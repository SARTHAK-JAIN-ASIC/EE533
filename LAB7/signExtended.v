module signExtended
#(
   parameter INSTR_WIDTH = 32,
   parameter DATA_WIDTH  = 64
)
(
   input       [INSTR_WIDTH - 1 : 0] instruction,
   output reg  [DATA_WIDTH  - 1 : 0] immediate
);

   wire [10:0] opcode;
   
   assign opcode = instruction[31:21];

   always @(*)
   begin
      case(opcode)
         //R-Type ADD, SUB, AND, ORR
         11'b10001011000,    // ADD
         11'b11001011000,    // SUB
         11'b10001010000,    // AND
         11'b10101010000:    // ORR
         begin
            immediate = 64'd0;
         end

         // I-type ADDI, SUBI
         11'b10010001000,    // ADDI
         11'b11010001000:    // SUBI
         begin
           immediate = {{52{1'd0}}, instruction[21:10]}; //ZeroExtend(instruction[21:10], 12);
         end

         // D-type LDUR, STUR
         11'b11111000010,    // LDUR
         11'b11111000000:    // STUR
         begin
           immediate = {{55{instruction[20]}}, instruction[20:12]}; //SignExtend(instruction[20:12], 9);
         end

         default : immediate = 64'd0;
      endcase
     
      //Logic outside of case for B and CBZ
      if (opcode[10 : 5] == 6'b000101)
      begin
         immediate = {{38{instruction[25]}}, instruction[25:0]} << 2;
      end
      else if (opcode[10 : 3] == 8'b10110100 || opcode[10 : 3] == 8'b10110101)
      begin
         immediate = {{45{instruction[23]}}, instruction[23:5]} << 2;
      end
     
   end

endmodule