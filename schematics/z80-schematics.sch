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
P 9950 3900
F 0 "U?" H 10050 4400 60  0000 C CNN
F 1 "74LS138" H 10100 3351 60  0000 C CNN
F 2 "~" H 9950 3900 60  0000 C CNN
F 3 "~" H 9950 3900 60  0000 C CNN
	1    9950 3900
	1    0    0    -1  
$EndComp
Text Label 9150 3550 0    60   Italic 12
a4
Text Label 9150 3650 0    60   Italic 12
a5
Text Label 9150 3750 0    60   Italic 12
a6
$Comp
L VCC #PWR?
U 1 1 5435ABA7
P 9150 4050
F 0 "#PWR?" H 9150 4150 30  0001 C CNN
F 1 "VCC" H 9150 4150 30  0000 C CNN
F 2 "" H 9150 4050 60  0000 C CNN
F 3 "" H 9150 4050 60  0000 C CNN
	1    9150 4050
	1    0    0    -1  
$EndComp
Text Label 9150 4150 0    60   Italic 12
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
P 14850 3350
F 0 "U?" H 14850 3150 60  0000 C CNN
F 1 "74LS540" H 14850 3050 60  0000 C CNN
F 2 "~" H 14850 3350 60  0000 C CNN
F 3 "~" H 14850 3350 60  0000 C CNN
	1    14850 3350
	1    0    0    -1  
$EndComp
$Comp
L 74LS289 U?
U 1 1 5436F327
P 12900 2100
F 0 "U?" H 13100 2700 70  0000 C CNN
F 1 "74LS289" H 13100 1400 70  0000 C CNN
F 2 "~" H 13350 1800 60  0000 C CNN
F 3 "~" H 13350 1800 60  0000 C CNN
	1    12900 2100
	1    0    0    -1  
$EndComp
$Comp
L 74LS289 U?
U 1 1 5436F336
P 12900 3500
F 0 "U?" H 13100 4100 70  0000 C CNN
F 1 "74LS289" H 13100 2800 70  0000 C CNN
F 2 "~" H 13350 3200 60  0000 C CNN
F 3 "~" H 13350 3200 60  0000 C CNN
	1    12900 3500
	1    0    0    -1  
