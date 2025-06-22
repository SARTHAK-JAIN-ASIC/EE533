module bfloat16_mult (
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
	
	
	// Need to make 9 bit wide in order check for overflow because the mantissa additiona is actually 8 bits wide (since we include the leading 1)
	// wire [7:0] hiddenbit_mant_a = {1'b1, mant_a}; // this is 1.mantissa ; we use this becuase when we shift, the first shift needs to be 1, not 0.
	// wire [7:0] hiddenbit_mant_b = {1'b1, mant_b}; // this is 1.mantissa ; we use this becuase when we shift, the first shift needs to be 1, not 0.
	
	reg [7:0] hiddenbit_mant_a ;
	reg [7:0] hiddenbit_mant_b ;

	reg [15:0] product_mant; //needs to be 16 bits because that's the max width for multiplying two 8-bit binaries
	
	reg [15:0] shift_product_mant; //needs to be 16 bits because that's the max width for multiplying two 8-bit binaries
	
	reg [7:0] sum_exp;
	reg [7:0] final_exp;
	reg [6:0] final_mant;
	reg final_sign;
	integer i;
	
	assign result = {final_sign, final_exp, final_mant};

	always @ (*) begin
		// Add exponents
		sum_exp = (exp_a + exp_b) - 8'd127; //need to subtract by 127 to ensure exponent is properly aligned in the floating-point format aka re-bias into bfloat16 format.
		final_exp = sum_exp;
		
		
		//====Check if mantissa is 0, make leading bit 0====
		if (exp_a == 16'h0000) begin //Denormalized value, leading 0
			hiddenbit_mant_a = {1'b0, mant_a};
		end
		else begin
			hiddenbit_mant_a = {1'b1, mant_a};
		end
		
		if (exp_b == 16'h0000) begin //Denormalized value, leading 0
			hiddenbit_mant_b = {1'b0, mant_b};
		end
		else begin
			hiddenbit_mant_b = {1'b1, mant_b};
		end 
		
		
		

		
		// Multiply Mantissas
		product_mant = hiddenbit_mant_a * hiddenbit_mant_b;
		
		
		shift_product_mant = product_mant;
		
		for (i = 0; i<7 ; i=i+1) begin // Need this left shift in order to put back to normalized form after multiplying
			if (shift_product_mant[15] == 1) begin //Need to check if the 16th bit is 1 to see if the multiplication overflowed 
			   shift_product_mant = shift_product_mant >> 1; // shift right
			   final_exp = final_exp + 1; // increment exponent because of shift right
			end
			else if (shift_product_mant[14] == 0) begin //Need to check if the 15th bit is 1 to ensure it's normalized. That's because when we multipl 1.bbbbbbb * 1.bbbbbbb, we have
											 // 7 bits multiplied by 7 bits after the decimal. Hence, we place the decimal 14 places. So, we check the 15th spot.
											 // Example: Product = #.bbbbbbbbbbbbbb ; We check the value of # to ensure that it is 1.
			   shift_product_mant = shift_product_mant << 1; // shift left after subtraction
			   final_exp = final_exp - 1; // decrement exponent because of shift left
			end
		end
		
		final_sign = sign_a ^ sign_b;
		
		final_mant = shift_product_mant[13:7];
		
		//====Check if an input is zero, make everything zero====
		if ((a == 16'h0000) || (b == 16'h0000) ) begin // If multiplying by zero
			final_sign = 1'b0;
			final_exp = 8'h00;
			final_mant = 7'b0000000;
		end
		
		
		
		
		
		

	end
endmodule
