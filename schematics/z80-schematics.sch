EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:o_zilog
LIBS:simon
EELAYER 24 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Z80 Single Board Computer"
Date "9 oct 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 28C256 U?
U 1 1 54359578
P 1900 2750
F 0 "U?" H 2100 3750 70  0000 C CNN
F 1 "28C256" H 2200 1750 70  0000 C CNN
F 2 "" H 1900 2750 60  0000 C CNN
F 3 "" H 1900 2750 60  0000 C CNN
	1    1900 2750
	1    0    0    -1  
$EndComp
$Comp
L 628128 U?
U 1 1 5435969B
P 4450 2900
F 0 "U?" H 4500 2900 70  0000 C CNN
F 1 "628128" H 4750 1700 70  0000 C CNN
F 2 "" H 4450 2900 60  0000 C CNN
F 3 "" H 4450 2900 60  0000 C CNN
	1    4450 2900
	1    0    0    -1  
$EndComp
$Comp
L Z80-CPU U?
U 1 1 54359841
P 7500 3050
F 0 "U?" H 7500 4400 60  0000 C CNN
F 1 "Z80-CPU" H 7500 1700 60  0000 C CNN
F 2 "" H 7500 3050 60  0000 C CNN
F 3 "" H 7500 3050 60  0000 C CNN
	1    7500 3050
	1    0    0    -1  
$EndComp
$Comp
L Z80-CTC U?
U 1 1 54359876
P 10450 7550
F 0 "U?" H 10450 8650 60  0000 C CNN
F 1 "Z80-CTC" H 10450 6450 60  0000 C CNN
F 2 "" H 10450 7550 60  0000 C CNN
F 3 "" H 10450 7550 60  0000 C CNN
	1    10450 7550
	1    0    0    -1  
$EndComp
$Comp
L Z80-SIO/0 U?
U 1 1 54359885
P 13100 7550
F 0 "U?" H 13100 8750 60  0000 C CNN
F 1 "Z80-SIO/0" H 13100 6350 60  0000 C CNN
F 2 "" H 13100 7550 60  0000 C CNN
F 3 "" H 13100 7550 60  0000 C CNN
	1    13100 7550
	1    0    0    -1  
