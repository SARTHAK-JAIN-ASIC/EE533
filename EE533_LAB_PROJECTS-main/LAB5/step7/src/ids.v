`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    2/8/2025
// Design Name: 
// Module Name:    ids.v
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Passthrough for reference_router
//
//////////////////////////////////////////////////////////////////////////////////
module ids
	#(parameter DATA_WIDTH = 64,
      parameter CTRL_WIDTH=DATA_WIDTH/8,
      parameter UDP_REG_SRC_WIDTH = 2,
      parameter STAGE_NUMBER = 2,
      parameter NUM_QUEUES = 8
      )
	  
	(
	  //From the Input Arbiter
	  input  [DATA_WIDTH-1:0] data_in,    //connect to input_arbiter out_data
	  input  [CTRL_WIDTH-1:0] ctrl_in,    //connect to input_arbiter out_ctrl
      input                   wr_in,      //connect to input_arbiter out_wr
      output                  rdy_out,    //connect to input_arbiter out_rdy
  
	  //To the Output Port Lookup
      output [DATA_WIDTH-1:0] data_out,   //connect to output_port_lookup in_data
      output [CTRL_WIDTH-1:0] ctrl_out,   //connect to output_port_lookup in_ctrl
      output                  wr_out,     //connect to output_port_lookup in_wr
      input                   rdy_in      //connect to output_port_lookup in_rdy
	
	
	);


    // Wire types for signals
    wire [DATA_WIDTH-1:0] data_in_wire;
    wire [CTRL_WIDTH-1:0] ctrl_in_wire;
    wire wr_in_wire;
    wire rdy_in_wire;

    wire [DATA_WIDTH-1:0] data_out_wire;
    wire [CTRL_WIDTH-1:0] ctrl_out_wire;
    wire wr_out_wire;
    wire rdy_out_wire;

    // Assign inputs to wires
    assign data_in_wire = data_in;
    assign ctrl_in_wire = ctrl_in;
    assign wr_in_wire   = wr_in;
    assign rdy_in_wire  = rdy_in;

    // Passthrough logic (Connect outputs with the corresponding wire)
    assign data_out = data_in_wire;
    assign ctrl_out = ctrl_in_wire;
    assign wr_out   = wr_in_wire;
    assign rdy_out  = rdy_in_wire;


endmodule

