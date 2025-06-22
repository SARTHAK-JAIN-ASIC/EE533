module pipe_IFID
#(
   parameter INSTR_WIDTH   = 32,
   parameter DATA_WIDTH    = 64,
   parameter IMEM_DEPTH_BITS = 9
)
(
   input                            clock, reset,
   input                            IF_ID_Write, //is the pipe enabled or stalled?
   input                            flush_IF_ID,
   input       [DATA_WIDTH -1 : 0]  data_IR_i,
   input       [INSTR_WIDTH-1 : 0]  instruction_i,

   output reg  [DATA_WIDTH -1 : 0]  data_IR_o,
   output reg  [INSTR_WIDTH-1 : 0]  instruction_o,

   output reg                       IF_WBFF_o
);

   /* always @(posedge clock, negedge reset)
   begin
      if(!reset) */
   always @(posedge clock)
   begin
      if(reset)
      begin
         instruction_o     <= 32'd0;
         data_IR_o         <= 64'd0;
         IF_WBFF_o         <= 1'd0 ;
      end
      else if(!flush_IF_ID)
      begin
         instruction_o <= 32'd0;
         data_IR_o     <= 64'd0;
         IF_WBFF_o     <= 1'd0;
      end
      else if(IF_ID_Write)
      begin
         instruction_o     <= instruction_i;
         data_IR_o         <= data_IR_i;
         IF_WBFF_o         <= 1'd1;
      end
   end


endmodule


