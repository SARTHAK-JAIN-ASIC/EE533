module bfloat8_mult (
    input [7:0] a,     // First bfloat16 operand
    input [7:0] b,     // Second bfloat16 operand
    output [7:0] result // Result of a + b in bfloat16 format
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
	
	
	reg [3:0] hiddenbit_mant_a ;
	reg [3:0] hiddenbit_mant_b ;

	reg [7:0] product_mant; //needs to be 16 bits because that's the max width for multiplying two 8-bit binaries
	
	reg [7:0] shift_product_mant; //needs to be 16 bits because that's the max width for multiplying two 8-bit binaries
	reg [2:0] normalization_shift;
	
	reg [3:0] sum_exp;
	reg [3:0] final_exp;
	reg [2:0] final_mant;
	reg final_sign;
	integer i;
	
	assign result = {final_sign, final_exp, final_mant};

	always @ (*) begin
		// Add exponents
		sum_exp = (exp_a + exp_b) - 4'd7; //need to subtract by 127 to ensure exponent is properly aligned in the floating-point format aka re-bias into bfloat16 format.
		final_exp = sum_exp;
		
		
		//====Check if mantissa is 0, make leading bit 0====
		if (exp_a == 4'h0) begin //Denormalized value, leading 0
			hiddenbit_mant_a = {1'b0, mant_a};
		end
		else begin
			hiddenbit_mant_a = {1'b1, mant_a};
		end
		
		if (exp_b == 4'h0) begin //Denormalized value, leading 0
			hiddenbit_mant_b = {1'b0, mant_b};
		end
		else begin
			hiddenbit_mant_b = {1'b1, mant_b};
		end 
		
		
		

		
		// Multiply Mantissas
		product_mant = hiddenbit_mant_a * hiddenbit_mant_b;
		
		
		shift_product_mant = product_mant;
		
		
		if (shift_product_mant[7] == 1) begin //Need to check if the 16th bit is 1 to see if the multiplication overflowed 
		   shift_product_mant = shift_product_mant >> 1; // shift right
		   final_exp = final_exp + 1; // increment exponent because of shift right
		end
		else begin
			casez (shift_product_mant[6:4])
				3'b000: normalization_shift = 3;
				3'b001: normalization_shift = 2;
				3'b011: normalization_shift = 1;
				3'b111: normalization_shift = 0;

				default : normalization_shift = 0;
			endcase 
			
			shift_product_mant = shift_product_mant << normalization_shift; // shift left after subtraction
			final_exp = final_exp - normalization_shift; // decrement exponent because of shift left
			
			
			
		end
		
		final_sign = sign_a ^ sign_b;
		
		final_mant = shift_product_mant[5:3];
		
		
		//====Check if an input is zero, make everything zero====
		if ((a == 7'h00) || (b == 7'h00) ) begin // If multiplying by zero
			final_sign = 1'b0;
			final_exp = 4'h0;
			final_mant = 3'b000;
		end
		
		
		
		
		
		

	end
endmodule
