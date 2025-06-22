//`include "defines.v"

module regfile
  #(
   	parameter REGISTERED_OUTPUT = 0,
      parameter REGFILE_ADDRESS_WIDTH = 3,
	  parameter DMEM_ADDRESS_WIDTH = 8,
      parameter DATA_WIDTH        = 64
  )
  (
   input                         clock,

   input [REGFILE_ADDRESS_WIDTH -1 : 0]  r1addr, r2addr,
   input [REGFILE_ADDRESS_WIDTH - 1 : 0] waddr,
   input [DATA_WIDTH - 1 : 0]    wdata,
   input                         reg_write,

   output [DMEM_ADDRESS_WIDTH-1 : 0]     r1data_o,
   output [DATA_WIDTH-1 : 0]     r2data_o
);

   reg [DATA_WIDTH-1 : 0] register [DATA_WIDTH-1 : 0];

   always @(negedge clock)
   begin
      if(reg_write)
         register[waddr] <=  wdata;
   end

   generate
      if(REGISTERED_OUTPUT)
      begin
         reg [DMEM_ADDRESS_WIDTH-1 : 0] data_reg1;
         reg [DATA_WIDTH-1 : 0] data_reg2;
         always @(posedge clock)
         begin
           data_reg1 <= (r1addr != 0) ? register[r1addr] : 'd0;
           data_reg2 <= (r1addr != 0) ? register[r2addr] : 'd0;
         end

         assign r1data_o = data_reg1;
         assign r2data_o = data_reg2;
      end
      else
      begin
        assign r1data_o = (r1addr != 0) ? register[r1addr] : 'd0;
        assign r2data_o = (r2addr != 0) ? register[r2addr] : 'd0;
      end
   endgenerate

endmodule