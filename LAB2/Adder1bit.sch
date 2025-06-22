VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL NET2
        SIGNAL NET3
        SIGNAL NET4
        SIGNAL NET1
        SIGNAL Sum
        SIGNAL A
        SIGNAL B
        SIGNAL C
        SIGNAL Cout
        PORT Output Sum
        PORT Input A
        PORT Input B
        PORT Input C
        PORT Output Cout
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
        BEGIN BLOCKDEF or3
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 72 -128 
            LINE N 0 -192 48 -192 
            LINE N 256 -128 192 -128 
            ARC N 28 -256 204 -80 112 -80 192 -128 
            ARC N -40 -184 72 -72 48 -80 48 -176 
            LINE N 48 -64 48 -80 
            LINE N 48 -192 48 -176 
            LINE N 112 -80 48 -80 
            ARC N 28 -176 204 0 192 -128 112 -176 
            LINE N 112 -176 48 -176 
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
        BEGIN BLOCK AND2_1 and2
            PIN I0 B
            PIN I1 A
            PIN O NET2
        END BLOCK
        BEGIN BLOCK AND2_2 and2
            PIN I0 C
            PIN I1 A
            PIN O NET3
        END BLOCK
        BEGIN BLOCK AND2_3 and2
            PIN I0 C
            PIN I1 B
            PIN O NET4
        END BLOCK
        BEGIN BLOCK OR2_1 or3
            PIN I0 NET4
            PIN I1 NET3
            PIN I2 NET2
            PIN O Cout
        END BLOCK
        BEGIN BLOCK XOR2_1 xor2
            PIN I0 B
            PIN I1 A
            PIN O NET1
        END BLOCK
        BEGIN BLOCK XOR2_2 xor2
            PIN I0 C
            PIN I1 NET1
            PIN O Sum
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE AND2_1 912 1216 R0
        INSTANCE AND2_2 896 1584 R0
        INSTANCE AND2_3 896 1904 R0
        INSTANCE OR2_1 1616 1568 R0
        BEGIN BRANCH NET2
            WIRE 1168 1120 1296 1120
            WIRE 1296 1120 1616 1120
            WIRE 1616 1120 1616 1376
            BEGIN DISPLAY 1296 1120 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH NET3
            WIRE 1152 1488 1264 1488
            WIRE 1264 1488 1376 1488
            WIRE 1376 1440 1376 1488
            WIRE 1376 1440 1616 1440
            BEGIN DISPLAY 1264 1488 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH NET4
            WIRE 1152 1808 1280 1808
            WIRE 1280 1808 1616 1808
            WIRE 1616 1504 1616 1808
            BEGIN DISPLAY 1280 1808 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Cout
            WIRE 1872 1440 2096 1440
            WIRE 2096 1440 2288 1440
            WIRE 2288 1440 2352 1440
            BEGIN DISPLAY 2288 1440 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH NET1
            WIRE 1168 800 1296 800
            WIRE 1296 800 1344 800
            WIRE 1344 800 1344 816
            WIRE 1344 816 1520 816
            BEGIN DISPLAY 1296 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Sum
            WIRE 1776 848 2320 848
            WIRE 2320 848 2352 848
            BEGIN DISPLAY 2320 848 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A
            WIRE 352 768 384 768
            WIRE 384 768 496 768
            WIRE 496 768 912 768
            WIRE 496 768 496 1088
            WIRE 496 1088 496 1456
            WIRE 496 1456 896 1456
            WIRE 496 1088 912 1088
            BEGIN DISPLAY 384 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B
            WIRE 352 832 384 832
            WIRE 384 832 624 832
            WIRE 624 832 912 832
            WIRE 624 832 624 1152
            WIRE 624 1152 624 1776
            WIRE 624 1776 896 1776
            WIRE 624 1152 912 1152
            BEGIN DISPLAY 384 832 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C
            WIRE 352 880 384 880
            WIRE 384 880 768 880
            WIRE 768 880 1520 880
            WIRE 768 880 768 1520
            WIRE 768 1520 896 1520
            WIRE 768 1520 768 1840
            WIRE 768 1840 896 1840
            BEGIN DISPLAY 384 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XOR2_1 912 896 R0
        INSTANCE XOR2_2 1520 944 R0
        IOMARKER 352 768 A R180 28
        IOMARKER 352 832 B R180 28
        IOMARKER 352 880 C R180 28
        IOMARKER 2352 848 Sum R0 28
        IOMARKER 2352 1440 Cout R0 28
    END SHEET
END SCHEMATIC
