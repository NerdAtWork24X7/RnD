#include"types.h"

sbit Soft_I2C_Scl at RC6_bit;
sbit Soft_I2C_Sda at RC7_bit;
sbit Soft_I2C_Scl_Direction at TRISC6_bit;
sbit Soft_I2C_Sda_Direction at TRISC7_bit;

extern u8 prev_hrs,prev_min,sec,mins,hrs,day,date,month,year,pattern;


void write_I2C(u8 sa_addr,u16 buf_addr,u8 dat)
{
    Soft_I2C_Start();
    Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
    Soft_I2C_Write((u8)buf_addr&0xFF);
    Soft_I2C_Write(dat);
    Soft_I2C_Stop();
    Delay_ms(10);
}
u8 read_I2C(u8 sa_addr,u16 buf_addr)
{
     u8 buf=0;
     Soft_I2C_Start();
     Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
     Soft_I2C_Write((u8)buf_addr&0xFF);
     Soft_I2C_Start();
     Soft_I2C_write(sa_addr|1);
     buf=Soft_I2C_Read(0);
     Soft_I2C_Stop();
     return buf;
}

void Check_time(void)
{
    prev_hrs=hrs;
    prev_min=mins;
    mins=Bcd2Dec(read_I2C(0xD0,0x01));
    delay_ms(10);
    hrs=Bcd2Dec(read_I2C(0XD0,0x02));
    delay_ms(10);
}