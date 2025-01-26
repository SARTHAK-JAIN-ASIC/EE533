module Comparator_32bit (
    input wire [31:0] A,      // 32-bit input A
    input wire [31:0] B,      // 32-bit input B
    output wire A_gt_B,       // Output: 1 if A > B
    output wire A_lt_B,       // Output: 1 if A < B
    output wire A_eq_B        // Output: 1 if A == B
);

    assign A_gt_B = (A > B) ? 1'b1 : 1'b0;  // A > B condition
    assign A_lt_B = (A < B) ? 1'b1 : 1'b0;  // A < B condition
    assign A_eq_B = (A == B) ? 1'b1 : 1'b0; // A == B condition

endmodule
