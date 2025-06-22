`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:14 01/25/2025 
// Design Name: 
// Module Name:    cla_32bit
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 32-bit Carry Lookahead Adder
//
//////////////////////////////////////////////////////////////////////////////////
module cla_32bit (
    input  [31:0] A, B,
    input         Cin,
    output [31:0] Sum,
    output        Cout
);
    // Intermediate carry, generate, and propagate signals for each 4-bit block
    wire [7:0] C;  // Carry signals for each block
    wire [7:0] G;  // Generate signals for each block
    wire [7:0] P;  // Propagate signals for each block

    // Instantiate each 4-bit CLA block
    cla_4bit CLA0 (
        .A(A[3:0]), .B(B[3:0]), .Cin(Cin),
        .Sum(Sum[3:0]), .Cout(C[0]), .Gout(G[0]), .Pout(P[0])
    );

    cla_4bit CLA1 (
        .A(A[7:4]), .B(B[7:4]), .Cin(C[0]),
        .Sum(Sum[7:4]), .Cout(C[1]), .Gout(G[1]), .Pout(P[1])
    );

    cla_4bit CLA2 (
        .A(A[11:8]), .B(B[11:8]), .Cin(C[1]),
        .Sum(Sum[11:8]), .Cout(C[2]), .Gout(G[2]), .Pout(P[2])
    );

    cla_4bit CLA3 (
        .A(A[15:12]), .B(B[15:12]), .Cin(C[2]),
        .Sum(Sum[15:12]), .Cout(C[3]), .Gout(G[3]), .Pout(P[3])
    );

    cla_4bit CLA4 (
        .A(A[19:16]), .B(B[19:16]), .Cin(C[3]),
        .Sum(Sum[19:16]), .Cout(C[4]), .Gout(G[4]), .Pout(P[4])
    );

    cla_4bit CLA5 (
        .A(A[23:20]), .B(B[23:20]), .Cin(C[4]),
        .Sum(Sum[23:20]), .Cout(C[5]), .Gout(G[5]), .Pout(P[5])
    );

    cla_4bit CLA6 (
        .A(A[27:24]), .B(B[27:24]), .Cin(C[5]),
        .Sum(Sum[27:24]), .Cout(C[6]), .Gout(G[6]), .Pout(P[6])
    );

    cla_4bit CLA7 (
        .A(A[31:28]), .B(B[31:28]), .Cin(C[6]),
        .Sum(Sum[31:28]), .Cout(C[7]), .Gout(G[7]), .Pout(P[7])
    );

    // Compute carry for the next level using generate and propagate logic
    assign C[1] = G[0] | (P[0] & Cin);
    assign C[2] = G[1] | (P[1] & C[1]);
    assign C[3] = G[2] | (P[2] & C[2]);
    assign C[4] = G[3] | (P[3] & C[3]);
    assign C[5] = G[4] | (P[4] & C[4]);
    assign C[6] = G[5] | (P[5] & C[5]);
    assign C[7] = G[6] | (P[6] & C[6]);

    // Final carry-out calculation
    assign Cout = G[7] | (P[7] & C[7]);

endmodule


