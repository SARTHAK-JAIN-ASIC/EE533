// `include "regfile.v"
// `include "instruction_memory.v"
// `include "Data_Mem.v"
// `include "ID_EX.v"
// `include "IF_ID.v"
// `include "pipe_EXMEM.v"
// `include "pipe_MEMWB.v"
// `include "Mux2x1.v"
// `include "ControlUnit.v"
// `include "signExtended.v"
// `include "ALU_EX_Mux.v"
// `include "ALUControl.v"
// `include "ALU.v"
// `include "RegisterSelect_Mux.v"
// `include "PC.v"
// `include "PC_Mux.v"
// `include "PC_Adder.v"

`timescale 1ns / 1ps

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
			
module arm_datapath
#(
   parameter DATA_WIDTH  = 64,
   parameter INSTR_WIDTH = 32,
   parameter DMEM_ADDR_WIDTH  = 8,
   parameter NUM_ENTRIES = 512, // For IMEM
   parameter UDP_REG_SRC_WIDTH = 2
)
(
   input clock, reset
   
   // --- Register interface
      // input                               reg_req_in,
      // input                               reg_ack_in,
      // input                               reg_rd_wr_L_in,
      // input  [`UDP_REG_ADDR_WIDTH-1:0]    reg_addr_in,
      // input  [`CPCI_NF2_DATA_WIDTH-1:0]   reg_data_in,
      // input  [UDP_REG_SRC_WIDTH-1:0]      reg_src_in,

      // output                              reg_req_out,
      // output                              reg_ack_out,
      // output                              reg_rd_wr_L_out,
      // output  [`UDP_REG_ADDR_WIDTH-1:0]   reg_addr_out,
      // output  [`CPCI_NF2_DATA_WIDTH-1:0]  reg_data_out,
      // output  [UDP_REG_SRC_WIDTH-1:0]     reg_src_out
	
);

