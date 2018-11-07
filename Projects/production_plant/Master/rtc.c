#include<reg51.h>
#include"types.h"
#include"i2c.h"
#include"delay.h"
#include"lcd.h"
#include"keypad.h"
#include"string.h"
#include"stdlib.h" 

extern u8 td_flag;
u8 sec,min,hrs,day,date,month,year; 
code u8 s_day[8][10]={" ","MONDAY","TUESDAY","WEDNESDAY","THURSDAY","FRIDAY","SATURDAY","SUNDAY"}; 

/*void read_time()
{
	sec=rtc_read(0xD0,0x00);
	min=rtc_read(0xD0,0x01);
	hrs=rtc_read(0xD0,0x02);
	day=rtc_read(0xD0,0x03);
	date=rtc_read(0xD0,0x04);
	month=rtc_read(0xD0,0x05);
	year=rtc_read(0xD0,0x06);
} */


u8 ascii_bcd(u8 *value)
{
	u8 dat=0;
	if(value[1]=='\0')
	 {
	 	dat=value[0]-48;
		return dat; 
	 }
	 else
	  {
	    dat=((value[1]-48)&(0x0f))|((value[0]-48)<<4);
		return dat;
	  }
}
	  

void edit_time()
{
	 u8 value[2];
	 td_flag=2;
	 lcd_cmd(0x80); 	lcd_str("******MENU******");
	 lcd_cmd(0xC0);		lcd_str("M-Mode E-Enter");
			
	 if(keyscan()=='M')
	  {
	  	while(!colscan());
		do					//edit sec
		 {
		   memset(value,0,2);
	 	   lcd_cmd(0x01);lcd_cmd(0x80);lcd_str("Enter sec");
		   strcpy(value,get_value());
		   if(atoi(value)>60) 
		    { lcd_cmd(0x01); lcd_cmd(0x80); lcd_str("Sec must be<60"); delay_1ms(1000); }
	 	 }while(atoi(value)>60);
		  I2C_device_write(0xD0,0x00,ascii_bcd(value));
		
		do						   //edit min
		 {
		 	memset(value,0,2);
			lcd_cmd(0x01);lcd_cmd(0x80);	lcd_str("Enter min");
			strcpy(value,get_value());
			if(atoi(value)>60) 
			 { lcd_cmd(0x01); lcd_cmd(0x80); lcd_str("Min must be<60"); delay_1ms(1000); }
		 }while(atoi(value)>60);
		  I2C_device_write(0xD0,0x01,ascii_bcd(value));

		do
		 {
		   memset(value,0,2);
	  	   lcd_cmd(0x01);lcd_cmd(0x80);	lcd_str("Enter Hrs");
		   strcpy(value,get_value());
		   if(atoi(value)>24) 
 	     { lcd_cmd(0x01); lcd_cmd(0x80); lcd_str("Hrs must be<24"); delay_1ms(1000);}
		 }while(atoi(value)>24);
	     I2C_device_write(0xD0,0x02,ascii_bcd(value));

		 do
		  {
		    memset(value,0,2);
			lcd_cmd(0x01);lcd_cmd(0x80);	lcd_str("Enter Day");
			strcpy(value,get_value());
			if(atoi(value)>7) 
			 { lcd_cmd(0x01); lcd_cmd(0x80); lcd_str("Day must be<7"); delay_1ms(1000); }
		   }while(atoi(value)>7);
		   I2C_device_write(0xD0,0x03,ascii_bcd(value));


		 do
		  {
		    memset(value,0,2);
		    lcd_cmd(0x01);lcd_cmd(0x80);	lcd_str("Enter Date");
		    strcpy(value,get_value());
		    if(atoi(value)>31) 
		     { lcd_cmd(0x01); lcd_cmd(0x80); lcd_str("Date must be<31"); delay_1ms(1000); }
		  }while(atoi(value)>31);
		   I2C_device_write(0xD0,0x04,ascii_bcd(value));

		 do
		  {
		   memset(value,0,2);
		   lcd_cmd(0x01);lcd_cmd(0x80);	lcd_str("Enter month");
		   strcpy(value,get_value());
		   if(atoi(value)>12) 
		   { lcd_cmd(0x01); lcd_cmd(0x80); lcd_str("month must be<12"); delay_1ms(1000); }
		  }while(atoi(value)>12);
		   I2C_device_write(0xD0,0x05,ascii_bcd(value));

		do
		 {
		   memset(value,0,2);
	  	   lcd_cmd(0x01); lcd_cmd(0x80);	lcd_str("Enter year");
		   strcpy(value,get_value());
		   if(atoi(value)>99) 
		    { lcd_cmd(0x01); lcd_cmd(0x80); lcd_str("year must be<99");delay_1ms(1000); }
		 }while(atoi(value)>99);
	      I2C_device_write(0xD0,0x06,ascii_bcd(value));	   
			
	}//if
	else
	 { lcd_cmd(0x01); lcd_cmd(0x80); lcd_str("Date not set"); delay_1ms(1000); }
}


