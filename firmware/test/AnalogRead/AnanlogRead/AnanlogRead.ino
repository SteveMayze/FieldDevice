
// DS7505 
// by Alexandre Coffignal <http://www. ... .com>

// Demonstrates use of the DS7505 library
// Reads data from an I2C/TWI DS7505 slave device

// Created 26 October 2010

#include <Wire.h>
#include <math.h>

#define VOLTAGE_SENSE 14
#define ADC_VOLTAGE 0.0117302053

double voltage_level = 0;


void setup()
{
  Wire.begin();        // join i2c bus (address optional for master)
  Serial.begin(9600);  // start serial for output
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
  Serial.printf( "voltage:{sample: %d, value: %f}, temperature:{sample:{%d, %d}, TEMPERATURE=%f}\n",
                sample_level, voltage_level, temp_exp, temp_mant, temperature );
    
  delay(1000);

}