// Compute log2(NUM_ENTRIES) for memory depth
	localparam IMEM_DEPTH_BITS = `CLOG2(NUM_ENTRIES);

   wire [DATA_WIDTH-1   : 0]  PC_P_4               ;
   wire [DATA_WIDTH-1   : 0]  PC_i                 ;
   wire [DATA_WIDTH-1   : 0]  PC_o                 ;
   wire [INSTR_WIDTH-1  : 0]  CPU_instr            ;
   wire [DATA_WIDTH-1   : 0]  IFID_PC_o            ;
   wire [INSTR_WIDTH-1  : 0]  IFID_CPU_instr       ;
   wire [3:0]                 IFID_REGMux_out      ;
   wire [DATA_WIDTH-1   : 0]  DataMemory_WBMuxOut  ;
   wire                       WBStage_RegWrite     ;
   wire [DATA_WIDTH-1   : 0]  regFile_DataOut1     ;
   wire [DATA_WIDTH-1   : 0]  regFile_DataOut2     ;
   wire [DATA_WIDTH-1   : 0]  immediate            ;
   
   
   
   wire [DATA_WIDTH-1   : 0]  IDEX_Read_Data_1_i   ;
   wire [DATA_WIDTH-1   : 0]  IDEX_Read_Data_2_i   ;

   wire [1:0]                 IDEX_aluop           ;
   wire                       IDEX_alusrc_o        ;
   wire                       IDEX_memWrite_o      ;
   wire                       IDEX_memRead_o       ;
   wire                       IDEX_mem2Reg_o       ;
   wire                       IDEX_regWrite_o      ;
   wire [DATA_WIDTH - 1 : 0]  IDEX_PC_o            ;
   wire [DATA_WIDTH - 1 : 0]  IDEX_ReadData1_o     ;
   wire [DATA_WIDTH - 1 : 0]  IDEX_ReadData2_o     ;
   wire [DATA_WIDTH - 1 : 0]  IDEX_signExtended_o  ;
   wire [7 : 0]               IDEX_aluCtrl_o       ;
   wire [3 : 0]               IDEX_Rm_o            ;
   wire [3 : 0]               IDEX_Rn_o            ;
   wire [3 : 0]               IDEX_writeReg_o      ;

   wire                    EXMEM_memRead_o;
   wire                    EXMEM_memWrite_o;
   wire                    EXMEM_regWrite_o;
   wire                    EXMEM_mem2Reg_o;
   wire [3:0]              EXMEM_writeReg_o;
   wire [DATA_WIDTH-1 : 0] EXMEM_writeData_mem_o;
   wire [DATA_WIDTH-1 : 0] EXMEM_aluResult_out;
   wire                    EXMEM_aluZero_o;
   
   

   wire [DATA_WIDTH-1 : 0] MEMWB_DataMem_o      ;
   wire [DATA_WIDTH-1 : 0] MEMWB_aluResult_out  ;
   wire                    MEMWB_mem2Reg_o      ;
   wire                    MEMWB_regWrite_o     ;
   wire [3:0]              MEMWB_writeReg_o     ;
   wire 	               MEMWB_memRead_o      ; //This is used for forwarding to the regfile

   wire [DATA_WIDTH-1 : 0] EXMEM_branch_address_o;
   wire                    EXMEM_branch_en_o;
   wire                    branch_and_o; 

   wire        reg2Loc  ;
   wire        ALUsrc   ;
   wire        memtoReg ;
   wire        regWrite ;
   wire        memRead  ;
   wire        memWrite ;
   wire        branch   ;
   wire [1:0]  ALUop    ;
  
   //Outputs of HDU  
   wire ControlWire;
   wire IFID_Write;
   wire PCWire;
   
   // Mux in ID stage for Register File output 2
   wire [DATA_WIDTH-1:0] RegFileData_or_FW;
   wire                  selectReg_or_Fw_ID;
   

   
   assign selectReg_or_Fw_ID = MEMWB_regWrite_o && ((IFID_CPU_instr[19:16] == MEMWB_writeReg_o) || ((IFID_REGMux_out) == MEMWB_writeReg_o));
   assign RegFileData_or_FW  = (selectReg_or_Fw_ID) ? DataMemory_WBMuxOut : regFile_DataOut2;
   
   initial
   begin
	 $monitor(" selectReg_or_Fw_ID = %0d :: RegFileData_or_FW = %0d", selectReg_or_Fw_ID, RegFileData_or_FW);
   end
   
   
   //-------------------Pipeline Registers-------------------
 /*   reg [INSTR_WIDTH-1:0]      imem_din;
   reg                        imem_we;
   reg [IMEM_DEPTH_BITS-1:0]  imem_address; 
   
   reg                        dmem_we;
   reg [DMEM_ADDR_WIDTH-1:0]  dmem_address;
   reg [DATA_WIDTH-1:0]       dmem_wdata;
   reg 						  dmem_re; */
   
   //Memory Interface
	//Software Registers-------------------
	/* wire [31:0] imem_interact;
	wire [31:0] imem_write;
	wire [31:0] imem_rw_address;
	wire [31:0] imem_wdata;
	 */
	// wire [31:0] dmem_interact;
	// wire [31:0] dmem_write;
	// wire [31:0] dmem_rw_address;
	// wire [31:0] dmem_wdata_upper;
	// wire [31:0] dmem_wdata_lower;
	
	//Hardware Registers-------------------
	/* reg [31:0] imem_rdata;
	
	reg [31:0] dmem_rdata_upper_0;
	reg [31:0] dmem_rdata_lower_0;
	reg [31:0] dmem_rdata_upper_1;
	reg [31:0] dmem_rdata_lower_1;
	reg [31:0] dmem_rdata_upper_2;
	reg [31:0] dmem_rdata_lower_2;
	reg [31:0] dmem_rdata_upper_3;
	reg [31:0] dmem_rdata_lower_3;
	reg [31:0] dmem_rdata_upper_4;
	reg [31:0] dmem_rdata_lower_4;
	reg [31:0] dmem_rdata_upper_5;
	reg [31:0] dmem_rdata_lower_5;
	reg [31:0] dmem_rdata_upper_6;
	reg [31:0] dmem_rdata_lower_6;
	
	wire [31:0] dmem_rdata_upper_0_wire;
	wire [31:0] dmem_rdata_lower_0_wire;
	wire [31:0] dmem_rdata_upper_1_wire;
	wire [31:0] dmem_rdata_lower_1_wire;
	wire [31:0] dmem_rdata_upper_2_wire;
	wire [31:0] dmem_rdata_lower_2_wire;
	wire [31:0] dmem_rdata_upper_3_wire;
	wire [31:0] dmem_rdata_lower_3_wire;
	wire [31:0] dmem_rdata_upper_4_wire;
	wire [31:0] dmem_rdata_lower_4_wire;
	wire [31:0] dmem_rdata_upper_5_wire;
	wire [31:0] dmem_rdata_lower_5_wire;
	wire [31:0] dmem_rdata_upper_6_wire;
	wire [31:0] dmem_rdata_lower_6_wire; */

   PC 
   program_counter
   (
      .clock   (clock),
      .reset   (reset),
      .PC_i    (PC_i),
	  .PCWire  (PCWire),
      .PC_o    (PC_o)
   );

   PC_Adder
   PCPlus4
   (
      .PC      (PC_o),
      .Offset  (64'd1),
      .PCNext  (PC_P_4)
   );

   PC_Mux
   PCMux
   (
      // .PCSrc_i       (branch_and_o),
	  .PCSrc_i       (1'b0),
      .PC_i          (PC_P_4),
      // .PCPlusOffset  (EXMEM_branch_address_o), //branch addr
	  .PCPlusOffset  (64'd0), //branch addr
      .PCMuxOut      (PC_i)
   );
   


   
   //Instruction Memory
	imem32x512 imem32x512(
	
		//inputs
		// .addr(imem_address),
		// .addr(PC_o),
		.addr(PC_o[8:0]),
		.clk(clock),
		// .we(imem_we),
		// .din(imem_din),
		.we(1'b0),
		.din(32'd0),
		.re(PCWire),
		
		//outputs
		.dout(CPU_instr)
	);

   //Output wires for HDU
   
   pipe_IFID
   IF_ID
   (
      .clock         (clock         ),
      .reset         (reset         ),
      // .IF_ID_Write   (1'b1          ), //pipe enabled or stalled?
	  .IF_ID_Write   (IFID_Write    ), //pipe enabled or stalled?
      .flush_IF_ID   (1'b0          ),
      .data_IR_i     (PC_o          ),
      .instruction_i  (CPU_instr     ),
      .data_IR_o     (IFID_PC_o     ),
      .instruction_o (IFID_CPU_instr)
   );
   
   

   
   HazardDetectionUnit
   HDU
   (
     .IDEX_MemRead      (IDEX_memRead_o) ,
     .EXMEM_RegWrite    (EXMEM_regWrite_o) ,
     .IDEX_RegisterRd   (IDEX_writeReg_o) ,
     .IFID_RegisterRm   (IFID_CPU_instr[3:0]) ,
     .IFID_RegisterRn   (IFID_CPU_instr[19:16]) ,
     .IFID_Write        (IFID_Write)  , 
     .PCWire            (PCWire) ,
     .ControlWire       (ControlWire)   
   );
   
   
   
   ControlUnit
   MainControlUnit
   (
      .control_instruction_i  (IFID_CPU_instr[27:20]),
      .reg2Loc                (reg2Loc ),
      .ALUsrc                 (ALUsrc  ),
      .memtoReg               (memtoReg),
      .regWrite               (regWrite),
      .memRead                (memRead ),
      .memWrite               (memWrite),
      .branch                 (branch  ),
      .ALUop                  (ALUop   )
   );
   
   wire [8:0] HDU_Mux_o;
   Mux2x1_9bit
   HDU_Mux
   (
	  .in1 ({ALUop   ,
			 ALUsrc  ,
	         memWrite,
	         memRead ,
	         memtoReg,
	         regWrite,
			 branch  ,
			 reg2Loc 
					   }),
      .in2 (9'd0),
      .sel (ControlWire),
      .out (HDU_Mux_o)
   ); 
   
   RegisterSelect_Mux
   regSelect
   (
      .Rm         (IFID_CPU_instr[3:0]) , //Rs2
      .Rt         (IFID_CPU_instr[15:12]) , //Rd
      .reg2Loc    (reg2Loc)               ,
      .registerOut(IFID_REGMux_out)
   );

	assign FW_data_from_WB = MEMWB_memRead_o & MEMWB_regWrite_o;
	
	//assign IDEX_Read_Data_1_i = (FW_data_from_WB) ? DataMemory_WBMuxOut : regFile_DataOut1;
	assign IDEX_Read_Data_2_i = (FW_data_from_WB) ? DataMemory_WBMuxOut : regFile_DataOut2;

	
	
	

   regfile
   RegisterFile
   (
      .clock      (clock               ),
	  .reset      (reset               ),
      .r1addr     (IFID_CPU_instr[19:16] ), //Rs1
      .r2addr     (IFID_REGMux_out     ),
      .waddr      (MEMWB_writeReg_o    ),
      .wdata      (DataMemory_WBMuxOut ),
      .reg_write  (MEMWB_regWrite_o    ),
      .r1data_o   (regFile_DataOut1    ),
      // .r2data_o   (regFile_DataOut2    )
	  .r2data_o   (regFile_DataOut2    )
   );
   

   signExtended
   signExtend
   (
      .instruction   (IFID_CPU_instr),
      .immediate     (immediate     )
   );



   
   
   wire IDEX_branch_en_o;
   ID_EX
   pipe_ID_EX
   (
      .clock         (clock               ),
      .reset         (reset               ),
      .flush         (1'd0                 ),
      // .aluop_i       (ALUop               ),
      // .alusrc_i      (ALUsrc              ),
      // .memWrite_i    (memWrite            ),
      // .memRead_i     (memRead             ),
      // .mem2Reg_i     (memtoReg            ),
      // .regWrite_i    (regWrite            ),
	  //--HDU 
	  .aluop_i       (HDU_Mux_o[8:7]          ),
      .alusrc_i      (HDU_Mux_o[6]            ),
      .memWrite_i    (HDU_Mux_o[5]            ),
      .memRead_i     (HDU_Mux_o[4]            ),
      .mem2Reg_i     (HDU_Mux_o[3]            ),
      .regWrite_i    (HDU_Mux_o[2]            ),
	  .branch_en_i	 (HDU_Mux_o[1]            ),
	  
      .PC_i          (IFID_PC_o           ),
      .ReadData1_i   (regFile_DataOut1    ),
	  // .ReadData1_i   (IDEX_Read_Data_1_i    ),
      // .ReadData2_i   (regFile_DataOut2    ),
	  // .ReadData2_i   (RegFileData_or_FW    ),
	  .ReadData2_i   (IDEX_Read_Data_2_i    ),
      .signExtended_i(immediate           ),
      .aluCtrl_i     (IFID_CPU_instr[27:20]),
      .Rm_i          (IFID_CPU_instr[3:0]), //Rs2
      .Rn_i          (IFID_CPU_instr[19:16]),   //Rs1
      .writeReg_i    (IFID_CPU_instr[15:12]),
	  // .branch_en_i	 (branch              ),

      .aluop_o       (IDEX_aluop         ),
      .alusrc_o      (IDEX_alusrc_o      ),
      .memWrite_o    (IDEX_memWrite_o    ),
      .memRead_o     (IDEX_memRead_o     ),
      .mem2Reg_o     (IDEX_mem2Reg_o     ),
      .regWrite_o    (IDEX_regWrite_o    ),
      .PC_o          (IDEX_PC_o          ),
      .ReadData1_o   (IDEX_ReadData1_o   ),
      .ReadData2_o   (IDEX_ReadData2_o   ),
      .signExtended_o(IDEX_signExtended_o),
      .aluCtrl_o     (IDEX_aluCtrl_o     ),
      .Rm_o          (IDEX_Rm_o          ),
      .Rn_o          (IDEX_Rn_o          ),
      .writeReg_o    (IDEX_writeReg_o    ),
	  .branch_en_o	 (IDEX_branch_en_o   )
   );
   
 /*

   
   //Branch Address Calculation
   wire [DATA_WIDTH-1:0] branch_address_o;
   branch_address
   branch_address
   (
	   .PC(IDEX_PC_o),
	   .sign_extended(IDEX_signExtended_o),
	   .branch_address(branch_address_o)
   );
   
   */
   
  //Wires for forwarding
   wire [1:0] ForwardA;
   wire [1:0] ForwardB;
   wire [DATA_WIDTH - 1 : 0]  Forwarding_MuxA_o;
   wire [DATA_WIDTH - 1 : 0]  ALU_MuxOut;
   wire [DATA_WIDTH - 1 : 0]  Forwarding_MuxB_o;
   
   
   ForwardingUnitALUMuxA
   FU_ALU_MuxA
   (
	  .regData1					(IDEX_ReadData1_o		),
	  .dataMemoryMUXout			(DataMemory_WBMuxOut	),
	  .EXMEM_InputAddress		(EXMEM_aluResult_out	),
	  .ForwardA                 (ForwardA          		),
	  .ForwardingUnitALUMUXoutA (Forwarding_MuxA_o      )
	  
   
   );
   
   
   
   /* ALU_EX_Mux
   ALU_inReg_MUX
   (
      .regData       (IDEX_ReadData2_o    ),
      .signExtendNum (IDEX_signExtended_o ),
      .ALUsrc        (IDEX_alusrc_o       ),
      .ALUMuxOut     (ALU_MuxOut          )
   );
    */
   ALU_EX_Mux
   ALU_inReg_MUX
   (
      .regData       (Forwarding_MuxB_o    ),
      .signExtendNum (IDEX_signExtended_o ),
      .ALUsrc        (IDEX_alusrc_o       ),
      .ALUMuxOut     (ALU_MuxOut          )
   );
    
   
   
   ForwardingUnitALUMuxB
   FU_ALU_MuxB
   (
	  .regData2					(IDEX_ReadData2_o		),
	  .dataMemoryMUXout			(DataMemory_WBMuxOut	),
	  .EXMEM_InputAddress		(EXMEM_aluResult_out	),
	  .ForwardB                 (ForwardB         		),
	  .ForwardingUnitALUMUXoutB (Forwarding_MuxB_o      )
	  
   );


	

   ForwardingUnit
   FU
   (
      .IDEX_RegisterRm  (IDEX_Rm_o                 ), 
	  .IDEX_RegisterRn  (IDEX_Rn_o                 ),
	  .EXMEM_RegisterRd (EXMEM_writeReg_o          ),
	  .MEMWB_RegisterRd (MEMWB_writeReg_o          ),
	  .EXMEM_RegWrite   (EXMEM_regWrite_o          ),
	  .MEMWB_RegWrite   (MEMWB_regWrite_o          ),
	  .IDEX_RegisterRd  (IDEX_writeReg_o           ),
	  .IDEX_MemWrite    (IDEX_memWrite_o           ),
	  
	  
	  .ForwardA         (ForwardA                 ), 
	  .ForwardB         (ForwardB                 )
	  
	  
	  
	  
   );

   
   
   wire [3:0] aluOperationSelect;
   ALUControl
   ALUControlLogic
   (
      .ALUop       (IDEX_aluop),
      .opcodeField (IDEX_aluCtrl_o),
      .ALUoperation(aluOperationSelect)
   );

   

   wire ALU_zero;
   wire [DATA_WIDTH-1 : 0] ALU_result;
   ALU
   ArithUnit
   (
      .clock      (clock            ),
      .reset      (reset            ),
      //.alu_in1_i  (IDEX_ReadData1_o ),
      //.alu_in2_i  (ALU_MuxOut       ),
	  .alu_in1_i  (Forwarding_MuxA_o ),
	  //.alu_in2_i  (Forwarding_MuxB_o ),
	  .alu_in2_i  (ALU_MuxOut       ),
      .aluctrl_i  (aluOperationSelect),
      .cin        (1'b0             ),
      .cout_o     (                 ),
      .alu_a_gt_b (                 ),
      .alu_a_lt_b (                 ),
      .zero       (ALU_zero         ),
      .alu_o      (ALU_result       )
   );

   pipe_EXMEM
   EX_MEM
   (
      .clock          (clock                  ),
      .reset          (reset                  ),
      .memRead_i      (IDEX_memRead_o         ),
      .memWrite_i     (IDEX_memWrite_o        ),
      .regWrite_i     (IDEX_regWrite_o        ),
      .mem2Reg_i      (IDEX_mem2Reg_o         ),
      .writeReg_i     (IDEX_writeReg_o        ),
      //.writeData_mem  (IDEX_ReadData2_o       ),
      .writeData_mem  (Forwarding_MuxB_o      ),
	  .aluResult_in   (ALU_result             ),
      .aluZero_i      (ALU_zero               ),
      .branch_address_i(branch_address_o         ),
      .branch_en_i    (IDEX_branch_en_o       ),

      .memRead_o      (EXMEM_memRead_o        ),
      .memWrite_o     (EXMEM_memWrite_o       ),
      .regWrite_o     (EXMEM_regWrite_o       ),
      .mem2Reg_o      (EXMEM_mem2Reg_o        ),
      .writeReg_o     (EXMEM_writeReg_o       ),
      .writeData_mem_o(EXMEM_writeData_mem_o  ),
      .aluResult_out  (EXMEM_aluResult_out    ),
      .aluZero_o      (EXMEM_aluZero_o        ),
      .branch_address_o(EXMEM_branch_address_o ),
      .branch_en_o    (EXMEM_branch_en_o      )
   );
   
   /*
   branch_and
   branch_and
   (
     .branch_en(EXMEM_branch_en_o),
     .zero     (EXMEM_aluZero_o),
     .PCsrc    (branch_and_o)
   );
   */

   wire [DATA_WIDTH-1 : 0] DataMem_o;
   
   Data_Mem
   DATA_MEMORY
   (
      .clock      (clock                  ),
      .memWrite_i (EXMEM_memWrite_o       ),
      .MemRead_i  (EXMEM_memRead_o        ),
      // .Address    (EXMEM_aluResult_out    ),
	  .Address    (EXMEM_aluResult_out[7:0]    ),
      .WData      (EXMEM_writeData_mem_o  ),
      .Dout       (DataMem_o              )/* ,
	  .hostreg0   ({dmem_rdata_upper_0_wire, dmem_rdata_lower_0_wire}),
	  .hostreg1   ({dmem_rdata_upper_1_wire, dmem_rdata_lower_1_wire}),
	  .hostreg2   ({dmem_rdata_upper_2_wire, dmem_rdata_lower_2_wire}),
	  .hostreg3   ({dmem_rdata_upper_3_wire, dmem_rdata_lower_3_wire}),
	  .hostreg4   ({dmem_rdata_upper_4_wire, dmem_rdata_lower_4_wire}),
	  .hostreg5   ({dmem_rdata_upper_5_wire, dmem_rdata_lower_5_wire}),
	  .hostreg6   ({dmem_rdata_upper_6_wire, dmem_rdata_lower_6_wire}) */
   );


   pipe_MEMWB
   MEM_WB
   (
      .clock             (clock              ),
      .reset             (reset              ),
      .enable            (1'b1               ),
      .memRead_dataOut_i (DataMem_o          ),
      .regData_i         (EXMEM_aluResult_out),
      .mem2Reg_i         (EXMEM_mem2Reg_o    ),
      .regWrite_i        (EXMEM_regWrite_o   ),
      .writeReg_i        (EXMEM_writeReg_o   ),
	  .memRead_i         (EXMEM_memRead_o    ),

      .memRead_dataOut_o (MEMWB_DataMem_o    ),
      .regData_o         (MEMWB_aluResult_out),
      .mem2Reg_o         (MEMWB_mem2Reg_o    ),
      .regWrite_o        (MEMWB_regWrite_o   ),
      .writeReg_o        (MEMWB_writeReg_o   ),
	  .memRead_o         (MEMWB_memRead_o    )
   );

   Mux2x1
   WBStage_MUX
   (
      //.in1 (MEMWB_DataMem_o),
	  .in1 (DataMem_o),
      .in2 (MEMWB_aluResult_out),
      .sel (MEMWB_mem2Reg_o),
      .out (DataMemory_WBMuxOut)
   ); 


   /* generic_regs
   #( 
      .UDP_REG_SRC_WIDTH   (UDP_REG_SRC_WIDTH),
      .TAG                 (`ARM_DATAPATH_BLOCK_ADDR),          // Tag -- eg. MODULE_TAG
      .REG_ADDR_WIDTH      (`ARM_DATAPATH_REG_ADDR_WIDTH),     // Width of block addresses -- eg. MODULE_REG_ADDR_WIDTH
      .NUM_COUNTERS        (0),                 // Number of counters
      .NUM_SOFTWARE_REGS   (4),                 // Number of sw regs
      .NUM_HARDWARE_REGS   (15)                  // Number of hw regs
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
      .software_regs    ({ imem_wdata     ,
                           imem_rw_address,
                           imem_write     ,
                           imem_interact}
                        ),

      // --- HW regs interface
      .hardware_regs ({ dmem_rdata_upper_0,
	                        dmem_rdata_lower_0,
	                        dmem_rdata_upper_1,
	                        dmem_rdata_lower_1,
	                        dmem_rdata_upper_2,
	                        dmem_rdata_lower_2,
	                        dmem_rdata_upper_3,
	                        dmem_rdata_lower_3,
	                        dmem_rdata_upper_4,
	                        dmem_rdata_lower_4,
	                        dmem_rdata_upper_5,
	                        dmem_rdata_lower_5,
	                        dmem_rdata_upper_6,
	                        dmem_rdata_lower_6,
                           imem_rdata
                          }
                       ),

      .clk              (clock),
      .reset            (reset)
    ); */

/* 
   always @(posedge clock or negedge reset)
   begin
		if(!reset)
      begin
		    //Instruction Fetch
			imem_address           <= PC_o;

			// imem_rdata             <= 32'hBADABDAB;
			// dmem_rdata_upper_0     <= 32'hBADABDAB;
			// dmem_rdata_lower_0     <= 32'hBADABDAB;
			// dmem_rdata_upper_1     <= 32'hBADABDAB;
			// dmem_rdata_lower_1     <= 32'hBADABDAB;
			// dmem_rdata_upper_2     <= 32'hBADABDAB;
			// dmem_rdata_lower_2     <= 32'hBADABDAB;
			// dmem_rdata_upper_3     <= 32'hBADABDAB;
			// dmem_rdata_lower_3     <= 32'hBADABDAB;
			// dmem_rdata_upper_4     <= 32'hBADABDAB;
			// dmem_rdata_lower_4     <= 32'hBADABDAB;
			// dmem_rdata_upper_5     <= 32'hBADABDAB;
			// dmem_rdata_lower_5     <= 32'hBADABDAB;
			// dmem_rdata_upper_6     <= 32'hBADABDAB;
			// dmem_rdata_lower_6     <= 32'hBADABDAB;

			// IMEM/REGFILE
			imem_we		  <= 0;
			imem_din      <= 0;

		end
		else 
      begin
			imem_address <= PC_o;
			imem_we		  <= 0;
			imem_din      <= 0;
			
			//Instruction Fetch
			if (!imem_interact[0])
         begin // If we are not interacting with the imem.
				imem_address <= PC_o;
				
			end
			/else
         begin //If interacting with imem
				//Ensure no writing to imem for now.
				imem_we		  <= imem_write[0]; //Write to or Read from imem
				imem_din      <= imem_wdata[INSTR_WIDTH-1:0]; // Din for writing to imem
				imem_address  <= imem_rw_address[IMEM_DEPTH_BITS-1:0]; //Address that will be written to or read from
				
				imem_rdata    <= CPU_instr; // Data to be read
			end
			
			dmem_rdata_upper_0     <= dmem_rdata_upper_0_wire;
			dmem_rdata_lower_0     <= dmem_rdata_lower_0_wire;
			dmem_rdata_upper_1     <= dmem_rdata_upper_1_wire;
			dmem_rdata_lower_1     <= dmem_rdata_lower_1_wire;
			dmem_rdata_upper_2     <= dmem_rdata_upper_2_wire;
			dmem_rdata_lower_2     <= dmem_rdata_lower_2_wire;
			dmem_rdata_upper_3     <= dmem_rdata_upper_3_wire;
			dmem_rdata_lower_3     <= dmem_rdata_lower_3_wire;
			dmem_rdata_upper_4     <= dmem_rdata_upper_4_wire;
			dmem_rdata_lower_4     <= dmem_rdata_lower_4_wire;
			dmem_rdata_upper_5     <= dmem_rdata_upper_5_wire;
			dmem_rdata_lower_5     <= dmem_rdata_lower_5_wire;
			dmem_rdata_upper_6     <= dmem_rdata_upper_6_wire;
			dmem_rdata_lower_6     <= dmem_rdata_lower_6_wire; 
      end 
   end  */

endmodule
