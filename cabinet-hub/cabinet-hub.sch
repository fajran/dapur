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
LIBS:cabinet-hub-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_01X08 P1
U 1 1 57B64CE7
P 950 1450
F 0 "P1" H 950 1900 50  0000 C CNN
F 1 "Controller" V 1050 1450 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_S08B-XH-A_08x2.50mm_Angled" H 950 1450 50  0001 C CNN
F 3 "" H 950 1450 50  0000 C CNN
	1    950  1450
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR01
U 1 1 57B64D60
P 1250 1900
F 0 "#PWR01" H 1250 1650 50  0001 C CNN
F 1 "GND" H 1250 1750 50  0000 C CNN
F 2 "" H 1250 1900 50  0000 C CNN
F 3 "" H 1250 1900 50  0000 C CNN
	1    1250 1900
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR02
U 1 1 57B64D76
P 1250 1000
F 0 "#PWR02" H 1250 850 50  0001 C CNN
F 1 "+5V" H 1250 1140 50  0000 C CNN
F 2 "" H 1250 1000 50  0000 C CNN
F 3 "" H 1250 1000 50  0000 C CNN
	1    1250 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1250 1000 1250 1700
Wire Wire Line
	1250 1700 1150 1700
Wire Wire Line
	1150 1800 1250 1800
Wire Wire Line
	1250 1800 1250 1900
Text Label 1450 1600 2    60   ~ 0
In1
Text Label 1450 1500 2    60   ~ 0
In2
Text Label 1450 1400 2    60   ~ 0
In3
Text Label 1450 1300 2    60   ~ 0
In4
Text Label 1450 1200 2    60   ~ 0
In5
Text Label 1450 1100 2    60   ~ 0
Led-1
Wire Wire Line
	1450 1100 1150 1100
Wire Wire Line
	1150 1200 1450 1200
Wire Wire Line
	1450 1300 1150 1300
Wire Wire Line
	1150 1400 1450 1400
Wire Wire Line
	1450 1500 1150 1500
Wire Wire Line
	1150 1600 1450 1600
$Comp
L CONN_01X03 P2
U 1 1 57B64DE7
P 2050 1200
F 0 "P2" H 2050 1400 50  0000 C CNN
F 1 "Sensor1" V 2150 1200 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 2050 1200 50  0001 C CNN
F 3 "" H 2050 1200 50  0000 C CNN
	1    2050 1200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR03
U 1 1 57B64EB4
P 2350 1400
F 0 "#PWR03" H 2350 1150 50  0001 C CNN
F 1 "GND" H 2350 1250 50  0000 C CNN
F 2 "" H 2350 1400 50  0000 C CNN
F 3 "" H 2350 1400 50  0000 C CNN
	1    2350 1400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 57B64EC5
P 2350 1000
F 0 "#PWR04" H 2350 850 50  0001 C CNN
F 1 "+5V" H 2350 1140 50  0000 C CNN
F 2 "" H 2350 1000 50  0000 C CNN
F 3 "" H 2350 1000 50  0000 C CNN
	1    2350 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 1200 2350 1200
Wire Wire Line
	2350 1200 2350 1000
Wire Wire Line
	2250 1300 2350 1300
Wire Wire Line
	2350 1300 2350 1400
Text Label 2550 1100 2    60   ~ 0
In1
Wire Wire Line
	2550 1100 2250 1100
$Comp
L CONN_01X03 P3
U 1 1 57B64F3E
P 2800 1200
F 0 "P3" H 2800 1400 50  0000 C CNN
F 1 "Sensor2" V 2900 1200 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 2800 1200 50  0001 C CNN
F 3 "" H 2800 1200 50  0000 C CNN
	1    2800 1200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR05
U 1 1 57B64F44
P 3100 1400
F 0 "#PWR05" H 3100 1150 50  0001 C CNN
F 1 "GND" H 3100 1250 50  0000 C CNN
F 2 "" H 3100 1400 50  0000 C CNN
F 3 "" H 3100 1400 50  0000 C CNN
	1    3100 1400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 57B64F4A
