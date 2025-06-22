module reset_generator
  #(
    parameter THRESHOLD = 1_000_000 
  )
  (
    input  clock,
    output reset
  );
  
  reg [$clog2(THRESHOLD)-1 : 0] counter = 0;
  reg clock_strobe = 0;
  
  assign reset = clock_strobe;
  
  always @(posedge clock)
    clock_strobe <= (counter == (THRESHOLD-1'b1)) ;
  
  always @(posedge clock)
   begin
      if(clock_strobe)
         counter <= 1;
      else
         counter <= counter + 1;
   end
endmodule