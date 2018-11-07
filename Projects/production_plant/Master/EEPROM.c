#include"types.h"
#include"I2C.h"
#include"delay.h"
#include"string.h"
#include"uart.h"

void write_EEPROM(u8* value,u8 disp)
{
	u8 i,Slave_Addr=0xa0;
	u16 Addr;
	
	if(disp=='A')	Addr=0x0010;

	else if(disp=='B')	Addr=0x0020;
	
	else if(disp=='C')	Addr=0x0030;

	if(disp=='A' || disp=='B' || disp=='C')
	{
	  for(i=0;i<6;i++)								 //Clearing Memory to store new data
	    I2C_device_write(Slave_Addr,Addr+i,0);
	
	  for(i=0;i<strlen(value);i++)
	    I2C_device_write(Slave_Addr,Addr+i,value[i]);
	  I2C_device_write(Slave_Addr,Addr+i,disp);
	}

}

void read_EEPROM(u8 disp)
{
	u8 i=0, Slave_Addr=0xa0, dat;
	u16 Addr;
  	
	if(disp=='A')	Addr=0x0010;

	else if(disp=='B')	Addr=0x0020;
	
	else if(disp=='C')	Addr=0x0030;
	
	
	do
	 {
	   dat=I2C_device_read(Slave_Addr,Addr+i);
	   uart_tx(dat);
	   i++;
	 }while(dat>='0' && dat<='9');
	 
}
			
	