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
EELAYER 27 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Z80 Single Board Computer"
Date "8 oct 2014"
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
P 1900 2300
F 0 "U?" H 2100 3300 70  0000 C CNN
F 1 "28C256" H 2200 1300 70  0000 C CNN
F 2 "" H 1900 2300 60  0000 C CNN
F 3 "" H 1900 2300 60  0000 C CNN
	1    1900 2300
	1    0    0    -1  
$EndComp
$Comp
L 628128 U?
U 1 1 5435969B
P 4900 2450
F 0 "U?" H 4950 2450 70  0000 C CNN
F 1 "628128" H 5200 1250 70  0000 C CNN
F 2 "" H 4900 2450 60  0000 C CNN
F 3 "" H 4900 2450 60  0000 C CNN
	1    4900 2450
	1    0    0    -1  
$EndComp
$Comp
L Z80-CPU U?
U 1 1 54359841
P 8150 2600
F 0 "U?" H 8150 3950 60  0000 C CNN
F 1 "Z80-CPU" H 8150 1250 60  0000 C CNN
F 2 "" H 8150 2600 60  0000 C CNN
F 3 "" H 8150 2600 60  0000 C CNN
	1    8150 2600
	1    0    0    -1  
$EndComp
$Comp
L Z80-CTC U?
U 1 1 54359876
P 14800 2200
F 0 "U?" H 14800 3300 60  0000 C CNN
F 1 "Z80-CTC" H 14800 1100 60  0000 C CNN
F 2 "" H 14800 2200 60  0000 C CNN
F 3 "" H 14800 2200 60  0000 C CNN
	1    14800 2200
	1    0    0    -1  
$EndComp
$Comp
L Z80-SIO/0 U?
U 1 1 54359885
P 15350 5150
F 0 "U?" H 15350 6350 60  0000 C CNN
F 1 "Z80-SIO/0" H 15350 3950 60  0000 C CNN
F 2 "" H 15350 5150 60  0000 C CNN
F 3 "" H 15350 5150 60  0000 C CNN
	1    15350 5150
	1    0    0    -1  
$EndComp
NoConn ~ 7200 2300
NoConn ~ 7200 2100
Text Label 9300 3100 2    60   Italic 12
d0
Text Label 9300 3300 2    60   Italic 12
d2
Text Label 9300 3400 2    60   Italic 12
d3
Text Label 9300 3500 2    60   Italic 12
d4
Text Label 9300 3600 2    60   Italic 12
d5
Text Label 9300 3200 2    60   Italic 12
d1
Text Label 9300 3700 2    60   Italic 12
d6
Text Label 9300 3800 2    60   Italic 12
d7
Entry Wire Line
	9300 3100 9400 3200
Entry Wire Line
	9300 3200 9400 3300
Entry Wire Line
	9300 3300 9400 3400
Entry Wire Line
	9300 3400 9400 3500
Entry Wire Line
	9300 3500 9400 3600
Entry Wire Line
	9300 3600 9400 3700
Entry Wire Line
	9300 3700 9400 3800
Entry Wire Line
	9300 3800 9400 3900
Text Label 9300 1400 2    60   Italic 12
a0
Text Label 9300 1500 2    60   Italic 12
a1
Text Label 9300 1600 2    60   Italic 12
a2
Text Label 9300 1700 2    60   Italic 12
a3
Text Label 9300 1800 2    60   Italic 12
a4
Text Label 9300 1900 2    60   Italic 12
a5
Text Label 9300 2000 2    60   Italic 12
a6
Text Label 9300 2100 2    60   Italic 12
a7
Text Label 9300 2200 2    60   Italic 12
a8
Text Label 9300 2300 2    60   Italic 12
a9
Text Label 9300 2400 2    60   Italic 12
a10
Text Label 9300 2500 2    60   Italic 12
a11
Entry Wire Line
	9300 2500 9400 2400
Entry Wire Line
	9300 2400 9400 2300
Entry Wire Line
	9300 2300 9400 2200
