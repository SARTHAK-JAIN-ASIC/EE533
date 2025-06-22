module NPU_dotproduct (
	input clk, reset,
    input  [63:0] data,     // input data
	
	input wire [15:0] wire_weight_from_rom_0,
	input wire [15:0] wire_weight_from_rom_1,
	input wire [15:0] wire_weight_from_rom_2,
	input wire [15:0] wire_weight_from_rom_3,
	input wire [15:0] wire_weight_from_rom_4,
	input wire [15:0] wire_weight_from_rom_5,
	input wire [15:0] wire_weight_from_rom_6,
	input wire [15:0] wire_weight_from_rom_7,
	input wire [15:0] wire_weight_from_rom_8,
	input wire [15:0] wire_weight_from_rom_9,
	input wire [15:0] wire_weight_from_rom_10,
	input wire [15:0] wire_weight_from_rom_11,
	input wire [15:0] wire_weight_from_rom_12,
	input wire [15:0] wire_weight_from_rom_13,
	input wire [15:0] wire_weight_from_rom_14,
	input wire [15:0] wire_weight_from_rom_15,
	input wire [15:0] wire_weight_from_rom_16,
	input wire [15:0] wire_weight_from_rom_17,
	input wire [15:0] wire_weight_from_rom_18,
	input wire [15:0] wire_weight_from_rom_19,
	input wire [15:0] wire_weight_from_rom_20,
	input wire [15:0] wire_weight_from_rom_21,
	input wire [15:0] wire_weight_from_rom_22,
	input wire [15:0] wire_weight_from_rom_23,
	input wire [15:0] wire_weight_from_rom_24,
	input wire [15:0] wire_weight_from_rom_25,
	input wire [15:0] wire_weight_from_rom_26,
	input wire [15:0] wire_weight_from_rom_27,
	input wire [15:0] wire_weight_from_rom_28,
	input wire [15:0] wire_weight_from_rom_29,
	input wire [15:0] wire_weight_from_rom_30,
	input wire [15:0] wire_weight_from_rom_31,
	input wire [15:0] wire_weight_from_rom_32,
	input wire [15:0] wire_weight_from_rom_33,
	input wire [15:0] wire_weight_from_rom_34,
	input wire [15:0] wire_weight_from_rom_35,
	input wire [15:0] wire_weight_from_rom_36,
	input wire [15:0] wire_weight_from_rom_37,
	input wire [15:0] wire_weight_from_rom_38,
	input wire [15:0] wire_weight_from_rom_39,
	input wire [15:0] wire_weight_from_rom_40,
	input wire [15:0] wire_weight_from_rom_41,
	input wire [15:0] wire_weight_from_rom_42,
	input wire [15:0] wire_weight_from_rom_43,
	input wire [15:0] wire_weight_from_rom_44,
	input wire [15:0] wire_weight_from_rom_45,
	input wire [15:0] wire_weight_from_rom_46,
	input wire [15:0] wire_weight_from_rom_47,
	input wire [15:0] wire_weight_from_rom_48,
	input wire [15:0] wire_weight_from_rom_49,
	input wire [15:0] wire_weight_from_rom_50,
	input wire [15:0] wire_weight_from_rom_51,
	input wire [15:0] wire_weight_from_rom_52,
	input wire [15:0] wire_weight_from_rom_53,
	input wire [15:0] wire_weight_from_rom_54,
	input wire [15:0] wire_weight_from_rom_55,
	input wire [15:0] wire_weight_from_rom_56,
	input wire [15:0] wire_weight_from_rom_57,
	input wire [15:0] wire_weight_from_rom_58,
	input wire [15:0] wire_weight_from_rom_59,
	input wire [15:0] wire_weight_from_rom_60,
	input wire [15:0] wire_weight_from_rom_61,
	input wire [15:0] wire_weight_from_rom_62,
	input wire [15:0] wire_weight_from_rom_63,

	
    output reg [15:0] result // scalar value result of dot product in bfloat16 format
);

	// reg [15:0] weight_from_rom [63:0]; //64 weights in bfloat16 format
	
	
	wire [15:0] weight_from_rom [63:0]; //64 weights in bfloat16 format
    wire [15:0] rom_data;
	wire [15:0] selected_weights[63:0]; // Array to store selected weights
	
	integer z,y;
	genvar x;
	
	// Assign the weights to array to enable the for loops to access the values.
	assign weight_from_rom[0]  = wire_weight_from_rom_0;
	assign weight_from_rom[1]  = wire_weight_from_rom_1;
	assign weight_from_rom[2]  = wire_weight_from_rom_2;
	assign weight_from_rom[3]  = wire_weight_from_rom_3;
	assign weight_from_rom[4]  = wire_weight_from_rom_4;
	assign weight_from_rom[5]  = wire_weight_from_rom_5;
	assign weight_from_rom[6]  = wire_weight_from_rom_6;
	assign weight_from_rom[7]  = wire_weight_from_rom_7;
	assign weight_from_rom[8]  = wire_weight_from_rom_8;
	assign weight_from_rom[9]  = wire_weight_from_rom_9;
	assign weight_from_rom[10] = wire_weight_from_rom_10;
	assign weight_from_rom[11] = wire_weight_from_rom_11;
	assign weight_from_rom[12] = wire_weight_from_rom_12;
	assign weight_from_rom[13] = wire_weight_from_rom_13;
	assign weight_from_rom[14] = wire_weight_from_rom_14;
	assign weight_from_rom[15] = wire_weight_from_rom_15;
	assign weight_from_rom[16] = wire_weight_from_rom_16;
	assign weight_from_rom[17] = wire_weight_from_rom_17;
	assign weight_from_rom[18] = wire_weight_from_rom_18;
	assign weight_from_rom[19] = wire_weight_from_rom_19;
	assign weight_from_rom[20] = wire_weight_from_rom_20;
	assign weight_from_rom[21] = wire_weight_from_rom_21;
	assign weight_from_rom[22] = wire_weight_from_rom_22;
	assign weight_from_rom[23] = wire_weight_from_rom_23;
	assign weight_from_rom[24] = wire_weight_from_rom_24;
	assign weight_from_rom[25] = wire_weight_from_rom_25;
	assign weight_from_rom[26] = wire_weight_from_rom_26;
	assign weight_from_rom[27] = wire_weight_from_rom_27;
	assign weight_from_rom[28] = wire_weight_from_rom_28;
	assign weight_from_rom[29] = wire_weight_from_rom_29;
	assign weight_from_rom[30] = wire_weight_from_rom_30;
	assign weight_from_rom[31] = wire_weight_from_rom_31;
	assign weight_from_rom[32] = wire_weight_from_rom_32;
	assign weight_from_rom[33] = wire_weight_from_rom_33;
	assign weight_from_rom[34] = wire_weight_from_rom_34;
	assign weight_from_rom[35] = wire_weight_from_rom_35;
	assign weight_from_rom[36] = wire_weight_from_rom_36;
	assign weight_from_rom[37] = wire_weight_from_rom_37;
	assign weight_from_rom[38] = wire_weight_from_rom_38;
	assign weight_from_rom[39] = wire_weight_from_rom_39;
	assign weight_from_rom[40] = wire_weight_from_rom_40;
	assign weight_from_rom[41] = wire_weight_from_rom_41;
	assign weight_from_rom[42] = wire_weight_from_rom_42;
	assign weight_from_rom[43] = wire_weight_from_rom_43;
	assign weight_from_rom[44] = wire_weight_from_rom_44;
	assign weight_from_rom[45] = wire_weight_from_rom_45;
	assign weight_from_rom[46] = wire_weight_from_rom_46;
	assign weight_from_rom[47] = wire_weight_from_rom_47;
	assign weight_from_rom[48] = wire_weight_from_rom_48;
	assign weight_from_rom[49] = wire_weight_from_rom_49;
	assign weight_from_rom[50] = wire_weight_from_rom_50;
	assign weight_from_rom[51] = wire_weight_from_rom_51;
	assign weight_from_rom[52] = wire_weight_from_rom_52;
	assign weight_from_rom[53] = wire_weight_from_rom_53;
	assign weight_from_rom[54] = wire_weight_from_rom_54;
	assign weight_from_rom[55] = wire_weight_from_rom_55;
	assign weight_from_rom[56] = wire_weight_from_rom_56;
	assign weight_from_rom[57] = wire_weight_from_rom_57;
	assign weight_from_rom[58] = wire_weight_from_rom_58;
	assign weight_from_rom[59] = wire_weight_from_rom_59;
	assign weight_from_rom[60] = wire_weight_from_rom_60;
	assign weight_from_rom[61] = wire_weight_from_rom_61;
	assign weight_from_rom[62] = wire_weight_from_rom_62;
	assign weight_from_rom[63] = wire_weight_from_rom_63;
	
	
	//Instantiate 64 muxes to mimic multiplication since it is binary multiplication.
	//mux 2-to-1, 16 bit wide, select bit = data[i]. one input = bfloat16 weight from rom. other input = 16 bits of 0.
    generate
        for (x = 0; x < 64; x = x + 1) begin: mux_block
            mux_2to1_16bit mux (
                .select(data[x])                ,    // Select bit for the current input
                .a(weight_from_rom[x])     ,   // Weight fetched from ROM
                .b(16'b0)                 ,  // Zero input (16 bits of 0)
                .mux_out(selected_weights[x])     // Output of the MUX for this input
            );
        end
    endgenerate

	
	
	// Intermediate wires for pipelined dot product
    wire [15:0] wire_partial_sum_stage1 [31:0];  // 32 intermediate sums (first stage)
    wire [15:0] wire_partial_sum_stage2 [15:0];  // 16 intermediate sums (second stage)
    wire [15:0] wire_partial_sum_stage3 [7:0];   // 8 intermediate sums (third stage)
    wire [15:0] wire_partial_sum_stage4 [3:0];   // 4 intermediate sums (fourth stage)
    wire [15:0] wire_partial_sum_stage5 [1:0];   // 2 intermediate sums (fifth stage)
	wire [15:0] wire_result; //Connects the final sum to the output


	// Intermediate registers for pipelined dot product
    reg [15:0] partial_sum_stage1 [31:0];  // 32 intermediate sums (first stage)
    reg [15:0] partial_sum_stage2 [15:0];  // 16 intermediate sums (second stage)
    reg [15:0] partial_sum_stage3 [7:0];   // 8 intermediate sums (third stage)
    reg [15:0] partial_sum_stage4 [3:0];   // 4 intermediate sums (fourth stage)
    reg [15:0] partial_sum_stage5 [1:0];   // 2 intermediate sums (fifth stage)
	

	genvar i,j,k,l,m,n;

	
	// Generate Stage 1 bfloat16_add units
	generate
		for (i = 0; i < 32; i = i + 1) begin
			bfloat16_add adder_inst (
				.a(selected_weights[2*i]),      // First operand (selected weight)
				.b(selected_weights[2*i + 1]),  // Second operand (selected weight)
				.result(wire_partial_sum_stage1[i])     // Output (sum of the pair)
			);
		end
	endgenerate
	 
	// Generate Stage 2 bfloat16_add units
	generate
		for (j = 0; j < 16; j = j + 1) begin
		bfloat16_add adder_inst (
			.a(partial_sum_stage1[2*j]),    // First operand (sum from stage 1)
			.b(partial_sum_stage1[2*j + 1]),// Second operand (sum from stage 1)
			.result(wire_partial_sum_stage2[j])     // Output (sum of the pair)
		);
		end
	endgenerate
	
	// Generate Stage 3 bfloat16_add units
	generate
		for (k = 0; k < 8; k = k + 1) begin
		bfloat16_add adder_inst (
			.a(partial_sum_stage2[2*k]),    // First operand (sum from stage 1)
			.b(partial_sum_stage2[2*k + 1]),// Second operand (sum from stage 1)
			.result(wire_partial_sum_stage3[k])     // Output (sum of the pair)
		);
		end
	endgenerate
	
	// Generate Stage 4 bfloat16_add units
	generate
		for (l = 0; l < 4; l = l + 1) begin
		bfloat16_add adder_inst (
			.a(partial_sum_stage3[2*l]),    // First operand (sum from stage 1)
			.b(partial_sum_stage3[2*l + 1]),// Second operand (sum from stage 1)
			.result(wire_partial_sum_stage4[l])     // Output (sum of the pair)
		);
		end
	endgenerate
	
	// Generate Stage 5 bfloat16_add units
	generate
		for (m = 0; m < 2; m = m + 1) begin
			bfloat16_add adder_inst (
				.a(partial_sum_stage4[2*m]),    // First operand (sum from stage 4)
				.b(partial_sum_stage4[2*m + 1]),// Second operand (sum from stage 4)
				.result(wire_partial_sum_stage5[m])     // Output (sum of the pair)
			);
		end
	endgenerate
	
	// Generate Stage 6 bfloat16_add unit
		bfloat16_add final_adder (
			.a(partial_sum_stage5[0]),      // First operand (sum from stage 5)
			.b(partial_sum_stage5[1]),      // Second operand (sum from stage 5)
			.result(wire_result)                    // Final result (dot product)
		); 
	
	integer a,b,c,d,e,f;
	integer ii,jj,kk,ll,mm; 


	
	always @ (posedge clk or posedge reset) begin
	    if (reset) begin
			result <= 16'b0;
			
			// ----- Reset partial_sum registers -----
			// Stage1 register resetting
            for (ii = 0; ii < 32; ii = ii + 1) begin
                partial_sum_stage1[ii] <= 16'b0;  // Set each element to 0
            end
			
			// Stage2 register resetting
            for (jj = 0; jj < 16; jj = jj + 1) begin
                partial_sum_stage2[jj] <= 16'b0;  // Set each element to 0
            end
			
			// Stage3 register resetting
            for (kk = 0; kk < 8; kk = kk + 1) begin
                partial_sum_stage3[kk] <= 16'b0;  // Set each element to 0
            end
			
			// Stage4 register resetting
            for (ll = 0; ll < 4; ll = ll + 1) begin
                partial_sum_stage4[ll] <= 16'b0;  // Set each element to 0
            end
			
			// Stage5 register resetting
            for (mm = 0; mm < 2; mm = mm + 1) begin
                partial_sum_stage5[mm] <= 16'b0;  // Set each element to 0
            end

			 
		end
		   
		   
		   
		else begin 
			
			// Stage1 
            for (a = 0; a < 32; a = a + 1) begin
                partial_sum_stage1[a] <= wire_partial_sum_stage1[a];  
            end
			
			// Stage2 
            for (b = 0; b < 16; b = b + 1) begin
                partial_sum_stage2[b] <= wire_partial_sum_stage2[b];  
            end
			
			// Stage3 
            for (c = 0; c < 8; c = c + 1) begin
                partial_sum_stage3[c] <= wire_partial_sum_stage3[c];  
            end
			
			// Stage4 
            for (d = 0; d < 4; d = d + 1) begin
                partial_sum_stage4[d] <= wire_partial_sum_stage4[d];  
            end
			
			// Stage5 
            for (e = 0; e < 2; e = e + 1) begin
                partial_sum_stage5[e] <= wire_partial_sum_stage5[e]; 
            end
			
			// Stage6 
			result <= wire_result;

			

			

		end
		
	end


   
endmodule
