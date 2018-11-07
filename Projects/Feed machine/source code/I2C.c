#include"types.h"

sbit Soft_I2C_Scl at RC3_bit;
sbit Soft_I2C_Sda at RC4_bit;
sbit Soft_I2C_Scl_Direction at TRISC3_bit;
sbit Soft_I2C_Sda_Direction at TRISC4_bit;
extern u8 prev_hrs,prev_sec,prev_min,sec,mins,hrs,day,date,month,year;
extern s8 pattern;


void write_I2C(u8 sa_addr,u16 buf_addr,u8 dat)
{
    Soft_I2C_Start();
    Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
    Soft_I2C_Write((u8)buf_addr&0xFF);
    Soft_I2C_Write(dat);
    Soft_I2C_Stop();
    Delay_ms(5);
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
     Delay_ms(5);
     return buf;
}

void Check_time(void)
{
    prev_hrs=hrs;
    prev_min=mins;
    prev_sec=sec;
    sec=Bcd2Dec(read_I2C(0xD0,0x00));
    mins=Bcd2Dec(read_I2C(0xD0,0x01));
    hrs=Bcd2Dec(read_I2C(0XD0,0x02));
}