Entry Wire Line
	9300 2200 9400 2100
Entry Wire Line
	9300 2100 9400 2000
Entry Wire Line
	9300 2000 9400 1900
Entry Wire Line
	9300 1900 9400 1800
Entry Wire Line
	9300 1800 9400 1700
Entry Wire Line
	9300 1700 9400 1600
Entry Wire Line
	9300 1600 9400 1500
Entry Wire Line
	9300 1500 9400 1400
Entry Wire Line
	9300 1400 9400 1300
Text Label 5800 1400 2    60   Italic 12
d0
Text Label 5800 1500 2    60   Italic 12
d1
Text Label 5800 1600 2    60   Italic 12
d2
Text Label 5800 1700 2    60   Italic 12
d3
Text Label 5800 1800 2    60   Italic 12
d4
Text Label 5800 1900 2    60   Italic 12
d5
Text Label 5800 2000 2    60   Italic 12
d6
Text Label 5800 2100 2    60   Italic 12
d7
Entry Wire Line
	5800 1400 5900 1500
Entry Wire Line
	5800 1500 5900 1600
Entry Wire Line
	5800 1600 5900 1700
Entry Wire Line
	5800 1700 5900 1800
Entry Wire Line
	5800 1800 5900 1900
Entry Wire Line
	5800 1900 5900 2000
Entry Wire Line
	5800 2000 5900 2100
Entry Wire Line
	5800 2100 5900 2200
Text Label 1000 1400 0    60   Italic 12
a0
Text Label 1000 1500 0    60   Italic 12
a1
Text Label 1000 1600 0    60   Italic 12
a2
Text Label 1000 1700 0    60   Italic 12
a3
Text Label 1000 1800 0    60   Italic 12
a4
Text Label 1000 1900 0    60   Italic 12
a5
Text Label 1000 2000 0    60   Italic 12
a6
Text Label 1000 2100 0    60   Italic 12
a7
Text Label 1000 2200 0    60   Italic 12
a8
Text Label 1000 2300 0    60   Italic 12
a9
Text Label 1000 2400 0    60   Italic 12
a10
Text Label 1000 2500 0    60   Italic 12
a11
Entry Wire Line
	900  1300 1000 1400
Entry Wire Line
	900  1400 1000 1500
Entry Wire Line
	900  1500 1000 1600
Entry Wire Line
	900  1600 1000 1700
Entry Wire Line
	900  1700 1000 1800
Entry Wire Line
	900  1800 1000 1900
Entry Wire Line
	900  1900 1000 2000
Entry Wire Line
	900  2000 1000 2100
Entry Wire Line
	900  2100 1000 2200
Entry Wire Line
	900  2200 1000 2300
Entry Wire Line
	900  2300 1000 2400
Entry Wire Line
	900  2400 1000 2500
Text Label 2800 1400 2    60   Italic 12
d0
Text Label 2800 1500 2    60   Italic 12
d1
Text Label 2800 1600 2    60   Italic 12
d2
Text Label 2800 1700 2    60   Italic 12
d3
Text Label 2800 1800 2    60   Italic 12
d4
Text Label 2800 1900 2    60   Italic 12
d5
Text Label 2800 2000 2    60   Italic 12
d6
Text Label 2800 2100 2    60   Italic 12
d7
Entry Wire Line
	2800 1400 2900 1500
Entry Wire Line
	2800 1500 2900 1600
Entry Wire Line
	2800 1600 2900 1700
Entry Wire Line
	2800 1700 2900 1800
Entry Wire Line
	2800 1800 2900 1900
Entry Wire Line
	2800 1900 2900 2000
Entry Wire Line
	2800 2000 2900 2100
Entry Wire Line
	2800 2100 2900 2200
Entry Wire Line
	3900 1300 4000 1400
Entry Wire Line
	3900 1400 4000 1500
Entry Wire Line
	3900 1500 4000 1600
Entry Wire Line
	3900 1600 4000 1700
