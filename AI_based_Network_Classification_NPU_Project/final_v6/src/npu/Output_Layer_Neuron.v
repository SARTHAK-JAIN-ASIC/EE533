module Output_Layer_Neuron (
	input clk, reset,
	input [63:0] data_in,
    input [7:0] ReLu0,
	input [7:0] ReLu1,
	input [7:0] ReLu2,
	input [7:0] ReLu3,
	input [7:0] ReLu4,
	input [7:0] ReLu5,
	input [7:0] ReLu6,
	input [7:0] ReLu7,
	input [7:0] ReLu8,
	input [7:0] ReLu9,
	
	input [7:0] Weight0,
	input [7:0] Weight1,
	input [7:0] Weight2,
	input [7:0] Weight3,
	input [7:0] Weight4,
	input [7:0] Weight5,
	input [7:0] Weight6,
	input [7:0] Weight7,
	input [7:0] Weight8,
	input [7:0] Weight9,
	
	input valid_in,
	
	output reg valid_out,
	output reg [63:0] data_out,

    output reg [7:0] result
);

	
	wire [7:0] wire_weight [9:0]; //10 input weight. Put in array for easier indexing
	wire [7:0] wire_product;
	wire [7:0] bfloat8_sum;
	wire [7:0] wire_relu [9:0]; //10 input relus. Put in array for easier indexing
	
	reg [7:0] reg_relu [9:0]; //10 input relus. Put in array for easier indexing
	reg [7:0] acc;
	reg [7:0] reg_product;
	reg [7:0] select_reg_relu;
	reg [7:0] reg_weight;
	reg [1:0]  state;
	reg [6:0]  index; //idk how large to make this yet. Need to determine total number of sums.
	reg [63:0] reg_data;
	
	localparam INITIALIZE = 1, RUNNING = 2; // States
	integer b;
	integer a;
	
	assign wire_relu[0]    = ReLu0;
	assign wire_relu[1]    = ReLu1;
	assign wire_relu[2]    = ReLu2;
	assign wire_relu[3]    = ReLu3;
	assign wire_relu[4]    = ReLu4;
	assign wire_relu[5]    = ReLu5;
	assign wire_relu[6]    = ReLu6;
	assign wire_relu[7]    = ReLu7;
	assign wire_relu[8]    = ReLu8;
	assign wire_relu[9]    = ReLu9;
	
	assign wire_weight[0]  = Weight0;
	assign wire_weight[1]  = Weight1;
	assign wire_weight[2]  = Weight2;
	assign wire_weight[3]  = Weight3;
	assign wire_weight[4]  = Weight4;
	assign wire_weight[5]  = Weight5;
	assign wire_weight[6]  = Weight6;
	assign wire_weight[7]  = Weight7;
	assign wire_weight[8]  = Weight8;
	assign wire_weight[9]  = Weight9;

	
	
	
	bfloat8_mult mult_inst (
			.a(select_reg_relu),    
			.b(reg_weight),
			.result(wire_product)   
		);
	
	
	bfloat8_add adder_inst (
		.a(acc),     
		.b(reg_product),  
		.result(bfloat8_sum)     
	);
	
	always @ (posedge clk or posedge reset) begin
	    if (reset) begin
			result <= 8'b0;
			valid_out <= 1'b0;
			
			acc         <= 8'd0;
			// reg_relu    <= 8'd0; 
			reg_weight  <= 8'd0;
			reg_product <= 8'd0;
			state       <= 2'd1; // Transition to INITIALIZE state
			index       <= 6'd0;
			select_reg_relu <= 8'd0;
			reg_data <= 64'd0;
			data_out <= 64'd0;
			
			for (a = 0; a < 10; a = a + 1) begin
				reg_relu[a] <= wire_relu[a];  // Initialize register array of selected weights. 
											  //These are not changed until RUNNING is complete.
			end 
			
			
			
			 
		end
		   
		   
		   
		else begin 
			case(state)
				INITIALIZE: begin
					index    <= 0;
					acc      <= 8'd0;	
					select_reg_relu <= 8'd0;
					valid_out <= 1'b0;
					reg_data <= data_in;


					for (b = 0; b < 10; b = b + 1) begin
						reg_relu[b] <= wire_relu[b];  // Initialize register array of selected weights. 
													  //These are not changed until RUNNING is complete.
					end 					
					
					// state    <= RUNNING;
					
					if(valid_in) begin
						state <= RUNNING;
					end
				end
				
				
					
				RUNNING: begin
					
					
					
					if (index == 11) begin // you need index == 11 because only multiply is done on first clock.
						// result      <= acc;
						result      <= bfloat8_sum;
						acc         <= bfloat8_sum;
						index       <= 0;
						select_reg_relu    <= 8'd0;
						reg_weight  <= 8'd0;
						reg_product <= 8'd0;
						valid_out <= 1'b1;
						data_out <= reg_data;

						state           <= INITIALIZE;
					end
					else begin
						select_reg_relu    <= reg_relu[index];
						reg_weight         <= wire_weight[index];
						reg_product        <= wire_product;
						
						
						acc   <= bfloat8_sum;
						index <= index + 1;
						
					end
				end
			endcase
		end
		
	end

	
		
	

endmodule
