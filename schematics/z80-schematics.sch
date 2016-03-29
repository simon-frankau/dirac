EESchema Schematic File Version 2
LIBS:z80-schematics-rescue
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
LIBS:z80-schematics-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Dirac Z80 Single Board Computer"
Date "23 may 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 28C256-RESCUE-z80-schematics U3
U 1 1 54359578
P 1700 1750
F 0 "U3" H 1900 2750 70  0000 C CNN
F 1 "28C256" H 2000 750 70  0000 C CNN
F 2 "" H 1700 1750 60  0000 C CNN
F 3 "" H 1700 1750 60  0000 C CNN
	1    1700 1750
	1    0    0    -1  
$EndComp
$Comp
L 628128 U2
U 1 1 5435969B
P 4200 1850
F 0 "U2" H 4250 1850 70  0000 C CNN
F 1 "628128" H 4500 650 70  0000 C CNN
F 2 "" H 4200 1850 60  0000 C CNN
F 3 "" H 4200 1850 60  0000 C CNN
	1    4200 1850
	1    0    0    -1  
$EndComp
$Comp
L Z80-CPU U1
U 1 1 54359841
P 7600 2050
F 0 "U1" H 7600 3400 60  0000 C CNN
F 1 "Z80-CPU" H 7600 700 60  0000 C CNN
F 2 "" H 7600 2050 60  0000 C CNN
F 3 "" H 7600 2050 60  0000 C CNN
	1    7600 2050
	1    0    0    -1  
$EndComp
$Comp
L Z80-CTC U10
U 1 1 54359876
P 7600 4950
F 0 "U10" H 7600 6050 60  0000 C CNN
F 1 "Z80-CTC" H 7600 3850 60  0000 C CNN
F 2 "" H 7600 4950 60  0000 C CNN
F 3 "" H 7600 4950 60  0000 C CNN
	1    7600 4950
	1    0    0    -1  
$EndComp
$Comp
L Z80-SIO/0 U11
U 1 1 54359885
P 10250 5000
F 0 "U11" H 10250 6200 60  0000 C CNN
F 1 "Z80-SIO/0" H 10250 3800 60  0000 C CNN
F 2 "" H 10250 5000 60  0000 C CNN
F 3 "" H 10250 5000 60  0000 C CNN
	1    10250 5000
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
L 74LS138 U6
U 1 1 5435AB03
P 10150 2100
F 0 "U6" H 10250 2600 60  0000 C CNN
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
L 74LS540 U7
U 1 1 5436E9B5
P 12900 2950
F 0 "U7" H 12900 2750 60  0000 C CNN
F 1 "74LS540" H 12900 2650 60  0000 C CNN
F 2 "~" H 12900 2950 60  0000 C CNN
F 3 "~" H 12900 2950 60  0000 C CNN
	1    12900 2950
	1    0    0    -1  
$EndComp
$Comp
L 74LS289 U4
U 1 1 5436F327
P 12900 1350
F 0 "U4" H 13100 1950 70  0000 C CNN
F 1 "74LS289" H 13100 650 70  0000 C CNN
F 2 "~" H 13350 1050 60  0000 C CNN
F 3 "~" H 13350 1050 60  0000 C CNN
	1    12900 1350
	1    0    0    -1  
$EndComp
$Comp
L 74LS289 U5
U 1 1 5436F336
P 14900 1300
F 0 "U5" H 15100 1900 70  0000 C CNN
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
L R-RESCUE-z80-schematics R1
U 1 1 5436F625
P 14850 2450
F 0 "R1" V 14930 2450 40  0000 C CNN
F 1 "10k" V 14857 2451 40  0000 C CNN
F 2 "~" V 14780 2450 30  0000 C CNN
F 3 "~" H 14850 2450 30  0000 C CNN
	1    14850 2450
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-z80-schematics R2
U 1 1 5436F632
P 14850 2600
F 0 "R2" V 14930 2600 40  0000 C CNN
F 1 "10k" V 14857 2601 40  0000 C CNN
F 2 "~" V 14780 2600 30  0000 C CNN
F 3 "~" H 14850 2600 30  0000 C CNN
	1    14850 2600
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-z80-schematics R3
U 1 1 5436F638
P 14850 2750
F 0 "R3" V 14930 2750 40  0000 C CNN
F 1 "10k" V 14857 2751 40  0000 C CNN
F 2 "~" V 14780 2750 30  0000 C CNN
F 3 "~" H 14850 2750 30  0000 C CNN
	1    14850 2750
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-z80-schematics R4
U 1 1 5436F63E
P 14850 2900
F 0 "R4" V 14930 2900 40  0000 C CNN
F 1 "10k" V 14857 2901 40  0000 C CNN
F 2 "~" V 14780 2900 30  0000 C CNN
F 3 "~" H 14850 2900 30  0000 C CNN
	1    14850 2900
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-z80-schematics R5
U 1 1 5436F644
P 14850 3050
F 0 "R5" V 14930 3050 40  0000 C CNN
F 1 "10k" V 14857 3051 40  0000 C CNN
F 2 "~" V 14780 3050 30  0000 C CNN
F 3 "~" H 14850 3050 30  0000 C CNN
	1    14850 3050
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-z80-schematics R6
U 1 1 5436F64A
P 14850 3200
F 0 "R6" V 14930 3200 40  0000 C CNN
F 1 "10k" V 14857 3201 40  0000 C CNN
F 2 "~" V 14780 3200 30  0000 C CNN
F 3 "~" H 14850 3200 30  0000 C CNN
	1    14850 3200
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-z80-schematics R7
U 1 1 5436F650
P 14850 3350
F 0 "R7" V 14930 3350 40  0000 C CNN
F 1 "10k" V 14857 3351 40  0000 C CNN
F 2 "~" V 14780 3350 30  0000 C CNN
F 3 "~" H 14850 3350 30  0000 C CNN
	1    14850 3350
	0    -1   -1   0   
