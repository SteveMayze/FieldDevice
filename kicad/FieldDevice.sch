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
Sheet 1 3
Title "Field Device - Battery Monitor"
Date "2017-06-05"
Rev "2l_1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CE_Header H101
U 1 1 593460FA
P 2550 1900
F 0 "H101" H 3250 700 60  0000 C CNN
F 1 "CE_Header" H 2550 3000 60  0000 C CNN
F 2 "CE_Header:CE_Header" H 2150 2300 60  0001 C CNN
F 3 "" H 2150 2300 60  0000 C CNN
	1    2550 1900
	1    0    0    -1  
$EndComp
$Comp
L DIGI_XBEE H102
U 1 1 59346B0D
P 7200 2250
F 0 "H102" H 7950 1350 60  0000 C CNN
F 1 "DIGI_XBEE" H 7150 2800 60  0000 C CNN
F 2 "FieldDevice_Footprints:XBEE_S2C" H 6550 2050 60  0001 C CNN
F 3 "" H 6550 2050 60  0000 C CNN
	1    7200 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 59346BB1
P 4150 2050
F 0 "#PWR01" H 4150 1800 50  0001 C CNN
F 1 "GND" H 4150 1900 50  0000 C CNN
F 2 "" H 4150 2050 50  0000 C CNN
F 3 "" H 4150 2050 50  0000 C CNN
	1    4150 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 59346BE5
P 1240 3100
F 0 "#PWR02" H 1240 2850 50  0001 C CNN
F 1 "GND" H 1240 2950 50  0000 C CNN
F 2 "" H 1240 3100 50  0000 C CNN
F 3 "" H 1240 3100 50  0000 C CNN
	1    1240 3100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 59346C08
P 7200 3350
F 0 "#PWR03" H 7200 3100 50  0001 C CNN
F 1 "GND" H 7200 3200 50  0000 C CNN
F 2 "" H 7200 3350 50  0000 C CNN
F 3 "" H 7200 3350 50  0000 C CNN
	1    7200 3350
	1    0    0    -1  
$EndComp
Text Label 3950 2100 2    60   ~ 0
3V3
Text Label 6750 1100 0    60   ~ 0
3V3
Text Label 650  1700 0    60   ~ 0
RX
Text Label 4450 1700 2    60   ~ 0
TX
$Comp
L R R109
U 1 1 59346CE3
P 3900 1700
F 0 "R109" V 3980 1700 50  0000 C CNN
F 1 "0" V 3900 1700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3830 1700 50  0001 C CNN
F 3 "" H 3900 1700 50  0000 C CNN
	1    3900 1700
	0    1    1    0   
$EndComp
$Comp
L R R101
U 1 1 59346DB3
P 1150 1700
F 0 "R101" V 1230 1700 50  0000 C CNN
F 1 "0Ω" V 1150 1700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 1080 1700 50  0001 C CNN
F 3 "" H 1150 1700 50  0000 C CNN
	1    1150 1700
	0    1    1    0   
$EndComp
Text Label 5650 2000 0    60   ~ 0
TX
Text Label 5650 2100 0    60   ~ 0
RX
NoConn ~ 6100 2200
NoConn ~ 6100 2400
NoConn ~ 6100 2500
NoConn ~ 6100 2700
NoConn ~ 8300 2800
NoConn ~ 8300 2700
NoConn ~ 8300 2600
NoConn ~ 8300 2500
NoConn ~ 8300 2400
NoConn ~ 8300 2300
NoConn ~ 8300 2200
NoConn ~ 8300 2100
NoConn ~ 8300 2000
NoConn ~ 8300 1900
$Comp
L DS7505 U101
U 1 1 59347421
P 2250 6100
F 0 "U101" H 2600 5650 60  0000 C CNN
F 1 "DS7505" H 2250 6450 60  0000 C CNN
F 2 "Housings_SOIC:SOIC-8_3.9x4.9mm_Pitch1.27mm" H 2250 5900 60  0001 C CNN
F 3 "" H 2250 5900 60  0000 C CNN
	1    2250 6100
	1    0    0    -1  
$EndComp
Text Label 3600 5800 2    60   ~ 0
3V3
$Comp
L GND #PWR04
U 1 1 59347521
P 1300 6600
F 0 "#PWR04" H 1300 6350 50  0001 C CNN
F 1 "GND" H 1300 6450 50  0000 C CNN
F 2 "" H 1300 6600 50  0000 C CNN
F 3 "" H 1300 6600 50  0000 C CNN
	1    1300 6600
	1    0    0    -1  
