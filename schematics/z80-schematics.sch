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
LIBS:xo-14s
EELAYER 24 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Dirac Z80 Single Board Computer"
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
P 1700 1750
F 0 "U?" H 1900 2750 70  0000 C CNN
F 1 "28C256" H 2000 750 70  0000 C CNN
F 2 "" H 1700 1750 60  0000 C CNN
F 3 "" H 1700 1750 60  0000 C CNN
	1    1700 1750
	1    0    0    -1  
$EndComp
$Comp
L 628128 U?
U 1 1 5435969B
P 4200 1850
F 0 "U?" H 4250 1850 70  0000 C CNN
F 1 "628128" H 4500 650 70  0000 C CNN
F 2 "" H 4200 1850 60  0000 C CNN
F 3 "" H 4200 1850 60  0000 C CNN
	1    4200 1850
	1    0    0    -1  
$EndComp
$Comp
L Z80-CPU U?
U 1 1 54359841
P 7600 2050
F 0 "U?" H 7600 3400 60  0000 C CNN
F 1 "Z80-CPU" H 7600 700 60  0000 C CNN
F 2 "" H 7600 2050 60  0000 C CNN
F 3 "" H 7600 2050 60  0000 C CNN
	1    7600 2050
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
NoConn ~ 6650 1750
NoConn ~ 6650 1550
Text Label 8750 2550 2    60   Italic 12
d0
Text Label 8750 2750 2    60   Italic 12
d2
Text Label 8750 2850 2    60   Italic 12
d3
Text Label 8750 2950 2    60   Italic 12
d4
Text Label 8750 3050 2    60   Italic 12
d5
Text Label 8750 2650 2    60   Italic 12
d1
Text Label 8750 3150 2    60   Italic 12
d6
Text Label 8750 3250 2    60   Italic 12
d7
Text Label 8750 850  2    60   Italic 12
a0
Text Label 8750 950  2    60   Italic 12
a1
Text Label 8750 1050 2    60   Italic 12
a2
Text Label 8750 1150 2    60   Italic 12
a3
Text Label 8750 1250 2    60   Italic 12
a4
Text Label 8750 1350 2    60   Italic 12
a5
Text Label 8750 1450 2    60   Italic 12
a6
Text Label 8750 1550 2    60   Italic 12
a7
Text Label 8750 1650 2    60   Italic 12
a8
Text Label 8750 1750 2    60   Italic 12
a9
Text Label 8750 1850 2    60   Italic 12
a10
Text Label 8750 1950 2    60   Italic 12
a11
Text Label 5100 800  2    60   Italic 12
d0
Text Label 5100 900  2    60   Italic 12
d1
Text Label 5100 1000 2    60   Italic 12
d2
Text Label 5100 1100 2    60   Italic 12
d3
Text Label 5100 1200 2    60   Italic 12
d4
Text Label 5100 1300 2    60   Italic 12
d5
Text Label 5100 1400 2    60   Italic 12
d6
Text Label 5100 1500 2    60   Italic 12
d7
Text Label 800  850  0    60   Italic 12
a0
Text Label 800  950  0    60   Italic 12
a1
Text Label 800  1050 0    60   Italic 12
a2
Text Label 800  1150 0    60   Italic 12
a3
Text Label 800  1250 0    60   Italic 12
a4
Text Label 800  1350 0    60   Italic 12
a5
Text Label 800  1450 0    60   Italic 12
a6
Text Label 800  1550 0    60   Italic 12
a7
Text Label 800  1650 0    60   Italic 12
a8
Text Label 800  1750 0    60   Italic 12
a9
Text Label 800  1850 0    60   Italic 12
a10
Text Label 800  1950 0    60   Italic 12
a11
Text Label 2600 850  2    60   Italic 12
d0
Text Label 2600 950  2    60   Italic 12
d1
Text Label 2600 1050 2    60   Italic 12
d2
Text Label 2600 1150 2    60   Italic 12
d3
Text Label 2600 1250 2    60   Italic 12
d4
Text Label 2600 1350 2    60   Italic 12
d5
Text Label 2600 1450 2    60   Italic 12
d6
Text Label 2600 1550 2    60   Italic 12
d7
Text Label 3300 800  0    60   Italic 12
a0
Text Label 3300 900  0    60   Italic 12
a1
Text Label 3300 1000 0    60   Italic 12
a2
Text Label 3300 1100 0    60   Italic 12
a3
Text Label 3300 1200 0    60   Italic 12
a4
Text Label 3300 1300 0    60   Italic 12
a5
Text Label 3300 1400 0    60   Italic 12
a6
Text Label 3300 1500 0    60   Italic 12
a7
Text Label 3300 1600 0    60   Italic 12
a8
Text Label 3300 1700 0    60   Italic 12
a9
Text Label 3300 1800 0    60   Italic 12
a10
$Comp
L VCC #PWR?
U 1 1 5435A5D9
P 800 2450
F 0 "#PWR?" H 800 2550 30  0001 C CNN
F 1 "VCC" H 800 2550 30  0000 C CNN
F 2 "" H 800 2450 60  0000 C CNN
F 3 "" H 800 2450 60  0000 C CNN
	1    800  2450
	1    0    0    -1  
