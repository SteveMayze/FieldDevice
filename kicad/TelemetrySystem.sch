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
Sheet 4 5
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
L DIGI_XBEE H401
U 1 1 5A7121A6
P 5050 3200
F 0 "H401" H 5800 2300 60  0000 C CNN
F 1 "DIGI_XBEE" H 5000 3750 60  0000 C CNN
F 2 "FieldDevice_Footprints:XBEE_S2C" H 4400 3000 60  0001 C CNN
F 3 "" H 4400 3000 60  0000 C CNN
	1    5050 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5A7121AD
P 5050 4300
F 0 "#PWR09" H 5050 4050 50  0001 C CNN
F 1 "GND" H 5050 4150 50  0000 C CNN
F 2 "" H 5050 4300 50  0000 C CNN
F 3 "" H 5050 4300 50  0000 C CNN
	1    5050 4300
	1    0    0    -1  
$EndComp
Text Label 4600 2050 0    60   ~ 0
3V3
NoConn ~ 3950 3150
NoConn ~ 3950 3350
NoConn ~ 3950 3450
NoConn ~ 3950 3650
Text Notes 5200 2250 0    60   ~ 0
The minimal configuration \nfor the XBEE is Vcc, GND, \nDin and Dout
Wire Wire Line
	5050 4200 5050 4300
Wire Wire Line
	5050 2050 4600 2050
Wire Wire Line
	3150 2950 3950 2950
Wire Wire Line
	3150 3050 3950 3050
Wire Wire Line
	5050 2050 5050 2150
NoConn ~ 3950 3250
$Comp
L LED-RESCUE-FieldDevice D401
U 1 1 5A7121C4
P 3350 2550
F 0 "D401" H 3350 2650 50  0000 C CNN
F 1 "Tx" H 3350 2450 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 3350 2550 60  0001 C CNN
F 3 "" H 3350 2550 60  0000 C CNN
F 4 "Value" H 3350 2550 60  0001 C CNN "Link"
	1    3350 2550
	0    -1   -1   0   
$EndComp
$Comp
L LED-RESCUE-FieldDevice D402
U 1 1 5A7121CB
P 3650 2550
F 0 "D402" H 3650 2650 50  0000 C CNN
F 1 "Rx" H 3650 2450 50  0000 C CNN
F 2 "Diodes_SMD:D_0805" H 3650 2550 60  0001 C CNN
F 3 "" H 3650 2550 60  0000 C CNN
	1    3650 2550
	0    -1   -1   0   
$EndComp
$Comp
L R R401
U 1 1 5A7121D2
P 3350 2000
F 0 "R401" V 3430 2000 50  0000 C CNN
F 1 "680Ω" V 3350 2000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3280 2000 50  0001 C CNN
F 3 "" H 3350 2000 50  0000 C CNN
	1    3350 2000
	-1   0    0    1   
$EndComp
$Comp
L R R402
U 1 1 5A7121D9
P 3650 2000
F 0 "R402" V 3730 2000 50  0000 C CNN
F 1 "680Ω" V 3650 2000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3580 2000 50  0001 C CNN
F 3 "" H 3650 2000 50  0000 C CNN
	1    3650 2000
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 1700 3350 1850
Wire Wire Line
	3350 2150 3350 2350
Wire Wire Line
	3650 2350 3650 2150
Wire Wire Line
	3650 1850 3650 1700
Wire Wire Line
	3350 2750 3350 2950
Connection ~ 3350 2950
Wire Wire Line
	3650 2750 3650 3050
Connection ~ 3650 3050
Wire Wire Line
	3050 1700 4050 1700
Connection ~ 3650 1700
Text Label 4050 1700 2    60   ~ 0
3V3
Text HLabel 3150 2950 0    60   Input ~ 0
Tx
Text HLabel 3150 3050 0    60   Input ~ 0
Rx
Connection ~ 3350 1700
Text HLabel 3050 1700 0    60   Input ~ 0
3V3
NoConn ~ 6150 2850
NoConn ~ 6150 2950
NoConn ~ 6150 3050
NoConn ~ 6150 3150
NoConn ~ 6150 3250
NoConn ~ 6150 3350
NoConn ~ 6150 3450
NoConn ~ 6150 3550
NoConn ~ 6150 3650
NoConn ~ 6150 3750
$EndSCHEMATC