$EndComp
$Comp
L R-RESCUE-z80-schematics R8
U 1 1 5436F656
P 14850 3500
F 0 "R8" V 14930 3500 40  0000 C CNN
F 1 "10k" V 14857 3501 40  0000 C CNN
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
L 7400 U8
U 2 1 54370EA9
P 13700 3950
F 0 "U8" H 13700 4000 60  0000 C CNN
F 1 "7400" H 13700 3850 60  0000 C CNN
F 2 "~" H 13700 3950 60  0000 C CNN
F 3 "~" H 13700 3950 60  0000 C CNN
	2    13700 3950
	1    0    0    -1  
$EndComp
$Comp
L 7400 U8
U 3 1 54370EB6
P 13700 4650
F 0 "U8" H 13700 4700 60  0000 C CNN
F 1 "7400" H 13700 4550 60  0000 C CNN
F 2 "~" H 13700 4650 60  0000 C CNN
F 3 "~" H 13700 4650 60  0000 C CNN
	3    13700 4650
	1    0    0    -1  
$EndComp
Text Label 14850 3950 2    60   Italic 12
/banken
$Comp
L 74LS32 U9
U 3 1 54371EFE
P 13700 5150
F 0 "U9" H 13700 5200 60  0000 C CNN
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
L 74LS32 U9
U 1 1 5437590A
P 1700 3450
F 0 "U9" H 1700 3500 60  0000 C CNN
F 1 "74LS32" H 1700 3400 60  0000 C CNN
F 2 "~" H 1700 3450 60  0000 C CNN
F 3 "~" H 1700 3450 60  0000 C CNN
	1    1700 3450
	1    0    0    -1  
$EndComp
Text Label 800  3550 0    60   Italic 12
/mreq
$Comp
L 7400 U8
U 1 1 54376642
P 4050 3450
F 0 "U8" H 4050 3500 60  0000 C CNN
F 1 "7400" H 4050 3350 60  0000 C CNN
F 2 "~" H 4050 3450 60  0000 C CNN
F 3 "~" H 4050 3450 60  0000 C CNN
	1    4050 3450
	1    0    0    -1  
$EndComp
Text Label 3150 3450 0    60   Italic 12
b19
Text Label 11200 1750 2    60   Italic 12
/banksel
Text Label 12650 5050 0    60   Italic 12
/banksel
Text Label 12650 5250 0    60   Italic 12
/wr
Text Label 11750 3350 0    60   Italic 12
/banksel
Text Label 11750 3450 0    60   Italic 12
/rd
Text Label 11850 850  0    60   Italic 12
/banken
Text Label 13850 800  0    60   Italic 12
/banken
Text Label 11850 950  0    60   Italic 12
/bankwr
Text Label 13850 900  0    60   Italic 12
/bankwr
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
L LED-RESCUE-z80-schematics D1
U 1 1 5439CDAB
P 1000 4650
F 0 "D1" H 1000 4750 50  0000 C CNN
F 1 "LED" H 1000 4550 50  0000 C CNN
F 2 "" H 1000 4650 60  0000 C CNN
F 3 "" H 1000 4650 60  0000 C CNN
	1    1000 4650
	0    1    1    0   
