module NPU_pipeline_top 
#(
   parameter DATA_WIDTH  = 64,
   parameter INSTR_WIDTH = 32,
   parameter DMEM_ADDR_WIDTH  = 8,
   parameter CTRL_WIDTH = DATA_WIDTH/8,
   parameter NUM_ENTRIES = 512, // For IMEM
   parameter UDP_REG_SRC_WIDTH = 2
)(
    input clk,                           
    input reset,
	input [63:0] data_in,
	input valid_in, // can just force this to be 1 at all times for simplicity.
	
	output reg [65:0] classified_data_out,
	output reg [7:0] memory_address_out,
	output           valid_out,
	output reg        NPU_on,
	
	
	
	input  [DATA_WIDTH-1:0]             in_data,
    input  [CTRL_WIDTH-1:0]             in_ctrl,
    input                               in_wr,
    output                              in_rdy,
   
    output [DATA_WIDTH-1:0]             out_data,
    output [CTRL_WIDTH-1:0]             out_ctrl,
    output                              out_wr,
    input                               out_rdy
	
	
	
	
	
	
	
	
	
	
	
);

	assign in_rdy = out_rdy;
	assign out_data = in_data; 
	assign out_ctrl = in_ctrl;
	assign out_wr = in_wr;

	wire [1:0] npu_inference;
	reg  [3:0] inference_mem_addr_a;
	reg  [3:0] inference_mem_addr_b;
	
	
	wire NPU_valid_out;
	wire [63:0] data_out;
	wire [65:0] inference_mem_out;
	
	reg move_to_run;
	
	assign valid_out = NPU_valid_out;
	
	
	//Instantiate NPU_top
	NPU_top NPU_top(
		.clk(clk),
		.reset(reset),
		// .data_in(data_in),
		.data_in(in_data),
		// .valid_in(valid_in),
		.valid_in(in_wr),
		.valid_out(NPU_valid_out),
		.data_out(data_out),
		.inference(npu_inference)
	);


// ======================== Send Prediction to Memory START ===============================
	inference_mem inference_mem(
		.clk   (clk),                          
		.reset (reset), 
		.addr_a(inference_mem_addr_a),                 
		.din_a ({npu_inference,data_out}),                 
		.we_a  (NPU_valid_out),                         
		.re_a  (),                         
		.dout_a(),                
		

		.addr_b(inference_mem_addr_b),                 
		.din_b (),                 
		.we_b  (),                         
		.re_b  (1'b1),                         
		.dout_b(inference_mem_out)                 
	
	
	);
	
	
	
	// ======================== Send Prediction to Memory END ===============================
	
	reg [1:0] state;
	localparam NPU_off = 1, NPU_running = 2; // States
	reg [31:0] index;
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			inference_mem_addr_a <= 'd1;
			inference_mem_addr_b <= 'd1;
			classified_data_out <= 66'b0;
			NPU_on              <= 1'b0;
			index <= 'd0;
			state <= NPU_running;
			memory_address_out <= 'd0;
			move_to_run <= 1'b0;
			
		end
		else begin
		
		
		
			case(state) 
				NPU_off: begin
					NPU_on <= 1'b0;
					
					index <= index + 1;
					
					if (index == 32'hFFFFFFFF) begin // Wait this many cycles to allow sort to have enough time to finish.
						index <= 'd0;
						state <= NPU_running;
					end
					
					// move_to_run <= in_wr;
					
					// memory_address_out <= 8'b00111111;
					// if (move_to_run == 1'b1) begin
						// state <= NPU_running;
					// end
					
				end
				
				NPU_running: begin
					NPU_on <= 1'b1;
					move_to_run <= 1'b0;
					classified_data_out <= inference_mem_out;
					memory_address_out  <= {4'b0, inference_mem_addr_b};
				
					if (NPU_valid_out) begin
						inference_mem_addr_a <= inference_mem_addr_a + 1;
						inference_mem_addr_b <= inference_mem_addr_a;
					end
					
					if (inference_mem_addr_a == 4'hb) begin
						inference_mem_addr_a <= 'd1;
						state <= NPU_off;
					end
					
					
					
				end
			endcase
			
			
			
			
		end
	
	end
	
	
	
endmodule