$EndComp
NoConn ~ 6550 2750
NoConn ~ 6550 2550
Text Label 8650 3550 2    60   Italic 12
d0
Text Label 8650 3750 2    60   Italic 12
d2
Text Label 8650 3850 2    60   Italic 12
d3
Text Label 8650 3950 2    60   Italic 12
d4
Text Label 8650 4050 2    60   Italic 12
d5
Text Label 8650 3650 2    60   Italic 12
d1
Text Label 8650 4150 2    60   Italic 12
d6
Text Label 8650 4250 2    60   Italic 12
d7
Text Label 8650 1850 2    60   Italic 12
a0
Text Label 8650 1950 2    60   Italic 12
a1
Text Label 8650 2050 2    60   Italic 12
a2
Text Label 8650 2150 2    60   Italic 12
a3
Text Label 8650 2250 2    60   Italic 12
a4
Text Label 8650 2350 2    60   Italic 12
a5
Text Label 8650 2450 2    60   Italic 12
a6
Text Label 8650 2550 2    60   Italic 12
a7
Text Label 8650 2650 2    60   Italic 12
a8
Text Label 8650 2750 2    60   Italic 12
a9
Text Label 8650 2850 2    60   Italic 12
a10
Text Label 8650 2950 2    60   Italic 12
a11
Text Label 5350 1850 2    60   Italic 12
d0
Text Label 5350 1950 2    60   Italic 12
d1
Text Label 5350 2050 2    60   Italic 12
d2
Text Label 5350 2150 2    60   Italic 12
d3
Text Label 5350 2250 2    60   Italic 12
d4
Text Label 5350 2350 2    60   Italic 12
d5
Text Label 5350 2450 2    60   Italic 12
d6
Text Label 5350 2550 2    60   Italic 12
d7
Text Label 1000 1850 0    60   Italic 12
a0
Text Label 1000 1950 0    60   Italic 12
a1
Text Label 1000 2050 0    60   Italic 12
a2
Text Label 1000 2150 0    60   Italic 12
a3
Text Label 1000 2250 0    60   Italic 12
a4
Text Label 1000 2350 0    60   Italic 12
a5
Text Label 1000 2450 0    60   Italic 12
a6
Text Label 1000 2550 0    60   Italic 12
a7
Text Label 1000 2650 0    60   Italic 12
a8
Text Label 1000 2750 0    60   Italic 12
a9
Text Label 1000 2850 0    60   Italic 12
a10
Text Label 1000 2950 0    60   Italic 12
a11
Text Label 2800 1850 2    60   Italic 12
d0
Text Label 2800 1950 2    60   Italic 12
d1
Text Label 2800 2050 2    60   Italic 12
d2
Text Label 2800 2150 2    60   Italic 12
d3
Text Label 2800 2250 2    60   Italic 12
d4
Text Label 2800 2350 2    60   Italic 12
d5
Text Label 2800 2450 2    60   Italic 12
d6
Text Label 2800 2550 2    60   Italic 12
d7
Text Label 3550 1850 0    60   Italic 12
a0
Text Label 3550 1950 0    60   Italic 12
a1
Text Label 3550 2050 0    60   Italic 12
a2
Text Label 3550 2150 0    60   Italic 12
a3
Text Label 3550 2250 0    60   Italic 12
a4
Text Label 3550 2350 0    60   Italic 12
a5
Text Label 3550 2450 0    60   Italic 12
a6
Text Label 3550 2550 0    60   Italic 12
a7
Text Label 3550 2650 0    60   Italic 12
a8
Text Label 3550 2750 0    60   Italic 12
a9
Text Label 3550 2850 0    60   Italic 12
a10
$Comp
L VCC #PWR?
U 1 1 5435A5D9
P 1000 3450
F 0 "#PWR?" H 1000 3550 30  0001 C CNN
F 1 "VCC" H 1000 3550 30  0000 C CNN
F 2 "" H 1000 3450 60  0000 C CNN
F 3 "" H 1000 3450 60  0000 C CNN
	1    1000 3450
	1    0    0    -1  
$EndComp
Text Label 1000 3050 0    60   Italic 12
b12
Text Label 1000 3150 0    60   Italic 12
b13
Text Label 1000 3250 0    60   Italic 12
b14
Text Label 3550 2950 0    60   Italic 12
a11
Text Label 3550 3050 0    60   Italic 12
b12
Text Label 3550 3150 0    60   Italic 12
b13
Text Label 3550 3250 0    60   Italic 12
b14
Text Label 3550 3350 0    60   Italic 12
b15
Text Label 3550 3450 0    60   Italic 12
b16
$Comp
L 74LS138 U?
U 1 1 5435AB03
P 10150 2100
F 0 "U?" H 10250 2600 60  0000 C CNN
F 1 "74LS138" H 10300 1551 60  0000 C CNN
F 2 "~" H 10150 2100 60  0000 C CNN
F 3 "~" H 10150 2100 60  0000 C CNN
	1    10150 2100
	1    0    0    -1  
$EndComp
Text Label 9200 1750 0    60   Italic 12
a4
Text Label 9200 1850 0    60   Italic 12
a5
Text Label 9200 1950 0    60   Italic 12
a6
$Comp
L VCC #PWR?
U 1 1 5435ABA7
P 9200 2250
F 0 "#PWR?" H 9200 2350 30  0001 C CNN
F 1 "VCC" H 9200 2350 30  0000 C CNN
F 2 "" H 9200 2250 60  0000 C CNN
F 3 "" H 9200 2250 60  0000 C CNN
	1    9200 2250
	1    0    0    -1  
