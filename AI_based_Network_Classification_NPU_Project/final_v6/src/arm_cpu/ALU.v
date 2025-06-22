//`include "defines.v"
//`include "carry_lookahead.v"
//`include "shift_then_compare.v"

module ALU
  #(
     	parameter DATA_WIDTH   		= 64,
    	parameter ADDRESS_WIDTH		= 6
  )
   (
     input                                clock, reset,
     input        [DATA_WIDTH-1 : 0]      alu_in1_i,
     input        [DATA_WIDTH-1 : 0]      alu_in2_i,
     input        [3 : 0]                 aluctrl_i,
     input                                cin,

     output reg                           cout_o,
     output reg                           alu_a_gt_b,
     output reg                           alu_a_lt_b,
     output reg                           zero,

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
   

   localparam [3 : 0]   ADD                   = 4'b0010,
                        SUB                   = 4'b0110,
                        BITWISE_AND           = 4'b0000,
                        BITWISE_OR            = 4'b0001,
                        BITWISE_XNOR          = 4'b0101,
                        COMPARE               = 4'b0011,
                        LOGICAL_SHIFT_LEFT    = 4'b0111,
                        LOGICAL_SHIFT_RIGHT   = 4'b1000,
                        SHIFT_THEN_COMPARE    = 4'b1001,
                        SUBSTRING_COMPARISON  = 4'b1010,
						MOV_IMM               = 4'b1011,
						MOV_REG               = 4'b1100;

   // carry_lookahead
   cla_hierarchical
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
   /* shift_then_compare
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
   ); */

   //Addition or Subtraction//
   assign add_op_i         = (aluctrl_i == 4'b0010) ? 1 : 0;
   assign sum_or_diff      = res_o;
   //assign cout_o           = cout;

   //bitwise AND// -- Don't need for now
   //assign bitwise_and      = alu_in1_i & alu_in2_i;

   //bitwise OR// -- Don't need for now
   //assign bitwise_or       = alu_in1_i | alu_in2_i;

   //bitwise XNOR// -- Don't need for now
   //assign bitwise_xnor     = (alu_in1_i ~^ alu_in2_i);


   always @(*)
   begin

      alu_a_gt_b = 1'b0;
      alu_a_lt_b = 1'b0;
      zero       = 1'b0;
	  alu_o      = 'd0;
	  cout_o     = 'd0;

      case(aluctrl_i)
         ADD                  :  begin alu_o    = sum_or_diff; cout_o = cout; end
         SUB                  :  
			begin 
				//alu_o    = sum_or_diff; cout_o = cout; 
				if(alu_in1_i > alu_in2_i)
					alu_o = alu_in1_i - alu_in2_i;
				else
					alu_o = alu_in2_i - alu_in1_i;

			
			end
         // BITWISE_AND          :  alu_o          = bitwise_and ;                 -- Don't need for now
         // BITWISE_OR           :  alu_o          = bitwise_or  ;                 -- Don't need for now
         // BITWISE_XNOR         :  alu_o          = bitwise_xnor;                 -- Don't need for now
         COMPARE              :                                                
                                 begin                                         
                                    alu_a_gt_b  = a_gt_b;                      
                                    alu_a_lt_b  = a_lt_b;                      
                                    zero        = a_eq_b;  
									
                                 end                                           
         // LOGICAL_SHIFT_LEFT   :  alu_o          = alu_in1_i << alu_in2_i;       -- Don't need for now
         // LOGICAL_SHIFT_RIGHT  :  alu_o          = alu_in1_i >> alu_in2_i;       -- Don't need for now
         // SHIFT_THEN_COMPARE   :  alu_o          = match_detected;               -- Don't need for now
		 MOV_IMM              :  alu_o          = alu_in2_i;
		 MOV_REG              :  alu_o          = alu_in2_i;

        default               :  alu_o          = {(DATA_WIDTH){1'b0}};

      endcase
   end

endmodule
