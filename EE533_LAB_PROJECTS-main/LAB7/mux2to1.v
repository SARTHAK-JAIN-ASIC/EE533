`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:14 02/20/2025 
// Design Name: 
// Module Name:    mux2to1
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: mux2to1
//
//////////////////////////////////////////////////////////////////////////////////
// Pipelined Datapath


module mux2to1 (
    input wire [63:0]  a,      // Input a
    input wire [63:0]  b,      // Input b
    input wire sel,    // Selector
    output wire [63:0] c      // Output
);

    assign c = (sel) ? b : a;  // If sel is 1, output b; else, output a

endmodule

