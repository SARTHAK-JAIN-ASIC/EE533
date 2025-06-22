module tb_bfloat16_mult;

  // Declare testbench signals
  reg [15:0] a, b;      // bfloat16 inputs
  wire [15:0] result;   // bfloat16 result

  // Instantiate the bfloat16_add module
  bfloat16_mult uut (
    .a(a),
    .b(b),
    .result(result)
  );

  // Initialize the signals
  initial begin
    // Monitor result for debugging
    // $monitor("a = %h, b = %h, result = %h", a, b, result);
	$monitor("a = %b, b = %b, result = %b", a, b, result);
    
    // Test case 1: Simple integer multiplication
    a = 16'b0100000000000000;  // bfloat16 representation of 2.0
    b = 16'b0100000010000000;  // bfloat16 representation of 4.0
    #10;  // Wait for result
	
	// Test case 2: Decimal point multiplication
    a = 16'b0100000001100000;  // bfloat16 representation of 3.5
    b = 16'b0100000011111000;  // bfloat16 representation of 7.75
    #10;  // Wait for result
	
	// Test case 3: Divide by 2
    a = 16'b0011111100000000;  // bfloat16 representation of 0.5
    b = 16'b0100001011111010;  // bfloat16 representation of 125
    #10;  // Wait for result
	
	// Test case 4: More decimals
	a = 16'b0011111110011110;  // bfloat16 representation of 1.2345
    b = 16'b0100000100011110;  // bfloat16 representation of 9.8765
    #10;  // Wait for result
	
	// Test case 5: Negative * Positive
	a = 16'b1100001011001000;  // bfloat16 representation of -100
    b = 16'b0100001010100000;  // bfloat16 representation of 80
    #10;  // Wait for result
	
	// Test case 5: Negative * Negative
	a = 16'b1100000110100000;  // bfloat16 representation of -20
    b = 16'b1100000111001000;  // bfloat16 representation of -125
    #10;  // Wait for result
	
	// Test case 6: Low values
	a = 16'b0011110000100100;  // bfloat16 representation of 0.01
    b = 16'b0011101110100100;  // bfloat16 representation of 0.005
    #10;  // Wait for result

// Test case 7: multiply with 0
	a = 16'b0000000000000000;  // bfloat16 representation of 0.01
    b = 16'h3f6a;  // bfloat16 representation of 0.005
    #10;  // Wait for result
	



    // End the simulation
    $finish;
  end

endmodule
