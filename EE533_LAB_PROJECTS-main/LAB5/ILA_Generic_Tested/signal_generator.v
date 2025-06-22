`include "defines.v"

module signal_generator
  #(
   	parameter THRESHOLD = 1_000_000 
  )
  (
    input  clock, primed,
    output reset, trigger,
    output [`DATA_WIDTH - 1 : 0] data
  );
 
  
  reset_generator
  	#(
      .THRESHOLD(THRESHOLD)
     )
    reset_gen
  	(
      .clock(clock),
      .reset(reset)
    );
  
  data_generation
  	data_gen
  	(
      .clock(clock),
      .reset(reset),
      .data(data)
    );
  
  trigger_generator
  	trigger_gen
  	(
      .clock(clock),
      .reset(reset),
      .primed(primed),
      .trigger(trigger)
    );
 
endmodule