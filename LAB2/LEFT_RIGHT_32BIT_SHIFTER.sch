VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan3a"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL XLXN_1
        SIGNAL XLXN_6
        SIGNAL XLXN_7
        SIGNAL XLXN_8
        SIGNAL IN_S(1)
        SIGNAL XLXN_10
        SIGNAL XLXN_11
        SIGNAL XLXN_12
        SIGNAL XLXN_13
        SIGNAL IN_S(2)
        SIGNAL XLXN_15
        SIGNAL XLXN_16
        SIGNAL XLXN_17
        SIGNAL XLXN_18
        SIGNAL XLXN_19
        SIGNAL XLXN_20
        SIGNAL XLXN_21
        SIGNAL XLXN_23
        SIGNAL XLXN_24
        SIGNAL XLXN_25
        SIGNAL XLXN_26
        SIGNAL XLXN_27
        SIGNAL XLXN_28
        SIGNAL XLXN_32
        SIGNAL XLXN_29
        SIGNAL XLXN_30
        SIGNAL XLXN_31
        SIGNAL XLXN_37
        SIGNAL XLXN_38
        SIGNAL XLXN_39
        SIGNAL XLXN_40
        SIGNAL XLXN_41
        SIGNAL XLXN_42
        SIGNAL XLXN_43
        SIGNAL XLXN_44
        SIGNAL XLXN_45
        SIGNAL XLXN_46
        SIGNAL XLXN_47
        SIGNAL XLXN_48
        SIGNAL XLXN_50
        SIGNAL XLXN_51
        SIGNAL XLXN_52
        SIGNAL XLXN_53
        SIGNAL XLXN_54
        SIGNAL XLXN_55
        SIGNAL XLXN_56
        SIGNAL XLXN_57
        SIGNAL XLXN_58
        SIGNAL XLXN_60
        SIGNAL XLXN_61
        SIGNAL XLXN_62
        SIGNAL XLXN_63
        SIGNAL XLXN_64
        SIGNAL XLXN_65
        SIGNAL XLXN_66
        SIGNAL XLXN_67
        SIGNAL XLXN_68
        SIGNAL XLXN_69
        SIGNAL XLXN_70
        SIGNAL XLXN_71
        SIGNAL XLXN_72
        SIGNAL XLXN_73
        SIGNAL XLXN_76
        SIGNAL XLXN_77
        SIGNAL XLXN_78
        SIGNAL XLXN_79
        SIGNAL XLXN_80
        SIGNAL Right_Shift
        SIGNAL Left_Shift
        SIGNAL IN_S(0)
        SIGNAL XLXN_87
        SIGNAL IN_S(4)
        SIGNAL IN_S(6)
        SIGNAL IN_S(7)
        SIGNAL IN_S(8)
        SIGNAL IN_S(3)
        SIGNAL IN_S(5)
        SIGNAL IN_S(9)
        SIGNAL IN_S(10)
        SIGNAL IN_S(11)
        SIGNAL IN_S(12)
        SIGNAL IN_S(13)
        SIGNAL IN_S(14)
        SIGNAL IN_S(15)
        SIGNAL IN_S(16)
        SIGNAL IN_S(17)
        SIGNAL IN_S(18)
        SIGNAL IN_S(19)
        SIGNAL IN_S(20)
        SIGNAL IN_S(21)
        SIGNAL IN_S(22)
        SIGNAL IN_S(23)
        SIGNAL IN_S(24)
        SIGNAL IN_S(25)
        SIGNAL IN_S(26)
        SIGNAL IN_S(27)
        SIGNAL IN_S(28)
        SIGNAL IN_S(30)
        SIGNAL IN_S(29)
        SIGNAL XLXN_117
        SIGNAL IN_S(31)
        SIGNAL OUT_S(31)
        SIGNAL OUT_S(29)
        SIGNAL OUT_S(27)
        SIGNAL OUT_S(26)
        SIGNAL OUT_S(24)
        SIGNAL OUT_S(23)
        SIGNAL OUT_S(28)
        SIGNAL OUT_S(22)
        SIGNAL OUT_S(21)
        SIGNAL OUT_S(20)
        SIGNAL OUT_S(19)
        SIGNAL OUT_S(18)
        SIGNAL OUT_S(17)
        SIGNAL OUT_S(16)
        SIGNAL OUT_S(15)
        SIGNAL OUT_S(14)
        SIGNAL OUT_S(13)
        SIGNAL OUT_S(12)
        SIGNAL OUT_S(11)
        SIGNAL OUT_S(10)
        SIGNAL OUT_S(9)
        SIGNAL OUT_S(8)
        SIGNAL OUT_S(7)
        SIGNAL OUT_S(6)
        SIGNAL OUT_S(5)
        SIGNAL OUT_S(4)
        SIGNAL OUT_S(3)
        SIGNAL OUT_S(2)
        SIGNAL OUT_S(1)
        SIGNAL XLXN_152
        SIGNAL OUT_S(0)
        SIGNAL OUT_S(25)
        SIGNAL OUT_S(30)
        SIGNAL IN_S(31:0)
        SIGNAL OUT_S(31:0)
        PORT Input Right_Shift
        PORT Input IN_S(31:0)
        PORT Output OUT_S(31:0)
        BEGIN BLOCKDEF Left_Right_Shifter
            TIMESTAMP 2025 1 25 21 33 12
            RECTANGLE N -128 -160 128 160 
            LINE N -128 -64 -192 -64 
            LINE N -128 128 -192 128 
            LINE N -128 64 -192 64 
            LINE N -128 -128 -192 -128 
            LINE N 128 -128 192 -128 
            LINE N 128 -64 192 -64 
            LINE N -128 0 -192 0 
            LINE N 128 0 192 0 
        END BLOCKDEF
        BEGIN BLOCKDEF inv
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -32 64 -32 
            LINE N 224 -32 160 -32 
            LINE N 64 -64 128 -32 
            LINE N 128 -32 64 0 
            LINE N 64 0 64 -64 
            CIRCLE N 128 -48 160 -16 
        END BLOCKDEF
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
        BEGIN BLOCK XLXI_3 Left_Right_Shifter
            PIN BIT IN_S(3)
            PIN In1 XLXN_17
            PIN In2 XLXN_19
            PIN left Left_Shift
            PIN out1 XLXN_12
            PIN out2 XLXN_18
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(3)
        END BLOCK
        BEGIN BLOCK XLXI_4 Left_Right_Shifter
            PIN BIT IN_S(4)
            PIN In1 XLXN_18
            PIN In2 XLXN_20
            PIN left Left_Shift
            PIN out1 XLXN_19
            PIN out2 XLXN_21
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(4)
        END BLOCK
        BEGIN BLOCK XLXI_2 Left_Right_Shifter
            PIN BIT IN_S(2)
            PIN In1 XLXN_16
            PIN In2 XLXN_12
            PIN left Left_Shift
            PIN out1 XLXN_7
            PIN out2 XLXN_17
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(2)
        END BLOCK
        BEGIN BLOCK XLXI_1 Left_Right_Shifter
            PIN BIT IN_S(1)
            PIN In1 XLXN_87
            PIN In2 XLXN_7
            PIN left Left_Shift
            PIN out1 OUT_S(0)
            PIN out2 XLXN_16
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(1)
        END BLOCK
        BEGIN BLOCK XLXI_5 Left_Right_Shifter
            PIN BIT IN_S(5)
            PIN In1 XLXN_21
            PIN In2 XLXN_23
            PIN left Left_Shift
            PIN out1 XLXN_20
            PIN out2 XLXN_24
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(5)
        END BLOCK
        BEGIN BLOCK XLXI_9 Left_Right_Shifter
            PIN BIT IN_S(6)
            PIN In1 XLXN_24
            PIN In2 XLXN_26
            PIN left Left_Shift
            PIN out1 XLXN_23
            PIN out2 XLXN_25
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(6)
        END BLOCK
        BEGIN BLOCK XLXI_10 Left_Right_Shifter
            PIN BIT IN_S(7)
            PIN In1 XLXN_25
            PIN In2 XLXN_27
            PIN left Left_Shift
            PIN out1 XLXN_26
            PIN out2 XLXN_28
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(7)
        END BLOCK
        BEGIN BLOCK XLXI_11 Left_Right_Shifter
            PIN BIT IN_S(8)
            PIN In1 XLXN_28
            PIN In2 XLXN_29
            PIN left Left_Shift
            PIN out1 XLXN_27
            PIN out2 XLXN_31
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(8)
        END BLOCK
        BEGIN BLOCK XLXI_36 Left_Right_Shifter
            PIN BIT IN_S(27)
            PIN In1 XLXN_70
            PIN In2 XLXN_78
            PIN left Left_Shift
            PIN out1 XLXN_77
            PIN out2 XLXN_71
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(27)
        END BLOCK
        BEGIN BLOCK XLXI_38 Left_Right_Shifter
            PIN BIT IN_S(26)
            PIN In1 XLXN_69
            PIN In2 XLXN_77
            PIN left Left_Shift
            PIN out1 XLXN_76
            PIN out2 XLXN_70
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(26)
        END BLOCK
        BEGIN BLOCK XLXI_40 Left_Right_Shifter
            PIN BIT IN_S(29)
            PIN In1 XLXN_72
            PIN In2 XLXN_80
            PIN left Left_Shift
            PIN out1 XLXN_79
            PIN out2 XLXN_73
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(29)
        END BLOCK
        BEGIN BLOCK XLXI_41 Left_Right_Shifter
            PIN BIT IN_S(30)
            PIN In1 XLXN_73
            PIN In2 XLXN_117
            PIN left Left_Shift
            PIN out1 XLXN_80
            PIN out2 OUT_S(31)
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(30)
        END BLOCK
        BEGIN BLOCK XLXI_28 Left_Right_Shifter
            PIN BIT IN_S(19)
            PIN In1 XLXN_55
            PIN In2 XLXN_57
            PIN left Left_Shift
            PIN out1 XLXN_54
            PIN out2 XLXN_56
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(19)
        END BLOCK
        BEGIN BLOCK XLXI_29 Left_Right_Shifter
            PIN BIT IN_S(20)
            PIN In1 XLXN_56
            PIN In2 XLXN_60
            PIN left Left_Shift
            PIN out1 XLXN_57
            PIN out2 XLXN_58
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(20)
        END BLOCK
        BEGIN BLOCK XLXI_30 Left_Right_Shifter
            PIN BIT IN_S(18)
            PIN In1 XLXN_53
            PIN In2 XLXN_54
            PIN left Left_Shift
            PIN out1 XLXN_51
            PIN out2 XLXN_55
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(18)
        END BLOCK
        BEGIN BLOCK XLXI_31 Left_Right_Shifter
            PIN BIT IN_S(17)
            PIN In1 XLXN_50
            PIN In2 XLXN_51
            PIN left Left_Shift
            PIN out1 XLXN_52
            PIN out2 XLXN_53
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(17)
        END BLOCK
        BEGIN BLOCK XLXI_32 Left_Right_Shifter
            PIN BIT IN_S(21)
            PIN In1 XLXN_58
            PIN In2 XLXN_62
            PIN left Left_Shift
            PIN out1 XLXN_60
            PIN out2 XLXN_61
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(21)
        END BLOCK
        BEGIN BLOCK XLXI_33 Left_Right_Shifter
            PIN BIT IN_S(22)
            PIN In1 XLXN_61
            PIN In2 XLXN_64
            PIN left Left_Shift
            PIN out1 XLXN_62
            PIN out2 XLXN_63
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(22)
        END BLOCK
        BEGIN BLOCK XLXI_34 Left_Right_Shifter
            PIN BIT IN_S(23)
            PIN In1 XLXN_63
            PIN In2 XLXN_66
            PIN left Left_Shift
            PIN out1 XLXN_64
            PIN out2 XLXN_65
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(23)
        END BLOCK
        BEGIN BLOCK XLXI_35 Left_Right_Shifter
            PIN BIT IN_S(24)
            PIN In1 XLXN_65
            PIN In2 XLXN_67
            PIN left Left_Shift
            PIN out1 XLXN_66
            PIN out2 XLXN_68
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(24)
        END BLOCK
        BEGIN BLOCK XLXI_20 Left_Right_Shifter
            PIN BIT IN_S(11)
            PIN In1 XLXN_38
            PIN In2 XLXN_39
            PIN left Left_Shift
            PIN out1 XLXN_37
            PIN out2 XLXN_40
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(11)
        END BLOCK
        BEGIN BLOCK XLXI_21 Left_Right_Shifter
            PIN BIT IN_S(12)
            PIN In1 XLXN_40
            PIN In2 XLXN_42
            PIN left Left_Shift
            PIN out1 XLXN_39
            PIN out2 XLXN_41
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(12)
        END BLOCK
        BEGIN BLOCK XLXI_22 Left_Right_Shifter
            PIN BIT IN_S(10)
            PIN In1 XLXN_30
            PIN In2 XLXN_37
            PIN left Left_Shift
            PIN out1 XLXN_32
            PIN out2 XLXN_38
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(10)
        END BLOCK
        BEGIN BLOCK XLXI_23 Left_Right_Shifter
            PIN BIT IN_S(9)
            PIN In1 XLXN_31
            PIN In2 XLXN_32
            PIN left Left_Shift
            PIN out1 XLXN_29
            PIN out2 XLXN_30
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(9)
        END BLOCK
        BEGIN BLOCK XLXI_24 Left_Right_Shifter
            PIN BIT IN_S(13)
            PIN In1 XLXN_41
            PIN In2 XLXN_44
            PIN left Left_Shift
            PIN out1 XLXN_42
            PIN out2 XLXN_43
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(13)
        END BLOCK
        BEGIN BLOCK XLXI_25 Left_Right_Shifter
            PIN BIT IN_S(14)
            PIN In1 XLXN_43
            PIN In2 XLXN_45
            PIN left Left_Shift
            PIN out1 XLXN_44
            PIN out2 XLXN_46
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(14)
        END BLOCK
        BEGIN BLOCK XLXI_26 Left_Right_Shifter
            PIN BIT IN_S(15)
            PIN In1 XLXN_46
            PIN In2 XLXN_48
            PIN left Left_Shift
            PIN out1 XLXN_45
            PIN out2 XLXN_47
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(15)
        END BLOCK
        BEGIN BLOCK XLXI_27 Left_Right_Shifter
            PIN BIT IN_S(16)
            PIN In1 XLXN_47
            PIN In2 XLXN_52
            PIN left Left_Shift
            PIN out1 XLXN_48
            PIN out2 XLXN_50
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(16)
        END BLOCK
        BEGIN BLOCK XLXI_60 inv
            PIN I Right_Shift
            PIN O Left_Shift
        END BLOCK
        BEGIN BLOCK XLXI_94 and2
            PIN I0 IN_S(0)
            PIN I1 Right_Shift
            PIN O XLXN_87
        END BLOCK
        BEGIN BLOCK XLXI_37 Left_Right_Shifter
            PIN BIT IN_S(28)
            PIN In1 XLXN_71
            PIN In2 XLXN_79
            PIN left Left_Shift
            PIN out1 XLXN_78
            PIN out2 XLXN_72
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(28)
        END BLOCK
        BEGIN BLOCK XLXI_95 and2
            PIN I0 Left_Shift
            PIN I1 IN_S(31)
            PIN O XLXN_117
        END BLOCK
        BEGIN BLOCK XLXI_96 Left_Right_Shifter
            PIN BIT IN_S(25)
            PIN In1 XLXN_68
            PIN In2 XLXN_76
            PIN left Left_Shift
            PIN out1 XLXN_67
            PIN out2 XLXN_69
            PIN right Right_Shift
            PIN SHIFTED_BIT OUT_S(25)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 3520 2720
        BEGIN INSTANCE XLXI_3 1328 464 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_4 1696 464 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_2 960 464 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_1 592 464 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_5 2064 464 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_9 2432 464 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_10 2784 464 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_11 3136 464 R90
        END INSTANCE
        BEGIN BRANCH XLXN_7
            WIRE 368 176 528 176
            WIRE 528 176 528 272
            WIRE 368 176 368 736
            WIRE 368 736 1088 736
            WIRE 1088 656 1088 736
        END BRANCH
        BEGIN BRANCH IN_S(1)
            WIRE 656 240 656 256
            WIRE 656 256 656 272
            BEGIN DISPLAY 656 256 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_12
            WIRE 768 192 896 192
            WIRE 896 192 896 272
            WIRE 768 192 768 672
            WIRE 768 672 1456 672
            WIRE 1456 656 1456 672
        END BRANCH
        BEGIN BRANCH IN_S(2)
            WIRE 1024 240 1024 256
            WIRE 1024 256 1024 272
            BEGIN DISPLAY 1024 256 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_16
            WIRE 656 656 656 720
            WIRE 656 720 784 720
            WIRE 784 208 784 720
            WIRE 784 208 832 208
            WIRE 832 208 832 272
        END BRANCH
        BEGIN BRANCH XLXN_17
            WIRE 1024 656 1024 720
            WIRE 1024 720 1152 720
            WIRE 1152 208 1152 720
            WIRE 1152 208 1200 208
            WIRE 1200 208 1200 272
        END BRANCH
        BEGIN BRANCH XLXN_18
            WIRE 1392 656 1392 752
            WIRE 1392 752 1520 752
            WIRE 1520 208 1520 752
            WIRE 1520 208 1568 208
            WIRE 1568 208 1568 272
        END BRANCH
        BEGIN BRANCH XLXN_19
            WIRE 1264 208 1264 272
            WIRE 1264 208 1504 208
            WIRE 1504 208 1504 736
            WIRE 1504 736 1824 736
            WIRE 1824 656 1824 736
        END BRANCH
        BEGIN BRANCH XLXN_20
            WIRE 1136 224 1632 224
            WIRE 1632 224 1632 272
            WIRE 1136 224 1136 688
            WIRE 1136 688 2192 688
            WIRE 2192 656 2192 688
        END BRANCH
        BEGIN BRANCH XLXN_21
            WIRE 1760 656 1760 720
            WIRE 1760 720 1888 720
            WIRE 1888 208 1888 720
            WIRE 1888 208 1936 208
            WIRE 1936 208 1936 272
        END BRANCH
        BEGIN BRANCH XLXN_23
            WIRE 1872 224 2000 224
            WIRE 2000 224 2000 272
            WIRE 1872 224 1872 704
            WIRE 1872 704 2560 704
            WIRE 2560 656 2560 704
        END BRANCH
        BEGIN BRANCH XLXN_24
            WIRE 2128 656 2128 736
            WIRE 2128 736 2256 736
            WIRE 2256 208 2256 736
            WIRE 2256 208 2304 208
            WIRE 2304 208 2304 272
        END BRANCH
        BEGIN BRANCH XLXN_25
            WIRE 2496 656 2496 672
            WIRE 2496 672 2608 672
            WIRE 2608 208 2608 672
            WIRE 2608 208 2656 208
            WIRE 2656 208 2656 272
        END BRANCH
        BEGIN BRANCH XLXN_26
            WIRE 2368 192 2368 272
            WIRE 2368 192 2960 192
            WIRE 2960 192 2960 720
            WIRE 2912 656 2912 720
            WIRE 2912 720 2960 720
        END BRANCH
        BEGIN BRANCH XLXN_27
            WIRE 2240 224 2720 224
            WIRE 2720 224 2720 272
            WIRE 2240 224 2240 688
            WIRE 2240 688 3264 688
            WIRE 3264 656 3264 688
        END BRANCH
        BEGIN BRANCH XLXN_28
            WIRE 2848 656 2848 704
            WIRE 2848 704 3376 704
            WIRE 3008 192 3376 192
            WIRE 3376 192 3376 704
            WIRE 3008 192 3008 272
        END BRANCH
        BEGIN INSTANCE XLXI_36 1120 2416 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_38 752 2416 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_40 1856 2416 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_41 2224 2416 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_28 1280 1808 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_29 1648 1808 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_30 912 1808 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_31 544 1808 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_32 2016 1808 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_33 2384 1808 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_34 2736 1808 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_35 3088 1808 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_20 1264 1200 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_21 1632 1200 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_22 896 1200 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_23 528 1200 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_24 2000 1200 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_25 2368 1200 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_26 2720 1200 R90
        END INSTANCE
        BEGIN INSTANCE XLXI_27 3072 1200 R90
        END INSTANCE
        BEGIN BRANCH XLXN_29
            WIRE 656 1392 656 1440
            WIRE 656 1440 3360 1440
            WIRE 3072 208 3360 208
            WIRE 3360 208 3360 1440
            WIRE 3072 208 3072 272
        END BRANCH
        BEGIN BRANCH XLXN_30
            WIRE 304 944 304 1440
            WIRE 304 1440 592 1440
            WIRE 304 944 768 944
            WIRE 768 944 768 1008
            WIRE 592 1392 592 1440
        END BRANCH
        BEGIN BRANCH XLXN_31
            WIRE 400 800 3200 800
            WIRE 400 800 400 1008
            WIRE 3200 656 3200 800
        END BRANCH
        BEGIN BRANCH XLXN_32
            WIRE 464 960 464 1008
            WIRE 464 960 720 960
            WIRE 720 960 720 1456
            WIRE 720 1456 1024 1456
            WIRE 1024 1392 1024 1456
        END BRANCH
        BEGIN BRANCH XLXN_37
            WIRE 704 928 832 928
            WIRE 832 928 832 1008
            WIRE 704 928 704 1424
            WIRE 704 1424 1392 1424
            WIRE 1392 1392 1392 1424
        END BRANCH
        BEGIN BRANCH XLXN_38
            WIRE 960 1392 960 1408
            WIRE 960 1408 1088 1408
            WIRE 1088 944 1088 1408
            WIRE 1088 944 1136 944
            WIRE 1136 944 1136 1008
        END BRANCH
        BEGIN BRANCH XLXN_39
            WIRE 1072 992 1200 992
            WIRE 1200 992 1200 1008
            WIRE 1072 992 1072 1504
            WIRE 1072 1504 1760 1504
            WIRE 1760 1392 1760 1504
        END BRANCH
        BEGIN BRANCH XLXN_40
            WIRE 1328 1392 1328 1456
            WIRE 1328 1456 1456 1456
            WIRE 1456 944 1456 1456
            WIRE 1456 944 1504 944
            WIRE 1504 944 1504 1008
        END BRANCH
        BEGIN BRANCH XLXN_41
            WIRE 1440 960 1440 1408
            WIRE 1440 1408 1696 1408
            WIRE 1440 960 1872 960
            WIRE 1872 960 1872 1008
            WIRE 1696 1392 1696 1408
        END BRANCH
        BEGIN BRANCH XLXN_42
            WIRE 1568 944 1568 1008
            WIRE 1568 944 1824 944
            WIRE 1824 944 1824 1456
            WIRE 1824 1456 2128 1456
            WIRE 2128 1392 2128 1456
        END BRANCH
        BEGIN BRANCH XLXN_43
            WIRE 1808 976 1808 1408
            WIRE 1808 1408 2064 1408
            WIRE 1808 976 2240 976
            WIRE 2240 976 2240 1008
            WIRE 2064 1392 2064 1408
        END BRANCH
        BEGIN BRANCH XLXN_44
            WIRE 1936 944 1936 1008
            WIRE 1936 944 2192 944
            WIRE 2192 944 2192 1456
            WIRE 2192 1456 2496 1456
            WIRE 2496 1392 2496 1456
        END BRANCH
        BEGIN BRANCH XLXN_45
            WIRE 2176 960 2304 960
            WIRE 2304 960 2304 1008
            WIRE 2176 960 2176 1424
            WIRE 2176 1424 2848 1424
            WIRE 2848 1392 2848 1424
        END BRANCH
        BEGIN BRANCH XLXN_46
            WIRE 2432 1392 2432 1408
            WIRE 2432 1408 2544 1408
            WIRE 2544 944 2544 1408
            WIRE 2544 944 2592 944
            WIRE 2592 944 2592 1008
        END BRANCH
        BEGIN BRANCH XLXN_47
            WIRE 2784 1392 2784 1504
            WIRE 2784 1504 2896 1504
            WIRE 2896 944 2896 1504
            WIRE 2896 944 2944 944
            WIRE 2944 944 2944 1008
        END BRANCH
        BEGIN BRANCH XLXN_48
            WIRE 2656 960 2656 1008
            WIRE 2656 960 3296 960
            WIRE 3296 960 3296 1456
            WIRE 3200 1392 3200 1456
            WIRE 3200 1456 3296 1456
        END BRANCH
        BEGIN BRANCH XLXN_50
            WIRE 416 1520 416 1616
            WIRE 416 1520 3136 1520
            WIRE 3136 1392 3136 1520
        END BRANCH
        BEGIN BRANCH XLXN_51
            WIRE 320 1552 480 1552
            WIRE 480 1552 480 1616
            WIRE 320 1552 320 2016
            WIRE 320 2016 1040 2016
            WIRE 1040 2000 1040 2016
        END BRANCH
        BEGIN BRANCH XLXN_52
            WIRE 352 864 352 2048
            WIRE 352 2048 672 2048
            WIRE 352 864 3008 864
            WIRE 3008 864 3008 1008
            WIRE 672 2000 672 2048
        END BRANCH
        BEGIN BRANCH XLXN_53
            WIRE 608 2000 608 2080
            WIRE 608 2080 736 2080
            WIRE 736 1552 736 2080
            WIRE 736 1552 784 1552
            WIRE 784 1552 784 1616
        END BRANCH
        BEGIN BRANCH XLXN_54
            WIRE 720 1568 848 1568
            WIRE 848 1568 848 1616
            WIRE 720 1568 720 2032
            WIRE 720 2032 1408 2032
            WIRE 1408 2000 1408 2032
        END BRANCH
        BEGIN BRANCH XLXN_55
            WIRE 976 2000 976 2096
            WIRE 976 2096 1104 2096
            WIRE 1104 1536 1104 2096
            WIRE 1104 1536 1152 1536
            WIRE 1152 1536 1152 1616
        END BRANCH
        BEGIN BRANCH XLXN_56
            WIRE 1088 1552 1088 2064
            WIRE 1088 2064 1344 2064
            WIRE 1088 1552 1520 1552
            WIRE 1520 1552 1520 1616
            WIRE 1344 2000 1344 2064
        END BRANCH
        BEGIN BRANCH XLXN_57
            WIRE 1216 1568 1216 1616
            WIRE 1216 1568 1472 1568
            WIRE 1472 1568 1472 2048
            WIRE 1472 2048 1776 2048
            WIRE 1776 2000 1776 2048
        END BRANCH
        BEGIN BRANCH XLXN_58
            WIRE 1456 1584 1456 2016
            WIRE 1456 2016 1712 2016
            WIRE 1456 1584 1888 1584
            WIRE 1888 1584 1888 1616
            WIRE 1712 2000 1712 2016
        END BRANCH
        BEGIN BRANCH XLXN_60
            WIRE 1584 1552 1584 1616
            WIRE 1584 1552 1840 1552
            WIRE 1840 1552 1840 2048
            WIRE 1840 2048 2144 2048
            WIRE 2144 2000 2144 2048
        END BRANCH
        BEGIN BRANCH XLXN_61
            WIRE 2080 2000 2080 2016
            WIRE 2080 2016 2208 2016
            WIRE 2208 1552 2208 2016
            WIRE 2208 1552 2256 1552
            WIRE 2256 1552 2256 1616
        END BRANCH
        BEGIN BRANCH XLXN_62
            WIRE 1824 1568 1952 1568
            WIRE 1952 1568 1952 1616
            WIRE 1824 1568 1824 2096
            WIRE 1824 2096 2512 2096
            WIRE 2512 2000 2512 2096
        END BRANCH
        BEGIN BRANCH XLXN_63
            WIRE 2448 2000 2448 2064
            WIRE 2448 2064 2560 2064
            WIRE 2560 1552 2560 2064
            WIRE 2560 1552 2608 1552
            WIRE 2608 1552 2608 1616
        END BRANCH
        BEGIN BRANCH XLXN_64
            WIRE 2192 1568 2320 1568
            WIRE 2320 1568 2320 1616
            WIRE 2192 1568 2192 2032
            WIRE 2192 2032 2864 2032
            WIRE 2864 2000 2864 2032
        END BRANCH
        BEGIN BRANCH XLXN_65
            WIRE 2800 2000 2800 2064
            WIRE 2800 2064 2912 2064
            WIRE 2912 1552 2912 2064
            WIRE 2912 1552 2960 1552
            WIRE 2960 1552 2960 1616
        END BRANCH
        BEGIN BRANCH XLXN_66
            WIRE 2672 1568 2672 1616
            WIRE 2672 1568 3312 1568
            WIRE 3312 1568 3312 2064
            WIRE 3216 2000 3216 2064
            WIRE 3216 2064 3312 2064
        END BRANCH
        BEGIN BRANCH XLXN_67
            WIRE 144 1472 144 2672
            WIRE 144 2672 512 2672
            WIRE 144 1472 3024 1472
            WIRE 3024 1472 3024 1616
            WIRE 512 2608 512 2672
        END BRANCH
        BEGIN BRANCH XLXN_68
            WIRE 256 2112 256 2224
            WIRE 256 2112 3152 2112
            WIRE 3152 2000 3152 2112
        END BRANCH
        BEGIN BRANCH XLXN_69
            WIRE 448 2608 448 2656
            WIRE 448 2656 576 2656
            WIRE 576 2160 576 2656
            WIRE 576 2160 624 2160
            WIRE 624 2160 624 2224
        END BRANCH
        BEGIN BRANCH XLXN_70
            WIRE 560 2176 560 2624
            WIRE 560 2624 816 2624
            WIRE 560 2176 992 2176
            WIRE 992 2176 992 2224
            WIRE 816 2608 816 2624
        END BRANCH
        BEGIN BRANCH XLXN_71
            WIRE 1184 2608 1184 2688
            WIRE 1184 2688 1312 2688
            WIRE 1312 2160 1312 2688
            WIRE 1312 2160 1360 2160
            WIRE 1360 2160 1360 2224
        END BRANCH
        BEGIN BRANCH XLXN_72
            WIRE 1552 2608 1552 2672
            WIRE 1552 2672 1680 2672
            WIRE 1680 2160 1680 2672
            WIRE 1680 2160 1728 2160
            WIRE 1728 2160 1728 2224
        END BRANCH
        BEGIN BRANCH XLXN_73
            WIRE 1664 2176 1664 2656
            WIRE 1664 2656 1920 2656
            WIRE 1664 2176 2096 2176
            WIRE 2096 2176 2096 2224
            WIRE 1920 2608 1920 2656
        END BRANCH
        BEGIN BRANCH XLXN_76
            WIRE 160 2160 320 2160
            WIRE 320 2160 320 2224
            WIRE 160 2160 160 2704
            WIRE 160 2704 880 2704
            WIRE 880 2608 880 2704
        END BRANCH
        BEGIN BRANCH XLXN_77
            WIRE 688 2160 688 2224
            WIRE 688 2160 944 2160
            WIRE 944 2160 944 2672
            WIRE 944 2672 1248 2672
            WIRE 1248 2608 1248 2672
        END BRANCH
        BEGIN BRANCH XLXN_78
            WIRE 928 2144 1056 2144
            WIRE 1056 2144 1056 2224
            WIRE 928 2144 928 2656
            WIRE 928 2656 1616 2656
            WIRE 1616 2608 1616 2656
        END BRANCH
        BEGIN BRANCH XLXN_79
            WIRE 1424 2144 1424 2224
            WIRE 1424 2144 2048 2144
            WIRE 2048 2144 2048 2672
            WIRE 1984 2608 1984 2672
            WIRE 1984 2672 2048 2672
        END BRANCH
        BEGIN BRANCH XLXN_80
            WIRE 1296 2192 1792 2192
            WIRE 1792 2192 1792 2224
            WIRE 1296 2192 1296 2624
            WIRE 1296 2624 2352 2624
            WIRE 2352 2608 2352 2624
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 80 96 112 96
            WIRE 112 96 112 144
            WIRE 112 144 128 144
            WIRE 112 96 592 96
            WIRE 592 96 592 208
            WIRE 592 208 592 272
            WIRE 592 96 960 96
            WIRE 960 96 960 208
            WIRE 960 208 960 272
            WIRE 960 96 1328 96
            WIRE 1328 96 1328 272
            WIRE 1328 96 1696 96
            WIRE 1696 96 1696 272
            WIRE 1696 96 2064 96
            WIRE 2064 96 2064 272
            WIRE 2064 96 2432 96
            WIRE 2432 96 2432 272
            WIRE 2432 96 2784 96
            WIRE 2784 96 2784 272
            WIRE 2784 96 3136 96
            WIRE 3136 96 3232 96
            WIRE 3136 96 3136 272
        END BRANCH
        INSTANCE XLXI_60 128 176 R0
        BEGIN BRANCH Left_Shift
            WIRE 352 144 368 144
            WIRE 368 144 720 144
            WIRE 720 144 720 208
            WIRE 720 208 720 272
            WIRE 720 144 1088 144
            WIRE 1088 144 1088 208
            WIRE 1088 208 1088 272
            WIRE 1088 144 1456 144
            WIRE 1456 144 1456 272
            WIRE 1456 144 1824 144
            WIRE 1824 144 1824 272
            WIRE 1824 144 2192 144
            WIRE 2192 144 2192 272
            WIRE 2192 144 2560 144
            WIRE 2560 144 2560 272
            WIRE 2560 144 2912 144
            WIRE 2912 144 3232 144
            WIRE 3232 144 3232 160
            WIRE 3232 144 3264 144
            WIRE 3264 144 3264 272
            WIRE 2912 144 2912 272
            BEGIN DISPLAY 368 144 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 80 96 Right_Shift R180 28
        INSTANCE XLXI_94 64 416 R90
        BEGIN BRANCH IN_S(0)
            WIRE 128 320 128 384
            WIRE 128 384 128 416
            BEGIN DISPLAY 128 384 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 192 320 192 384
            WIRE 192 384 192 416
            BEGIN DISPLAY 192 384 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH XLXN_87
            WIRE 160 672 160 752
            WIRE 160 752 256 752
            WIRE 256 208 256 752
            WIRE 256 208 464 208
            WIRE 464 208 464 272
        END BRANCH
        BEGIN BRANCH IN_S(4)
            WIRE 1760 208 1760 224
            WIRE 1760 224 1760 272
            BEGIN DISPLAY 1760 224 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(6)
            WIRE 2496 240 2496 256
            WIRE 2496 256 2496 272
            BEGIN DISPLAY 2496 256 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(7)
            WIRE 2848 208 2848 224
            WIRE 2848 224 2848 272
            BEGIN DISPLAY 2848 224 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(8)
            WIRE 3200 224 3200 240
            WIRE 3200 240 3200 272
            BEGIN DISPLAY 3200 240 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(3)
            WIRE 1392 240 1392 256
            WIRE 1392 256 1392 272
            BEGIN DISPLAY 1392 256 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(5)
            WIRE 2128 208 2128 224
            WIRE 2128 224 2128 272
            BEGIN DISPLAY 2128 224 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(9)
            WIRE 592 912 592 992
            WIRE 592 992 592 1008
            BEGIN DISPLAY 592 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(10)
            WIRE 960 928 960 960
            WIRE 960 960 960 1008
            BEGIN DISPLAY 960 960 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(11)
            WIRE 1328 928 1328 992
            WIRE 1328 992 1328 1008
            BEGIN DISPLAY 1328 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(12)
            WIRE 1696 912 1696 992
            WIRE 1696 992 1696 1008
            BEGIN DISPLAY 1696 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(13)
            WIRE 2064 912 2064 992
            WIRE 2064 992 2064 1008
            BEGIN DISPLAY 2064 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(14)
            WIRE 2432 896 2432 976
            WIRE 2432 976 2432 1008
            BEGIN DISPLAY 2432 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(15)
            WIRE 2784 896 2784 976
            WIRE 2784 976 2784 1008
            BEGIN DISPLAY 2784 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(16)
            WIRE 3136 864 3136 912
            WIRE 3136 912 3136 1008
            BEGIN DISPLAY 3136 912 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(17)
            WIRE 608 1552 608 1584
            WIRE 608 1584 608 1616
            BEGIN DISPLAY 608 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(18)
            WIRE 976 1536 976 1568
            WIRE 976 1568 976 1616
            BEGIN DISPLAY 976 1568 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(19)
            WIRE 1344 1536 1344 1584
            WIRE 1344 1584 1344 1616
            BEGIN DISPLAY 1344 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(20)
            WIRE 1712 1536 1712 1568
            WIRE 1712 1568 1712 1616
            BEGIN DISPLAY 1712 1568 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(21)
            WIRE 2080 1536 2080 1568
            WIRE 2080 1568 2080 1616
            BEGIN DISPLAY 2080 1568 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(22)
            WIRE 2448 1536 2448 1568
            WIRE 2448 1568 2448 1616
            BEGIN DISPLAY 2448 1568 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(23)
            WIRE 2800 1536 2800 1584
            WIRE 2800 1584 2800 1616
            BEGIN DISPLAY 2800 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(24)
            WIRE 3152 1552 3152 1584
            WIRE 3152 1584 3152 1616
            BEGIN DISPLAY 3152 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(25)
            WIRE 448 2144 448 2176
            WIRE 448 2176 448 2224
            BEGIN DISPLAY 448 2176 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(27)
            WIRE 1184 2144 1184 2176
            WIRE 1184 2176 1184 2224
            BEGIN DISPLAY 1184 2176 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(28)
            WIRE 1552 2160 1552 2176
            WIRE 1552 2176 1552 2208
            WIRE 1552 2208 1552 2224
            BEGIN DISPLAY 1552 2176 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(29)
            WIRE 1920 2160 1920 2192
            WIRE 1920 2192 1920 2208
            WIRE 1920 2208 1920 2224
            BEGIN DISPLAY 1920 2192 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(30)
            WIRE 2288 2144 2288 2160
            WIRE 2288 2160 2288 2224
            BEGIN DISPLAY 2288 2160 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_37 1488 2416 R90
        END INSTANCE
        BEGIN BRANCH IN_S(26)
            WIRE 816 2144 816 2192
            WIRE 816 2192 816 2224
            BEGIN DISPLAY 816 2192 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_95 2512 2272 R90
        BEGIN BRANCH XLXN_117
            WIRE 2032 2160 2160 2160
            WIRE 2160 2160 2160 2224
            WIRE 2032 2160 2032 2640
            WIRE 2032 2640 2608 2640
            WIRE 2608 2528 2608 2640
        END BRANCH
        BEGIN BRANCH IN_S(31)
            WIRE 2640 2160 2640 2224
            WIRE 2640 2224 2640 2272
            BEGIN DISPLAY 2640 2224 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 2576 2160 2576 2224
            WIRE 2576 2224 2576 2272
            BEGIN DISPLAY 2576 2224 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(31)
            WIRE 2288 2608 2288 2672
            WIRE 2288 2672 2288 2704
            BEGIN DISPLAY 2288 2672 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(29)
            WIRE 1856 2608 1856 2640
            WIRE 1856 2640 1856 2672
            BEGIN DISPLAY 1856 2640 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(28)
            WIRE 1488 2608 1488 2672
            WIRE 1488 2672 1488 2688
            BEGIN DISPLAY 1488 2672 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(26)
            WIRE 752 2608 752 2640
            WIRE 752 2640 752 2656
            BEGIN DISPLAY 752 2640 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(25)
            WIRE 384 2608 384 2624
            WIRE 384 2624 384 2640
            BEGIN DISPLAY 384 2624 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(24)
            WIRE 3088 2000 3088 2048
            WIRE 3088 2048 3088 2064
            BEGIN DISPLAY 3088 2048 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(23)
            WIRE 2736 2000 2736 2064
            WIRE 2736 2064 2736 2080
            BEGIN DISPLAY 2736 2064 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(27)
            WIRE 1120 2608 1120 2640
            WIRE 1120 2640 1120 2688
            BEGIN DISPLAY 1120 2640 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(22)
            WIRE 2384 2000 2384 2048
            WIRE 2384 2048 2384 2064
            BEGIN DISPLAY 2384 2048 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(21)
            WIRE 2016 2000 2016 2032
            WIRE 2016 2032 2016 2064
            BEGIN DISPLAY 2016 2032 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(20)
            WIRE 1648 2000 1648 2032
            WIRE 1648 2032 1648 2064
            BEGIN DISPLAY 1648 2032 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(19)
            WIRE 1280 2000 1280 2048
            WIRE 1280 2048 1280 2080
            BEGIN DISPLAY 1280 2048 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(18)
            WIRE 912 2000 912 2048
            WIRE 912 2048 912 2064
            BEGIN DISPLAY 912 2048 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(17)
            WIRE 544 2000 544 2032
            WIRE 544 2032 544 2064
            BEGIN DISPLAY 544 2032 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(16)
            WIRE 3072 1392 3072 1456
            WIRE 3072 1456 3072 1472
            BEGIN DISPLAY 3072 1456 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(15)
            WIRE 2720 1392 2720 1408
            WIRE 2720 1408 2720 1456
            BEGIN DISPLAY 2720 1408 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(14)
            WIRE 2368 1392 2368 1408
            WIRE 2368 1408 2368 1488
            BEGIN DISPLAY 2368 1408 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(13)
            WIRE 2000 1392 2000 1424
            WIRE 2000 1424 2000 1488
            BEGIN DISPLAY 2000 1424 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(12)
            WIRE 1632 1392 1632 1424
            WIRE 1632 1424 1632 1456
            BEGIN DISPLAY 1632 1424 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(11)
            WIRE 1264 1392 1264 1456
            WIRE 1264 1456 1264 1488
            BEGIN DISPLAY 1264 1456 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(10)
            WIRE 896 1392 896 1408
            WIRE 896 1408 896 1488
            BEGIN DISPLAY 896 1408 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(9)
            WIRE 528 1392 528 1408
            WIRE 528 1408 528 1488
            BEGIN DISPLAY 528 1408 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(8)
            WIRE 3136 656 3136 720
            WIRE 3136 720 3136 736
            BEGIN DISPLAY 3136 720 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(7)
            WIRE 2784 656 2784 704
            WIRE 2784 704 2784 736
            BEGIN DISPLAY 2784 704 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(6)
            WIRE 2432 656 2432 720
            WIRE 2432 720 2432 752
            BEGIN DISPLAY 2432 720 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(5)
            WIRE 2064 656 2064 736
            WIRE 2064 736 2064 752
            BEGIN DISPLAY 2064 736 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(4)
            WIRE 1696 656 1696 752
            WIRE 1696 752 1696 768
            BEGIN DISPLAY 1696 752 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(3)
            WIRE 1328 656 1328 704
            WIRE 1328 704 1328 736
            BEGIN DISPLAY 1328 704 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(2)
            WIRE 960 656 960 720
            WIRE 960 720 960 752
            BEGIN DISPLAY 960 720 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(1)
            WIRE 592 656 592 704
            WIRE 592 704 592 752
            BEGIN DISPLAY 592 704 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH OUT_S(0)
            WIRE 720 656 720 688
            WIRE 720 688 720 768
            BEGIN DISPLAY 720 688 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 528 896 528 992
            WIRE 528 992 528 1008
            BEGIN DISPLAY 528 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 656 896 656 992
            WIRE 656 992 656 1008
            BEGIN DISPLAY 656 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 896 912 896 944
            WIRE 896 944 896 1008
            BEGIN DISPLAY 896 944 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 1024 912 1024 992
            WIRE 1024 992 1024 1008
            BEGIN DISPLAY 1024 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 1264 912 1264 976
            WIRE 1264 976 1264 1008
            BEGIN DISPLAY 1264 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 1392 912 1392 992
            WIRE 1392 992 1392 1008
            BEGIN DISPLAY 1392 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 1632 912 1632 976
            WIRE 1632 976 1632 1008
            BEGIN DISPLAY 1632 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 1760 912 1760 992
            WIRE 1760 992 1760 1008
            BEGIN DISPLAY 1760 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 2000 896 2000 928
            WIRE 2000 928 2000 1008
            BEGIN DISPLAY 2000 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 2128 896 2128 992
            WIRE 2128 992 2128 1008
            BEGIN DISPLAY 2128 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 2368 896 2368 960
            WIRE 2368 960 2368 1008
            BEGIN DISPLAY 2368 960 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 2496 896 2496 976
            WIRE 2496 976 2496 1008
            BEGIN DISPLAY 2496 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 2720 896 2720 928
            WIRE 2720 928 2720 1008
            BEGIN DISPLAY 2720 928 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 2848 896 2848 976
            WIRE 2848 976 2848 1008
            BEGIN DISPLAY 2848 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 3072 896 3072 976
            WIRE 3072 976 3072 1008
            BEGIN DISPLAY 3072 976 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 3200 880 3200 992
            WIRE 3200 992 3200 1008
            BEGIN DISPLAY 3200 992 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 544 1552 544 1600
            WIRE 544 1600 544 1616
            BEGIN DISPLAY 544 1600 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 672 1552 672 1584
            WIRE 672 1584 672 1616
            BEGIN DISPLAY 672 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 912 1536 912 1584
            WIRE 912 1584 912 1616
            BEGIN DISPLAY 912 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 1040 1536 1040 1584
            WIRE 1040 1584 1040 1616
            BEGIN DISPLAY 1040 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 1280 1584 1280 1600
            WIRE 1280 1600 1280 1616
            BEGIN DISPLAY 1280 1600 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 1408 1584 1408 1600
            WIRE 1408 1600 1408 1616
            BEGIN DISPLAY 1408 1600 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 1648 1568 1648 1600
            WIRE 1648 1600 1648 1616
            BEGIN DISPLAY 1648 1600 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 1776 1568 1776 1600
            WIRE 1776 1600 1776 1616
            BEGIN DISPLAY 1776 1600 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 2016 1552 2016 1584
            WIRE 2016 1584 2016 1616
            BEGIN DISPLAY 2016 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 2144 1552 2144 1584
            WIRE 2144 1584 2144 1616
            BEGIN DISPLAY 2144 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 2384 1552 2384 1584
            WIRE 2384 1584 2384 1616
            BEGIN DISPLAY 2384 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 2512 1552 2512 1584
            WIRE 2512 1584 2512 1616
            BEGIN DISPLAY 2512 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 2736 1552 2736 1584
            WIRE 2736 1584 2736 1616
            BEGIN DISPLAY 2736 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 2864 1552 2864 1584
            WIRE 2864 1584 2864 1616
            BEGIN DISPLAY 2864 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 3088 1552 3088 1584
            WIRE 3088 1584 3088 1616
            BEGIN DISPLAY 3088 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 3216 1552 3216 1584
            WIRE 3216 1584 3216 1616
            BEGIN DISPLAY 3216 1584 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 384 2144 384 2208
            WIRE 384 2208 384 2224
            BEGIN DISPLAY 384 2208 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 512 2144 512 2192
            WIRE 512 2192 512 2224
            BEGIN DISPLAY 512 2192 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 752 2144 752 2208
            WIRE 752 2208 752 2224
            BEGIN DISPLAY 752 2208 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 880 2144 880 2208
            WIRE 880 2208 880 2224
            BEGIN DISPLAY 880 2208 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 1120 2144 1120 2176
            WIRE 1120 2176 1120 2224
            BEGIN DISPLAY 1120 2176 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 1248 2144 1248 2176
            WIRE 1248 2176 1248 2224
            BEGIN DISPLAY 1248 2176 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 1488 2160 1488 2208
            WIRE 1488 2208 1488 2224
            BEGIN DISPLAY 1488 2208 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 1616 2160 1616 2208
            WIRE 1616 2208 1616 2224
            BEGIN DISPLAY 1616 2208 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 1856 2160 1856 2192
            WIRE 1856 2192 1856 2224
            BEGIN DISPLAY 1856 2192 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 1984 2160 1984 2192
            WIRE 1984 2192 1984 2224
            BEGIN DISPLAY 1984 2192 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Right_Shift
            WIRE 2224 2144 2224 2176
            WIRE 2224 2176 2224 2224
            BEGIN DISPLAY 2224 2176 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH Left_Shift
            WIRE 2352 2144 2352 2176
            WIRE 2352 2176 2352 2224
            BEGIN DISPLAY 2352 2176 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE XLXI_96 384 2416 R90
        END INSTANCE
        BEGIN BRANCH OUT_S(30)
            WIRE 2224 2608 2224 2656
            WIRE 2224 2656 2224 2688
            BEGIN DISPLAY 2224 2656 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH IN_S(31:0)
            WIRE 80 1024 80 1184
        END BRANCH
        IOMARKER 80 1024 IN_S(31:0) R270 28
        BEGIN BRANCH OUT_S(31:0)
            WIRE 2880 2416 3072 2416
        END BRANCH
        IOMARKER 3072 2416 OUT_S(31:0) R0 28
    END SHEET
END SCHEMATIC
