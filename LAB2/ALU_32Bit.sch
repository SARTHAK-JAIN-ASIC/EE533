VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Count_Start(31:0)
        SIGNAL Up_Or_Down
        SIGNAL Shifter_Input(31:0)
        SIGNAL Right1_Left0_shift
        SIGNAL Adder_InputA(31:0)
        SIGNAL Adder_InputB(31:0)
        SIGNAL AddSub_InputA(31:0)
        SIGNAL AddSub_InputB(31:0)
        SIGNAL OP_Select_Add_Sub
        SIGNAL CE
        SIGNAL clk
        SIGNAL CLR
        SIGNAL Cin
        SIGNAL Adder_COUT
        SIGNAL ALU_SEL(1:0)
        SIGNAL AddSub_COUT
        SIGNAL ALU_MUX_OUT(31:0)
        SIGNAL XLXN_30(31:0)
        SIGNAL XLXN_31(31:0)
        SIGNAL XLXN_33(31:0)
        SIGNAL XLXN_34(31:0)
        SIGNAL XLXN_36(31:0)
        PORT Input Count_Start(31:0)
        PORT Input Up_Or_Down
        PORT Input Shifter_Input(31:0)
        PORT Input Right1_Left0_shift
        PORT Input Adder_InputA(31:0)
        PORT Input Adder_InputB(31:0)
        PORT Input AddSub_InputA(31:0)
        PORT Input AddSub_InputB(31:0)
        PORT Input OP_Select_Add_Sub
        PORT Input CE
        PORT Input clk
        PORT Input CLR
        PORT Input Cin
        PORT Output Adder_COUT
        PORT Input ALU_SEL(1:0)
        PORT Output AddSub_COUT
        PORT Output ALU_MUX_OUT(31:0)
        BEGIN BLOCKDEF Adder32bit
            TIMESTAMP 2025 1 25 2 35 40
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -160 0 -160 
            LINE N 320 -96 384 -96 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF Mux4x1_32Bit
            TIMESTAMP 2025 1 26 20 53 44
            RECTANGLE N 64 -320 320 0 
            LINE N 64 -288 0 -288 
            RECTANGLE N 0 -300 64 -276 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 320 -288 384 -288 
            RECTANGLE N 320 -300 384 -276 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
        END BLOCKDEF
        BEGIN BLOCKDEF Counter_32bit
            TIMESTAMP 2025 1 27 0 18 6
            RECTANGLE N 64 -320 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -160 0 -160 
            LINE N 64 -288 0 -288 
            LINE N 64 -32 0 -32 
            LINE N 320 -288 384 -288 
            RECTANGLE N 320 -300 384 -276 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF AddSub32Bit
            TIMESTAMP 2025 1 26 21 12 24
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF LEFT_RIGHT_32BIT_SHIFTER
            TIMESTAMP 2025 1 27 7 37 5
            RECTANGLE N 64 -128 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 64 -32 0 -32 
        END BLOCKDEF
        BEGIN BLOCKDEF Register32bit
            TIMESTAMP 2025 1 26 21 48 2
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -160 0 -160 
            LINE N 64 -32 0 -32 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 Adder32bit
            PIN A32(31:0) Adder_InputA(31:0)
            PIN B32(31:0) Adder_InputB(31:0)
            PIN CIN32 Cin
            PIN COUT32 Adder_COUT
            PIN SUM32(31:0) XLXN_36(31:0)
        END BLOCK
        BEGIN BLOCK XLXI_4 Counter_32bit
            PIN Add_or_Sub Up_Or_Down
            PIN CE CE
            PIN clk clk
            PIN CLR CLR
            PIN Count(31:0) XLXN_30(31:0)
            PIN ONE(31:0) Count_Start(31:0)
        END BLOCK
        BEGIN BLOCK XLXI_5 AddSub32Bit
            PIN A(31:0) AddSub_InputA(31:0)
            PIN ADD_OR_SUB OP_Select_Add_Sub
            PIN ADD_SUB(31:0) XLXN_34(31:0)
            PIN B(31:0) AddSub_InputB(31:0)
            PIN COUT AddSub_COUT
        END BLOCK
        BEGIN BLOCK XLXI_6 LEFT_RIGHT_32BIT_SHIFTER
            PIN IN_S(31:0) Shifter_Input(31:0)
            PIN OUT_S(31:0) XLXN_33(31:0)
            PIN Right_Shift Right1_Left0_shift
        END BLOCK
        BEGIN BLOCK XLXI_2 Mux4x1_32Bit
            PIN in0(31:0) XLXN_36(31:0)
            PIN in1(31:0) XLXN_34(31:0)
            PIN in2(31:0) XLXN_33(31:0)
            PIN in3(31:0) XLXN_31(31:0)
            PIN muxout(31:0) ALU_MUX_OUT(31:0)
            PIN sel(1:0) ALU_SEL(1:0)
        END BLOCK
        BEGIN BLOCK XLXI_8 Register32bit
            PIN CE CE
            PIN clk clk
            PIN CLR CLR
            PIN inputD(31:0) XLXN_30(31:0)
            PIN outputD(31:0) XLXN_31(31:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_5 624 880 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_1 624 1216 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_6 624 1472 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 624 1952 R0
        END INSTANCE
        BEGIN BRANCH Count_Start(31:0)
            WIRE 496 1728 624 1728
        END BRANCH
        BEGIN BRANCH Up_Or_Down
            WIRE 496 1856 624 1856
        END BRANCH
        BEGIN BRANCH Shifter_Input(31:0)
            WIRE 496 1376 624 1376
        END BRANCH
        BEGIN BRANCH Right1_Left0_shift
            WIRE 496 1440 624 1440
        END BRANCH
        BEGIN BRANCH Adder_InputA(31:0)
            WIRE 496 1120 624 1120
        END BRANCH
        BEGIN BRANCH Adder_InputB(31:0)
            WIRE 496 1184 624 1184
        END BRANCH
        BEGIN BRANCH AddSub_InputA(31:0)
            WIRE 496 720 624 720
        END BRANCH
        BEGIN BRANCH AddSub_InputB(31:0)
            WIRE 496 784 624 784
        END BRANCH
        BEGIN BRANCH OP_Select_Add_Sub
            WIRE 496 848 624 848
        END BRANCH
        BEGIN BRANCH CE
            WIRE 496 1792 544 1792
            WIRE 544 1792 624 1792
            WIRE 544 1568 544 1792
            WIRE 544 1568 1072 1568
            WIRE 1072 1568 1072 1792
            WIRE 1072 1792 1136 1792
        END BRANCH
        BEGIN BRANCH clk
            WIRE 496 1664 624 1664
        END BRANCH
        BEGIN BRANCH CLR
            WIRE 496 1920 528 1920
            WIRE 528 1920 624 1920
            WIRE 528 1920 528 2016
            WIRE 528 2016 1072 2016
            WIRE 1072 1856 1072 2016
            WIRE 1072 1856 1136 1856
        END BRANCH
        BEGIN BRANCH Cin
            WIRE 496 1056 624 1056
        END BRANCH
        BEGIN BRANCH AddSub_COUT
            WIRE 1008 720 1024 720
            WIRE 1024 720 1120 720
            BEGIN DISPLAY 1024 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 496 1728 Count_Start(31:0) R180 28
        IOMARKER 496 1792 CE R180 28
        IOMARKER 496 1856 Up_Or_Down R180 28
        IOMARKER 496 1920 CLR R180 28
        IOMARKER 496 1440 Right1_Left0_shift R180 28
        IOMARKER 496 1664 clk R180 28
        IOMARKER 496 1376 Shifter_Input(31:0) R180 28
        IOMARKER 496 1184 Adder_InputB(31:0) R180 28
        IOMARKER 496 1120 Adder_InputA(31:0) R180 28
        IOMARKER 496 1056 Cin R180 28
        IOMARKER 496 848 OP_Select_Add_Sub R180 28
        IOMARKER 496 784 AddSub_InputB(31:0) R180 28
        IOMARKER 496 720 AddSub_InputA(31:0) R180 28
        BEGIN BRANCH AddSub_COUT
            WIRE 1680 720 1760 720
            WIRE 1760 720 1920 720
            BEGIN DISPLAY 1760 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Adder_COUT
            WIRE 1680 832 1728 832
            WIRE 1728 832 1920 832
            BEGIN DISPLAY 1728 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 1920 720 AddSub_COUT R0 28
        IOMARKER 1920 832 Adder_COUT R0 28
        BEGIN INSTANCE XLXI_2 1712 1456 R0
        END INSTANCE
        BEGIN BRANCH ALU_MUX_OUT(31:0)
            WIRE 2096 1168 2224 1168
        END BRANCH
        BEGIN BRANCH ALU_SEL(1:0)
            WIRE 1696 1424 1712 1424
            WIRE 1696 1424 1696 1520
        END BRANCH
        IOMARKER 2224 1168 ALU_MUX_OUT(31:0) R0 28
        IOMARKER 1696 1520 ALU_SEL(1:0) R90 28
        BEGIN INSTANCE XLXI_8 1136 1888 R0
        END INSTANCE
        BEGIN BRANCH XLXN_30(31:0)
            WIRE 1008 1664 1136 1664
        END BRANCH
        BEGIN BRANCH XLXN_31(31:0)
            WIRE 1520 1664 1584 1664
            WIRE 1584 1360 1584 1664
            WIRE 1584 1360 1712 1360
        END BRANCH
        BEGIN BRANCH clk
            WIRE 1104 1728 1120 1728
            WIRE 1120 1728 1136 1728
            BEGIN DISPLAY 1120 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_33(31:0)
            WIRE 1008 1376 1360 1376
            WIRE 1360 1296 1360 1376
            WIRE 1360 1296 1712 1296
        END BRANCH
        BEGIN BRANCH XLXN_34(31:0)
            WIRE 1008 784 1360 784
            WIRE 1360 784 1360 1232
            WIRE 1360 1232 1712 1232
        END BRANCH
        BEGIN BRANCH Adder_COUT
            WIRE 1008 1120 1088 1120
            WIRE 1088 1120 1120 1120
            BEGIN DISPLAY 1088 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_36(31:0)
            WIRE 1008 1056 1344 1056
            WIRE 1344 1056 1344 1168
            WIRE 1344 1168 1712 1168
        END BRANCH
    END SHEET
END SCHEMATIC
