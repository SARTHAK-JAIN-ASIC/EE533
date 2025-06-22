module signExtended
#(
   parameter INSTR_WIDTH = 32,
   parameter DATA_WIDTH  = 64
)
(
   input       [INSTR_WIDTH - 1 : 0] instruction,
   output reg  [DATA_WIDTH  - 1 : 0] immediate
);

   //wire [10:0] opcode;
   
  // assign opcode = instruction[31:21];

   always @(*)
   begin
      case(instruction[27:20])
         //R-Type ADD, SUB, AND, ORR, MOV (with Register)
         8'b0000_1000,    // ADD
		 8'b0001_1010,    // MOV (with register)
         8'b0000_0100:    // SUB
         /* 11'b10001010000,    // AND
         11'b10101010000:    // ORR */
        begin
            immediate = 64'd0;
        end

         // I-type ADDI, SUBI, MOV (with immediate Value)
         8'b0010_1000,    // ADDI
		 8'b0011_1010,    //MOV (with value)
         8'b0010_0100:    // SUBI
         begin
           immediate = {{52{1'd0}}, instruction[11:0]}; 
         end
		 
		 8'b1010_0000, // Branch positive offset
		 8'b1010_0001, // Branch negative offset
		 8'b1011_0000, // BGE positive offset
		 8'b1011_0001: // BLE positive offset
		 begin
           immediate = {{44{1'd0}}, instruction[19:0]}; 
         end

         // D-type LDR, STR
         8'b0101_0001,    // LDR positive offset
		 8'b0101_1001,    // LDR negative offset
         8'b0101_0000:    // STR negative offet
						  // STR positive offset?? IDK yet
         begin
           immediate = {{52{1'd0}}, instruction[11:0]}; 
         end

         default : immediate = 64'd0;
      endcase
/*      
      //Logic outside of case for B and CBZ
//if (opcode[10 : 5] == 6'b000101)
      if (instruction[31:26] == 6'b000101)
      begin
         immediate = {{38{instruction[25]}}, instruction[25:0]} << 2;
      end
// else if (opcode[10 : 3] == 8'b10110100 || opcode[10 : 3] == 8'b10110101)
      else if (instruction[31 : 24] == 8'b10110100 || instruction[31 : 24] == 8'b10110101)
      begin
         immediate = {{45{instruction[23]}}, instruction[23:5]} << 2;
      end
      */
   end

endmodule