$EndComp
Text Label 800  2050 0    60   Italic 12
b12
Text Label 800  2150 0    60   Italic 12
b13
Text Label 800  2250 0    60   Italic 12
b14
Text Label 3300 1900 0    60   Italic 12
a11
Text Label 3300 2000 0    60   Italic 12
b12
Text Label 3300 2100 0    60   Italic 12
b13
Text Label 3300 2200 0    60   Italic 12
b14
Text Label 3300 2300 0    60   Italic 12
b15
Text Label 3300 2400 0    60   Italic 12
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
P 6300 1950
F 0 "#PWR?" H 6300 2050 30  0001 C CNN
F 1 "VCC" H 6300 2050 30  0000 C CNN
F 2 "" H 6300 1950 60  0000 C CNN
F 3 "" H 6300 1950 60  0000 C CNN
	1    6300 1950
	1    0    0    -1  
$EndComp
NoConn ~ 6650 2750
Text Label 8750 2050 2    60   Italic 12
a12
Text Label 8750 2150 2    60   Italic 12
a13
Text Label 8750 2250 2    60   Italic 12
a14
Text Label 8750 2350 2    60   Italic 12
a15
Text Label 3150 2800 0    60   Italic 12
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
Text Label 6300 1150 0    60   Italic 12
/iorq
Text Label 6300 2450 0    60   Italic 12
/reset
Text Label 6300 1250 0    60   Italic 12
/wr
Text Label 9200 2450 0    60   Italic 12
/iorq
$Comp
L 74LS32 U?
U 1 1 5437590A
P 1700 3450
F 0 "U?" H 1700 3500 60  0000 C CNN
F 1 "74LS32" H 1700 3400 60  0000 C CNN
F 2 "~" H 1700 3450 60  0000 C CNN
F 3 "~" H 1700 3450 60  0000 C CNN
	1    1700 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 1950 8750 1950
Wire Wire Line
	8550 1850 8750 1850
Wire Wire Line
	8550 1750 8750 1750
Wire Wire Line
	8550 1650 8750 1650
Wire Wire Line
	8550 1550 8750 1550
Wire Wire Line
	8550 1450 8750 1450
Wire Wire Line
	8550 1350 8750 1350
Wire Wire Line
	8550 1250 8750 1250
Wire Wire Line
	8550 1150 8750 1150
Wire Wire Line
	8550 1050 8750 1050
Wire Wire Line
	8550 950  8750 950 
Wire Wire Line
	8550 850  8750 850 
Wire Wire Line
	8550 2750 8750 2750
Wire Wire Line
	8550 2650 8750 2650
Wire Wire Line
	8550 2550 8750 2550
Wire Wire Line
	8550 3250 8750 3250
Wire Wire Line
	8550 3150 8750 3150
Wire Wire Line
	8550 3050 8750 3050
Wire Wire Line
	8550 2950 8750 2950
Wire Wire Line
	8550 2850 8750 2850
Wire Wire Line
	4900 800  5100 800 
Wire Wire Line
	4900 900  5100 900 
Wire Wire Line
	4900 1000 5100 1000
Wire Wire Line
	4900 1100 5100 1100
Wire Wire Line
	4900 1200 5100 1200
Wire Wire Line
	4900 1300 5100 1300
Wire Wire Line
	4900 1400 5100 1400
Wire Wire Line
	4900 1500 5100 1500
Wire Wire Line
	1000 850  800  850 
