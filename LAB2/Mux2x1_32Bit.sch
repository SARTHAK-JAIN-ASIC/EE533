VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL in0(7:0)
        SIGNAL in1(7:0)
        SIGNAL in0(15:8)
        SIGNAL in1(15:8)
        SIGNAL in0(23:16)
        SIGNAL in1(23:16)
        SIGNAL in0(31:24)
        SIGNAL in1(31:24)
        SIGNAL mux_out(7:0)
        SIGNAL mux_out(15:8)
        SIGNAL mux_out(23:16)
        SIGNAL mux_out(31:24)
        SIGNAL XLXN_22
        SIGNAL sel
        SIGNAL in0(31:0)
        SIGNAL in1(31:0)
        SIGNAL mux_out(31:0)
        PORT Input sel
        PORT Input in0(31:0)
        PORT Input in1(31:0)
        PORT Output mux_out(31:0)
        BEGIN BLOCKDEF MUX4x1
            TIMESTAMP 2025 1 26 10 37 16
            RECTANGLE N 64 -192 192 -64 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 192 -160 256 -160 
            RECTANGLE N 192 -172 256 -148 
            LINE N 96 -64 96 0 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 MUX4x1
            PIN m2_in(7:0) in1(7:0)
            PIN m_in(7:0) in0(7:0)
            PIN M_Out(7:0) mux_out(7:0)
            PIN sel sel
        END BLOCK
        BEGIN BLOCK XLXI_2 MUX4x1
            PIN m2_in(7:0) in1(15:8)
            PIN m_in(7:0) in0(15:8)
            PIN M_Out(7:0) mux_out(15:8)
            PIN sel sel
        END BLOCK
        BEGIN BLOCK XLXI_3 MUX4x1
            PIN m2_in(7:0) in1(23:16)
            PIN m_in(7:0) in0(23:16)
            PIN M_Out(7:0) mux_out(23:16)
            PIN sel sel
        END BLOCK
        BEGIN BLOCK XLXI_4 MUX4x1
            PIN m2_in(7:0) in1(31:24)
            PIN m_in(7:0) in0(31:24)
            PIN M_Out(7:0) mux_out(31:24)
            PIN sel sel
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_2 1040 1136 R0
        END INSTANCE
        BEGIN BRANCH in0(15:8)
            WIRE 944 976 976 976
            WIRE 976 976 1040 976
            BEGIN DISPLAY 976 976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH in1(15:8)
            WIRE 944 1040 976 1040
            WIRE 976 1040 1040 1040
            BEGIN DISPLAY 976 1040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH mux_out(15:8)
            WIRE 1296 976 1328 976
            WIRE 1328 976 1360 976
            BEGIN DISPLAY 1328 976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_4 1040 1664 R0
        END INSTANCE
        BEGIN BRANCH in0(31:24)
            WIRE 944 1504 976 1504
            WIRE 976 1504 992 1504
            WIRE 992 1504 1040 1504
            BEGIN DISPLAY 976 1504 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH in1(31:24)
            WIRE 944 1568 960 1568
            WIRE 960 1568 1040 1568
            BEGIN DISPLAY 960 1568 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH mux_out(31:24)
            WIRE 1296 1504 1328 1504
            WIRE 1328 1504 1360 1504
            BEGIN DISPLAY 1328 1504 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_3 1056 1408 R0
        END INSTANCE
        BEGIN BRANCH in0(23:16)
            WIRE 944 1248 976 1248
            WIRE 976 1248 992 1248
            WIRE 992 1248 1056 1248
            BEGIN DISPLAY 976 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH in1(23:16)
            WIRE 944 1312 960 1312
            WIRE 960 1312 1056 1312
            BEGIN DISPLAY 960 1312 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH mux_out(23:16)
            WIRE 1312 1248 1328 1248
            WIRE 1328 1248 1344 1248
            WIRE 1344 1248 1360 1248
            BEGIN DISPLAY 1328 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_1 1056 832 R0
        END INSTANCE
        BEGIN BRANCH in0(7:0)
            WIRE 944 672 976 672
            WIRE 976 672 1056 672
            BEGIN DISPLAY 976 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH in1(7:0)
            WIRE 944 736 976 736
            WIRE 976 736 992 736
            WIRE 992 736 1056 736
            BEGIN DISPLAY 976 736 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH mux_out(7:0)
            WIRE 1312 672 1344 672
            WIRE 1344 672 1360 672
            BEGIN DISPLAY 1344 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH sel
            WIRE 816 912 1152 912
            WIRE 816 912 816 1120
            WIRE 816 1120 816 1152
            WIRE 816 1152 1136 1152
            WIRE 816 1152 816 1392
            WIRE 816 1392 816 1424
            WIRE 816 1424 1152 1424
            WIRE 816 1424 816 1680
            WIRE 816 1680 1136 1680
            WIRE 1136 1680 1136 1728
            WIRE 1136 1136 1136 1152
            WIRE 1136 1664 1136 1680
            WIRE 1152 832 1152 912
            WIRE 1152 1408 1152 1424
        END BRANCH
        BEGIN BRANCH in0(31:0)
            WIRE 320 1120 480 1120
        END BRANCH
        BEGIN BRANCH in1(31:0)
            WIRE 320 1280 480 1280
        END BRANCH
        BEGIN BRANCH mux_out(31:0)
            WIRE 1600 1152 1712 1152
        END BRANCH
        IOMARKER 320 1120 in0(31:0) R180 28
        IOMARKER 320 1280 in1(31:0) R180 28
        IOMARKER 1712 1152 mux_out(31:0) R0 28
        IOMARKER 1136 1728 sel R90 28
    END SHEET
END SCHEMATIC
