`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:56 02/22/2025 
// Design Name: 
// Module Name:    imem32x512_tb 
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
module imem32x512_tb;

// Testbench signals
reg clk;
reg [8:0] addr;     // 9-bit address for 512-depth BRAM
wire [31:0] dout; // 32-bit data output

// Instantiate the imem module
imem32x512 imem (
    .clk(clk),
    .addr(addr),
    .dout(dout)
);

// Clock generation
always begin
    clk = 0; #5;
    clk = 1; #5;
end

// Stimulus generation (reading from BRAM)
initial begin

    // Test a few read addresses
	 #10 addr = 9'b000000000;   // Read address 1
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
    #10 addr = 9'b000000001;   // Read address 1
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
    #10 addr = 9'b000000010;   // Read address 2
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
	 #10 addr = 9'b000000011;   // Read address 3
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
    #10 addr = 9'b000000100;   // Read address 4
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
	 #10 addr = 9'b000000101;   // Read address 5
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
	 #10 addr = 9'b000000110;   // Read address 6
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
	 #10 addr = 9'b000000111;   // Read address 7
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
    #10 addr = 9'b000001000;   // Read address 8
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
	 #10 addr = 9'b000001001;   // Read address 9
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
	 #10 addr = 9'b000001010;   // Read address 10
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
    #10 addr = 9'b000010000;   // Read address 16
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);
    #10 addr = 9'b111111111;   // Read the last address (511)
	 $monitor("Time = %0t, addr = %b, dout = %b", $time, addr, dout);

    // Finish simulation after some time
    #50 $finish;
end

initial begin
    $dumpfile("imem32x512_waveform.vcd");  // VCD file for waveform viewing
    $dumpvars(0, imem32x512_tb);
end

endmodule
