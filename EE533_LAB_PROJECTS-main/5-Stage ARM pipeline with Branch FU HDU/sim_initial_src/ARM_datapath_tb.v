`timescale 1ns / 1ps
`include "arm_datapath.v"

module ARM_datapath_tb;
	reg clock;
	reg reset;
   reg flush;

   arm_datapath ARMv7(clock, reset);
   
	parameter PERIOD = 166;

   initial
   begin
		reset       = 0;
      clock       = 0;
      flush       = 0;
      #(4*83); reset = ~reset;
	   #(4*83); reset = ~reset;
		#6000;
      $finish;
	end

	always
	begin
		#83 clock = ~clock;
	end


endmodule