$EndComp
Text Label 9200 2350 0    60   Italic 12
a7
$Comp
L VCC #PWR?
U 1 1 5435B495
P 6400 2950
F 0 "#PWR?" H 6400 3050 30  0001 C CNN
F 1 "VCC" H 6400 3050 30  0000 C CNN
F 2 "" H 6400 2950 60  0000 C CNN
F 3 "" H 6400 2950 60  0000 C CNN
	1    6400 2950
	1    0    0    -1  
$EndComp
NoConn ~ 6550 3750
Text Label 8650 3050 2    60   Italic 12
a12
Text Label 8650 3150 2    60   Italic 12
a13
Text Label 8650 3250 2    60   Italic 12
a14
Text Label 8650 3350 2    60   Italic 12
a15
Text Label 6850 4750 0    60   Italic 12
/rd
$Comp
L 74LS540 U?
U 1 1 5436E9B5
P 12900 2950
F 0 "U?" H 12900 2750 60  0000 C CNN
F 1 "74LS540" H 12900 2650 60  0000 C CNN
F 2 "~" H 12900 2950 60  0000 C CNN
F 3 "~" H 12900 2950 60  0000 C CNN
	1    12900 2950
	1    0    0    -1  
$EndComp
$Comp
L 74LS289 U?
U 1 1 5436F327
P 12900 1350
F 0 "U?" H 13100 1950 70  0000 C CNN
F 1 "74LS289" H 13100 650 70  0000 C CNN
F 2 "~" H 13350 1050 60  0000 C CNN
F 3 "~" H 13350 1050 60  0000 C CNN
	1    12900 1350
	1    0    0    -1  
$EndComp
$Comp
L 74LS289 U?
U 1 1 5436F336
P 14900 1300
F 0 "U?" H 15100 1900 70  0000 C CNN
F 1 "74LS289" H 15100 600 70  0000 C CNN
F 2 "~" H 15350 1000 60  0000 C CNN
F 3 "~" H 15350 1000 60  0000 C CNN
	1    14900 1300
	1    0    0    -1  
