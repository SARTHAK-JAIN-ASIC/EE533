module NPU_pipeline_top (
    input clk,                           
    input reset,
	input [63:0] data_in
);

	wire [3:0] npu_inference;
	reg  [1:0] inference_mem_addr;
	
	
	//Instantiate NPU_top
	NPU_top NPU_top(
		.clk(clk),
		.reset(reset),
		.data_in(data_in),
		
		.inference(npu_inference)
	);


// ======================== Send Prediction to Memory START ===============================
	inference_mem inference_mem(
		.clk   (clk),                          
		.reset (reset), 
		.addr_a(inference_mem_addr),                 
		.din_a (npu_inference),                 
		.we_a  (1'b1),                         
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
			inference_mem_addr <= inference_mem_addr + 1;
		end
	
	end
	
	
	
endmodule