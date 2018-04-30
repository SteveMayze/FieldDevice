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


#define ADC_12_VOLTAGE 0.0122189638318671
#define ADC_6_VOLTAGE  0.0074639423076923
#define nss Serial

const int register_select = _EA_REGISTER_SELECT;
const int display_select = _EA_DISPLAY_SELECT;

int msg_id = 0;
boolean panic;
int panic_count;
char message[LCD_LINE_SIZE]; 


// https://www.pjrc.com/teensy/td_libs_XBee.html
// https://www.pjrc.com/teensy/td_uart.html
// 

XBee xbee = XBee();

// XBEE_B XBeeAddress64 target_addr = XBeeAddress64(0x0013A200, 0x41629BCE);
// XBEE_B2
XBeeAddress64 target_addr = XBeeAddress64(0x0013A200, 0x415C0F82);
ZBTxStatusResponse txStatus = ZBTxStatusResponse();
ZBRxResponse rx = ZBRxResponse();

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
  
  SPI.begin();
  initDispl();

  panic_count = 1;
  panic = false;
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


void sendPacket(double voltage, double battery, double temp ) {
  uint8_t payload[100];
  
  // Watch the size of the message!
  sprintf((char*)payload, "{\"id\": %d, \"voltage\": %f, \"batt\": %f, \"temp\": %f}\n",
  msg_id++, voltage, battery, temp );
  
  uint8_t payloadSize = 0;
  for(payloadSize=0; payloadSize<100; payloadSize++){
    if (payload[payloadSize] == 0){
      break;
    }
  }
  
  ZBTxRequest tx_request = ZBTxRequest(target_addr, payload, payloadSize);
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
        sprintf(message, "SND OK");
        WriteString((uint8_t *) message );        
      } else {
        // the remote XBee did not receive our packet. is it powered on?
        nss.printf("Message failed to send: %d", txStatus.getDeliveryStatus() );
        SetPosition( LINE4 );
        sprintf(message, "SND FAIL");
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
  
}

boolean receivePacket(uint8_t payload[] ) {
  boolean received = false;
  xbee.readPacket();
  if(xbee.getResponse().isAvailable()) {
    if( xbee.getResponse().getApiId() == ZB_RX_RESPONSE){
      // Recevied a packet - Fill the Rx class.
      xbee.getResponse().getZBRxResponse(rx);
      nss.println("Received a packet");
      if(rx.getOption() == ZB_PACKET_ACKNOWLEDGED){
        // The Sender got an ACK  
        nss.println("The packet was ACKed"); 
      } else {
        // We got it bu the sender did not get the ACK
        nss.println("The packet was not ACKed"); 
        SetPosition( LINE4 );
        sprintf(message, "A");
        WriteString((uint8_t *) message );
      }
      
      nss.print("checksum: ");
      nss.println(rx.getChecksum(), HEX);
      nss.println("packet_length: ");
      nss.println(rx.getPacketLength(), DEC);
      
      for (int i = 0; i < rx.getDataLength(); i++) {
        nss.print("payload [");
        nss.print(i, DEC);
        nss.print("] is ");
        payload[i] = rx.getData()[i];
        nss.println(payload[i], HEX);
      }
      
      for (int i = 0; i < xbee.getResponse().getFrameDataLength(); i++) {
        nss.print("frame data [");
        nss.print(i, DEC);
        nss.print("] is ");
        nss.println(xbee.getResponse().getFrameData()[i], HEX);
      }
      received = true;
    } else  if (xbee.getResponse().isError()) {
      nss.print("oh no!!! error code:");
      nss.println(xbee.getResponse().getErrorCode());
      received = false;
    }
  }
  return received;
}

double readTemp(){
  Wire.beginTransmission(0x48);
  Wire.write(0x00);
  Wire.endTransmission();
  
  Wire.requestFrom(0x48, 2);
  double temp = 0;
  char temp_exp = 0;
  char temp_mant = 0;
  if( 2 <= Wire.available()){
    temp_exp = Wire.read();
    temp_mant = Wire.read();
    temp = to_temp(temp_exp, temp_mant);
    temp = ((int)(temp * 10))/10.0;
  }
  nss.print("Temperature: ");
  nss.println(temp, DEC);
  
  return temp;
}

/**
 * Returns the voltage as sensed on vInPin and based 
 * on the estimated coeficient.
 */
double readVoltage( uint8_t vInPin, double coef ) {
  int sample_level = analogRead( vInPin );
  double voltage = (double)sample_level * coef;
  voltage = ((int)(voltage * 10))/10.0;
  
  sprintf(message, "Reading:%d, Voltage:%2.1fV", sample_level, voltage);

  nss.println(message);
  return voltage;
}

/**
 * =====================================================
 * Main Control Loop
 * =====================================================
 */

void loop() {
  boolean received = false;
  
  uint8_t payload[100];

  double voltage_level;
  double batt_level;
  double temperature;
  temperature = readTemp();
  voltage_level = readVoltage(VOLTAGE_SENSE, ADC_12_VOLTAGE);
  batt_level = readVoltage(BATT_TEST, ADC_6_VOLTAGE);

  received = receivePacket(payload);
  if ( received == true ) {
    // A request from Homebaset to send the current state.
    if( 0x44 == payload[0] ){

      sprintf(message, "%2.1fV %2.0f%cC", voltage_level, temperature, 0xF2);
      ClrDisplay();
      SetPosition( LINE2 );
      WriteString((uint8_t *) message );
      
      sprintf(message, "bt %2.1fV", batt_level);
      SetPosition( LINE3 );
      WriteString((uint8_t *) message );
      
      sendPacket(voltage_level,  batt_level, temperature );      
    }
  } else {
    // The measured voltages - System plus battery backup are verified to be
    // in the correct range. If lower than wanted, then send an event message
    if ( (voltage_level < 11.0) || ( batt_level < 5.0 )) {
      panic = true;
      if((panic_count % 30) == 0) { // Every 5 minutes
        // Only send the event every 10x3=30 seconds. No point in flooding the
        // airwaves.
        sprintf(message, "%2.1fV %2.0f%cC", voltage_level, temperature, 0xF2);
        ClrDisplay();
        SetPosition( LINE2 );
        WriteString((uint8_t *) message );
        
        sprintf(message, "bt %2.1fV", batt_level);
        SetPosition( LINE3 );
        WriteString((uint8_t *) message );
        sendPacket(voltage_level,  batt_level, temperature );
      }
      panic_count++;
    } else{
      panic_count = 1;
      if( panic == true ){
        sprintf(message, "%2.1fV %2.0f%cC", voltage_level, temperature, 0xF2);
        ClrDisplay();
        SetPosition( LINE2 );
        WriteString((uint8_t *) message );
        
        sprintf(message, "bt %2.1fV", batt_level);
        SetPosition( LINE3 );
        WriteString((uint8_t *) message );
        sendPacket(voltage_level,  batt_level, temperature );
        panic = false;        
      }
    }
  }
        
  delay(10000);  
  payload[0] = 0x00;
  


  // IREQ - Display triggered
  // IREQ - Radio triggered
  
}


