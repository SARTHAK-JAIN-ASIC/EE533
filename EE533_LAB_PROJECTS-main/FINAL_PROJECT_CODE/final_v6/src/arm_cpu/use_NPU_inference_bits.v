module use_NPU_inference_bits
  #(
    parameter ADDRESS_WIDTH     = 4
  )
  (
    // input clk, reset,
	
	input [ADDRESS_WIDTH-1:0] r1addr,
	input [ADDRESS_WIDTH-1:0] r2addr,
	
	output reg use_NPU_inference_bits
	
	
	
  );
  
  
  // always @ (posedge clk or posedge reset) begin
  always @ (*) begin
		if ( (r1addr == 4'b0101) && (r2addr == 4'b0100) ) begin // Are the addresses being used r5 and r4? This will determine if the comparison for swap is occurring.
			use_NPU_inference_bits <= 1;
		end
		else begin
			use_NPU_inference_bits <= 0;
		end
		
		
	
  
  end
  



endmodule
