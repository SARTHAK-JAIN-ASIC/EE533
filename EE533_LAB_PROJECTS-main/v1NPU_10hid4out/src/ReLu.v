module ReLu (
    input [15:0] data_in,   

    output [15:0] result
);

	assign result = (data_in[15]) ? 16'h0000 : data_in;

endmodule
