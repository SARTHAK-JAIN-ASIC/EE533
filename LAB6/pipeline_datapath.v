`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:14 02/20/2025 
// Design Name: 
// Module Name:    pipeline_datapath
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Pipelined Datapath with I-Mem, Regfile, and D-Mem
//
//////////////////////////////////////////////////////////////////////////////////
// Pipelined Datapath

// Function to compute log2
// function integer log2;
    // input integer value;
    // integer i;
    // begin
        // log2 = 0;
        // for (i = value; i > 1; i = i >> 1) begin
            // log2 = log2 + 1;
        // end
    // end
// endfunction

module pipeline_datapath
   #(
		parameter DATA_WIDTH  = 64,
		parameter ADDR_WIDTH  = 8,
		parameter INSTR_WIDTH = 32,
		parameter NUM_ENTRIES = 512
	)   
	(
	input clk,
	input reset
	);
	
	// Compute log2(NUM_ENTRIES) for memory depth
	localparam MEM_DEPTH = $clog2(NUM_ENTRIES);

	//Instruction Count for address of I-Mem
    reg [MEM_DEPTH-1:0] PC; 		

//-------------------Module Outputs-------------------
	
	//I-Mem Interface
	wire [INSTR_WIDTH-1:0]   imem_dout_wire;
	
	//Regfile
	wire [ADDR_WIDTH-1:0]	 r1out_wire;
	wire [DATA_WIDTH-1:0]    r2out_wire;
	
	//D-Mem Interface
	wire [DATA_WIDTH-1:0]    dmem_dout_wire;
	
	
	
	
//-------------------Pipeline Registers-------------------
	
	//Instruction Mem
	reg [INSTR_WIDTH-1:0] imem_pipereg; 	   //Instruction Memory Pipeline Register
	
	//Register File 1
	reg rf1_wreg_en;
	reg rf1_wmem_en;
	reg [ADDR_WIDTH-1:0] rf1_r1out;
	reg [DATA_WIDTH-1:0] rf1_r2out;
	reg [2:0] rf1_wreg1;
	
	//Register File 2
	reg rf2_wreg_en;
	reg rf2_wmem_en;
	reg [ADDR_WIDTH-1:0] rf2_r1out;
	reg [DATA_WIDTH-1:0] rf2_r2out;
	reg [2:0] rf2_wreg1;
	
	//Data Mem
	reg dmem_wreg_en;
	reg [DATA_WIDTH-1:0] dmem_dout;
	reg [2:0]            dmem_wreg1;
	
	
	
	
	
	
	
	//Module Instantiations
	
	imem32x512 imem32x512(
	
		//inputs
		.addr(PC),
		.clk(clk),
		
		//outputs
		.dout(imem_dout_wire)
	);
	
	reg_file reg_file(
		
		//inputs
		.reg1      (imem_pipereg[29:27]),
		.reg2      (imem_pipereg[26:24]),
		.w_data    (dmem_dout),
		.wr_en     (dmem_wreg_en),
		.wr_1      (dmem_wreg1),
		
		//outputs
		.r1out(r1out_wire),
		.r2out(r2out_wire)
	);
	
	Data_Mem #(
         .ADDR_WIDTH(ADDR_WIDTH),   // Default: 8-bit address (256 locations)
         .DATA_WIDTH(DATA_WIDTH),  // Default: 64-bit data per entry
         .MEM_DEPTH(256),  // Default: 256 memory entries
         .INIT_FILE ("Data_MM.hex") // Default memory initialization file
)Data_Mem(
	
		//inputs
		.Write_Enable(rf2_wmem_en),
		.Address(rf2_r1out),
		.WData(rf2_r2out),
		
		//outputs
		.Dout(dmem_dout_wire)

	);
	
	
	
	
	
	//Data Passing Logic
	always @(posedge clk) begin
		if(reset) begin
		    //Instruction Fetch
			PC 			  <= 0;
			
			// IMEM/REGFILE
			imem_pipereg  <= 0;
			
			// REGFILE1
			rf1_wmem_en   <= 0;
			rf1_wreg_en   <= 0;
			rf1_r1out     <= 0;
			rf1_r2out     <= 0;
			rf1_wreg1     <= 0;
		 
			// REGFILE2
			rf2_wmem_en   <= 0;
			rf2_wreg_en   <= 0;
			rf2_r1out     <= 0;
			rf2_r2out     <= 0;
			rf2_wreg1     <= 0;
			
			// DMEM/WB
			dmem_dout     <= 0;
			dmem_wreg_en  <= 0;
			dmem_wreg1    <= 0;
			
			
			
			
		end
		else begin
			//Instruction Fetch
			PC <= PC + 1; //We increment by one in the imem
			
			// IMEM/REGFILE
			imem_pipereg <= imem_dout_wire;
			
			
			// REGFILE1
			rf1_wmem_en <= imem_pipereg[31];
			rf1_wreg_en <= imem_pipereg[30];
			rf1_r1out   <= r1out_wire;
			rf1_r2out   <= r2out_wire;
			rf1_wreg1   <= imem_pipereg[23:21];
			
			// REGFILE2
			rf2_wmem_en <= rf1_wmem_en;
			rf2_wreg_en <= rf1_wreg_en;
			rf2_r1out   <= rf1_r1out;
			rf2_r2out   <= rf1_r2out;
			rf2_wreg1   <= rf1_wreg1;
			
			// DMEM/WB
			dmem_dout    <= dmem_dout_wire;
			dmem_wreg_en <= rf2_wreg_en;
			dmem_wreg1   <= rf2_wreg1;
			
			
			
			
		end
	
	end
	
endmodule