module imm_gen
#(
   parameter INSTR_WIDTH   = 0,
   parameter DATA_WIDTH    = 0,
   parameter ITYPE_OFFSET  = 12
)
(
   input    [INSTR_WIDTH - 1 : 0]   instruction,
   output   [DATA_WIDTH  - 1 : 0]   imm_data
);

   localparam  [1:0] LOAD        =  2'd0,
                     STORE       =  2'd1,
                     COND_BRANCH =  2'd2;


   always @(*)
   begin
      case(instruction[5:6])
         LOAD        : imm_data[ITYPE_OFFSET-1 : 0] = instruction[31:20]; //11:0
         STORE       : imm_data[ITYPE_OFFSET-1 : 0] = {instruction[31:25], instruction[11:7]}; //11:0
         COND_BRANCH : imm_data[ITYPE_OFFSET-1 : 0] = {instruction[31], instruction[7], instruction[30:25], instruction[11:8]}; //11:0
      endcase
   end

   assign imm_data = {52{imm_data[ITYPE_OFFSET-1]}, imm_data[ITYPE_OFFSET-1 : 0]};

endmodule