$EndComp
Text Label 13750 1650 2    60   Italic 12
b12
Text Label 13750 1750 2    60   Italic 12
b13
Text Label 13750 1850 2    60   Italic 12
b14
Text Label 13750 1950 2    60   Italic 12
b15
Text Label 15750 1600 2    60   Italic 12
b16
Text Label 15750 1700 2    60   Italic 12
b17
Text Label 15750 1800 2    60   Italic 12
b18
Text Label 15750 1900 2    60   Italic 12
b19
Text Label 12050 1650 0    60   Italic 12
d0
Text Label 12050 1750 0    60   Italic 12
d1
Text Label 12050 1850 0    60   Italic 12
d2
Text Label 12050 1950 0    60   Italic 12
d3
Text Label 14050 1600 0    60   Italic 12
d4
Text Label 14050 1700 0    60   Italic 12
d5
Text Label 14050 1800 0    60   Italic 12
d6
Text Label 14050 1900 0    60   Italic 12
d7
Text Label 12050 1150 0    60   Italic 12
a12
Text Label 12050 1250 0    60   Italic 12
a13
Text Label 12050 1350 0    60   Italic 12
a14
Text Label 12050 1450 0    60   Italic 12
a15
Text Label 14050 1100 0    60   Italic 12
a12
Text Label 14050 1200 0    60   Italic 12
a13
Text Label 14050 1300 0    60   Italic 12
a14
Text Label 14050 1400 0    60   Italic 12
a15
Text Label 12000 2450 0    60   Italic 12
b12
Text Label 12000 2550 0    60   Italic 12
b13
Text Label 12000 2650 0    60   Italic 12
b14
Text Label 12000 2750 0    60   Italic 12
b15
Text Label 12000 2850 0    60   Italic 12
b16
Text Label 12000 2950 0    60   Italic 12
b17
Text Label 12000 3050 0    60   Italic 12
b18
Text Label 12000 3150 0    60   Italic 12
b19
Text Label 13800 2450 2    60   Italic 12
d0
Text Label 13800 2550 2    60   Italic 12
d1
Text Label 13800 2650 2    60   Italic 12
d2
Text Label 13800 2750 2    60   Italic 12
d3
Text Label 13800 2850 2    60   Italic 12
d4
Text Label 13800 2950 2    60   Italic 12
d5
Text Label 13800 3050 2    60   Italic 12
d6
Text Label 13800 3150 2    60   Italic 12
d7
$Comp
L R R?
U 1 1 5436F625
P 14850 2450
F 0 "R?" V 14930 2450 40  0000 C CNN
F 1 "R" V 14857 2451 40  0000 C CNN
F 2 "~" V 14780 2450 30  0000 C CNN
F 3 "~" H 14850 2450 30  0000 C CNN
	1    14850 2450
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F632
P 14850 2600
F 0 "R?" V 14930 2600 40  0000 C CNN
F 1 "R" V 14857 2601 40  0000 C CNN
F 2 "~" V 14780 2600 30  0000 C CNN
F 3 "~" H 14850 2600 30  0000 C CNN
	1    14850 2600
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F638
P 14850 2750
F 0 "R?" V 14930 2750 40  0000 C CNN
F 1 "R" V 14857 2751 40  0000 C CNN
F 2 "~" V 14780 2750 30  0000 C CNN
F 3 "~" H 14850 2750 30  0000 C CNN
	1    14850 2750
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F63E
P 14850 2900
F 0 "R?" V 14930 2900 40  0000 C CNN
F 1 "R" V 14857 2901 40  0000 C CNN
F 2 "~" V 14780 2900 30  0000 C CNN
F 3 "~" H 14850 2900 30  0000 C CNN
	1    14850 2900
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F644
P 14850 3050
F 0 "R?" V 14930 3050 40  0000 C CNN
F 1 "R" V 14857 3051 40  0000 C CNN
F 2 "~" V 14780 3050 30  0000 C CNN
F 3 "~" H 14850 3050 30  0000 C CNN
	1    14850 3050
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F64A
P 14850 3200
F 0 "R?" V 14930 3200 40  0000 C CNN
F 1 "R" V 14857 3201 40  0000 C CNN
F 2 "~" V 14780 3200 30  0000 C CNN
F 3 "~" H 14850 3200 30  0000 C CNN
	1    14850 3200
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F650
P 14850 3350
F 0 "R?" V 14930 3350 40  0000 C CNN
F 1 "R" V 14857 3351 40  0000 C CNN
F 2 "~" V 14780 3350 30  0000 C CNN
F 3 "~" H 14850 3350 30  0000 C CNN
	1    14850 3350
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F656
P 14850 3500
F 0 "R?" V 14930 3500 40  0000 C CNN
F 1 "R" V 14857 3501 40  0000 C CNN
F 2 "~" V 14780 3500 30  0000 C CNN
F 3 "~" H 14850 3500 30  0000 C CNN
	1    14850 3500
	0    -1   -1   0   
$EndComp
Text Label 14400 2450 0    60   Italic 12
b12
Text Label 14400 2600 0    60   Italic 12
b13
Text Label 14400 2750 0    60   Italic 12
b14
Text Label 14400 2900 0    60   Italic 12
b15
Text Label 14400 3050 0    60   Italic 12
b16
Text Label 14400 3200 0    60   Italic 12
b17
Text Label 14400 3350 0    60   Italic 12
b18
Text Label 14400 3500 0    60   Italic 12
b19
$Comp
L VCC #PWR?
U 1 1 5436F980
P 15300 2300
F 0 "#PWR?" H 15300 2400 30  0001 C CNN
F 1 "VCC" H 15300 2400 30  0000 C CNN
F 2 "" H 15300 2300 60  0000 C CNN
F 3 "" H 15300 2300 60  0000 C CNN
	1    15300 2300
	1    0    0    -1  
