/* module cla_hierarchical
#(
    parameter DATA_WIDTH = 64,
    parameter BLOCK_SIZE = 8  // Block size for hierarchical CLA
)
(
    input [DATA_WIDTH-1:0] op1_i, op2_i,
    input cin,
    input add_op_i,
    output [DATA_WIDTH-1:0] res_o,
    output cout,
    output a_gt_b,
    output a_lt_b,
    output a_eq_b
);

    wire [BLOCK_SIZE-1:0] sum_0, sum_1, sum_2, sum_3, sum_4, sum_5, sum_6, sum_7;
    wire block_cout_0, block_cout_1, block_cout_2, block_cout_3, block_cout_4, block_cout_5, block_cout_6, block_cout_7;

    wire a_gt_b_internal, a_lt_b_internal, a_eq_b_internal;

    // First block (0 to 7)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_0 (
        .op1_i(op1_i[7:0]),
        .op2_i(op2_i[7:0]),
        .cin(cin),
        .add_op_i(add_op_i),
        .res_o(sum_0),
        .cout(block_cout_0)
    );

    // Second block (8 to 15)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_1 (
        .op1_i(op1_i[15:8]),
        .op2_i(op2_i[15:8]),
        .cin(block_cout_0),
        .add_op_i(add_op_i),
        .res_o(sum_1),
        .cout(block_cout_1)
    );

    // Third block (16 to 23)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_2 (
        .op1_i(op1_i[23:16]),
        .op2_i(op2_i[23:16]),
        .cin(block_cout_1),
        .add_op_i(add_op_i),
        .res_o(sum_2),
        .cout(block_cout_2)
    );

    // Fourth block (24 to 31)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_3 (
        .op1_i(op1_i[31:24]),
        .op2_i(op2_i[31:24]),
        .cin(block_cout_2),
        .add_op_i(add_op_i),
        .res_o(sum_3),
        .cout(block_cout_3)
    );

    // Fifth block (32 to 39)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_4 (
        .op1_i(op1_i[39:32]),
        .op2_i(op2_i[39:32]),
        .cin(block_cout_3),
        .add_op_i(add_op_i),
        .res_o(sum_4),
        .cout(block_cout_4)
    );

    // Sixth block (40 to 47)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_5 (
        .op1_i(op1_i[47:40]),
        .op2_i(op2_i[47:40]),
        .cin(block_cout_4),
        .add_op_i(add_op_i),
        .res_o(sum_5),
        .cout(block_cout_5)
    );

    // Seventh block (48 to 55)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_6 (
        .op1_i(op1_i[55:48]),
        .op2_i(op2_i[55:48]),
        .cin(block_cout_5),
        .add_op_i(add_op_i),
        .res_o(sum_6),
        .cout(block_cout_6)
    );

    // Eighth block (56 to 63)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_7 (
        .op1_i(op1_i[63:56]),
        .op2_i(op2_i[63:56]),
        .cin(block_cout_6),
        .add_op_i(add_op_i),
        .res_o(sum_7),
        .cout(block_cout_7)
    );

    // Final carry out
    assign cout = block_cout_7;
    
    // Concatenate the results from all blocks
    assign res_o = {sum_7, sum_6, sum_5, sum_4, sum_3, sum_2, sum_1, sum_0};

    // Comparison logic for a_gt_b, a_lt_b, and a_eq_b
    assign a_lt_b_internal = (op1_i < op2_i);
    assign a_eq_b_internal = (op1_i == op2_i);
    assign a_gt_b_internal = (~a_lt_b_internal) & (~a_eq_b_internal);

    assign a_gt_b = a_gt_b_internal;
    assign a_lt_b = a_lt_b_internal;
    assign a_eq_b = a_eq_b_internal;

endmodule
 */
 
 /* module cla_hierarchical
#(
    parameter DATA_WIDTH = 64,
    parameter BLOCK_SIZE = 8  // Block size for hierarchical CLA
)
(
    input [DATA_WIDTH-1:0] op1_i, op2_i,
    input cin,
    input add_op_i,
    output [DATA_WIDTH-1:0] res_o,
    output cout,
    output a_gt_b,
    output a_lt_b,
    output a_eq_b
);

    wire [BLOCK_SIZE-1:0] sum_0, sum_1, sum_2, sum_3, sum_4, sum_5, sum_6, sum_7;
    wire block_cout_0, block_cout_1, block_cout_2, block_cout_3, block_cout_4, block_cout_5, block_cout_6, block_cout_7;

    wire a_gt_b_internal, a_lt_b_internal, a_eq_b_internal;
    wire [7:0] block_comparisons_gt, block_comparisons_lt, block_comparisons_eq;  // Store comparison results for each block

    // First block (0 to 7)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_0 (
        .op1_i(op1_i[7:0]),
        .op2_i(op2_i[7:0]),
        .cin(cin),
        .add_op_i(add_op_i),
        .res_o(sum_0),
        .cout(block_cout_0),
        .a_gt_b(block_comparisons_gt[0]),
        .a_lt_b(block_comparisons_lt[0]),
        .a_eq_b(block_comparisons_eq[0])
    );

    // Second block (8 to 15)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_1 (
        .op1_i(op1_i[15:8]),
        .op2_i(op2_i[15:8]),
        .cin(block_cout_0),
        .add_op_i(add_op_i),
        .res_o(sum_1),
        .cout(block_cout_1),
        .a_gt_b(block_comparisons_gt[1]),
        .a_lt_b(block_comparisons_lt[1]),
        .a_eq_b(block_comparisons_eq[1])
    );

    // Third block (16 to 23)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_2 (
        .op1_i(op1_i[23:16]),
        .op2_i(op2_i[23:16]),
        .cin(block_cout_1),
        .add_op_i(add_op_i),
        .res_o(sum_2),
        .cout(block_cout_2),
        .a_gt_b(block_comparisons_gt[2]),
        .a_lt_b(block_comparisons_lt[2]),
        .a_eq_b(block_comparisons_eq[2])
    );

    // Fourth block (24 to 31)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_3 (
        .op1_i(op1_i[31:24]),
        .op2_i(op2_i[31:24]),
        .cin(block_cout_2),
        .add_op_i(add_op_i),
        .res_o(sum_3),
        .cout(block_cout_3),
        .a_gt_b(block_comparisons_gt[3]),
        .a_lt_b(block_comparisons_lt[3]),
        .a_eq_b(block_comparisons_eq[3])
    );

    // Fifth block (32 to 39)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_4 (
        .op1_i(op1_i[39:32]),
        .op2_i(op2_i[39:32]),
        .cin(block_cout_3),
        .add_op_i(add_op_i),
        .res_o(sum_4),
        .cout(block_cout_4),
        .a_gt_b(block_comparisons_gt[4]),
        .a_lt_b(block_comparisons_lt[4]),
        .a_eq_b(block_comparisons_eq[4])
    );

    // Sixth block (40 to 47)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_5 (
        .op1_i(op1_i[47:40]),
        .op2_i(op2_i[47:40]),
        .cin(block_cout_4),
        .add_op_i(add_op_i),
        .res_o(sum_5),
        .cout(block_cout_5),
        .a_gt_b(block_comparisons_gt[5]),
        .a_lt_b(block_comparisons_lt[5]),
        .a_eq_b(block_comparisons_eq[5])
    );

    // Seventh block (48 to 55)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_6 (
        .op1_i(op1_i[55:48]),
        .op2_i(op2_i[55:48]),
        .cin(block_cout_5),
        .add_op_i(add_op_i),
        .res_o(sum_6),
        .cout(block_cout_6),
        .a_gt_b(block_comparisons_gt[6]),
        .a_lt_b(block_comparisons_lt[6]),
        .a_eq_b(block_comparisons_eq[6])
    );

    // Eighth block (56 to 63)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_7 (
        .op1_i(op1_i[63:56]),
        .op2_i(op2_i[63:56]),
        .cin(block_cout_6),
        .add_op_i(add_op_i),
        .res_o(sum_7),
        .cout(block_cout_7),
        .a_gt_b(block_comparisons_gt[7]),
        .a_lt_b(block_comparisons_lt[7]),
        .a_eq_b(block_comparisons_eq[7])
    );

    // Final carry out
    assign cout = block_cout_7;

    // Concatenate the results from all blocks
    assign res_o = {sum_7, sum_6, sum_5, sum_4, sum_3, sum_2, sum_1, sum_0};

    // Combine comparison results from all blocks
    assign a_lt_b_internal = |block_comparisons_lt; // If any block is less, set a_lt_b to 1
    assign a_eq_b_internal = &block_comparisons_eq; // If all blocks are equal, set a_eq_b to 1
    assign a_gt_b_internal = ~a_lt_b_internal & ~a_eq_b_internal; // If neither lt nor eq, then gt

    assign a_gt_b = a_gt_b_internal;
    assign a_lt_b = a_lt_b_internal;
    assign a_eq_b = a_eq_b_internal;

endmodule */

