#include"types.h"


sbit H_I2C_Scl at RC3_bit;
sbit H_I2C_Sda at RC4_bit;
sbit H_I2C_Scl_Direction at TRISC3_bit;
sbit H_I2C_Sda_Direction at TRISC4_bit;

extern u8 prev_hrs,prev_min,sec,mins,hrs,day,date,month,year;
extern s8 pattern;

void write_I2C(u8 sa_addr,u16 buf_addr,u8 dat)
{
    I2C1_Start();
    I2C1_Wr(sa_addr | ((buf_addr>>7)&0x0E));
    I2C1_Wr((u8)buf_addr&0xFF);
    I2C1_Wr(dat);
    I2C1_Stop();
    Delay_ms(10);
}
u8 read_I2C(u8 sa_addr,u16 buf_addr)
{
     u8 buf=0;
     I2C1_Start();
     I2C1_Wr(sa_addr | ((buf_addr>>7)&0x0E));
     I2C1_Wr((u8)buf_addr&0xFF);
     I2C1_Repeated_Start();
     I2C1_wr(sa_addr|1);
     buf=I2C1_Rd(0);
     I2C1_Stop();
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