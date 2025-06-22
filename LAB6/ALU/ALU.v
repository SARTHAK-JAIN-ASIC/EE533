//`include "defines.v"
`include "carry_lookahead.v"
`include "shift_then_compare.v"

module ALU
  #(
     	parameter DATA_WIDTH   		= 64,
    	parameter ADDRESS_WIDTH		= 6
  )
   (
     input                                clock, reset,
     input        [DATA_WIDTH-1 : 0]      alu_in1_i,
     input        [DATA_WIDTH-1 : 0]      alu_in2_i,
     input        [ADDRESS_WIDTH-1 : 0]   aluctrl_i,
     input                                cin,

     output reg                           cout_o,
     output reg                           alu_a_gt_b,
     output reg                           alu_a_lt_b,
     output reg                           alu_a_eq_b,

     output reg   [DATA_WIDTH-1 : 0]      alu_o
   );
  
   wire  [DATA_WIDTH-1 : 0]         res_o;
   wire                             cout;
   wire                             match_detected;
   wire  [DATA_WIDTH-1 : 0]         sum_or_diff;
   wire  [DATA_WIDTH-1 : 0]         bitwise_and;
   wire  [DATA_WIDTH-1 : 0]         bitwise_or;
   wire  [DATA_WIDTH-1 : 0]         bitwise_xnor;

   wire                             a_gt_b;
   wire                             a_lt_b;
   wire                             a_eq_b;
   

   localparam [ADDRESS_WIDTH-1 : 0]    ADD                   = 1,
                                       SUB                   = 2,
                                       BITWISE_AND           = 3,
                                       BITWISE_OR            = 4,
                                       BITWISE_XNOR          = 5,
                                       COMPARE               = 6,
                                       LOGICAL_SHIFT_LEFT    = 7,
                                       LOGICAL_SHIFT_RIGHT   = 8,
                                       SHIFT_THEN_COMPARE    = 9,
                                       SUBSTRING_COMPARISON  = 10;

   carry_lookahead
   #(
      .DATA_WIDTH(DATA_WIDTH)
   )
   carry_lookahead_uut
   (
      .op1_i(alu_in1_i),
      .op2_i(alu_in2_i),
      .cin(cin),
      .a_gt_b(a_gt_b),
      .a_lt_b(a_lt_b),
      .a_eq_b(a_eq_b),
      .add_op_i(add_op_i),
      .res_o(res_o),
      .cout(cout)
   );

   //Instantiate shift then compare 
   shift_then_compare
   #(
      .DATA_WIDTH(DATA_WIDTH)
   )
   pattern_matcher 
   (
      .clock            (clock         ),
      .reset            (reset         ),
      .data_in          (alu_in1_i     ),
      .pattern_in       (alu_in2_i     ),
      .match_detected_o (match_detected)
   );

   //Addition or Subtraction//
   assign add_op_i         = (aluctrl_i == 2) ? 0 : 1;
   assign sum_or_diff      = res_o;
   //assign cout_o           = cout;

   //bitwise AND//
   assign bitwise_and      = alu_in1_i & alu_in2_i;

   //bitwise OR//
   assign bitwise_or       = alu_in1_i | alu_in2_i;

   //bitwise XNOR//
   assign bitwise_xnor     = (alu_in1_i ~^ alu_in2_i);


   always @(*)
   begin

      //alu_a_gt_b <= 1'b0;
      //alu_a_lt_b <= 1'b0;
      //alu_a_eq_b <= 1'b0;

      case(aluctrl_i)
         ADD                  :  begin alu_o    = sum_or_diff; cout_o = cout; end
         SUB                  :  begin alu_o    = sum_or_diff; cout_o = cout; end
         BITWISE_AND          :  alu_o          = bitwise_and ;
         BITWISE_OR           :  alu_o          = bitwise_or  ;
         BITWISE_XNOR         :  alu_o          = bitwise_xnor;
         COMPARE              :
                                 begin
                                    alu_a_gt_b  = a_gt_b;
                                    alu_a_lt_b  = a_lt_b;
                                    alu_a_eq_b  = a_eq_b;
                                 end
         LOGICAL_SHIFT_LEFT   :  alu_o          = alu_in1_i << alu_in2_i;
         LOGICAL_SHIFT_RIGHT  :  alu_o          = alu_in1_i >> alu_in2_i;
         SHIFT_THEN_COMPARE   :  alu_o          = match_detected;

        default               :  alu_o          = {(DATA_WIDTH){1'b0}};

      endcase
   end

endmodule