/* module cla_hierarchical
#(
    parameter DATA_WIDTH = 64,
    parameter BLOCK_SIZE = 8  // Block size for hierarchical CLA
)
(
    input [DATA_WIDTH-1:0] op1_i, op2_i,
    input cin,
    input add_op_i,
    output [DATA_WIDTH-1:0] res_o,
    output cout,
    output a_gt_b,
    output a_lt_b,
    output a_eq_b
);

    wire [BLOCK_SIZE-1:0] sum_0, sum_1, sum_2, sum_3, sum_4, sum_5, sum_6, sum_7;
    wire block_cout_0, block_cout_1, block_cout_2, block_cout_3, block_cout_4, block_cout_5, block_cout_6, block_cout_7;

    wire [7:0] block_comparisons_gt, block_comparisons_lt, block_comparisons_eq;  // Store comparison results for each block

    // First block (0 to 7)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_0 (
        .op1_i(op1_i[7:0]),
        .op2_i(op2_i[7:0]),
        .cin(cin),
        .add_op_i(add_op_i),
        .res_o(sum_0),
        .cout(block_cout_0),
        .a_gt_b(block_comparisons_gt[0]),
        .a_lt_b(block_comparisons_lt[0]),
        .a_eq_b(block_comparisons_eq[0])
    );

    // Second block (8 to 15)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_1 (
        .op1_i(op1_i[15:8]),
        .op2_i(op2_i[15:8]),
        .cin(block_cout_0),
        .add_op_i(add_op_i),
        .res_o(sum_1),
        .cout(block_cout_1),
        .a_gt_b(block_comparisons_gt[1]),
        .a_lt_b(block_comparisons_lt[1]),
        .a_eq_b(block_comparisons_eq[1])
    );

    // Third block (16 to 23)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_2 (
        .op1_i(op1_i[23:16]),
        .op2_i(op2_i[23:16]),
        .cin(block_cout_1),
        .add_op_i(add_op_i),
        .res_o(sum_2),
        .cout(block_cout_2),
        .a_gt_b(block_comparisons_gt[2]),
        .a_lt_b(block_comparisons_lt[2]),
        .a_eq_b(block_comparisons_eq[2])
    );

    // Fourth block (24 to 31)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_3 (
        .op1_i(op1_i[31:24]),
        .op2_i(op2_i[31:24]),
        .cin(block_cout_2),
        .add_op_i(add_op_i),
        .res_o(sum_3),
        .cout(block_cout_3),
        .a_gt_b(block_comparisons_gt[3]),
        .a_lt_b(block_comparisons_lt[3]),
        .a_eq_b(block_comparisons_eq[3])
    );

    // Fifth block (32 to 39)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_4 (
        .op1_i(op1_i[39:32]),
        .op2_i(op2_i[39:32]),
        .cin(block_cout_3),
        .add_op_i(add_op_i),
        .res_o(sum_4),
        .cout(block_cout_4),
        .a_gt_b(block_comparisons_gt[4]),
        .a_lt_b(block_comparisons_lt[4]),
        .a_eq_b(block_comparisons_eq[4])
    );

    // Sixth block (40 to 47)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_5 (
        .op1_i(op1_i[47:40]),
        .op2_i(op2_i[47:40]),
        .cin(block_cout_4),
        .add_op_i(add_op_i),
        .res_o(sum_5),
        .cout(block_cout_5),
        .a_gt_b(block_comparisons_gt[5]),
        .a_lt_b(block_comparisons_lt[5]),
        .a_eq_b(block_comparisons_eq[5])
    );

    // Seventh block (48 to 55)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_6 (
        .op1_i(op1_i[55:48]),
        .op2_i(op2_i[55:48]),
        .cin(block_cout_5),
        .add_op_i(add_op_i),
        .res_o(sum_6),
        .cout(block_cout_6),
        .a_gt_b(block_comparisons_gt[6]),
        .a_lt_b(block_comparisons_lt[6]),
        .a_eq_b(block_comparisons_eq[6])
    );

    // Eighth block (56 to 63)
    carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block_7 (
        .op1_i(op1_i[63:56]),
        .op2_i(op2_i[63:56]),
        .cin(block_cout_6),
        .add_op_i(add_op_i),
        .res_o(sum_7),
        .cout(block_cout_7),
        .a_gt_b(block_comparisons_gt[7]),
        .a_lt_b(block_comparisons_lt[7]),
        .a_eq_b(block_comparisons_eq[7])
    );

    // Final carry out
    assign cout = block_cout_7;

    // Concatenate the results from all blocks
    assign res_o = {sum_7, sum_6, sum_5, sum_4, sum_3, sum_2, sum_1, sum_0};

    // Combine comparison results from all blocks with pipelined aggregation
    // Use early exit: If a block comparison is less, no need to check further.
    wire a_lt_b_pipe, a_eq_b_pipe, a_gt_b_pipe;

    // First stage: Check comparisons for the blocks.
    assign a_lt_b_pipe = |block_comparisons_lt; // If any block is less, set a_lt_b to 1
    assign a_eq_b_pipe = &block_comparisons_eq; // If all blocks are equal, set a_eq_b to 1

    // Second stage: Final comparison logic to determine a_gt_b.
    assign a_gt_b_pipe = ~(a_lt_b_pipe | a_eq_b_pipe); // If neither lt nor eq, then gt

    // Output the results
    assign a_lt_b = a_lt_b_pipe;
    assign a_eq_b = a_eq_b_pipe;
    assign a_gt_b = a_gt_b_pipe;

endmodule */

