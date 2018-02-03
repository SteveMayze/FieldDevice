EESchema Schematic File Version 2
LIBS:fieldDevice_symbols
LIBS:ce_header
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
LIBS:FieldDevice-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
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
L DS7505 U501
U 1 1 5A7136A0
P 4600 3200
F 0 "U501" H 4950 2750 60  0000 C CNN
F 1 "DS7505" H 4600 3550 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 4600 3000 60  0001 C CNN
F 3 "" H 4600 3000 60  0000 C CNN
	1    4600 3200
	1    0    0    -1  
$EndComp
Text Label 6550 2900 2    60   ~ 0
3V3
$Comp
L GND #PWR010
U 1 1 5A7136A8
P 3650 3700
F 0 "#PWR010" H 3650 3450 50  0001 C CNN
F 1 "GND" H 3650 3550 50  0000 C CNN
F 2 "" H 3650 3700 50  0000 C CNN
F 3 "" H 3650 3700 50  0000 C CNN
	1    3650 3700
	1    0    0    -1  
$EndComp
$Comp
L R R502
U 1 1 5A7136AE
P 5450 3850
F 0 "R502" V 5530 3850 50  0000 C CNN
F 1 "0" V 5450 3850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5380 3850 50  0001 C CNN
F 3 "" H 5450 3850 50  0000 C CNN
	1    5450 3850
	1    0    0    -1  
$EndComp
$Comp
L R R503
U 1 1 5A7136B5
P 5700 3850
F 0 "R503" V 5780 3850 50  0000 C CNN
F 1 "0" V 5700 3850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5630 3850 50  0001 C CNN
F 3 "" H 5700 3850 50  0000 C CNN
	1    5700 3850
	1    0    0    -1  
$EndComp
$Comp
L R R504
U 1 1 5A7136BC
P 5950 3850
F 0 "R504" V 6030 3850 50  0000 C CNN
F 1 "0" V 5950 3850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5880 3850 50  0001 C CNN
F 3 "" H 5950 3850 50  0000 C CNN
	1    5950 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5A7136C3
P 5550 4250
F 0 "#PWR011" H 5550 4000 50  0001 C CNN
F 1 "GND" H 5550 4100 50  0000 C CNN
F 2 "" H 5550 4250 50  0000 C CNN
F 3 "" H 5550 4250 50  0000 C CNN
	1    5550 4250
	1    0    0    -1  
$EndComp
Text Label 3450 2900 0    60   ~ 0
SDA
Text Label 3450 3100 0    60   ~ 0
I2C_SCK
Text Notes 4200 2650 0    60   ~ 0
Temperature Sensor
Text Notes 4250 4050 0    60   ~ 0
I²C Address '1010000'
Text Label 2050 3300 0    60   ~ 0
OverTemp
Wire Wire Line
	5250 2900 6550 2900
Wire Wire Line
	3900 3500 3650 3500
Wire Wire Line
	3650 3500 3650 3700
Wire Wire Line
	3900 2900 3450 2900
Wire Wire Line
	3900 3100 3450 3100
Wire Wire Line
	2050 3300 3900 3300
Wire Wire Line
	5450 4000 5450 4150
Wire Wire Line
	5450 4150 5950 4150
Wire Wire Line
	5950 4150 5950 4000
Wire Wire Line
	5700 4000 5700 4150
Connection ~ 5700 4150
Wire Wire Line
	5550 4150 5550 4250
Connection ~ 5550 4150
Wire Wire Line
	5250 3500 5450 3500
Wire Wire Line
	5450 3500 5450 3700
Wire Wire Line
	5250 3300 5700 3300
Wire Wire Line
	5700 3300 5700 3700
Wire Wire Line
	5250 3100 5950 3100
Wire Wire Line
	5950 3100 5950 3700
$Comp
L R R501
U 1 1 5A7136E1
P 2600 2600
F 0 "R501" V 2680 2600 50  0000 C CNN
F 1 "10k" V 2600 2600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2530 2600 50  0001 C CNN
F 3 "" H 2600 2600 50  0000 C CNN
	1    2600 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 2750 2600 3300
Connection ~ 2600 3300
Wire Wire Line
	2600 2450 2600 2250
Text Label 2600 2250 0    60   ~ 0
3V3
Wire Wire Line
	6250 2900 6250 3000
$Comp
L C C501
U 1 1 5A7136EE
P 6250 3150
F 0 "C501" H 6275 3250 50  0000 L CNN
F 1 "100pF 50V" H 6275 3050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6288 3000 30  0001 C CNN
F 3 "" H 6250 3150 60  0000 C CNN
F 4 "Value" H 6250 3150 60  0001 C CNN "Link"
	1    6250 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 5A7136F5
P 6250 3400
F 0 "#PWR012" H 6250 3150 50  0001 C CNN
F 1 "GND" H 6250 3250 50  0000 C CNN
F 2 "" H 6250 3400 50  0000 C CNN
F 3 "" H 6250 3400 50  0000 C CNN
	1    6250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3300 6250 3400
Connection ~ 6250 2900
Wire Wire Line
	2600 2250 2150 2250
Text HLabel 2150 2250 0    60   Input ~ 0
3V3
Text HLabel 2050 3300 0    60   Input ~ 0
OverTemp
Text HLabel 3450 2900 0    60   Input ~ 0
I2C_SDA
Text HLabel 3450 3100 0    60   Input ~ 0
I2C_SCK
Text Notes 3700 5150 0    60   ~ 0
The purpose of this temperature unit\nis to measure and report the temperature\nof the Field Device board. This is not \nintended as any type of environmental\nsensor other than device running conditions.\n
Text Label 5300 3500 0    60   ~ 0
A2
Text Label 5300 3300 0    60   ~ 0
A1
Text Label 5300 3100 0    60   ~ 0
A0
$EndSCHEMATC
