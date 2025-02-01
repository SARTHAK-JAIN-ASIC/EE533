VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_2
        SIGNAL XLXN_3
        SIGNAL XLXN_4
        SIGNAL XLXN_5
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL a(55:48)
        SIGNAL b(55:48)
        SIGNAL b(47:40)
        SIGNAL b(39:32)
        SIGNAL b(31:24)
        SIGNAL amask(6)
        SIGNAL amask(5)
        SIGNAL amask(4)
        SIGNAL amask(3)
        SIGNAL a(23:16)
        SIGNAL b(23:16)
        SIGNAL a(15:8)
        SIGNAL b(15:8)
        SIGNAL a(7:0)
        SIGNAL b(7:0)
        SIGNAL amask(2)
        SIGNAL amask(1)
        SIGNAL amask(0)
        SIGNAL XLXN_29
        SIGNAL XLXN_30
        SIGNAL XLXN_32
        SIGNAL XLXN_33
        SIGNAL XLXN_34
        SIGNAL XLXN_35
        SIGNAL XLXN_36
        SIGNAL a(47:40)
        SIGNAL a(39:32)
        SIGNAL a(31:24)
        SIGNAL match
        SIGNAL a(55:0)
        SIGNAL b(55:0)
        SIGNAL amask(6:0)
        PORT Output match
        PORT Input a(55:0)
        PORT Input b(55:0)
        PORT Input amask(6:0)
        BEGIN BLOCKDEF comp8
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -384 320 -64 
            LINE N 384 -224 320 -224 
            RECTANGLE N 0 -332 64 -308 
            LINE N 0 -320 64 -320 
            RECTANGLE N 0 -140 64 -116 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF or2b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 32 -64 
            CIRCLE N 32 -76 56 -52 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            LINE N 112 -48 48 -48 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -144 48 -144 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            ARC N 28 -224 204 -48 112 -48 192 -96 
        END BLOCKDEF
        BEGIN BLOCKDEF and7
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -448 64 -64 
            ARC N 96 -304 192 -208 144 -208 144 -304 
            LINE N 64 -304 144 -304 
            LINE N 144 -208 64 -208 
            LINE N 256 -256 192 -256 
            LINE N 0 -448 64 -448 
            LINE N 0 -384 64 -384 
            LINE N 0 -320 64 -320 
            LINE N 0 -256 64 -256 
            LINE N 0 -192 64 -192 
            LINE N 0 -128 64 -128 
            LINE N 0 -64 64 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 comp8
            PIN A(7:0) a(55:48)
            PIN B(7:0) b(55:48)
            PIN EQ XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_2 comp8
            PIN A(7:0) a(47:40)
            PIN B(7:0) b(47:40)
            PIN EQ XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_3 comp8
            PIN A(7:0) a(39:32)
            PIN B(7:0) b(39:32)
            PIN EQ XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_4 comp8
            PIN A(7:0) a(31:24)
            PIN B(7:0) b(31:24)
            PIN EQ XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_8 or2b1
            PIN I0 amask(6)
            PIN I1 XLXN_1
            PIN O XLXN_29
        END BLOCK
        BEGIN BLOCK XLXI_9 or2b1
            PIN I0 amask(5)
            PIN I1 XLXN_2
            PIN O XLXN_30
        END BLOCK
        BEGIN BLOCK XLXI_10 or2b1
            PIN I0 amask(4)
            PIN I1 XLXN_3
            PIN O XLXN_32
        END BLOCK
        BEGIN BLOCK XLXI_11 or2b1
            PIN I0 amask(3)
            PIN I1 XLXN_4
            PIN O XLXN_33
        END BLOCK
        BEGIN BLOCK XLXI_15 and7
            PIN I0 XLXN_34
            PIN I1 XLXN_35
            PIN I2 XLXN_36
            PIN I3 XLXN_33
            PIN I4 XLXN_32
            PIN I5 XLXN_30
            PIN I6 XLXN_29
            PIN O match
        END BLOCK
        BEGIN BLOCK XLXI_5 comp8
            PIN A(7:0) a(23:16)
            PIN B(7:0) b(23:16)
            PIN EQ XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_6 comp8
            PIN A(7:0) a(15:8)
            PIN B(7:0) b(15:8)
            PIN EQ XLXN_6
        END BLOCK
        BEGIN BLOCK XLXI_7 comp8
            PIN A(7:0) a(7:0)
            PIN B(7:0) b(7:0)
            PIN EQ XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_12 or2b1
            PIN I0 amask(2)
            PIN I1 XLXN_7
            PIN O XLXN_36
        END BLOCK
        BEGIN BLOCK XLXI_13 or2b1
            PIN I0 amask(1)
            PIN I1 XLXN_6
            PIN O XLXN_35
        END BLOCK
        BEGIN BLOCK XLXI_14 or2b1
            PIN I0 amask(0)
            PIN I1 XLXN_5
            PIN O XLXN_34
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 608 944 R0
        INSTANCE XLXI_2 608 1328 R0
        INSTANCE XLXI_3 608 1728 R0
        INSTANCE XLXI_4 608 2112 R0
        INSTANCE XLXI_8 1136 848 R0
        INSTANCE XLXI_9 1152 1232 R0
        INSTANCE XLXI_10 1168 1632 R0
        INSTANCE XLXI_11 1168 2016 R0
        INSTANCE XLXI_15 3008 1664 R0
        INSTANCE XLXI_5 1760 1248 R0
        INSTANCE XLXI_6 1760 1616 R0
        INSTANCE XLXI_7 1760 2000 R0
        INSTANCE XLXI_12 2288 1152 R0
        INSTANCE XLXI_13 2288 1488 R0
        INSTANCE XLXI_14 2288 1904 R0
        BEGIN BRANCH XLXN_1
            WIRE 992 720 1136 720
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 992 1104 1152 1104
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 992 1504 1168 1504
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 992 1888 1168 1888
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 2144 1776 2288 1776
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 2144 1392 2208 1392
            WIRE 2208 1360 2208 1392
            WIRE 2208 1360 2288 1360
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 2144 1024 2288 1024
        END BRANCH
        BEGIN BRANCH a(55:48)
            WIRE 384 624 400 624
            WIRE 400 624 608 624
            BEGIN DISPLAY 400 624 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(55:48)
            WIRE 384 816 416 816
            WIRE 416 816 608 816
            BEGIN DISPLAY 416 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(47:40)
            WIRE 400 1200 432 1200
            WIRE 432 1200 608 1200
            BEGIN DISPLAY 432 1200 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(39:32)
            WIRE 416 1600 464 1600
            WIRE 464 1600 608 1600
            BEGIN DISPLAY 464 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(31:24)
            WIRE 416 1984 448 1984
            WIRE 448 1984 608 1984
            BEGIN DISPLAY 448 1984 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(6)
            WIRE 992 784 1040 784
            WIRE 1040 784 1136 784
            BEGIN DISPLAY 1040 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(5)
            WIRE 1024 1168 1072 1168
            WIRE 1072 1168 1152 1168
            BEGIN DISPLAY 1072 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(4)
            WIRE 1040 1568 1072 1568
            WIRE 1072 1568 1168 1568
            BEGIN DISPLAY 1072 1568 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(3)
            WIRE 1024 1952 1056 1952
            WIRE 1056 1952 1168 1952
            BEGIN DISPLAY 1056 1952 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(23:16)
            WIRE 1616 928 1664 928
            WIRE 1664 928 1760 928
            BEGIN DISPLAY 1664 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(23:16)
            WIRE 1616 1120 1664 1120
            WIRE 1664 1120 1760 1120
            BEGIN DISPLAY 1664 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(15:8)
            WIRE 1616 1296 1648 1296
            WIRE 1648 1296 1760 1296
            BEGIN DISPLAY 1648 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(15:8)
            WIRE 1632 1488 1664 1488
            WIRE 1664 1488 1760 1488
            BEGIN DISPLAY 1664 1488 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(7:0)
            WIRE 1648 1680 1680 1680
            WIRE 1680 1680 1760 1680
            BEGIN DISPLAY 1680 1680 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH b(7:0)
            WIRE 1632 1872 1680 1872
            WIRE 1680 1872 1760 1872
            BEGIN DISPLAY 1680 1872 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(2)
            WIRE 2176 1088 2208 1088
            WIRE 2208 1088 2288 1088
            BEGIN DISPLAY 2208 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(1)
            WIRE 2192 1424 2192 1472
            WIRE 2192 1424 2224 1424
            WIRE 2224 1424 2288 1424
            BEGIN DISPLAY 2224 1424 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH amask(0)
            WIRE 2176 1840 2208 1840
            WIRE 2208 1840 2288 1840
            BEGIN DISPLAY 2208 1840 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_29
            WIRE 1392 752 3008 752
            WIRE 3008 752 3008 1216
        END BRANCH
        BEGIN BRANCH XLXN_30
            WIRE 1408 1136 1472 1136
            WIRE 1472 1136 1472 1200
            WIRE 1472 1200 2208 1200
            WIRE 2208 1200 2208 1280
            WIRE 2208 1280 3008 1280
        END BRANCH
        BEGIN BRANCH XLXN_32
            WIRE 1424 1536 1488 1536
            WIRE 1488 1536 1488 1600
            WIRE 1488 1600 2592 1600
            WIRE 2592 1344 2592 1600
            WIRE 2592 1344 3008 1344
        END BRANCH
        BEGIN BRANCH XLXN_33
            WIRE 1424 1920 1488 1920
            WIRE 1488 1920 1488 2016
            WIRE 1488 2016 2608 2016
            WIRE 2608 1408 2608 2016
            WIRE 2608 1408 3008 1408
        END BRANCH
        BEGIN BRANCH XLXN_34
            WIRE 2544 1808 3008 1808
            WIRE 3008 1600 3008 1808
        END BRANCH
        BEGIN BRANCH XLXN_35
            WIRE 2544 1392 2768 1392
            WIRE 2768 1392 2768 1536
            WIRE 2768 1536 3008 1536
        END BRANCH
        BEGIN BRANCH XLXN_36
            WIRE 2544 1056 2752 1056
            WIRE 2752 1056 2752 1472
            WIRE 2752 1472 3008 1472
        END BRANCH
        BEGIN BRANCH a(47:40)
            WIRE 400 1008 432 1008
            WIRE 432 1008 608 1008
            BEGIN DISPLAY 432 1008 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(39:32)
            WIRE 416 1392 416 1408
            WIRE 416 1408 448 1408
            WIRE 448 1408 608 1408
            BEGIN DISPLAY 448 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH a(31:24)
            WIRE 416 1792 448 1792
            WIRE 448 1792 608 1792
            BEGIN DISPLAY 448 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH match
            WIRE 3264 1408 3296 1408
        END BRANCH
        IOMARKER 3296 1408 match R0 28
        BEGIN BRANCH a(55:0)
            WIRE 544 240 880 240
        END BRANCH
        BEGIN BRANCH b(55:0)
            WIRE 544 400 880 400
        END BRANCH
        IOMARKER 544 240 a(55:0) R180 28
        IOMARKER 544 400 b(55:0) R180 28
        BEGIN BRANCH amask(6:0)
            WIRE 1632 320 1968 320
        END BRANCH
        IOMARKER 1632 320 amask(6:0) R180 28
    END SHEET
END SCHEMATIC