$EndComp
$Comp
L R R104
U 1 1 593475EC
P 3100 6750
F 0 "R104" V 3180 6750 50  0000 C CNN
F 1 "0" V 3100 6750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3030 6750 50  0001 C CNN
F 3 "" H 3100 6750 50  0000 C CNN
	1    3100 6750
	1    0    0    -1  
$EndComp
$Comp
L R R105
U 1 1 59347631
P 3350 6750
F 0 "R105" V 3430 6750 50  0000 C CNN
F 1 "0" V 3350 6750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3280 6750 50  0001 C CNN
F 3 "" H 3350 6750 50  0000 C CNN
	1    3350 6750
	1    0    0    -1  
$EndComp
$Comp
L R R106
U 1 1 5934765B
P 3600 6750
F 0 "R106" V 3680 6750 50  0000 C CNN
F 1 "0" V 3600 6750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3530 6750 50  0001 C CNN
F 3 "" H 3600 6750 50  0000 C CNN
	1    3600 6750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 59347764
P 3200 7150
F 0 "#PWR05" H 3200 6900 50  0001 C CNN
F 1 "GND" H 3200 7000 50  0000 C CNN
F 2 "" H 3200 7150 50  0000 C CNN
F 3 "" H 3200 7150 50  0000 C CNN
	1    3200 7150
	1    0    0    -1  
$EndComp
Text Label 650  2300 0    60   ~ 0
SCK
Text Label 4900 2300 2    60   ~ 0
SDA
Text Label 1000 5800 0    60   ~ 0
SDA
Text Label 1000 6000 0    60   ~ 0
SCK
Text Notes 1850 5550 0    60   ~ 0
Temperature Sensor
Text Notes 1050 4550 0    60   ~ 0
# Seperate ADC for isolation away from the Micro. \n    Would this be advixable/necessary?\n# Would the PTC really provide any form of protection?\n# Could a Digital Potentiometer be used here?\n# How would this really be calibrated?\n
Text Notes 1900 6950 0    60   ~ 0
I²C Address '1010000'
Text Notes 7500 1200 0    60   ~ 0
The minimal configuration for the XBEE is \nVcc, GND, DIN and DOUT
Text Label 1000 6200 0    60   ~ 0
OverTemp
$Sheet
S 6650 5230 1500 1070
U 593ED75C
F0 "Analog_Sensors" 60
F1 "AnalogSensors.sch" 60
F2 "ANLG_1" I L 6650 5450 60 
$EndSheet
Wire Wire Line
	4150 2050 4150 1900
Wire Wire Line
	4150 1900 3550 1900
Wire Wire Line
	1240 3100 1240 2900
Wire Wire Line
	1240 2900 1550 2900
Wire Wire Line
	7200 3250 7200 3350
Wire Wire Line
	3550 2100 3950 2100
Wire Wire Line
	7200 1100 6750 1100
Wire Wire Line
	3550 1700 3750 1700
Wire Wire Line
	4050 1700 4450 1700
Wire Wire Line
	650  1700 1000 1700
Wire Wire Line
	1300 1700 1550 1700
Wire Wire Line
	6100 2000 5650 2000
Wire Wire Line
	6100 2100 5650 2100
Wire Wire Line
	2900 5800 3600 5800
Wire Wire Line
	1550 6400 1300 6400
Wire Wire Line
	1300 6400 1300 6600
Wire Wire Line
	1550 5800 1000 5800
Wire Wire Line
	1550 6000 1000 6000
Wire Wire Line
	1550 6200 1000 6200
Wire Wire Line
	3100 6900 3100 7050
Wire Wire Line
	3100 7050 3600 7050
Wire Wire Line
	3600 7050 3600 6900
Wire Wire Line
	3350 6900 3350 7050
Connection ~ 3350 7050
Wire Wire Line
	3200 7050 3200 7150
Connection ~ 3200 7050
Wire Wire Line
	2900 6400 3100 6400
Wire Wire Line
	3100 6400 3100 6600
Wire Wire Line
	2900 6200 3350 6200
Wire Wire Line
	3350 6200 3350 6600
Wire Wire Line
	2900 6000 3600 6000
Wire Wire Line
	3600 6000 3600 6600
Wire Wire Line
	3550 2300 4900 2300
Wire Wire Line
	7200 1100 7200 1200
Wire Wire Line
	1550 1300 650  1300
Wire Wire Line
	650  1500 1550 1500
