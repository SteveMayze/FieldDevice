//-----------------------------------------------------
//File: lcd_spi.c
// Adapted From Electonic Assembly Application Notes
// https://www.lcd-module.de/support/application-note.html
//Auth: ELECTRONIC ASSEMBLY JM
//DATE: 08-25-2013
//-----------------------------------------------------

#include <SPI.h>
#include "lcd_spi.h"


//--- module global varibles ---


//--- waitstates for testing ---
//use these macros to slow the communication down
#define WAITST 2

#define Wait(x) delayMicroseconds( x )
#define SPI_put(x) SPI.transfer( x )

//-----------------------------------------------------
//Func: initDispl()
//Desc: inits Display
//-----------------------------------------------------
void initDispl(void)
{
  // unsigned char i;

  //Perform a display reset
digitalWrite(_EA_DISPLAY_RESET, HIGH);
Wait(5);
digitalWrite(_EA_DISPLAY_RESET, LOW);
Wait(100);
digitalWrite(_EA_DISPLAY_RESET, HIGH);
Wait(100);
  //init Display
  DisplayOnOff(DISPLAY_OFF);
  WriteIns(0x3A); //8-Bit data length extension Bit RE=1; REV=0
  WriteIns(0x09); //4 line display
  WriteIns(0x06); //Bottom view
  WriteIns(0x1E); //Bias setting BS1=1
  WriteIns(0x39); //8-Bit data length extension Bit RE=0; IS=1
  WriteIns(0x1B); //BS0=1 -> Bias=1/6
  WriteIns(0x6E); //Devider on and set value
  WriteIns(0x57); //Booster on and set contrast (BB1=C5, DB0=C4)
  WriteIns(0x72); //Set contrast (DB3-DB0=C3-C0)
  WriteIns(0x38); //8-Bit data length extension Bit RE=0; IS=0

  ClrDisplay();
  // DisplayOnOff(DISPLAY_ON | CURSOR_OFF | BLINK_OFF);
  DisplayOnOff(DISPLAY_ON );
}

//-----------------------------------------------------
//Func: WriteChar(character)
//Desc: sends a single character to display
//-----------------------------------------------------
void WriteChar (uint8_t character)
{
  WriteData(character);
}

//-----------------------------------------------------
//Func: WriteString(string)
//Desc: sends a string to display, must be 0 terminated
//-----------------------------------------------------
void WriteString(uint8_t *string)
{
  do
  {
    WriteData(*string++);
  }
  while(*string);
}


//-----------------------------------------------------
//Func: SetPosition(position)
//Desc: set postion
//-----------------------------------------------------
void SetPosition(uint8_t pos)
{
  WriteIns(LCD_HOME_L1+pos);
}

//-----------------------------------------------------
//Func: DisplayOnOff(control)
//Desc: use definitions of header file to set display
//-----------------------------------------------------
void DisplayOnOff(uint8_t data)
{
  WriteIns(0x08 | data);
}

//-----------------------------------------------------
//Func: DefineCharacter(memory postion, character data)
//Desc: stores an own defined character
//-----------------------------------------------------
void DefineCharacter(uint8_t postion, uint8_t *data)
{
  unsigned char i=0;
  WriteIns(0x40+8*postion);

  for (i=0; i<8; i++)
  {
    WriteData(data[i]);
  }
  SetPosition(LINE1);
}
//-----------------------------------------------------
//Func: ClrDisplay
//Desc: Clears entire Display content and set home pos
//-----------------------------------------------------
void ClrDisplay(void)
{
  WriteIns(0x01);
  SetPosition(LINE1);
}

//-----------------------------------------------------
//Func: SetContrast
//Desc: Sets contrast 0..63
//-----------------------------------------------------
void SetContrast(uint8_t contr)
{
  WriteIns(0x39);
  WriteIns(0x54 | (contr >> 4));
  WriteIns(0x70 | (contr & 0x0F));
  WriteIns(0x38);

}

//-----------------------------------------------------
//Func: SetView
//Desc: view bottom view(0x06), top view (0x05)
//-----------------------------------------------------
void SetView(uint8_t view)
{
  WriteIns(0x3A);
  WriteIns(view);
  WriteIns(0x38);
}

//-----------------------------------------------------
//Func: SetROM
//Desc: Changes the Rom code (ROMA=0x00, ROMB=0x04, ROMC=0x0C)
//---------------------------------------------------
void SetROM (uint8_t rom)
{
  WriteIns(0x2A);
  WriteIns(0x72);
  WriteData(rom);
  WriteIns(0x28);
}

//-----------------------------------------------------
//Func: WriteIns(instruction)
//Desc: sends instruction to display
//-----------------------------------------------------
static void WriteIns(uint8_t ins)
{
  SPI.beginTransaction(SPISettings(_EA_DOGS_CLK, LSBFIRST, SPI_MODE3));
  digitalWrite(_EA_DISPLAY_SELECT, LOW);
  CheckBusy();
  SPI_put(0x1F);        //Send 5 synchronisation bits, RS = 0, R/W = 0
  SPI_put(ins & 0x0F);    //send lower data bits
  SPI_put((ins>>4) & 0x0F);   //send higher data bits
  digitalWrite(_EA_DISPLAY_SELECT, HIGH);
  SPI.endTransaction();
}

//-----------------------------------------------------
//Func: WriteData(data)
//Desc: sends data to display
//-----------------------------------------------------
static void WriteData(uint8_t data)
{
  SPI.beginTransaction(SPISettings(_EA_DOGS_CLK, LSBFIRST, SPI_MODE3));
  digitalWrite(_EA_DISPLAY_SELECT, LOW);
  CheckBusy();
  SPI_put(0x5F);        //Send 5 synchronisation bits, RS = 1, R/W = 0
  SPI_put(data & 0x0F);   //send lower data bits
  SPI_put((data>>4) & 0x0F);  //send higher data bits
  digitalWrite(_EA_DISPLAY_SELECT, HIGH);
  SPI.endTransaction();
}

//-----------------------------------------------------
//Func: CheckBusy()
//Desc: checks if display is idle
//-----------------------------------------------------
unsigned char CheckBusy(void)
{
  unsigned char readData = 1;

/*  do
  {
    SPI_put(0x3F); //Send 5 synchronisation bits, RS = 0, R/W = 1
    SPI_put(0x00); //dummy write to receive data
    while(ri_u0c1 == 0);  //wait while data is received
    readData= ~u0rbl;     //store data
  }while(readData&0x80); //check for busyflag
*/
  return readData;
}



