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
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 5450 2650 0    60   Input ~ 0
RS
Text HLabel 5450 2350 0    60   Input ~ 0
3V3
Text HLabel 5450 2450 0    60   Input ~ 0
MOSI
Text HLabel 5450 2550 0    60   Input ~ 0
SCK
Text HLabel 5450 2750 0    60   Input ~ 0
CS
$Comp
L SW_PUSH SW301
U 1 1 593FDBDD
P 8950 1500
F 0 "SW301" H 9100 1610 50  0000 C CNN
F 1 "SW_PUSH" H 8950 1420 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 8950 1500 60  0001 C CNN
F 3 "" H 8950 1500 60  0000 C CNN
	1    8950 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 593FDBE4
P 9450 2400
F 0 "#PWR010" H 9450 2150 50  0001 C CNN
F 1 "GND" H 9450 2250 50  0000 C CNN
F 2 "" H 9450 2400 50  0000 C CNN
F 3 "" H 9450 2400 50  0000 C CNN
	1    9450 2400
	1    0    0    -1  
$EndComp
Text HLabel 8150 1500 0    60   Input ~ 0
Display
$Comp
L C C303
U 1 1 59402950
P 8550 2050
F 0 "C303" H 8575 2150 50  0000 L CNN
F 1 "0.1μF" H 8575 1950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8588 1900 30  0001 C CNN
F 3 "" H 8550 2050 60  0000 C CNN
	1    8550 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	9250 1500 9450 1500
Wire Wire Line
	9450 1500 9450 2400
Wire Wire Line
	8650 1500 8150 1500
Wire Wire Line
	8550 2200 8550 2300
Wire Wire Line
	8550 2300 9450 2300
Connection ~ 9450 2300
Wire Wire Line
	8550 1900 8550 1500
Connection ~ 8550 1500
$Comp
L CONN_01X06 P301
U 1 1 598B33D0
P 5900 2600
F 0 "P301" H 5900 2950 50  0000 C CNN
F 1 "CONN_01X06" V 6000 2600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 5900 2600 60  0001 C CNN
F 3 "" H 5900 2600 60  0000 C CNN
	1    5900 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2350 5450 2350
Wire Wire Line
	5700 2450 5450 2450
Wire Wire Line
	5700 2550 5450 2550
Wire Wire Line
	5700 2650 5450 2650
Wire Wire Line
	5700 2750 5450 2750
Wire Wire Line
	5700 2850 5400 2850
Wire Wire Line
	5400 2850 5400 3000
$Comp
L GND #PWR011
U 1 1 598B3757
P 5400 3000
F 0 "#PWR011" H 5400 2750 50  0001 C CNN
F 1 "GND" H 5400 2850 50  0000 C CNN
F 2 "" H 5400 3000 60  0000 C CNN
F 3 "" H 5400 3000 60  0000 C CNN
	1    5400 3000
	1    0    0    -1  
$EndComp
$EndSCHEMATC
