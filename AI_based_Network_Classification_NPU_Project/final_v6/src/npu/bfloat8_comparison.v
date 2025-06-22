module bfloat8_comparison (
    input [7:0] a,      // bfloat16 number a
    input [7:0] b,      // bfloat16 number b
    output reg [7:0] result    // result: 1 if a > b, 0 if a <= b
);

    // Split bfloat16 into sign, exponent, and fraction
    wire [3:0] a_exp = a[6:3];  // Exponent of a
    wire [3:0] b_exp = b[6:3];  // Exponent of b
    wire [2:0] a_frac = a[2:0];  // Fraction of a
    wire [2:0] b_frac = b[2:0];  // Fraction of b
    wire a_sign = a[7];  // Sign of a (1 = negative, 0 = positive)
    wire b_sign = b[7];  // Sign of b (1 = negative, 0 = positive)

    always @(*) begin
        // Default to a <= b (result = 0)
        result = 8'h00;

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
