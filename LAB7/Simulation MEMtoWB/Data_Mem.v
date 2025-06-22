`timescale 1ns / 1ps

module Data_Mem #(
    parameter ADDR_WIDTH = 8,   // Default: 8-bit address (256 locations)
    parameter DATA_WIDTH = 64,  // Default: 64-bit data per entry
    parameter MEM_DEPTH = 256,  // Default: 256 memory entries
    parameter INIT_FILE = "Data_MM.hex" // Default memory initialization file
)(
    input wire clk,                            // Synchronous clock
    input wire Write_Enable,                   // Write Enable signal
    input wire [ADDR_WIDTH-1:0] Address,       // Single Address input (for both Read & Write)
    input wire [DATA_WIDTH-1:0] WData,         // Write Data input
    output reg [DATA_WIDTH-1:0] Dout           // Read Data output
);

    // Parameterized memory array
    (* ram_style = "distributed" *) reg [DATA_WIDTH-1:0] Memory [MEM_DEPTH-1:0];

    // Read Operation (Synchronous Read at posedge clk)
    always @(posedge clk)
    begin
        Dout <= Memory[Address]; // Read data from memory
    end

    // Write Operation (Triggered at negedge clk, controlled by Write_Enable)
    always @(negedge clk) 
    begin
        if (Write_Enable) 
        begin
            Memory[Address] <= WData; // Store data in memory at the same Address
        end
    end

    // Memory Preloading from File (if a file is specified)
    initial 
    begin
        if (INIT_FILE != "") // If INIT_FILE is provided, load memory contents
        begin
            $display("Loading memory from %s", INIT_FILE);
            $readmemh(INIT_FILE, Memory);
        end
    end

endmodule



// `timescale 1ns / 1ps

// module Data_Mem #(
//     parameter ADDR_WIDTH = 8,   // Default: 8-bit address (256 locations)
//     parameter DATA_WIDTH = 64,  // Default: 64-bit data per entry
//     parameter MEM_DEPTH = 256,  // Default: 256 memory entries
//     parameter INIT_FILE = "Data_MM.hex" // Default memory initialization file
// )(
//     input wire clk,                             // Synchronous clock
//     input wire Write_Enable,                    // Write Enable signal
//     input wire [ADDR_WIDTH-1:0] Read_Addr,      // Read Address
//     //input wire [ADDR_WIDTH-1:0] Write_Addr,     // Write Address
//     input wire [DATA_WIDTH-1:0] Write_Data,     // Input data to write
//     output reg [DATA_WIDTH-1:0] Read_Data       // Output data read from memory
// );
//     // Parameterized memory array
//     reg [DATA_WIDTH-1:0] Memory [MEM_DEPTH-1:0];

//     // Read Operation
//     always @(posedge clk)
//     begin
//         Read_Data <= Memory[Read_Addr]; // Load data from memory
//     end

//     // Write Operation (Triggered at negedge clk, controlled by Write_Enable)
//     always @(negedge clk) 
//     begin
//         if (Write_Enable) 
//         begin
//             Memory[Write_Addr] <= Write_Data; // Store data in memory
//         end
//     end

//     // Memory Preloading from File (if a file is specified)
//     initial 
//     begin
//         if (INIT_FILE != "") // If INIT_File is EMPTY
//         begin
//             $display("Loading memory from %s", INIT_FILE);
//             $readmemh(INIT_FILE, Memory);
//         end
//     end
// endmodule