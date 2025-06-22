module tb_bfloat16_add;

  // Declare testbench signals
  reg [15:0] a, b;      // bfloat16 inputs
  reg clk;
  reg reset;
  wire [15:0] result;   // bfloat16 result

  // Instantiate the bfloat16_add module
  bfloat16_add uut (
    .clk(clk),
	.reset(reset),
    .a(a),
    .b(b),
    .result(result)
  );
  
  always
	begin
		#10 clk = ~clk;
	end
	
	  

  // Initialize the signals
  initial begin
	reset      = 0;
	clk        = 0;
	a = 16'b0000000000000000;
	b = 16'b0000000000000000;
	#80; reset = ~reset;
	#80; reset = ~reset;
  
    // Monitor result for debugging
    $monitor("a = %h, b = %h, result = %h", a, b, result);
	// $monitor("a = %b, b = %b, result = %b", a, b, result);
    
    // Test case 1: Simple addition with no overflow
    a = 16'b0100000000000000;  // bfloat16 representation of 2.0
    b = 16'b0100000010000000;  // bfloat16 representation of 4.0
    #20;  // Wait for result

     // Test case 2: Addition with exponent difference
    a = 16'b0011111110000000;  // bfloat16 representation of 1.0
    b = 16'b0100000110000000;  // bfloat16 representation of 16.0
    #20;
 
    // Test case 3: Subtraction with different signs
    a = 16'b1100000000000000;  // bfloat16 representation of -2.0
    b = 16'b0100000010000000;  // bfloat16 representation of 4.0
    #20;
	
	// Test case 4: Addition with decimals
    a = 16'b0100000110111010;  // bfloat16 representation of 23.25
    b = 16'b0100001000111011;  // bfloat16 representation of 46.75
    #20; 
	
	// Test case 5: Subtraction with decimals
	a = 16'b0100001010010001;  // bfloat16 representation of 72.5
    b = 16'b1100000110110100;  // bfloat16 representation of -22.5
    #20;
	
	// Test case 6: Subtraction with decimals
	a = 16'b1100001010010001;  // bfloat16 representation of -72.5
    b = 16'b1100000110110100;  // bfloat16 representation of -22.5
    #20;

    // Test case 7: Overflow scenario
    a = 16'b0111111100000000;  // bfloat16 representation of max value (just before overflow)
    b = 16'b0111111100000000;  // bfloat16 representation of max value (just before overflow)
    #20; 

    // Test case 8: Denormalized result
    a = 16'b0000000000000000;  // bfloat16 representation of zero
    b = 16'b0000000000000001;  // bfloat16 representation of very small value
    #20;
	
	// Test case 9: More decimals
    a = 16'b0100000100011110;  // bfloat16 representation of 9.8765
    b = 16'b0100000110100001;  // bfloat16 representation of 20.1234
    #20;
	
	// Test case 10: More decimals
    a = 16'b0100000100011110;  // bfloat16 representation of 9.875
    b = 16'b0100001011000101;  // bfloat16 representation of 98.513
    #20; 
	



    // End the simulation
	
	#1000;
    $finish;
  end

endmodule
