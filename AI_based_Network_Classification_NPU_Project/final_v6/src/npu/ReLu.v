module ReLu (
    input [7:0] data_in,   
	input valid_in,
	
	output valid_out,

    output [7:0] result
);
	
	assign valid_out = valid_in;
	assign result = (data_in[7]) ? 8'h00 : data_in;

endmodule
