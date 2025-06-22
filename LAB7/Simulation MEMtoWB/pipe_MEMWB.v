`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:14 02/20/2025 
// Design Name: 
// Module Name:    pipe_MEMWB
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Pipeline Register for MEM/WB stage
//
//////////////////////////////////////////////////////////////////////////////////
// Pipelined Datapath

`define CLOG2(x) \
(x <= 2)   ? 1 : \
(x <= 4)   ? 2 : \
(x <= 8)   ? 3 : \
(x <= 16)  ? 4 : \
(x <= 32)  ? 5 : \
(x <= 64)  ? 6 : \
(x <= 128) ? 7 : \
(x <= 256) ? 8 : \
(x <= 512) ? 9 : \
(x <= 1024) ? 10 : \
            -1


module pipe_MEMWB 
	#(
		parameter DATA_WIDTH  = 64,
		parameter REGFILE_ADDRESS_WIDTH  = 5
	) 
	(
    input         					              clk,                   // Clock
	input         					              reset,                 // Reset
	input         					              enable,                // Enable (for stalls)
    
	
	input  [DATA_WIDTH-1:0]                       mem_read_data_in,      // Data read from memory
    input  [REGFILE_ADDRESS_WIDTH-1:0]            rd_in,                 // Destination register
	input  [DATA_WIDTH-1:0]						  reg_data_in,			 // REG_data
    input                                         mem_to_reg_in,         // Control signal: Select memory or ALU result
    
    output reg [DATA_WIDTH-1:0]                   mem_read_data_out,     // Data read from memory
    output reg [REGFILE_ADDRESS_WIDTH-1:0]        rd_out,                // Destination register
	output reg [DATA_WIDTH-1:0]					  reg_data_out,			 // REG_data
    output reg                                    mem_to_reg_out         // Control: Select memory or ALU result
);

always @(posedge clk or posedge reset) begin
    if (reset || !enable) begin
        mem_read_data_out <= 64'b0;
        rd_out            <= 5'b0;
        reg_data_out 	  <= 64'b0;
        mem_to_reg_out    <= 1'b0;
    end else if (enable) begin
        mem_read_data_out <= mem_read_data_in;
        rd_out            <= rd_in;
        reg_data_out      <= reg_data_in;
        mem_to_reg_out    <= mem_to_reg_in;
    end
end
	
endmodule
