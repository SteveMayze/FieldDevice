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
Sheet 1 5
Title "Field Device - Battery Monitor"
Date "2017-06-05"
Rev "2l_1"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 8250 4780 1400 620 
U 593ED75C
F0 "Analog_Sensors" 60
F1 "AnalogSensors.sch" 60
F2 "ANLG_1" I L 8250 5000 60 
$EndSheet
Wire Wire Line
	8250 5000 7650 5000
Text Label 7650 5000 0    60   ~ 0
ANLG_1
$Sheet
S 8250 2300 1450 2050
U 593F4F7E
F0 "User Interface" 60
F1 "UserInterface.sch" 60
F2 "3V3" I L 8250 2450 60 
F3 "RS" I L 8250 3250 60 
F4 "SPI_SCK" I L 8250 2950 60 
F5 "~RESET" I L 8250 3850 60 
F6 "BACKLIGHT" I L 8250 4100 60 
F7 "~DISPLAY" I R 9700 2800 60 
F8 "~ENABLE" I L 8250 3700 60 
F9 "SPI_MOSI" I L 8250 2650 60 
F10 "SPI_CS" I L 8250 3100 60 
F11 "SPI_MISO" I L 8250 2800 60 
$EndSheet
Wire Wire Line
	8250 2450 7600 2450
Wire Wire Line
	8250 2650 7600 2650
Wire Wire Line
	8250 2950 7600 2950
Wire Wire Line
	8250 3250 7600 3250
Wire Wire Line
	8250 3100 7600 3100
Text Label 7600 3100 0    60   ~ 0
SPI_CS
Text Label 7600 2950 0    60   ~ 0
SPI_CLK
Text Label 7600 2650 0    60   ~ 0
MOSI
Text Label 7600 2450 0    60   ~ 0
3V3
Wire Wire Line
	10350 2800 9700 2800
Text Label 10350 2800 2    60   ~ 0
Display
Text Label 7600 3250 0    60   ~ 0
REG_SEL
Text Notes 7400 5200 0    60   ~ 0
Pin 14 on Teency\ni.e. A0
Wire Wire Line
	8250 2800 7600 2800
Text Label 7600 2800 0    60   ~ 0
MISO
Wire Wire Line
	8250 3850 7600 3850
Wire Wire Line
	8250 4100 7600 4100
Text Label 7600 3850 0    60   ~ 0
3V3
Wire Wire Line
	8250 3700 7600 3700
Text Label 7600 3700 0    60   ~ 0
~DISP_ENABLE
$Comp
L Teensy-3.2 U101
U 1 1 5A70C2F6
P 4100 2000
F 0 "U101" H 4100 2050 60  0000 C CNN
F 1 "Teensy-3.2" H 3925 3175 60  0000 C CNN
F 2 "FieldDevice_Footprints:Teensy-32" H 3825 1675 60  0001 C CNN
F 3 "" H 3825 1675 60  0001 C CNN
	1    4100 2000
	1    0    0    -1  
$EndComp
$Sheet
S 8250 700  1200 1250
U 5A711E14
F0 "Telemetry System" 60
F1 "TelemetrySystem.sch" 60
F2 "Tx" I L 8250 1300 60 
F3 "Rx" I L 8250 1500 60 
F4 "3V3" I L 8250 950 60 
$EndSheet
Wire Wire Line
	8250 950  7850 950 
Wire Wire Line
	8250 1300 7850 1300
Wire Wire Line
	8250 1500 7850 1500
Text Label 7850 950  0    60   ~ 0
3V3
Text Label 7850 1500 0    60   ~ 0
TX
Text Label 7850 1300 0    60   ~ 0
Rx
$Sheet
S 1400 5900 1600 1050
U 5A713222
F0 "Temperature Sensor" 60
F1 "TemperatureSensor.sch" 60
F2 "3V3" I L 1400 6100 60 
F3 "OverTemp" I L 1400 6800 60 
F4 "I2C_SDA" I L 1400 6550 60 
F5 "I2C_SCK" I L 1400 6350 60 
$EndSheet
Wire Wire Line
	1400 6100 900  6100
