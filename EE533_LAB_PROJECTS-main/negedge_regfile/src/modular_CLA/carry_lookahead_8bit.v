module carry_lookahead_8bit (
    input [7:0]  op1_i, op2_i,
    input        cin,
    output [7:0] res_o,
    output       cout,
    output       G_out,
    output       P_out
);

    wire [7:0] G, P;
    wire [8:0] C;

    assign C[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : CLA_LOOP
            assign G[i] = op1_i[i] & op2_i[i];
            assign P[i] = op1_i[i] ^ op2_i[i];
            assign C[i+1] = G[i] | (P[i] & C[i]);
            assign res_o[i] = op1_i[i] ^ op2_i[i] ^ C[i];
        end
    endgenerate

    assign cout = C[8];
    assign G_out = G[7];
    assign P_out = P[7];

endmodule