$EndComp
$Comp
L 7400 U?
U 2 1 54370EA9
P 13700 3950
F 0 "U?" H 13700 4000 60  0000 C CNN
F 1 "7400" H 13700 3850 60  0000 C CNN
F 2 "~" H 13700 3950 60  0000 C CNN
F 3 "~" H 13700 3950 60  0000 C CNN
	2    13700 3950
	1    0    0    -1  
$EndComp
$Comp
L 7400 U?
U 3 1 54370EB6
P 13700 4650
F 0 "U?" H 13700 4700 60  0000 C CNN
F 1 "7400" H 13700 4550 60  0000 C CNN
F 2 "~" H 13700 4650 60  0000 C CNN
F 3 "~" H 13700 4650 60  0000 C CNN
	3    13700 4650
	1    0    0    -1  
$EndComp
Text Label 14850 3950 2    60   Italic 12
/banken
$Comp
L 74LS32 U?
U 3 1 54371EFE
P 13700 5150
F 0 "U?" H 13700 5200 60  0000 C CNN
F 1 "74LS32" H 13700 5100 60  0000 C CNN
F 2 "~" H 13700 5150 60  0000 C CNN
F 3 "~" H 13700 5150 60  0000 C CNN
	3    13700 5150
	1    0    0    -1  
$EndComp
Text Label 14850 5150 2    60   Italic 12
/bankwr
Text Label 6200 2150 0    60   Italic 12
/iorq
Text Label 6850 750  0    60   Italic 12
/reset
Text Label 6850 1150 0    60   Italic 12
/wr
Text Label 9200 2450 0    60   Italic 12
/iorq
$Comp
L 74LS32 U?
U 1 1 5437590A
P 1850 5050
F 0 "U?" H 1850 5100 60  0000 C CNN
F 1 "74LS32" H 1850 5000 60  0000 C CNN
F 2 "~" H 1850 5050 60  0000 C CNN
F 3 "~" H 1850 5050 60  0000 C CNN
	1    1850 5050
	-1   0    0    1   
$EndComp
Wire Wire Line
	8450 2950 8650 2950
Wire Wire Line
	8450 2850 8650 2850
Wire Wire Line
	8450 2750 8650 2750
Wire Wire Line
	8450 2650 8650 2650
Wire Wire Line
	8450 2550 8650 2550
Wire Wire Line
	8450 2450 8650 2450
Wire Wire Line
	8450 2350 8650 2350
Wire Wire Line
	8450 2250 8650 2250
Wire Wire Line
	8450 2150 8650 2150
Wire Wire Line
	8450 2050 8650 2050
Wire Wire Line
	8450 1950 8650 1950
Wire Wire Line
	8450 1850 8650 1850
Wire Wire Line
	8450 3750 8650 3750
Wire Wire Line
	8450 3650 8650 3650
Wire Wire Line
	8450 3550 8650 3550
Wire Wire Line
	8450 4250 8650 4250
Wire Wire Line
	8450 4150 8650 4150
Wire Wire Line
	8450 4050 8650 4050
Wire Wire Line
	8450 3950 8650 3950
Wire Wire Line
	8450 3850 8650 3850
Wire Wire Line
	5150 1850 5350 1850
Wire Wire Line
	5150 1950 5350 1950
Wire Wire Line
	5150 2050 5350 2050
Wire Wire Line
	5150 2150 5350 2150
Wire Wire Line
	5150 2250 5350 2250
Wire Wire Line
	5150 2350 5350 2350
Wire Wire Line
	5150 2450 5350 2450
Wire Wire Line
	5150 2550 5350 2550
Wire Wire Line
	1200 1850 1000 1850
Wire Wire Line
	1000 1950 1200 1950
Wire Wire Line
	1200 2050 1000 2050
Wire Wire Line
	1200 2150 1000 2150
Wire Wire Line
	1200 2250 1000 2250
Wire Wire Line
	1200 2350 1000 2350
Wire Wire Line
	1200 2450 1000 2450
Wire Wire Line
	1200 2550 1000 2550
