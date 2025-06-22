`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:14 02/20/2025 
// Design Name: 
// Module Name:    stage_MEMtoWB
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: Pipeline Register for MEM/WB
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

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

module stage_MEMtoWB
    #(
        parameter DATA_WIDTH = 64,
        parameter REGFILE_ADDRESS_WIDTH = 5
    )
    (
        input                              		clk,          // Clock
        input                              		reset,        // Reset
        input                              		enable,       // Enable (for stalls)
		
        input  [DATA_WIDTH-1:0]            		alu_result_in,       // ALU result from EX stage
        input  [DATA_WIDTH-1:0]            		mem_write_data_in,   // Data to be written to memory
        input  [REGFILE_ADDRESS_WIDTH-1:0] 		rd_in,               // Destination register
        input                              		mem_write_in,        // Control signal: Write to memory?
	    input									write_back_in,		 // Control signal: Write back?
		
		
		output [DATA_WIDTH-1:0]            		wb_data_out,          // data from mux
		output [REGFILE_ADDRESS_WIDTH-1:0] 		wb_rd_out          // Destination register

    );

	//Outputs of the EX/MEM pipeline register
	wire [DATA_WIDTH-1:0]        			    exmem_alu_result_out;      // ALU result to WB stage
    wire [DATA_WIDTH-1:0]        			    exmem_mem_write_data_out;  // Data for memory write
    wire [REGFILE_ADDRESS_WIDTH-1:0]  		    exmem_rd_out;          	   // Destination register
    wire                         			    exmem_mem_write_out;       // Control: Write to memory?
	wire									    exmem_write_back_out;       // Control: Write back?
	
	
	//Outputs Data MEM
	wire [DATA_WIDTH-1:0] dmem_out;
	
	//Outputs of the MEM/WB pipeline register
	wire [DATA_WIDTH-1:0]            		    memwb_mem_read_data_out;
	//wire [REGFILE_ADDRESS_WIDTH-1:0] 		    memwb_rd_out;
	wire [DATA_WIDTH-1:0]            		    memwb_reg_data_out;
	wire 							 		    memwb_mem_to_reg_out;
	
	

    // Module Instantiation
    pipe_EXMEM #(
        .DATA_WIDTH(DATA_WIDTH),
        .REGFILE_ADDRESS_WIDTH(REGFILE_ADDRESS_WIDTH)
    ) pipe_EXMEM (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        
        // Inputs to pipeline
        .alu_result_in(alu_result_in),
        .mem_write_data_in(mem_write_data_in),
        .rd_in(rd_in),
        //.reg_write_in(reg_write_in),
        //.mem_read_in(mem_read_in),
        .mem_write_in(mem_write_in),
		.write_back_in(write_back_in),
        
        // Outputs from pipeline
        .alu_result_out(exmem_alu_result_out),
        .mem_write_data_out(exmem_mem_write_data_out),
        .rd_out(exmem_rd_out),
        //.reg_write_out(reg_write_out),
        //.mem_read_out(mem_read_out),
        .mem_write_out(exmem_mem_write_out),
		.write_back_out(exmem_write_back_out)
    );
	
	Data_Mem #(
		.ADDR_WIDTH(8),
		.DATA_WIDTH(64),
		.MEM_DEPTH(256),
		.INIT_FILE("Data_MM.hex")
	) Data_Mem (
		.clk(clk),
		.Write_Enable(exmem_mem_write_out),
		.Address(exmem_alu_result_out[7:0]),
		.WData(exmem_mem_write_data_out),
		.Dout(dmem_out)
	);
	
	pipe_MEMWB #(
		.DATA_WIDTH(64),
		.REGFILE_ADDRESS_WIDTH(5)
	) pipe_MEMWB (
		.clk(clk),
		.reset(reset),
		.enable(enable),

		// Inputs to the pipeline register
		.mem_read_data_in(dmem_out),
		.rd_in(exmem_rd_out),
		.reg_data_in(exmem_alu_result_out),
		.mem_to_reg_in(exmem_write_back_out),

		// Outputs from the pipeline register
		.mem_read_data_out(memwb_mem_read_data_out),
		.rd_out(wb_rd_out),
		.reg_data_out(memwb_reg_data_out),
		.mem_to_reg_out(memwb_mem_to_reg_out)
	);
	
	mux2to1 write_back_mux(
		.a(memwb_mem_read_data_out),
		.b(memwb_reg_data_out),
		.sel(memwb_mem_to_reg_out),
		.c(wb_data_out)
	);



endmodule
