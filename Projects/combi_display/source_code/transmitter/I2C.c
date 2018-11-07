#include "types.h"

sbit Soft_I2C_Scl at RD0_bit;
sbit Soft_I2C_Sda at RD1_bit;
sbit Soft_I2C_Scl_Direction at TRISD0_bit;
sbit Soft_I2C_Sda_Direction at TRISD1_bit;



void write_I2C(uint8_t sa_addr,uint16_t buf_addr,uint8_t dat)
{
    Soft_I2C_Start();
    Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
    Soft_I2C_Write((uint8_t)buf_addr&0xFF);
    Soft_I2C_Write(dat);
    Soft_I2C_Stop();
    Delay_ms(10);
}

uint8_t read_I2C(uint8_t sa_addr,uint16_t buf_addr)
{
     uint8_t buf=0;
     Soft_I2C_Start();
     Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
     Soft_I2C_Write((uint8_t)buf_addr&0xFF);
     Soft_I2C_Start();
     Soft_I2C_write(sa_addr|1);
     buf=Soft_I2C_Read(0);
     Soft_I2C_Stop();
     return buf;
}