Wire Wire Line
	6650 5450 6050 5450
Text Label 6050 5450 0    60   ~ 0
ANLG_1
Text Label 650  2500 0    60   ~ 0
ANLG_1
$Sheet
S 6600 3700 1600 1200
U 593F4F7E
F0 "Display" 60
F1 "Display.sch" 60
F2 "3V3" I L 6600 3850 60 
F3 "RS" I L 6600 4500 60 
F4 "MOSI" I L 6600 4050 60 
F5 "SCK" I L 6600 4200 60 
F6 "CS" I L 6600 4350 60 
F7 "Display" I L 6600 4750 60 
$EndSheet
Wire Wire Line
	6600 3850 6150 3850
Wire Wire Line
	6600 4050 6150 4050
Wire Wire Line
	6600 4200 6150 4200
Wire Wire Line
	6600 4500 6150 4500
Text Label 4450 2500 2    60   ~ 0
REG_SEL
Wire Wire Line
	6600 4350 6150 4350
Text Label 6150 4350 0    60   ~ 0
CS
Text Label 6150 4200 0    60   ~ 0
CLK
Text Label 6150 4050 0    60   ~ 0
MOSI
Text Label 6150 3850 0    60   ~ 0
3V3
Text Label 650  1300 0    60   ~ 0
MOSI
NoConn ~ 3550 1300
Wire Wire Line
	3550 1500 4450 1500
Text Label 4450 1500 2    60   ~ 0
CS
Text Label 650  2700 0    60   ~ 0
OverTemp
Text Label 4450 2700 2    60   ~ 0
Display
NoConn ~ 6100 2300
Text Label 650  1500 0    60   ~ 0
CLK
$Comp
L R R107
U 1 1 593FC2C1
P 3850 2500
F 0 "R107" V 3930 2500 50  0000 C CNN
F 1 "0Ω" V 3850 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3780 2500 50  0001 C CNN
F 3 "" H 3850 2500 50  0000 C CNN
	1    3850 2500
	0    1    1    0   
$EndComp
$Comp
L R R108
U 1 1 593FC45D
P 3850 2700
F 0 "R108" V 3930 2700 50  0000 C CNN
F 1 "0Ω" V 3850 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3780 2700 50  0001 C CNN
F 3 "" H 3850 2700 50  0000 C CNN
	1    3850 2700
	0    1    1    0   
$EndComp
$Comp
L R R102
U 1 1 593FC4FB
P 1300 2700
F 0 "R102" V 1380 2700 50  0000 C CNN
F 1 "0Ω" V 1300 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 1230 2700 50  0001 C CNN
F 3 "" H 1300 2700 50  0000 C CNN
	1    1300 2700
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 2500 650  2500
Wire Wire Line
	650  2700 1150 2700
Wire Wire Line
	1450 2700 1550 2700
Wire Wire Line
	3550 2700 3700 2700
Wire Wire Line
	4000 2700 4450 2700
Wire Wire Line
	3700 2500 3550 2500
Wire Wire Line
	4000 2500 4450 2500
Wire Wire Line
	6600 4750 6150 4750
Text Label 6150 4750 0    60   ~ 0
Display
Text Label 6150 4500 0    60   ~ 0
REG_SEL
Wire Wire Line
	650  2300 1550 2300
$Comp
L R R103
U 1 1 59402EDE
P 1350 2100
F 0 "R103" V 1430 2100 50  0000 C CNN
F 1 "4k7Ω" V 1350 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 1280 2100 50  0001 C CNN
F 3 "" H 1350 2100 50  0000 C CNN
	1    1350 2100
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 2250 1350 2300
Connection ~ 1350 2300
Wire Wire Line
	1350 1950 1350 1900
Wire Wire Line
	1350 1900 650  1900
Text Label 650  1900 0    60   ~ 0
3V3
$Comp
L R R110
U 1 1 59403531
P 4600 2050
F 0 "R110" V 4680 2050 50  0000 C CNN
F 1 "4k7Ω" V 4600 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 4530 2050 50  0001 C CNN
F 3 "" H 4600 2050 50  0000 C CNN
	1    4600 2050
	-1   0    0    1   
$EndComp
Wire Wire Line
	4600 2300 4600 2200
Connection ~ 4600 2300
Wire Wire Line
	4600 1900 4600 1800
Wire Wire Line
	4600 1800 4900 1800
Text Label 4900 1800 2    60   ~ 0
3V3
NoConn ~ 1550 1100
$EndSCHEMATC
