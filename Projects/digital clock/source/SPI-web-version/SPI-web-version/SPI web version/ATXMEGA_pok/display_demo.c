/*
 * display_demo.c
 *
 * Created: 22.12.2015 21:05:25
 *  Author: Ondrej Blazek
 */ 

#define F_CPU 32000000

#include <util/delay.h>

char hello_text[50] = "hello, visit site www.ondrashova-automatizace.webnode.cz";
char text[205];

void display_run()
{
	// funkce pro vzkreslení bodu pøes videopamì
	clear_videoMem_1();
	print_disp_memory_1();

	for(int a=1;a<9;a++)
	{
		for(int i=1;i<49;i++)
		{
			set_bode_to_videoMem(i,a);
			print_disp_memory_1();
			_delay_us(100);
		}
	}	
}




void display_demo1()
{

	print_string(1,15,0,"EOB");
	_delay_ms(2000);

	RUNNING_TEXT(48,50,"LED MATRIX display with MAX7219 controlled by Xmega through SPI demonstration");
	_delay_ms(1000);



	display_run();	
	RUNNING_TEXT(48,20,"X-pos change time: 50ms");
	_delay_ms(1000);
	snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
	RUNNING_TEXT(48,50,text);

	display_run();	
	RUNNING_TEXT(48,20,"X-pos change time: 20ms");
	_delay_ms(1000);
	snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
	RUNNING_TEXT(48,20,text);
	
	display_run();
	RUNNING_TEXT(48,20,"X-pos change time: 10ms");
	_delay_ms(1000);
	snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
	RUNNING_TEXT(48,10,text);
	
	display_run();
	RUNNING_TEXT(48,20,"X-pos change time: 5ms");
	_delay_ms(1000);
	snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
	RUNNING_TEXT(48,5,text);
	
	display_run();
	RUNNING_TEXT(48,20,"X-pos change time: 1ms");
	_delay_ms(1000);
	snprintf(text,200,"Ondrej Blazek, www.ondrashova-automatizace.webnode.cz");
	RUNNING_TEXT(48,1,text);
}




/*
		for(int i=0; i<6;i++)
		{
			shift_out_data_to_unit(i,0x0f,0x01);
			_delay_ms(10);
			shift_out_data_to_unit(i,0x0f,0x00);			
			_delay_ms(10);
		}





		for(int i=0; i<6;i++)
		{


			shift_out_data_to_unit(i,0x01,0x70);
			shift_out_data_to_unit(i,0x02,0x88);
			shift_out_data_to_unit(i,0x03,0x88);
			shift_out_data_to_unit(i,0x04,0x88);
			shift_out_data_to_unit(i,0x05,0xf8);
			shift_out_data_to_unit(i,0x06,0x88);
			shift_out_data_to_unit(i,0x07,0x88);
			shift_out_data_to_unit(i,0x08,0x00);
			
			_delay_ms(50);
		}

_delay_ms(500);

		for(int i=0; i<6;i++)
		{
			shift_out_data_to_unit(i,0x0f,0x01);
			_delay_ms(10);
			shift_out_data_to_unit(i,0x0f,0x00);
			_delay_ms(10);
		}

		for(int i=0; i<6;i++)
		{


			shift_out_data_to_unit(i,0x01,0x80);
			shift_out_data_to_unit(i,0x02,0x80);
			shift_out_data_to_unit(i,0x03,0xB0);
			shift_out_data_to_unit(i,0x04,0xC8);
			shift_out_data_to_unit(i,0x05,0x88);
			shift_out_data_to_unit(i,0x06,0x88);
			shift_out_data_to_unit(i,0x07,0xF0);
			shift_out_data_to_unit(i,0x08,0x00);
			
			_delay_ms(50);
		}
		
_delay_ms(500);		

	
		for(int i=0; i<6;i++)
		{
			shift_out_data_to_unit(i,0x0f,0x01);
			_delay_ms(10);
			shift_out_data_to_unit(i,0x0f,0x00);
			_delay_ms(10);
		}
	
		for(int i=0; i<6;i++)
		{


			shift_out_data_to_unit(i,0x01,0x00);
			shift_out_data_to_unit(i,0x02,0x00);
			shift_out_data_to_unit(i,0x03,0x70);
			shift_out_data_to_unit(i,0x04,0x88);
			shift_out_data_to_unit(i,0x05,0x80);
			shift_out_data_to_unit(i,0x06,0x88);
			shift_out_data_to_unit(i,0x07,0x70);
			shift_out_data_to_unit(i,0x08,0x00);
			
			_delay_ms(50);
		}
		
		_delay_ms(500);
		
//shift_out_data_to_unit(0,0x0f,1);
//_delay_ms(500);
//shift_out_data_to_unit(0,0x0f,0);
//_delay_ms(500);

//LOAD_OUT_HI
//LOAD_OUT_LO

			//shift_out_data_to_unit(0,0x01,0x70);
		
			//shift_out_byte(0xff);




/*
		PORTH.OUT |= (1<<0);//0b00000001;
		_delay_ms(5);
		
		PORTH.OUT &= ~(1<<0);//0b00000000;
		_delay_ms(5);
	
			//if(!(PORTE.IN & PIN5_bm)) {         // if FLIP pressed
	        counter++;                      // increment the counter
	        LcdClear();                     // clear the display
	        Lcd("counter:");                // display the text
	        Lcd2;                           // przejœcie do drugiej linii
	        LcdDec(counter);                // display the number
	        //_delay_ms(100);                 // wait 100ms		
	*/	

