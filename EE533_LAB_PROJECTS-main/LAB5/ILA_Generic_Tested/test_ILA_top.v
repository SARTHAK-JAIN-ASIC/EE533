`include "defines.v"
`include "trigger_generator.v"
`include "data_generation.v"
`include "reset_generator.v"
`include "signal_generator.v"

module test_ILA_top;
  
   parameter THRESHOLD 	= 24_000_000;
   parameter COUNT_WIDTH 	= 16;
 

  
   reg clock; 
   wire reset, trigger, primed;
   wire [`DATA_WIDTH-1 : 0] data;
   wire [`DATA_WIDTH-1 : 0] data_out;
   
   reg [COUNT_WIDTH-1:0] count;
   
   ila_top
   #(
      .COUNT_WIDTH(COUNT_WIDTH) 
   )
   ila
   (
      .clock(clock),
      .reset(reset),
      .trigger_i(trigger),
      
      .data_in(data),
      .data_out(data_out),
      .max_count_i(count),
      
      .primed_o(primed)
   );
   
   signal_generator
   #(
      .THRESHOLD(THRESHOLD)
   )
   sig_gen
   (
      .clock(clock), 
      .primed(primed),
      .reset(reset), 
      .trigger(trigger),
      .data(data)
   );
   
   initial
   begin
      clock = 0;
      count = 10;
   end

   always 
      #10 clock <= ~clock;
   
   initial 
      begin 
         $dumpfile("dump.vcd"); 
         $dumpvars(0);
      end
   
   //initial begin
   //   #100_000_000_000_000;
   //   $finish;
   //end
  
endmodule