P 3100 1000
F 0 "#PWR06" H 3100 850 50  0001 C CNN
F 1 "+5V" H 3100 1140 50  0000 C CNN
F 2 "" H 3100 1000 50  0000 C CNN
F 3 "" H 3100 1000 50  0000 C CNN
	1    3100 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 1200 3100 1200
Wire Wire Line
	3100 1200 3100 1000
Wire Wire Line
	3000 1300 3100 1300
Wire Wire Line
	3100 1300 3100 1400
Text Label 3300 1100 2    60   ~ 0
In2
Wire Wire Line
	3300 1100 3000 1100
$Comp
L CONN_01X03 P4
U 1 1 57B64F9B
P 3550 1200
F 0 "P4" H 3550 1400 50  0000 C CNN
F 1 "Sensor3" V 3650 1200 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 3550 1200 50  0001 C CNN
F 3 "" H 3550 1200 50  0000 C CNN
	1    3550 1200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR07
U 1 1 57B64FA1
P 3850 1400
F 0 "#PWR07" H 3850 1150 50  0001 C CNN
F 1 "GND" H 3850 1250 50  0000 C CNN
F 2 "" H 3850 1400 50  0000 C CNN
F 3 "" H 3850 1400 50  0000 C CNN
	1    3850 1400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR08
U 1 1 57B64FA7
P 3850 1000
F 0 "#PWR08" H 3850 850 50  0001 C CNN
F 1 "+5V" H 3850 1140 50  0000 C CNN
F 2 "" H 3850 1000 50  0000 C CNN
F 3 "" H 3850 1000 50  0000 C CNN
	1    3850 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 1200 3850 1200
Wire Wire Line
	3850 1200 3850 1000
Wire Wire Line
	3750 1300 3850 1300
Wire Wire Line
	3850 1300 3850 1400
Text Label 4050 1100 2    60   ~ 0
In3
Wire Wire Line
	4050 1100 3750 1100
$Comp
L CONN_01X03 P5
U 1 1 57B64FB3
P 4300 1200
F 0 "P5" H 4300 1400 50  0000 C CNN
F 1 "Sensor4" V 4400 1200 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 4300 1200 50  0001 C CNN
F 3 "" H 4300 1200 50  0000 C CNN
	1    4300 1200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR09
U 1 1 57B64FB9
P 4600 1400
F 0 "#PWR09" H 4600 1150 50  0001 C CNN
F 1 "GND" H 4600 1250 50  0000 C CNN
F 2 "" H 4600 1400 50  0000 C CNN
F 3 "" H 4600 1400 50  0000 C CNN
	1    4600 1400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 57B64FBF
P 4600 1000
F 0 "#PWR010" H 4600 850 50  0001 C CNN
F 1 "+5V" H 4600 1140 50  0000 C CNN
F 2 "" H 4600 1000 50  0000 C CNN
F 3 "" H 4600 1000 50  0000 C CNN
	1    4600 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 1200 4600 1200
Wire Wire Line
	4600 1200 4600 1000
Wire Wire Line
	4500 1300 4600 1300
Wire Wire Line
	4600 1300 4600 1400
Text Label 4800 1100 2    60   ~ 0
In4
Wire Wire Line
	4800 1100 4500 1100
$Comp
L CONN_01X03 P6
U 1 1 57B6502D
P 5050 1200
F 0 "P6" H 5050 1400 50  0000 C CNN
F 1 "Sensor5" V 5150 1200 50  0000 C CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 5050 1200 50  0001 C CNN
F 3 "" H 5050 1200 50  0000 C CNN
	1    5050 1200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR011
U 1 1 57B65033
P 5350 1400
F 0 "#PWR011" H 5350 1150 50  0001 C CNN
F 1 "GND" H 5350 1250 50  0000 C CNN
F 2 "" H 5350 1400 50  0000 C CNN
F 3 "" H 5350 1400 50  0000 C CNN
	1    5350 1400
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR012
U 1 1 57B65039
P 5350 1000
F 0 "#PWR012" H 5350 850 50  0001 C CNN
F 1 "+5V" H 5350 1140 50  0000 C CNN
F 2 "" H 5350 1000 50  0000 C CNN
F 3 "" H 5350 1000 50  0000 C CNN
	1    5350 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1200 5350 1200
