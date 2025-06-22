//`include "defines.v"

module regfile
  #(
   	parameter REGISTERED_OUTPUT = 0,
      parameter ADDRESS_WIDTH     = 5,
      parameter DATA_WIDTH        = 64,
      parameter REGFILE_WIDTH     = 32
  )
  (
   input                         clock,

   input [ADDRESS_WIDTH -1 : 0]  r1addr, r2addr,
   input [ADDRESS_WIDTH - 1 : 0] waddr,
   input [DATA_WIDTH - 1 : 0]    wdata,
   input                         reg_write,

   output [DATA_WIDTH-1 : 0]     r1data_o,
   output [DATA_WIDTH-1 : 0]     r2data_o
);

   reg [DATA_WIDTH-1 : 0] register [REGFILE_WIDTH-1 : 0];

   initial
   begin
      register[31]= 64'd0 ;
      register[7] = 64'd1 ;
      register[6] = 64'd6 ;
      register[5] = 64'd5 ;
      register[4] = 64'd4 ;
      register[3] = 64'd3 ;
      register[2] = 64'd12;
      register[1] = 64'd16;
   end

   always @(negedge clock)
   begin
      if(reg_write)
         register[waddr] <=  wdata;
   end

   generate
      if(REGISTERED_OUTPUT)
      begin
         reg [DATA_WIDTH-1 : 0] data_reg1;
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