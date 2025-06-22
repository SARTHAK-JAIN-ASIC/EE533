module ReLu (
    input [7:0] data_in,   

    output [7:0] result
);

	assign result = (data_in[7]) ? 8'h00 : data_in;

endmodule
