module NPU_dotproduct (
	input clk, reset,
    input  [63:0] data,     // input data
	
	input wire [7:0] wire_weight_from_rom_0,
	input wire [7:0] wire_weight_from_rom_1,
	input wire [7:0] wire_weight_from_rom_2,
	input wire [7:0] wire_weight_from_rom_3,
	input wire [7:0] wire_weight_from_rom_4,
	input wire [7:0] wire_weight_from_rom_5,
	input wire [7:0] wire_weight_from_rom_6,
	input wire [7:0] wire_weight_from_rom_7,
	input wire [7:0] wire_weight_from_rom_8,
	input wire [7:0] wire_weight_from_rom_9,
	input wire [7:0] wire_weight_from_rom_10,
	input wire [7:0] wire_weight_from_rom_11,
	input wire [7:0] wire_weight_from_rom_12,
	input wire [7:0] wire_weight_from_rom_13,
	input wire [7:0] wire_weight_from_rom_14,
	input wire [7:0] wire_weight_from_rom_15,
	input wire [7:0] wire_weight_from_rom_16,
	input wire [7:0] wire_weight_from_rom_17,
	input wire [7:0] wire_weight_from_rom_18,
	input wire [7:0] wire_weight_from_rom_19,
	input wire [7:0] wire_weight_from_rom_20,
	input wire [7:0] wire_weight_from_rom_21,
	input wire [7:0] wire_weight_from_rom_22,
	input wire [7:0] wire_weight_from_rom_23,
	input wire [7:0] wire_weight_from_rom_24,
	input wire [7:0] wire_weight_from_rom_25,
	input wire [7:0] wire_weight_from_rom_26,
	input wire [7:0] wire_weight_from_rom_27,
	input wire [7:0] wire_weight_from_rom_28,
	input wire [7:0] wire_weight_from_rom_29,
	input wire [7:0] wire_weight_from_rom_30,
	input wire [7:0] wire_weight_from_rom_31,
	input wire [7:0] wire_weight_from_rom_32,
	input wire [7:0] wire_weight_from_rom_33,
	input wire [7:0] wire_weight_from_rom_34,
	input wire [7:0] wire_weight_from_rom_35,
	input wire [7:0] wire_weight_from_rom_36,
	input wire [7:0] wire_weight_from_rom_37,
	input wire [7:0] wire_weight_from_rom_38,
	input wire [7:0] wire_weight_from_rom_39,
	input wire [7:0] wire_weight_from_rom_40,
	input wire [7:0] wire_weight_from_rom_41,
	input wire [7:0] wire_weight_from_rom_42,
	input wire [7:0] wire_weight_from_rom_43,
	input wire [7:0] wire_weight_from_rom_44,
	input wire [7:0] wire_weight_from_rom_45,
	input wire [7:0] wire_weight_from_rom_46,
	input wire [7:0] wire_weight_from_rom_47,
	input wire [7:0] wire_weight_from_rom_48,
	input wire [7:0] wire_weight_from_rom_49,
	input wire [7:0] wire_weight_from_rom_50,
	input wire [7:0] wire_weight_from_rom_51,
	input wire [7:0] wire_weight_from_rom_52,
	input wire [7:0] wire_weight_from_rom_53,
	input wire [7:0] wire_weight_from_rom_54,
	input wire [7:0] wire_weight_from_rom_55,
	input wire [7:0] wire_weight_from_rom_56,
	input wire [7:0] wire_weight_from_rom_57,
	input wire [7:0] wire_weight_from_rom_58,
	input wire [7:0] wire_weight_from_rom_59,
	input wire [7:0] wire_weight_from_rom_60,
	input wire [7:0] wire_weight_from_rom_61,
	input wire [7:0] wire_weight_from_rom_62,
	input wire [7:0] wire_weight_from_rom_63,

	
    output reg [7:0] result // scalar value result of dot product in bfloat16 format
);

	
	
	wire [7:0] weight_from_rom [63:0]; //64 weights in bfloat16 format
	// wire [15:0] wire_selected_weights[63:0]; // Wire used to connect to reg to store selected weights
	wire [7:0] bfloat16_sum;
	wire [7:0] wire_mux_product;
	
	
	// reg [15:0] reg_selected_weights[63:0]; // Array to store selected weights
	reg [7:0] acc;
	reg [1:0]  state;
	// reg   state;
	reg [6:0]  index;
	
	
	
	
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
	/* genvar x;
    generate
        for (x = 0; x < 64; x = x + 1) begin: mux_block
            mux_2to1_16bit mux (
                .select(data[x])                ,    // Select bit for the current input
                .a(weight_from_rom[x])     ,   // Weight fetched from ROM
                .b(16'b0)                 ,  // Zero input (16 bits of 0)
                .mux_out(wire_selected_weights[x])     // Output of the MUX for this input
            );
        end
    endgenerate */
	
	reg [63:0] reg_data;
	reg mux_select;
	reg [7:0] mux_weight;
	reg [7:0] reg_mux_product;
	
	mux_2to1_8bit mux (
                .select(mux_select)                ,    // Select bit for the current input
                .a(mux_weight)     ,   // Weight fetched from ROM
                .b(8'b0)                 ,  // Zero input (16 bits of 0)
                .mux_out(wire_mux_product)     // Output of the MUX for this input
            );
	
	
	
	bfloat8_add adder_inst (
		.a(acc),      // partial sum
		.b(reg_mux_product),  // Second operand (selected weight)
		.result(bfloat16_sum)     // Output (sum of the pair)
	);

	
	localparam INITIALIZE = 1, RUNNING = 2; // States
	integer b;
	integer a;
	
	// reg [5:0] b;
	// reg [5:0] a;

	
	always @ (posedge clk or posedge reset) begin
	    if (reset) begin
			result <= 8'b0;
			/* for (a = 0; a < 64; a = a + 1) begin
				reg_selected_weights[a] <= 16'd0;
			end */
			acc   <= 8'd0;
			state <= 2'd1;
			index <= 6'd0;
			reg_data <= data;
			mux_select <= 1'b0;
			mux_weight <= 8'd0;
			reg_mux_product <= 8'd0;
			
			
			 
		end
		   
		   
		   
		else begin 
			case(state)
				INITIALIZE: begin
					index <= 0;
					acc <= 8'd0;
					reg_data <= data; // Input new data
					/* for (b = 0; b < 64; b = b + 1) begin
						reg_selected_weights[b] <= wire_selected_weights[b];  // Initialize register array of selected weights. 
																			  //These are not changed until RUNNING (computing 1 64-bit data input) is complete.
					end */
					
					
					
					state <= RUNNING;
				end
					
				RUNNING: begin
					/* if (index < 64) begin
						acc   <= bfloat16_sum;
						index <= index + 1;
					end
					else begin
						result <= acc;
						state  <= INITIALIZE;
					end */
					
					mux_select <= reg_data[index];
					mux_weight <= weight_from_rom[index];
					reg_mux_product <= wire_mux_product;
					
					
					acc   <= bfloat16_sum;
					index <= index + 1;
					
					if (index == 64) begin
						result <= acc;
						index  <= 0;
						mux_select      <= 1'b0;
						mux_weight      <= 8'd0;
						reg_mux_product <= 8'd0;
						state  <= INITIALIZE;
					end
				end
			endcase
		end
		
	end


   
endmodule