Wire Wire Line
	1200 2650 1000 2650
Wire Wire Line
	1200 2750 1000 2750
Wire Wire Line
	1200 2850 1000 2850
Wire Wire Line
	1200 2950 1000 2950
Wire Wire Line
	2600 1850 2800 1850
Wire Wire Line
	2600 1950 2800 1950
Wire Wire Line
	2600 2050 2800 2050
Wire Wire Line
	2600 2150 2800 2150
Wire Wire Line
	2600 2250 2800 2250
Wire Wire Line
	2600 2350 2800 2350
Wire Wire Line
	2600 2450 2800 2450
Wire Wire Line
	2600 2550 2800 2550
Wire Wire Line
	3750 1850 3550 1850
Wire Wire Line
	3750 1950 3550 1950
Wire Wire Line
	3750 2050 3550 2050
Wire Wire Line
	3750 2150 3550 2150
Wire Wire Line
	3750 2250 3550 2250
Wire Wire Line
	3750 2350 3550 2350
Wire Wire Line
	3750 2450 3550 2450
Wire Wire Line
	3750 2550 3550 2550
Wire Wire Line
	3750 2650 3550 2650
Wire Wire Line
	3750 2750 3550 2750
Wire Wire Line
	3750 2850 3550 2850
Wire Wire Line
	1000 3450 1200 3450
Wire Wire Line
	1200 3650 1200 5050
Wire Wire Line
	1200 3050 1000 3050
Wire Wire Line
	1200 3150 1000 3150
Wire Wire Line
	1200 3250 1000 3250
Wire Wire Line
	3550 2950 3750 2950
Wire Wire Line
	3550 3050 3750 3050
Wire Wire Line
	3550 3150 3750 3150
Wire Wire Line
	3550 3250 3750 3250
Wire Wire Line
	3550 3350 3750 3350
Wire Wire Line
	3550 3450 3750 3450
Wire Wire Line
	9200 1750 9550 1750
Wire Wire Line
	9200 1850 9550 1850
Wire Wire Line
	9200 1950 9550 1950
Wire Wire Line
	9200 2250 9550 2250
Wire Wire Line
	9200 2350 9550 2350
Wire Wire Line
	6550 2150 6200 2150
Wire Wire Line
	9200 2450 9550 2450
Wire Wire Line
	3750 3850 3550 3850
Wire Wire Line
	6550 3650 6400 3650
Wire Wire Line
	6400 3650 6400 2950
Wire Wire Line
	6400 2950 6550 2950
Wire Wire Line
	6550 3450 6150 3450
Wire Wire Line
	6150 750  6150 3450
Wire Wire Line
	6150 3450 6150 5750
Wire Wire Line
	6550 3150 5950 3150
Wire Wire Line
	5950 3150 5950 5750
Wire Wire Line
	6550 2050 5700 2050
Wire Wire Line
	5700 2050 5700 4950
Wire Wire Line
	6550 1850 5600 1850
Wire Wire Line
	5600 1850 5600 5650
Wire Wire Line
	3100 3950 3750 3950
Wire Wire Line
	3750 3750 3450 3750
Wire Wire Line
	3450 3750 3450 5150
Wire Wire Line
	3750 3650 3350 3650
Wire Wire Line
	3350 3650 3350 4950
Wire Wire Line
	8450 3050 8650 3050
Wire Wire Line
	8450 3150 8650 3150
Wire Wire Line
	8450 3250 8650 3250
Wire Wire Line
	8450 3350 8650 3350
Wire Wire Line
	13550 1650 13750 1650
Wire Wire Line
	13550 1750 13750 1750
Wire Wire Line
	13550 1850 13750 1850
Wire Wire Line
	13550 1950 13750 1950
Wire Wire Line
	15550 1600 15750 1600
Wire Wire Line
	15550 1700 15750 1700
Wire Wire Line
	15550 1800 15750 1800
Wire Wire Line
	15550 1900 15750 1900
