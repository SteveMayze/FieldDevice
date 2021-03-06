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
Sheet 2 5
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
L R R201
U 1 1 593EDD83
P 3500 1850
F 0 "R201" V 3580 1850 50  0000 C CNN
F 1 "1MΩ 125mW  0.1%" H 4000 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 3430 1850 50  0001 C CNN
F 3 "" H 3500 1850 50  0000 C CNN
F 4 "SPR-1206 100K" H 3500 1850 60  0001 C CNN "MPN"
F 5 "Value" H 3500 1850 60  0001 C CNN "Link"
	1    3500 1850
	1    0    0    -1  
$EndComp
$Comp
L R R202
U 1 1 593EDD8A
P 3500 2550
F 0 "R202" V 3580 2550 50  0000 C CNN
F 1 "270kΩ 125mW  0.1%" H 4050 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_1206" V 3430 2550 50  0001 C CNN
F 3 "" H 3500 2550 50  0000 C CNN
F 4 "SPR-1206 39,0K" H 3500 2550 60  0001 C CNN "MPN"
F 5 "Value" H 3500 2550 60  0001 C CNN "Link"
	1    3500 2550
	1    0    0    -1  
$EndComp
Text Label 4450 3050 2    60   ~ 0
TEST_NEG_1
Text Label 4450 1400 2    60   ~ 0
TEST_POS_1
$Comp
L D D201
U 1 1 593EDD99
P 2400 1650
F 0 "D201" H 2400 1750 50  0000 C CNN
F 1 "1N4148WFL" H 2400 1550 50  0000 C CNN
F 2 "FieldDevice_Footprints:D_SOD-123" H 2400 1650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Vishay%20Semiconductors/1N4148WFL-G.pdf" H 2400 1650 50  0001 C CNN
F 4 "1N4148WFL-G3-08GICT-ND" H 2400 1650 60  0001 C CNN "MPN"
F 5 "https://www.digikey.de/products/de?keywords=1N4148WFL-G3-08GICT-ND" H 2400 1650 60  0001 C CNN "Link"
	1    2400 1650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR05
U 1 1 593EDDA0
P 2400 1900
F 0 "#PWR05" H 2400 1650 50  0001 C CNN
F 1 "GND" H 2400 1750 50  0000 C CNN
F 2 "" H 2400 1900 50  0000 C CNN
F 3 "" H 2400 1900 50  0000 C CNN
	1    2400 1900
	1    0    0    -1  
$EndComp
$Comp
L THERMISTOR TH201
U 1 1 593EDDA6
P 2900 1400
F 0 "TH201" V 3000 1450 50  0000 C CNN
F 1 "0.50A 15V" V 2800 1400 50  0000 C BNN
F 2 "Resistors_SMD:R_1812_HandSoldering" H 2900 1400 50  0001 C CNN
F 3 "http://www.bourns.com/docs/Product-Datasheets/mfmsmf.pdf" H 2900 1400 50  0001 C CNN
F 4 "MF-MSMF050-2" H 2900 1400 60  0001 C CNN "MPN"
F 5 "https://www.digikey.de/product-detail/de/bourns-inc/MF-MSMF050-2/MF-MSMF050-2TR-ND/662816" H 2900 1400 60  0001 C CNN "Link"
	1    2900 1400
	0    1    1    0   
$EndComp
Text Notes 5000 1450 0    50   ~ 0
+12V Nominal\n(Allowing for up to 14V)
$Comp
L C C201
U 1 1 593EDDC1
P 3000 2600
F 0 "C201" H 3025 2700 50  0000 L CNN
F 1 "100nF" H 3025 2500 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3038 2450 30  0001 C CNN
F 3 "" H 3000 2600 60  0000 C CNN
	1    3000 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 593EDDCB
P 3000 3500
F 0 "#PWR06" H 3000 3250 50  0001 C CNN
F 1 "GND" H 3000 3350 50  0000 C CNN
F 2 "" H 3000 3500 50  0000 C CNN
F 3 "" H 3000 3500 50  0000 C CNN
	1    3000 3500
	1    0    0    -1  
$EndComp
Text HLabel 2050 2250 0    60   Input ~ 0
ANLG_1
Wire Wire Line
	2400 1900 2400 1800
Wire Wire Line
	2400 1500 2400 1400
Wire Wire Line
	2400 1400 2650 1400
Wire Wire Line
	3150 1400 4600 1400
Wire Wire Line
	3500 1400 3500 1700
Connection ~ 3500 1400
Wire Wire Line
	3500 2000 3500 2400
Wire Wire Line
	3000 2750 3000 3500
$Comp
L CONN_01X01 P201
U 1 1 5940670D
P 4800 1400
F 0 "P201" H 4800 1500 50  0000 C CNN
F 1 "Positive" H 4800 1300 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4800 1400 60  0001 C CNN
F 3 "" H 4800 1400 60  0000 C CNN
	1    4800 1400
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01 P202
U 1 1 594067C4
P 4800 3050
F 0 "P202" H 4800 3150 50  0000 C CNN
F 1 "Negative" H 4800 2950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 4800 3050 60  0001 C CNN
F 3 "" H 4800 3050 60  0000 C CNN
	1    4800 3050
	1    0    0    -1  
$EndComp
$Comp
L R R203
U 1 1 595D4DB1
P 2450 2250
F 0 "R203" V 2530 2250 50  0000 C CNN
F 1 "0Ω" V 2370 2250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 2380 2250 50  0001 C CNN
F 3 "" H 2450 2250 50  0000 C CNN
F 4 "Value" H 2450 2250 60  0001 C CNN "Link"
	1    2450 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 2250 2300 2250
Wire Wire Line
	2600 2250 3500 2250
Connection ~ 3500 2250
Text Notes 4750 2700 0    50   ~ 0
\nThe 12v input (14.8 used in calculations) is to be converted to 0-3v3 for a \nTeency Ananlog input.\n\nThe diode (D201) and a thermistor (TH201) as \na form of protection should the input be \nreversed.\n\nIn addition, to protect the Teency Analog \ninput. (The are 5V tolerant but will cap the \nreading for anything above 3V3).\n\nhttp://tinyurl.com/ybmx4wbv
Wire Wire Line
	3000 2450 3000 2250
Connection ~ 3000 2250
Wire Wire Line
	3500 3050 3500 2700
Wire Wire Line
	3000 3050 4600 3050
Connection ~ 3000 3050
Connection ~ 3500 3050
$EndSCHEMATC
