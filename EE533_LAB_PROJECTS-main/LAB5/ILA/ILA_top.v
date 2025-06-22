`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:33 02/11/2025 
// Design Name: 
// Module Name:    ILA_top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ila_top#(
	 parameter DATA_WIDTH      = 64,         // Data width for captured signals
     parameter ADDR_WIDTH      = 8 ,         // Address width for BRAM (e.g., 256 samples)
	 parameter THRESHOLD_WIDTH = 4			 // 2**THRESHOLD_WIDTH means trigger_cnt max = 15 decimal

)(
    input clk,                              // System clock
    input rst,                              // Reset
	input [DATA_WIDTH-1:0] data_in,         // Signal to capture
	output [DATA_WIDTH-1:0] captured_data   // Output the captured data for debugging
);

// Internal register for control and capturing
reg [ADDR_WIDTH-1:0] write_addr;
reg [ADDR_WIDTH-1:0] read_addr;
reg bram_wea;                      // Write enable for BRAM
reg [THRESHOLD_WIDTH-1:0] trigger_cnt;
reg trigger_signal;
reg read_en;



// Instantiate BRAM 64x256
bram64x256 ila_data_in(
   .addra(write_addr),
   .addrb(read_addr),
   .clka(clk),
   .clkb(clk),
   .dina(data_in),
   .doutb(captured_data),
   .enb(read_en),
   .wea(bram_wea)
);


    // Logic for managing capture process
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            write_addr <= 0;         // Reset write address
            read_addr <= 0;          // Reset read address
            bram_wea <= 0;           // Reset write enable
			read_en <= 0;            // Reset read enable
			trigger_cnt <= 0;
			trigger_signal <=0;
        end else begin
			write_addr <= write_addr + 1; //always increment write_addr
		    bram_wea <= 1; //always enable writing to bram
		  
		    if (!trigger_signal) begin // if no trigger, just keep writing into bram
			
				if(data_in == 64'hBEEFBEEFBEEFBEEF) begin
					trigger_signal <= 1; //set trigger
					trigger_cnt <= 1; //set trigger_cnt to 1
					read_addr <= write_addr - 8; //when trigger, set read_addr to a couple addresses before the trigger went high to get before data before the trigger.
					read_en <= 1;
				end
				
			end
			else if (trigger_signal && trigger_cnt!=0) begin
					//write_addr <= write_addr + 1;
					trigger_cnt <= trigger_cnt + 1;
					read_addr <= read_addr + 1;
					
					
			end
			else if (trigger_signal && trigger_cnt == 0) begin //if the trigger has been on for the threshold width
					read_en <= 0;
					trigger_signal <= 0;
			end
		  end
				
		  
		  
    end




endmodule