Wire Wire Line
	12250 1650 12050 1650
Wire Wire Line
	12250 1750 12050 1750
Wire Wire Line
	12250 1850 12050 1850
Wire Wire Line
	12250 1950 12050 1950
Wire Wire Line
	14250 1600 14050 1600
Wire Wire Line
	14250 1700 14050 1700
Wire Wire Line
	14250 1800 14050 1800
Wire Wire Line
	14250 1900 14050 1900
Wire Wire Line
	14250 1100 14050 1100
Wire Wire Line
	14250 1200 14050 1200
Wire Wire Line
	14250 1300 14050 1300
Wire Wire Line
	14250 1400 14050 1400
Wire Wire Line
	12250 1150 12050 1150
Wire Wire Line
	12250 1250 12050 1250
Wire Wire Line
	12250 1350 12050 1350
Wire Wire Line
	12250 1450 12050 1450
Wire Wire Line
	12200 2450 12000 2450
Wire Wire Line
	12200 2550 12000 2550
Wire Wire Line
	12200 2650 12000 2650
Wire Wire Line
	12200 2750 12000 2750
Wire Wire Line
	12200 2850 12000 2850
Wire Wire Line
	12200 2950 12000 2950
Wire Wire Line
	12200 3050 12000 3050
Wire Wire Line
	12200 3150 12000 3150
Wire Wire Line
	13600 2450 13800 2450
Wire Wire Line
	13600 2550 13800 2550
Wire Wire Line
	13600 2650 13800 2650
Wire Wire Line
	13600 2750 13800 2750
Wire Wire Line
	13600 2850 13800 2850
Wire Wire Line
	13600 2950 13800 2950
Wire Wire Line
	13600 3050 13800 3050
Wire Wire Line
	13600 3150 13800 3150
Wire Wire Line
	14400 2450 14600 2450
Wire Wire Line
	14400 2600 14600 2600
Wire Wire Line
	14400 3200 14600 3200
Wire Wire Line
	14400 2750 14600 2750
Wire Wire Line
	14400 3350 14600 3350
Wire Wire Line
	14400 2900 14600 2900
Wire Wire Line
	14400 3050 14600 3050
Wire Wire Line
	14400 3500 14600 3500
Wire Wire Line
	12200 3350 11750 3350
Wire Wire Line
	14300 3950 14400 3950
Wire Wire Line
	14400 3950 14850 3950
Wire Wire Line
	14400 3950 14400 4350
Wire Wire Line
	13000 4050 13100 4050
Wire Wire Line
	12200 3450 11750 3450
Wire Wire Line
	3550 3850 3550 4750
Wire Wire Line
	6150 750  9550 750 
Connection ~ 6150 3450
Wire Wire Line
	12650 3850 13100 3850
Wire Wire Line
	3100 1150 6450 1150
Wire Wire Line
	6450 1150 9250 1150
Wire Wire Line
	6550 2250 6450 2250
Wire Wire Line
	6450 2250 6450 1150
Wire Wire Line
	6550 2350 5800 2350
Wire Wire Line
	1100 4750 3550 4750
Wire Wire Line
	3550 4750 5800 4750
Wire Wire Line
	5800 4750 8300 4750
Wire Wire Line
	10750 2450 11200 2450
Wire Wire Line
	10750 2350 11200 2350
Wire Wire Line
	10750 2250 11200 2250
Wire Wire Line
	10750 2150 11200 2150
Wire Wire Line
	10750 2050 11200 2050
Wire Wire Line
	10750 1950 11200 1950
Wire Wire Line
	10750 1850 11200 1850
Wire Wire Line
	5800 2350 5800 4750
Wire Wire Line
	1100 4750 1100 3550
Wire Wire Line
	1100 3550 1200 3550
Connection ~ 5800 4750
Connection ~ 3550 4750
Wire Wire Line
	3100 1150 3100 3950
Connection ~ 6450 1150
Connection ~ 14400 3950
Wire Wire Line
	14300 5150 14850 5150
