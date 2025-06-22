VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Ain(7:0)
        SIGNAL Bin(7:0)
        BEGIN SIGNAL Sum_Out(7:0)
        END SIGNAL
        BEGIN SIGNAL Carry_Out
        END SIGNAL
        SIGNAL A_in(7:0)
        SIGNAL B_in(7:0)
        BEGIN SIGNAL Cin
        END SIGNAL
        SIGNAL Carry_in
        SIGNAL CE
        SIGNAL CLK
        SIGNAL CLR_IN
        SIGNAL SUM(7:0)
        SIGNAL Cout
        SIGNAL CE_OUT
        SIGNAL CLR_OUT
        PORT Input Ain(7:0)
        PORT Input Bin(7:0)
        PORT Input Carry_in
        PORT Input CE
        PORT Input CLK
        PORT Input CLR_IN
        PORT Output SUM(7:0)
        PORT Output Cout
        PORT Input CE_OUT
        PORT Input CLR_OUT
        BEGIN BLOCKDEF Adder8bit
            TIMESTAMP 2025 1 24 23 10 50
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
        BEGIN BLOCKDEF fd8ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 320 -268 384 -244 
            RECTANGLE N 0 -268 64 -244 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF fd
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -320 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 Adder8bit
            PIN ADO(7:0) A_in(7:0)
            PIN BDO(7:0) B_in(7:0)
            PIN CIN Cin
            PIN COUT Carry_Out
            PIN SUM(7:0) Sum_Out(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_2 fd8ce
            PIN C CLK
            PIN CE CE
            PIN CLR CLR_IN
            PIN D(7:0) Ain(7:0)
            PIN Q(7:0) A_in(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_3 fd8ce
            PIN C CLK
            PIN CE CE
            PIN CLR CLR_IN
            PIN D(7:0) Bin(7:0)
            PIN Q(7:0) B_in(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_9 fd
            PIN C CLK
            PIN D Carry_in
            PIN Q Cin
        END BLOCK
        BEGIN BLOCK XLXI_7 fd8ce
            PIN C CLK
            PIN CE CE_OUT
            PIN CLR CLR_OUT
            PIN D(7:0) Sum_Out(7:0)
            PIN Q(7:0) SUM(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_8 fd
            PIN C CLK
            PIN D Carry_Out
            PIN Q Cout
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_3 992 1568 R0
        INSTANCE XLXI_2 992 1136 R0
        BEGIN INSTANCE XLXI_1 1760 1248 R0
        END INSTANCE
        BEGIN BRANCH Ain(7:0)
            WIRE 784 880 992 880
        END BRANCH
        BEGIN BRANCH Bin(7:0)
            WIRE 784 1312 992 1312
        END BRANCH
        IOMARKER 784 880 Ain(7:0) R180 28
        IOMARKER 784 1312 Bin(7:0) R180 28
        BEGIN BRANCH Sum_Out(7:0)
            WIRE 2144 1088 2176 1088
            WIRE 2176 1088 2208 1088
            BEGIN DISPLAY 2176 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Carry_Out
            WIRE 2144 1152 2160 1152
            WIRE 2160 1152 2208 1152
            BEGIN DISPLAY 2160 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A_in(7:0)
            WIRE 1376 880 1408 880
            WIRE 1408 880 1456 880
            BEGIN DISPLAY 1408 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B_in(7:0)
            WIRE 1376 1312 1408 1312
            WIRE 1408 1312 1456 1312
            BEGIN DISPLAY 1408 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B_in(7:0)
            WIRE 1696 1216 1728 1216
            WIRE 1728 1216 1760 1216
            BEGIN DISPLAY 1728 1216 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Cin
            WIRE 1696 1088 1728 1088
            WIRE 1728 1088 1744 1088
            WIRE 1744 1088 1760 1088
            BEGIN DISPLAY 1728 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A_in(7:0)
            WIRE 1696 1152 1728 1152
            WIRE 1728 1152 1760 1152
            BEGIN DISPLAY 1728 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_9 992 1952 R0
        BEGIN BRANCH Carry_in
            WIRE 784 1696 992 1696
        END BRANCH
        IOMARKER 784 1696 Carry_in R180 28
        BEGIN BRANCH Cin
            WIRE 1376 1696 1408 1696
            WIRE 1408 1696 1456 1696
            BEGIN DISPLAY 1408 1696 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE
            WIRE 928 944 992 944
        END BRANCH
        BEGIN BRANCH CLK
            WIRE 928 1008 992 1008
        END BRANCH
        BEGIN BRANCH CLR_IN
            WIRE 928 1104 992 1104
        END BRANCH
        BEGIN BRANCH CE
            WIRE 928 1376 992 1376
        END BRANCH
        BEGIN BRANCH CLK
            WIRE 928 1440 992 1440
        END BRANCH
        BEGIN BRANCH CLR_IN
            WIRE 928 1536 992 1536
        END BRANCH
        BEGIN BRANCH CLK
            WIRE 928 1824 992 1824
        END BRANCH
        IOMARKER 928 944 CE R180 28
        IOMARKER 928 1008 CLK R180 28
        IOMARKER 928 1104 CLR_IN R180 28
        IOMARKER 928 1376 CE R180 28
        IOMARKER 928 1440 CLK R180 28
        IOMARKER 928 1536 CLR_IN R180 28
        IOMARKER 928 1824 CLK R180 28
        INSTANCE XLXI_7 2576 1152 R0
        INSTANCE XLXI_8 2576 1520 R0
        BEGIN BRANCH SUM(7:0)
            WIRE 2960 896 3040 896
        END BRANCH
        BEGIN BRANCH Cout
            WIRE 2960 1264 3040 1264
        END BRANCH
        BEGIN BRANCH Sum_Out(7:0)
            WIRE 2480 896 2528 896
            WIRE 2528 896 2576 896
            BEGIN DISPLAY 2528 896 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Carry_Out
            WIRE 2480 1264 2544 1264
            WIRE 2544 1264 2576 1264
            BEGIN DISPLAY 2544 1264 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE_OUT
            WIRE 2480 960 2576 960
        END BRANCH
        BEGIN BRANCH CLK
            WIRE 2480 1024 2576 1024
        END BRANCH
        BEGIN BRANCH CLR_OUT
            WIRE 2480 1120 2576 1120
        END BRANCH
        BEGIN BRANCH CLK
            WIRE 2480 1392 2576 1392
        END BRANCH
        IOMARKER 3040 896 SUM(7:0) R0 28
        IOMARKER 3040 1264 Cout R0 28
        IOMARKER 2480 1392 CLK R180 28
        IOMARKER 2480 1120 CLR_OUT R180 28
        IOMARKER 2480 1024 CLK R180 28
        IOMARKER 2480 960 CE_OUT R180 28
    END SHEET
END SCHEMATIC
