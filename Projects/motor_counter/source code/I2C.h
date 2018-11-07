#ifndef I2C_H
#define I2C_H
  #include"types.h"
  extern void write_I2C(uint8_t sa_addr,uint16_t buf_addr,uint8_t dat);
  extern uint8_t read_I2C(uint8_t sa_addr,uint16_t buff_add);
  extern void Check_time(void);
#endif