Wire Wire Line
	5350 1200 5350 1000
Wire Wire Line
	5250 1300 5350 1300
Wire Wire Line
	5350 1300 5350 1400
Text Label 5550 1100 2    60   ~ 0
In5
Wire Wire Line
	5550 1100 5250 1100
$Comp
L CONN_01X04 P7
U 1 1 57B65194
P 2050 2250
F 0 "P7" H 2050 2500 50  0000 C CNN
F 1 "Led1" V 2150 2250 50  0000 C CNN
F 2 "Connectors_JST:JST_PH_B4B-PH-K_04x2.00mm_Straight" H 2050 2250 50  0001 C CNN
F 3 "" H 2050 2250 50  0000 C CNN
	1    2050 2250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR013
U 1 1 57B65210
P 2350 2500
F 0 "#PWR013" H 2350 2250 50  0001 C CNN
F 1 "GND" H 2350 2350 50  0000 C CNN
F 2 "" H 2350 2500 50  0000 C CNN
F 3 "" H 2350 2500 50  0000 C CNN
	1    2350 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR014
U 1 1 57B65230
P 2350 2000
F 0 "#PWR014" H 2350 1850 50  0001 C CNN
F 1 "+5V" H 2350 2140 50  0000 C CNN
F 2 "" H 2350 2000 50  0000 C CNN
F 3 "" H 2350 2000 50  0000 C CNN
	1    2350 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2300 2350 2300
Wire Wire Line
	2350 2300 2350 2000
Wire Wire Line
	2250 2400 2350 2400
Wire Wire Line
	2350 2400 2350 2500
Text Label 2850 2200 2    60   ~ 0
Led-1
Wire Wire Line
	2250 2200 2850 2200
Text Label 2850 2100 2    60   ~ 0
Led-1-2
Wire Wire Line
	2250 2100 2850 2100
$Comp
L CONN_01X04 P8
U 1 1 57B65405
P 3100 2250
F 0 "P8" H 3100 2500 50  0000 C CNN
F 1 "Led2" V 3200 2250 50  0000 C CNN
F 2 "Connectors_JST:JST_PH_B4B-PH-K_04x2.00mm_Straight" H 3100 2250 50  0001 C CNN
F 3 "" H 3100 2250 50  0000 C CNN
	1    3100 2250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR015
U 1 1 57B6540B
P 3400 2500
F 0 "#PWR015" H 3400 2250 50  0001 C CNN
F 1 "GND" H 3400 2350 50  0000 C CNN
F 2 "" H 3400 2500 50  0000 C CNN
F 3 "" H 3400 2500 50  0000 C CNN
	1    3400 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR016
U 1 1 57B65411
P 3400 2000
F 0 "#PWR016" H 3400 1850 50  0001 C CNN
F 1 "+5V" H 3400 2140 50  0000 C CNN
F 2 "" H 3400 2000 50  0000 C CNN
F 3 "" H 3400 2000 50  0000 C CNN
	1    3400 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2300 3400 2300
Wire Wire Line
	3400 2300 3400 2000
Wire Wire Line
	3300 2400 3400 2400
Wire Wire Line
	3400 2400 3400 2500
Text Label 3900 2200 2    60   ~ 0
Led-1-2
Wire Wire Line
	3300 2200 3900 2200
Text Label 3900 2100 2    60   ~ 0
Led-2-3
Wire Wire Line
	3300 2100 3900 2100
$Comp
L CONN_01X04 P9
U 1 1 57B654A1
P 4200 2250
F 0 "P9" H 4200 2500 50  0000 C CNN
F 1 "Led3" V 4300 2250 50  0000 C CNN
F 2 "Connectors_JST:JST_PH_B4B-PH-K_04x2.00mm_Straight" H 4200 2250 50  0001 C CNN
F 3 "" H 4200 2250 50  0000 C CNN
	1    4200 2250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR017
