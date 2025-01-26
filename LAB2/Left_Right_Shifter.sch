VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL BIT
        SIGNAL out2
        SIGNAL out1
        SIGNAL left
        SIGNAL right
        SIGNAL SHIFTED_BIT
        SIGNAL In2
        SIGNAL In1
        PORT Input BIT
        PORT Output out2
        PORT Output out1
        PORT Input left
        PORT Input right
        PORT Output SHIFTED_BIT
        PORT Input In2
        PORT Input In1
        BEGIN BLOCKDEF and2
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 64 -64 
            LINE N 0 -128 64 -128 
            LINE N 256 -96 192 -96 
            ARC N 96 -144 192 -48 144 -48 144 -144 
            LINE N 144 -48 64 -48 
            LINE N 64 -144 144 -144 
            LINE N 64 -48 64 -144 
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
        BEGIN BLOCK XLXI_1 and2
            PIN I0 left
            PIN I1 BIT
            PIN O out1
        END BLOCK
        BEGIN BLOCK XLXI_2 and2
            PIN I0 BIT
            PIN I1 right
            PIN O out2
        END BLOCK
        BEGIN BLOCK XLXI_3 or2
            PIN I0 In1
            PIN I1 In2
            PIN O SHIFTED_BIT
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_2 1040 736 R90
        BEGIN BRANCH BIT
            WIRE 1024 720 1072 720
            WIRE 1072 720 1104 720
            WIRE 1104 720 1104 736
            WIRE 1024 720 1024 736
            WIRE 1072 624 1072 720
        END BRANCH
        BEGIN BRANCH out2
            WIRE 1136 992 1136 1008
            WIRE 1136 1008 1312 1008
        END BRANCH
        INSTANCE XLXI_1 896 736 R90
        BEGIN BRANCH out1
            WIRE 784 1008 992 1008
            WIRE 992 992 992 1008
        END BRANCH
        BEGIN BRANCH left
            WIRE 960 624 960 736
        END BRANCH
        BEGIN BRANCH right
            WIRE 1168 624 1168 736
        END BRANCH
        INSTANCE XLXI_3 976 1072 R90
        BEGIN BRANCH SHIFTED_BIT
            WIRE 1072 1328 1072 1392
        END BRANCH
        BEGIN BRANCH In2
            WIRE 1104 1056 1104 1072
            WIRE 1104 1056 1312 1056
        END BRANCH
        BEGIN BRANCH In1
            WIRE 784 1056 1040 1056
            WIRE 1040 1056 1040 1072
        END BRANCH
        IOMARKER 960 624 left R270 28
        IOMARKER 1072 624 BIT R270 28
        IOMARKER 1168 624 right R270 28
        IOMARKER 1072 1392 SHIFTED_BIT R90 28
        IOMARKER 1312 1056 In2 R0 28
        IOMARKER 784 1056 In1 R180 28
        IOMARKER 784 1008 out1 R180 28
        IOMARKER 1312 1008 out2 R0 28
    END SHEET
END SCHEMATIC
