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
        BEGIN SIGNAL CIN
        END SIGNAL
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
        SIGNAL BDO(5)
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
        SIGNAL SUBTRACT
        SIGNAL XLXN_58
        SIGNAL XLXN_59
        SIGNAL XLXN_60
        SIGNAL XLXN_61
        SIGNAL XLXN_62
        SIGNAL XLXN_63
        SIGNAL XLXN_64
        SIGNAL XLXN_65
        SIGNAL BDO(0)
        SIGNAL XLXN_48
        SIGNAL XLXN_66
        SIGNAL SUM(7:0)
        SIGNAL XLXN_69
        SIGNAL XLXN_70
        SIGNAL XLXN_71
        SIGNAL XLXN_72
        SIGNAL XLXN_73
        SIGNAL XLXN_74
        SIGNAL XLXN_75
        SIGNAL XLXN_76
        PORT Output COUT
        PORT Input ADO(7:0)
        PORT Input BDO(7:0)
        PORT Input SUBTRACT
        PORT Output SUM(7:0)
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
        BEGIN BLOCKDEF gnd
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -64 64 -96 
            LINE N 76 -48 52 -48 
            LINE N 68 -32 60 -32 
            LINE N 88 -64 40 -64 
            LINE N 64 -64 64 -80 
            LINE N 64 -128 64 -96 
        END BLOCKDEF
        BEGIN BLOCK Adder1bit_0 Adder1bit
            PIN A ADO(0)
            PIN B XLXN_69
            PIN C CIN
            PIN Cout XLXN_1
            PIN Sum SUM(0)
        END BLOCK
        BEGIN BLOCK XLXI_2 Adder1bit
            PIN A ADO(1)
            PIN B XLXN_70
            PIN C XLXN_1
            PIN Cout XLXN_2
            PIN Sum SUM(1)
        END BLOCK
        BEGIN BLOCK XLXI_3 Adder1bit
            PIN A ADO(2)
            PIN B XLXN_71
            PIN C XLXN_2
            PIN Cout XLXN_3
            PIN Sum SUM(2)
        END BLOCK
        BEGIN BLOCK XLXI_4 Adder1bit
            PIN A ADO(3)
            PIN B XLXN_72
            PIN C XLXN_3
            PIN Cout XLXN_4
            PIN Sum SUM(3)
        END BLOCK
        BEGIN BLOCK XLXI_5 Adder1bit
            PIN A ADO(4)
            PIN B XLXN_73
            PIN C XLXN_4
            PIN Cout XLXN_5
            PIN Sum SUM(4)
        END BLOCK
        BEGIN BLOCK XLXI_6 Adder1bit
            PIN A ADO(5)
            PIN B XLXN_74
            PIN C XLXN_5
            PIN Cout XLXN_6
            PIN Sum SUM(5)
        END BLOCK
        BEGIN BLOCK XLXI_7 Adder1bit
            PIN A ADO(6)
            PIN B XLXN_75
            PIN C XLXN_6
            PIN Cout XLXN_7
            PIN Sum SUM(6)
        END BLOCK
        BEGIN BLOCK XLXI_8 Adder1bit
            PIN A ADO(7)
            PIN B XLXN_76
            PIN C XLXN_7
            PIN Cout COUT
            PIN Sum SUM(7)
        END BLOCK
        BEGIN BLOCK XLXI_9 xor2
            PIN I0 SUBTRACT
            PIN I1 BD2
            PIN O XLXN_71
        END BLOCK
        BEGIN BLOCK XLXI_10 xor2
            PIN I0 SUBTRACT
            PIN I1 XLXN_48
            PIN O CIN
        END BLOCK
        BEGIN BLOCK XLXI_11 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(0)
            PIN O XLXN_69
        END BLOCK
        BEGIN BLOCK XLXI_12 xor2
            PIN I0 SUBTRACT
            PIN I1 BD1
            PIN O XLXN_70
        END BLOCK
        BEGIN BLOCK XLXI_13 xor2
            PIN I0 SUBTRACT
            PIN I1 BD3
            PIN O XLXN_72
        END BLOCK
        BEGIN BLOCK XLXI_14 xor2
            PIN I0 SUBTRACT
            PIN I1 BD4
            PIN O XLXN_73
        END BLOCK
        BEGIN BLOCK XLXI_15 xor2
            PIN I0 SUBTRACT
            PIN I1 BDO(5)
            PIN O XLXN_74
        END BLOCK
        BEGIN BLOCK XLXI_16 xor2
            PIN I0 SUBTRACT
            PIN I1 BD6
            PIN O XLXN_75
        END BLOCK
        BEGIN BLOCK XLXI_17 xor2
            PIN I0 SUBTRACT
            PIN I1 BD7
            PIN O XLXN_76
        END BLOCK
        BEGIN BLOCK XLXI_34 gnd
            PIN G XLXN_48
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE Adder1bit_0 992 1440 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_2 1248 1440 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1504 1440 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_4 1760 1440 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_5 2016 1440 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_6 2272 1440 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_7 2528 1440 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_8 2784 1440 R270
        END INSTANCE
        BEGIN BRANCH XLXN_1
            WIRE 960 1120 960 1184
            WIRE 960 1120 1040 1120
            WIRE 1040 1120 1040 1344
            WIRE 1040 1344 1056 1344
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 1216 1120 1296 1120
            WIRE 1296 1120 1296 1344
            WIRE 1296 1344 1312 1344
            WIRE 1216 1120 1216 1184
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1472 1120 1472 1184
            WIRE 1472 1120 1552 1120
            WIRE 1552 1120 1552 1344
            WIRE 1552 1344 1568 1344
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1728 1120 1728 1184
            WIRE 1728 1120 1808 1120
            WIRE 1808 1120 1808 1344
            WIRE 1808 1344 1824 1344
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1984 1120 1984 1184
            WIRE 1984 1120 2064 1120
            WIRE 2064 1120 2064 1344
            WIRE 2064 1344 2080 1344
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 2240 1120 2240 1184
            WIRE 2240 1120 2320 1120
            WIRE 2320 1120 2320 1344
            WIRE 2320 1344 2336 1344
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 2496 1120 2496 1184
            WIRE 2496 1120 2576 1120
            WIRE 2576 1120 2576 1344
            WIRE 2576 1344 2592 1344
        END BRANCH
        BEGIN BRANCH CIN
            WIRE 720 1344 736 1344
            WIRE 736 1344 752 1344
            WIRE 752 1344 800 1344
            WIRE 736 1344 736 1632
        END BRANCH
        BEGIN BRANCH ADO(0)
            WIRE 896 1440 896 1520
            WIRE 896 1520 896 1552
            BEGIN DISPLAY 896 1520 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(1)
            WIRE 1152 1440 1152 1520
            WIRE 1152 1520 1152 1552
            BEGIN DISPLAY 1152 1520 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(2)
            WIRE 1408 1440 1408 1504
            WIRE 1408 1504 1408 1552
            BEGIN DISPLAY 1408 1504 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(3)
            WIRE 1664 1440 1664 1504
            WIRE 1664 1504 1664 1552
            BEGIN DISPLAY 1664 1504 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(4)
            WIRE 1920 1440 1920 1504
            WIRE 1920 1504 1920 1536
            BEGIN DISPLAY 1920 1504 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(5)
            WIRE 2176 1440 2176 1488
            WIRE 2176 1488 2176 1536
            BEGIN DISPLAY 2176 1488 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(6)
            WIRE 2432 1440 2432 1488
            WIRE 2432 1488 2432 1536
            BEGIN DISPLAY 2432 1488 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(7)
            WIRE 2688 1440 2688 1504
            WIRE 2688 1504 2688 1536
            BEGIN DISPLAY 2688 1504 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(0)
            WIRE 896 1120 896 1152
            WIRE 896 1152 896 1184
            BEGIN DISPLAY 896 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(1)
            WIRE 1152 1120 1152 1152
            WIRE 1152 1152 1152 1184
            BEGIN DISPLAY 1152 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(2)
            WIRE 1408 1120 1408 1152
            WIRE 1408 1152 1408 1184
            BEGIN DISPLAY 1408 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(3)
            WIRE 1664 1120 1664 1152
            WIRE 1664 1152 1664 1184
            BEGIN DISPLAY 1664 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(4)
            WIRE 1920 1120 1920 1152
            WIRE 1920 1152 1920 1184
            BEGIN DISPLAY 1920 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(5)
            WIRE 2176 1120 2176 1152
            WIRE 2176 1152 2176 1184
            BEGIN DISPLAY 2176 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(6)
            WIRE 2432 1120 2432 1152
            WIRE 2432 1152 2432 1184
            BEGIN DISPLAY 2432 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(7)
            WIRE 2688 1120 2688 1152
            WIRE 2688 1152 2688 1184
            BEGIN DISPLAY 2688 1152 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH COUT
            WIRE 2752 992 2752 1120
            WIRE 2752 1120 2752 1184
        END BRANCH
        BEGIN BRANCH ADO(7:0)
            WIRE 1616 2160 1616 2288
        END BRANCH
        BEGIN BRANCH BDO(7:0)
            WIRE 1792 2160 1792 2288
        END BRANCH
        IOMARKER 1616 2288 ADO(7:0) R90 28
        IOMARKER 1792 2288 BDO(7:0) R90 28
        INSTANCE XLXI_16 2592 1888 R270
        INSTANCE XLXI_17 2848 1888 R270
        INSTANCE XLXI_15 2336 1888 R270
        INSTANCE XLXI_14 2080 1888 R270
        INSTANCE XLXI_13 1824 1888 R270
        INSTANCE XLXI_9 1568 1888 R270
        INSTANCE XLXI_12 1312 1888 R270
        INSTANCE XLXI_11 1056 1888 R270
        INSTANCE XLXI_10 832 1888 R270
        BEGIN BRANCH XLXN_48
            WIRE 704 1888 704 2000
            WIRE 704 2000 704 2048
        END BRANCH
        BEGIN BRANCH BDO(0)
            WIRE 928 1888 928 1984
            WIRE 928 1984 928 2000
            WIRE 928 2000 928 2048
            BEGIN DISPLAY 928 1984 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BD1
            WIRE 1184 1888 1184 1984
            WIRE 1184 1984 1184 2048
            BEGIN DISPLAY 1184 1984 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BD2
            WIRE 1440 1888 1440 2000
            WIRE 1440 2000 1440 2048
            BEGIN DISPLAY 1440 2000 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BD3
            WIRE 1696 1888 1696 1984
            WIRE 1696 1984 1696 2000
            WIRE 1696 2000 1696 2048
            BEGIN DISPLAY 1696 1984 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BD4
            WIRE 1952 1888 1952 2000
            WIRE 1952 2000 1952 2048
            BEGIN DISPLAY 1952 2000 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(5)
            WIRE 2208 1888 2208 1984
            WIRE 2208 1984 2208 2000
            WIRE 2208 2000 2208 2048
            BEGIN DISPLAY 2208 2000 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BD6
            WIRE 2464 1888 2464 2000
            WIRE 2464 2000 2464 2048
            BEGIN DISPLAY 2464 2000 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BD7
            WIRE 2720 1888 2720 2000
            WIRE 2720 2000 2720 2048
            BEGIN DISPLAY 2720 2000 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUBTRACT
            WIRE 528 1904 768 1904
            WIRE 768 1904 992 1904
            WIRE 992 1904 1248 1904
            WIRE 1248 1904 1504 1904
            WIRE 1504 1904 1760 1904
            WIRE 1760 1904 2000 1904
            WIRE 2000 1904 2016 1904
            WIRE 2016 1904 2272 1904
            WIRE 2272 1904 2528 1904
            WIRE 2528 1904 2784 1904
            WIRE 2784 1904 2816 1904
            WIRE 768 1888 768 1904
            WIRE 992 1888 992 1904
            WIRE 1248 1888 1248 1904
            WIRE 1504 1888 1504 1904
            WIRE 1760 1888 1760 1904
            WIRE 2016 1888 2016 1904
            WIRE 2272 1888 2272 1904
            WIRE 2528 1888 2528 1904
            WIRE 2784 1888 2784 1904
        END BRANCH
        INSTANCE XLXI_34 640 2176 R0
        BEGIN BRANCH SUM(7:0)
            WIRE 1856 848 1856 976
        END BRANCH
        IOMARKER 1856 848 SUM(7:0) R270 28
        IOMARKER 2752 992 COUT R270 28
        IOMARKER 528 1904 SUBTRACT R180 28
        BEGIN BRANCH XLXN_69
            WIRE 960 1440 960 1632
        END BRANCH
        BEGIN BRANCH XLXN_70
            WIRE 1216 1440 1216 1632
        END BRANCH
        BEGIN BRANCH XLXN_71
            WIRE 1472 1440 1472 1632
        END BRANCH
        BEGIN BRANCH XLXN_72
            WIRE 1728 1440 1728 1632
        END BRANCH
        BEGIN BRANCH XLXN_73
            WIRE 1984 1440 1984 1632
        END BRANCH
        BEGIN BRANCH XLXN_74
            WIRE 2240 1440 2240 1632
        END BRANCH
        BEGIN BRANCH XLXN_75
            WIRE 2496 1440 2496 1632
        END BRANCH
        BEGIN BRANCH XLXN_76
            WIRE 2752 1440 2752 1632
        END BRANCH
    END SHEET
END SCHEMATIC
