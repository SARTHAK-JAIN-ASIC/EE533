`timescale 1ns / 1ps

module Data_Mem (
    input wire clk,                           // Clock input
    // Port A (Read/Write)
    input wire [7:0] addra,                  // 8-bit address for Port A
    input wire [63:0] dina,                  // 64-bit data input for Port A
    input wire wea,                          // Write Enable for Port A
    input wire rea,                          // Read Enable for Port A
    output reg [63:0] douta,                 // 64-bit data output for Port A
    
    // Port B (Read/Write) //This is used for HW/SW interface, thus we made the inputs as registers and the output as a wire.
    input wire [7:0] addrb,                  // 8-bit address for Port B
    input wire [63:0] dinb,                  // 64-bit data input for Port B
    input wire web,                          // Write Enable for Port B
    input wire reb,                          // Read Enable for Port B
    output reg [63:0] doutb                  // 64-bit data output for Port B
);

    // Define a 512 x 32-bit memory array
    (* ram_style = "block" *) reg [63:0] mem [0:255]; 

    // Read Operation for Port A (Synchronous)
    always @(posedge clk) begin
        if (rea) begin
            douta <= mem[addra];
        end
    end

    // Read Operation for Port B (Synchronous)
    always @(posedge clk) begin
        //if (re_b) begin
            doutb <= mem[addrb];
        //end
    end

    // Write Operation for Port A (Synchronous)
    always @(posedge clk) begin
        if (wea) begin
            mem[addra] <= dina;
        end
    end

    // Write Operation for Port B (Synchronous)
    always @(posedge clk) begin
        if (web) begin
            mem[addrb] <= dinb;
        end
    end

    // Preload memory from a file during initialization
    initial begin
        $readmemh("Data_Mem.hex", mem);     // Load the instruction memory from the hex file
    end

endmodule
