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
		parameter NUM_ENTRIES = 512,
        parameter UDP_REG_SRC_WIDTH = 2
	)   
	(
	input clk,
	input reset,

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
	
	// Compute log2(NUM_ENTRIES) for memory depth
	localparam IMEM_DEPTH_BITS = `CLOG2(NUM_ENTRIES);

	//Instruction Count for address of I-Mem
    reg [IMEM_DEPTH_BITS-1:0] PC; 	
	reg [IMEM_DEPTH_BITS-1:0] imem_address; 	
	

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
	
	reg [INSTR_WIDTH-1:0]      imem_din;
	reg                        imem_we;
	//wire [INSTR_WIDTH-1:0]     imem_dout_wire;
	
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
	
//Memory Interface
	//Software Registers-------------------
	wire [31:0] imem_interact;
	wire [31:0] imem_write;
	wire [31:0] imem_rw_address;
	wire [31:0] imem_wdata;
	
	//Hardware Registers-------------------
	reg [31:0] imem_rdata;
	reg [31:0] hwreg1;
	reg [31:0] addreg_imem_interact; 
	reg [31:0] addreg_imem_write    ;    
	reg [31:0] addreg_imem_rw_address;
	reg [31:0] addreg_imem_wdata     ;
	
	
	
	//Misc testing
	reg [31:0] reg_imem_interact;
	reg [31:0] reg_imem_write;
	reg [31:0] reg_imem_rw_address;
	reg [31:0] reg_imem_wdata;
	
	
	
	
	
	//Module Instantiations
	//Instruction Memory
	imem32x512 imem32x512(
	
		//inputs
		.addr(imem_address),
		.clk(clk),
		.we(imem_we),
		.din(imem_din),
		
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
	
	generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`PIPELINE_DATAPATH_BLOCK_ADDR),          // Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH      (`PIPELINE_DATAPATH_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (4),                 // Number of sw regs
      .NUM_HARDWARE_REGS   (6)                  // Number of hw regs
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
      .software_regs    ({imem_wdata,imem_rw_address,imem_write,imem_interact}),

      // --- HW regs interface
      .hardware_regs    ({addreg_imem_write, addreg_imem_wdata, addreg_imem_rw_address, addreg_imem_interact, hwreg1, imem_rdata}),

      .clk              (clk),
      .reset            (reset)
    );
	
	
	
	
	
	//Data Passing Logic
	always @(posedge clk) begin
		if(reset) begin
		    //Instruction Fetch
			PC 			  		   <= 0;
			imem_address		   <= 0;
            
            hwreg1 				   <= 32'hBADABDAB;
			addreg_imem_interact   <= 32'hBADABDAB;
			addreg_imem_rw_address <= 32'hBADABDAB;
			addreg_imem_wdata      <= 32'hBADABDAB;
			addreg_imem_write      <= 32'hBADABDAB;
			imem_rdata 			   <= 32'hBADABDAB;
            
			
			// IMEM/REGFILE
			imem_pipereg  <= 0;
			imem_we		  <= 0;
			imem_din      <= 0;
			
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
			if (!imem_interact[0])begin // If we are interacting with the imem.
			
				imem_address <= PC;
				PC <= PC + 1; //We increment by one in the imem
				
				// IMEM/REGFILE
				imem_pipereg <= imem_dout_wire;
				
				hwreg1 <= imem_address;
			
			end
			else begin
				
				//Ensure no writing to imem for now.
				imem_we		  <= imem_write[0]; //Write to or Read from imem
				imem_din      <= imem_wdata[INSTR_WIDTH-1:0]; // Din for writing to imem
				imem_address  <= imem_rw_address[IMEM_DEPTH_BITS-1:0]; //Address that will be written to or read from
				
				imem_rdata    <= imem_dout_wire; // Data to be read
				
				imem_pipereg  <= 0; //NOP when interacting with imem
				
			
			end
			
			
			
			/* if(imem_interact[0])begin
				addreg_imem_interact  <= 32'hAAAAAAAA;
			end
			else begin
				addreg_imem_interact  <= 32'hDEEEEEAD; 
			end
			
			if(imem_write[0])begin
				addreg_imem_write  <= 32'hBBBBBBBB;
			end
			else begin
				addreg_imem_write  <= 32'hDEEEEEAD; 
			end
			
			if(imem_rw_address)begin
				addreg_imem_rw_address  <= 32'hCCCCCCCC;
			end
			else begin
				addreg_imem_rw_address  <= 32'hDEEEEEAD; 
			end
			
			if(imem_wdata)begin
				addreg_imem_wdata  <= 32'hDDDDDDDD;
			end
			else begin
				addreg_imem_wdata  <= 32'hDEEEEEAD; 
			end */
			
			
			
			
			
			
			
			
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
			
			
			
		end
	
	end
	
endmodule
