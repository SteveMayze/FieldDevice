//-----------------------------------------------------
//File: lcd_spi.h
// Adapted From Electonic Assembly Application Notes
//Auth: ELECTRONIC ASSEMBLY JM
//DATE: 08-07-2012
//-----------------------------------------------------
#ifndef LCDSPI_H
#define LCDSPI_H

#include "ce_header.h"

#define _EA_REGISTER_SELECT CE_AIO_1_GPIO_9
#define _EA_DISPLAY_RESET CE_AIO_1_GPIO_9
#define _EA_DISPLAY_SELECT CE_SPI_CS_GPIO_3


//--- Standard definitions for LCD ---

#define _EA_DOGS_CLK 1000000

#define LCD_HOME_L1	0x80
#define LINE1	0x00

#define LINE2	LINE1+0x20
#define LINE3	LINE1+0x40
#define	LINE4 	LINE1+0x60

#define DISPLAY_ON 	0x04
#define DISPLAY_OFF 0x03
#define CURSOR_ON	0x02
#define CURSOR_OFF	0x05
#define BLINK_ON	0x01
#define BLINK_OFF	0x06


#define TOPVIEW		0x05
#define BOTTOMVIEW	0x06
#define ROMA		0x00
#define ROMB		0x04
#define ROMC		0x0C



void initDispl(void);


void WriteChar		(uint8_t character);
void WriteString	(uint8_t *string);
void SetPosition		(uint8_t pos);
void DisplayOnOff	(uint8_t data);
void DefineCharacter(uint8_t postion, uint8_t *data);
void ClrDisplay		(void);
void SetContrast	(uint8_t contr);
void SetView		(uint8_t view);
void SetROM			(uint8_t rom);
#define GETCURSORADDR()	CheckBusy()


//Normally you don't need these functions outside this module
static void WriteIns		(uint8_t ins);
static void WriteData		(uint8_t data);

unsigned char CheckBusy		(void);

#endif