Wire Wire Line
	1400 6350 900  6350
Wire Wire Line
	1400 6550 900  6550
Wire Wire Line
	1400 6800 900  6800
Text Label 900  6100 0    60   ~ 0
3V3
Text Label 900  6350 0    60   ~ 0
I2C_SCK
Text Label 900  6550 0    60   ~ 0
I2C_SDA
Wire Wire Line
	2100 4450 2300 4450
Wire Wire Line
	2100 4750 2300 4750
Text Label 2300 4750 2    60   ~ 0
3V3
Text Label 2300 4450 2    60   ~ 0
5V
Text Label 900  6800 0    60   ~ 0
OverTemp
Text Label 7600 4100 0    60   ~ 0
BACKLIGHT
$Comp
L FD_POWER PWR101
U 1 1 5A7391A5
P 1200 4800
F 0 "PWR101" H 1800 4650 60  0000 C CNN
F 1 "FD_POWER" H 1550 5000 60  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 1200 4800 60  0001 C CNN
F 3 "" H 1200 4800 60  0001 C CNN
	1    1200 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 5100 1550 5300
$Comp
L GND #PWR01
U 1 1 5A739AC2
P 1550 5300
F 0 "#PWR01" H 1550 5050 50  0001 C CNN
F 1 "GND" H 1550 5150 50  0000 C CNN
F 2 "" H 1550 5300 50  0001 C CNN
F 3 "" H 1550 5300 50  0001 C CNN
	1    1550 5300
	1    0    0    -1  
$EndComp
Text Notes 850  4250 0    60   ~ 0
The FD Power is a custom power module \nto deliver 5V and 3V3 from an input of\nbetween 6-18V\nThe initial physical connection will be \na 3 pole pin header.
Text Label 3000 2750 2    60   ~ 0
ANLG_1
Text Label 5100 2800 0    60   ~ 0
MOSI
Text Label 5100 2950 0    60   ~ 0
MISO
Text Label 3000 2900 2    60   ~ 0
SPI_CLK
Text Label 3000 950  2    60   ~ 0
5V
Text Label 5350 1150 0    60   ~ 0
Rx
Text Label 5350 1300 0    60   ~ 0
TX
Text Label 1750 2150 0    60   ~ 0
I2C_SDA
Text Label 2350 2000 0    60   ~ 0
I2C_SCK
NoConn ~ 3150 1250
NoConn ~ 4300 3550
NoConn ~ 4500 3550
NoConn ~ 3900 3550
Text Label 2650 1400 2    60   ~ 0
OverTemp
Text Label 2650 1550 2    60   ~ 0
Display
Text Label 5100 2350 0    60   ~ 0
~DISP_ENABLE
Text Label 5100 2650 0    60   ~ 0
SPI_CS
Text Label 5100 2500 0    60   ~ 0
REG_SEL
$Comp
L GND #PWR02
U 1 1 5A7432EA
P 4100 3850
F 0 "#PWR02" H 4100 3600 50  0001 C CNN
F 1 "GND" H 4100 3700 50  0000 C CNN
F 2 "" H 4100 3850 50  0001 C CNN
F 3 "" H 4100 3850 50  0001 C CNN
	1    4100 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3850 4100 3550
Wire Wire Line
	3150 1100 1950 1100
Wire Wire Line
	1950 1100 1950 1300
Wire Wire Line
	4950 1000 5700 1000
Wire Wire Line
	5700 1000 5700 1200
$Comp
L GND #PWR03
U 1 1 5A7438A7
P 1950 1300
F 0 "#PWR03" H 1950 1050 50  0001 C CNN
F 1 "GND" H 1950 1150 50  0000 C CNN
F 2 "" H 1950 1300 50  0001 C CNN
F 3 "" H 1950 1300 50  0001 C CNN
	1    1950 1300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 5A74393C
