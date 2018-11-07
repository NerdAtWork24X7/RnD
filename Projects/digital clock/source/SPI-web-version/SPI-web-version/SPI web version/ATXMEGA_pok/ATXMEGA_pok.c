/*
 * ATXMEGA_pok.c
 *
 * Created: 2.11.2015 12:04:26
 *  Author: Ondrej Blazek
 */ 

//#define F_CPU 32000000
#define F_CPU 32000000

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include <string.h>
#include "set_32MHz.h"
#include "matrix_disp_driving.h"
#include "display_demo.h"








int a;
int b;
	uint8_t counter = 0;

char hello[10];






void init_LED_display()
{
	


	//set decoding
	shift_out_data_to_unit(0,0x09,0x00);	//no decode digits
	shift_out_data_to_unit(1,0x09,0x00);	//no decode digits
	shift_out_data_to_unit(2,0x09,0x00);	//no decode digits
	shift_out_data_to_unit(3,0x09,0x00);	//no decode digits
	shift_out_data_to_unit(4,0x09,0x00);	//no decode digits
	shift_out_data_to_unit(5,0x09,0x00);	//no decode digits

	//scan all digits
	shift_out_data_to_unit(0,0x0b,0x07);	//no decode digits
	shift_out_data_to_unit(1,0x0b,0x07);	//no decode digits
	shift_out_data_to_unit(2,0x0b,0x07);	//no decode digits
	shift_out_data_to_unit(3,0x0b,0x07);	//no decode digits
	shift_out_data_to_unit(4,0x0b,0x07);	//no decode digits
	shift_out_data_to_unit(5,0x0b,0x07);	//no decode digits




	//normal operation
	shift_out_data_to_unit(0,0x0C,0x01);
	shift_out_data_to_unit(1,0x0C,0x01);
	shift_out_data_to_unit(2,0x0C,0x01);
	shift_out_data_to_unit(3,0x0C,0x01);
	shift_out_data_to_unit(4,0x0C,0x01);
	shift_out_data_to_unit(5,0x0C,0x01);

	//set max intensity
	shift_out_data_to_unit(0,0x0a,0x0f);	//15
	shift_out_data_to_unit(1,0x0a,0x0f);	//15
	shift_out_data_to_unit(2,0x0a,0x0f);	//15
	shift_out_data_to_unit(3,0x0a,0x0f);	//15
	shift_out_data_to_unit(4,0x0a,0x0f);	//15
	shift_out_data_to_unit(5,0x0a,0x0f);	//15

	clear_videoMem_1();
	print_disp_memory_1();

	
	//disp TEST ON
	shift_out_data_to_unit(0,15,1);
	shift_out_data_to_unit(1,15,1);
	shift_out_data_to_unit(2,15,1);
	shift_out_data_to_unit(3,15,1);
	shift_out_data_to_unit(4,15,1);
	shift_out_data_to_unit(5,15,1);
	
	_delay_ms(1000);

	shift_out_data_to_unit(0,15,0);
	shift_out_data_to_unit(1,15,0);
	shift_out_data_to_unit(2,15,0);
	shift_out_data_to_unit(3,15,0);
	shift_out_data_to_unit(4,15,0);
	shift_out_data_to_unit(5,15,0);
	_delay_ms(1000);
	
}










int main(void)
{
	set_32MHz_function();


	  // set PA0 as output
	PORTA.DIRSET = 0b00000001;
	
	
	PORTH.DIR = 0b11111111;			//PORTH is output
	
	// parametrizace SPI
	//PORTD.DIRSET |= (1<<3); 
	PORTD.DIRSET = PIN3_bm;		// LOAD impulse
	PORTD.DIRSET = PIN4_bm;		// SPI - Slave Select
	PORTD.DIRSET = PIN5_bm;		// SPI - MOSI
	PORTD.DIRSET = PIN7_bm;		// SPI - SCK
	//PORTD.DIR = 0xB0;
	
	    
	// FLIP configuration for display
	PORTJ.DIRCLR    =  PIN5_bm;             // pin E5 as input
	PORTJ.PIN5CTRL  =  PORT_OPC_PULLUP_gc;  // pull-up to the power supply
	
    

	// konfigurace SPI na portu D
	SPID.CTRL = 0x50;	//SPI on master mode, clock idle low, data setup on trailing edge, data sampled on leading edge, double speed mode enabled
	SPID.INTCTRL = 0x03;	// asign high priority to SPI interrupt
	
	
	
	PMIC.CTRL = 0x04;		// enable high priority interrupts
	
	// enable global interrupts
	sei();
	
    init_LED_display();
	
	
	
		
    while(1)
    {
		
	display_demo1();
		
	_delay_ms(500);
		PORTH.OUTCLR = PIN0_bm;
		_delay_ms(1);
		PORTH.OUTSET = PIN0_bm;
		_delay_ms(1);
		PORTH.OUTCLR = PIN0_bm;


    }
}   