VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL inputD(31:0)
        SIGNAL outputD(31:0)
        SIGNAL CE
        SIGNAL inputD(15:0)
        SIGNAL inputD(31:16)
        SIGNAL clk
        SIGNAL outputD(31:16)
        SIGNAL outputD(15:0)
        SIGNAL CLR
        PORT Input inputD(31:0)
        PORT Output outputD(31:0)
        PORT Input CE
        PORT Input clk
        PORT Input CLR
        BEGIN BLOCKDEF fd16ce
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -32 64 -32 
            LINE N 0 -256 64 -256 
            LINE N 384 -256 320 -256 
            LINE N 80 -128 64 -144 
            LINE N 64 -112 80 -128 
            RECTANGLE N 320 -268 384 -244 
            RECTANGLE N 0 -268 64 -244 
            LINE N 192 -32 64 -32 
            LINE N 192 -64 192 -32 
            RECTANGLE N 64 -320 320 -64 
        END BLOCKDEF
        BEGIN BLOCK XLXI_1 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR CLR
            PIN D(15:0) inputD(15:0)
            PIN Q(15:0) outputD(15:0)
        END BLOCK
        BEGIN BLOCK XLXI_2 fd16ce
            PIN C clk
            PIN CE CE
            PIN CLR CLR
            PIN D(15:0) inputD(31:16)
            PIN Q(15:0) outputD(31:16)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_1 1088 1680 R0
        INSTANCE XLXI_2 1088 2128 R0
        BEGIN BRANCH inputD(31:0)
            WIRE 416 1744 688 1744
        END BRANCH
        IOMARKER 416 1744 inputD(31:0) R180 28
        BEGIN BRANCH CLR
            WIRE 1056 1648 1072 1648
            WIRE 1072 1648 1088 1648
            BEGIN DISPLAY 1072 1648 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CLR
            WIRE 1056 2096 1072 2096
            WIRE 1072 2096 1088 2096
            BEGIN DISPLAY 1072 2096 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH outputD(31:0)
            WIRE 1600 1680 1760 1680
        END BRANCH
        BEGIN BRANCH CE
            WIRE 1008 1488 1040 1488
            WIRE 1040 1488 1056 1488
            WIRE 1056 1488 1088 1488
            BEGIN DISPLAY 1056 1488 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clk
            WIRE 1008 1552 1040 1552
            WIRE 1040 1552 1088 1552
            BEGIN DISPLAY 1040 1552 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH inputD(15:0)
            WIRE 1008 1424 1040 1424
            WIRE 1040 1424 1088 1424
            BEGIN DISPLAY 1040 1424 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH inputD(31:16)
            WIRE 1008 1872 1024 1872
            WIRE 1024 1872 1088 1872
            BEGIN DISPLAY 1024 1872 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CE
            WIRE 1008 1936 1040 1936
            WIRE 1040 1936 1088 1936
            BEGIN DISPLAY 1040 1936 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH clk
            WIRE 1008 2000 1040 2000
            WIRE 1040 2000 1056 2000
            WIRE 1056 2000 1088 2000
            BEGIN DISPLAY 1056 2000 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH outputD(31:16)
            WIRE 1472 1872 1504 1872
            WIRE 1504 1872 1552 1872
            BEGIN DISPLAY 1504 1872 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH outputD(15:0)
            WIRE 1472 1424 1504 1424
            WIRE 1504 1424 1552 1424
            BEGIN DISPLAY 1504 1424 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 1760 1680 outputD(31:0) R0 28
        IOMARKER 384 1872 CE R180 28
        BEGIN BRANCH CE
            WIRE 384 1872 496 1872
            WIRE 496 1872 688 1872
            BEGIN DISPLAY 496 1872 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 384 1600 clk R180 28
        BEGIN BRANCH clk
            WIRE 384 1600 448 1600
            WIRE 448 1600 688 1600
            BEGIN DISPLAY 448 1600 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH CLR
            WIRE 384 1968 480 1968
            WIRE 480 1968 688 1968
            BEGIN DISPLAY 480 1968 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 384 1968 CLR R180 28
    END SHEET
END SCHEMATIC
