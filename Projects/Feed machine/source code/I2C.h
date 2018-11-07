#ifndef I2C_H
#define I2C_H
  #include"types.h"
  extern void write_I2C(u8 sa_addr,u16 buf_addr,u8 dat);
  extern u8 read_I2C(u8 sa_addr,u16 buff_add);
  extern void Check_time(void);
#endif