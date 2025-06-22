module bfloat16_add (
	input clk, reset,
    input [15:0] a,     // First bfloat16 operand
    input [15:0] b,     // Second bfloat16 operand
    output reg [15:0] result // Result of a + b in bfloat16 format
);
    reg stage1_sign_a, stage1_sign_b; 
	reg stage2_sign_a, stage2_sign_b; 
	reg stage3_sign_a, stage3_sign_b; 
	// reg stage3_sign_a, stage3_sign_b; 
	reg [6:0] mant_a, mant_b;
	reg [7:0] exp_a, exp_b;
	reg [8:0] inter_mant_a , inter_mant_b; // intermediate mantissas: these hold the after-shift values
	// reg [8:0] mant_shift_amt; //mantissa shift amount
	reg [8:0] mant_shift_amt_agtb;
	reg [8:0] mant_shift_amt_bgta;
	reg [8:0] hiddenbit_mant_a;
	reg [8:0] hiddenbit_mant_b;
	
	reg [2:0] normalization_shift;
	
	
	reg [8:0] stage3_sum_mant; //needs to be 9 bits to account for overflow
	reg [8:0] stage4_sum_mant; //needs to be 9 bits to account for overflow
	// reg [7:0] final_exp;
	reg [7:0] stage2_final_exp;
	reg [7:0] stage3_final_exp;
	reg [7:0] stage4_final_exp;
	reg [7:0] stage5_final_exp;
	reg [6:0] final_mant;
	reg stage3_final_sign;
	reg stage4_final_sign;
	reg stage5_final_sign;
	
	// assign result = {stage5_final_sign, stage5_final_exp, final_mant};
	
	function [2:0] leading_zeros; // Used to determine the amount of shifting needed for normalization
    input [8:0] value;
		begin
			if (value[7]) leading_zeros = 0;
			else if (value[6]) leading_zeros = 1;
			else if (value[5]) leading_zeros = 2;
			else if (value[4]) leading_zeros = 3;
			else if (value[3]) leading_zeros = 4;
			else if (value[2]) leading_zeros = 5;
			else if (value[1]) leading_zeros = 6;
			else leading_zeros = 7;
		end
	endfunction 
	
	

	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			stage1_sign_a          <= 1'b0;
			stage1_sign_b          <= 1'b0;
			stage2_sign_a          <= 1'b0;
			stage2_sign_b          <= 1'b0;
			stage3_sign_a          <= 1'b0;
			stage3_sign_b          <= 1'b0;
			mant_a                 <= 7'd0;
			mant_b                 <= 7'd0;
			exp_a			       <= 8'd0;
			exp_b			       <= 8'd0;
			hiddenbit_mant_a       <= 9'd0;
			hiddenbit_mant_b       <= 9'd0;
			inter_mant_a           <= 9'd0;
			inter_mant_b           <= 9'd0;
			mant_shift_amt_agtb    <= 9'd0;
			mant_shift_amt_bgta    <= 9'd0;
			normalization_shift    <= 3'd0;
			stage3_sum_mant        <= 9'd0;
			stage4_sum_mant        <= 9'd0;
			stage2_final_exp       <= 8'd0;
			stage3_final_exp       <= 8'd0;
			stage4_final_exp       <= 8'd0;
			stage5_final_exp       <= 8'd0;
			final_mant             <= 7'd0;
			stage3_final_sign      <= 1'b0;
			stage4_final_sign      <= 1'b0;
			stage5_final_sign      <= 1'b0;
			
		
		end
		
		else begin
			// Stage 1: Extract Components
			stage1_sign_a  <= a[15];
			stage1_sign_b  <= b[15];
			exp_a   <= a[14:7];
			exp_b   <= b[14:7];
			// mant_a  <= a[6:0];
			// mant_b  <= b[6:0];
			
			// hiddenbit_mant_a <= {2'b01, mant_a}; 
			// hiddenbit_mant_b <= {2'b01, mant_b}; 
			
			
			hiddenbit_mant_a <= {2'b01, a[6:0]}; 
			hiddenbit_mant_b <= {2'b01, b[6:0]}; 
			
			mant_shift_amt_agtb <= a[14:7] - b[14:7];     
			mant_shift_amt_bgta <= b[14:7] - a[14:7];
			

			//Stage 2: Align Mantissas and Produce Initial Final Exponent (before Normalization)
			
			// Align the mantissas based on the difference in exponents
			if (exp_a > exp_b) begin
				// mant_shift_amt <= exp_a - exp_b                       ; // Calculate exponent difference
				inter_mant_b   <= hiddenbit_mant_b >> mant_shift_amt_agtb  ; // b's shifted mantissa
				inter_mant_a   <= hiddenbit_mant_a                    ; // a's unshifted mantissa
				stage2_final_exp      <= exp_a                               ; // assign larger exponent to final exponent
			end
			// else if (exp_b > exp_a) begin
			else begin // if exp_b > exp_a or if exp_b == exp_a
				// mant_shift_amt <= exp_b - exp_a                       ; // Calculate exponent difference
				inter_mant_a   <= hiddenbit_mant_a >> mant_shift_amt_bgta  ; // a's shifted mantissa
				inter_mant_b   <= hiddenbit_mant_b                    ; // b's unshifted mantissa
				stage2_final_exp      <= exp_b                               ; // assign larger exponent to final exponent
			end
			stage2_sign_a <= stage1_sign_a;
			stage2_sign_b <= stage1_sign_b;
			
			stage3_final_exp   <= stage2_final_exp;
			
			
			//Stage 3: Add Mantissas
			//Add the mantissas
			if (stage2_sign_a == stage2_sign_b) begin
				stage3_sum_mant          <= inter_mant_a + inter_mant_b;
				stage3_final_sign <= stage2_sign_a; // doesn't matter if a or b
			end
			else begin
				if (inter_mant_a > inter_mant_b) begin //if signs differ, subtract the smaller mantissa from the bigger one
					stage3_sum_mant          <= inter_mant_a - inter_mant_b;
					stage3_final_sign <= stage2_sign_a; //sign of the larger mantissa
				end
				else begin //if inter_mant_b > inter_mant_a
					stage3_sum_mant          <= inter_mant_b - inter_mant_a;
					stage3_final_sign <= stage2_sign_b; //sign of the larger mantissa
				end
			end
			
			stage3_sign_a <= stage2_sign_a ;
			stage3_sign_b <= stage2_sign_b ;
			
			
				
			//Stage 4: Normalization Calculation: Only do shifting if signs are different.
			
			
			
			
			/* if (stage3_sign_a == stage3_sign_b) begin
				stage4_sum_mant    <= stage3_sum_mant << 0; 
				stage4_final_exp   <= stage3_final_exp - 0;
			end
			else if (stage3_sum_mant[7] == 1) begin 
				stage4_sum_mant    <= stage3_sum_mant << 0; 
				stage4_final_exp   <= stage3_final_exp - 0;
			end
			else if (stage3_sum_mant[6] == 1) begin 
				stage4_sum_mant <= stage3_sum_mant << 1; 
				stage4_final_exp   <= stage3_final_exp - 1;
			end
			else if (stage3_sum_mant[5] == 1) begin 
				stage4_sum_mant <= stage3_sum_mant << 2; 
				stage4_final_exp   <= stage3_final_exp - 2;
			end
			else if (stage3_sum_mant[4] == 1) begin 
				stage4_sum_mant <= stage3_sum_mant << 3; 
				stage4_final_exp   <= stage3_final_exp - 3;
			end
			else if (stage3_sum_mant[3] == 1) begin 
				stage4_sum_mant <= stage3_sum_mant << 4; 
				stage4_final_exp   <= stage3_final_exp - 4;
			end
			else if (stage3_sum_mant[2] == 1) begin 
				stage4_sum_mant <= stage3_sum_mant << 5; 
				stage4_final_exp   <= stage3_final_exp - 5;
			end
			else if (stage3_sum_mant[1] == 1) begin 
				stage4_sum_mant <= stage3_sum_mant << 6; 
				stage4_final_exp   <= stage3_final_exp - 6;
			end */
			
			if (stage3_sign_a == stage3_sign_b) begin
				stage4_sum_mant    <= stage3_sum_mant << 0; 
				stage4_final_exp   <= stage3_final_exp - 0;
			end
			else begin
				stage4_sum_mant <= stage3_sum_mant << leading_zeros(stage3_sum_mant); 
				stage4_final_exp   <= stage3_final_exp - leading_zeros(stage3_sum_mant);
			end

			stage4_final_sign <= stage3_final_sign;


		

			//Stage 5: Normalize and Produce Final Result
			// Final Results
			// Handle denormalized result => 0.mantissa instead of 1.mantissa
			if (stage4_final_exp == 0) begin
				final_mant <= {1'b0, stage4_sum_mant[6:1]}; //this is shifting the mantissa right by one to denormalize.
				//final_exp remains 0.
				stage5_final_exp <= stage4_final_exp;
			end
			else if (stage4_sum_mant[8] == 1) begin // If overflow, shift and adjust exponent
				final_mant <= stage4_sum_mant[7:1]; // Shift right by one and Truncate to 7 bits
				stage5_final_exp  <= stage4_final_exp + 1; //increment exponent to account for overflow
			end
			else begin // If no overflow
				final_mant <= stage4_sum_mant[6:0]; // Truncate to 7 bits
				stage5_final_exp  <= stage4_final_exp;     // no increment since no overflow
				
			end
			stage5_final_sign <= stage4_final_sign;
			
			result <= {stage5_final_sign, stage5_final_exp, final_mant};
		
		end

	end
endmodule