$EndComp
$Comp
L R-RESCUE-z80-schematics R9
U 1 1 5439CDBF
P 1000 5500
F 0 "R9" V 1080 5500 40  0000 C CNN
F 1 "10k" V 1007 5501 40  0000 C CNN
F 2 "" V 930 5500 30  0000 C CNN
F 3 "" H 1000 5500 30  0000 C CNN
	1    1000 5500
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-z80-schematics R10
U 1 1 5439CDD1
P 1550 4650
F 0 "R10" V 1630 4650 40  0000 C CNN
F 1 "10k" V 1557 4651 40  0000 C CNN
F 2 "" V 1480 4650 30  0000 C CNN
F 3 "" H 1550 4650 30  0000 C CNN
	1    1550 4650
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-z80-schematics R11
U 1 1 5439CDDC
P 2250 4650
F 0 "R11" V 2330 4650 40  0000 C CNN
F 1 "10k" V 2257 4651 40  0000 C CNN
F 2 "" V 2180 4650 30  0000 C CNN
F 3 "" H 2250 4650 30  0000 C CNN
	1    2250 4650
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW1
U 1 1 5439CDE9
P 1550 5500
F 0 "SW1" H 1700 5610 50  0000 C CNN
F 1 "SW_PUSH" H 1550 5420 50  0000 C CNN
F 2 "" H 1550 5500 60  0000 C CNN
F 3 "" H 1550 5500 60  0000 C CNN
	1    1550 5500
	0    1    1    0   
$EndComp
$Comp
L SW_PUSH SW2
U 1 1 5439CDFB
P 2400 5500
F 0 "SW2" H 2550 5610 50  0000 C CNN
F 1 "SW_PUSH" H 2400 5420 50  0000 C CNN
F 2 "" H 2400 5500 60  0000 C CNN
F 3 "" H 2400 5500 60  0000 C CNN
	1    2400 5500
	0    1    1    0   
$EndComp
$Comp
L C-RESCUE-z80-schematics C15
U 1 1 5439CE08
P 2100 5500
F 0 "C15" H 2100 5600 40  0000 L CNN
F 1 "C" H 2106 5415 40  0000 L CNN
F 2 "" H 2138 5350 30  0000 C CNN
F 3 "" H 2100 5500 60  0000 C CNN
	1    2100 5500
	1    0    0    -1  
$EndComp
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
L GND-RESCUE-z80-schematics #PWR?
U 1 1 5439D0D3
P 2250 6050
F 0 "#PWR?" H 2250 6050 30  0001 C CNN
F 1 "GND" H 2250 5980 30  0001 C CNN
F 2 "" H 2250 6050 60  0000 C CNN
F 3 "" H 2250 6050 60  0000 C CNN
	1    2250 6050
	1    0    0    -1  
$EndComp
Text Label 2800 5050 2    60   Italic 12
/reset
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
L GND-RESCUE-z80-schematics #PWR?
U 1 1 5439D495
P 1550 6050
F 0 "#PWR?" H 1550 6050 30  0001 C CNN
F 1 "GND" H 1550 5980 30  0001 C CNN
F 2 "" H 1550 6050 60  0000 C CNN
F 3 "" H 1550 6050 60  0000 C CNN
	1    1550 6050
	1    0    0    -1  
$EndComp
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
L GND-RESCUE-z80-schematics #PWR?
U 1 1 5439D762
P 1000 6050
F 0 "#PWR?" H 1000 6050 30  0001 C CNN
F 1 "GND" H 1000 5980 30  0001 C CNN
F 2 "" H 1000 6050 60  0000 C CNN
F 3 "" H 1000 6050 60  0000 C CNN
	1    1000 6050
	1    0    0    -1  
$EndComp
$Comp
L XO-14S X1
U 1 1 5439DA14
P 4100 5050
F 0 "X1" H 3860 5410 60  0000 C CNN
F 1 "XO-14S" H 4100 4680 60  0000 C CNN
F 2 "" H 4100 5050 60  0000 C CNN
F 3 "" H 4100 5050 60  0000 C CNN
	1    4100 5050
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-z80-schematics #PWR?
U 1 1 5439DA28
P 3500 6050
F 0 "#PWR?" H 3500 6050 30  0001 C CNN
F 1 "GND" H 3500 5980 30  0001 C CNN
F 2 "" H 3500 6050 60  0000 C CNN
F 3 "" H 3500 6050 60  0000 C CNN
	1    3500 6050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR?
U 1 1 5439DA3C
P 3500 4250
F 0 "#PWR?" H 3500 4350 30  0001 C CNN
F 1 "VCC" H 3500 4350 30  0000 C CNN
F 2 "" H 3500 4250 60  0000 C CNN
F 3 "" H 3500 4250 60  0000 C CNN
	1    3500 4250
	1    0    0    -1  
