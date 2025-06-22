`timescale 1ns / 1ps
`include "arm_datapath.v"

module ARM_datapath_tb;
	reg clock;
	reg reset;
   reg flush;

   arm_datapath ARMv7(clock, reset);
   
   initial
   begin
		reset       = 0;
      clock       = 0;
      flush       = 0;
      #80; reset = ~reset;
	  #80; reset = ~reset;
		#1000;
      $finish;
	end

	always
	begin
		#20 clock = ~clock;
	end


endmodule