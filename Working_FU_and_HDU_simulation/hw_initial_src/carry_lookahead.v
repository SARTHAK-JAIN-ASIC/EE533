module carry_lookahead
#(
   parameter DATA_WIDTH = 64
)
(
   input [DATA_WIDTH-1 : 0]   op1_i, op2_i,
   input                      cin,
   input                      add_op_i,
   output [DATA_WIDTH-1 : 0]  res_o,
   output                     cout,

   output                     a_gt_b,
   output                     a_lt_b,
   output                     a_eq_b
);

   wire [DATA_WIDTH-1 : 0] G, P, inv_op2;
   wire [DATA_WIDTH : 0]   C;
  
   wire [DATA_WIDTH - 1 : 0] res_unsigned;
   wire                      res_negative;

   assign C[0]      = add_op_i ? cin : 1;
   assign inv_op2   = add_op_i ? op2_i : ~(op2_i);
   assign cout      = C[DATA_WIDTH];

   genvar i;

   generate
      for(i=0; i<DATA_WIDTH; i=i+1)
      begin : CLA_LOOP
        assign G[i] = op1_i[i] & inv_op2[i];
        assign P[i] = op1_i[i] ^ inv_op2[i];
        
        assign C[i+1] = G[i] | (P[i] & C[i]);
        
        //computing sum//
        assign res_unsigned[i] = op1_i[i] ^ inv_op2[i] ^ C[i];
      end
	endgenerate
  
   assign res_negative = ~add_op_i & (C[DATA_WIDTH] ^ op1_i[DATA_WIDTH-1] ^ inv_op2[DATA_WIDTH-1]); //is the operation subtract AND if cout was generated i.e in1 < in2//
   assign res_o        = res_negative ? {{(DATA_WIDTH-1){1'b1}}, res_unsigned} : res_unsigned; //if negative result, output sign extended number. If positive, display normal//
   
   assign a_gt_b = (~a_lt_b) & (~a_eq_b);
   assign a_lt_b = (op1_i < op2_i);
   assign a_eq_b = (op1_i == op2_i);

endmodule