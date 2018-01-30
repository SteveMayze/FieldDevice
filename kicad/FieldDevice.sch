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
Sheet 1 6
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
F 1 "CE_Socket" H 2550 3000 60  0000 C CNN
F 2 "CE_Header:CE_Socket" H 2150 2300 60  0001 C CNN
F 3 "" H 2150 2300 60  0000 C CNN
F 4 "Value" H 2550 1900 60  0001 C CNN "Link"
	1    2550 1900
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
Text Label 3950 2100 2    60   ~ 0
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
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3830 1700 50  0001 C CNN
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
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1080 1700 50  0001 C CNN
F 3 "" H 1150 1700 50  0000 C CNN
	1    1150 1700
	0    1    1    0   
$EndComp
Text Label 650  2300 0    60   ~ 0
I2C_SCK
$Sheet
S 9400 4730 1400 620 
U 593ED75C
F0 "Analog_Sensors" 60
F1 "AnalogSensors.sch" 60
F2 "ANLG_1" I L 9400 4950 60 
$EndSheet
Wire Wire Line
	4150 2050 4150 1900
Wire Wire Line
	4150 1900 3550 1900
Wire Wire Line
	3550 2100 3950 2100
Wire Wire Line
	3550 1700 3750 1700
Wire Wire Line
	4050 1700 4450 1700
Wire Wire Line
	650  1700 1000 1700
Wire Wire Line
	1300 1700 1550 1700
Wire Wire Line
	3550 2300 4600 2300
Wire Wire Line
	4600 2300 5150 2300
Wire Wire Line
	1550 1300 650  1300
Wire Wire Line
	650  1500 1550 1500
Wire Wire Line
	9400 4950 8800 4950
Text Label 8800 4950 0    60   ~ 0
ANLG_1
Text Label 650  2500 0    60   ~ 0
ANLG_1
$Sheet
S 9350 2300 1450 2050
U 593F4F7E
F0 "User Interface" 60
F1 "UserInterface.sch" 60
F2 "3V3" I L 9350 2450 60 
F3 "RS" I L 9350 3250 60 
F4 "MOSI" I L 9350 2650 60 
F5 "SPI_SCK" I L 9350 2950 60 
F6 "CS" I L 9350 3100 60 
F7 "MISO" I L 9350 2800 60 
F8 "~RESET" I L 9350 3850 60 
F9 "BACKLIGHT" I L 9350 4100 60 
F10 "~DISPLAY" I L 9350 3500 60 
F11 "~ENABLE" I L 9350 3700 60 
$EndSheet
Wire Wire Line
	9350 2450 8700 2450
Wire Wire Line
	9350 2650 8700 2650
Wire Wire Line
	9350 2950 8700 2950
Wire Wire Line
	9350 3250 8700 3250
Text Label 4450 2500 2    60   ~ 0
REG_SEL
Wire Wire Line
	9350 3100 8700 3100
Text Label 8700 3100 0    60   ~ 0
SPI_CS
Text Label 8700 2950 0    60   ~ 0
SPI_CLK
Text Label 8700 2650 0    60   ~ 0
MOSI
Text Label 8700 2450 0    60   ~ 0
3V3
Text Label 650  1300 0    60   ~ 0
MOSI
Wire Wire Line
	3550 1500 4450 1500
Text Label 4450 1500 2    60   ~ 0
SPI_CS
Text Label 650  2700 0    60   ~ 0
OverTemp
Text Label 4450 2700 2    60   ~ 0
Display
Text Label 650  1500 0    60   ~ 0
SPI_CLK
$Comp
L R R107
U 1 1 593FC2C1
P 3850 2500
F 0 "R107" V 3930 2500 50  0000 C CNN
F 1 "0Ω" V 3850 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3780 2500 50  0001 C CNN
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
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3780 2700 50  0001 C CNN
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
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1230 2700 50  0001 C CNN
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
	9350 3500 8700 3500
Text Label 8700 3500 0    60   ~ 0
Display
Text Label 8700 3250 0    60   ~ 0
REG_SEL
Wire Wire Line
	650  2300 1350 2300
Wire Wire Line
	1350 2300 1550 2300