Wire Wire Line
	800  950  1000 950 
Wire Wire Line
	1000 1050 800  1050
Wire Wire Line
	1000 1150 800  1150
Wire Wire Line
	1000 1250 800  1250
Wire Wire Line
	1000 1350 800  1350
Wire Wire Line
	1000 1450 800  1450
Wire Wire Line
	1000 1550 800  1550
Wire Wire Line
	1000 1650 800  1650
Wire Wire Line
	1000 1750 800  1750
Wire Wire Line
	1000 1850 800  1850
Wire Wire Line
	1000 1950 800  1950
Wire Wire Line
	2400 850  2600 850 
Wire Wire Line
	2400 950  2600 950 
Wire Wire Line
	2400 1050 2600 1050
Wire Wire Line
	2400 1150 2600 1150
Wire Wire Line
	2400 1250 2600 1250
Wire Wire Line
	2400 1350 2600 1350
Wire Wire Line
	2400 1450 2600 1450
Wire Wire Line
	2400 1550 2600 1550
Wire Wire Line
	3500 800  3300 800 
Wire Wire Line
	3500 900  3300 900 
Wire Wire Line
	3500 1000 3300 1000
Wire Wire Line
	3500 1100 3300 1100
Wire Wire Line
	3500 1200 3300 1200
Wire Wire Line
	3500 1300 3300 1300
Wire Wire Line
	3500 1400 3300 1400
Wire Wire Line
	3500 1500 3300 1500
Wire Wire Line
	3500 1600 3300 1600
Wire Wire Line
	3500 1700 3300 1700
Wire Wire Line
	3500 1800 3300 1800
Wire Wire Line
	800  2450 1000 2450
Wire Wire Line
	1000 2050 800  2050
Wire Wire Line
	1000 2150 800  2150
Wire Wire Line
	1000 2250 800  2250
Wire Wire Line
	3300 1900 3500 1900
Wire Wire Line
	3300 2000 3500 2000
Wire Wire Line
	3300 2100 3500 2100
Wire Wire Line
	3300 2200 3500 2200
Wire Wire Line
	3300 2300 3500 2300
Wire Wire Line
	3300 2400 3500 2400
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
	6650 1150 6300 1150
Wire Wire Line
	9200 2450 9550 2450
Wire Wire Line
	3500 2800 3150 2800
Wire Wire Line
	6650 2650 6300 2650
Wire Wire Line
	6300 1950 6650 1950
Wire Wire Line
	6650 2450 6300 2450
Wire Wire Line
	6650 2150 6050 2150
Wire Wire Line
	6050 2150 6050 4750
Wire Wire Line
	6650 1050 6300 1050
Wire Wire Line
	6650 850  5700 850 
Wire Wire Line
	5700 850  5700 4650
Wire Wire Line
	3150 2900 3500 2900
Wire Wire Line
	3500 2700 3150 2700
Wire Wire Line
	3500 2600 3150 2600
Wire Wire Line
	8550 2050 8750 2050
Wire Wire Line
	8550 2150 8750 2150
Wire Wire Line
	8550 2250 8750 2250
Wire Wire Line
	8550 2350 8750 2350
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
	12650 3850 13100 3850
Wire Wire Line
	6650 1250 6300 1250
Wire Wire Line
	6650 1350 6300 1350
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
	800  2550 1000 2550
Connection ~ 14400 3950
Wire Wire Line
	14300 5150 14850 5150
Wire Wire Line
	2550 3450 2300 3450
Wire Wire Line
	800  3550 1100 3550
Text Label 800  3550 0    60   Italic 12
/mreq
$Comp
L 7400 U?
U 1 1 54376642
P 4050 3450
F 0 "U?" H 4050 3500 60  0000 C CNN
F 1 "7400" H 4050 3350 60  0000 C CNN
F 2 "~" H 4050 3450 60  0000 C CNN
F 3 "~" H 4050 3450 60  0000 C CNN
	1    4050 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3350 3450 3450
Wire Wire Line
	3450 3450 3450 3550
Wire Wire Line
	3450 3450 3150 3450
Connection ~ 3450 3450
Text Label 3150 3450 0    60   Italic 12
b19
Wire Wire Line
	4650 3450 4950 3450
Wire Wire Line
	1100 3350 800  3350
