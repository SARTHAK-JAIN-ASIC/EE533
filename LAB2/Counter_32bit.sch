VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL Count(31:0)
        SIGNAL XLXN_2(31:0)
        SIGNAL XLXN_3
        SIGNAL ONE(31:0)
        SIGNAL Add_or_Sub
        SIGNAL clk
        SIGNAL CE
        SIGNAL CLR
        PORT Output Count(31:0)
        PORT Input ONE(31:0)
        PORT Input Add_or_Sub
        PORT Input clk
        PORT Input CE
        PORT Input CLR
        BEGIN BLOCKDEF AddSub32Bit
            TIMESTAMP 2025 1 26 21 12 24
            RECTANGLE N 64 -192 320 0 
            LINE N 64 -160 0 -160 
            RECTANGLE N 0 -172 64 -148 
            LINE N 64 -32 0 -32 
            LINE N 320 -96 384 -96 
            RECTANGLE N 320 -108 384 -84 
            LINE N 64 -96 0 -96 
            RECTANGLE N 0 -108 64 -84 
            LINE N 320 -160 384 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF Register32bit
            TIMESTAMP 2025 1 26 21 48 2
            RECTANGLE N 64 -256 320 0 
            LINE N 64 -96 0 -96 
            LINE N 64 -160 0 -160 
            LINE N 64 -32 0 -32 
            LINE N 64 -224 0 -224 
            RECTANGLE N 0 -236 64 -212 
            LINE N 320 -224 384 -224 
            RECTANGLE N 320 -236 384 -212 
        END BLOCKDEF
        BEGIN BLOCK XLXI_2 AddSub32Bit
            PIN A(31:0) Count(31:0)
            PIN ADD_OR_SUB Add_or_Sub
            PIN ADD_SUB(31:0) XLXN_2(31:0)
            PIN B(31:0) ONE(31:0)
            PIN COUT XLXN_3
        END BLOCK
        BEGIN BLOCK XLXI_3 Register32bit
            PIN CE CE
            PIN clk clk
            PIN CLR CLR
            PIN inputD(31:0) XLXN_2(31:0)
            PIN outputD(31:0) Count(31:0)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_2 864 1312 R0
        END INSTANCE
        BEGIN BRANCH Count(31:0)
            WIRE 848 1152 864 1152
            WIRE 848 1152 848 1424
            WIRE 848 1424 2048 1424
            WIRE 1968 1136 2048 1136
            WIRE 2048 1136 2048 1424
            WIRE 2048 1136 2160 1136
        END BRANCH
        BEGIN BRANCH XLXN_2(31:0)
            WIRE 1248 1216 1264 1216
            WIRE 1264 1216 1328 1216
            WIRE 1328 1136 1328 1216
            WIRE 1328 1136 1584 1136
        END BRANCH
        BEGIN BRANCH XLXN_3
            WIRE 1248 1152 1264 1152
            WIRE 1264 1056 1264 1152
        END BRANCH
        BEGIN BRANCH ONE(31:0)
            WIRE 752 1216 864 1216
        END BRANCH
        BEGIN BRANCH Add_or_Sub
            WIRE 752 1280 864 1280
        END BRANCH
        IOMARKER 752 1216 ONE(31:0) R180 28
        IOMARKER 752 1280 Add_or_Sub R180 28
        BEGIN BRANCH clk
            WIRE 1472 1200 1568 1200
            WIRE 1568 1200 1584 1200
        END BRANCH
        BEGIN BRANCH CE
            WIRE 1472 1264 1568 1264
            WIRE 1568 1264 1584 1264
        END BRANCH
        IOMARKER 1488 1328 CLR R180 28
        BEGIN BRANCH CLR
            WIRE 1488 1328 1504 1328
            WIRE 1504 1328 1584 1328
        END BRANCH
        BEGIN INSTANCE XLXI_3 1584 1360 R0
        END INSTANCE
        IOMARKER 2160 1136 Count(31:0) R0 28
        IOMARKER 1472 1264 CE R180 28
        IOMARKER 1472 1200 clk R180 28
    END SHEET
END SCHEMATIC
