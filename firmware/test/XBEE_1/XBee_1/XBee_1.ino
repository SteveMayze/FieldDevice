
// DS7505 
// by Alexandre Coffignal <http://www. ... .com>

// Demonstrates use of the DS7505 library
// Reads data from an I2C/TWI DS7505 slave device

// Created 26 October 2010

#include <XBee.h>
#include <Wire.h>
#include <math.h>

#define VOLTAGE_SENSE 14
#define ADC_VOLTAGE 0.0117302053
#define nss Serial


double voltage_level = 0;
int msg_id = 1;

XBee xbee = XBee();
//Rx64Response rx_response = Rx64Response();
//XBeeAddress64 target_addr = XBeeAddress64(0x0013A200, 0x41629BCE);
//TxStatusResponse txStatus = TxStatusResponse();

XBeeAddress64 target_addr = XBeeAddress64(0x0013A200, 0x41629BCE);
ZBTxStatusResponse txStatus = ZBTxStatusResponse();

void setup()
{
  Wire.begin();        // join i2c bus (address optional for master)
  
  nss.begin(9600);  // start serial for output
  Serial1.begin(9600);
  xbee.setSerial(Serial1);
  
  voltage_level = analogRead( VOLTAGE_SENSE );

}


double to_temp(char exponent, char mantissa){
    double result = 0.0f;
    double _exponent = 0.0f;
    double _significad = 0.0f;

    // char _exp = exponent;
    _exponent = exponent;
    //for(int idx = 0; idx < 8; idx++){
    //    int bit = (_exp & (1<<idx))>>idx;        
    //    _exponent += bit * pow(2, idx);
    //}
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

  // xbee.readPacket();

//  if (xbee.getResponse().isAvailable()) {
//    // got something
//
//    if (xbee.getResponse().getApiId() == ZB_RX_RESPONSE) {
//      xbee.getResponse().getRx64Response(rx_response);
//
//      nss.print("Received I/O Sample from: ");
//      
//      nss.print(rx_response.getRemoteAddress64().getMsb(), HEX);  
//      nss.print(rx_response.getRemoteAddress64().getLsb(), HEX);  
//      nss.println("");
//
//      uint8_t* data = rx_response.getData();
//      uint8_t str[100];
//      for( int i=0; i<rx_response.getDataLength(); i++){
//        str[i] = data[i+1];
//      }
//      str[rx_response.getDataLength()] = 0;
//
//      nss.printf("{data: %s}", str);
//
//      // method for printing the entire frame data
//      //for (int i = 0; i < xbee.getResponse().getFrameDataLength(); i++) {
//      //  nss.print(xbee.getResponse().getFrameData()[i], HEX);
//      //  nss.print(" ");
//      //}
//      //nss.println("");
//    } 
//    else {
//      nss.print("Expected I/O Sample, but got ");
//      nss.print(xbee.getResponse().getApiId(), HEX);
//    }    
//  } else if (xbee.getResponse().isError()) {
//    nss.print("Error reading packet.  Error code: ");  
//    nss.println(xbee.getResponse().getErrorCode());
//  }

  
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
  
   nss.printf( "\n{id: %d, voltage: %f, temperature: %f}\n",
                msg_id, voltage_level, temperature );
  sprintf(message, "{id: %d, voltage: %f, temperature: %f}",
                 msg_id, voltage_level, temperature );
   msg_id++;

   uint8_t payloadSize = 0;
   for(payloadSize=0; payloadSize<100; payloadSize++){
      if (message[payloadSize] == 0){
        break;
      }
      payload[payloadSize] = message[payloadSize];
   }

   
  // Tx64Request tx_request = Tx64Request(target_addr, payload, payloadSize);  
  ZBTxRequest tx_request = ZBTxRequest(target_addr, payload, payloadSize);

      // method for printing the entire frame data
//      for (uint8_t i = 0; i < tx_request.getFrameDataLength(); i++) {
//        nss.print(tx_request.getFrameData(i), HEX);
//        nss.print(" ");
//      }
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