$EndComp
Text Label 13750 2400 2    60   Italic 12
b12
Text Label 13750 2500 2    60   Italic 12
b13
Text Label 13750 2600 2    60   Italic 12
b14
Text Label 13750 2700 2    60   Italic 12
b15
Text Label 13750 3800 2    60   Italic 12
b16
Text Label 13750 3900 2    60   Italic 12
b17
Text Label 13750 4000 2    60   Italic 12
b18
Text Label 13750 4100 2    60   Italic 12
b19
Text Label 12050 2400 0    60   Italic 12
d0
Text Label 12050 2500 0    60   Italic 12
d1
Text Label 12050 2600 0    60   Italic 12
d2
Text Label 12050 2700 0    60   Italic 12
d3
Text Label 12050 3800 0    60   Italic 12
d4
Text Label 12050 3900 0    60   Italic 12
d5
Text Label 12050 4000 0    60   Italic 12
d6
Text Label 12050 4100 0    60   Italic 12
d7
Text Label 12050 1900 0    60   Italic 12
a12
Text Label 12050 2000 0    60   Italic 12
a13
Text Label 12050 2100 0    60   Italic 12
a14
Text Label 12050 2200 0    60   Italic 12
a15
Text Label 12050 3300 0    60   Italic 12
a12
Text Label 12050 3400 0    60   Italic 12
a13
Text Label 12050 3500 0    60   Italic 12
a14
Text Label 12050 3600 0    60   Italic 12
a15
Text Label 13950 2850 0    60   Italic 12
b12
Text Label 13950 2950 0    60   Italic 12
b13
Text Label 13950 3050 0    60   Italic 12
b14
Text Label 13950 3150 0    60   Italic 12
b15
Text Label 13950 3250 0    60   Italic 12
b16
Text Label 13950 3350 0    60   Italic 12
b17
Text Label 13950 3450 0    60   Italic 12
b18
Text Label 13950 3550 0    60   Italic 12
b19
Text Label 15750 2850 2    60   Italic 12
d0
Text Label 15750 2950 2    60   Italic 12
d1
Text Label 15750 3050 2    60   Italic 12
d2
Text Label 15750 3150 2    60   Italic 12
d3
Text Label 15750 3250 2    60   Italic 12
d4
Text Label 15750 3350 2    60   Italic 12
d5
Text Label 15750 3450 2    60   Italic 12
d6
Text Label 15750 3550 2    60   Italic 12
d7
$Comp
L R R?
U 1 1 5436F625
P 14850 1550
F 0 "R?" V 14930 1550 40  0000 C CNN
F 1 "R" V 14857 1551 40  0000 C CNN
F 2 "~" V 14780 1550 30  0000 C CNN
F 3 "~" H 14850 1550 30  0000 C CNN
	1    14850 1550
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F632
P 14850 1700
F 0 "R?" V 14930 1700 40  0000 C CNN
F 1 "R" V 14857 1701 40  0000 C CNN
F 2 "~" V 14780 1700 30  0000 C CNN
F 3 "~" H 14850 1700 30  0000 C CNN
	1    14850 1700
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F638
P 14850 1850
F 0 "R?" V 14930 1850 40  0000 C CNN
F 1 "R" V 14857 1851 40  0000 C CNN
F 2 "~" V 14780 1850 30  0000 C CNN
F 3 "~" H 14850 1850 30  0000 C CNN
	1    14850 1850
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F63E
P 14850 2000
F 0 "R?" V 14930 2000 40  0000 C CNN
F 1 "R" V 14857 2001 40  0000 C CNN
F 2 "~" V 14780 2000 30  0000 C CNN
F 3 "~" H 14850 2000 30  0000 C CNN
	1    14850 2000
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F644
P 14850 2150
F 0 "R?" V 14930 2150 40  0000 C CNN
F 1 "R" V 14857 2151 40  0000 C CNN
F 2 "~" V 14780 2150 30  0000 C CNN
F 3 "~" H 14850 2150 30  0000 C CNN
	1    14850 2150
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F64A
P 14850 2300
F 0 "R?" V 14930 2300 40  0000 C CNN
F 1 "R" V 14857 2301 40  0000 C CNN
F 2 "~" V 14780 2300 30  0000 C CNN
F 3 "~" H 14850 2300 30  0000 C CNN
	1    14850 2300
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 5436F650
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
U 1 1 5436F656
P 14850 2600
F 0 "R?" V 14930 2600 40  0000 C CNN
F 1 "R" V 14857 2601 40  0000 C CNN
F 2 "~" V 14780 2600 30  0000 C CNN
F 3 "~" H 14850 2600 30  0000 C CNN
	1    14850 2600
	0    -1   -1   0   
$EndComp
Text Label 14400 1550 0    60   Italic 12
b12
Text Label 14400 1700 0    60   Italic 12
b13
Text Label 14400 1850 0    60   Italic 12
b14
Text Label 14400 2000 0    60   Italic 12
b15
Text Label 14400 2150 0    60   Italic 12
b16
Text Label 14400 2300 0    60   Italic 12
b17
Text Label 14400 2450 0    60   Italic 12
b18
Text Label 14400 2600 0    60   Italic 12
b19
$Comp
L VCC #PWR?
U 1 1 5436F980
P 15300 1400
F 0 "#PWR?" H 15300 1500 30  0001 C CNN
F 1 "VCC" H 15300 1500 30  0000 C CNN
F 2 "" H 15300 1400 60  0000 C CNN
F 3 "" H 15300 1400 60  0000 C CNN
	1    15300 1400
	1    0    0    -1  
$EndComp
$Comp
L 7400 U?
U 2 1 54370EA9
P 10250 1600
F 0 "U?" H 10250 1650 60  0000 C CNN
F 1 "7400" H 10250 1500 60  0000 C CNN
F 2 "~" H 10250 1600 60  0000 C CNN
F 3 "~" H 10250 1600 60  0000 C CNN
	2    10250 1600
	1    0    0    -1  
$EndComp
$Comp
L 7400 U?
U 3 1 54370EB6
P 10250 2200
F 0 "U?" H 10250 2250 60  0000 C CNN
F 1 "7400" H 10250 2100 60  0000 C CNN
F 2 "~" H 10250 2200 60  0000 C CNN
F 3 "~" H 10250 2200 60  0000 C CNN
	3    10250 2200
	-1   0    0    1   
