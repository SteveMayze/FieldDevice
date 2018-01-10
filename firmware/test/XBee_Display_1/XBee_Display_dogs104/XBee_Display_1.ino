
// DS7505 
// by Alexandre Coffignal <http://www. ... .com>

// Demonstrates use of the DS7505 library
// Reads data from an I2C/TWI DS7505 slave device

// Created 26 October 2010

#include <XBee.h>
#include <Wire.h>
#include <SPI.h>
#include <math.h>
#include "lcd_spi.h"

// #define _EA_DOGS_108
#define _EA_DOGS_104
#define _EA_DOGS_CLK 100000

#define VOLTAGE_SENSE 14
#define ADC_VOLTAGE 0.0117302053
#define nss Serial

const int register_select = 15;
const int display_select = 10;


double voltage_level = 0;
int msg_id = 1;

XBee xbee = XBee();

XBeeAddress64 target_addr = XBeeAddress64(0x0013A200, 0x41629BCE);
ZBTxStatusResponse txStatus = ZBTxStatusResponse();

void setup()
{
  pinMode(register_select, OUTPUT);  
  pinMode(register_select, HIGH);
  pinMode(display_select, OUTPUT);
  pinMode(display_select, HIGH);

  Wire.begin();        // join i2c bus (address optional for master)
  
  nss.begin(9600);  // start serial for output
  Serial1.begin(9600);
  xbee.setSerial(Serial1);
  
  voltage_level = analogRead( VOLTAGE_SENSE );

  SPI.begin();

  //#ifdef _EA_DOGS_104
  initDispl();
  //#endif
  

}

double to_temp(char exponent, char mantissa){
    double result = 0.0f;
    double _exponent = 0.0f;
    double _significad = 0.0f;

    // char _exp = exponent;
    _exponent = exponent;
    char _mantissa = mantissa;
    for(int idx= 0; idx < 8; idx++){
        int bit = (_mantissa & (1 << (7-idx))) >> (7-idx);
        _significad += bit * pow(2, (-1 *(idx+1)));
    }
    result = _exponent + _significad;
    return result;
}


void loop()
{

  int sample_level = analogRead( VOLTAGE_SENSE );
  voltage_level = (double)sample_level * ADC_VOLTAGE;
  
  
  double temperature = 0;
  Wire.beginTransmission(0x48);
  Wire.write(0x00);
  Wire.endTransmission();
  
  Wire.requestFrom(0x48, 2);
  char temp_exp = 0;
  char temp_mant = 0;
  if( 2<= Wire.available()){
    temp_exp = Wire.read();
    temp_mant = Wire.read();
    temperature = to_temp(temp_exp, temp_mant);
  }

  char message[100];
  uint8_t payload[100];

  #ifdef _EA_DOGS_104
  // ClrDisplay();
  initDispl();
  ClrDisplay();
  SetPosition(LINE2);
  SetContrast(0x1F);
  #else
  initDisplay();
  #endif
  
  
  delay(2);
  sprintf(message, "%2.1fV %2.0f%cC", voltage_level, temperature, 0xF2);
  nss.printf("Calling write message %s \n", message);
  writeMessage( message );
  
   nss.printf( "\n{\"id\": %d, \"voltage\": %2.1f, \"temperature\": %2.1f}\n",
                msg_id, voltage_level, temperature );
   sprintf(message, "{\"id\": %d, \"voltage\": %f, \"temperature\": %f}\n",
                 msg_id, voltage_level, temperature );
   msg_id++;

   uint8_t payloadSize = 0;
   for(payloadSize=0; payloadSize<100; payloadSize++){
      if (message[payloadSize] == 0){
        break;
      }
      payload[payloadSize] = message[payloadSize];
   }

   
  ZBTxRequest tx_request = ZBTxRequest(target_addr, payload, payloadSize);
      nss.println("");

  xbee.send(tx_request);

  if (xbee.readPacket(500)) {
    // got a response!

    // should be a znet tx status              
    if (xbee.getResponse().getApiId() == ZB_TX_STATUS_RESPONSE) {
      xbee.getResponse().getTxStatusResponse(txStatus);

      // get the delivery status, the fifth byte
      if (txStatus.getDeliveryStatus() == SUCCESS) {
        // success.  time to celebrate
        nss.println("Message sent OK.");
      } else {
        // the remote XBee did not receive our packet. is it powered on?
        nss.printf("Message failed to send: %d", txStatus.getDeliveryStatus() );
      }
    }
  } else if (xbee.getResponse().isError()) {
    nss.print("Error reading packet.  Error code: ");  
    nss.println(xbee.getResponse().getErrorCode());
  } else {
    // local XBee did not provide a timely TX Status Response -- should not happen
    nss.println("No response from the target");
  }

  delay(5000);

}


