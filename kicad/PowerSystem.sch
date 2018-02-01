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
Sheet 4 6
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4400 2650 2    60   Input ~ 0
3V3
Text HLabel 4400 2350 2    60   Input ~ 0
5V
$Comp
L FD_POWER PWR?
U 1 1 5A738B85
P 3500 2700
F 0 "PWR?" H 4100 2550 60  0000 C CNN
F 1 "FD_POWER" H 3850 2900 60  0000 C CNN
F 2 "" H 3500 2700 60  0001 C CNN
F 3 "" H 3500 2700 60  0001 C CNN
	1    3500 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3000 3850 3200
$Comp
L GND #PWR?
U 1 1 5A738BC6
P 3850 3200
F 0 "#PWR?" H 3850 2950 50  0001 C CNN
F 1 "GND" H 3850 3050 50  0000 C CNN
F 2 "" H 3850 3200 50  0001 C CNN
F 3 "" H 3850 3200 50  0001 C CNN
	1    3850 3200
	1    0    0    -1  
$EndComp
$EndSCHEMATC
