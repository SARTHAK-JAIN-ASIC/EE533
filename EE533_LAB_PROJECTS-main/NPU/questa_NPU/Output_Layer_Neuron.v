module Output_Layer_Neuron (
	input clk, reset,
    input [15:0] ReLu0,
	input [15:0] ReLu1,
	input [15:0] ReLu2,
	input [15:0] ReLu3,
	input [15:0] ReLu4,
	input [15:0] ReLu5,
	input [15:0] ReLu6,
	input [15:0] ReLu7,
	input [15:0] ReLu8,
	input [15:0] ReLu9,
	
	input [15:0] Weight0,
	input [15:0] Weight1,
	input [15:0] Weight2,
	input [15:0] Weight3,
	input [15:0] Weight4,
	input [15:0] Weight5,
	input [15:0] Weight6,
	input [15:0] Weight7,
	input [15:0] Weight8,
	input [15:0] Weight9,

    output reg [15:0] result
);

	wire [15:0] wire_product [9:0];
	reg  [15:0] product [9:0];
	
	wire [15:0] wire_stage1_sum [4:0];
	wire [15:0] wire_stage2_sum [1:0];
	wire [15:0] wire_stage3_sum;
	wire [15:0] wire_stage4_sum;
	
	reg [15:0] stage1_sum [4:0];
	reg [15:0] stage2_sum [1:0];
	reg [15:0] stage3_sum;
	reg [15:0] stage4_sum;
	
	reg [15:0] dly_1_stage1_sum4; // I need this in order to propagate the sum from the first stage that is used in the final stage because there is an odd number of summations after stage 1.
	reg [15:0] dly_2_stage1_sum4; // I need this in order to propagate the sum from the first stage that is used in the final stage because there is an odd number of summations after stage 1.
	
	
// Multiply ------------------------
	
	bfloat16_mult mult_inst0 (
			.a(ReLu0),    
			.b(Weight0),
			.result(wire_product[0])   
		);
		
	bfloat16_mult mult_inst1 (
			.a(ReLu1),   
			.b(Weight1),
			.result(wire_product[1])   
		);
		
	bfloat16_mult mult_inst2 (
			.a(ReLu2),    
			.b(Weight2),
			.result(wire_product[2])     
		);
		
	bfloat16_mult mult_inst3 (
			.a(ReLu3),    
			.b(Weight3),
			.result(wire_product[3])     
		);
		
	bfloat16_mult mult_inst4 (
			.a(ReLu4),    
			.b(Weight4),
			.result(wire_product[4])     
		);
		
	bfloat16_mult mult_inst5 (
			.a(ReLu5),    
			.b(Weight5),
			.result(wire_product[5])     
		);
		
	bfloat16_mult mult_inst6 (
			.a(ReLu6),    
			.b(Weight6),
			.result(wire_product[6])   
		);
		
	bfloat16_mult mult_inst7 (
			.a(ReLu7),   
			.b(Weight7),
			.result(wire_product[7])   
		);
		
	bfloat16_mult mult_inst8 (
			.a(ReLu8),    
			.b(Weight8),
			.result(wire_product[8])     
		);
		
	bfloat16_mult mult_inst9 (
			.a(ReLu9),    
			.b(Weight9),
			.result(wire_product[9])     
		);



// Accumulate ------------------------------------
	
	// Generate Stage 1 bfloat16_add units
	genvar j;
	generate
		for (j = 0; j < 5; j = j + 1) begin
			bfloat16_add stage_1_adder (
				.a(product[2*j]),      
				.b(product[(2*j) + 1]),  
				.result(wire_stage1_sum[j])     // Output (sum of the pair)
			);
		end
	endgenerate
	
	// Generate Stage 2 bfloat16_add units
	genvar jj;
	generate
		for (jj = 0; jj < 2; jj = jj + 1) begin
			bfloat16_add stage_2_adder (
				.a(stage1_sum[2*jj]),      
				.b(stage1_sum[(2*jj) + 1]),  
				.result(wire_stage2_sum[jj])     // Output (sum of the pair)
			);
		end
	endgenerate
	
	// Generate Stage 3 bfloat16_add units
	bfloat16_add stage_3_adder (
				.a(stage2_sum[0]),      
				.b(stage2_sum[1]),  
				.result(wire_stage3_sum)     // Output (sum of the pair)
			);
			
	// Generate Stage 4 bfloat16_add units
	bfloat16_add stage_4_adder (
				// .a(stage1_sum[4]), 
				.a(dly_2_stage1_sum4),      				
				.b(stage3_sum),  
				.result(wire_stage4_sum)     // Output (sum of the pair)
			);
			
			
			
			
			
			
			
	integer a,b,c,d,e,f;
	integer ii,kk,mm; 
	
	always @ (posedge clk or posedge reset) begin
	    if (reset) begin
			result <= 16'b0;
			
			// ----- Reset partial_sum registers -----
			for (kk = 0; kk < 10; kk = kk + 1) begin
                product[kk] <= 16'b0;  // Set each element to 0
            end
			
			
			// Stage1 register resetting
            for (ii = 0; ii < 5; ii = ii + 1) begin
                stage1_sum[ii] <= 16'b0;  // Set each element to 0
            end
			
			// Stage2 register resetting
            for (mm = 0; mm < 2; mm = mm + 1) begin
                stage2_sum[mm] <= 16'b0;  // Set each element to 0
            end
			
			// Stage3 register resetting
                stage3_sum <= 16'b0;  // Set each element to 0
			
			// Stage4 register resetting
                stage4_sum <= 16'b0;  // Set each element to 0
				
			dly_1_stage1_sum4 <= 16'b0;
			dly_2_stage1_sum4 <= 16'b0;
				
			
            

			 
		end
		   
		   
		   
		else begin 
			
			//Multiply
			for (a = 0; a < 10; a = a + 1) begin
                product[a] <= wire_product[a];  
            end
			
			//Accumulate
			// Stage1 
            for (b = 0; b < 5; b = b + 1) begin
                stage1_sum[b] <= wire_stage1_sum[b];  
            end
			
			// Stage2 
            for (c = 0; c < 2; c = c + 1) begin
                stage2_sum[c] <= wire_stage2_sum[c];  
            end
			dly_1_stage1_sum4 <= stage1_sum[4];
			
			// Stage3 
                stage3_sum <= wire_stage3_sum;  
				dly_2_stage1_sum4 <= dly_1_stage1_sum4;
			
			// Stage4 
                stage4_sum <= wire_stage4_sum;  
			
			
			result <= wire_stage4_sum;

			

			

		end
		
	end
		
	

endmodule