Wire Wire Line
	1200 5050 1250 5050
Wire Wire Line
	5700 4950 3350 4950
Wire Wire Line
	3350 4950 2450 4950
Connection ~ 3350 4950
Text Label 3550 4950 0    60   Italic 12
/mreq
$Comp
L 7400 U?
U 1 1 54376642
P 1900 4200
F 0 "U?" H 1900 4250 60  0000 C CNN
F 1 "7400" H 1900 4100 60  0000 C CNN
F 2 "~" H 1900 4200 60  0000 C CNN
F 3 "~" H 1900 4200 60  0000 C CNN
	1    1900 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 4100 1300 4200
Wire Wire Line
	1300 4200 1300 4300
Wire Wire Line
	1300 4200 800  4200
Connection ~ 1300 4200
Text Label 800  4200 0    60   Italic 12
b19
Wire Wire Line
	2500 4200 2600 4200
Wire Wire Line
	2600 4200 2600 5150
Wire Wire Line
	3450 5150 2600 5150
Wire Wire Line
	2600 5150 2450 5150
Connection ~ 2600 5150
Wire Wire Line
	6550 3950 6400 3950
Wire Wire Line
	6400 3950 6400 5750
Wire Wire Line
	6550 3250 6050 3250
Wire Wire Line
	6050 3250 6050 5750
Wire Wire Line
	15300 3500 15100 3500
Wire Wire Line
	15300 3350 15100 3350
Wire Wire Line
	15300 2300 15300 2450
Wire Wire Line
	15300 2450 15300 2600
Wire Wire Line
	15300 2600 15300 2750
Wire Wire Line
	15300 2750 15300 2900
Wire Wire Line
	15300 2900 15300 3050
Wire Wire Line
	15300 3050 15300 3200
Wire Wire Line
	15300 3200 15300 3350
Wire Wire Line
	15300 3350 15300 3500
Wire Wire Line
	15100 3200 15300 3200
Connection ~ 15300 3350
Wire Wire Line
	15100 3050 15300 3050
Connection ~ 15300 3200
Wire Wire Line
	15100 2900 15300 2900
Connection ~ 15300 3050
Wire Wire Line
	15100 2750 15300 2750
Connection ~ 15300 2900
Wire Wire Line
	15100 2600 15300 2600
Connection ~ 15300 2750
Wire Wire Line
	15100 2450 15300 2450
Connection ~ 15300 2600
Connection ~ 15300 2450
Text Label 11200 1750 2    60   Italic 12
/banksel
Wire Wire Line
	10750 1750 11200 1750
Wire Wire Line
	12650 5050 13100 5050
Text Label 12650 5050 0    60   Italic 12
/banksel
Wire Wire Line
	12650 5250 13100 5250
Text Label 12650 5250 0    60   Italic 12
/wr
Text Label 11750 3350 0    60   Italic 12
/banksel
Text Label 11750 3450 0    60   Italic 12
/rd
Wire Wire Line
	11850 850  12250 850 
Wire Wire Line
	13850 800  14250 800 
Text Label 11850 850  0    60   Italic 12
/banken
Text Label 13850 800  0    60   Italic 12
/banken
Wire Wire Line
	11850 950  12250 950 
Wire Wire Line
	13850 900  14250 900 
Text Label 11850 950  0    60   Italic 12
/bankwr
Text Label 13850 900  0    60   Italic 12
/bankwr
Wire Wire Line
	13000 4050 13000 4250
Wire Wire Line
	13000 4250 14300 4250
Wire Wire Line
	14300 4250 14300 4650
Wire Wire Line
	14400 4350 13000 4350
Wire Wire Line
	13000 4350 13000 4550
Wire Wire Line
	13000 4550 13100 4550
Wire Wire Line
	13100 4750 12650 4750
Text Label 12650 4750 0    60   Italic 12
/bankwr
Text Label 12650 3850 0    60   Italic 12
/reset
$EndSCHEMATC
