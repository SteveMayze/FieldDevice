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
Sheet 3 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 6500 3000 0    60   Input ~ 0
RS
Text HLabel 6850 1150 0    60   Input ~ 0
3V3
Text HLabel 6500 2400 0    60   Input ~ 0
SPI_MOSI
Text HLabel 6500 2600 0    60   Input ~ 0
SPI_SCK
Text HLabel 6500 2700 0    60   Input ~ 0
SPI_CS
$Comp
L SW_PUSH SW301
U 1 1 593FDBDD
P 5700 4500
F 0 "SW301" H 5850 4610 50  0000 C CNN
F 1 "SW_PUSH" H 5700 4420 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x02_Pitch2.54mm" H 5700 4500 60  0001 C CNN
F 3 "" H 5700 4500 60  0000 C CNN
	1    5700 4500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 593FDBE4
P 6100 5400
F 0 "#PWR07" H 6100 5150 50  0001 C CNN
F 1 "GND" H 6100 5250 50  0000 C CNN
F 2 "" H 6100 5400 50  0000 C CNN
F 3 "" H 6100 5400 50  0000 C CNN
	1    6100 5400
	1    0    0    -1  
$EndComp
Text HLabel 5050 4500 0    60   Input ~ 0
~DISPLAY
$Comp
L C C303
U 1 1 59402950
P 5300 4800
F 0 "C303" H 5325 4900 50  0000 L CNN
F 1 "0.1μF" H 5325 4700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 5338 4650 30  0001 C CNN
F 3 "" H 5300 4800 60  0000 C CNN
	1    5300 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6000 4500 6100 4500
Wire Wire Line
	6100 4500 6100 5400
Wire Wire Line
	5050 4500 5400 4500
Wire Wire Line
	5300 4950 5300 5050
Wire Wire Line
	5300 5050 6100 5050
Connection ~ 6100 5050
Wire Wire Line
	5300 4650 5300 4500
Connection ~ 5300 4500
$Comp
L GND #PWR08
U 1 1 598B3757
P 7300 3700
F 0 "#PWR08" H 7300 3450 50  0001 C CNN
F 1 "GND" H 7300 3550 50  0000 C CNN
F 2 "" H 7300 3700 60  0000 C CNN
F 3 "" H 7300 3700 60  0000 C CNN
	1    7300 3700
	1    0    0    -1  
$EndComp
Text HLabel 6500 2500 0    60   Input ~ 0
SPI_MISO
Text HLabel 6500 3100 0    60   Input ~ 0
~RESET
Text HLabel 6500 3200 0    60   Input ~ 0
BACKLIGHT
Wire Wire Line
	7000 1500 6850 1500
Wire Wire Line
	7300 1300 7300 1150
Wire Wire Line
	7300 1150 6850 1150
Text HLabel 6850 1500 0    60   Input ~ 0
~ENABLE
Text Notes 4850 4300 0    60   ~ 0
The MCU needs to internally \nset the Pull Up Resistor
Wire Wire Line
	7300 1700 7300 2100
Wire Wire Line
	7300 3550 7300 3700
Text Notes 8000 3300 0    60   ~ 0
The EA Display is a DOGS or DOGM LCD \nconnected through the adapter. The \nphysical connection could be pin header.
Wire Wire Line
	6500 2400 6600 2400
Wire Wire Line
	6500 2500 6600 2500
Wire Wire Line
	6500 2600 6600 2600
Wire Wire Line
	6500 2700 6600 2700
Wire Wire Line
	6500 3000 6600 3000
Wire Wire Line
	6500 3100 6600 3100
Wire Wire Line
	6500 3200 6600 3200
$Comp
L Q_PMOS_GSD Q301
U 1 1 5A737F93
P 7200 1500
F 0 "Q301" H 7400 1550 50  0000 L CNN
F 1 "Q_PMOS_GSD" H 7400 1450 50  0000 L CNN
F 2 "TO_SOT_Packages_SMD:SOT-23" H 7400 1600 50  0001 C CNN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/cd/a8/e2/81/10/ea/4b/a7/DM00091036.pdf/files/DM00091036.pdf/jcr:content/translations/en.DM00091036.pdf" H 7200 1500 50  0001 C CNN
F 4 "STR1P2UH7" H 7200 1500 60  0001 C CNN "MPN"
F 5 "Value" H 7200 1500 60  0001 C CNN "ConradPN"
F 6 "Value" H 7200 1500 60  0001 C CNN "Label"
	1    7200 1500
	1    0    0    -1  
$EndComp
$Comp
L EA_DISPLAY LCD301
U 1 1 5A74BD92
P 7300 2800
F 0 "LCD301" H 7650 2150 60  0000 C CNN
F 1 "EA_DISPLAY" H 7400 2800 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Angled_1x10_Pitch2.54mm" H 6900 2700 60  0001 C CNN
F 3 "" H 6900 2700 60  0001 C CNN
	1    7300 2800
	1    0    0    -1  
$EndComp
$EndSCHEMATC
