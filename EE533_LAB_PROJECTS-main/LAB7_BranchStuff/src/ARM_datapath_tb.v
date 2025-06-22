`include "arm_datapath.v"

module ARM_datapath_tb;
	reg clock;
	reg reset;
   reg flush;

   arm_datapath ARMLEGv8(clock, reset);
   
   initial
   begin
		reset       = 0;
      clock       = 0;
      flush       = 0;
      #10; reset = ~reset;
		#500;
      $finish;
	end

	always
	begin
		#10 clock = ~clock;
	end


endmodule