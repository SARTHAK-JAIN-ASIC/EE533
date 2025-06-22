`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:16 01/25/2025 
// Design Name: 
// Module Name:    stage_MEMtoWB_tb 
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
module stage_MEMtoWB_tb;

    // Declare testbench signals
    reg                               clk;
    reg                               reset;
    reg                               enable;
    reg   [63:0]                      alu_result_in;
    reg   [63:0]                      mem_write_data_in;
    reg   [4:0]                       rd_in;  // REGFILE_ADDRESS_WIDTH = 5
    reg                               mem_write_in;
    reg                               write_back_in;
	
	wire [63:0] wb_data_out;
	wire [4:0] wb_rd_out;

    // Instantiate the module
    stage_MEMtoWB #(
        .DATA_WIDTH(64),
        .REGFILE_ADDRESS_WIDTH(5)
    ) mem_to_wb_stage (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .alu_result_in(alu_result_in),
        .mem_write_data_in(mem_write_data_in),
        .rd_in(rd_in),
        .mem_write_in(mem_write_in),
        .write_back_in(write_back_in),
		.wb_data_out(wb_data_out),
		.wb_rd_out(wb_rd_out)
		
    );

    // Clock generation
    always #5 clk = ~clk; // Toggle clock every 5 time units (10ns period)

    // Testbench procedure
    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;
        enable = 0;
        alu_result_in = 64'h0;
        mem_write_data_in = 64'h0;
        rd_in = 5'b0;
        mem_write_in = 0;
        write_back_in = 0;

        // Release reset after some time
        #10 reset = 0;

        // Apply test values
        #10 
		enable = 1;
        alu_result_in = 64'h00000000000FFFFF;
        mem_write_data_in = 64'h5A5A5A5A5A5A5A5A;
        rd_in = 5'b00101;
        mem_write_in = 0;
        write_back_in = 0;
		
		#10
		//enable = 1;

        // Hold values for some time
        #20;

        // Finish simulation
        $stop;
    end

endmodule
