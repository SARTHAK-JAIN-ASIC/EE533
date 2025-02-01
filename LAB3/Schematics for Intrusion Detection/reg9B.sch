VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL q(71:64)
        SIGNAL q(63:48)
        SIGNAL q(47:32)
        SIGNAL q(31:16)
        SIGNAL q(15:0)
        SIGNAL XLXN_6
        SIGNAL clk
        SIGNAL CE
        SIGNAL d(15:0)
        SIGNAL d(71:64)
        SIGNAL d(63:48)
        SIGNAL d(47:32)
        SIGNAL d(31:16)
        SIGNAL clr
        SIGNAL XLXN_15
        SIGNAL XLXN_16
        SIGNAL d(71:0)
        SIGNAL q(71:0)
        PORT Input clk
        PORT Input CE
        PORT Input clr
        PORT Input d(71:0)
        PORT Output q(71:0)
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
        BEGIN BLOCKDEF fd16ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 320 -268 384 -244 
            RECTANGLE N 0 -268 64 -244 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 fd8ce
            PIN C clk
            PIN CE CE
            PIN CLR clr
            PIN D(7:0) d(71:64)
            PIN Q(7:0) q(71:64)
        END BLOCK
        BEGIN BLOCK XLXI_2 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR clr
            PIN D(15:0) d(63:48)
            PIN Q(15:0) q(63:48)
        END BLOCK
        BEGIN BLOCK XLXI_3 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR clr
            PIN D(15:0) d(47:32)
            PIN Q(15:0) q(47:32)
        END BLOCK
        BEGIN BLOCK XLXI_4 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR clr
            PIN D(15:0) d(31:16)
            PIN Q(15:0) q(31:16)
        END BLOCK
        BEGIN BLOCK XLXI_5 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR clr
            PIN D(15:0) d(15:0)
            PIN Q(15:0) q(15:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 736 784 R0
        INSTANCE XLXI_2 736 1200 R0
        INSTANCE XLXI_3 736 1552 R0
        INSTANCE XLXI_4 736 1904 R0
        INSTANCE XLXI_5 736 2272 R0
        BEGIN BRANCH q(71:64)
            WIRE 1120 528 1200 528
            WIRE 1200 528 1328 528
            BEGIN DISPLAY 1200 528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(63:48)
            WIRE 1120 944 1216 944
            WIRE 1216 944 1344 944
            BEGIN DISPLAY 1216 944 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(47:32)
            WIRE 1120 1296 1200 1296
            WIRE 1200 1296 1360 1296
            BEGIN DISPLAY 1200 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(31:16)
            WIRE 1120 1648 1248 1648
            WIRE 1248 1648 1376 1648
            BEGIN DISPLAY 1248 1648 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH q(15:0)
            WIRE 1120 2016 1248 2016
            WIRE 1248 2016 1408 2016
            BEGIN DISPLAY 1248 2016 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clk
            WIRE 512 2144 640 2144
            WIRE 640 2144 736 2144
            WIRE 640 656 736 656
            WIRE 640 656 640 1072
            WIRE 640 1072 640 1424
            WIRE 640 1424 640 1776
            WIRE 640 1776 640 2144
            WIRE 640 1776 736 1776
            WIRE 640 1424 736 1424
            WIRE 640 1072 736 1072
        END BRANCH
        BEGIN BRANCH CE
            WIRE 512 2080 672 2080
            WIRE 672 2080 736 2080
            WIRE 672 592 736 592
            WIRE 672 592 672 1008
            WIRE 672 1008 672 1360
            WIRE 672 1360 672 1712
            WIRE 672 1712 672 2080
            WIRE 672 1712 736 1712
            WIRE 672 1360 736 1360
            WIRE 672 1008 736 1008
        END BRANCH
        BEGIN BRANCH d(15:0)
            WIRE 496 2016 528 2016
            WIRE 528 2016 736 2016
            BEGIN DISPLAY 528 2016 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(71:64)
            WIRE 480 528 512 528
            WIRE 512 528 736 528
            BEGIN DISPLAY 512 528 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(63:48)
            WIRE 496 944 528 944
            WIRE 528 944 736 944
            BEGIN DISPLAY 528 944 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(47:32)
            WIRE 496 1296 512 1296
            WIRE 512 1296 736 1296
            BEGIN DISPLAY 512 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH d(31:16)
            WIRE 496 1648 528 1648
            WIRE 528 1648 736 1648
            BEGIN DISPLAY 528 1648 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clr
            WIRE 528 2240 608 2240
            WIRE 608 2240 736 2240
            WIRE 592 752 608 752
            WIRE 608 752 736 752
            WIRE 608 752 608 1168
            WIRE 608 1168 736 1168
            WIRE 608 1168 608 1520
            WIRE 608 1520 736 1520
            WIRE 608 1520 608 1872
            WIRE 608 1872 608 2240
            WIRE 608 1872 736 1872
        END BRANCH
        BEGIN BRANCH d(71:0)
            WIRE 464 2384 784 2384
        END BRANCH
        BEGIN BRANCH q(71:0)
            WIRE 1168 2384 1488 2384
        END BRANCH
        IOMARKER 512 2080 CE R180 28
        IOMARKER 512 2144 clk R180 28
        IOMARKER 528 2240 clr R180 28
        IOMARKER 464 2384 d(71:0) R180 28
        IOMARKER 1488 2384 q(71:0) R0 28
    END SHEET
END SCHEMATIC
