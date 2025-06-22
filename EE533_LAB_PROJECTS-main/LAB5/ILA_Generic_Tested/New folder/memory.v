`include "defines.v"

module memory
(
   input clock, reset,
   input write_en_i, 

   input       [(`ADDR_WIDTH-1) : 0]      waddr_i, raddr_i,
   input       [(`DATA_WIDTH-1) : 0]      data_write_mem_i,
   output reg  [(`DATA_WIDTH-1) : 0]      data_read_mem_o
);

   reg [`DATA_WIDTH-1 : 0] mem [`MEMORY_SIZE-1 : 0];
   reg [(`ADDR_WIDTH-1) : 0] delayed_addr;

   always @(posedge clock)
      begin
         if(write_en_i)
            mem[waddr_i] <= data_write_mem_i;
      end

   //always @(posedge clock)
   //begin
   //   if(reset)
   //      delayed_addr <= 'd0;
   //   else
   //      delayed_addr <= raddr_i;
   //end

   always @(posedge clock)
   begin
       if (!write_en_i)
         data_read_mem_o <= mem[raddr_i];
   end

endmodule