$EndComp
NoConn ~ 4750 4800
Text Label 5100 5150 2    60   Italic 12
clk
Text Label 6300 2950 0    60   Italic 12
clk
Text Label 6500 4000 0    60   Italic 12
d0
Text Label 6500 4100 0    60   Italic 12
d1
Text Label 6500 4200 0    60   Italic 12
d2
Text Label 6500 4300 0    60   Italic 12
d3
Text Label 6500 4400 0    60   Italic 12
d4
Text Label 6500 4500 0    60   Italic 12
d5
Text Label 6500 4700 0    60   Italic 12
d7
Text Label 6500 4600 0    60   Italic 12
d6
Text Label 9150 3950 0    60   Italic 12
d0
Text Label 9150 4050 0    60   Italic 12
d1
Text Label 9150 4150 0    60   Italic 12
d2
Text Label 9150 4250 0    60   Italic 12
d3
Text Label 9150 4350 0    60   Italic 12
d4
Text Label 9150 4450 0    60   Italic 12
d5
Text Label 9150 4550 0    60   Italic 12
d6
Text Label 9150 4650 0    60   Italic 12
d7
Text Label 6300 5400 0    60   Italic 12
/rd
Text Label 8700 4200 2    60   Italic 12
to0
Text Label 11350 4050 2    60   Italic 12
to0
Text Label 8700 4700 2    60   Italic 12
to1
Text Label 11350 5350 2    60   Italic 12
to1
Text Label 6300 5300 0    60   Italic 12
/iorq
Text Label 9050 5150 0    60   Italic 12
/iorq
Text Label 8700 5100 2    60   Italic 12
to2
Text Label 8700 5400 2    60   Italic 12
to2
Text Label 6400 5700 0    60   Italic 12
ieo
Text Label 9050 5750 0    60   Italic 12
ieo
Text Label 6300 2150 0    60   Italic 12
/int
Text Label 9050 5650 0    60   Italic 12
/int
Text Label 6400 5800 0    60   Italic 12
/int
$Comp
L VCC #PWR?
U 1 1 54443902
P 6200 5500
F 0 "#PWR?" H 6200 5600 30  0001 C CNN
F 1 "VCC" H 6200 5600 30  0000 C CNN
F 2 "" H 6200 5500 60  0000 C CNN
F 3 "" H 6200 5500 60  0000 C CNN
	1    6200 5500
	1    0    0    -1  
$EndComp
Text Label 6300 850  0    60   Italic 12
/m1
Text Label 6300 5200 0    60   Italic 12
/m1
Text Label 9050 5050 0    60   Italic 12
/m1
Text Label 9050 6050 0    60   Italic 12
clk
Text Label 6400 5900 0    60   Italic 12
clk
$Comp
L VCC #PWR?
U 1 1 54443E22
P 3000 4250
F 0 "#PWR?" H 3000 4350 30  0001 C CNN
F 1 "VCC" H 3000 4350 30  0000 C CNN
F 2 "" H 3000 4250 60  0000 C CNN
F 3 "" H 3000 4250 60  0000 C CNN
	1    3000 4250
	1    0    0    -1  
$EndComp
$Comp
L R-RESCUE-z80-schematics R12
U 1 1 54443E36
P 3000 4650
F 0 "R12" V 3080 4650 40  0000 C CNN
F 1 "R" V 3007 4651 40  0000 C CNN
F 2 "" V 2930 4650 30  0000 C CNN
F 3 "" H 3000 4650 30  0000 C CNN
	1    3000 4650
	1    0    0    -1  
$EndComp
Text Label 3300 5050 2    60   Italic 12
/int
Text Label 6300 4900 0    60   Italic 12
/ctcsel
Text Label 11200 1850 2    60   Italic 12
/ctcsel
Text Label 9050 4950 0    60   Italic 12
/reset
Text Label 8800 5800 2    60   Italic 12
/reset
Text Label 6300 5000 0    60   Italic 12
a0
Text Label 6300 5100 0    60   Italic 12
a1
Text Label 9050 5350 0    60   Italic 12
a0
Text Label 9050 5450 0    60   Italic 12
a1
NoConn ~ 8500 5000
NoConn ~ 8500 4600
NoConn ~ 8500 4100
$Comp
L CONN_6 P1
U 1 1 54444BA4
P 10900 6700
F 0 "P1" V 10850 6700 60  0000 C CNN
F 1 "FTDI SERIAL" V 10950 6700 60  0000 C CNN
F 2 "" H 10900 6700 60  0000 C CNN
F 3 "" H 10900 6700 60  0000 C CNN
	1    10900 6700
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-z80-schematics #PWR?
U 1 1 54444BB8
P 10150 6500
F 0 "#PWR?" H 10150 6500 30  0001 C CNN
F 1 "GND" H 10150 6430 30  0001 C CNN
F 2 "" H 10150 6500 60  0000 C CNN
F 3 "" H 10150 6500 60  0000 C CNN
	1    10150 6500
	1    0    0    -1  
