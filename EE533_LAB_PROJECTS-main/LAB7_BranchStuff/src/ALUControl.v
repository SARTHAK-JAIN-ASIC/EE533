module ALUControl
(
   input [1:0] ALUop,
   input [10:0] opcodeField,
   output reg [3:0] ALUoperation
);

   always @(*) begin
      case (ALUop)
         2'b00 : ALUoperation = 4'b0010; // Load/Store uses ADD (address calculation)
         2'b01 : ALUoperation = 4'b0111; // CBZ (compare for zero)
         2'b10 : 
         case (opcodeField)
            11'b10001011000 : ALUoperation = 4'b0010; // ADD (R-type)
            11'b11001011000 : ALUoperation = 4'b0110; // SUB (R-type)
            11'b10001010000 : ALUoperation = 4'b0000; // AND (R-type)
            11'b10101010000 : ALUoperation = 4'b0001; // ORR (R-type)

            // Immediate Arithmetic (I-Type)
            11'b10010001000 : ALUoperation = 4'b0010; // ADDI
            11'b11010001000 : ALUoperation = 4'b0110; // SUBI
            11'b10010010000 : ALUoperation = 4'b0000; // ANDI
            11'b10110010000 : ALUoperation = 4'b0001; // ORRI

            // Load/Store (D-Type)
            11'b11111000010 : ALUoperation = 4'b0010; // LDUR (PC + offset)
            11'b11111000000 : ALUoperation = 4'b0010; // STUR (PC + offset)

            // Branch (B-Type & CB-Type)
            default: ALUoperation = 4'b0010; // Default to ADD (for branches, loads)
         endcase
      endcase
   end
endmodule
