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
        SIGNAL XLXN_8
        SIGNAL match
        SIGNAL datacomp(55:0)
        SIGNAL wildcard(6:0)
        SIGNAL datain(55:0)
        SIGNAL datain(63:8)
        SIGNAL datain(71:16)
        SIGNAL datain(79:24)
        SIGNAL datain(87:32)
        SIGNAL datain(95:40)
        SIGNAL datain(111:56)
        SIGNAL datain(103:48)
        SIGNAL datain(111:0)
        PORT Output match
        PORT Input datacomp(55:0)
        PORT Input wildcard(6:0)
        PORT Input datain(111:0)
        BEGIN BLOCKDEF comparator
            TIMESTAMP 2025 1 30 4 23 54
            RECTANGLE N -128 -96 128 96 
            LINE N -128 -64 -192 -64 
            RECTANGLE N -192 -76 -128 -52 
            LINE N -128 64 -192 64 
            RECTANGLE N -192 52 -128 76 
            LINE N -128 0 -192 0 
            RECTANGLE N -192 -12 -128 12 
            LINE N 128 -64 192 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF or8
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 48 -128 
            LINE N 0 -192 48 -192 
            LINE N 0 -384 48 -384 
            LINE N 0 -448 48 -448 
            LINE N 0 -512 48 -512 
            LINE N 256 -288 192 -288 
            LINE N 0 -320 64 -320 
            LINE N 0 -256 64 -256 
            ARC N 28 -336 204 -160 192 -288 112 -336 
            LINE N 112 -240 48 -240 
            ARC N 28 -416 204 -240 112 -240 192 -288 
            ARC N -40 -344 72 -232 48 -240 48 -336 
            LINE N 112 -336 48 -336 
            LINE N 48 -336 48 -512 
            LINE N 48 -64 48 -240 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 comparator
            PIN a(55:0) datacomp(55:0)
            PIN amask(6:0) wildcard(6:0)
            PIN b(55:0) datain(55:0)
            PIN match XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_2 comparator
            PIN a(55:0) datacomp(55:0)
            PIN amask(6:0) wildcard(6:0)
            PIN b(55:0) datain(63:8)
            PIN match XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_3 comparator
            PIN a(55:0) datacomp(55:0)
            PIN amask(6:0) wildcard(6:0)
            PIN b(55:0) datain(71:16)
            PIN match XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_4 comparator
            PIN a(55:0) datacomp(55:0)
            PIN amask(6:0) wildcard(6:0)
            PIN b(55:0) datain(79:24)
            PIN match XLXN_4
        END BLOCK
        BEGIN BLOCK XLXI_5 comparator
            PIN a(55:0) datacomp(55:0)
            PIN amask(6:0) wildcard(6:0)
            PIN b(55:0) datain(87:32)
            PIN match XLXN_5
        END BLOCK
        BEGIN BLOCK XLXI_6 comparator
            PIN a(55:0) datacomp(55:0)
            PIN amask(6:0) wildcard(6:0)
            PIN b(55:0) datain(95:40)
            PIN match XLXN_6
        END BLOCK
        BEGIN BLOCK XLXI_7 comparator
            PIN a(55:0) datacomp(55:0)
            PIN amask(6:0) wildcard(6:0)
            PIN b(55:0) datain(103:48)
            PIN match XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_8 comparator
            PIN a(55:0) datacomp(55:0)
            PIN amask(6:0) wildcard(6:0)
            PIN b(55:0) datain(111:56)
            PIN match XLXN_8
        END BLOCK
        BEGIN BLOCK XLXI_9 or8
            PIN I0 XLXN_8
            PIN I1 XLXN_7
            PIN I2 XLXN_6
            PIN I3 XLXN_5
            PIN I4 XLXN_4
            PIN I5 XLXN_3
            PIN I6 XLXN_2
            PIN I7 XLXN_1
            PIN O match
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 880 688 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 880 928 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 880 1184 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_4 880 1440 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_5 880 1696 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_6 880 1968 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_7 880 2240 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_8 880 2496 R0
        END INSTANCE
        INSTANCE XLXI_9 1696 1792 R0
        BEGIN BRANCH XLXN_1
            WIRE 1072 624 1696 624
            WIRE 1696 624 1696 1280
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 1072 864 1376 864
            WIRE 1376 864 1376 1344
            WIRE 1376 1344 1696 1344
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1072 1120 1360 1120
            WIRE 1360 1120 1360 1408
            WIRE 1360 1408 1696 1408
        END BRANCH
        BEGIN BRANCH XLXN_4
            WIRE 1072 1376 1344 1376
            WIRE 1344 1376 1344 1472
            WIRE 1344 1472 1696 1472
        END BRANCH
        BEGIN BRANCH XLXN_5
            WIRE 1072 1632 1376 1632
            WIRE 1376 1536 1376 1632
            WIRE 1376 1536 1696 1536
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1072 1904 1392 1904
            WIRE 1392 1600 1392 1904
            WIRE 1392 1600 1696 1600
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 1072 2176 1408 2176
            WIRE 1408 1664 1408 2176
            WIRE 1408 1664 1696 1664
        END BRANCH
        BEGIN BRANCH XLXN_8
            WIRE 1072 2432 1696 2432
            WIRE 1696 1728 1696 2432
        END BRANCH
        BEGIN BRANCH match
            WIRE 1952 1504 2064 1504
        END BRANCH
        BEGIN BRANCH datacomp(55:0)
            WIRE 304 624 336 624
            WIRE 336 624 688 624
            WIRE 336 624 336 864
            WIRE 336 864 688 864
            WIRE 336 864 336 1120
            WIRE 336 1120 688 1120
            WIRE 336 1120 336 1376
            WIRE 336 1376 688 1376
            WIRE 336 1376 336 1632
            WIRE 336 1632 688 1632
            WIRE 336 1632 336 1904
            WIRE 336 1904 688 1904
            WIRE 336 1904 336 2160
            WIRE 336 2160 336 2176
            WIRE 336 2176 336 2432
            WIRE 336 2432 352 2432
            WIRE 352 2432 688 2432
            WIRE 336 2176 688 2176
        END BRANCH
        BEGIN BRANCH wildcard(6:0)
            WIRE 304 752 384 752
            WIRE 384 752 688 752
            WIRE 384 752 384 992
            WIRE 384 992 688 992
            WIRE 384 992 384 1248
            WIRE 384 1248 688 1248
            WIRE 384 1248 384 1504
            WIRE 384 1504 688 1504
            WIRE 384 1504 384 1760
            WIRE 384 1760 688 1760
            WIRE 384 1760 384 2032
            WIRE 384 2032 688 2032
            WIRE 384 2032 384 2304
            WIRE 384 2304 384 2560
            WIRE 384 2560 688 2560
            WIRE 384 2304 688 2304
        END BRANCH
        BEGIN BRANCH datain(55:0)
            WIRE 544 688 560 688
            WIRE 560 688 688 688
            BEGIN DISPLAY 560 688 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(63:8)
            WIRE 544 928 576 928
            WIRE 576 928 688 928
            BEGIN DISPLAY 576 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(71:16)
            WIRE 560 1184 592 1184
            WIRE 592 1184 688 1184
            BEGIN DISPLAY 592 1184 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(79:24)
            WIRE 560 1440 592 1440
            WIRE 592 1440 688 1440
            BEGIN DISPLAY 592 1440 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(87:32)
            WIRE 560 1696 592 1696
            WIRE 592 1696 688 1696
            BEGIN DISPLAY 592 1696 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(95:40)
            WIRE 560 1968 592 1968
            WIRE 592 1968 688 1968
            BEGIN DISPLAY 592 1968 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(111:56)
            WIRE 576 2496 608 2496
            WIRE 608 2496 688 2496
            BEGIN DISPLAY 608 2496 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH datain(103:48)
            WIRE 576 2240 608 2240
            WIRE 608 2240 688 2240
            BEGIN DISPLAY 608 2240 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 304 624 datacomp(55:0) R180 28
        IOMARKER 304 752 wildcard(6:0) R180 28
        IOMARKER 2064 1504 match R0 28
        BEGIN BRANCH datain(111:0)
            WIRE 320 400 576 400
        END BRANCH
        IOMARKER 320 400 datain(111:0) R180 28
    END SHEET
END SCHEMATIC
