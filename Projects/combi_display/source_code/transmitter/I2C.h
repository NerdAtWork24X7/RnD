#ifndef I2C_H
#define I2C_H
  #include"types.h"
  extern void write_I2C(uint8_t sa_addr,uint16_t buf_addr,uint8_t dat);
  extern uint8_t read_I2C(uint8_t sa_addr,uint16_t buff_add);
  extern void Check_time(void);
  
  #define CHANNEL_0 0x10
  #define CHANNEL_1 0x11
  #define CHANNEL_2 0x12
  #define CHANNEL_3 0x13
  #define CHANNEL_4 0x14
  #define CHANNEL_5 0x15

  #define RSSI      0x20
  #define WEIGHT    0x30
#endif