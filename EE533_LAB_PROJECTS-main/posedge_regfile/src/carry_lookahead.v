module carry_lookahead 
#(
   parameter DATA_WIDTH = 64
)
(
    input [63:0]  op1_i, op2_i,
    input         cin,
    input         add_op_i,
    output [63:0] res_o,
    output        cout,
    output        a_gt_b,
    output        a_lt_b,
    output        a_eq_b
);

    wire [63:0] inv_op2;
    wire [7:0] G [7:0];
    wire [7:0] P [7:0];
    wire [8:0] C [8:0]; // C[0] to C[8] for 8 stages
    wire [63:0] res_unsigned;
    wire res_negative;

    assign inv_op2 = add_op_i ? op2_i : ~op2_i; // Invert op2_i if it's a subtraction
    assign C[0][0] = add_op_i ? cin : 1; // Set initial carry-in

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : CLA_8BIT_LOOP
            wire [7:0] op1_slice, op2_slice;
            assign op1_slice = op1_i[8*i + 7 : 8*i];
            assign op2_slice = inv_op2[8*i + 7 : 8*i];

            carry_lookahead_8bit cla_8bit (
                .op1_i(op1_slice),
                .op2_i(op2_slice),
                .cin(C[i][0]),
                .res_o(res_unsigned[8*i + 7 : 8*i]),
                .cout(C[i+1][0]),
                .G_out(G[i]),
                .P_out(P[i])
            );
        end
    endgenerate

    assign cout = C[8][0]; // Final carry-out
    assign res_negative = ~add_op_i & (C[8][0] ^ op1_i[63] ^ inv_op2[63]); // Check if result is negative
    assign res_o = res_negative ? {{(DATA_WIDTH-1){1'b1}}, res_unsigned} : res_unsigned; // Sign-extend if negative

    assign a_gt_b = (~a_lt_b) & (~a_eq_b); // op1 > op2
    assign a_lt_b = (op1_i < op2_i);       // op1 < op2
    assign a_eq_b = (op1_i == op2_i);     // op1 == op2

endmodule