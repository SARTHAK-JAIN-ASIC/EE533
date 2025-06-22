module bfloat16_add (
    input [15:0] a,     // First bfloat16 operand
    input [15:0] b,     // Second bfloat16 operand
    output [15:0] result // Result of a + b in bfloat16 format
);
    wire sign_a, sign_b; 
	wire [6:0] mant_a, mant_b;
	wire [7:0] exp_a, exp_b;
	
	// *** Extract components to bfloat16 ***
	assign sign_a  = a[15];
	assign sign_b  = b[15];
	assign exp_a   = a[14:7];
	assign exp_b   = b[14:7];
	assign mant_a  = a[6:0];
	assign mant_b  = b[6:0];
	
	/* wire [7:0] hiddenbit_mant_a = {1'b1, mant_a}; // this is 1.mantissa ; we use this becuase when we shift, the first shift needs to be 1, not 0.
	wire [7:0] hiddenbit_mant_b = {1'b1, mant_b}; // this is 1.mantissa ; we use this becuase when we shift, the first shift needs to be 1, not 0.
	
	reg [7:0] inter_mant_a , inter_mant_b; // intermediate mantissas: these hold the after-shift values
	reg [7:0] mant_shift_amt; //mantissa shift amount */
	
	
	// Need to make 9 bit wide in order check for overflow because the mantissa additiona is actually 8 bits wide (since we include the leading 1)
	wire [8:0] hiddenbit_mant_a = {2'b01, mant_a}; // this is 1.mantissa ; we use this becuase when we shift, the first shift needs to be 1, not 0.
	wire [8:0] hiddenbit_mant_b = {2'b01, mant_b}; // this is 1.mantissa ; we use this becuase when we shift, the first shift needs to be 1, not 0.
	
	reg [8:0] inter_mant_a , inter_mant_b; // intermediate mantissas: these hold the after-shift values
	reg [8:0] mant_shift_amt; //mantissa shift amount
	
	
	reg [8:0] sum_mant; //needs to be 9 bits to account for overflow
	reg [7:0] final_exp;
	reg [6:0] final_mant;
	reg final_sign;
	integer i;
	
	assign result = {final_sign, final_exp, final_mant};

	always @ (*) begin
		// Align the mantissas based on the difference in exponents
		if (exp_a > exp_b) begin
			mant_shift_amt = exp_a - exp_b                       ; // Calculate exponent difference
			inter_mant_b   = hiddenbit_mant_b >> mant_shift_amt  ; // b's shifted mantissa
			// inter_mant_a   = {1'b0,hiddenbit_mant_a[6:0]}        ; // a's unshifted mantissa
			inter_mant_a   = hiddenbit_mant_a                    ; // a's unshifted mantissa
			final_exp      = exp_a                               ; // assign larger exponent to final exponent
		end
		else if (exp_b > exp_a) begin
			mant_shift_amt = exp_b - exp_a                       ; // Calculate exponent difference
			inter_mant_a   = hiddenbit_mant_a >> mant_shift_amt  ; // a's shifted mantissa
			// inter_mant_b   = {1'b0,hiddenbit_mant_b[6:0]}        ; // b's unshifted mantissa
			inter_mant_b   = hiddenbit_mant_b                    ; // b's unshifted mantissa
			final_exp      = exp_b                               ; // assign larger exponent to final exponent
		end
		else begin //if exp_a == exp_b , no shifting.
			// inter_mant_a   = {1'b0,hiddenbit_mant_a[6:0]}   ; // a's unshifted mantissa
			// inter_mant_b   = {1'b0,hiddenbit_mant_b[6:0]}   ; // b's unshifted mantissa
			inter_mant_a   = hiddenbit_mant_a                    ; // a's unshifted mantissa
			inter_mant_b   = hiddenbit_mant_b                    ; // b's unshifted mantissa
			final_exp = exp_a; //doesn't matter a or b
		end
		
		//Add the mantissas
		if (sign_a == sign_b) begin
			sum_mant = inter_mant_a + inter_mant_b;
			final_sign = sign_a; // doesn't matter if a or b
		end
		else begin
			if (inter_mant_a > inter_mant_b) begin //if signs differ, subtract the smaller mantissa from the bigger one
				sum_mant = inter_mant_a - inter_mant_b;
				final_sign = sign_a; //sign of the larger mantissa
				for (i = 0; i<7 ; i=i+1) begin // Need this left shift in order to put back to normalized frm after subtraction
					if (sum_mant[7] == 0) begin
					   sum_mant = sum_mant << 1; // shift left after subtraction
					   final_exp = final_exp - 1; // decrement exponent because of shift left
					end
				end
			end
			else begin //if inter_mant_b > inter_mant_a
				sum_mant = inter_mant_b - inter_mant_a;
				final_sign = sign_b; //sign of the larger mantissa
				for (i = 0; i<7 ; i=i+1) begin
					if (sum_mant[7] == 0) begin
					   sum_mant = sum_mant << 1;  // shift left after subtraction
					   final_exp = final_exp - 1;  // decrement exponent because of shift left
					end
				end
			end
		end
		
		// Final Results
		// Handle denormalized result => 0.mantissa instead of 1.mantissa
		if (final_exp == 0) begin
			final_mant = {1'b0, sum_mant[6:1]}; //this is shifting the mantissa right by one to denormalize.
			//final_exp remains 0.
		end
		else if (sum_mant[8] == 1) begin // If overflow, shift and adjust exponent
			final_mant = sum_mant[7:1]; // Shift right by one and Truncate to 7 bits
			final_exp  = final_exp + 1; //increment exponent to account for overflow
		end
		else begin // If no overflow
			final_mant = sum_mant[6:0]; // Truncate to 7 bits
			final_exp = final_exp;     // no increment since no overflow
			
		end
		
		
		

	end
endmodule
