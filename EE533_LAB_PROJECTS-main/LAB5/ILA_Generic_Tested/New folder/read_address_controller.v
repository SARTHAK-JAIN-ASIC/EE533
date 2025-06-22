`include "defines.v"

module read_address_controller
(
   input                            reset, clock,
   input       [`ADDR_WIDTH-1 : 0]  waddr_i,
   input                            read_en_i,
   input                            triggered,

   output reg  [`ADDR_WIDTH-1 : 0]  raddr_o
);
 
   reg [`ADDR_WIDTH-1 : 0] curr_addr;
   //reg [`ADDR_WIDTH-1 : 0] curr_addr_reset;
   reg [`ADDR_WIDTH-1 : 0] stored_addr;
   reg                     triggered_prev;
   reg                     read_en_i_reg;

   always @(posedge clock)
   begin
      if(reset)
      begin
         stored_addr    <= 'd0;
         triggered_prev <= 1'd0;
         read_en_i_reg  <= 1'd0;
      end
      else
      begin
         read_en_i_reg  <= read_en_i;
         triggered_prev <= triggered;
         if(triggered && !triggered_prev)
            stored_addr <= waddr_i;
      end
   end
 
   always @(posedge clock)
   begin
      if(reset)
         curr_addr <= 'd0;
      else if(read_en_i & ~read_en_i_reg)
         curr_addr <= 1'd1;
      else
         curr_addr <= curr_addr + 1;
         //curr_addr <= read_en_i ? curr_addr + 1 : curr_addr;
   end

   always @(posedge clock)
   begin
      if(reset)
         raddr_o <= 'd0;
      else if(read_en_i && !read_en_i_reg) // First read cycle
         raddr_o <= (stored_addr - `OFFSET + `MEMORY_SIZE) % `MEMORY_SIZE;
      //(curr_addr == (waddr_i-1) ) 
      else if(read_en_i)
         raddr_o <= (raddr_o + 1) % `MEMORY_SIZE;
      //else
      //   raddr_o <= ((curr_addr) - `OFFSET + `MEMORY_SIZE + stored_addr) % `MEMORY_SIZE;
   end


endmodule