$EndComp
Text Label 10250 6550 0    60   Italic 12
/cts
Text Label 10250 6750 0    60   Italic 12
txd
Text Label 10250 6850 0    60   Italic 12
rxd
Text Label 10250 6950 0    60   Italic 12
/rts
$Comp
L VCC #PWR?
U 1 1 5444534D
P 9450 6650
F 0 "#PWR?" H 9450 6750 30  0001 C CNN
F 1 "VCC" H 9450 6750 30  0000 C CNN
F 2 "" H 9450 6650 60  0000 C CNN
F 3 "" H 9450 6650 60  0000 C CNN
	1    9450 6650
	1    0    0    -1  
$EndComp
Text Label 11350 4250 2    60   Italic 12
to0
NoConn ~ 9350 5850
NoConn ~ 11150 4450
NoConn ~ 11150 4350
Text Label 11350 3950 2    60   Italic 12
txd
Text Label 11350 4150 2    60   Italic 12
rxd
Text Label 11350 4850 2    60   Italic 12
/cts
NoConn ~ 11150 4650
Text Label 11350 4750 2    60   Italic 12
/rts
$Comp
L GND-RESCUE-z80-schematics #PWR?
U 1 1 54445AE6
P 11350 5000
F 0 "#PWR?" H 11350 5000 30  0001 C CNN
F 1 "GND" H 11350 4930 30  0001 C CNN
F 2 "" H 11350 5000 60  0000 C CNN
F 3 "" H 11350 5000 60  0000 C CNN
	1    11350 5000
	1    0    0    -1  
$EndComp
NoConn ~ 11150 6050
NoConn ~ 11150 5850
NoConn ~ 11150 5750
NoConn ~ 11150 5950
NoConn ~ 11150 5250
NoConn ~ 11150 5150
NoConn ~ 11150 5450
NoConn ~ 11150 5550
Text Label 9050 5250 0    60   Italic 12
/rd
Text Label 9050 4850 0    60   Italic 12
/siosel
Text Label 11200 1950 2    60   Italic 12
/siosel
$Comp
L JUMPER JP1
U 1 1 54446078
P 9850 6650
F 0 "JP1" H 9850 6800 60  0000 C CNN
F 1 "USB POWER" H 9850 6570 40  0000 C CNN
F 2 "" H 9850 6650 60  0000 C CNN
F 3 "" H 9850 6650 60  0000 C CNN
	1    9850 6650
	1    0    0    -1  
$EndComp
$Comp
L 74LS574 U12
U 1 1 544466F5
P 7600 7300
F 0 "U12" H 7600 7300 60  0000 C CNN
F 1 "74LS574" H 7650 6950 60  0000 C CNN
F 2 "" H 7600 7300 60  0000 C CNN
F 3 "" H 7600 7300 60  0000 C CNN
	1    7600 7300
	1    0    0    -1  
$EndComp
Text Label 6700 6800 0    60   Italic 12
d0
Text Label 6700 6900 0    60   Italic 12
d1
Text Label 6700 7000 0    60   Italic 12
d2
Text Label 6700 7100 0    60   Italic 12
d3
Text Label 6700 7200 0    60   Italic 12
d4
Text Label 6700 7300 0    60   Italic 12
d5
Text Label 6700 7400 0    60   Italic 12
d6
Text Label 6700 7500 0    60   Italic 12
d7
$Comp
L 74LS541 U13
U 1 1 54446FFE
P 7600 8700
F 0 "U13" H 7600 9275 60  0000 C BNN
F 1 "74LS541" H 7600 8125 60  0000 C TNN
F 2 "" H 7600 8700 60  0000 C CNN
F 3 "" H 7600 8700 60  0000 C CNN
	1    7600 8700
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
	6650 2150 6300 2150
Wire Wire Line
	6650 1050 6300 1050
Wire Wire Line
	6650 850  6300 850 
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
	14300 3950 14850 3950
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
Wire Wire Line
	3450 3350 3450 3550
Wire Wire Line
	3450 3450 3150 3450
Connection ~ 3450 3450
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
	15300 2300 15300 3500
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
Wire Wire Line
	10750 1750 11200 1750
Wire Wire Line
	12650 5050 13100 5050
Wire Wire Line
	12650 5250 13100 5250
Wire Wire Line
	11850 850  12250 850 
Wire Wire Line
	13850 800  14250 800 
Wire Wire Line
	11850 950  12250 950 
Wire Wire Line
	13850 900  14250 900 
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
Wire Wire Line
	800  2650 1000 2650
Wire Wire Line
	2400 5900 2400 5800
Wire Wire Line
	2100 5900 2400 5900
Wire Wire Line
	2100 5900 2100 5700
Wire Wire Line
	2400 5050 2400 5200
Wire Wire Line
	2100 5050 2800 5050
Wire Wire Line
	2100 5050 2100 5300
Wire Wire Line
	2250 4900 2250 5050
Connection ~ 2250 5050
Wire Wire Line
	2250 6050 2250 5900
Connection ~ 2250 5900
Connection ~ 2400 5050
Wire Wire Line
	2250 4400 2250 4250