Entry Wire Line
	3900 1700 4000 1800
Entry Wire Line
	3900 1800 4000 1900
Entry Wire Line
	3900 1900 4000 2000
Entry Wire Line
	3900 2000 4000 2100
Entry Wire Line
	3900 2100 4000 2200
Entry Wire Line
	3900 2200 4000 2300
Entry Wire Line
	3900 2300 4000 2400
Entry Wire Line
	3900 2400 4000 2500
Text Label 4000 1400 0    60   Italic 12
a0
Text Label 4000 1500 0    60   Italic 12
a1
Text Label 4000 1600 0    60   Italic 12
a2
Text Label 4000 1700 0    60   Italic 12
a3
Text Label 4000 1800 0    60   Italic 12
a4
Text Label 4000 1900 0    60   Italic 12
a5
Text Label 4000 2000 0    60   Italic 12
a6
Text Label 4000 2100 0    60   Italic 12
a7
Text Label 4000 2200 0    60   Italic 12
a8
Text Label 4000 2300 0    60   Italic 12
a9
Text Label 4000 2400 0    60   Italic 12
a10
Wire Wire Line
	9100 2500 9300 2500
Wire Wire Line
	9100 2400 9300 2400
Wire Wire Line
	9100 2300 9300 2300
Wire Wire Line
	9100 2200 9300 2200
Wire Wire Line
	9100 2100 9300 2100
Wire Wire Line
	9100 2000 9300 2000
Wire Wire Line
	9100 1900 9300 1900
Wire Wire Line
	9100 1800 9300 1800
Wire Wire Line
	9100 1700 9300 1700
Wire Wire Line
	9100 1600 9300 1600
Wire Wire Line
	9100 1500 9300 1500
Wire Wire Line
	9100 1400 9300 1400
Wire Bus Line
	9400 3200 9400 4100
Wire Wire Line
	9100 3300 9300 3300
Wire Wire Line
	9100 3200 9300 3200
Wire Wire Line
	9100 3100 9300 3100
Wire Wire Line
	9100 3800 9300 3800
Wire Wire Line
	9100 3700 9300 3700
Wire Wire Line
	9100 3600 9300 3600
Wire Wire Line
	9100 3500 9300 3500
Wire Wire Line
	9100 3400 9300 3400
Wire Wire Line
	5600 1400 5800 1400
Wire Wire Line
	5600 1500 5800 1500
Wire Wire Line
	5600 1600 5800 1600
Wire Wire Line
	5600 1700 5800 1700
Wire Wire Line
	5600 1800 5800 1800
Wire Wire Line
	5600 1900 5800 1900
Wire Wire Line
	5600 2000 5800 2000
Wire Wire Line
	5600 2100 5800 2100
Wire Wire Line
	1200 1400 1000 1400
Wire Wire Line
	1000 1500 1200 1500
Wire Wire Line
	1200 1600 1000 1600
Wire Wire Line
	1200 1700 1000 1700
Wire Wire Line
	1200 1800 1000 1800
Wire Wire Line
	1200 1900 1000 1900
Wire Wire Line
	1200 2000 1000 2000
Wire Wire Line
	1200 2100 1000 2100
Wire Wire Line
	1200 2200 1000 2200
Wire Wire Line
	1200 2300 1000 2300
Wire Wire Line
	1200 2400 1000 2400
Wire Wire Line
	1200 2500 1000 2500
Wire Bus Line
	900  1100 900  2400
Wire Wire Line
	2600 1400 2800 1400
Wire Wire Line
	2600 1500 2800 1500
Wire Wire Line
	2600 1600 2800 1600
Wire Wire Line
	2600 1700 2800 1700
Wire Wire Line
	2600 1800 2800 1800
Wire Wire Line
	2600 1900 2800 1900
Wire Wire Line
	2600 2000 2800 2000
Wire Wire Line
	2600 2100 2800 2100
Wire Wire Line
	4200 1400 4000 1400
Wire Wire Line
	4200 1500 4000 1500