$EndComp
Text Label 11550 1600 2    60   Italic 12
/banken
$Comp
L 74LS32 U?
U 3 1 54371EFE
P 10250 2800
F 0 "U?" H 10250 2850 60  0000 C CNN
F 1 "74LS32" H 10250 2750 60  0000 C CNN
F 2 "~" H 10250 2800 60  0000 C CNN
F 3 "~" H 10250 2800 60  0000 C CNN
	3    10250 2800
	1    0    0    -1  
$EndComp
Text Label 11550 2800 2    60   Italic 12
/bankwr
Text Label 6850 950  0    60   Italic 12
/iorq
Text Label 6850 750  0    60   Italic 12
/reset
Text Label 6850 1150 0    60   Italic 12
/wr
Text Label 9050 4250 0    60   Italic 12
/iorq
Text Label 11950 4950 0    60   Italic 12
/banksel
Text Label 11950 4750 0    60   Italic 12
/rd
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
	9150 3550 9350 3550
Wire Wire Line
	9150 3650 9350 3650
Wire Wire Line
	9150 3750 9350 3750
Wire Wire Line
	9150 4050 9350 4050
Wire Wire Line
	9150 4150 9350 4150
Wire Wire Line
	6550 2150 6300 2150
Wire Wire Line
	6300 2150 6300 950 
Wire Wire Line
	8950 950  8950 4250
Wire Wire Line
	8950 4250 9350 4250
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
	13550 2400 13750 2400
Wire Wire Line
	13550 2500 13750 2500
Wire Wire Line
	13550 2600 13750 2600
Wire Wire Line
	13550 2700 13750 2700
Wire Wire Line
	13550 3800 13750 3800
Wire Wire Line
	13550 3900 13750 3900
Wire Wire Line
	13550 4000 13750 4000
Wire Wire Line
	13550 4100 13750 4100
Wire Wire Line
	12250 2400 12050 2400
Wire Wire Line
	12250 2500 12050 2500
Wire Wire Line
	12250 2600 12050 2600
Wire Wire Line
	12250 2700 12050 2700
Wire Wire Line
	12250 3800 12050 3800
Wire Wire Line
	12250 3900 12050 3900
Wire Wire Line
	12250 4000 12050 4000
Wire Wire Line
	12250 4100 12050 4100
Wire Wire Line
	12250 3300 12050 3300
Wire Wire Line
	12250 3400 12050 3400
Wire Wire Line
	12250 3500 12050 3500
Wire Wire Line
	12250 3600 12050 3600
Wire Wire Line
	12250 1900 12050 1900
Wire Wire Line
	12250 2000 12050 2000
Wire Wire Line
	12250 2100 12050 2100
Wire Wire Line
	12250 2200 12050 2200
Wire Wire Line
	14150 2850 13950 2850
Wire Wire Line
	14150 2950 13950 2950
Wire Wire Line
	14150 3050 13950 3050
Wire Wire Line
	14150 3150 13950 3150
Wire Wire Line
	14150 3250 13950 3250
Wire Wire Line
	14150 3350 13950 3350
Wire Wire Line
	14150 3450 13950 3450
Wire Wire Line
	14150 3550 13950 3550
Wire Wire Line
	15550 2850 15750 2850
Wire Wire Line
	15550 2950 15750 2950
Wire Wire Line
	15550 3050 15750 3050
Wire Wire Line
	15550 3150 15750 3150
Wire Wire Line
	15550 3250 15750 3250
Wire Wire Line
	15550 3350 15750 3350
Wire Wire Line
	15550 3450 15750 3450
Wire Wire Line
	15550 3550 15750 3550
Wire Wire Line
	14400 1550 14600 1550
Wire Wire Line
	14400 1700 14600 1700
Wire Wire Line
	14400 2300 14600 2300
Wire Wire Line
	14400 1850 14600 1850
Wire Wire Line
	14400 2450 14600 2450
Wire Wire Line
	14400 2000 14600 2000
Wire Wire Line
	14400 2150 14600 2150
Wire Wire Line
	14400 2600 14600 2600
Wire Wire Line
	14150 3750 14000 3750
Wire Wire Line
	14000 3750 14000 4950
Wire Wire Line
	6300 950  8950 950 
