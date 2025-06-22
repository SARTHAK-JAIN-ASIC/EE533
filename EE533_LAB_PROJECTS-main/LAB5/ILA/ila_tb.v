`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:46:43 02/11/2025 
// Design Name: 
// Module Name:    ila_tb 
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
module tb_ila_top;

// Testbench parameters
parameter DATA_WIDTH      = 64;
parameter ADDR_WIDTH      = 8;
parameter THRESHOLD_WIDTH = 4;

// Inputs to the DUT (Device Under Test)
reg clk;
reg rst;
reg [DATA_WIDTH-1:0] data_in;

// Outputs from the DUT
wire [DATA_WIDTH-1:0] captured_data;

// Instantiate the DUT
ila_top #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH),
    .THRESHOLD_WIDTH(THRESHOLD_WIDTH)
) uut (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .captured_data(captured_data)
);

integer i; //used for for loop


// Clock generation
always begin
    clk = ~clk;
    #5; // 10ns clock period
end

// Test stimulus
initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    data_in = 64'b0;
	 i = 0;

    // Apply reset
    rst = 1;
    #10; // Hold reset for a few clock cycles
    rst = 0;

    // Apply test DATA using a for loop
    for (i = 0; i < 10; i = i + 1) begin
        data_in = data_in + 1;  // Just increment
        #10;  // Wait for 20ns before applying next data
    end
	 
	 data_in = 64'hBEEFBEEFBEEFBEEF; //Apply the trigger case.
	 #10;
	 data_in = 0;
	 
	 // Apply test DATA using a for loop
    for (i = 0; i < 10; i = i + 1) begin
        data_in = data_in + 1;  // Just increment
        #10;  // Wait for 20ns before applying next data
    end

    // End simulation
    //$stop;
end

endmodule