Wire Wire Line
	4200 1600 4000 1600
Wire Wire Line
	4200 1700 4000 1700
Wire Wire Line
	4200 1800 4000 1800
Wire Wire Line
	4200 1900 4000 1900
Wire Wire Line
	4200 2000 4000 2000
Wire Wire Line
	4200 2100 4000 2100
Wire Wire Line
	4200 2200 4000 2200
Wire Wire Line
	4200 2300 4000 2300
Wire Wire Line
	4200 2400 4000 2400
Wire Bus Line
	3900 1100 3900 2400
Wire Bus Line
	900  1100 10700 1100
Wire Bus Line
	9400 1100 9400 2400
Wire Bus Line
	9400 4100 2900 4100
Wire Bus Line
	5900 1500 5900 4100
Wire Bus Line
	2900 4100 2900 1500
$Comp
L VCC #PWR?
U 1 1 5435A5D9
P 1000 3000
F 0 "#PWR?" H 1000 3100 30  0001 C CNN
F 1 "VCC" H 1000 3100 30  0000 C CNN
F 2 "" H 1000 3000 60  0000 C CNN
F 3 "" H 1000 3000 60  0000 C CNN
	1    1000 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 3000 1200 3000
Wire Wire Line
	1200 3200 1200 4500
Wire Wire Line
	1200 3100 1100 3100
Wire Bus Line
	700  900  700  2700
Wire Wire Line
	1200 2600 800  2600
Wire Wire Line
	1200 2700 800  2700
Wire Wire Line
	1200 2800 800  2800
Text Label 1000 2600 0    60   Italic 12
b12
Text Label 1000 2700 0    60   Italic 12
b13
Text Label 1000 2800 0    60   Italic 12
b14
Entry Wire Line
	700  2500 800  2600
Entry Wire Line
	700  2600 800  2700
Entry Wire Line
	700  2700 800  2800
Wire Bus Line
	700  900  8600 900 
Wire Wire Line
	4000 2500 4200 2500
Text Label 4000 2500 0    60   Italic 12
a11
Wire Bus Line
	3700 900  3700 2900
Wire Wire Line
	3800 2600 4200 2600
Wire Wire Line
	3800 2700 4200 2700
Wire Wire Line
	3800 2800 4200 2800
Wire Wire Line
	3800 2900 4200 2900
Wire Wire Line
	3800 3000 4200 3000
Text Label 4000 2600 0    60   Italic 12
b12
Text Label 4000 2700 0    60   Italic 12
b13
Text Label 4000 2800 0    60   Italic 12
b14
Text Label 4000 2900 0    60   Italic 12
b15
Text Label 4000 3000 0    60   Italic 12
b16
Entry Wire Line
	3700 2500 3800 2600
Entry Wire Line
	3700 2600 3800 2700
Entry Wire Line
	3700 2700 3800 2800
Entry Wire Line
	3700 2800 3800 2900
Entry Wire Line
	3700 2900 3800 3000
Entry Wire Line
	3700 2900 3800 3000
$Comp
L 74LS138 U?
U 1 1 5435AB03
P 11600 1750
F 0 "U?" H 11700 2250 60  0000 C CNN
F 1 "74LS138" H 11750 1201 60  0000 C CNN
F 2 "~" H 11600 1750 60  0000 C CNN
F 3 "~" H 11600 1750 60  0000 C CNN
	1    11600 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	11000 1400 10800 1400
Wire Wire Line
	11000 1500 10800 1500
Wire Wire Line
	11000 1600 10800 1600
Text Label 10800 1400 0    60   Italic 12
a4
Text Label 10800 1500 0    60   Italic 12
a5
Text Label 10800 1600 0    60   Italic 12
a6
$Comp
L VCC #PWR?
U 1 1 5435ABA7
P 10800 1900
F 0 "#PWR?" H 10800 2000 30  0001 C CNN
F 1 "VCC" H 10800 2000 30  0000 C CNN
F 2 "" H 10800 1900 60  0000 C CNN
F 3 "" H 10800 1900 60  0000 C CNN
	1    10800 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10800 1900 11000 1900
