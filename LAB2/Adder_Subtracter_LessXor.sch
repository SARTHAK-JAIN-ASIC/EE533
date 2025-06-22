VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
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
        SIGNAL ADO(0)
        SIGNAL ADO(1)
        SIGNAL ADO(2)
        SIGNAL ADO(3)
        SIGNAL ADO(4)
        SIGNAL ADO(5)
        SIGNAL ADO(6)
        SIGNAL ADO(7)
        SIGNAL BD2
        SIGNAL BD3
        SIGNAL BD1
        SIGNAL BD4
        SIGNAL BD5
        SIGNAL BD6
        SIGNAL BD7
        SIGNAL SUM(0)
        SIGNAL SUM(1)
        SIGNAL SUM(2)
        SIGNAL SUM(3)
        SIGNAL SUM(4)
        SIGNAL SUM(5)
        SIGNAL SUM(6)
        SIGNAL SUM(7)
        SIGNAL COUT
        SIGNAL ADO(7:0)
        SIGNAL BDO(7:0)
        SIGNAL BDO(0)
        SIGNAL BDO(1)
        SIGNAL BDO(2)
        SIGNAL BDO(3)
        SIGNAL BDO(4)
        SIGNAL BDO(5)
        SIGNAL BDO(6)
        SIGNAL BDO(7)
        SIGNAL SUBTRACT
        SIGNAL XLXN_140
        SIGNAL SUM(7:0)
        SIGNAL Cin
        PORT Output COUT
        PORT Input ADO(7:0)
        PORT Input BDO(7:0)
        PORT Input SUBTRACT
        PORT Output SUM(7:0)
        PORT Input Cin
        BEGIN BLOCKDEF Adder1bit
            TIMESTAMP 2025 1 24 9 34 48
            RECTANGLE N 64 -128 192 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 96 -128 96 -192 
            LINE N 192 -32 256 -32 
            LINE N 192 -96 256 -96 
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
        BEGIN BLOCK Adder1bit_0 Adder1bit
            PIN A ADO(0)
            PIN B XLXN_140
            PIN C Cin
            PIN Cout XLXN_1
            PIN Sum SUM(0)
        END BLOCK
        BEGIN BLOCK XLXI_2 Adder1bit
            PIN A ADO(1)
            PIN B BD1
            PIN C XLXN_1
            PIN Cout XLXN_2
            PIN Sum SUM(1)
        END BLOCK
        BEGIN BLOCK XLXI_3 Adder1bit
            PIN A ADO(2)
            PIN B BD2
            PIN C XLXN_2
            PIN Cout XLXN_3
            PIN Sum SUM(2)
        END BLOCK
        BEGIN BLOCK XLXI_4 Adder1bit
            PIN A ADO(3)
            PIN B BD3
            PIN C XLXN_3
            PIN Cout XLXN_4
            PIN Sum SUM(3)
        END BLOCK
        BEGIN BLOCK XLXI_5 Adder1bit
            PIN A ADO(4)
            PIN B BD4
            PIN C XLXN_4
            PIN Cout XLXN_5
            PIN Sum SUM(4)
        END BLOCK
        BEGIN BLOCK XLXI_6 Adder1bit
            PIN A ADO(5)
            PIN B BD5
            PIN C XLXN_5
            PIN Cout XLXN_6
            PIN Sum SUM(5)
        END BLOCK
        BEGIN BLOCK XLXI_7 Adder1bit
            PIN A ADO(6)
            PIN B BD6
            PIN C XLXN_6
            PIN Cout XLXN_7
            PIN Sum SUM(6)
        END BLOCK
        BEGIN BLOCK XLXI_8 Adder1bit
            PIN A ADO(7)
            PIN B BD7
            PIN C XLXN_7
            PIN Cout COUT
            PIN Sum SUM(7)
        END BLOCK
        BEGIN BLOCK XLXI_16 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(6)
            PIN O BD6
        END BLOCK
        BEGIN BLOCK XLXI_17 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(7)
            PIN O BD7
        END BLOCK
        BEGIN BLOCK XLXI_15 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(5)
            PIN O BD5
        END BLOCK
        BEGIN BLOCK XLXI_14 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(4)
            PIN O BD4
        END BLOCK
        BEGIN BLOCK XLXI_13 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(3)
            PIN O BD3
        END BLOCK
        BEGIN BLOCK XLXI_9 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(2)
            PIN O BD2
        END BLOCK
        BEGIN BLOCK XLXI_12 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(1)
            PIN O BD1
        END BLOCK
        BEGIN BLOCK XLXI_11 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(0)
            PIN O XLXN_140
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE Adder1bit_0 1024 1216 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_2 1280 1216 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1536 1216 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_4 1792 1216 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_5 2048 1216 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_6 2304 1216 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_7 2560 1216 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_8 2816 1216 R270
        END INSTANCE
        BEGIN BRANCH XLXN_1
            WIRE 992 896 992 960
            WIRE 992 896 1072 896
            WIRE 1072 896 1072 1120
            WIRE 1072 1120 1088 1120
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 1248 896 1328 896
            WIRE 1328 896 1328 1120
            WIRE 1328 1120 1344 1120
            WIRE 1248 896 1248 960
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1504 896 1504 960
            WIRE 1504 896 1584 896
            WIRE 1584 896 1584 1120
            WIRE 1584 1120 1600 1120
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1760 896 1760 960
            WIRE 1760 896 1840 896
            WIRE 1840 896 1840 1120
            WIRE 1840 1120 1856 1120
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 2016 896 2016 960
            WIRE 2016 896 2096 896
            WIRE 2096 896 2096 1120
            WIRE 2096 1120 2112 1120
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 2272 896 2272 960
            WIRE 2272 896 2352 896
            WIRE 2352 896 2352 1120
            WIRE 2352 1120 2368 1120
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 2528 896 2528 960
            WIRE 2528 896 2608 896
            WIRE 2608 896 2608 1120
            WIRE 2608 1120 2624 1120
        END BRANCH
        BEGIN BRANCH ADO(0)
            WIRE 928 1216 928 1296
            WIRE 928 1296 928 1328
            BEGIN DISPLAY 928 1296 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(1)
            WIRE 1184 1216 1184 1296
            WIRE 1184 1296 1184 1328
            BEGIN DISPLAY 1184 1296 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(2)
            WIRE 1440 1216 1440 1280
            WIRE 1440 1280 1440 1328
            BEGIN DISPLAY 1440 1280 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(3)
            WIRE 1696 1216 1696 1280
            WIRE 1696 1280 1696 1328
            BEGIN DISPLAY 1696 1280 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(4)
            WIRE 1952 1216 1952 1280
            WIRE 1952 1280 1952 1312
            BEGIN DISPLAY 1952 1280 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(5)
            WIRE 2208 1216 2208 1264
            WIRE 2208 1264 2208 1312
            BEGIN DISPLAY 2208 1264 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(6)
            WIRE 2464 1216 2464 1264
            WIRE 2464 1264 2464 1312
            BEGIN DISPLAY 2464 1264 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(7)
            WIRE 2720 1216 2720 1280
            WIRE 2720 1280 2720 1312
            BEGIN DISPLAY 2720 1280 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BD2
            WIRE 1504 1216 1504 1280
            WIRE 1504 1280 1504 1328
            WIRE 1504 1328 1504 1408
        END BRANCH
        BEGIN BRANCH BD3
            WIRE 1760 1216 1760 1280
            WIRE 1760 1280 1760 1328
            WIRE 1760 1328 1760 1408
        END BRANCH
        BEGIN BRANCH BD1
            WIRE 1248 1216 1248 1280
            WIRE 1248 1280 1248 1328
            WIRE 1248 1328 1248 1408
        END BRANCH
        BEGIN BRANCH BD4
            WIRE 2016 1216 2016 1280
            WIRE 2016 1280 2016 1312
            WIRE 2016 1312 2016 1408
        END BRANCH
        BEGIN BRANCH BD5
            WIRE 2272 1216 2272 1280
            WIRE 2272 1280 2272 1312
            WIRE 2272 1312 2272 1408
        END BRANCH
        BEGIN BRANCH BD6
            WIRE 2528 1216 2528 1280
            WIRE 2528 1280 2528 1312
            WIRE 2528 1312 2528 1408
        END BRANCH
        BEGIN BRANCH BD7
            WIRE 2784 1216 2784 1280
            WIRE 2784 1280 2784 1312
            WIRE 2784 1312 2784 1408
        END BRANCH
        BEGIN BRANCH SUM(0)
            WIRE 928 896 928 928
            WIRE 928 928 928 960
            BEGIN DISPLAY 928 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(1)
            WIRE 1184 896 1184 928
            WIRE 1184 928 1184 960
            BEGIN DISPLAY 1184 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(2)
            WIRE 1440 896 1440 928
            WIRE 1440 928 1440 960
            BEGIN DISPLAY 1440 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(3)
            WIRE 1696 896 1696 928
            WIRE 1696 928 1696 960
            BEGIN DISPLAY 1696 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(4)
            WIRE 1952 896 1952 928
            WIRE 1952 928 1952 960
            BEGIN DISPLAY 1952 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(5)
            WIRE 2208 896 2208 928
            WIRE 2208 928 2208 960
            BEGIN DISPLAY 2208 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(6)
            WIRE 2464 896 2464 928
            WIRE 2464 928 2464 960
            BEGIN DISPLAY 2464 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(7)
            WIRE 2720 896 2720 928
            WIRE 2720 928 2720 960
            BEGIN DISPLAY 2720 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH COUT
            WIRE 2784 768 2784 896
            WIRE 2784 896 2784 960
        END BRANCH
        BEGIN BRANCH ADO(7:0)
            WIRE 1648 1936 1648 2064
        END BRANCH
        BEGIN BRANCH BDO(7:0)
            WIRE 1824 1936 1824 2064
        END BRANCH
        INSTANCE XLXI_16 2624 1664 R270
        INSTANCE XLXI_17 2880 1664 R270
        INSTANCE XLXI_15 2368 1664 R270
        INSTANCE XLXI_14 2112 1664 R270
        INSTANCE XLXI_13 1856 1664 R270
        INSTANCE XLXI_9 1600 1664 R270
        INSTANCE XLXI_12 1344 1664 R270
        INSTANCE XLXI_11 1088 1664 R270
        BEGIN BRANCH BDO(0)
            WIRE 960 1664 960 1760
            WIRE 960 1760 960 1776
            WIRE 960 1776 960 1824
            BEGIN DISPLAY 960 1760 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(1)
            WIRE 1216 1664 1216 1760
            WIRE 1216 1760 1216 1824
            BEGIN DISPLAY 1216 1760 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(2)
            WIRE 1472 1664 1472 1776
            WIRE 1472 1776 1472 1824
            BEGIN DISPLAY 1472 1776 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(3)
            WIRE 1728 1664 1728 1760
            WIRE 1728 1760 1728 1776
            WIRE 1728 1776 1728 1824
            BEGIN DISPLAY 1728 1760 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(4)
            WIRE 1984 1664 1984 1776
            WIRE 1984 1776 1984 1824
            BEGIN DISPLAY 1984 1776 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(5)
            WIRE 2240 1664 2240 1760
            WIRE 2240 1760 2240 1776
            WIRE 2240 1776 2240 1824
            BEGIN DISPLAY 2240 1776 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(6)
            WIRE 2496 1664 2496 1776
            WIRE 2496 1776 2496 1824
            BEGIN DISPLAY 2496 1776 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(7)
            WIRE 2752 1664 2752 1776
            WIRE 2752 1776 2752 1824
            BEGIN DISPLAY 2752 1776 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUBTRACT
            WIRE 560 1680 800 1680
            WIRE 800 1680 1024 1680
            WIRE 1024 1680 1280 1680
            WIRE 1280 1680 1536 1680
            WIRE 1536 1680 1792 1680
            WIRE 1792 1680 2032 1680
            WIRE 2032 1680 2048 1680
            WIRE 2048 1680 2304 1680
            WIRE 2304 1680 2560 1680
            WIRE 2560 1680 2816 1680
            WIRE 2816 1680 2848 1680
            WIRE 800 1664 800 1680
            WIRE 1024 1664 1024 1680
            WIRE 1280 1664 1280 1680
            WIRE 1536 1664 1536 1680
            WIRE 1792 1664 1792 1680
            WIRE 2048 1664 2048 1680
            WIRE 2304 1664 2304 1680
            WIRE 2560 1664 2560 1680
            WIRE 2816 1664 2816 1680
        END BRANCH
        BEGIN BRANCH XLXN_140
            WIRE 992 1216 992 1280
            WIRE 992 1280 992 1328
            WIRE 992 1328 992 1408
        END BRANCH
        BEGIN BRANCH SUM(7:0)
            WIRE 1888 624 1888 752
        END BRANCH
        IOMARKER 1648 2064 ADO(7:0) R90 28
        IOMARKER 1824 2064 BDO(7:0) R90 28
        IOMARKER 1888 624 SUM(7:0) R270 28
        IOMARKER 2784 768 COUT R270 28
        IOMARKER 560 1680 SUBTRACT R180 28
        BEGIN BRANCH Cin
            WIRE 800 1120 832 1120
        END BRANCH
        IOMARKER 800 1120 Cin R180 28
    END SHEET
END SCHEMATIC
