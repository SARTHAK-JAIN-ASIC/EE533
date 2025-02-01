VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "virtex2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1(111:0)
        SIGNAL hwregA(55:0)
        SIGNAL hwregA(62:56)
        SIGNAL ce
        SIGNAL pipe1(71:0)
        SIGNAL pipe0(71:0)
        SIGNAL clk
        SIGNAL clr
        SIGNAL mrst
        SIGNAL hwregA(63:0)
        SIGNAL pipe0(47:0)
        SIGNAL pipe1(63:0)
        SIGNAL XLXN_18
        SIGNAL match_en
        SIGNAL match
        SIGNAL XLXN_23
        PORT Input ce
        PORT Input pipe1(71:0)
        PORT Input clk
        PORT Input mrst
        PORT Input hwregA(63:0)
        PORT Input match_en
        PORT Output match
        BEGIN BLOCKDEF busmerge
            TIMESTAMP 2025 1 30 5 7 20
            RECTANGLE N 0 20 64 44 
            LINE N 64 32 0 32 
            RECTANGLE N 0 84 64 108 
            LINE N 64 96 0 96 
            RECTANGLE N 320 20 384 44 
            LINE N 320 32 384 32 
            RECTANGLE N 64 -64 320 128 
        END BLOCKDEF
        BEGIN BLOCKDEF wordmatch
            TIMESTAMP 2025 1 30 4 48 57
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -32 0 -32 
            RECTANGLE N 0 -44 64 -20 
            LINE N 320 -160 384 -160 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
        END BLOCKDEF
        BEGIN BLOCKDEF reg9B
            TIMESTAMP 2025 1 30 4 18 30
            RECTANGLE N -128 -128 128 128 
            LINE N -128 96 -192 96 
            LINE N -128 -32 -192 -32 
            LINE N -128 32 -192 32 
            LINE N -128 -96 -192 -96 
            RECTANGLE N -192 -108 -128 -84 
            LINE N 128 -96 192 -96 
            RECTANGLE N 128 -108 192 -84 
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
        BEGIN BLOCKDEF fdce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
            LINE N 192 -64 192 -32 
            LINE N 192 -32 64 -32 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF and3b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 256 -128 192 -128 
            LINE N 64 -64 64 -192 
            ARC N 96 -176 192 -80 144 -80 144 -176 
            LINE N 144 -80 64 -80 
            LINE N 64 -176 144 -176 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 busmerge
            PIN da(47:0) pipe0(47:0)
            PIN db(63:0) pipe1(63:0)
            PIN q(111:0) XLXN_1(111:0)
        END BLOCK
        BEGIN BLOCK XLXI_2 wordmatch
            PIN datacomp(55:0) hwregA(55:0)
            PIN datain(111:0) XLXN_1(111:0)
            PIN match XLXN_18
            PIN wildcard(6:0) hwregA(62:56)
        END BLOCK
        BEGIN BLOCK XLXI_3 reg9B
            PIN CE ce
            PIN clk clk
            PIN clr clr
            PIN d(71:0) pipe1(71:0)
            PIN q(71:0) pipe0(71:0)
        END BLOCK
        BEGIN BLOCK XLXI_4 fd
            PIN C clk
            PIN D mrst
            PIN Q clr
        END BLOCK
        BEGIN BLOCK XLXI_5 fdce
            PIN C clk
            PIN CE XLXN_23
            PIN CLR clr
            PIN D XLXN_23
            PIN Q match
        END BLOCK
        BEGIN BLOCK XLXI_6 and3b1
            PIN I0 match
            PIN I1 match_en
            PIN I2 XLXN_18
            PIN O XLXN_23
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_2 1344 1248 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 624 800 R0
        END INSTANCE
        INSTANCE XLXI_4 1872 1808 R0
        INSTANCE XLXI_5 2224 928 R0
        BEGIN INSTANCE XLXI_1 736 1184 R0
        END INSTANCE
        BEGIN BRANCH XLXN_1(111:0)
            WIRE 1120 1216 1344 1216
        END BRANCH
        BEGIN BRANCH hwregA(55:0)
            WIRE 1168 1152 1216 1152
            WIRE 1216 1152 1344 1152
            BEGIN DISPLAY 1216 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hwregA(62:56)
            WIRE 1168 1088 1216 1088
            WIRE 1216 1088 1344 1088
            BEGIN DISPLAY 1216 1088 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ce
            WIRE 240 896 432 896
        END BRANCH
        BEGIN BRANCH pipe1(71:0)
            WIRE 240 704 432 704
        END BRANCH
        BEGIN BRANCH pipe0(71:0)
            WIRE 816 704 912 704
            WIRE 912 704 1040 704
            BEGIN DISPLAY 912 704 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clk
            WIRE 240 768 336 768
            WIRE 336 768 432 768
            WIRE 336 768 336 1024
            WIRE 336 1024 1280 1024
            WIRE 336 1024 336 1680
            WIRE 336 1680 1872 1680
            WIRE 1280 800 1280 1024
            WIRE 1280 800 2224 800
        END BRANCH
        BEGIN BRANCH clr
            WIRE 240 832 288 832
            WIRE 288 832 432 832
            WIRE 288 832 288 1840
            WIRE 288 1840 2464 1840
            WIRE 2224 896 2224 1360
            WIRE 2224 1360 2464 1360
            WIRE 2464 1360 2464 1552
            WIRE 2464 1552 2464 1840
            WIRE 2256 1552 2464 1552
            BEGIN DISPLAY 240 832 ATTR Name
                ALIGNMENT SOFT-RIGHT
            END DISPLAY
        END BRANCH
        BEGIN BRANCH mrst
            WIRE 1744 1552 1872 1552
        END BRANCH
        BEGIN BRANCH hwregA(63:0)
            WIRE 400 464 672 464
        END BRANCH
        BEGIN BRANCH pipe0(47:0)
            WIRE 512 1216 560 1216
            WIRE 560 1216 736 1216
            BEGIN DISPLAY 560 1216 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH pipe1(63:0)
            WIRE 512 1280 544 1280
            WIRE 544 1280 736 1280
            BEGIN DISPLAY 544 1280 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_6 1808 1280 R0
        BEGIN BRANCH XLXN_18
            WIRE 1728 1088 1808 1088
        END BRANCH
        BEGIN BRANCH match_en
            WIRE 1552 1312 1744 1312
            WIRE 1744 1152 1808 1152
            WIRE 1744 1152 1744 1168
            WIRE 1744 1168 1744 1312
        END BRANCH
        BEGIN BRANCH match
            WIRE 1792 448 1792 1216
            WIRE 1792 1216 1808 1216
            WIRE 1792 448 2688 448
            WIRE 2688 448 2688 672
            WIRE 2688 672 2832 672
            WIRE 2608 672 2688 672
        END BRANCH
        BEGIN BRANCH XLXN_23
            WIRE 2064 1152 2144 1152
            WIRE 2144 672 2224 672
            WIRE 2144 672 2144 736
            WIRE 2144 736 2144 1152
            WIRE 2144 736 2224 736
        END BRANCH
        IOMARKER 240 704 pipe1(71:0) R180 28
        IOMARKER 240 768 clk R180 28
        IOMARKER 240 896 ce R180 28
        IOMARKER 400 464 hwregA(63:0) R180 28
        IOMARKER 1552 1312 match_en R180 28
        IOMARKER 1744 1552 mrst R180 28
        IOMARKER 2832 672 match R0 28
    END SHEET
END SCHEMATIC
