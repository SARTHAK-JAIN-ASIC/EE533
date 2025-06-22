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

`define CLOG2(x) \
(x <= 2)   ? 1 : \
(x <= 4)   ? 2 : \
(x <= 8)   ? 3 : \
(x <= 16)  ? 4 : \
(x <= 32)  ? 5 : \
(x <= 64)  ? 6 : \
(x <= 128) ? 7 : \
(x <= 256) ? 8 : \
(x <= 512) ? 9 : \
(x <= 1024) ? 10 : \
            -1


module pipeline_datapath
   #(
		parameter DATA_WIDTH  = 64,
		parameter DMEM_ADDR_WIDTH  = 8,
		parameter INSTR_WIDTH = 32,
		parameter REGFILE_ADDRESS_WIDTH = 3,
		parameter NUM_ENTRIES = 512
	)   
	(
	input clk,
	input reset/* ,
	
	
	
	//outputs for testbench monitoring
	output reg [INSTR_WIDTH-1:0]      tb_imem_pipereg,
							   
	//Register File 1          
	output reg                        tb_rf1_wreg_en,
	output reg                        tb_rf1_wmem_en,
	output reg [DMEM_ADDR_WIDTH-1:0]  tb_rf1_r1out,
	output reg [DATA_WIDTH-1:0]       tb_rf1_r2out,
	output reg [2:0]                  tb_rf1_wreg1,
							   
	//Register File 2          
	output reg                        tb_rf2_wreg_en,
	output reg                        tb_rf2_wmem_en,
	output reg [DMEM_ADDR_WIDTH-1:0]  tb_rf2_r1out,
	output reg [DATA_WIDTH-1:0]       tb_rf2_r2out,
	output reg [2:0]                  tb_rf2_wreg1, 
						   
	//Data Mem                 
	output reg                        tb_dmem_wreg_en,
	output reg [DATA_WIDTH-1:0]       tb_dmem_dout,
	output reg [2:0]                  tb_dmem_wreg1 */
	
	
	
	
	
	);
	
	// Compute log2(NUM_ENTRIES) for memory depth
	localparam IMEM_DEPTH_BITS = `CLOG2(NUM_ENTRIES);

	//Instruction Count for address of I-Mem
    reg [IMEM_DEPTH_BITS-1:0] PC; 		

//-------------------Module Outputs-------------------
	
	//I-Mem Interface
	wire [INSTR_WIDTH-1:0]       imem_dout_wire;
	
	//Regfile
	wire [DMEM_ADDR_WIDTH-1:0]	 r1out_wire;
	wire [DATA_WIDTH-1:0]        r2out_wire;
	
	//D-Mem Interface
	wire [DATA_WIDTH-1:0]        dmem_dout_wire;
	
	
	
	
//-------------------Pipeline Registers-------------------
	
	//Instruction Mem
	reg [INSTR_WIDTH-1:0]      imem_pipereg; 	   //Instruction Memory Pipeline Register
	
	//Register File 1
	reg                        rf1_wreg_en;
	reg                        rf1_wmem_en;
	reg [DMEM_ADDR_WIDTH-1:0]  rf1_r1out;
	reg [DATA_WIDTH-1:0]       rf1_r2out;
	reg [2:0]                  rf1_wreg1;
	
	//Register File 2
	reg                        rf2_wreg_en;
	reg                        rf2_wmem_en;
	reg [DMEM_ADDR_WIDTH-1:0]  rf2_r1out;
	reg [DATA_WIDTH-1:0]       rf2_r2out;
	reg [2:0]                  rf2_wreg1; 
	
	//Data Mem
	reg                        dmem_wreg_en;
	reg [DATA_WIDTH-1:0]       dmem_dout;
	reg [2:0]                  dmem_wreg1;
	
	