U 1 1 57B654A7
P 4500 2500
F 0 "#PWR017" H 4500 2250 50  0001 C CNN
F 1 "GND" H 4500 2350 50  0000 C CNN
F 2 "" H 4500 2500 50  0000 C CNN
F 3 "" H 4500 2500 50  0000 C CNN
	1    4500 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR018
U 1 1 57B654AD
P 4500 2000
F 0 "#PWR018" H 4500 1850 50  0001 C CNN
F 1 "+5V" H 4500 2140 50  0000 C CNN
F 2 "" H 4500 2000 50  0000 C CNN
F 3 "" H 4500 2000 50  0000 C CNN
	1    4500 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2300 4500 2300
Wire Wire Line
	4500 2300 4500 2000
Wire Wire Line
	4400 2400 4500 2400
Wire Wire Line
	4500 2400 4500 2500
Text Label 5000 2200 2    60   ~ 0
Led-2-3
Wire Wire Line
	4400 2200 5000 2200
Text Label 5000 2100 2    60   ~ 0
Led-3-4
Wire Wire Line
	4400 2100 5000 2100
$Comp
L CONN_01X04 P10
U 1 1 57B654BB
P 5250 2250
F 0 "P10" H 5250 2500 50  0000 C CNN
F 1 "Led4" V 5350 2250 50  0000 C CNN
F 2 "Connectors_JST:JST_PH_B4B-PH-K_04x2.00mm_Straight" H 5250 2250 50  0001 C CNN
F 3 "" H 5250 2250 50  0000 C CNN
	1    5250 2250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR019
U 1 1 57B654C1
P 5550 2500
F 0 "#PWR019" H 5550 2250 50  0001 C CNN
F 1 "GND" H 5550 2350 50  0000 C CNN
F 2 "" H 5550 2500 50  0000 C CNN
F 3 "" H 5550 2500 50  0000 C CNN
	1    5550 2500
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR020
U 1 1 57B654C7
P 5550 2000
F 0 "#PWR020" H 5550 1850 50  0001 C CNN
F 1 "+5V" H 5550 2140 50  0000 C CNN
F 2 "" H 5550 2000 50  0000 C CNN
F 3 "" H 5550 2000 50  0000 C CNN
	1    5550 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2300 5550 2300
Wire Wire Line
	5550 2300 5550 2000
Wire Wire Line
	5450 2400 5550 2400
Wire Wire Line
	5550 2400 5550 2500
Text Label 6050 2200 2    60   ~ 0
Led-3-4
Wire Wire Line
	5450 2200 6050 2200
Text Label 6050 2100 2    60   ~ 0
Led-4-5
Wire Wire Line
	5450 2100 6050 2100
$Comp
L CONN_01X04 P11
U 1 1 57E76556
P 6300 2200
F 0 "P11" H 6300 2450 50  0000 C CNN
F 1 "Led4" V 6400 2200 50  0000 C CNN
F 2 "Connectors_JST:JST_PH_B4B-PH-K_04x2.00mm_Straight" H 6300 2200 50  0001 C CNN
F 3 "" H 6300 2200 50  0000 C CNN
	1    6300 2200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR021
U 1 1 57E7655C
P 6600 2450
F 0 "#PWR021" H 6600 2200 50  0001 C CNN
F 1 "GND" H 6600 2300 50  0000 C CNN
F 2 "" H 6600 2450 50  0000 C CNN
F 3 "" H 6600 2450 50  0000 C CNN
	1    6600 2450
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR022
U 1 1 57E76562
P 6600 1950
F 0 "#PWR022" H 6600 1800 50  0001 C CNN
F 1 "+5V" H 6600 2090 50  0000 C CNN
F 2 "" H 6600 1950 50  0000 C CNN
F 3 "" H 6600 1950 50  0000 C CNN
	1    6600 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2250 6600 2250
Wire Wire Line
	6600 2250 6600 1950
Wire Wire Line
	6500 2350 6600 2350
Wire Wire Line
	6600 2350 6600 2450
Text Label 7100 2150 2    60   ~ 0
Led-4-5
Wire Wire Line
	6500 2150 7100 2150
Text Label 7100 2050 2    60   ~ 0
Led-5-6
Wire Wire Line
	6500 2050 7100 2050
$EndSCHEMATC