Wire Wire Line
	6650 2950 6300 2950
Wire Wire Line
	6650 2250 6300 2250
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
Text Label 3150 2900 0    60   Italic 12
/wr
Text Label 800  2550 0    60   Italic 12
/rd
Text Label 6300 1350 0    60   Italic 12
/rd
Text Label 3150 2600 0    60   Italic 12
/mreq
Text Label 6300 1050 0    60   Italic 12
/mreq
$Comp
L VCC #PWR?
U 1 1 5439C872
P 6300 2650
F 0 "#PWR?" H 6300 2750 30  0001 C CNN
F 1 "VCC" H 6300 2750 30  0000 C CNN
F 2 "" H 6300 2650 60  0000 C CNN
F 3 "" H 6300 2650 60  0000 C CNN
	1    6300 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	800  2650 1000 2650
Text Label 800  2650 0    60   Italic 12
/rom
Text Label 2550 3450 2    60   Italic 12
/rom
Text Label 4950 3450 2    60   Italic 12
/b19
Text Label 3150 2700 0    60   Italic 12
/b19
Text Label 800  3350 0    60   Italic 12
/b19
$Comp
L C C?
U 1 1 5439CD97
P 5050 6350
F 0 "C?" H 5050 6450 40  0000 L CNN
F 1 "C" H 5056 6265 40  0000 L CNN
F 2 "" H 5088 6200 30  0000 C CNN
F 3 "" H 5050 6350 60  0000 C CNN
	1    5050 6350
	1    0    0    -1  
$EndComp
$Comp
L LED D?
U 1 1 5439CDAB
P 1000 4650
F 0 "D?" H 1000 4750 50  0000 C CNN
F 1 "LED" H 1000 4550 50  0000 C CNN
F 2 "" H 1000 4650 60  0000 C CNN
F 3 "" H 1000 4650 60  0000 C CNN
	1    1000 4650
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5439CDBF
P 1000 5500
F 0 "R?" V 1080 5500 40  0000 C CNN
F 1 "R" V 1007 5501 40  0000 C CNN
F 2 "" V 930 5500 30  0000 C CNN
F 3 "" H 1000 5500 30  0000 C CNN
	1    1000 5500
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5439CDD1
P 1550 4650
F 0 "R?" V 1630 4650 40  0000 C CNN
F 1 "R" V 1557 4651 40  0000 C CNN
F 2 "" V 1480 4650 30  0000 C CNN
F 3 "" H 1550 4650 30  0000 C CNN
	1    1550 4650
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 5439CDDC
P 2250 4650
F 0 "R?" V 2330 4650 40  0000 C CNN
F 1 "R" V 2257 4651 40  0000 C CNN
F 2 "" V 2180 4650 30  0000 C CNN
F 3 "" H 2250 4650 30  0000 C CNN
	1    2250 4650
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 5439CDE9
P 1550 5500
F 0 "SW?" H 1700 5610 50  0000 C CNN
F 1 "SW_PUSH" H 1550 5420 50  0000 C CNN
F 2 "" H 1550 5500 60  0000 C CNN
F 3 "" H 1550 5500 60  0000 C CNN
	1    1550 5500
	0    1    1    0   
$EndComp
$Comp
L SW_PUSH SW?
U 1 1 5439CDFB
P 2400 5500
F 0 "SW?" H 2550 5610 50  0000 C CNN
F 1 "SW_PUSH" H 2400 5420 50  0000 C CNN
F 2 "" H 2400 5500 60  0000 C CNN
F 3 "" H 2400 5500 60  0000 C CNN
	1    2400 5500
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 5439CE08
P 2100 5500
F 0 "C?" H 2100 5600 40  0000 L CNN
F 1 "C" H 2106 5415 40  0000 L CNN
F 2 "" H 2138 5350 30  0000 C CNN
F 3 "" H 2100 5500 60  0000 C CNN
	1    2100 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 5900 2400 5800
Wire Wire Line
	2100 5900 2250 5900
Wire Wire Line
	2250 5900 2400 5900
Wire Wire Line
	2100 5900 2100 5700
Wire Wire Line
	2400 5050 2400 5200
Wire Wire Line
	2100 5050 2250 5050
Wire Wire Line
	2250 5050 2400 5050
Wire Wire Line
	2400 5050 2800 5050
Wire Wire Line
	2100 5050 2100 5300
