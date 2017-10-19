
// DS7505 
// by Alexandre Coffignal <http://www. ... .com>

// Demonstrates use of the DS7505 library
// Reads data from an I2C/TWI DS7505 slave device

// Created 26 October 2010

#include <XBee.h>
#include <Wire.h>
#include <SPI.h>
#include <math.h>

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

  initDisplay();
  delay(2);
  sprintf(message, "%2.1fV %2.0f%cC", voltage_level, temperature, 0xF2);
  nss.printf("Calling write message %s \n", message);
  writeMessage( message );
  
   nss.printf( "\n{id: %d, voltage: %2.1f, temperature: %2.1f}\n",
                msg_id, voltage_level, temperature );
   sprintf(message, "{id: %d, voltage: %f, temperature: %f}\n",
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



void initDisplay(){
  nss.printf("Init display");

  unsigned int init[9] = {0x31, 0x14, 0x55, 0x6d, 0x74, 0x30, 0x0c, 0x01, 0x06};

  SPI.beginTransaction(SPISettings(2000000, MSBFIRST, SPI_MODE3));
  // take the SS pin low to select the chip:
  digitalWrite(register_select,LOW);
  //delayMicroseconds(10);
  digitalWrite(display_select,LOW);
  for( int i=0; i<9; i++){
     SPI.transfer( init[i] );
     delayMicroseconds(50);
  }
  // take the SS pin high to de-select the chip:
  digitalWrite(display_select,HIGH);
  // delayMicroseconds(10);
  digitalWrite(register_select,HIGH);
  SPI.endTransaction();
}

void writeMessage(char* value){
    nss.printf("  >>> writing message %s \n", value);

  SPI.beginTransaction(SPISettings(2000000, MSBFIRST, SPI_MODE3));
  // take the SS pin low to select the chip:
  digitalWrite(display_select,LOW);
  //  send in the address and value via SPI:
  for(int i=0; value[i] != 0; i++){
     SPI.transfer(value[i]);
     delayMicroseconds(50);
  }
  // take the SS pin high to de-select the chip:
  digitalWrite(display_select,HIGH);
  // release control of the SPI port
  SPI.endTransaction();
}
