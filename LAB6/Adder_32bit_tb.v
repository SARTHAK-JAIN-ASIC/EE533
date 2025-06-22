`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:54:16 01/25/2025 
// Design Name: 
// Module Name:    Adder_32bit_tb 
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
module Adder_32bit_tb;

// Declare the inputs and outputs
    reg [31:0] A, B;
	reg Cin;   
    wire [31:0] Sum;
	wire Cout;  

    // Instantiate the 32-bit adder 
    Adder_32bit uut (
        .A(A), 
        .B(B), 
        .Cin(Cin),
        .Sum(Sum), 
        .Cout(Cout)
    );
	


    // Stimulus generation (test cases)
    initial begin
        // Initialize inputs and clock
		A = 32'b0;
		B = 32'b0;
		Cin = 1'b0;

		// Wait for a few clock cycles
		#60;

		// Test Case 1
		A = 32'h0000FFFF;  
		B = 32'h0000FFFF;  
		Cin = 1'b0;       
		#30;              // Wait for signals to propagate

		// Display results
		$display("Test 1 -> A = %b | %h, B = %b | %h, Cin = %b, Sum = %b | %h, Cout = %b, TIME = %t", A, A, B, B, Cin, Sum, Sum, Cout, $time);

		// Test Case 2
		A = 32'h000AA00;  
		B = 32'h0005500;  
		Cin = 1'b0;       
		#30;              // Wait for signals to propagate

		// Display results
		$display("Test 2 -> A = %b | %h, B = %b | %h, Cin = %b, Sum = %b | %h, Cout = %b, TIME = %t", A, A, B, B, Cin, Sum, Sum, Cout, $time);

		// Test Case 3: Large numbers with carry-out
		A = 32'hFFFFFFFF;  
		B = 32'hFFFFFFFF;  
		Cin = 1'b0;       // Carry-in = 1
		#30;              // Wait for signals to propagate

		// Display results
		$display("Test 3 -> A = %b | %h, B = %b | %h, Cin = %b, Sum = %b | %h, Cout = %b, TIME = %t", A, A, B, B, Cin, Sum, Sum, Cout, $time);

		// Test Case 4: Small numbers
		A = 32'b00000001;  // A = 1
		B = 32'b00000011;  // B = 3
		Cin = 1'b1;       // Carry-in = 1
		#30;              // Wait for signals to propagate

		// Display results
		$display("Test 4 -> A = %b | %h, B = %b | %h, Cin = %b, Sum = %b | %h, Cout = %b, TIME = %t", A, A, B, B, Cin, Sum, Sum, Cout, $time);
	

		// End simulation
		$finish;
    end

    // Monitor outputs on console
//    initial begin
//        $monitor("A = %b, B = %b, Cin = %b | Sum = %b, Cout = %b", A, B, Cin, Sum, Cout);
//    end


endmodule