Wire Wire Line
	11000 2000 10800 2000
Text Label 10800 2000 0    60   Italic 12
a7
Entry Wire Line
	10700 1300 10800 1400
Entry Wire Line
	10700 1400 10800 1500
Entry Wire Line
	10700 1500 10800 1600
Entry Wire Line
	10700 1900 10800 2000
Wire Bus Line
	10700 1100 10700 1900
Wire Wire Line
	7200 1700 7000 1700
Wire Wire Line
	7000 1700 7000 700 
Wire Wire Line
	7000 700  10600 700 
Wire Wire Line
	10600 700  10600 2100
Wire Wire Line
	10600 2100 11000 2100
Wire Wire Line
	7200 1900 7100 1900
Wire Wire Line
	7100 1900 7100 4200
Wire Wire Line
	7200 1800 7000 1800
Wire Wire Line
	7000 1800 7000 4300
Wire Wire Line
	4200 3400 4000 3400
Wire Wire Line
	4000 3400 4000 4200
Wire Wire Line
	7100 4200 1100 4200
Connection ~ 4000 4200
Wire Wire Line
	1100 4200 1100 3100
$Comp
L VCC #PWR?
U 1 1 5435B495
P 6900 2500
F 0 "#PWR?" H 6900 2600 30  0001 C CNN
F 1 "VCC" H 6900 2600 30  0000 C CNN
F 2 "" H 6900 2500 60  0000 C CNN
F 3 "" H 6900 2500 60  0000 C CNN
	1    6900 2500
	1    0    0    -1  
$EndComp
NoConn ~ 7200 3300
Wire Wire Line
	7200 3200 6900 3200
Wire Wire Line
	6900 3200 6900 2500
Wire Wire Line
	6900 2500 7200 2500
Wire Wire Line
	7200 3500 7200 4600
Wire Wire Line
	7200 3000 6800 3000
Wire Wire Line
	6800 3000 6800 4600
Wire Wire Line
	7200 2800 6700 2800
Wire Wire Line
	6700 2800 6700 4600
Wire Wire Line
	7200 2700 6600 2700
Wire Wire Line
	6600 2700 6600 4600
Wire Wire Line
	7200 1600 6500 1600
Wire Wire Line
	6500 1600 6500 4600
Wire Wire Line
	7200 1400 6400 1400
Wire Wire Line
	6400 1400 6400 4600
Wire Wire Line
	4200 3500 4100 3500
Wire Wire Line
	4100 3500 4100 4550
Wire Wire Line
	4200 3300 3900 3300
Wire Wire Line
	3900 3300 3900 4550
Wire Wire Line
	4200 3200 3800 3200
Wire Wire Line
	3800 3200 3800 4600
Wire Wire Line
	9100 2600 9300 2600
Wire Wire Line
	9100 2700 9300 2700
Wire Wire Line
	9100 2800 9300 2800
Wire Wire Line
	9100 2900 9300 2900
Text Label 9300 2600 2    60   Italic 12
a12
Text Label 9300 2700 2    60   Italic 12
a13
Text Label 9300 2800 2    60   Italic 12
a14
Text Label 9300 2900 2    60   Italic 12
a15
Entry Wire Line
	9300 2600 9400 2700
Entry Wire Line
	9300 2700 9400 2800
Entry Wire Line
	9300 2800 9400 2900
Entry Wire Line
	9300 2900 9400 3000
Wire Bus Line
	9400 2700 9400 3100
Wire Bus Line
	9400 3100 10750 3100
Text Label 10800 2100 0    60   Italic 12
iorq
Text Label 5200 1100 0    60   Italic 12
a[0..11]
Text Label 5200 900  0    60   Italic 12
b[12..15]
Text Label 5200 4100 0    60   Italic 12
d[0..7]
Text Label 5200 4200 0    60   Italic 12
rd
$EndSCHEMATC
