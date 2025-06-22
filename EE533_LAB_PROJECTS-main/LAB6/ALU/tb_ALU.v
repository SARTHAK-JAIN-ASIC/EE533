`timescale 1ns/1ps

module ALU_tb;

   // Parameters
   parameter DATA_WIDTH    = 64;
   parameter ADDRESS_WIDTH = 6;

   // Inputs
   reg                       clock;
   reg                       reset;
   reg  [DATA_WIDTH-1:0]     alu_in1_i;
   reg  [DATA_WIDTH-1:0]     alu_in2_i;
   reg  [ADDRESS_WIDTH-1:0]  aluctrl_i;
   reg                       cin;

   // Outputs
   wire                      cout_o;
   wire                      alu_a_gt_b;
   wire                      alu_a_lt_b;
   wire                      alu_a_eq_b;
   wire [DATA_WIDTH-1:0]     alu_o;

   // Instantiate the Unit Under Test (UUT)
   ALU #(
      .DATA_WIDTH(DATA_WIDTH),
      .ADDRESS_WIDTH(ADDRESS_WIDTH)
   ) uut (
      .clock(clock),
      .reset(reset),
      .alu_in1_i(alu_in1_i),
      .alu_in2_i(alu_in2_i),
      .aluctrl_i(aluctrl_i),
      .cin(cin),
      .cout_o(cout_o),
      .alu_a_gt_b(alu_a_gt_b),
      .alu_a_lt_b(alu_a_lt_b),
      .alu_a_eq_b(alu_a_eq_b),
      .alu_o(alu_o)
   );

   // Clock generation
   initial begin
      clock = 0;
      forever #5 clock = ~clock; // 10ns clock period
   end

   // Testbench logic
   initial begin
      // Initialize Inputs
      reset = 1;
      alu_in1_i = 0;
      alu_in2_i = 0;
      aluctrl_i = 0;
      cin = 0;

      // Wait for global reset
      #20;
      reset = 0;

      // Test Addition
      aluctrl_i = 1; // ADD
      alu_in1_i = 64'h0000000000000001;
      alu_in2_i = 64'h0000000000000002;
      cin = 0;
      #20;
      $display("ADD: %h + %h = %h, Cout: %b", alu_in1_i, alu_in2_i, alu_o, cout_o);

      // Test Subtraction
      aluctrl_i = 2; // SUB
      alu_in1_i = 64'h0000000000000005;
      alu_in2_i = 64'h0000000000000003;
      cin = 1;
      #20;
      $display("SUB: %h - %h = %h, Cout: %b", alu_in1_i, alu_in2_i, alu_o, cout_o);

      // Test Bitwise AND
      aluctrl_i = 3; // BITWISE_AND
      alu_in1_i = 64'h00000000000000FF;
      alu_in2_i = 64'h00000000000000F0;
      #20;
      $display("AND: %h & %h = %h", alu_in1_i, alu_in2_i, alu_o);

      // Test Bitwise OR
      aluctrl_i = 4; // BITWISE_OR
      alu_in1_i = 64'h00000000000000FF;
      alu_in2_i = 64'h00000000000000F0;
      #20;
      $display("OR: %h | %h = %h", alu_in1_i, alu_in2_i, alu_o);

      // Test Bitwise XNOR
      aluctrl_i = 5; // BITWISE_XNOR
      alu_in1_i = 64'h00000000000000FF;
      alu_in2_i = 64'h00000000000000F0;
      #20;
      $display("XNOR: %h ~^ %h = %h", alu_in1_i, alu_in2_i, alu_o);

      // Test Comparison (A > B)
      aluctrl_i = 6; // COMPARE
      alu_in1_i = 64'h0100000000000317;
      alu_in2_i = 64'h0100000000000316;
      #20;
      $display("COMPARE: %h > %h: GT: %b, LT: %b, EQ: %b", alu_in1_i, alu_in2_i, alu_a_gt_b, alu_a_lt_b, alu_a_eq_b);

      // Test Logical Shift Left
      aluctrl_i = 7; // LOGICAL_SHIFT_LEFT
      alu_in1_i = 64'h0000000000000001;
      alu_in2_i = 64'h0000000000000002;
      #20;
      $display("SHIFT LEFT: %h << %h = %h", alu_in1_i, alu_in2_i, alu_o);

      // Test Logical Shift Right
      aluctrl_i = 8; // LOGICAL_SHIFT_RIGHT
      alu_in1_i = 64'h0000000000000008;
      alu_in2_i = 64'h0000000000000001;
      #20;
      $display("SHIFT RIGHT: %h >> %h = %h", alu_in1_i, alu_in2_i, alu_o);

      // Test Shift Then Compare
      aluctrl_i = 9; // SHIFT_THEN_COMPARE
      alu_in1_i = 64'h00000000000000FF;
      alu_in2_i = 64'h00000000000000F0;
      #20;
      $display("SHIFT THEN COMPARE: %h, %h, Match: %b", alu_in1_i, alu_in2_i, alu_o);

      // Test Substring Comparison (if implemented)
      aluctrl_i = 10; // SUBSTRING_COMPARISON
      alu_in1_i = 64'h00000000000000FF;
      alu_in2_i = 64'h00000000000000F0;
      #20;
      $display("SUBSTRING COMPARE: %h, %h, Match: %b", alu_in1_i, alu_in2_i, alu_o);

      // End simulation
      $stop;
   end
  
  initial begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
  end

endmodule
/*
module tb_ALU;
  parameter DATA_WIDTH         = 64;
  parameter ADDRESS_WIDTH      = 6;
  
  reg [DATA_WIDTH-1 : 0]    alu_in1_i, alu_in2_i;
  reg [ADDRESS_WIDTH-1 : 0] aluctrl_i;
  reg                       cin;
  
  reg                       clock, reset;
  wire                      cout_o, alu_a_gt_b, alu_a_lt_b, alu_a_eq_b;
  wire [DATA_WIDTH-1 : 0]   alu_o;
  wire [DATA_WIDTH-1 : 0]   out1;
  
  localparam CLOCK_PERIOD = 10;
  
  initial
    begin
      clock     = 0;
      reset     = 0;
      alu_in1_i = 'd0;
      alu_in2_i = 'd0;
      cin       = 'd0;
    end
  
  always
    #(CLOCK_PERIOD/2) clock = ~clock;
  
  ALU
  #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDRESS_WIDTH(ADDRESS_WIDTH)
  )
  UUT_ALU
  (
    .clock         (clock     ) ,
    .reset         (reset     ) ,
    .alu_in1_i     (alu_in1_i ) ,
    .alu_in2_i     (alu_in2_i ) ,
    .aluctrl_i     (aluctrl_i ) ,
    .cin           (cin       ) ,
    .cout_o        (cout_o    ) ,
    .alu_a_gt_b    (alu_a_gt_b) ,
    .alu_a_lt_b    (alu_a_lt_b) ,
    .alu_a_eq_b    (alu_a_eq_b) ,
    .alu_o         (alu_o     )
  );
  
  task automatic GEN_DATA();
  begin
    alu_in1_i = $urandom_range(1, 100);
    alu_in2_i = $urandom_range(1, 100);
    cin       = $random;
    $display($time, " alu_in1_i = %0d || alu_in2_i = %0d", alu_in1_i, alu_in2_i);
  end
  endtask
  
  task automatic ALU_Control();
  begin
    aluctrl_i = $urandom_range(1,9);
    $display($time, " aluctrl_i = %0d", aluctrl_i);
  end
  endtask
  
  initial
    begin
      @(posedge clock) reset = 1;
      @(posedge clock);
      
      repeat(50)
        begin
          alu_in1_i = $urandom_range(1,100);
          alu_in2_i = $urandom_range(1,100);
          aluctrl_i = $urandom_range(1,9);
          cin       = $random;
          $display($time, " alu_in1_i = %0d || alu_in2_i = %0d || aluctrl_i = %0d || alu_a_gt_b=%0d || alu_a_lt_b=%0d || alu_a_eq_b=%0d"
                        , alu_in1_i, alu_in2_i, aluctrl_i, alu_a_gt_b, alu_a_lt_b, alu_a_eq_b);
          @(posedge clock);
        end
      //
      //for(integer i=0; i < 5; i++)
      //begin
      //   GEN_DATA();
      //   ALU_Control();
      //  @(posedge clock);
      //end
      
      #50; $finish;
    end
   
  //initial begin
  //    $dumpfile("dump.vcd");
  //    $dumpvars(0);
  //end
  
endmodule
*/