module Adder_Subtractor_32bit (
    input wire [31:0] A,       // First 32-bit input
    input wire [31:0] B,       // Second 32-bit input
    input wire SUB,            // Control signal (0: Addition, 1: Subtraction)
    output wire [31:0] Result, // 32-bit output
    output wire CarryOut       // Carry/Borrow output
);

    wire [31:0] B_mux;         // XOR-ed version of B (for subtraction)
    wire CarryIn;              // Carry input for addition/subtraction

    assign B_mux = B ^ {32{SUB}};  // If SUB=1, B is complemented (Two's complement)
    assign CarryIn = SUB;          // Carry-in is 1 for subtraction, 0 for addition

    assign {CarryOut, Result} = A + B_mux + CarryIn;  // Perform addition or subtraction

endmodule
