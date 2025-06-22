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
        SIGNAL CIN
        SIGNAL XLXN_62
        SIGNAL XLXN_63
        SIGNAL XLXN_64
        SIGNAL XLXN_72
        SIGNAL XLXN_73
        SIGNAL ADO(0)
        SIGNAL BDO(0)
        SIGNAL ADO(1)
        SIGNAL ADO(2)
        SIGNAL ADO(3)
        SIGNAL ADO(4)
        SIGNAL ADO(5)
        SIGNAL ADO(6)
        SIGNAL ADO(7)
        SIGNAL BDO(2)
        SIGNAL BDO(3)
        SIGNAL BDO(1)
        SIGNAL BDO(4)
        SIGNAL BDO(5)
        SIGNAL BDO(6)
        SIGNAL BDO(7)
        SIGNAL ADO(7:0)
        SIGNAL BDO(7:0)
        SIGNAL SUM(7:0)
        SIGNAL SUM(0)
        SIGNAL SUM(1)
        SIGNAL SUM(2)
        SIGNAL SUM(3)
        SIGNAL SUM(4)
        SIGNAL SUM(5)
        SIGNAL SUM(6)
        SIGNAL SUM(7)
        SIGNAL COUT
        PORT Input CIN
        PORT Input ADO(7:0)
        PORT Input BDO(7:0)
        PORT Output SUM(7:0)
        PORT Output COUT
        BEGIN BLOCKDEF Adder1bit
            TIMESTAMP 2025 1 24 9 34 48
            RECTANGLE N 64 -128 192 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -32 0 -32 
            LINE N 96 -128 96 -192 
            LINE N 192 -32 256 -32 
            LINE N 192 -96 256 -96 
        END BLOCKDEF
        BEGIN BLOCK Adder1bit_0 Adder1bit
            PIN A ADO(0)
            PIN B BDO(0)
            PIN C CIN
            PIN Cout XLXN_1
            PIN Sum SUM(0)
        END BLOCK
        BEGIN BLOCK XLXI_2 Adder1bit
            PIN A ADO(1)
            PIN B BDO(1)
            PIN C XLXN_1
            PIN Cout XLXN_2
            PIN Sum SUM(1)
        END BLOCK
        BEGIN BLOCK XLXI_3 Adder1bit
            PIN A ADO(2)
            PIN B BDO(2)
            PIN C XLXN_2
            PIN Cout XLXN_3
            PIN Sum SUM(2)
        END BLOCK
        BEGIN BLOCK XLXI_4 Adder1bit
            PIN A ADO(3)
            PIN B BDO(3)
            PIN C XLXN_3
            PIN Cout XLXN_4
            PIN Sum SUM(3)
        END BLOCK
        BEGIN BLOCK XLXI_5 Adder1bit
            PIN A ADO(4)
            PIN B BDO(4)
            PIN C XLXN_4
            PIN Cout XLXN_5
            PIN Sum SUM(4)
        END BLOCK
        BEGIN BLOCK XLXI_6 Adder1bit
            PIN A ADO(5)
            PIN B BDO(5)
            PIN C XLXN_5
            PIN Cout XLXN_6
            PIN Sum SUM(5)
        END BLOCK
        BEGIN BLOCK XLXI_7 Adder1bit
            PIN A ADO(6)
            PIN B BDO(6)
            PIN C XLXN_6
            PIN Cout XLXN_7
            PIN Sum SUM(6)
        END BLOCK
        BEGIN BLOCK XLXI_8 Adder1bit
            PIN A ADO(7)
            PIN B BDO(7)
            PIN C XLXN_7
            PIN Cout COUT
            PIN Sum SUM(7)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE Adder1bit_0 672 1264 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_2 928 1264 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1184 1264 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_4 1440 1264 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_5 1696 1264 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_6 1952 1264 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_7 2208 1264 R270
        END INSTANCE
        BEGIN INSTANCE XLXI_8 2464 1264 R270
        END INSTANCE
        BEGIN BRANCH XLXN_1
            WIRE 640 944 640 1008
            WIRE 640 944 720 944
            WIRE 720 944 720 1168
            WIRE 720 1168 736 1168
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 896 944 976 944
            WIRE 976 944 976 1168
            WIRE 976 1168 992 1168
            WIRE 896 944 896 992
            WIRE 896 992 896 1008
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1152 944 1152 1008
            WIRE 1152 944 1232 944
            WIRE 1232 944 1232 1168
            WIRE 1232 1168 1248 1168
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1408 944 1408 1008
            WIRE 1408 944 1488 944
            WIRE 1488 944 1488 1168
            WIRE 1488 1168 1504 1168
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1664 944 1664 1008
            WIRE 1664 944 1744 944
            WIRE 1744 944 1744 1168
            WIRE 1744 1168 1760 1168
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1920 944 1920 1008
            WIRE 1920 944 2000 944
            WIRE 2000 944 2000 1168
            WIRE 2000 1168 2016 1168
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 2176 944 2176 1008
            WIRE 2176 944 2256 944
            WIRE 2256 944 2256 1168
            WIRE 2256 1168 2272 1168
        END BRANCH
        BEGIN BRANCH CIN
            WIRE 400 1168 432 1168
            WIRE 432 1168 480 1168
            BEGIN DISPLAY 432 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(0)
            WIRE 576 1264 576 1296
            WIRE 576 1296 576 1344
            WIRE 576 1344 576 1376
            BEGIN DISPLAY 576 1344 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(0)
            WIRE 640 1264 640 1296
            WIRE 640 1296 640 1328
            WIRE 640 1328 640 1376
            BEGIN DISPLAY 640 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(1)
            WIRE 832 1264 832 1344
            WIRE 832 1344 832 1376
            BEGIN DISPLAY 832 1344 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(2)
            WIRE 1088 1264 1088 1328
            WIRE 1088 1328 1088 1376
            BEGIN DISPLAY 1088 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(3)
            WIRE 1344 1264 1344 1328
            WIRE 1344 1328 1344 1376
            BEGIN DISPLAY 1344 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(4)
            WIRE 1600 1264 1600 1328
            WIRE 1600 1328 1600 1360
            BEGIN DISPLAY 1600 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(5)
            WIRE 1856 1264 1856 1312
            WIRE 1856 1312 1856 1360
            BEGIN DISPLAY 1856 1312 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(6)
            WIRE 2112 1264 2112 1312
            WIRE 2112 1312 2112 1360
            BEGIN DISPLAY 2112 1312 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ADO(7)
            WIRE 2368 1264 2368 1328
            WIRE 2368 1328 2368 1360
            BEGIN DISPLAY 2368 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(2)
            WIRE 1152 1264 1152 1328
            WIRE 1152 1328 1152 1376
            BEGIN DISPLAY 1152 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(3)
            WIRE 1408 1264 1408 1328
            WIRE 1408 1328 1408 1376
            BEGIN DISPLAY 1408 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(1)
            WIRE 896 1264 896 1328
            WIRE 896 1328 896 1376
            BEGIN DISPLAY 896 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(4)
            WIRE 1664 1264 1664 1328
            WIRE 1664 1328 1664 1360
            BEGIN DISPLAY 1664 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(5)
            WIRE 1920 1264 1920 1328
            WIRE 1920 1328 1920 1360
            BEGIN DISPLAY 1920 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(6)
            WIRE 2176 1264 2176 1328
            WIRE 2176 1328 2176 1360
            BEGIN DISPLAY 2176 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH BDO(7)
            WIRE 2432 1264 2432 1328
            WIRE 2432 1328 2432 1360
            BEGIN DISPLAY 2432 1328 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 400 1168 CIN R180 28
        BEGIN BRANCH ADO(7:0)
            WIRE 1296 1536 1296 1664
        END BRANCH
        BEGIN BRANCH BDO(7:0)
            WIRE 1472 1536 1472 1664
        END BRANCH
        BEGIN BRANCH SUM(7:0)
            WIRE 1424 704 1424 832
        END BRANCH
        IOMARKER 1296 1664 ADO(7:0) R90 28
        IOMARKER 1472 1664 BDO(7:0) R90 28
        IOMARKER 1424 704 SUM(7:0) R270 28
        BEGIN BRANCH SUM(0)
            WIRE 576 944 576 976
            WIRE 576 976 576 1008
            BEGIN DISPLAY 576 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(1)
            WIRE 832 944 832 976
            WIRE 832 976 832 1008
            BEGIN DISPLAY 832 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(2)
            WIRE 1088 944 1088 976
            WIRE 1088 976 1088 1008
            BEGIN DISPLAY 1088 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(3)
            WIRE 1344 944 1344 976
            WIRE 1344 976 1344 1008
            BEGIN DISPLAY 1344 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(4)
            WIRE 1600 944 1600 976
            WIRE 1600 976 1600 1008
            BEGIN DISPLAY 1600 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(5)
            WIRE 1856 944 1856 976
            WIRE 1856 976 1856 1008
            BEGIN DISPLAY 1856 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(6)
            WIRE 2112 944 2112 976
            WIRE 2112 976 2112 1008
            BEGIN DISPLAY 2112 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH SUM(7)
            WIRE 2368 944 2368 976
            WIRE 2368 976 2368 1008
            BEGIN DISPLAY 2368 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH COUT
            WIRE 2432 944 2432 1008
        END BRANCH
        IOMARKER 2432 944 COUT R270 28
    END SHEET
END SCHEMATIC
