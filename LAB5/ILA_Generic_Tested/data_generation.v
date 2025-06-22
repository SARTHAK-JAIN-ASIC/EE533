`include "defines.v"

module data_generation
  (
    input 							   clock, reset,
    output reg [(`DATA_WIDTH-1) : 0]   data
  );
  
  always @(posedge clock)
    begin
      if(reset)
        data <= 32'd1;
      else
        data <= data + 1;
    end
  
endmodule