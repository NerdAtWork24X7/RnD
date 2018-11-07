#include<reg51.h>
#include"types.h"
#include"delay.h"

#define LCD_DATA P2

sbit rs=P0^0;
sbit rw=P0^1;
sbit en=P0^2;

void lcd_write(u8 dat)
{
	LCD_DATA=dat;
	rw=0;
	en=1;	//high to low pulse required for writing
	delay_1ms(2);
	en=0;
}

void lcd_cmd(u8 cmd)
{
	rs=0;	//select the commad register
	lcd_write(cmd);
}

void lcd_char(u8 ch)
{	
	rs=1;	//select the write resgister
	lcd_write(ch);
}

void lcd_init(void)
{
	delay_1ms(16);
	lcd_cmd(0x38);
	lcd_cmd(0x80);
	lcd_cmd(0x02);
	lcd_cmd(0x06);
	lcd_cmd(0x0c);
}

void lcd_str(u8* s)
{
	while(*s)
	 lcd_char(*s++);
}

/*void lcd_uint(u16 n)
{	
	u8 arr[5]={0};
	s8 i=0;

	if(n==0)
	  lcd_char('0');
	
	else
	  {
	  	while(n>0)
		 {
		 	arr[i++]=(n%10)+48;
			n/=10;
		 }
	  	
		for(--i;i>=0;i--)
		 {
			lcd_char(arr[i]);
		 }
	  }
}

void lcd_float(float f)
{
	u16 t;
	u8 i;
	t=f;

	lcd_uint(t);
	lcd_char('.');

	for(i=0;i<6;i++)
	 {
	 	f=(f-t)*10;
		t=f;
		lcd_uint(t); //char_lcd(t+48);
	 }

 }*/
 
