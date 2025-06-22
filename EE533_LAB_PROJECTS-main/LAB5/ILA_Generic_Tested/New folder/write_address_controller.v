`include "defines.v"

module write_address_controller
(
   input reset, clock,
   input write_en_i  ,

   output reg [`ADDR_WIDTH-1 : 0]   waddr_i,
   output reg                       primed_o = 0

);

   always @(posedge clock)
   begin
      if(reset)
         waddr_i <= 'd0;
      else
      begin
         waddr_i <= (write_en_i) ? (waddr_i + 1) : waddr_i;
      end
   end

   always @(posedge clock)
   begin
      if(reset)
         primed_o <= 0;
      else if(!primed_o)
         primed_o <= &waddr_i;
   end

   initial begin
         primed_o = 1'd0;
   end

endmodule


