`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:10:14 02/20/2025 
// Design Name:    pipeline_datapath_tb
// Module Name:    pipeline_datapath_tb
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// Testbench for pipeline_datapath module
//////////////////////////////////////////////////////////////////////////////////

module pipeline_datapath_tb;

    // Testbench parameters
    parameter DATA_WIDTH = 64;
    parameter DMEM_ADDR_WIDTH = 8;
    parameter INSTR_WIDTH = 32;
    parameter REGFILE_ADDRESS_WIDTH = 3;
    parameter NUM_ENTRIES = 512;

    // Signals to drive the design
    reg clk;
    reg reset;


    // Instantiate the pipeline_datapath module
    pipeline_datapath #(
        .DATA_WIDTH(DATA_WIDTH),
        .DMEM_ADDR_WIDTH(DMEM_ADDR_WIDTH),
        .INSTR_WIDTH(INSTR_WIDTH),
        .REGFILE_ADDRESS_WIDTH(REGFILE_ADDRESS_WIDTH),
        .NUM_ENTRIES(NUM_ENTRIES)
    ) uut (
        .clk(clk),
        .reset(reset)
    );

    // Clock Generation
    always begin
        clk = 1'b0;
        #5 clk = 1'b1;
        #5;
    end

    // Test Sequence
    initial begin
        // Initialize signals
        reset = 1'b1;
        #10 reset = 1'b0;

        // Test stimulus here
        // You can add specific instructions to load into the I-Mem or monitor the outputs

        #130; // Wait for some cycles
        
        // You can add more tests here, for example:
        // - Apply specific inputs to I-Mem
        // - Monitor the signals at each clock cycle
        
        // End simulation after some time
        $stop;
    end

endmodule
