
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
#include "ce_header.h"

#define VOLTAGE_SENSE CE_AIO_0_GPIO_8
#define OVERTEMP CE_AIO_2_GPIO_10 
#define BTN_DISPLAY CE_AIO_3_GPIO_11
#define DISPLAY_ENABLE _TEENSY_GPIO_2
#define BATT_TEST _TEENSY_A6_GPIO_20


#define ADC_VOLTAGE 0.0117302053
#define nss Serial

const int register_select = _EA_REGISTER_SELECT;
const int display_select = _EA_DISPLAY_SELECT;


double voltage_level = 0;
double temperature = 0;
double old_voltage = 0;
double old_temp = 0;
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
  initDispl();
}

/**
 * Convert the exponent and mantissa components to a single double
 * value
 */
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

/**
 * Main Control Loop
 */
void loop()
{

  int sample_level = analogRead( VOLTAGE_SENSE );
  voltage_level = (double)sample_level * ADC_VOLTAGE;
  voltage_level = ((int)(voltage_level * 10))/10.0;

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
    temperature = ((int)(temperature * 10))/10.0;
  }

  char message[100];
  uint8_t payload[100];

  if ( voltage_level != old_voltage ) {
    sprintf(message, "%2.1fV %2.0f%cC", voltage_level, temperature, 0xF2);
    nss.printf("Calling write message %s \n", message);
    ClrDisplay();
    SetPosition( LINE2 );
    WriteString((uint8_t *) message );
    
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
          SetPosition( LINE4 );
          sprintf(message, "MSG OK");
          WriteString((uint8_t *) message );

        } else {
          // the remote XBee did not receive our packet. is it powered on?
          nss.printf("Message failed to send: %d", txStatus.getDeliveryStatus() );
          SetPosition( LINE4 );
          sprintf(message, "MSG FAIL");
          WriteString((uint8_t *) message );
        }
      }
    } else if (xbee.getResponse().isError()) {
      nss.print("Error reading packet.  Error code: ");  
      nss.println(xbee.getResponse().getErrorCode());
    } else {
      // local XBee did not provide a timely TX Status Response -- should not happen
      nss.println("No response from the target");
    }
    old_voltage = voltage_level;
    old_temp = temperature;
  }

  delay(10000);

}


