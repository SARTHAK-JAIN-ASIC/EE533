`timescale 1ns / 1ps

module imem32x512 (
    input wire clk,                           // Clock input
    input wire [8:0] addr,                   // 9-bit address (for 512 memory locations)
    input wire [31:0] din,                   // 32-bit data input (for writing)
    input wire we,                            // Write Enable signal
	input wire re,
    output reg [31:0] dout                   // 32-bit data output (for reading)
);

    // Define a 512 x 32-bit memory array
    (* ram_style = "block" *) reg [31:0] mem [0:511]; 

    // Read Operation (Synchronous, triggered on the positive edge of the clock)
    always @(posedge clk) begin
		if(re) begin
			dout <= mem[addr];                    // Read from memory at the specified address
		end
    end

    // Write Operation (Triggered at negative edge of clock, controlled by Write_Enable)
    always @(negedge clk) begin
        if (we) begin
            mem[addr] <= din;                // Write to memory at the specified address
        end
    end

    // Preload memory from a file during initialization (if a file is specified)
    initial begin
        $readmemh("imem32x512.hex", mem);     // Load the instruction memory from the hex file
    end

endmodule
