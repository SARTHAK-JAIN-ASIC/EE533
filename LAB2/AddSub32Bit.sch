VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL ADD_SUB(15:8)
        SIGNAL ADD_SUB(23:16)
        SIGNAL ADD_OR_SUB
        SIGNAL A(7:0)
        SIGNAL B(7:0)
        SIGNAL A(15:8)
        SIGNAL B(15:8)
        SIGNAL A(23:16)
        SIGNAL B(23:16)
        SIGNAL A(31:24)
        SIGNAL B(31:24)
        SIGNAL A(31:0)
        SIGNAL B(31:0)
        SIGNAL ADD_SUB(31:0)
        SIGNAL XLXN_23
        SIGNAL COUT
        SIGNAL XLXN_25
        SIGNAL XLXN_26
        SIGNAL XLXN_27
        SIGNAL XLXN_28
        SIGNAL ADD_SUB(7:0)
        SIGNAL ADD_SUB(31:24)
        PORT Input ADD_OR_SUB
        PORT Input A(31:0)
        PORT Input B(31:0)
        PORT Output ADD_SUB(31:0)
        PORT Output COUT
        BEGIN BLOCKDEF Adder_Subtracter_LessXor
            TIMESTAMP 2025 1 25 7 59 58
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 64 -224 0 -224 
            LINE N 320 -160 384 -160 
            LINE N 64 -160 0 -160 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCKDEF xor2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 60 -128 
            LINE N 256 -96 208 -96 
            ARC N -40 -152 72 -40 48 -48 44 -144 
            ARC N -24 -152 88 -40 64 -48 64 -144 
            LINE N 128 -144 64 -144 
            LINE N 128 -48 64 -48 
            ARC N 44 -144 220 32 208 -96 128 -144 
            ARC N 44 -224 220 -48 128 -48 208 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCK XLXI_5 Adder_Subtracter_LessXor
            PIN ADO(7:0) A(15:8)
            PIN BDO(7:0) B(15:8)
            PIN Cin XLXN_25
            PIN COUT XLXN_2
            PIN SUBTRACT ADD_OR_SUB
            PIN SUM(7:0) ADD_SUB(15:8)
        END BLOCK
        BEGIN BLOCK XLXI_6 Adder_Subtracter_LessXor
            PIN ADO(7:0) A(23:16)
            PIN BDO(7:0) B(23:16)
            PIN Cin XLXN_2
            PIN COUT XLXN_3
            PIN SUBTRACT ADD_OR_SUB
            PIN SUM(7:0) ADD_SUB(23:16)
        END BLOCK
        BEGIN BLOCK XLXI_7 Adder_Subtracter_LessXor
            PIN ADO(7:0) A(31:24)
            PIN BDO(7:0) B(31:24)
            PIN Cin XLXN_3
            PIN COUT XLXN_23
            PIN SUBTRACT ADD_OR_SUB
            PIN SUM(7:0) ADD_SUB(31:24)
        END BLOCK
        BEGIN BLOCK XLXI_8 xor2
            PIN I0 ADD_OR_SUB
            PIN I1 XLXN_23
            PIN O COUT
        END BLOCK
        BEGIN BLOCK XLXI_9 Adder_Subtracter_LessXor
            PIN ADO(7:0) A(7:0)
            PIN BDO(7:0) B(7:0)
            PIN Cin XLXN_26
            PIN COUT XLXN_25
            PIN SUBTRACT ADD_OR_SUB
            PIN SUM(7:0) ADD_SUB(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_11 xor2
            PIN I0 ADD_OR_SUB
            PIN I1 XLXN_28
            PIN O XLXN_26
        END BLOCK
        BEGIN BLOCK XLXI_12 gnd
            PIN G XLXN_28
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_7 2816 1040 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_6 2208 1040 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_5 1632 1040 R270
        END INSTANCE
        BEGIN BRANCH XLXN_2
            WIRE 1296 592 1472 592
            WIRE 1472 592 1472 656
            WIRE 1296 592 1296 1104
            WIRE 1296 1104 1984 1104
            WIRE 1984 1040 1984 1104
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1888 592 2048 592
            WIRE 2048 592 2048 656
            WIRE 1888 592 1888 1056
            WIRE 1888 1056 2592 1056
            WIRE 2592 1040 2592 1056
        END BRANCH
        BEGIN BRANCH ADD_OR_SUB
            WIRE 560 1136 848 1136
            WIRE 848 1136 1472 1136
            WIRE 1472 1136 2048 1136
            WIRE 2048 1136 2656 1136
            WIRE 2656 1136 2880 1136
            WIRE 848 1136 848 1392
            WIRE 816 1328 816 1392
            WIRE 816 1392 848 1392
            WIRE 848 1040 848 1136
            WIRE 1472 1040 1472 1136
            WIRE 2048 1040 2048 1136
            WIRE 2656 1040 2656 1136
            WIRE 2720 512 2720 592
            WIRE 2720 592 2880 592
            WIRE 2880 592 2880 1136
        END BRANCH
        BEGIN BRANCH ADD_SUB(15:8)
            WIRE 1408 512 1408 608
            WIRE 1408 608 1408 656
            BEGIN DISPLAY 1408 608 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADD_SUB(23:16)
            WIRE 1984 512 1984 608
            WIRE 1984 608 1984 656
            BEGIN DISPLAY 1984 608 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADD_SUB(31:24)
            WIRE 2592 512 2592 592
            WIRE 2592 592 2592 656
            BEGIN DISPLAY 2592 592 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(7:0)
            WIRE 912 1040 912 1168
            WIRE 912 1168 912 1200
            BEGIN DISPLAY 912 1168 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(7:0)
            WIRE 976 1040 976 1152
            WIRE 976 1152 976 1200
            BEGIN DISPLAY 976 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(15:8)
            WIRE 1536 1040 1536 1168
            WIRE 1536 1168 1536 1200
            BEGIN DISPLAY 1536 1168 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(15:8)
            WIRE 1600 1040 1600 1168
            WIRE 1600 1168 1600 1200
            BEGIN DISPLAY 1600 1168 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(23:16)
            WIRE 2112 1040 2112 1168
            WIRE 2112 1168 2112 1200
            BEGIN DISPLAY 2112 1168 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(23:16)
            WIRE 2176 1040 2176 1168
            WIRE 2176 1168 2176 1200
            BEGIN DISPLAY 2176 1168 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(31:24)
            WIRE 2720 1040 2720 1168
            WIRE 2720 1168 2720 1200
            BEGIN DISPLAY 2720 1168 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(31:24)
            WIRE 2784 1040 2784 1152
            WIRE 2784 1152 2784 1200
            BEGIN DISPLAY 2784 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(31:0)
            WIRE 1680 1360 1680 1440
        END BRANCH
        BEGIN BRANCH B(31:0)
            WIRE 1760 1360 1760 1440
        END BRANCH
        IOMARKER 1680 1440 A(31:0) R90 28
        IOMARKER 1760 1440 B(31:0) R90 28
        BEGIN BRANCH ADD_SUB(31:0)
            WIRE 1760 320 1760 400
        END BRANCH
        IOMARKER 1760 320 ADD_SUB(31:0) R270 28
        IOMARKER 560 1136 ADD_OR_SUB R180 28
        BEGIN BRANCH XLXN_23
            WIRE 2656 512 2656 656
        END BRANCH
        INSTANCE XLXI_8 2784 512 R270
        BEGIN BRANCH COUT
            WIRE 2688 224 2688 256
        END BRANCH
        IOMARKER 2688 224 COUT R270 28
        BEGIN INSTANCE XLXI_9 1008 1040 R270
        END INSTANCE
        BEGIN BRANCH XLXN_25
            WIRE 848 592 848 656
            WIRE 848 592 1072 592
            WIRE 1072 592 1072 1088
            WIRE 1072 1088 1408 1088
            WIRE 1408 1040 1408 1088
        END BRANCH
        BEGIN BRANCH XLXN_26
            WIRE 784 1040 784 1072
        END BRANCH
        INSTANCE XLXI_11 880 1328 R270
        BEGIN BRANCH XLXN_28
            WIRE 752 1328 752 1360
        END BRANCH
        INSTANCE XLXI_12 688 1488 R0
        BEGIN BRANCH ADD_SUB(7:0)
            WIRE 784 512 784 560
            WIRE 784 560 784 656
            BEGIN DISPLAY 784 560 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
    END SHEET
END SCHEMATIC