/* 	//--TESTBENCH MONITORING
	//Instruction Mem
	reg [INSTR_WIDTH-1:0]      tb_imem_pipereg; 	   //Instruction Memory Pipeline Register
							   
	//Register File 1          
	reg                        tb_rf1_wreg_en;
	reg                        tb_rf1_wmem_en;
	reg [DMEM_ADDR_WIDTH-1:0]  tb_rf1_r1out;
	reg [DATA_WIDTH-1:0]       tb_rf1_r2out;
	reg [2:0]                  tb_rf1_wreg1;
							   
	//Register File 2          
	reg                        tb_rf2_wreg_en;
	reg                        tb_rf2_wmem_en;
	reg [DMEM_ADDR_WIDTH-1:0]  tb_rf2_r1out;
	reg [DATA_WIDTH-1:0]       tb_rf2_r2out;
	reg [2:0]                  tb_rf2_wreg1; 
							   
	//Data Mem                 
	reg                        tb_dmem_wreg_en;
	reg [DATA_WIDTH-1:0]       tb_dmem_dout;
	reg [2:0]                  tb_dmem_wreg1; */
	
	
	
	
	//Module Instantiations
	//Instruction Memory
	imem32x512 imem32x512(
	
		//inputs
		.addr(PC),
		.clk(clk),
		
		//outputs
		.dout(imem_dout_wire)
	);
	
	//Register File
	regfile #(
	    .REGISTERED_OUTPUT(0),
		.REGFILE_ADDRESS_WIDTH(REGFILE_ADDRESS_WIDTH),
		.DMEM_ADDRESS_WIDTH(DMEM_ADDR_WIDTH),
		.DATA_WIDTH(DATA_WIDTH)
	)regfile(
		
		//inputs
		.clock      (clk),
		.r1addr     (imem_pipereg[29:27]),
		.r2addr     (imem_pipereg[26:24]),
		.wdata      (dmem_dout),
		.reg_write  (dmem_wreg_en),
		.waddr      (dmem_wreg1),
		
		//outputs
		.r1data_o(r1out_wire),
		.r2data_o(r2out_wire)
	);
	
	//Data Memory
	Data_Mem #(
         .ADDR_WIDTH(DMEM_ADDR_WIDTH),   // Default: 8-bit address (256 locations)
         .DATA_WIDTH(DATA_WIDTH),  // Default: 64-bit data per entry
         .MEM_DEPTH(256),  // Default: 256 memory entries
         .INIT_FILE ("Data_MM.hex") // Default memory initialization file
	)Data_Mem(
	
		//inputs
		.clk(clk),
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
			rf1_wmem_en  <= imem_pipereg[31];
			rf1_wreg_en  <= imem_pipereg[30];
			rf1_r1out    <= r1out_wire;
			rf1_r2out    <= r2out_wire;
			rf1_wreg1    <= imem_pipereg[23:21];
						 
			// REGFILE2  
			rf2_wmem_en  <= rf1_wmem_en;
			rf2_wreg_en  <= rf1_wreg_en;
			rf2_r1out    <= rf1_r1out;
			rf2_r2out    <= rf1_r2out;
			rf2_wreg1    <= rf1_wreg1;
			
			// DMEM/WB
			dmem_dout    <= dmem_dout_wire;
			dmem_wreg_en <= rf2_wreg_en;
			dmem_wreg1   <= rf2_wreg1;
			
			
		/* // Assign the internal values to the testbench monitoring signals
        tb_imem_pipereg <= imem_pipereg;
        
        // Register File 1
        tb_rf1_wreg_en <= rf1_wreg_en;
        tb_rf1_wmem_en <= rf1_wmem_en;
        tb_rf1_r1out <= rf1_r1out;
        tb_rf1_r2out <= rf1_r2out;
        tb_rf1_wreg1 <= rf1_wreg1;
        
        // Register File 2
        tb_rf2_wreg_en <= rf2_wreg_en;
        tb_rf2_wmem_en <= rf2_wmem_en;
        tb_rf2_r1out <= rf2_r1out;
        tb_rf2_r2out <= rf2_r2out;
        tb_rf2_wreg1 <= rf2_wreg1;
        
        // Data Memory
        tb_dmem_wreg_en <= dmem_wreg_en;
        tb_dmem_dout <= dmem_dout;
        tb_dmem_wreg1 <= dmem_wreg1; */
			
			
			
		end
	
	end
	
endmodule