Wire Wire Line
	2250 4900 2250 5050
Connection ~ 2250 5050
$Comp
L VCC #PWR?
U 1 1 5439D0BF
P 2250 4250
F 0 "#PWR?" H 2250 4350 30  0001 C CNN
F 1 "VCC" H 2250 4350 30  0000 C CNN
F 2 "" H 2250 4250 60  0000 C CNN
F 3 "" H 2250 4250 60  0000 C CNN
	1    2250 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5439D0D3
P 2250 6050
F 0 "#PWR?" H 2250 6050 30  0001 C CNN
F 1 "GND" H 2250 5980 30  0001 C CNN
F 2 "" H 2250 6050 60  0000 C CNN
F 3 "" H 2250 6050 60  0000 C CNN
	1    2250 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 6050 2250 5900
Connection ~ 2250 5900
Connection ~ 2400 5050
Wire Wire Line
	2250 4400 2250 4250
Text Label 2800 5050 2    60   Italic 12
/reset
Wire Wire Line
	1550 4900 1550 5050
Wire Wire Line
	1550 5050 1550 5200
$Comp
L VCC #PWR?
U 1 1 5439D481
P 1550 4250
F 0 "#PWR?" H 1550 4350 30  0001 C CNN
F 1 "VCC" H 1550 4350 30  0000 C CNN
F 2 "" H 1550 4250 60  0000 C CNN
F 3 "" H 1550 4250 60  0000 C CNN
	1    1550 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5439D495
P 1550 6050
F 0 "#PWR?" H 1550 6050 30  0001 C CNN
F 1 "GND" H 1550 5980 30  0001 C CNN
F 2 "" H 1550 6050 60  0000 C CNN
F 3 "" H 1550 6050 60  0000 C CNN
	1    1550 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5800 1550 6050
Wire Wire Line
	1550 4400 1550 4250
Wire Wire Line
	1550 5050 1950 5050
Connection ~ 1550 5050
Text Label 1950 5050 2    60   Italic 12
/nmi
Text Label 6300 2250 0    60   Italic 12
/nmi
$Comp
L VCC #PWR?
U 1 1 5439D74E
P 1000 4250
F 0 "#PWR?" H 1000 4350 30  0001 C CNN
F 1 "VCC" H 1000 4350 30  0000 C CNN
F 2 "" H 1000 4250 60  0000 C CNN
F 3 "" H 1000 4250 60  0000 C CNN
	1    1000 4250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5439D762
P 1000 6050
F 0 "#PWR?" H 1000 6050 30  0001 C CNN
F 1 "GND" H 1000 5980 30  0001 C CNN
F 2 "" H 1000 6050 60  0000 C CNN
F 3 "" H 1000 6050 60  0000 C CNN
	1    1000 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 5750 1000 6050
Wire Wire Line
	1000 4850 1000 5250
Wire Wire Line
	1000 4250 1000 4450
$Comp
L XO-14S X?
U 1 1 5439DA14
P 3600 5050
F 0 "X?" H 3360 5410 60  0000 C CNN
F 1 "XO-14S" H 3600 4680 60  0000 C CNN
F 2 "" H 3600 5050 60  0000 C CNN
F 3 "" H 3600 5050 60  0000 C CNN
	1    3600 5050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5439DA28
P 3000 6050
F 0 "#PWR?" H 3000 6050 30  0001 C CNN
F 1 "GND" H 3000 5980 30  0001 C CNN
F 2 "" H 3000 6050 60  0000 C CNN
F 3 "" H 3000 6050 60  0000 C CNN
	1    3000 6050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5439DA3C
P 3000 4250
F 0 "#PWR?" H 3000 4350 30  0001 C CNN
F 1 "VCC" H 3000 4350 30  0000 C CNN
F 2 "" H 3000 4250 60  0000 C CNN
F 3 "" H 3000 4250 60  0000 C CNN
	1    3000 4250
	1    0    0    -1  
$EndComp
NoConn ~ 4250 4800
Wire Wire Line
	3000 4850 3000 4250
Wire Wire Line
	3000 5250 3000 6050
Wire Wire Line
	4300 5150 4600 5150
Text Label 4600 5150 2    60   Italic 12
clk
Text Label 6300 2950 0    60   Italic 12
clk
$EndSCHEMATC
