module Data_Mem #(
    parameter ADDR_WIDTH = 8,   // Default: 8-bit address (256 locations)
    parameter DATA_WIDTH = 66,  // Default: 64-bit data per entry
    parameter MEM_DEPTH  = 256,  // Default: 256 memory entries
    parameter INIT_FILE  = "Data_MM.hex" // Default memory initialization file
) (
    input wire clk,                           // Clock input
    input wire reset,
    // Port A (Read/Write)
    input wire [ADDR_WIDTH-1:0] addr_a,                  // 9-bit address for Port A
    input wire [DATA_WIDTH-1:0] din_a,                  // 32-bit data input for Port A
    input wire we_a,                          // Write Enable for Port A
    input wire re_a,                          // Read Enable for Port A
    output reg [DATA_WIDTH-1:0] dout_a,                 // 32-bit data output for Port A
    
    // Port B (Read/Write) //This is used for HW/SW interface, thus we made the inputs as registers and the output as a wire.
    input wire [ADDR_WIDTH-1:0] addr_b,                  // 9-bit address for Port B
    input wire [DATA_WIDTH-1:0] din_b,                  // 32-bit data input for Port B
    input wire we_b,                          // Write Enable for Port B
    input wire re_b,                          // Read Enable for Port B
    output reg [DATA_WIDTH-1:0] dout_b                  // 32-bit data output for Port B
);

    // Parameterized memory array
    (* ram_style = "block" *) reg [DATA_WIDTH-1:0] mem [MEM_DEPTH-1:0];

 // Preload memory from a file during initialization
    initial begin
        $readmemh(INIT_FILE, mem);     // Load the instruction memory from the hex file
    end



    // Read Operation for Port A (Synchronous)
    always @(posedge clk) begin
        if (re_a) begin
            dout_a <= mem[addr_a];
        end
    end

    // Read Operation for Port B (Synchronous)
    always @(posedge clk) begin
        //if (re_b) begin
            dout_b <= mem[addr_b];
        //end
    end

    // Write Operation for Port A (Synchronous)
    always @(posedge clk) begin
        if (we_a) begin
            mem[addr_a] <= din_a;
        end
    end

    // Write Operation for Port B (Synchronous)
    always @(posedge clk) begin
        if (we_b) begin
            mem[addr_b] <= din_b;
        end
    end

   

endmodule
