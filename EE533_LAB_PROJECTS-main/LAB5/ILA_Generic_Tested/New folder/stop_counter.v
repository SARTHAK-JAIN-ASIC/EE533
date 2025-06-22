

module stop_counter
#(
   parameter COUNT_WIDTH = 16
)
(
   input                               reset, clock,
   input                               trigger_i, primed_i,
   input       [COUNT_WIDTH - 1 : 0]   max_count_i,

   output reg                          triggered,
   output reg                          stop_o
);

   reg [COUNT_WIDTH - 1 : 0]  stop_counter;
   //reg                        triggered;

   always @(posedge clock)
   begin
      if(reset)
         triggered <= 1'd0;
      else if(primed_i && trigger_i)
         triggered <= 1'd1; 
   end

   always @(posedge clock)
   begin
      if(reset)
         stop_counter <= 'd0;
      else
         stop_counter <= triggered ? stop_counter + 1 : stop_counter;
   end

   always @(posedge clock)
   begin
      if(reset)
         stop_o <= 1'd0;
      else
         stop_o <= (stop_counter >= max_count_i) && triggered;
   end

endmodule