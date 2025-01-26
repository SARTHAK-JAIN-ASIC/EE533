`timescale 1ns / 1ps

module ALU_32bit_tb;

    // Testbench Signals
    reg [31:0] A, B;          // ALU operands
    reg [4:0] ShiftAmt;       // Shift amount for shifter
    reg [2:0] ALU_Op;         // ALU control signal
    reg CLK, RST;             // Clock & Reset signals
    wire [31:0] Result;       // ALU output
    wire Zero, CarryOut;      // Flags
    wire A_gt_B, A_lt_B, A_eq_B; // Comparison outputs

    // Instantiate the ALU module
    ALU_32bit uut (
        .A(A),
        .B(B),
        .ShiftAmt(ShiftAmt),
        .ALU_Op(ALU_Op),
        .CLK(CLK),
        .RST(RST),
        .Result(Result),
        .Zero(Zero),
        .CarryOut(CarryOut),
        .A_gt_B(A_gt_B),
        .A_lt_B(A_lt_B),
        .A_eq_B(A_eq_B)
    );

    // Clock Generation (50 MHz -> Period = 10ns)
    always #5 CLK = ~CLK;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #10000 
        $finish;
    end

    // Stimulus block
    initial begin
        // Initialize signals
        CLK = 0;
        RST = 1;    // Apply reset
        #10;
        RST = 0;    // Release reset

        // Test Case 1: Addition (A + B)
        A = 32'd10; B = 32'd5; ALU_Op = 3'b000; 
        #10;
        $display("ADD: A = %d, B = %d | Result = %d | CarryOut = %b | Zero = %b", A, B, Result, CarryOut, Zero);

        // Test Case 2: Subtraction (A - B)
        A = 32'd15; B = 32'd20; ALU_Op = 3'b001; 
        #10;
        $display("SUB: A = %d, B = %d | Result = %d | CarryOut = %b | Zero = %b", A, B, Result, CarryOut, Zero);

        // Test Case 3: Left Shift (A << ShiftAmt)
        A = 32'd4; ShiftAmt = 5'd2; ALU_Op = 3'b010; 
        #10;
        $display("LSHIFT: A = %d, ShiftAmt = %d | Result = %d", A, ShiftAmt, Result);

        // Test Case 4: Right Shift (A >> ShiftAmt)
        A = 32'd64; ShiftAmt = 5'd3; ALU_Op = 3'b011; 
        #10;
        $display("RSHIFT: A = %d, ShiftAmt = %d | Result = %d", A, ShiftAmt, Result);

        // Test Case 5: Comparison (A ? B)
        A = 32'd25; B = 32'd25; ALU_Op = 3'b100; 
        #10;
        $display("CMP: A = %d, B = %d | A_eq_B = %b | A_gt_B = %b | A_lt_B = %b", A, B, A_eq_B, A_gt_B, A_lt_B);

        // Test Case 6: Counter
        ALU_Op = 3'b101;
        #50; // Let the counter run for a few clock cycles
        $display("COUNTER: Result = %d", Result);

        // End Simulation
        $finish;
    end
endmodule
