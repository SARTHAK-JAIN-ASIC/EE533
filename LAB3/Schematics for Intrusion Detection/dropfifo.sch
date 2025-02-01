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
        SIGNAL waddr(7:0)
        SIGNAL raddr(7:0)
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL fiforead
        SIGNAL XLXN_10
        SIGNAL valid_data
        SIGNAL drop_pkt
        SIGNAL XLXN_15
        SIGNAL rst
        SIGNAL in_fifo0(71:0)
        SIGNAL XLXN_26
        SIGNAL XLXN_27(7:0)
        SIGNAL clk
        SIGNAL in_fifo(71:0)
        SIGNAL fifowrite
        SIGNAL XLXN_32
        SIGNAL lastword
        SIGNAL firstword
        SIGNAL out_fifo(71:0)
        SIGNAL XLXN_38
        PORT Input fiforead
        PORT Output valid_data
        PORT Input drop_pkt
        PORT Input rst
        PORT Input clk
        PORT Input in_fifo(71:0)
        PORT Input fifowrite
        PORT Input lastword
        PORT Input firstword
        PORT Output out_fifo(71:0)
        BEGIN BLOCKDEF fd
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -320 320 -64 
            LINE N 0 -128 64 -128 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF fdc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            RECTANGLE N 64 -320 320 -64 
            LINE N 64 -112 80 -128 
            LINE N 80 -128 64 -144 
            LINE N 192 -64 192 -32 
            LINE N 192 -32 64 -32 
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
        BEGIN BLOCKDEF cb8cle
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -448 320 -64 
            LINE N 0 -192 64 -192 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 0 -384 64 -384 
            RECTANGLE N 0 -396 64 -372 
            LINE N 384 -384 320 -384 
            LINE N 384 -192 320 -192 
            RECTANGLE N 320 -396 384 -372 
            LINE N 384 -128 320 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF cb8ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 384 -128 320 -128 
            RECTANGLE N 320 -268 384 -244 
            LINE N 384 -256 320 -256 
            LINE N 0 -192 64 -192 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            LINE N 0 -128 64 -128 
            LINE N 0 -32 64 -32 
            LINE N 384 -192 320 -192 
            RECTANGLE N 64 -320 320 -64 
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
        BEGIN BLOCKDEF or2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 28 -224 204 -48 112 -48 192 -96 
            ARC N -40 -152 72 -40 48 -48 48 -144 
            LINE N 112 -144 48 -144 
            ARC N 28 -144 204 32 192 -96 112 -144 
            LINE N 112 -48 48 -48 
        END BLOCKDEF
        BEGIN BLOCKDEF and2b1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -48 64 -144 
            LINE N 64 -144 144 -144 
            LINE N 144 -48 64 -48 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 256 -96 192 -96 
            LINE N 0 -128 64 -128 
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
        END BLOCKDEF
        BEGIN BLOCKDEF and3b2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 40 -64 
            CIRCLE N 40 -76 64 -52 
            LINE N 0 -128 40 -128 
            CIRCLE N 40 -140 64 -116 
            LINE N 0 -192 64 -192 
            LINE N 256 -128 192 -128 
            LINE N 64 -64 64 -192 
            ARC N 96 -176 192 -80 144 -80 144 -176 
            LINE N 144 -80 64 -80 
            LINE N 64 -176 144 -176 
        END BLOCKDEF
        BEGIN BLOCKDEF comp8
            TIMESTAMP 2000 1 1 10 10 10
            RECTANGLE N 64 -384 320 -64 
            LINE N 384 -224 320 -224 
            RECTANGLE N 0 -332 64 -308 
            LINE N 0 -320 64 -320 
            RECTANGLE N 0 -140 64 -116 
            LINE N 0 -128 64 -128 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF dualportmemory
            TIMESTAMP 2025 1 30 8 18 12
            RECTANGLE N 32 0 256 496 
            BEGIN LINE W 0 48 32 48 
            END LINE
            BEGIN LINE W 0 80 32 80 
            END LINE
            LINE N 0 112 32 112 
            LINE N 0 240 32 240 
            BEGIN LINE W 0 272 32 272 
            END LINE
            LINE N 0 464 32 464 
            BEGIN LINE W 256 272 288 272 
            END LINE
        END BLOCKDEF
        BEGIN BLOCK XLXI_6 fd
            PIN C clk
            PIN D firstword
            PIN Q XLXN_1
        END BLOCK
        BEGIN BLOCK XLXI_7 fd
            PIN C clk
            PIN D lastword
            PIN Q XLXN_2
        END BLOCK
        BEGIN BLOCK XLXI_8 fd
            PIN C clk
            PIN D drop_pkt
            PIN Q XLXN_15
        END BLOCK
        BEGIN BLOCK XLXI_11 fd8ce
            PIN C clk
            PIN CE XLXN_32
            PIN CLR rst
            PIN D(7:0) waddr(7:0)
            PIN Q(7:0) XLXN_27(7:0)
        END BLOCK
        BEGIN BLOCK XLXI_15 or2
            PIN I0 XLXN_2
            PIN I1 XLXN_1
            PIN O XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_16 and2b1
            PIN I0 XLXN_15
            PIN I1 XLXN_3
            PIN O XLXN_32
        END BLOCK
        BEGIN BLOCK XLXI_17 and3b2
            PIN I0 XLXN_6
            PIN I1 XLXN_7
            PIN I2 fiforead
            PIN O XLXN_10
        END BLOCK
        BEGIN BLOCK XLXI_18 comp8
            PIN A(7:0) raddr(7:0)
            PIN B(7:0) XLXN_27(7:0)
            PIN EQ XLXN_6
        END BLOCK
        BEGIN BLOCK XLXI_19 comp8
            PIN A(7:0) waddr(7:0)
            PIN B(7:0) raddr(7:0)
            PIN EQ XLXN_7
        END BLOCK
        BEGIN BLOCK XLXI_10 fdc
            PIN C clk
            PIN CLR rst
            PIN D XLXN_10
            PIN Q valid_data
        END BLOCK
        BEGIN BLOCK XLXI_13 cb8ce
            PIN C clk
            PIN CE XLXN_10
            PIN CLR rst
            PIN CEO
            PIN Q(7:0) raddr(7:0)
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_12 cb8cle
            PIN C clk
            PIN CE XLXN_26
            PIN CLR rst
            PIN D(7:0) XLXN_27(7:0)
            PIN L XLXN_15
            PIN CEO
            PIN Q(7:0) waddr(7:0)
            PIN TC
        END BLOCK
        BEGIN BLOCK XLXI_9 fd
            PIN C clk
            PIN D fifowrite
            PIN Q XLXN_26
        END BLOCK
        BEGIN BLOCK XLXI_29 reg9B
            PIN CE XLXN_38
            PIN clk clk
            PIN clr rst
            PIN d(71:0) in_fifo(71:0)
            PIN q(71:0) in_fifo0(71:0)
        END BLOCK
        BEGIN BLOCK XLXI_30 vcc
            PIN P XLXN_38
        END BLOCK
        BEGIN BLOCK XLXI_34 dualportmemory
            PIN addra(7:0) waddr(7:0)
            PIN dina(71:0) in_fifo0(71:0)
            PIN wea XLXN_26
            PIN clka clk
            PIN addrb(7:0) raddr(7:0)
            PIN clkb clk
            PIN doutb(71:0) out_fifo(71:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_6 336 704 R0
        INSTANCE XLXI_7 336 1008 R0
        INSTANCE XLXI_11 352 1424 R0
        INSTANCE XLXI_15 784 720 R0
        INSTANCE XLXI_12 1952 1488 R0
        INSTANCE XLXI_9 1376 672 R0
        INSTANCE XLXI_16 1184 928 R0
        INSTANCE XLXI_8 352 2400 R0
        INSTANCE XLXI_18 928 2032 R0
        INSTANCE XLXI_19 928 1632 R0
        INSTANCE XLXI_17 1376 1536 R0
        INSTANCE XLXI_13 1952 1872 R0
        INSTANCE XLXI_10 1968 2320 R0
        BEGIN BRANCH XLXN_1
            WIRE 720 448 752 448
            WIRE 752 448 752 592
            WIRE 752 592 784 592
        END BRANCH
        BEGIN BRANCH XLXN_2
            WIRE 720 752 752 752
            WIRE 752 656 752 752
            WIRE 752 656 784 656
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1040 624 1104 624
            WIRE 1104 624 1104 800
            WIRE 1104 800 1184 800
        END BRANCH
        BEGIN BRANCH waddr(7:0)
            WIRE 288 1168 352 1168
            WIRE 288 1168 288 1456
            WIRE 288 1456 800 1456
            WIRE 800 1008 800 1312
            WIRE 800 1312 800 1456
            WIRE 800 1312 928 1312
            WIRE 800 1008 2400 1008
            WIRE 2400 1008 2400 1104
            WIRE 2400 1104 2400 1120
            WIRE 2400 1120 2544 1120
            WIRE 2544 1120 3024 1120
            WIRE 2336 1104 2400 1104
            BEGIN DISPLAY 2544 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH raddr(7:0)
            WIRE 832 976 832 1600
            WIRE 832 1600 912 1600
            WIRE 912 1600 912 1712
            WIRE 912 1712 928 1712
            WIRE 832 976 2384 976
            WIRE 2384 976 2384 1344
            WIRE 2384 1344 2704 1344
            WIRE 2704 1344 2704 1616
            WIRE 2704 1344 2944 1344
            WIRE 2944 1344 3024 1344
            WIRE 912 1504 928 1504
            WIRE 912 1504 912 1600
            WIRE 2336 1616 2704 1616
            BEGIN DISPLAY 2944 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_6
            WIRE 1312 1808 1344 1808
            WIRE 1344 1472 1344 1808
            WIRE 1344 1472 1376 1472
        END BRANCH
        BEGIN BRANCH XLXN_7
            WIRE 1312 1408 1376 1408
        END BRANCH
        BEGIN BRANCH fiforead
            WIRE 1136 1120 1376 1120
            WIRE 1376 1120 1376 1344
        END BRANCH
        BEGIN BRANCH XLXN_10
            WIRE 1632 1408 1792 1408
            WIRE 1792 1408 1792 1680
            WIRE 1792 1680 1952 1680
            WIRE 1792 1680 1792 2064
            WIRE 1792 2064 1968 2064
        END BRANCH
        BEGIN BRANCH valid_data
            WIRE 2352 2064 2528 2064
        END BRANCH
        BEGIN BRANCH drop_pkt
            WIRE 208 2144 352 2144
        END BRANCH
        BEGIN BRANCH XLXN_15
            WIRE 736 2144 896 2144
            WIRE 896 2144 1360 2144
            WIRE 896 864 896 2144
            WIRE 896 864 1184 864
            WIRE 1360 1232 1360 2144
            WIRE 1360 1232 1952 1232
        END BRANCH
        BEGIN BRANCH rst
            WIRE 352 1392 352 1584
            WIRE 352 1584 1712 1584
            WIRE 1712 1584 1824 1584
            WIRE 1712 1584 1712 1840
            WIRE 1712 1840 1952 1840
            WIRE 1712 1840 1712 2288
            WIRE 1712 2288 1968 2288
            WIRE 1616 1840 1712 1840
            WIRE 1712 1520 1712 1584
            WIRE 1712 1520 2464 1520
            WIRE 1824 1456 1824 1584
            WIRE 1824 1456 1952 1456
            WIRE 2464 544 2464 1520
            WIRE 2464 544 2576 544
        END BRANCH
        BEGIN BRANCH in_fifo0(71:0)
            WIRE 2960 416 2976 416
            WIRE 2976 416 3008 416
            WIRE 3008 416 3008 1152
            WIRE 3008 1152 3024 1152
            BEGIN DISPLAY 2976 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_26
            WIRE 1760 416 2352 416
            WIRE 2352 416 2352 1184
            WIRE 2352 1184 3024 1184
            WIRE 1872 384 1872 1296
            WIRE 1872 1296 1952 1296
            WIRE 1872 384 2352 384
            WIRE 2352 384 2352 416
        END BRANCH
        BEGIN BRANCH XLXN_27(7:0)
            WIRE 736 1168 864 1168
            WIRE 864 1168 1392 1168
            WIRE 864 1168 864 1904
            WIRE 864 1904 928 1904
            WIRE 1392 1104 1392 1168
            WIRE 1392 1104 1952 1104
        END BRANCH
        BEGIN INSTANCE XLXI_29 2768 512 R0
        END INSTANCE
        BEGIN BRANCH clk
            WIRE 208 352 208 576
            WIRE 208 576 336 576
            WIRE 208 576 208 880
            WIRE 208 880 336 880
            WIRE 208 880 208 1296
            WIRE 208 1296 208 1424
            WIRE 208 1424 240 1424
            WIRE 240 1424 240 2272
            WIRE 240 2272 352 2272
            WIRE 208 1296 352 1296
            WIRE 208 352 784 352
            WIRE 784 352 784 544
            WIRE 784 544 1376 544
            WIRE 208 2272 240 2272
            WIRE 784 320 784 352
            WIRE 784 320 1840 320
            WIRE 1840 320 1840 544
            WIRE 1840 544 1840 1360
            WIRE 1840 1360 1952 1360
            WIRE 1840 1360 1840 1744
            WIRE 1840 1744 1952 1744
            WIRE 1840 1744 1840 2192
            WIRE 1840 2192 1968 2192
            WIRE 1840 544 2416 544
            WIRE 1824 496 1824 544
            WIRE 1824 544 1840 544
            WIRE 1824 496 2368 496
            WIRE 2368 496 2368 1312
            WIRE 2368 1312 2880 1312
            WIRE 2880 1312 3024 1312
            WIRE 2880 1312 2880 1536
            WIRE 2880 1536 3024 1536
            WIRE 2416 416 2416 544
            WIRE 2416 416 2544 416
            WIRE 2544 416 2544 480
            WIRE 2544 480 2576 480
        END BRANCH
        BEGIN BRANCH in_fifo(71:0)
            WIRE 2480 288 2560 288
            WIRE 2560 288 2560 416
            WIRE 2560 416 2576 416
        END BRANCH
        BEGIN BRANCH fifowrite
            WIRE 1264 416 1376 416
        END BRANCH
        BEGIN BRANCH XLXN_32
            WIRE 304 1040 304 1232
            WIRE 304 1232 352 1232
            WIRE 304 1040 1520 1040
            WIRE 1440 832 1520 832
            WIRE 1520 832 1520 1040
        END BRANCH
        BEGIN BRANCH lastword
            WIRE 144 752 336 752
        END BRANCH
        BEGIN BRANCH firstword
            WIRE 128 448 336 448
        END BRANCH
        BEGIN BRANCH out_fifo(71:0)
            WIRE 3312 1344 3344 1344
        END BRANCH
        IOMARKER 144 752 lastword R180 28
        IOMARKER 128 448 firstword R180 28
        IOMARKER 1264 416 fifowrite R180 28
        IOMARKER 2480 288 in_fifo(71:0) R180 28
        IOMARKER 208 2144 drop_pkt R180 28
        IOMARKER 208 2272 clk R180 28
        IOMARKER 2528 2064 valid_data R0 28
        IOMARKER 3344 1344 out_fifo(71:0) R0 28
        IOMARKER 1136 1120 fiforead R180 28
        IOMARKER 1616 1840 rst R180 28
        INSTANCE XLXI_30 2640 752 R0
        BEGIN BRANCH XLXN_38
            WIRE 2528 608 2576 608
            WIRE 2528 608 2528 832
            WIRE 2528 832 2704 832
            WIRE 2704 752 2704 832
        END BRANCH
        BEGIN INSTANCE XLXI_34 3024 1072 R0
        END INSTANCE
    END SHEET
END SCHEMATIC
