`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:14 02/20/2025 
// Design Name: 
// Module Name:    pipe_EXMEM
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Pipeline Register for EX/MEM
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


module pipe_EXMEM
	#(
		parameter DATA_WIDTH  = 64,
		parameter REGFILE_ADDRESS_WIDTH = 3
	) 
	(
		input         			   			   clk, 				 // Clock
		input					   			   reset, 				 // Reset
		input 					   			   enable,              // Enable (for stalls)
		
		
		input  [DATA_WIDTH-1:0]    			   alu_result_in,       // ALU result from EX stage
		input  [DATA_WIDTH-1:0]	   			   mem_write_data_in,   // Data to be written to memory
		input  [REGFILE_ADDRESS_WIDTH-1:0] 	   rd_in,               // Destination register
		
		input 								   write_back_in,		// Control signal: Write back?
		//input        			   			   reg_write_in,        // Control signal: Write to register?
		//input        			   			   mem_read_in,         // Control signal: Read from memory?
		input        			   			   mem_write_enable_in,        // Control signal: Write to memory?
		
		output reg 							   write_back_out,       // Control signal: Write back?
		output reg [DATA_WIDTH-1:0] 		   alu_result_out,  	 // ALU result to MEM stage
		output reg [DATA_WIDTH-1:0] 		   mem_write_data_out,   // Data for memory write
		output reg [4:0]  		   			   rd_out,          	 // Destination register
		//output reg        		   			   reg_write_out,   	 // Control: Write to register?
		//output reg        		   			   mem_read_out,     // Control: Read from memory?
		output reg        		   			   mem_write_enable_out    	 // Control: Write to memory?
	);
   
   
	always @(posedge clk or posedge reset) begin
		if (reset) begin
			alu_result_out       <= 32'b0;
			mem_write_data_out   <= 32'b0;
			rd_out               <= 5'b0;
			//reg_write_out      <= 1'b0;
			//mem_read_out       <= 1'b0;
			mem_write_enable_out <= 1'b0;
			write_back_out       <= 1'b0;
		end else if (enable) begin
			alu_result_out            <= alu_result_in;
			mem_write_data_out        <= mem_write_data_in;
			rd_out                    <= rd_in;
			//reg_write_out           <= reg_write_in;
			//mem_read_out            <= mem_read_in;
			mem_write_enable_out      <= mem_write_enable_in;
			write_back_out            <= write_back_in;
		end
	end
	
endmodule
