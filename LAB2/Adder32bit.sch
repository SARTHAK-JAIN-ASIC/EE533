VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_25
        SIGNAL XLXN_28
        SIGNAL XLXN_29
        SIGNAL SUM32(7:0)
        SIGNAL SUM32(15:8)
        SIGNAL SUM32(23:16)
        SIGNAL SUM32(31:24)
        SIGNAL COUT32
        SIGNAL CIN32
        SIGNAL A32(7:0)
        SIGNAL B32(7:0)
        SIGNAL A32(15:8)
        SIGNAL B32(15:8)
        SIGNAL A32(23:16)
        SIGNAL B32(23:16)
        SIGNAL A32(31:24)
        SIGNAL B32(31:24)
        SIGNAL A32(31:0)
        SIGNAL B32(31:0)
        SIGNAL SUM32(31:0)
        PORT Output COUT32
        PORT Input CIN32
        PORT Input A32(31:0)
        PORT Input B32(31:0)
        PORT Output SUM32(31:0)
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
        BEGIN BLOCK XLXI_2 Adder8bit
            PIN ADO(7:0) A32(15:8)
            PIN BDO(7:0) B32(15:8)
            PIN CIN XLXN_25
            PIN COUT XLXN_28
            PIN SUM(7:0) SUM32(15:8)
        END BLOCK
        BEGIN BLOCK XLXI_3 Adder8bit
            PIN ADO(7:0) A32(23:16)
            PIN BDO(7:0) B32(23:16)
            PIN CIN XLXN_28
            PIN COUT XLXN_29
            PIN SUM(7:0) SUM32(23:16)
        END BLOCK
        BEGIN BLOCK XLXI_4 Adder8bit
            PIN ADO(7:0) A32(31:24)
            PIN BDO(7:0) B32(31:24)
            PIN CIN XLXN_29
            PIN COUT COUT32
            PIN SUM(7:0) SUM32(31:24)
        END BLOCK
        BEGIN BLOCK XLXI_1 Adder8bit
            PIN ADO(7:0) A32(7:0)
            PIN BDO(7:0) B32(7:0)
            PIN CIN CIN32
            PIN COUT XLXN_25
            PIN SUM(7:0) SUM32(7:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_3 2480 960 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_2 2032 960 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_4 2912 960 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_1 1584 960 R270
        END INSTANCE
        BEGIN BRANCH XLXN_25
            WIRE 1488 512 1488 576
            WIRE 1488 512 1648 512
            WIRE 1648 512 1648 1040
            WIRE 1648 1040 1872 1040
            WIRE 1872 960 1872 1040
        END BRANCH
        BEGIN BRANCH XLXN_28
            WIRE 1776 512 1936 512
            WIRE 1936 512 1936 576
            WIRE 1776 512 1776 1024
            WIRE 1776 1024 2320 1024
            WIRE 2320 960 2320 1024
        END BRANCH
        BEGIN BRANCH XLXN_29
            WIRE 2224 496 2384 496
            WIRE 2384 496 2384 576
            WIRE 2224 496 2224 976
            WIRE 2224 976 2752 976
            WIRE 2752 960 2752 976
        END BRANCH
        BEGIN BRANCH SUM32(7:0)
            WIRE 1424 416 1424 464
            WIRE 1424 464 1424 576
            BEGIN DISPLAY 1424 464 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM32(15:8)
            WIRE 1872 400 1872 464
            WIRE 1872 464 1872 576
            BEGIN DISPLAY 1872 464 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM32(23:16)
            WIRE 2320 400 2320 448
            WIRE 2320 448 2320 576
            BEGIN DISPLAY 2320 448 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM32(31:24)
            WIRE 2752 400 2752 464
            WIRE 2752 464 2752 576
            BEGIN DISPLAY 2752 464 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH COUT32
            WIRE 2816 400 2816 576
        END BRANCH
        BEGIN BRANCH CIN32
            WIRE 1424 960 1424 1040
        END BRANCH
        BEGIN BRANCH A32(7:0)
            WIRE 1488 960 1488 1008
            WIRE 1488 1008 1488 1040
            BEGIN DISPLAY 1488 1008 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B32(7:0)
            WIRE 1552 960 1552 1008
            WIRE 1552 1008 1552 1040
            BEGIN DISPLAY 1552 1008 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A32(15:8)
            WIRE 1936 960 1936 1072
            WIRE 1936 1072 1936 1120
            BEGIN DISPLAY 1936 1072 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B32(15:8)
            WIRE 2000 960 2000 1088
            WIRE 2000 1088 2000 1120
            BEGIN DISPLAY 2000 1088 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A32(23:16)
            WIRE 2384 960 2384 1072
            WIRE 2384 1072 2384 1120
            BEGIN DISPLAY 2384 1072 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B32(23:16)
            WIRE 2448 960 2448 1072
            WIRE 2448 1072 2448 1120
            BEGIN DISPLAY 2448 1072 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A32(31:24)
            WIRE 2816 960 2816 1072
            WIRE 2816 1072 2816 1120
            BEGIN DISPLAY 2816 1072 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B32(31:24)
            WIRE 2880 960 2880 1072
            WIRE 2880 1072 2880 1120
            BEGIN DISPLAY 2880 1072 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A32(31:0)
            WIRE 2032 1280 2032 1408
        END BRANCH
        BEGIN BRANCH B32(31:0)
            WIRE 2160 1280 2160 1408
        END BRANCH
        IOMARKER 2032 1408 A32(31:0) R90 28
        IOMARKER 2160 1408 B32(31:0) R90 28
        IOMARKER 1424 1040 CIN32 R90 28
        IOMARKER 2816 400 COUT32 R270 28
        BEGIN BRANCH SUM32(31:0)
            WIRE 2080 160 2080 240
        END BRANCH
        IOMARKER 2080 160 SUM32(31:0) R270 28
    END SHEET
END SCHEMATIC
