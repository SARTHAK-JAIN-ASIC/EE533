module ReLu_pipeline_reg (
    input clk,
    input reset,
	input [15:0] data_in_0,
	input [15:0] data_in_1,
	input [15:0] data_in_2,
	input [15:0] data_in_3,
	input [15:0] data_in_4,
	input [15:0] data_in_5,
	input [15:0] data_in_6,
	input [15:0] data_in_7,
	input [15:0] data_in_8,
	input [15:0] data_in_9,
	
	output reg [15:0] data_out_0,
	output reg [15:0] data_out_1,
	output reg [15:0] data_out_2,
	output reg [15:0] data_out_3,
	output reg [15:0] data_out_4,
	output reg [15:0] data_out_5,
	output reg [15:0] data_out_6,
	output reg [15:0] data_out_7,
	output reg [15:0] data_out_8,
	output reg [15:0] data_out_9
	

	
	
	
	
);


	

    always @(posedge clk or posedge reset) begin
        if (reset) begin
			data_out_0  <= 16'h0000;
			data_out_1  <= 16'h0000;
			data_out_2  <= 16'h0000;
			data_out_3  <= 16'h0000;
			data_out_4  <= 16'h0000;
			data_out_5  <= 16'h0000;
			data_out_6  <= 16'h0000;
			data_out_7  <= 16'h0000;
			data_out_8  <= 16'h0000;
			data_out_9  <= 16'h0000;
		
			
        end
		else begin
			//passthrough
			data_out_0  <= data_in_0;
			data_out_1  <= data_in_1;
			data_out_2  <= data_in_2;
			data_out_3  <= data_in_3;
			data_out_4  <= data_in_4;
			data_out_5  <= data_in_5;
			data_out_6  <= data_in_6;
			data_out_7  <= data_in_7;
			data_out_8  <= data_in_8;
			data_out_9  <= data_in_9;
		
		end
    end
endmodule
