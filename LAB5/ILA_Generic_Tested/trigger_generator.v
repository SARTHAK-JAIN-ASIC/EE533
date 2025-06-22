module trigger_generator
  (
	input clock,
    input reset,
    input primed,
    
    output reg trigger
  );
  
  reg primedz, primedzz, primedzzz, primedzzzz;
  
   always @(posedge clock)
   begin
      if(reset)
      begin
         primedz     <= 0;
         primedzz    <= 0;
         primedzzz   <= 0;
         primedzzzz  <= 0;
         trigger     <= 0;
      end
      else
      begin
         primedz   <= primed;
         primedzz  <= primedz;
         primedzzz <= primedzz;
         primedzzzz<= primedzzz;
         trigger   <= primedz & ~primedzz;
      end
   end
 
endmodule