module NPU_pipeline_top (
    input clk,                           
    input reset,
	input [63:0] data_in,
	input valid_in
);

	wire [1:0] npu_inference;
	reg  [1:0] inference_mem_addr;
	
	wire NPU_valid_out;
	wire [63:0] data_out;
	
	
	//Instantiate NPU_top
	NPU_top NPU_top(
		.clk(clk),
		.reset(reset),
		.data_in(data_in),
		.valid_in(valid_in),
		.valid_out(NPU_valid_out),
		.data_out(data_out),
		.inference(npu_inference)
	);


// ======================== Send Prediction to Memory START ===============================
	inference_mem inference_mem(
		.clk   (clk),                          
		.reset (reset), 
		.addr_a(inference_mem_addr),                 
		.din_a ({npu_inference,data_out}),                 
		.we_a  (NPU_valid_out),                         
		.re_a  (1'b1),                         
		.dout_a(),                
		

		.addr_b(),                 
		.din_b (),                 
		.we_b  (),                         
		.re_b  (),                         
		.dout_b()                 
	
	
	);
	
	
	
	// ======================== Send Prediction to Memory END ===============================
	
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			inference_mem_addr <= 2'b00;
		end
		else begin
			if (NPU_valid_out) begin
				inference_mem_addr <= inference_mem_addr + 1;
			end
		end
	
	end
	
	
	
endmodule