module ALUControl
(
   input [1:0] ALUop,
   input [7:0] opcodeField,
   output reg [3:0] ALUoperation
);

	localparam [3 : 0]   ADD                   = 4'b0010,
							SUB                   = 4'b0110,
							BITWISE_AND           = 4'b0000,
							BITWISE_OR            = 4'b0001,
							BITWISE_XNOR          = 4'b0101,
							COMPARE               = 4'b0110,
							LOGICAL_SHIFT_LEFT    = 4'b0111,
							LOGICAL_SHIFT_RIGHT   = 4'b1000,
							SHIFT_THEN_COMPARE    = 4'b1001,
							SUBSTRING_COMPARISON  = 4'b1010,
							MOV_IMM               = 4'b1011,
							MOV_REG               = 4'b1100;

   always @(*) begin
      case (ALUop)
         //2'b00 : ALUoperation = 4'b0010; // Load/Store uses ADD (address calculation)
		 2'b00 : //If Load/Store
		 case (opcodeField)
			8'b0101_1001 : ALUoperation = ADD; // LDR with positive offset => ADD
			8'b0101_0001 : ALUoperation = SUB; // LDR with negative offset => SUB
			8'b0101_0000 : ALUoperation = SUB; // STR with negative offset => SUB
											   // STR with positive offset => ADD -- need to find opcode
		 endcase
         2'b01 : ALUoperation = 4'b0111; // If CBZ (compare for zero)
         2'b10 : // If not LD/ST/B => ADD,SUB,MOV
		 begin
			 case (opcodeField)
				8'b0000_1000: ALUoperation = 4'b0010; // ADD with Register
				8'b0010_1000: ALUoperation = 4'b0010; // ADD with Value
				8'b0000_0100: ALUoperation = 4'b0110; // SUB with Register
				8'b0010_0100: ALUoperation = 4'b0110; // SUB with Value
				
				//11'b10001010000 : ALUoperation = 4'b0000; // AND (R-type)
				//11'b10101010000 : ALUoperation = 4'b0001; // ORR (R-type)

				/* // Immediate Arithmetic (I-Type)
				11'b10010001000 : ALUoperation = 4'b0010; // ADDI
				11'b11010001000 : ALUoperation = 4'b0110; // SUBI
				11'b10010010000 : ALUoperation = 4'b0000; // ANDI
				11'b10110010000 : ALUoperation = 4'b0001; // ORRI */

				// Load/Store (D-Type)
				//8'b0101_0001 : ALUoperation = 4'b0010; // LDUR (PC + offset)
				//8'b0101_0000 : ALUoperation = 4'b0010; // STUR (PC + offset)
				
				//MOV
				8'b0011_1010 : ALUoperation = 4'b1011; //MOV_IMM
				8'b0001_1010 : ALUoperation = 4'b1100; //MOV_REG
				
				

				// Branch (B-Type & CB-Type)
				default: ALUoperation = 4'b0010; // Default to ADD (for branches, loads)
			 endcase
		 end
		 
      endcase
   end
endmodule
