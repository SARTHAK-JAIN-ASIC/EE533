module inference_mem (
    input wire clk,                           // Clock input
    input wire reset,
    // Port A (Read/Write)
    input wire [1:0] addr_a,                  // 9-bit address for Port A
    input wire [3:0] din_a,                  // 32-bit data input for Port A
    input wire we_a,                          // Write Enable for Port A
    input wire re_a,                          // Read Enable for Port A
    output reg [15:0] dout_a,                 // 32-bit data output for Port A
    
    // Port B (Read/Write) //This is used for HW/SW interface, thus we made the inputs as registers and the output as a wire.
    input wire [1:0] addr_b,                  // 9-bit address for Port B
    input wire [3:0] din_b,                  // 32-bit data input for Port B
    input wire we_b,                          // Write Enable for Port B
    input wire re_b,                          // Read Enable for Port B
    output reg [15:0] dout_b                  // 32-bit data output for Port B
);

    // Define a 512 x 32-bit memory array
    (* ram_style = "block" *) reg [3:0] mem [0:3]; 

 // Preload memory from a file during initialization
    initial begin
        $readmemh("inference_mem.hex", mem);     // Load the instruction memory from the hex file
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