module cla_hierarchical
#(
    parameter DATA_WIDTH = 64,  // Total width of the input operands (64 bits in this case)
    parameter BLOCK_SIZE = 8    // Block size for hierarchical CLA (2 bits wide)
)
(
    input [DATA_WIDTH-1:0] op1_i, op2_i,
    input cin,
    input add_op_i,
    output [DATA_WIDTH-1:0] res_o,
    output cout,
    output a_gt_b,
    output a_lt_b,
    output a_eq_b
);

    // Internal signals for 2-bit blocks
    wire [BLOCK_SIZE-1:0] sum [31:0];       // Array of sums for 32 blocks
    wire block_cout [31:0];                 // Array of carry-outs for 32 blocks

    // Manual instantiation of 32 CLA blocks, each 2 bits wide
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : cla_blocks
            carry_lookahead #(.DATA_WIDTH(BLOCK_SIZE)) cla_block (
                .op1_i(op1_i[(i+1)*BLOCK_SIZE-1 -: BLOCK_SIZE]),
                .op2_i(op2_i[(i+1)*BLOCK_SIZE-1 -: BLOCK_SIZE]),
                .cin(i == 0 ? cin : block_cout[i-1]), // First block gets 'cin', others get carry-out from previous block
                .add_op_i(add_op_i),
                .res_o(sum[i]),
                .cout(block_cout[i])
            );
        end
    endgenerate

    // Final carry-out (from the last block)
    assign cout = block_cout[31];

    // Concatenate the results from all 32 blocks
    assign res_o = {sum[31], sum[30], sum[29], sum[28], sum[27], sum[26], sum[25], sum[24],
                    sum[23], sum[22], sum[21], sum[20], sum[19], sum[18], sum[17], sum[16],
                    sum[15], sum[14], sum[13], sum[12], sum[11], sum[10], sum[9], sum[8],
                    sum[7], sum[6], sum[5], sum[4], sum[3], sum[2], sum[1], sum[0]};

    // Compare the values for the final result
    assign a_gt_b = (op1_i > op2_i);
    assign a_lt_b = (op1_i < op2_i);
    assign a_eq_b = (op1_i == op2_i);

endmodule
