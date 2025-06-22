module NPU_pipeline_top #(
   parameter DATA_WIDTH  = 64,
   parameter INSTR_WIDTH = 32,
   parameter DMEM_ADDR_WIDTH  = 8,
   parameter NUM_ENTRIES = 512, // For IMEM
   parameter UDP_REG_SRC_WIDTH = 2
)
(
    input clk,                           
    input reset,
	input [63:0] data_in,
	input valid_in,
	
	
	// --- Register interface
      input                               reg_req_in,
      input                               reg_ack_in,
      input                               reg_rd_wr_L_in,
      input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
      input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
      input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,

      output                              reg_req_out,
      output                              reg_ack_out,
      output                              reg_rd_wr_L_out,
      output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
      output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
      output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out
);

	wire [1:0] npu_inference;
	reg  [1:0] inference_mem_addr;
	wire NPU_valid_out;
	wire [63:0] data_out;
	
	reg [31:0] hw_reg_inference_mem_data_upper;
	reg [31:0] hw_reg_inference_mem_data_lower;
	reg [31:0] hw_reg_inference_mem_data_inference;
	wire [65:0] wire_hw_reg_inference_mem_data;
	wire [1:0] sw_reg_inference_mem_addr;
	
	
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
		

		.addr_b(sw_reg_inference_mem_addr),                 
		.din_b (4'b0000),                 
		.we_b  (1'b0),                         
		.re_b  (1'b1),                         
		.dout_b(wire_hw_reg_inference_mem_data)                 
	
	
	);
	
	
	
	// ======================== Send Prediction to Memory END ===============================
	
	
	generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`NPU_PIPELINE_TOP_BLOCK_ADDR),          // Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH      (`NPU_PIPELINE_TOP_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (1),                 // Number of sw regs
      .NUM_HARDWARE_REGS   (3)                  // Number of hw regs
   ) module_regs (
      .reg_req_in       (reg_req_in),
      .reg_ack_in       (reg_ack_in),
      .reg_rd_wr_L_in   (reg_rd_wr_L_in),
      .reg_addr_in      (reg_addr_in),
      .reg_data_in      (reg_data_in),
      .reg_src_in       (reg_src_in),

      .reg_req_out      (reg_req_out),
      .reg_ack_out      (reg_ack_out),
      .reg_rd_wr_L_out  (reg_rd_wr_L_out),
      .reg_addr_out     (reg_addr_out),
      .reg_data_out     (reg_data_out),
      .reg_src_out      (reg_src_out),

      // --- counters interface
      .counter_updates  (),
      .counter_decrement(),

      // --- SW regs interface
      .software_regs    (sw_reg_inference_mem_addr),

      // --- HW regs interface
      .hardware_regs ({hw_reg_inference_mem_data_upper, hw_reg_inference_mem_data_lower, hw_reg_inference_mem_data_inference}),

      .clk              (clk),
      .reset            (reset)
    ); 
	
	
	always @ (posedge clk or posedge reset) begin
		if (reset) begin
			inference_mem_addr <= 2'b00;
			hw_reg_inference_mem_data_upper <= 32'd0;
			hw_reg_inference_mem_data_lower <= 32'd0;
			hw_reg_inference_mem_data_inference <= 32'd0;
		end
		else begin
			if (NPU_valid_out) begin
				inference_mem_addr <= inference_mem_addr + 1;
			end
			hw_reg_inference_mem_data_upper <= wire_hw_reg_inference_mem_data[63:32];
			hw_reg_inference_mem_data_lower <= wire_hw_reg_inference_mem_data[31:0];
			hw_reg_inference_mem_data_inference <= {30'b0, wire_hw_reg_inference_mem_data[65:64]};
		end
	
	end
	
	
	
endmodule