VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        BEGIN SIGNAL sel(0)
        END SIGNAL
        BEGIN SIGNAL sel(1)
        END SIGNAL
        SIGNAL muxout(31:0)
        SIGNAL XLXN_5(31:0)
        SIGNAL XLXN_6(31:0)
        SIGNAL in0(31:0)
        SIGNAL in1(31:0)
        SIGNAL in2(31:0)
        SIGNAL in3(31:0)
        SIGNAL sel(1:0)
        PORT Output muxout(31:0)
        PORT Input in0(31:0)
        PORT Input in1(31:0)
        PORT Input in2(31:0)
        PORT Input in3(31:0)
        PORT Input sel(1:0)
        BEGIN BLOCKDEF Mux2x1_32Bit
            TIMESTAMP 2025 1 26 11 52 40
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 320 -160 384 -160 
            RECTANGLE N 320 -172 384 -148 
            LINE N 64 -32 0 -32 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 Mux2x1_32Bit
            PIN in0(31:0) in0(31:0)
            PIN in1(31:0) in1(31:0)
            PIN mux_out(31:0) XLXN_5(31:0)
            PIN sel sel(0)
        END BLOCK
        BEGIN BLOCK XLXI_2 Mux2x1_32Bit
            PIN in0(31:0) in2(31:0)
            PIN in1(31:0) in3(31:0)
            PIN mux_out(31:0) XLXN_6(31:0)
            PIN sel sel(0)
        END BLOCK
        BEGIN BLOCK XLXI_3 Mux2x1_32Bit
            PIN in0(31:0) XLXN_5(31:0)
            PIN in1(31:0) XLXN_6(31:0)
            PIN mux_out(31:0) muxout(31:0)
            PIN sel sel(1)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_1 752 1472 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_2 752 1760 R0
        END INSTANCE
        BEGIN INSTANCE XLXI_3 1328 1552 R0
        END INSTANCE
        BEGIN BRANCH sel(0)
            WIRE 656 1440 752 1440
            WIRE 656 1440 656 1728
            WIRE 656 1728 752 1728
            WIRE 656 1728 656 1888
            WIRE 656 1888 1232 1888
            WIRE 1232 1888 1232 1904
            WIRE 1232 1904 1232 1952
            BEGIN DISPLAY 1232 1904 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH sel(1)
            WIRE 1328 1520 1328 1904
            WIRE 1328 1904 1328 1952
            BEGIN DISPLAY 1328 1904 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH muxout(31:0)
            WIRE 1712 1392 1856 1392
        END BRANCH
        BEGIN BRANCH XLXN_5(31:0)
            WIRE 1136 1312 1232 1312
            WIRE 1232 1312 1232 1392
            WIRE 1232 1392 1328 1392
        END BRANCH
        BEGIN BRANCH XLXN_6(31:0)
            WIRE 1136 1600 1232 1600
            WIRE 1232 1456 1232 1600
            WIRE 1232 1456 1328 1456
        END BRANCH
        BEGIN BRANCH in0(31:0)
            WIRE 592 1312 752 1312
        END BRANCH
        BEGIN BRANCH in1(31:0)
            WIRE 592 1376 752 1376
        END BRANCH
        BEGIN BRANCH in2(31:0)
            WIRE 592 1600 752 1600
        END BRANCH
        BEGIN BRANCH in3(31:0)
            WIRE 592 1664 752 1664
        END BRANCH
        IOMARKER 592 1312 in0(31:0) R180 28
        IOMARKER 592 1376 in1(31:0) R180 28
        IOMARKER 592 1600 in2(31:0) R180 28
        IOMARKER 592 1664 in3(31:0) R180 28
        IOMARKER 1856 1392 muxout(31:0) R0 28
        BEGIN BRANCH sel(1:0)
            WIRE 1280 2000 1280 2080
        END BRANCH
        IOMARKER 1280 2080 sel(1:0) R90 28
    END SHEET
END SCHEMATIC
