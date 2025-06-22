//`timescale 1ns / 1ps

module Data_Mem #(
    parameter ADDR_WIDTH = 8,   // Default: 8-bit address (256 locations)
    parameter DATA_WIDTH = 64,  // Default: 64-bit data per entry
    parameter MEM_DEPTH  = 256,  // Default: 256 memory entries
    parameter INIT_FILE  = "Data_MM.hex" // Default memory initialization file
)(
    input                           clock       ,  // Synchronous clock
    input                           memWrite_i  ,  // Write Enable signal
    input                           MemRead_i   ,
    input       [ADDR_WIDTH-1:0]    Address     ,  // Single Address input (for both Read & Write)
    input       [DATA_WIDTH-1:0]    WData       ,  // Write Data input
	output reg  [DATA_WIDTH-1:0]    hostreg0	,
	output reg  [DATA_WIDTH-1:0]    hostreg1	,
	output reg  [DATA_WIDTH-1:0]    hostreg2	,
	output reg  [DATA_WIDTH-1:0]    hostreg3	,
	output reg  [DATA_WIDTH-1:0]    hostreg4	,
	output reg  [DATA_WIDTH-1:0]    hostreg5	,
	output reg  [DATA_WIDTH-1:0]    hostreg6	,
    output reg  [DATA_WIDTH-1:0]    Dout           // Read Data output
);

    // Parameterized memory array
    (* ram_style = "distributed" *) reg [DATA_WIDTH-1:0] Memory [MEM_DEPTH-1:0];
	
	// assign hostreg0 = Memory[0];
	// assign hostreg1 = Memory[1];
	// assign hostreg2 = Memory[2];
	// assign hostreg3 = Memory[3];
	// assign hostreg4 = Memory[4];
	// assign hostreg5 = Memory[5];
	// assign hostreg6 = Memory[6];

    // Read Operation (Synchronous Read at posedge clock )
    always @(posedge clock)
    begin
        if(MemRead_i)
           Dout <= Memory[Address]; // Read data from memory
    end

    // Write Operation (Triggered at negedge clock , controlled by memWrite_i )
    always @(negedge clock)
    begin
		hostreg0 <= Memory[0];
		hostreg1 <= Memory[1];
		hostreg2 <= Memory[2];
		hostreg3 <= Memory[3];
		hostreg4 <= Memory[4];
		hostreg5 <= Memory[5];
		hostreg6 <= Memory[6];
	

        if (memWrite_i)
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
//     input wire clock ,                             // Synchronous clock
//     input wire memWrite_i ,                    // Write Enable signal
//     input wire [ADDR_WIDTH-1:0] Read_Addr,      // Read Address
//     //input wire [ADDR_WIDTH-1:0] Write_Addr,     // Write Address
//     input wire [DATA_WIDTH-1:0] Write_Data,     // Input data to write
//     output reg [DATA_WIDTH-1:0] Read_Data       // Output data read from memory
// );
//     // Parameterized memory array
//     reg [DATA_WIDTH-1:0] Memory [MEM_DEPTH-1:0];

//     // Read Operation
//     always @(posedge clock )
//     begin
//         Read_Data <= Memory[Read_Addr]; // Load data from memory
//     end

//     // Write Operation (Triggered at negedge clock , controlled by memWrite_i )
//     always @(negedge clock ) 
//     begin
//         if (memWrite_i ) 
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