Wire Wire Line
	10850 1600 10950 1600
Wire Wire Line
	10950 1600 11650 1600
Wire Wire Line
	11650 1600 12200 1600
Wire Wire Line
	11650 1600 11650 3000
Wire Wire Line
	11650 3000 12200 3000
Connection ~ 11650 1600
Wire Wire Line
	10950 1600 10950 2300
Wire Wire Line
	9550 2200 9650 2200
Wire Wire Line
	9550 1700 9550 2200
Wire Wire Line
	9550 1700 9650 1700
Wire Wire Line
	14150 3850 14100 3850
Wire Wire Line
	14100 3850 14100 4750
Wire Wire Line
	3550 3850 3550 4750
Wire Wire Line
	12200 1700 11550 1700
Wire Wire Line
	11550 1700 11550 2800
Wire Wire Line
	11550 2800 11550 3100
Wire Wire Line
	11550 3100 12200 3100
Connection ~ 11550 2800
Wire Wire Line
	6150 750  9550 750 
Connection ~ 6150 3450
Wire Wire Line
	9550 750  9550 1500
Wire Wire Line
	9550 1500 9650 1500
Wire Wire Line
	3100 1150 6450 1150
Wire Wire Line
	6450 1150 9250 1150
Wire Wire Line
	9250 1150 9250 2900
Wire Wire Line
	9250 2900 9650 2900
Wire Wire Line
	6550 2250 6450 2250
Wire Wire Line
	6450 2250 6450 1150
Wire Wire Line
	6550 2350 5800 2350
Wire Wire Line
	14100 4750 5800 4750
Wire Wire Line
	5800 4750 3550 4750
Wire Wire Line
	3550 4750 1100 4750
Wire Wire Line
	10550 4250 10950 4250
Wire Wire Line
	10950 4250 10950 5500
Wire Wire Line
	10550 4150 11050 4150
Wire Wire Line
	11050 4150 11050 5500
Wire Wire Line
	10550 4050 11150 4050
Wire Wire Line
	11150 4050 11150 5500
Wire Wire Line
	10550 3950 11250 3950
Wire Wire Line
	11250 3950 11250 5500
Wire Wire Line
	10550 3850 11350 3850
Wire Wire Line
	11350 3850 11350 5500
Wire Wire Line
	10550 3750 11450 3750
Wire Wire Line
	11450 3750 11450 5500
Wire Wire Line
	10550 3650 11550 3650
Wire Wire Line
	11550 3650 11550 5500
Wire Wire Line
	10550 3550 11650 3550
Wire Wire Line
	11650 3300 11650 3550
Wire Wire Line
	11650 3550 11650 4950
Wire Wire Line
	9650 2700 9450 2700
Wire Wire Line
	9450 2700 9450 3300
Wire Wire Line
	9450 3300 11650 3300
Connection ~ 11650 3550
Wire Wire Line
	11650 4950 14000 4950
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
Wire Wire Line
	10950 2300 10850 2300
Connection ~ 10950 1600
Wire Wire Line
	10850 2100 11050 2100
Wire Wire Line
	11050 2100 11050 2800
Wire Wire Line
	10850 2800 11550 2800
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
	15300 2600 15100 2600
Wire Wire Line
	15300 2450 15100 2450
Wire Wire Line
	15300 1400 15300 1550
Wire Wire Line
	15300 1550 15300 1700
Wire Wire Line
	15300 1700 15300 1850
Wire Wire Line
	15300 1850 15300 2000
Wire Wire Line
	15300 2000 15300 2150
Wire Wire Line
	15300 2150 15300 2300
Wire Wire Line
	15300 2300 15300 2450
Wire Wire Line
	15300 2450 15300 2600
Wire Wire Line
	15100 2300 15300 2300
Connection ~ 15300 2450
Wire Wire Line
	15100 2150 15300 2150
Connection ~ 15300 2300
Wire Wire Line
	15100 2000 15300 2000
Connection ~ 15300 2150
Wire Wire Line
	15100 1850 15300 1850
Connection ~ 15300 2000
Wire Wire Line
	15100 1700 15300 1700
Connection ~ 15300 1850
Wire Wire Line
	15100 1550 15300 1550
Connection ~ 15300 1700
Connection ~ 15300 1550
$EndSCHEMATC