Wire Wire Line
	1550 4900 1550 5200
Wire Wire Line
	1550 5800 1550 6050
Wire Wire Line
	1550 4400 1550 4250
Wire Wire Line
	1550 5050 1950 5050
Connection ~ 1550 5050
Wire Wire Line
	1000 5750 1000 6050
Wire Wire Line
	1000 4850 1000 5250
Wire Wire Line
	1000 4250 1000 4450
Wire Wire Line
	3500 4850 3500 4250
Wire Wire Line
	3500 5250 3500 6050
Wire Wire Line
	4800 5150 5100 5150
Wire Wire Line
	9350 3950 9150 3950
Wire Wire Line
	9350 4050 9150 4050
Wire Wire Line
	9350 4150 9150 4150
Wire Wire Line
	9350 4250 9150 4250
Wire Wire Line
	9350 4350 9150 4350
Wire Wire Line
	9350 4450 9150 4450
Wire Wire Line
	9350 4550 9150 4550
Wire Wire Line
	9350 4650 9150 4650
Wire Wire Line
	6700 4000 6500 4000
Wire Wire Line
	6700 4100 6500 4100
Wire Wire Line
	6700 4200 6500 4200
Wire Wire Line
	6700 4300 6500 4300
Wire Wire Line
	6700 4400 6500 4400
Wire Wire Line
	6700 4500 6500 4500
Wire Wire Line
	6700 4600 6500 4600
Wire Wire Line
	6700 4700 6500 4700
Wire Wire Line
	6700 5400 6300 5400
Wire Wire Line
	8500 4200 8700 4200
Wire Wire Line
	11150 4050 11350 4050
Wire Wire Line
	8500 4700 8700 4700
Wire Wire Line
	11150 5350 11350 5350
Wire Wire Line
	6700 5300 6300 5300
Wire Wire Line
	9350 5150 9050 5150
Wire Wire Line
	8500 5100 8700 5100
Wire Wire Line
	8500 5400 8700 5400
Wire Wire Line
	6700 5700 6400 5700
Wire Wire Line
	9050 5750 9350 5750
Wire Wire Line
	9050 5650 9350 5650
Wire Wire Line
	6400 5800 6700 5800
Wire Wire Line
	6200 5500 6700 5500
Wire Wire Line
	9050 5050 9350 5050
Wire Wire Line
	6300 5200 6700 5200
Wire Wire Line
	6400 5900 6700 5900
Wire Wire Line
	9050 6050 9350 6050
Wire Wire Line
	3000 4250 3000 4400
Wire Wire Line
	3000 4900 3000 5050
Wire Wire Line
	3000 5050 3300 5050
Wire Wire Line
	6700 4900 6300 4900
Wire Wire Line
	8500 5800 8800 5800
Wire Wire Line
	9050 4950 9350 4950
Wire Wire Line
	6700 5000 6300 5000
Wire Wire Line
	6700 5100 6300 5100
Wire Wire Line
	9350 5350 9050 5350
Wire Wire Line
	9350 5450 9050 5450
Wire Wire Line
	10150 6450 10150 6500
Wire Wire Line
	10550 6450 10150 6450
Wire Wire Line
	10550 6550 10250 6550
Wire Wire Line
	10250 6750 10550 6750
Wire Wire Line
	10250 6850 10550 6850
Wire Wire Line
	10250 6950 10550 6950
Wire Wire Line
	11150 4250 11350 4250
Wire Wire Line
	11150 3950 11350 3950
Wire Wire Line
	11150 4150 11350 4150
Wire Wire Line
	11150 4850 11350 4850
Wire Wire Line
	11150 4750 11350 4750
Wire Wire Line
	11150 4950 11350 4950
Wire Wire Line
	11350 4950 11350 5000
Wire Wire Line
	9350 5250 9050 5250
Wire Wire Line
	9050 4850 9350 4850
Wire Wire Line
	9450 6650 9550 6650
Wire Wire Line
	10150 6650 10550 6650
Wire Wire Line
	6900 6800 6700 6800
Wire Wire Line
	6700 6900 6900 6900
Wire Wire Line
	6700 7000 6900 7000
Wire Wire Line
	6700 7100 6900 7100
Wire Wire Line
	6700 7200 6900 7200
Wire Wire Line
	6700 7300 6900 7300
Wire Wire Line
	6700 7400 6900 7400
Wire Wire Line
	6700 7500 6900 7500
Wire Wire Line
	6700 8200 6900 8200
Wire Wire Line
	6700 8300 6900 8300
Wire Wire Line
	6700 8400 6900 8400
Wire Wire Line
	6700 8500 6900 8500
Wire Wire Line
	6700 8600 6900 8600
Wire Wire Line
	6700 8700 6900 8700
Wire Wire Line
	6700 8800 6900 8800