P 5700 1200
F 0 "#PWR04" H 5700 950 50  0001 C CNN
F 1 "GND" H 5700 1050 50  0000 C CNN
F 2 "" H 5700 1200 50  0001 C CNN
F 3 "" H 5700 1200 50  0001 C CNN
	1    5700 1200
	1    0    0    -1  
$EndComp
$Comp
L R R101
U 1 1 5A743DED
P 5200 1150
F 0 "R101" V 5280 1150 50  0000 C CNN
F 1 "0Ω" V 5200 1150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5130 1150 50  0001 C CNN
F 3 "" H 5200 1150 50  0000 C CNN
	1    5200 1150
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 1150 4950 1150
$Comp
L R R102
U 1 1 5A7440BB
P 5200 1300
F 0 "R102" V 5280 1300 50  0000 C CNN
F 1 "0Ω" V 5200 1300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 5130 1300 50  0001 C CNN
F 3 "" H 5200 1300 50  0000 C CNN
	1    5200 1300
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 1300 5050 1300
$Comp
L R R106
U 1 1 5A744438
P 2200 1950
F 0 "R106" V 2280 1950 50  0000 C CNN
F 1 "4k7Ω" V 2200 1950 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2130 1950 50  0001 C CNN
F 3 "" H 2200 1950 50  0000 C CNN
	1    2200 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 2150 3150 2150
Wire Wire Line
	2200 2150 2200 2100
Connection ~ 2200 2150
$Comp
L R R105
U 1 1 5A744CBD
P 2750 1800
F 0 "R105" V 2830 1800 50  0000 C CNN
F 1 "4k7Ω" V 2750 1800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2680 1800 50  0001 C CNN
F 3 "" H 2750 1800 50  0000 C CNN
	1    2750 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 2000 3150 2000
Wire Wire Line
	2750 2000 2750 1950
Connection ~ 2750 2000
$Comp
L R R103
U 1 1 5A745883
P 2900 1400
F 0 "R103" V 2980 1400 50  0000 C CNN
F 1 "0Ω" V 2900 1400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2830 1400 50  0001 C CNN
F 3 "" H 2900 1400 50  0000 C CNN
	1    2900 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	3150 1400 3050 1400
$Comp
L R R104
U 1 1 5A746347
P 2900 1550
F 0 "R104" V 2980 1550 50  0000 C CNN
F 1 "0Ω" V 2900 1550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2830 1550 50  0001 C CNN
F 3 "" H 2900 1550 50  0000 C CNN
	1    2900 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 1550 3150 1550
NoConn ~ 4950 1450
NoConn ~ 4950 1600
NoConn ~ 4950 1750
NoConn ~ 4950 1900
NoConn ~ 4950 2050
NoConn ~ 3150 1700
NoConn ~ 3150 1850
NoConn ~ 3150 2300
NoConn ~ 3150 2450
NoConn ~ 3150 2600
Text Label 2150 1800 2    60   ~ 0
3V3
Text Label 2650 1650 2    60   ~ 0
3V3
Wire Wire Line
	4950 2950 5100 2950
Wire Wire Line
	4950 2800 5100 2800
Wire Wire Line
	4950 2650 5100 2650
Wire Wire Line
	4950 2500 5100 2500
Wire Wire Line
	4950 2350 5100 2350
Wire Wire Line
	3000 2750 3150 2750
Wire Wire Line
	3000 2900 3150 2900
Wire Wire Line
	3000 950  3150 950 
NoConn ~ 3700 3550
Wire Wire Line
	2750 1650 2650 1650
Wire Wire Line
	2750 1550 2650 1550
Wire Wire Line
	2750 1400 2650 1400
Wire Wire Line
	2200 1800 2150 1800
Text Label 5100 2200 0    60   ~ 0
BACKLIGHT
Wire Wire Line
	4950 2200 5100 2200
$EndSCHEMATC
