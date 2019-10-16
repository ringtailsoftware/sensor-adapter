#include <Wire.h>
#include <SparkFun_MS5803_I2C.h>

MS5803 sensor(ADDRESS_HIGH);    // 0x76

void setup() {
    pinMode(11, OUTPUT);
    Wire.begin();
    sensor.reset();
    sensor.begin();
}

void loop() {
    analogWrite(11, sensor.getPressure(ADC_256));
}

