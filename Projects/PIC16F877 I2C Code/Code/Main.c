/*  Name     : main.c
 *  Purpose  : Main file for i2c code for PIC16F877.
 *  Author   : M.Saeed Yasin
 *  Date     : 14-12-12
 *  Website  : saeedsolutions.blogspot.com
 *  Revision : None
 */
#include"Includes.h"

// Configuration word for PIC16F877
__CONFIG( FOSC_HS & WDTE_OFF & PWRTE_ON & CP_OFF & BOREN_ON 
		& LVP_OFF & CPD_OFF & WRT_ON & DEBUG_OFF);

// Main function
void main(void)
{
	unsigned char RxByte = 0;

	InitI2C();					// Initialize i2c pins								

	I2C_Start();				// Send start bit on i2c
	I2C_Write_Byte(0xA0);		// Send 0xA0 on i2c
	RxByte = I2C_Read_Byte();	// Read value from i2c
	I2C_Send_ACK();				// Send ACK bit on i2c
	I2C_Stop();					// Send stop bit on i2c

	while(1)
	{	
	}
}

