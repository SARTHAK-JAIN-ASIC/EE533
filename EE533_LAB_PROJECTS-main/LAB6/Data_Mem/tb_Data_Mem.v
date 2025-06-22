`timescale 1ns / 1ps
`include "Data_Mem.v"

module tb_Data_Mem();

    // Testbench parameters (Ensure they match Data_Mem module)
    parameter ADDR_WIDTH = 8;   // Address width (8-bit = 256 locations)
    parameter DATA_WIDTH = 64;  // Data width (64-bit per entry)
    parameter MEM_DEPTH = 256;  // Memory depth (256 entries)

    // Signals for DUT (Device Under Test)
    reg clk;
    reg Write_Enable;
    reg [ADDR_WIDTH-1:0] Address;  // Single Address input
    reg [DATA_WIDTH-1:0] WData;    // Input Data for Writing
    wire [DATA_WIDTH-1:0] Dout;    // Output Data for Reading

    // Instantiate the Data_Mem Module
    Data_Mem #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH),
        .MEM_DEPTH(MEM_DEPTH),
        .INIT_FILE("Data_MM.hex") // Ensure a valid initialization file
    ) dut (
        .clk(clk),
        .Write_Enable(Write_Enable),
        .Address(Address),
        .WData(WData),
        .Dout(Dout)
    );

    // Clock Generation: 10ns period (5ns high, 5ns low)
    always #5 clk = ~clk; 

    // Task for Writing Data to Memory
    task Writing_data_Task(input [ADDR_WIDTH-1:0] addr, input [DATA_WIDTH-1:0] data);
    begin
        @(negedge clk); // Wait for negedge to align with write operation
        Write_Enable = 1;
        Address = addr;
        WData = data;
        @(negedge clk); // Hold write for one cycle
        Write_Enable = 0;
        $display("Time %0t: Wrote %0d to Memory[%0d]", $time, data, addr);
    end
    endtask

    // Task for Reading Data from Memory
    task Reading_data_task(input [ADDR_WIDTH-1:0] addr);
    begin
        @(posedge clk); // Wait for posedge to align with read operation
        Address = addr;
        @(posedge clk); // Hold for one cycle to ensure data stability
        $display("Time %0t: Read Memory[%0d] = %0d", $time, addr, Dout);
    end
    endtask

    // Test Sequence Using Tasks
    initial begin
        // Creating DUMP-FILE
        $dumpfile("waveform.vcd"); // Create VCD file
        $dumpvars(0, tb_Data_Mem); // Dump all variables

        // Initialize Signals
        clk = 0;
        Write_Enable = 0;
        Address = 0;
        WData = 0;

        //  Writing Test Data
        Writing_data_Task(8'd1, 64'd42);   // Write 42 to Memory[1]
        Writing_data_Task(8'd3, 64'd100);  // Write 100 to Memory[3]
        Writing_data_Task(8'd5, 64'd255);  // Write 255 to Memory[5]

        // Reading Back the Data
        Reading_data_task(8'd1);  // Read Memory[1]
        Reading_data_task(8'd3);  // Read Memory[3]
        Reading_data_task(8'd5);  // Read Memory[5]

        // Assertion Check
        @(posedge clk);
        if (Dout !== 64'd42) $display("ERROR: Memory[1] expected 42, got %0d", Dout);
        @(posedge clk);
        if (Dout !== 64'd100) $display("ERROR: Memory[3] expected 100, got %0d", Dout);
        @(posedge clk);
        if (Dout !== 64'd255) $display("ERROR: Memory[5] expected 255, got %0d", Dout);
        else $display("All memory tests passed!");

        // 🌟 End Simulation
        #20 $finish;
    end

endmodule


// `timescale 1ns / 1ps
// `include "Data_Mem.v"

// module tb_Data_Mem();

//     // Testbench parameters (Ensure they match Data_Mem module)
//     parameter ADDR_WIDTH = 8;   // Address width (8-bit = 256 locations)
//     parameter DATA_WIDTH = 64;  // Data width (64-bit per entry)
//     parameter MEM_DEPTH = 256;  // Memory depth (256 entries)

//     // Signals for DUT (Device Under Test)
//     reg clk;
//     reg Write_Enable;
//     reg [ADDR_WIDTH-1:0] Read_Addr;
//     reg [ADDR_WIDTH-1:0] Write_Addr;
//     reg [DATA_WIDTH-1:0] Write_Data;
//     wire [DATA_WIDTH-1:0] Read_Data; // Output wire

//     // Instantiate the Data_Mem Module
//     Data_Mem #(
//         .ADDR_WIDTH(ADDR_WIDTH),
//         .DATA_WIDTH(DATA_WIDTH),
//         .MEM_DEPTH(MEM_DEPTH),
//         .INIT_FILE("Data_MM.hex") // Ensure a valid initialization file
//     ) dut (
//         .clk(clk),
//         .Write_Enable(Write_Enable),
//         .Read_Addr(Read_Addr),
//         .Write_Addr(Write_Addr),
//         .Write_Data(Write_Data),
//         .Read_Data(Read_Data)
//     );

//     // Clock Generation: 10ns period (5ns high, 5ns low)
//     always #5 clk = ~clk; 

//     // 🚀 Task for Writing Data to Memory
//     task Writing_data_Task(input [ADDR_WIDTH-1:0] addr, input [DATA_WIDTH-1:0] data);
//     begin
//         @(negedge clk); // Wait for negedge to align with write operation
//         Write_Enable = 1;
//         Write_Addr = addr;
//         Write_Data = data;
//         @(negedge clk); // Hold write for one cycle
//         Write_Enable = 0;
//         $display("Time %0t: Wrote %0d to Memory[%0d]", $time, data, addr);
//     end
//     endtask

//     // 🚀 Task for Reading Data from Memory
//     task Reading_data_task(input [ADDR_WIDTH-1:0] addr);
//     begin
//         @(posedge clk); // Wait for posedge to align with read operation
//         Read_Addr = addr;
//         @(posedge clk); // Hold for one cycle to ensure data stability
//         $display("Time %0t: Read Memory[%0d] = %0d", $time, addr, Read_Data);
//     end
//     endtask

//     // 🌟 Test Sequence Using Tasks
//     initial begin
//         // Creating DUMP-FILE
//         $dumpfile("waveform.vcd"); // Create VCD file
//         $dumpvars(0, tb_Data_Mem); // Dump all variables
//         // Initialize Signals
//         clk = 0;
//         Write_Enable = 0;
//         Read_Addr = 0;
//         Write_Addr = 0;
//         Write_Data = 0;

//         // 🚀 Writing Test Data
//         Writing_data_Task(8'd1, 64'd42);   // Write 42 to Memory[1]
//         Writing_data_Task(8'd3, 64'd100);  // Write 100 to Memory[3]
//         Writing_data_Task(8'd5, 64'd255);  // Write 255 to Memory[5]

//         // 🌟 Reading Back the Data
//         Reading_data_task(8'd1);  // Read Memory[1]
//         Reading_data_task(8'd3);  // Read Memory[3]
//         Reading_data_task(8'd5);  // Read Memory[5]

//         // ✅ Assertion Check
//         @(posedge clk);
//         if (Read_Data !== 64'd42) $display("❌ ERROR: Memory[1] expected 42, got %0d", Read_Data);
//         @(posedge clk);
//         if (Read_Data !== 64'd100) $display("❌ ERROR: Memory[3] expected 100, got %0d", Read_Data);
//         @(posedge clk);
//         if (Read_Data !== 64'd255) $display("❌ ERROR: Memory[5] expected 255, got %0d", Read_Data);
//         else $display("✅ All memory tests passed!");

//         // 🌟 End Simulation
//         #20 $finish;
//     end

// endmodule