Wire Wire Line
	6700 8900 6900 8900
Wire Wire Line
	8300 8200 8500 8200
Wire Wire Line
	8500 8300 8300 8300
Wire Wire Line
	8500 8400 8300 8400
Wire Wire Line
	8500 8500 8300 8500
Wire Wire Line
	8500 8600 8300 8600
Wire Wire Line
	8500 8700 8300 8700
Wire Wire Line
	8500 8800 8300 8800
Wire Wire Line
	8500 8900 8300 8900
Text Label 8500 8200 2    60   Italic 12
d0
Text Label 8500 8300 2    60   Italic 12
d1
Text Label 8500 8400 2    60   Italic 12
d2
Text Label 8500 8500 2    60   Italic 12
d3
Text Label 8500 8600 2    60   Italic 12
d4
Text Label 8500 8700 2    60   Italic 12
d5
Text Label 8500 8800 2    60   Italic 12
d6
Text Label 8500 8900 2    60   Italic 12
d7
$Comp
L C-RESCUE-z80-schematics C1
U 1 1 54448997
P 1000 6800
F 0 "C1" H 1000 6900 40  0000 L CNN
F 1 "C" H 1006 6715 40  0000 L CNN
F 2 "" H 1038 6650 30  0000 C CNN
F 3 "" H 1000 6800 60  0000 C CNN
	1    1000 6800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C2
U 1 1 544489AB
P 1300 6800
F 0 "C2" H 1300 6900 40  0000 L CNN
F 1 "C" H 1306 6715 40  0000 L CNN
F 2 "" H 1338 6650 30  0000 C CNN
F 3 "" H 1300 6800 60  0000 C CNN
	1    1300 6800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C3
U 1 1 544489BF
P 1600 6800
F 0 "C3" H 1600 6900 40  0000 L CNN
F 1 "C" H 1606 6715 40  0000 L CNN
F 2 "" H 1638 6650 30  0000 C CNN
F 3 "" H 1600 6800 60  0000 C CNN
	1    1600 6800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C4
U 1 1 544489D3
P 1900 6800
F 0 "C4" H 1900 6900 40  0000 L CNN
F 1 "C" H 1906 6715 40  0000 L CNN
F 2 "" H 1938 6650 30  0000 C CNN
F 3 "" H 1900 6800 60  0000 C CNN
	1    1900 6800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C5
U 1 1 544489E7
P 2200 6800
F 0 "C5" H 2200 6900 40  0000 L CNN
F 1 "C" H 2206 6715 40  0000 L CNN
F 2 "" H 2238 6650 30  0000 C CNN
F 3 "" H 2200 6800 60  0000 C CNN
	1    2200 6800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C6
U 1 1 544489FB
P 2500 6800
F 0 "C6" H 2500 6900 40  0000 L CNN
F 1 "C" H 2506 6715 40  0000 L CNN
F 2 "" H 2538 6650 30  0000 C CNN
F 3 "" H 2500 6800 60  0000 C CNN
	1    2500 6800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C7
U 1 1 54448A0F
P 2800 6800
F 0 "C7" H 2800 6900 40  0000 L CNN
F 1 "C" H 2806 6715 40  0000 L CNN
F 2 "" H 2838 6650 30  0000 C CNN
F 3 "" H 2800 6800 60  0000 C CNN
	1    2800 6800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C8
U 1 1 54448A23
P 1000 7800
F 0 "C8" H 1000 7900 40  0000 L CNN
F 1 "C" H 1006 7715 40  0000 L CNN
F 2 "" H 1038 7650 30  0000 C CNN
F 3 "" H 1000 7800 60  0000 C CNN
	1    1000 7800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C9
U 1 1 54448A37
P 1300 7800
F 0 "C9" H 1300 7900 40  0000 L CNN
F 1 "C" H 1306 7715 40  0000 L CNN
F 2 "" H 1338 7650 30  0000 C CNN
F 3 "" H 1300 7800 60  0000 C CNN
	1    1300 7800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C10
U 1 1 54448A4B
P 1600 7800
F 0 "C10" H 1600 7900 40  0000 L CNN
F 1 "C" H 1606 7715 40  0000 L CNN
F 2 "" H 1638 7650 30  0000 C CNN
F 3 "" H 1600 7800 60  0000 C CNN
	1    1600 7800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C11
U 1 1 54448A5F
P 1900 7800
F 0 "C11" H 1900 7900 40  0000 L CNN
F 1 "C" H 1906 7715 40  0000 L CNN
F 2 "" H 1938 7650 30  0000 C CNN
F 3 "" H 1900 7800 60  0000 C CNN
	1    1900 7800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C12
U 1 1 54448A73
P 2200 7800
F 0 "C12" H 2200 7900 40  0000 L CNN
F 1 "C" H 2206 7715 40  0000 L CNN
F 2 "" H 2238 7650 30  0000 C CNN
F 3 "" H 2200 7800 60  0000 C CNN
	1    2200 7800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C13
