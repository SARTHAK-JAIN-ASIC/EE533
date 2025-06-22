module signExtended
#(
   parameter INSTR_WIDTH = 32,
   parameter DATA_WIDTH  = 64
)
(
   input       [INSTR_WIDTH - 1 : 0] instruction,
   output      [DATA_WIDTH  - 1 : 0] immediate
);


    wire is_RType  = (instruction[27:20] == 8'b0000_1000) || (instruction[27:20] == 8'b0001_1010) || (instruction[27:20] == 8'b0000_0100);
	wire is_IType  = (instruction[27:20] == 8'b0010_1000) || (instruction[27:20] == 8'b0011_1010) || (instruction[27:20] == 8'b0010_0100);
	wire is_Branch = (instruction[27:20] == 8'b1010_0000) || (instruction[27:20] == 8'b1010_0001) || (instruction[27:20] == 8'b1011_0000) || (instruction[27:20] == 8'b1011_0001);
	wire is_DType  = (instruction[27:20] == 8'b0101_0001) || (instruction[27:20] == 8'b0101_1001) || (instruction[27:20] == 8'b0101_0000);

	assign immediate = is_RType  ? 64'd0 :
					   is_IType  ? {{52{1'd0}}, instruction[11:0]} :
					   is_Branch ? {{44{1'd0}}, instruction[19:0]} :
					   is_DType  ? {{52{1'd0}}, instruction[11:0]} :
								   64'd0;


endmodule
