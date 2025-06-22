module tb_carry_lookahead;

   localparam DATA_WIDTH = 64;

   reg signed [DATA_WIDTH-1 : 0]    op1_i, op2_i;
   reg                              add_op_i;
   reg                              cin;
   wire signed [DATA_WIDTH-1 : 0]   res_o;
   wire                             cout;
   wire                             a_gt_b, a_lt_b, a_eq_b;

   carry_lookahead
   #(
      .DATA_WIDTH(DATA_WIDTH)
   )
   carry_lookahead_uut
   (
      .op1_i(op1_i),
      .op2_i(op2_i),
      .cin(cin),
      .a_gt_b(a_gt_b),
      .a_lt_b(a_lt_b),
      .a_eq_b(a_eq_b),
      .add_op_i(add_op_i),
      .res_o(res_o),
      .cout(cout)
   );

   initial
   begin
      op1_i    = 'd0;
      op2_i    = 'd0;
      add_op_i = 1'd1;
      cin      = 'd0;
   end

   initial
   begin
     $monitor("in1 = %0d, in2 = %0d, add_op_i = %0d, cin = %0d, result = %0d, cout = %0d || a_gt_b=%b, a_lt_b=%b, a_eq_b=%b, res_negative=%b", op1_i, op2_i, add_op_i, cin, res_o, cout, a_gt_b, a_lt_b, a_eq_b, carry_lookahead_uut.res_negative);
   end
	
  initial
   begin
     repeat(100)
      begin
         //for(integer i=0; i < 100; i=i+1)
         //begin
           op1_i    = {$random}%10;
           op2_i    = {$random}%10;
            add_op_i = $random;
            cin      = $random;
            #10;
         //end
      end
   end
  
  //uncomment for EDA playground
   //initial begin
   //  $dumpfile("dump.vcd");
   //  $dumpvars(0);
   //end

endmodule