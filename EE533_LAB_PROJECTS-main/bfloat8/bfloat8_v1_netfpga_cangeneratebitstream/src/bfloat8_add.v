module bfloat8_add (
    input [7:0] a,     // First bfloat16 operand
    input [7:0] b,     // Second bfloat16 operand
    // output reg [7:0] result // Result of a + b in bfloat16 format
	output  [7:0] result // Result of a + b in bfloat16 format
);
    wire sign_a, sign_b; 
	wire [2:0] mant_a, mant_b;
	wire [3:0] exp_a, exp_b;

	
	// *** Extract components to bfloat16 ***
	assign sign_a  = a[7];
	assign sign_b  = b[7];
	assign exp_a   = a[6:3];
	assign exp_b   = b[6:3];
	assign mant_a  = a[2:0];
	assign mant_b  = b[2:0];
	
	
	// Need to make 5 bit wide in order check for overflow because the mantissa additiona is actually 8 bits wide (since we include the leading 1)
	wire [4:0] hiddenbit_mant_a = {2'b01, mant_a}; // this is 1.mantissa ; we use this becuase when we shift, the first shift needs to be 1, not 0.
	wire [4:0] hiddenbit_mant_b = {2'b01, mant_b}; // this is 1.mantissa ; we use this becuase when we shift, the first shift needs to be 1, not 0.
	
	reg [4:0] inter_mant_a , inter_mant_b; // intermediate mantissas: these hold the after-shift values
	// reg [4:0] mant_shift_amt; //mantissa shift amount
	
	reg [2:0] normalization_shift;
	// wire [2:0] normalization_shift;
	
	
	reg [4:0] sum_mant; //needs to be 5 bits to account for overflow
	reg [3:0] final_exp;
	reg [2:0] final_mant;
	reg final_sign;
	integer i;
	
	// assign result = {final_sign, final_exp, final_mant};

	
	// function [2:0] lzc4;
    // input [3:0] x;
		// begin
			// if      (x[3]) lzc4 = 0;
			// else if (x[2]) lzc4 = 1;
			// else if (x[1]) lzc4 = 2;
			// else if (x[0]) lzc4 = 3;
			// else           lzc4 = 3;
		// end
	// endfunction
	
	/* function [2:0] lzc4;
		input [3:0] x;
		begin
			// Bit 2: High only when all bits are zero (output = 4)
			lzc4[2] = ~(x[3] | x[2] | x[1] | x[0]);
			
			// Bit 1: High for counts 2 (010) or 3 (011)
			lzc4[1] = (~x[3] & ~x[2]) & (x[1] | (x[0] & ~x[1]));
			
			// Bit 0: High for counts 1 (001) or 3 (011)
			lzc4[0] = (~x[3] & x[2]) | (~x[3] & ~x[2] & ~x[1] & x[0]);
		end
	endfunction */
	
	function [2:0] lzc5;
    input [4:0] x;
    begin
        // MSB (bit 3) indicates x=00000 (output=5)
        lzc5[2] = ~|x;  // NOR reduction (all zeros)

        // Bit 1: High for counts 2,3 (010, 011) or 5 (101)
        lzc5[1] = (~x[4] & ~x[3] & (x[2] | (x[1] & ~x[2]))) | 
                 (x == 5'b00000);

        // Bit 0: High for counts 1,3,5 (001, 011, 101)
        lzc5[0] = (~x[4] & x[3]) | 
                 (~x[4] & ~x[3] & ~x[2] & x[1]) | 
                 (x == 5'b00000);
    end
endfunction
	
	

	
	
	// assign normalization_shift = ~sum_mant[4] & (sum_mant[3] ? 1 : (sum_mant[2] ? 2 : 3));
	
	function [4:0] right_shift5;
        input [4:0] in;
        input [3:0] shamt;
        begin
            case (shamt)
                4'd0:  right_shift5 = in;
                4'd1:  right_shift5 = in >> 1;
                4'd2:  right_shift5 = in >> 2;
                4'd3:  right_shift5 = in >> 3;
                4'd4:  right_shift5 = in >> 4;
                // 4'd5:  right_shift5 = in >> 5;
                // 4'd6:  right_shift5 = in >> 6;
                // 4'd7:  right_shift5 = in >> 7;
                // 4'd8:  right_shift5 = in >> 8;
                default: right_shift5 = 0;
            endcase
        end
    endfunction
	
	function [4:0] add5;
			input [4:0] a, b;
			input       cin;
			integer i;
			reg [4:0] sum;
			reg carry;
			begin
				carry = cin;
				for (i = 0; i < 5; i = i + 1) begin
					sum[i] = a[i] ^ b[i] ^ carry;
					carry = (a[i] & b[i]) | (a[i] & carry) | (b[i] & carry);
				end
				add5 = sum; // [7]=carry_out, [6:0]=sum
			end
		endfunction


	function [3:0] add4;
			input [3:0] a, b;
			input       cin;
			integer i;
			reg [3:0] sum;
			reg carry;
			begin
				carry = cin;
				for (i = 0; i < 4; i = i + 1) begin
					sum[i] = a[i] ^ b[i] ^ carry;
					carry = (a[i] & b[i]) | (a[i] & carry) | (b[i] & carry);
				end
				add4 = sum; // [7]=carry_out, [6:0]=sum
			end
		endfunction
		
		
	
	// Precompute the shift amounts and mantissa shifts
	// wire [3:0] shift_amt_a = (exp_a > exp_b) ? (exp_a - exp_b) : 0;
	// wire [3:0] shift_amt_b = (exp_b > exp_a) ? (exp_b - exp_a) : 0;
	
	wire [3:0] mant_shift_amt_a = add4(exp_a,~exp_b,1'b1);
	wire [3:0] mant_shift_amt_b = add4(exp_b,~exp_a,1'b1);
	

	wire [4:0] inter_mant_a_parallel = (exp_a > exp_b) ? hiddenbit_mant_a : right_shift5(hiddenbit_mant_a, mant_shift_amt_b);
	wire [4:0] inter_mant_b_parallel = (exp_b > exp_a) ? hiddenbit_mant_b : right_shift5(hiddenbit_mant_b, mant_shift_amt_a);

	// Precompute the final exponent
	wire [4:0] final_exp_parallel = (exp_a > exp_b) ? exp_a : exp_b;	
		
		
	
	
	wire [4:0] add_result = add5(inter_mant_a, inter_mant_b, 1'b0);
	wire [4:0] sub_result_a = add5(inter_mant_a, ~inter_mant_b, 1'b1);
	wire [4:0] sub_result_b = add5(inter_mant_b, ~inter_mant_a, 1'b1);
	
	
	
	wire a_gt_b = (inter_mant_a > inter_mant_b);
	wire same_sign = (sign_a == sign_b);
	
	
	
	wire [4:0] normalization_shift_a_gt_b = lzc5(sub_result_a);
	wire [4:0] normalization_shift_b_gt_a = lzc5(sub_result_b);
	
	wire [4:0] shifted_sub_result_a = sub_result_a << normalization_shift_a_gt_b;
	wire [4:0] shifted_sub_result_b = sub_result_b << normalization_shift_b_gt_a;
	
	
	

	assign result = (a == 0) ? b : (b == 0) ? a : {final_sign, final_exp, final_mant};



	always @ (*) begin
		// Align the mantissas based on the difference in exponents
		if (exp_a > exp_b) begin
			// mant_shift_amt = exp_a - exp_b                       ; // Calculate exponent difference
			// inter_mant_b = right_shift5(hiddenbit_mant_b, mant_shift_amt_a);
			inter_mant_b = inter_mant_b_parallel;
			inter_mant_a   = hiddenbit_mant_a                    ; // a's unshifted mantissa
			final_exp      = exp_a                               ; // assign larger exponent to final exponent
		end
		else begin // if exp_b > exp_a or if exp_b == exp_a
			// mant_shift_amt = exp_b - exp_a                       ; // Calculate exponent difference
			// inter_mant_a = right_shift5(hiddenbit_mant_a, mant_shift_amt_b);
			inter_mant_a = inter_mant_a_parallel;
			inter_mant_b   = hiddenbit_mant_b                    ; // b's unshifted mantissa
			final_exp      = exp_b                               ; // assign larger exponent to final exponent
		end
		
		
	/* 	// Add the mantissas
		if (sign_a == sign_b) begin
			sum_mant = inter_mant_a + inter_mant_b;
			final_sign = sign_a; // doesn't matter if a or b
		end
		else begin
			if (inter_mant_a > inter_mant_b) begin //if signs differ, subtract the smaller mantissa from the bigger one
				sum_mant = inter_mant_a - inter_mant_b;
				final_sign = sign_a; //sign of the larger mantissa
			end
			else begin //if inter_mant_b > inter_mant_a
				sum_mant = inter_mant_b - inter_mant_a;
				final_sign = sign_b; //sign of the larger mantissa
			end
			
			normalization_shift = lzc4(sum_mant[4:0]);
			sum_mant = sum_mant << normalization_shift;
			final_exp = final_exp - normalization_shift;
			
		end */
		
		if (same_sign) begin
        sum_mant = add_result;
        final_sign = sign_a;
		end else begin
			// sum_mant   = a_gt_b ? sub_result_a : sub_result_b;
			final_sign = a_gt_b ? sign_a : sign_b;

			// normalization_shift = lzc5(sum_mant);
			// sum_mant = sum_mant << normalization_shift;
			
			// sum_mant   = a_gt_b ? sub_result_a << normalization_shift_a_gt_b : sub_result_b << normalization_shift_b_gt_a;
			sum_mant   = a_gt_b ? shifted_sub_result_a : shifted_sub_result_b;
			final_exp = a_gt_b ? add4(final_exp, ~normalization_shift_a_gt_b, 1'b1) : add4(final_exp, ~normalization_shift_b_gt_a, 1'b1);
			
			
		end
		
		//if infinity or NaN, set exp to 0 to be safe.
		if (final_exp == 4'b1111) begin
			final_exp = 4'b0000;
		end

		// Final Results
		// Handle denormalized result => 0.mantissa instead of 1.mantissa
		if (final_exp == 0) begin
			final_mant = {1'b0, sum_mant[2:1]}; //this is shifting the mantissa right by one to denormalize.
			//final_exp remains 0.
		end
		else if (sum_mant[4] == 1) begin // If overflow, shift and adjust exponent
			final_mant = sum_mant[3:1]; // Shift right by one and Truncate to 7 bits
			final_exp  = final_exp + 1; //increment exponent to account for overflow
		end
		else begin // If no overflow
			final_mant = sum_mant[2:0]; // Truncate to 3 bits
			final_exp = final_exp;     // no increment since no overflow
			
		end
		
		// if one of the operands are a zero, make result the other input.
		// if (a == 0) begin
			// result = b;
		// end
		// else if (b == 0) begin
			// result = a;
		// end
		// else begin
			// result = {final_sign, final_exp, final_mant};
		// end
		
		
		
		

	end
endmodule