U 1 1 54448A87
P 2500 7800
F 0 "C13" H 2500 7900 40  0000 L CNN
F 1 "C" H 2506 7715 40  0000 L CNN
F 2 "" H 2538 7650 30  0000 C CNN
F 3 "" H 2500 7800 60  0000 C CNN
	1    2500 7800
	1    0    0    -1  
$EndComp
$Comp
L C-RESCUE-z80-schematics C14
U 1 1 54448A9B
P 2800 7800
F 0 "C14" H 2800 7900 40  0000 L CNN
F 1 "C" H 2806 7715 40  0000 L CNN
F 2 "" H 2838 7650 30  0000 C CNN
F 3 "" H 2800 7800 60  0000 C CNN
	1    2800 7800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 6600 1000 6500
Wire Wire Line
	1000 6500 2800 6500
Wire Wire Line
	2800 6500 2800 6600
Wire Wire Line
	1300 6600 1300 6500
Connection ~ 1300 6500
Wire Wire Line
	1600 6600 1600 6500
Connection ~ 1600 6500
Wire Wire Line
	1900 6400 1900 6600
Connection ~ 1900 6500
Wire Wire Line
	2200 6600 2200 6500
Connection ~ 2200 6500
Wire Wire Line
	2500 6600 2500 6500
Connection ~ 2500 6500
Wire Wire Line
	1000 7000 1000 7100
Wire Wire Line
	1000 7100 2800 7100
Wire Wire Line
	2800 7100 2800 7000
Wire Wire Line
	1300 7000 1300 7100
Connection ~ 1300 7100
Wire Wire Line
	1600 7000 1600 7100
Connection ~ 1600 7100
Wire Wire Line
	1900 7000 1900 7200
Connection ~ 1900 7100
Wire Wire Line
	2200 7000 2200 7100
Connection ~ 2200 7100
Wire Wire Line
	2500 7000 2500 7100
Connection ~ 2500 7100
$Comp
L VCC #PWR?
U 1 1 544499A7
P 1900 6400
F 0 "#PWR?" H 1900 6500 30  0001 C CNN
F 1 "VCC" H 1900 6500 30  0000 C CNN
F 2 "" H 1900 6400 60  0000 C CNN
F 3 "" H 1900 6400 60  0000 C CNN
	1    1900 6400
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-z80-schematics #PWR?
U 1 1 54449B07
P 1900 7200
F 0 "#PWR?" H 1900 7200 30  0001 C CNN
F 1 "GND" H 1900 7130 30  0001 C CNN
F 2 "" H 1900 7200 60  0000 C CNN
F 3 "" H 1900 7200 60  0000 C CNN
	1    1900 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 7600 1000 7500
Wire Wire Line
	1000 7500 2800 7500
Wire Wire Line
	2800 7500 2800 7600
Wire Wire Line
	1300 7600 1300 7500
Connection ~ 1300 7500
Wire Wire Line
	1600 7600 1600 7500
Connection ~ 1600 7500
Wire Wire Line
	1900 7400 1900 7600
Connection ~ 1900 7500
Wire Wire Line
	2200 7600 2200 7500
Connection ~ 2200 7500
Wire Wire Line
	2500 7600 2500 7500
Connection ~ 2500 7500
Wire Wire Line
	1000 8000 1000 8100
Wire Wire Line
	1000 8100 2800 8100
Wire Wire Line
	2800 8100 2800 8000
Wire Wire Line
	2500 8000 2500 8100
Connection ~ 2500 8100
Wire Wire Line
	2200 8000 2200 8100
Connection ~ 2200 8100
Wire Wire Line
	1900 8000 1900 8200
Connection ~ 1900 8100
Wire Wire Line
	1600 8000 1600 8100
Connection ~ 1600 8100
Wire Wire Line
	1300 8000 1300 8100
Connection ~ 1300 8100
$Comp
L VCC #PWR?
U 1 1 5444AC97
P 1900 7400
F 0 "#PWR?" H 1900 7500 30  0001 C CNN
F 1 "VCC" H 1900 7500 30  0000 C CNN
F 2 "" H 1900 7400 60  0000 C CNN
F 3 "" H 1900 7400 60  0000 C CNN
	1    1900 7400
	1    0    0    -1  
$EndComp
$Comp
L GND-RESCUE-z80-schematics #PWR?
U 1 1 5444ACAB
P 1900 8200
F 0 "#PWR?" H 1900 8200 30  0001 C CNN
F 1 "GND" H 1900 8130 30  0001 C CNN
F 2 "" H 1900 8200 60  0000 C CNN
F 3 "" H 1900 8200 60  0000 C CNN
	1    1900 8200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