$Comp
L R R103
U 1 1 59402EDE
P 1350 2100
F 0 "R103" V 1430 2100 50  0000 C CNN
F 1 "4k7Ω" V 1350 2100 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1280 2100 50  0001 C CNN
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
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4530 2050 50  0001 C CNN
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
Text Notes 8550 5150 0    60   ~ 0
Pin 14 on Teency\ni.e. A0
Wire Wire Line
	9350 2800 8700 2800
Text Label 8700 2800 0    60   ~ 0
MISO
Wire Wire Line
	3550 1300 4450 1300
Text Label 4450 1300 2    60   ~ 0
MISO
Wire Wire Line
	9350 3850 8700 3850
Wire Wire Line
	9350 4100 8700 4100
Text Label 8700 3850 0    60   ~ 0
3V3
Text Label 8700 4100 0    60   ~ 0
3V3
Wire Wire Line
	9350 3700 8700 3700
Text Label 8700 3700 0    60   ~ 0
~DISP_ENABLE
$Comp
L Teensy-3.2 U?
U 1 1 5A70C2F6
P 6100 3850
F 0 "U?" H 6100 3900 60  0000 C CNN
F 1 "Teensy-3.2" H 5925 5025 60  0000 C CNN
F 2 "" H 5825 3525 60  0001 C CNN
F 3 "" H 5825 3525 60  0001 C CNN
	1    6100 3850
	1    0    0    -1  
$EndComp
$Sheet
S 1750 4050 1350 750 
U 5A711DDC
F0 "Power System" 60
F1 "PowerSystem.sch" 60
F2 "3V3" I R 3100 4250 60 
F3 "Vin" I L 1750 4300 60 
F4 "5V" I R 3100 4500 60 
$EndSheet
$Sheet
S 9500 750  1200 1250
U 5A711E14
F0 "Telemetry System" 60
F1 "TelemetrySystem.sch" 60
F2 "Tx" I L 9500 1350 60 
F3 "Rx" I L 9500 1550 60 
F4 "3V3" I L 9500 1000 60 
$EndSheet
Wire Wire Line
	9500 1000 9100 1000
Wire Wire Line
	9500 1350 9100 1350
Wire Wire Line
	9500 1550 9100 1550
Text Label 9100 1000 0    60   ~ 0
3V3
Text Label 9100 1550 0    60   ~ 0
TX
Text Label 9100 1350 0    60   ~ 0
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
Text Label 5150 2300 2    60   ~ 0
I2C_SDA
Wire Wire Line
	3100 4250 3650 4250
Wire Wire Line
	3100 4500 3650 4500
Text Label 3650 4250 2    60   ~ 0
3V3
Text Label 3650 4500 2    60   ~ 0
5V
Wire Wire Line
	1750 4300 1250 4300
$Comp
L Conn_01x02_Female J?
U 1 1 5A71765C
P 1050 4300
F 0 "J?" H 1050 4400 50  0000 C CNN
F 1 "Power IN" H 1250 4250 50  0000 C CNN
F 2 "" H 1050 4300 50  0001 C CNN
F 3 "" H 1050 4300 50  0001 C CNN
	1    1050 4300
	-1   0    0    -1  
$EndComp
Text Label 1400 4300 0    60   ~ 0
Vin
Wire Wire Line
	1250 4400 1400 4400
Wire Wire Line
	1400 4400 1400 4600
Wire Wire Line
	1550 2900 1350 2900
Wire Wire Line
	1350 2900 1350 3150
$Comp
L GND #PWR?
U 1 1 5A71892F
P 1350 3150
F 0 "#PWR?" H 1350 2900 50  0001 C CNN
F 1 "GND" H 1350 3000 50  0000 C CNN
F 2 "" H 1350 3150 50  0001 C CNN
F 3 "" H 1350 3150 50  0001 C CNN
	1    1350 3150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5A718A26
P 1400 4600
F 0 "#PWR?" H 1400 4350 50  0001 C CNN
F 1 "GND" H 1400 4450 50  0000 C CNN
F 2 "" H 1400 4600 50  0001 C CNN
F 3 "" H 1400 4600 50  0001 C CNN
	1    1400 4600
	1    0    0    -1  
$EndComp
Text Label 900  6800 0    60   ~ 0
OverTemp
$EndSCHEMATC
