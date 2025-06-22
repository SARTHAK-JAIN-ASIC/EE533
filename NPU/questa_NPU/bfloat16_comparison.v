module bfloat16_comparison (
    input [15:0] a,      // bfloat16 number a
    input [15:0] b,      // bfloat16 number b
    output reg [15:0] result    // result: 1 if a > b, 0 if a <= b
);

    // Split bfloat16 into sign, exponent, and fraction
    wire [7:0] a_exp = a[14:7];  // Exponent of a
    wire [7:0] b_exp = b[14:7];  // Exponent of b
    wire [6:0] a_frac = a[6:0];  // Fraction of a
    wire [6:0] b_frac = b[6:0];  // Fraction of b
    wire a_sign = a[15];  // Sign of a (1 = negative, 0 = positive)
    wire b_sign = b[15];  // Sign of b (1 = negative, 0 = positive)

    always @(*) begin
        // Default to a <= b (result = 0)
        result = 16'h0000;

        // Case 1: Compare the sign bit first
        if (a_sign && !b_sign) begin
            result = b;  // a is negative, b is positive
        end else if (!a_sign && b_sign) begin
            result = a;  // a is positive, b is negative
        end else begin
            // Case 2: If signs are the same, compare the exponent
            if (a_exp > b_exp) begin
                result = a;  // a has a larger exponent
            end else if (a_exp < b_exp) begin
                result = b;  // b has a larger exponent
            end else begin
                // Case 3: If exponents are equal, compare the fraction (mantissa)
                if (a_frac > b_frac) begin
                    result = a;  // a has a larger fraction
                end else begin
                    result = b;  // b has a larger fraction or they are equal
                end
            end
        end
    end
endmodule
