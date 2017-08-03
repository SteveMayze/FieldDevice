
// DS7505 
// by Alexandre Coffignal <http://www. ... .com>

// Demonstrates use of the DS7505 library
// Reads data from an I2C/TWI DS7505 slave device

// Created 26 October 2010

#include <Wire.h>


void setup()
{
  Wire.begin();        // join i2c bus (address optional for master)
  Serial.begin(9600);  // start serial for output
}

void loop()
{

  float temperature = 0;
  Wire.beginTransmission(0x48);
  Wire.write(0x00);
  Wire.endTransmission();
  
  Wire.requestFrom(0x48, 2);
  if( 2<= Wire.available()){
    char temp_int = Wire.read();
    char temp_dec = Wire.read();

    float dec = (temp_dec >> 7) / 2.0;
    temperature = temp_int + dec;    
    Serial.printf("SAMPLE={%d, %d}, TEMPERATURE=%f\n", temp_int, temp_dec, temperature);
  }  
  delay(1000);

}
