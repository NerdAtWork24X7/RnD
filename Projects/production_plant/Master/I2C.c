#include<reg51.h>
#include"types.h"
#include"delay.h"
sbit scl=P0^6;
sbit sda=P0^7;

void I2C_start(void)
{
//start conditon for I2C protocol
	scl=0;	
	sda=1;
	scl=1;
	sda=0;
}

void I2C_write(u8 dat)
{
	u8 i;
	for(i=0;i<8;i++)
	 {
		scl=0;
		sda=(dat&(0x80>>i))?1:0;
		scl=1;
	 }
}

void I2C_ack(void)
{
	scl=0;
	sda=1;
	scl=1;
	while(sda);
}

void I2C_stop(void)
{
	scl=0;
	sda=0;
	scl=1;
	sda=1;
}

u8 I2C_read(void)
{
	u8 buff=0,i;
	for(i=0;i<8;i++)
	 {
		scl=0;
		scl=1;
		if(sda)
		  buff|=0x80>>i;
	 }
	return buff;
}

void I2C_noack(void)
{
	scl=0;
	sda=1;
	scl=1;
}

void I2C_device_write(u8 s_addr,u8 addr,u8 dat)
{
	
	I2C_start();		//Master issue a start condition
	I2C_write(s_addr);	//Master issues device address with (MSB 1st)
	I2C_ack();			//Master takes an acknoledgement
	I2C_write(addr);	//Master issue address to be written
	I2C_ack();			//Master waits for acknowledgement
	I2C_write(dat);		//Master issue data to be written to tahat address location
	I2C_ack();			//Master recive the acknowledgement 
	I2C_stop();			//Master issues a stop conditon
	delay_1ms(10);		//Master needs a delay of 10ms btwn consecutive writes
}

u8 I2c_device_read(u8 s_addr,u8 addr)
{
	u8 buff=0;			
	I2C_start();		//Master issues start condition to begin
	I2C_write(s_addr);	//Master issue device address
	I2C_ack();			//Master recive the acknowledgment
	I2C_write(addr);	//Master issue address from where data i being read
	I2C_ack();			//Master waits for acknowledgement
	
	I2C_start();		//Master issues a start condition
	I2C_write(s_addr|1); //Master issue device address with read option 
	I2C_ack();			//Master waits for ack
	buff=I2C_read();	//Master reads the data from address location
	I2C_noack();		//Master issue no ack
	I2C_stop();			//Master issue a stop
	return buff;
}