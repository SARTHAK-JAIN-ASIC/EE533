module Shifter_32bit (
    input wire [31:0] A,       // 32-bit input data
    input wire [4:0] ShiftAmt, // Shift amount (0 to 31)
    input wire DIR,            // Direction (0: Left Shift, 1: Right Shift)
    output reg [31:0] Result   // Shifted output
);

    always @(*) begin
        if (DIR == 0)
            Result = A << ShiftAmt;  // Left Shift
        else
            Result = A >> ShiftAmt;  // Right Shift
    end

endmodule
