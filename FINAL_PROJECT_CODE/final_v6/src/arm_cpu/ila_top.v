`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:58:33 02/11/2025 
// Design Name: 
// Module Name:    ila_top 
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
	 parameter THRESHOLD_WIDTH = 3 ,	     // 2**THRESHOLD_WIDTH-1 means trigger_cnt max = 7 decimal
	 parameter UDP_REG_SRC_WIDTH = 2   		 // copied from ids.v

)(
    input clk,                              // System clock
    input rst,                              // Reset
	input [DATA_WIDTH-1:0] data_in,         // Signal to capture
	input trigger, //My trigger signal
	

	// --- Register interface
      input                               reg_req_in,
      input                               reg_ack_in,
      input                               reg_rd_wr_L_in,
      input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
      input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
      input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,

      output                              reg_req_out,
      output                              reg_ack_out,
      output                              reg_rd_wr_L_out,
      output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
      output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
      output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out
	  
);

// Internal register for control and capturing
reg [ADDR_WIDTH-1:0] write_addr;
reg [ADDR_WIDTH-1:0] read_addr;
reg bram_wea;                      // Write enable for BRAM
// reg [THRESHOLD_WIDTH-1:0] trigger_cnt;
reg [3:0] trigger_cnt;
reg trigger_signal;
reg read_en;
wire [DATA_WIDTH-1:0] captured_data; 
reg [31:0] captured_data_regs [0:9];  // Register to hold the captured data

wire [31:0]                   pattern_high;

reg [31:0] ila_upper_0;
reg [31:0] ila_lower_0;
reg [31:0] ila_upper_1;
reg [31:0] ila_lower_1;
reg [31:0] ila_upper_2;
reg [31:0] ila_lower_2;
reg [31:0] ila_upper_3;
reg [31:0] ila_lower_3;
reg [31:0] ila_upper_4;
reg [31:0] ila_lower_4;
reg [31:0] ila_upper_5;
reg [31:0] ila_lower_5;
reg [31:0] ila_upper_6;
reg [31:0] ila_lower_6;
reg [31:0] ila_upper_7;
reg [31:0] ila_lower_7;

reg [31:0] ila_upper_8;
reg [31:0] ila_lower_8;
reg [31:0] ila_upper_9;
reg [31:0] ila_lower_9;
reg [31:0] ila_upper_10;
reg [31:0] ila_lower_10;
reg [31:0] ila_upper_11;
reg [31:0] ila_lower_11;
reg [31:0] ila_upper_12;
reg [31:0] ila_lower_12;
reg [31:0] ila_upper_13;
reg [31:0] ila_lower_13;
reg [31:0] ila_upper_14;
reg [31:0] ila_lower_14;
reg [31:0] ila_upper_15;
reg [31:0] ila_lower_15;

reg [3:0] capture_cnt; 

reg stop;

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


// Instantiate generic_regs to connect to memory map
generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`ILA_TOP_BLOCK_ADDR),          // Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH      (`ILA_TOP_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (0),                 // Number of sw regs
      .NUM_HARDWARE_REGS   (32)                  // Number of hw regs
   ) ila_generic_regs(
      .reg_req_in       (reg_req_in),
      .reg_ack_in       (reg_ack_in),
      .reg_rd_wr_L_in   (reg_rd_wr_L_in),
      .reg_addr_in      (reg_addr_in),
      .reg_data_in      (reg_data_in),
      .reg_src_in       (reg_src_in),

      .reg_req_out      (reg_req_out),
      .reg_ack_out      (reg_ack_out),
      .reg_rd_wr_L_out  (reg_rd_wr_L_out),
      .reg_addr_out     (reg_addr_out),
      .reg_data_out     (reg_data_out),
      .reg_src_out      (reg_src_out),

      // --- counters interface
      .counter_updates  (),
      .counter_decrement(),

      // --- SW regs interface
      .software_regs    (pattern_high),

      // --- HW regs interface
      .hardware_regs    ({ila_upper_0,
						  ila_lower_0,	
						  ila_upper_1,
						  ila_lower_1,
						  ila_upper_2,
						  ila_lower_2,
						  ila_upper_3,
						  ila_lower_3,
						  ila_upper_4,
						  ila_lower_4,
						  ila_upper_5,
						  ila_lower_5,
						  ila_upper_6,
						  ila_lower_6,
						  ila_upper_7,
						  ila_lower_7,
						  ila_upper_8,
                          ila_lower_8,
                          ila_upper_9,
                          ila_lower_9,
                          ila_upper_10,
                          ila_lower_10,
                          ila_upper_11,
                          ila_lower_11,
                          ila_upper_12,
                          ila_lower_12,
                          ila_upper_13,
                          ila_lower_13,
                          ila_upper_14,
                          ila_lower_14,
                          ila_upper_15,
                          ila_lower_15


						  }),

      .clk              (clk),
      .reset            (reset)
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
			
			/*
			 // Reset the entire captured_data_regs array to 0
			captured_data_regs[0] <= 32'hBADABDAB;
			captured_data_regs[1] <= 32'hBADABDAB;
			captured_data_regs[2] <= 32'hBADABDAB;
			captured_data_regs[3] <= 32'hBADABDAB;
			captured_data_regs[4] <= 32'hBADABDAB;
			captured_data_regs[5] <= 32'hBADABDAB;
			captured_data_regs[6] <= 32'hBADABDAB;
			captured_data_regs[7] <= 32'hBADABDAB;
			captured_data_regs[8] <= 32'hBADABDAB;
			captured_data_regs[9] <= 32'hBADABDAB;
			*/
			
			// Reset the entire captured_data_regs array to 0
			ila_upper_0 <= 32'hBADABDAB;
			ila_lower_0 <= 32'hBADABDAB;
			ila_upper_1 <= 32'hBADABDAB;
			ila_lower_1 <= 32'hBADABDAB;
			ila_upper_2 <= 32'hBADABDAB;
			ila_lower_2 <= 32'hBADABDAB;
			ila_upper_3 <= 32'hBADABDAB;
			ila_lower_3 <= 32'hBADABDAB;
			ila_upper_4 <= 32'hBADABDAB;
			ila_lower_4 <= 32'hBADABDAB;
			ila_upper_5 <= 32'hBADABDAB;
			ila_lower_5 <= 32'hBADABDAB;
			ila_upper_6 <= 32'hBADABDAB;
			ila_lower_6 <= 32'hBADABDAB;
			ila_upper_7 <= 32'hBADABDAB;
			ila_lower_7 <= 32'hBADABDAB;
			ila_upper_8    <= 32'hBADABDAB;
			ila_lower_8    <= 32'hBADABDAB;
			ila_upper_9    <= 32'hBADABDAB;
			ila_lower_9    <= 32'hBADABDAB;
			ila_upper_10   <= 32'hBADABDAB;
			ila_lower_10   <= 32'hBADABDAB;
			ila_upper_11   <= 32'hBADABDAB;
			ila_lower_11   <= 32'hBADABDAB;
			ila_upper_12   <= 32'hBADABDAB;
			ila_lower_12   <= 32'hBADABDAB;
			ila_upper_13   <= 32'hBADABDAB;
			ila_lower_13   <= 32'hBADABDAB;
			ila_upper_14   <= 32'hBADABDAB;
			ila_lower_14   <= 32'hBADABDAB;
			ila_upper_15   <= 32'hBADABDAB;
			ila_lower_15   <= 32'hBADABDAB;
			

			
			capture_cnt <= 0;
			stop <= 0;
        end else if (!stop) begin
			write_addr <= write_addr + 1; //always increment write_addr
		    bram_wea <= 1; //always enable writing to bram
		    
			  

		    if (!trigger_signal) begin // if no trigger, just keep writing into bram

				if(trigger) begin
				//if(data_in) begin
					trigger_signal <= 1; //set trigger
					trigger_cnt <= 1; //set trigger_cnt to 1
					//read_addr <= write_addr - 8; //when trigger, set read_addr to a couple addresses before the trigger went high to get before data before the trigger.
					read_addr <= write_addr - 7; //Set read_addr to 3 addressees before trigger so we have some data on before trigger.
					//read_addr <= write_addr;
					read_en <= 1;
				end
				
			end
			 else if (trigger_signal && trigger_cnt == 15) begin //if the trigger has been on for the threshold width (which is 4 rn)
			//else if (trigger_signal && (trigger_cnt == 14)) begin //if the trigger has been on for the threshold width (which is 4 rn)
					read_en <= 0;
					trigger_signal <= 0;
                    stop <= 1;
			end
			
			else if (trigger_signal) begin // Need this statement to be the last because this should be least priority.
					trigger_cnt <= trigger_cnt + 1;
					capture_cnt <= capture_cnt + 1;
					read_addr <= read_addr + 1;	
					
					case(capture_cnt)
						4'b0000: begin
							ila_upper_0 <= captured_data[63:32];  // Upper 32 bits
							ila_lower_0 <= captured_data[31:0];  // Lower 32 bits
						end
						4'b0001: begin
							ila_upper_1 <= captured_data[63:32];
							ila_lower_1 <= captured_data[31:0];
						end
						4'b0010: begin
							ila_upper_2 <= captured_data[63:32];
							ila_lower_2 <= captured_data[31:0];
						end
						4'b0011: begin
							ila_upper_3 <= captured_data[63:32];
							ila_lower_3 <= captured_data[31:0];
						end
						4'b0100: begin
							ila_upper_4 <= captured_data[63:32];
							ila_lower_4 <= captured_data[31:0];
						end
						4'b0101: begin
							ila_upper_5 <= captured_data[63:32];
							ila_lower_5 <= captured_data[31:0];
						end
						4'b0110: begin
							ila_upper_6 <= captured_data[63:32];
							ila_lower_6 <= captured_data[31:0];
						end
						4'b0111: begin
							ila_upper_7 <= captured_data[63:32];
							ila_lower_7 <= captured_data[31:0];
						end
						4'b1000: begin
							ila_upper_8 <= captured_data[63:32];
							ila_lower_8 <= captured_data[31:0];
						end
						4'b1001: begin
							ila_upper_9 <= captured_data[63:32];
							ila_lower_9 <= captured_data[31:0];
						end
						4'b1010: begin
							ila_upper_10 <= captured_data[63:32];
							ila_lower_10 <= captured_data[31:0];
						end
						4'b1011: begin
							ila_upper_11 <= captured_data[63:32];
							ila_lower_11 <= captured_data[31:0];
						end
						4'b1100: begin
							ila_upper_12 <= captured_data[63:32];
							ila_lower_12 <= captured_data[31:0];
						end
						4'b1101: begin
							ila_upper_13 <= captured_data[63:32];
							ila_lower_13 <= captured_data[31:0];
						end
						4'b1110: begin
							ila_upper_14 <= captured_data[63:32];
							ila_lower_14 <= captured_data[31:0];
						end
						4'b1111: begin
							ila_upper_15 <= captured_data[63:32];
							ila_lower_15 <= captured_data[31:0];
						end
					endcase
			end
			

					
					
					
					
			
			

				
		  end
				
		  
		  
    end




endmodule