#ifdef _EA_DOGS_104

#define _EA_EXECUTION_TIME_WAIT 1


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
digitalWrite(register_select, HIGH);
Wait(5);
digitalWrite(register_select, LOW);
Wait(100);
digitalWrite(register_select, HIGH);
Wait(100);

  //init Display
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

  // ClrDisplay();
  // DisplayOnOff(DISPLAY_ON | CURSOR_OFF | BLINK_OFF);
  DisplayOnOff(DISPLAY_ON );
}

//-----------------------------------------------------
//Func: WriteChar(character)
//Desc: sends a single character to display
//-----------------------------------------------------
void WriteChar (char character)
{
  WriteData(character);
}

//-----------------------------------------------------
//Func: WriteString(string)
//Desc: sends a string to display, must be 0 terminated
//-----------------------------------------------------
void WriteString( char *string)
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
void SetPosition(char pos)
{
  WriteIns(LCD_HOME_L1+pos);
}

//-----------------------------------------------------
//Func: DisplayOnOff(control)
//Desc: use definitions of header file to set display
//-----------------------------------------------------
void DisplayOnOff(char data)
{
  WriteIns(0x08 | data);
}

//-----------------------------------------------------
//Func: DefineCharacter(memory postion, character data)
//Desc: stores an own defined character
//-----------------------------------------------------
void DefineCharacter(unsigned char postion, unsigned char *data)
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
void SetContrast(unsigned char contr)
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
void SetView(unsigned char view)
{
  WriteIns(0x3A);
  WriteIns(view);
  WriteIns(0x38);
}

//-----------------------------------------------------
//Func: SetROM
//Desc: Changes the Rom code (ROMA=0x00, ROMB=0x04, ROMC=0x0C)
//---------------------------------------------------
void SetROM (unsigned char rom)
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
static void WriteIns(char ins)
{
  SPI.beginTransaction(SPISettings(_EA_DOGS_CLK, LSBFIRST, SPI_MODE3));
  digitalWrite(display_select, LOW);
  CheckBusy();
  SPI_put(0x1F);        //Send 5 synchronisation bits, RS = 0, R/W = 0
  SPI_put(ins & 0x0F);    //send lower data bits
  SPI_put((ins>>4) & 0x0F);   //send higher data bits
  digitalWrite(display_select, HIGH);
  SPI.endTransaction();
}

//-----------------------------------------------------
//Func: WriteData(data)
//Desc: sends data to display
//-----------------------------------------------------
static void WriteData(char data)
{
  SPI.beginTransaction(SPISettings(_EA_DOGS_CLK, LSBFIRST, SPI_MODE3));
  digitalWrite(display_select, LOW);
  CheckBusy();
  SPI_put(0x5F);        //Send 5 synchronisation bits, RS = 1, R/W = 0
  SPI_put(data & 0x0F);   //send lower data bits
  SPI_put((data>>4) & 0x0F);  //send higher data bits
  digitalWrite(display_select, HIGH);
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


void initDisplay(){
  initDispl();
}

void writeMessage(char *value){
  WriteString( value );
}


#endif

#ifdef _EA_DOGS_108

void initDisplay(){
  nss.printf("Init display");

  unsigned int init[9] = {0x31, 0x14, 0x55, 0x6d, 0x74, 0x30, 0x0c, 0x01, 0x06};

  SPI.beginTransaction(SPISettings(_EA_DOGS_CLK, LSBFIRST, SPI_MODE3));
  // take the SS pin low to select the chip:
  digitalWrite(register_select, LOW);
  //delayMicroseconds(10);
  digitalWrite(display_select, LOW);
  for( int i=0; i<9; i++){
     SPI.transfer( init[i] );
     delayMicroseconds(50);
  }
  // take the SS pin high to de-select the chip:
  digitalWrite(display_select, HIGH);
  // delayMicroseconds(10);
  digitalWrite(register_select, HIGH);
  SPI.endTransaction();
}

void writeMessage(char* value){
    nss.printf("  >>> writing message %s \n", value);

  SPI.beginTransaction(SPISettings(_EA_DOGS_CLK, LSBFIRST, SPI_MODE3));
  // take the SS pin low to select the chip:
  digitalWrite(display_select, LOW);
  //  send in the address and value via SPI:
  for(int i=0; value[i] != 0; i++){
     SPI.transfer(value[i]);
     delayMicroseconds(50);
  }
  // take the SS pin high to de-select the chip:
  digitalWrite(display_select, HIGH);
  // release control of the SPI port
  SPI.endTransaction();
}

#endif
