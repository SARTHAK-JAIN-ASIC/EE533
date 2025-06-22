module Max_Find_10_Bfloat16 (
    input clk,
    input reset,

    input [15:0] input_0,   // 10 bfloat16 inputs
    input [15:0] input_1,
    input [15:0] input_2,
    input [15:0] input_3,
    input [15:0] input_4,
    input [15:0] input_5,
    input [15:0] input_6,
    input [15:0] input_7,
    input [15:0] input_8,
    input [15:0] input_9,

    output reg [3:0]  prediction,
    output reg [15:0] final_computation
);

    wire [15:0] max_0_1, max_2_3, max_4_5, max_6_7, max_8_9;
    wire [15:0] max_0_3, max_4_7, max_0_7, max_0_9;

    // Pairwise comparisons (combinational modules)
    /* bfloat16_comparison comp_0_1 (.a(input_0), .b(input_1), .result(max_0_1));
    bfloat16_comparison comp_2_3 (.a(input_2), .b(input_3), .result(max_2_3));
    bfloat16_comparison comp_4_5 (.a(input_4), .b(input_5), .result(max_4_5));
    bfloat16_comparison comp_6_7 (.a(input_6), .b(input_7), .result(max_6_7));
    bfloat16_comparison comp_8_9 (.a(input_8), .b(input_9), .result(max_8_9));

    bfloat16_comparison comp_0_3 (.a(max_0_1), .b(max_2_3), .result(max_0_3));
    bfloat16_comparison comp_4_7 (.a(max_4_5), .b(max_6_7), .result(max_4_7));
    bfloat16_comparison comp_0_7 (.a(max_0_3), .b(max_4_7), .result(max_0_7));
	
    bfloat16_comparison comp_0_9 (.a(max_0_7), .b(max_8_9), .result(max_0_9)); */
	
	bfloat16_comparison comp_0_1 (.a(input_0), .b(input_1), .result(max_0_1));
    bfloat16_comparison comp_2_3 (.a(input_2), .b(input_3), .result(max_2_3));
	bfloat16_comparison comp_0_9 (.a(max_0_1), .b(max_2_3), .result(max_0_9)); 

    always @(posedge clk) begin
        if (reset) begin
            final_computation <= 16'h0000;
            prediction <= 4'hF; // Default invalid prediction
        end else begin
            final_computation <= max_0_9;

            // Compare against inputs to determine which index it came from
            if (max_0_9 == input_0)
                prediction <= 4'h0;
            else if (max_0_9 == input_1)
                prediction <= 4'h1;
            else if (max_0_9 == input_2)
                prediction <= 4'h2;
            else if (max_0_9 == input_3)
                prediction <= 4'h3;
            else if (max_0_9 == input_4)
                prediction <= 4'h4;
            else if (max_0_9 == input_5)
                prediction <= 4'h5;
            else if (max_0_9 == input_6)
                prediction <= 4'h6;
            else if (max_0_9 == input_7)
                prediction <= 4'h7;
            else if (max_0_9 == input_8)
                prediction <= 4'h8;
            else if (max_0_9 == input_9)
                prediction <= 4'h9;
            else
                prediction <= 4'hF; // Fallback if not matched
        end
    end

endmodule
