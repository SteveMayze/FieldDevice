EESchema Schematic File Version 2
LIBS:FieldDevice-rescue
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
Text HLabel 5450 2850 0    60   Input ~ 0
RS
Text HLabel 5000 1350 0    60   Input ~ 0
3V3
Text HLabel 5450 2450 0    60   Input ~ 0
MOSI
Text HLabel 5450 2650 0    60   Input ~ 0
SPI_SCK
Text HLabel 5450 2750 0    60   Input ~ 0
CS
$Comp
L SW_PUSH SW301
U 1 1 593FDBDD
P 8400 2800
F 0 "SW301" H 8550 2910 50  0000 C CNN
F 1 "SW_PUSH" H 8400 2720 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 8400 2800 60  0001 C CNN
F 3 "" H 8400 2800 60  0000 C CNN
	1    8400 2800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 593FDBE4
P 8800 3700
F 0 "#PWR09" H 8800 3450 50  0001 C CNN
F 1 "GND" H 8800 3550 50  0000 C CNN
F 2 "" H 8800 3700 50  0000 C CNN
F 3 "" H 8800 3700 50  0000 C CNN
	1    8800 3700
	1    0    0    -1  
$EndComp
Text HLabel 7750 2800 0    60   Input ~ 0
~DISPLAY
$Comp
L C C303
U 1 1 59402950
P 8000 3100
F 0 "C303" H 8025 3200 50  0000 L CNN
F 1 "0.1μF" H 8025 3000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8038 2950 30  0001 C CNN
F 3 "" H 8000 3100 60  0000 C CNN
	1    8000 3100
	-1   0    0    1   
$EndComp
Wire Wire Line
	8700 2800 8800 2800
Wire Wire Line
	8800 2800 8800 3350
Wire Wire Line
	8800 3350 8800 3700
Wire Wire Line
	7750 2800 8000 2800
Wire Wire Line
	8000 2800 8100 2800
Wire Wire Line
	8000 3250 8000 3350
Wire Wire Line
	8000 3350 8800 3350
Connection ~ 8800 3350
Wire Wire Line
	8000 2950 8000 2800
Connection ~ 8000 2800
Wire Wire Line
	5700 2350 5450 2350
Wire Wire Line
	5700 2450 5450 2450
Wire Wire Line
	5700 2650 5450 2650
Wire Wire Line
	5700 2750 5450 2750
Wire Wire Line
	5700 2850 5450 2850
Wire Wire Line
	5700 2950 5450 2950
Wire Wire Line
	5400 3250 5400 3400
$Comp
L GND #PWR010
U 1 1 598B3757
P 5400 3400
F 0 "#PWR010" H 5400 3150 50  0001 C CNN
F 1 "GND" H 5400 3250 50  0000 C CNN
F 2 "" H 5400 3400 60  0000 C CNN
F 3 "" H 5400 3400 60  0000 C CNN
	1    5400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2550 5450 2550
Text HLabel 5450 2550 0    60   Input ~ 0
MISO
$Comp
L Conn_01x10_Female P301
U 1 1 5A6CD6E7
P 5900 2750
F 0 "P301" H 5900 3250 50  0000 C CNN
F 1 "Conn_01x10_Female" H 5900 2150 50  0000 C CNN
F 2 "" H 5900 2750 50  0001 C CNN
F 3 "" H 5900 2750 50  0001 C CNN
	1    5900 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3250 5400 3250
Text HLabel 5450 2950 0    60   Input ~ 0
~RESET
Wire Wire Line
	5700 3050 5450 3050
Text HLabel 5450 3050 0    60   Input ~ 0
BACKLIGHT
NoConn ~ 5700 3150
Wire Wire Line
	5150 1700 5000 1700
Wire Wire Line
	5450 1500 5450 1350
Wire Wire Line
	5450 1350 5000 1350
Text HLabel 5000 1700 0    60   Input ~ 0
~ENABLE
Wire Wire Line
	5450 2350 5450 1900
Text Notes 7550 2600 0    60   ~ 0
The MCU needs to internally \nset the Pull Up Resistor
$Comp
L Q_PMOS_GDS Q?
U 1 1 5A6D0129
P 5350 1700
F 0 "Q?" H 5550 1750 50  0000 L CNN
F 1 "Q_PMOS_GDS" H 5550 1650 50  0000 L CNN
F 2 "" H 5550 1800 50  0001 C CNN
F 3 "" H 5350 1700 50  0001 C CNN
	1    5350 1700
	1    0    0    -1  
$EndComp
Text Notes 2750 2850 0    60   ~ 0
Verify the behaviour of the \nNMOS.\nWill this be problematic to keep the REST high\nbut removing power?
$EndSCHEMATC
