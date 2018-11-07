/*
 * matrix_disp_driving.c
 *
 * Created: 18.12.2015 17:35:44
 *  Author: Ondrej Blazek
 */ 

#define F_CPU 32000000

#include <avr/pgmspace.h>
#include <util/delay.h>


	char rozborka[150];

	char lenghs_print[205];

// block of definitions

#define LOAD_OUT_LO PORTD.OUTCLR = (1<<3);
#define LOAD_OUT_HI PORTD.OUTSET = (1<<3);
#define NUMBER_OF_LAST_MAX7219 6


//*********************** MAX7219 definition ******************************
//setup number of chip attached to the board
#define NUMBER_OF_LAST_MAX7219 5							// èíslo poslední jednotky budièe (jednotky jsou èíslovány 0, 1, 2,....)

//define registers
#define MAX7219_REGNOOP 0x00					// nebude provedena žádná operace
#define MAX7219_REGROW1 0x01					// zápis dat na první øádek
#define MAX7219_REGROW2 0x02					// zápis dat na druhý øádek
#define MAX7219_REGROW3 0x03					// zápis dat na tøetí øádek
#define MAX7219_REGROW4 0x04					// zápis dat na ètvrtý øádek
#define MAX7219_REGROW5 0x05					// zápis dat na pátý øádek
#define MAX7219_REGROW6 0x06					// zápis dat na šestý øádek
#define MAX7219_REGROW7 0x07					// zápis dat na sedmý øádek
#define MAX7219_REGROW8 0x08					// zápis dat na osmý øádek
#define MAX7219_REGDECODE 0x09					// nastavení zpùsobu dekódování informace pro výstupy digitù (0x00 - no decode, více datasheet str. 7)
#define MAX7219_REGINTENSITY 0x0A				// nastavení intenzity zobrazení
#define MAX7219_REGSCANLIMIT 0x0B				// poèet obsluhovaných digitù (pro osm digitù se provádí volba 0x07)
#define MAX7219_REGSHUTDOWN 0x0C				// vypnutí zobrazení (nastavení LSB datovými bity, 0 = shutdown mode, 1 = normal oper mode)
#define MAX7219_REGTEST 0x0F					// spuštìní testovací funkce dipleje (všechny body budou rozsvíceny)
//**********************************************************************************************************************************************************






//videopamì 1 pro zobrazení na šest matic
uint8_t VIDEO_MEM_1 [8][6]={};

//videopamì 2 pro zobrazení na šest matic
uint8_t VIDEO_MEM_2 [8][6]={};
	
//pomocná buffer promìnná pro naètení znaku z progmem pamìti
unsigned long bufferLong [14] = {0};

// standard ascii 5x7 font
// defines ascii characters 0x20-0x7F (32-127)
const static unsigned char __attribute__ ((progmem)) font5x7[] = {      //Numeric Font Matrix (Arranged as 7x font data + 1x kerning data)
    0x00,0x00,0x00,0x00,0x00,0x00,0x00,3,		//Space (Char 0x20)
    0x80,0x80,0x80,0x80,0x00,0x00,0x80,2,		//!
    0xA0,0xA0,0xA0,0x00,0x00,0x00,0x00,4,		//"
    0x50,0x50,0xF8,0x50,0xF8,0x50,0x50,6,		//#
    0x20,0x78,0xA0,0x70,0x28,0xF0,0x20,6,		//$
    0xC0,0xC8,0x10,0x20,0x40,0x98,0x18,6,		//%
    0x60,0x90,0xA0,0x40,0xA8,0x90,0x68,6,		//&
    0xC0,0x40,0x80,0x00,0x00,0x00,0x00,3,		//'
    0x20,0x40,0x80,0x80,0x80,0x40,0x20,4,		//( 
    0x80,0x40,0x20,0x20,0x20,0x40,0x80,4,		//)
    0x00,0x20,0xA8,0x70,0xA8,0x20,0x00,6,		//*
    0x00,0x20,0x20,0xF8,0x20,0x20,0x00,6,		//+
	0x00,0x00,0x00,0x00,0xC0,0x40,0x80,3,		//,
    0x00,0x00,0x00,0xF8,0x00,0x00,0x00,6,		//-
    0x00,0x00,0x00,0x00,0x00,0xC0,0xC0,3,		//.
    0x00,0x08,0x10,0x20,0x40,0x80,0x00,6,		///
    0x70,0x88,0x98,0xA8,0xC8,0x88,0x70,6,		//0
	0x40,0xC0,0x40,0x40,0x40,0x40,0xE0,4,		//1
	0x70,0x88,0x08,0x10,0x20,0x40,0xF8,6,		//2
	0xF8,0x10,0x20,0x10,0x08,0x88,0x70,6,		//3
	0x10,0x30,0x50,0x90,0xF8,0x10,0x10,6,		//4
	0xF8,0x80,0xF0,0x08,0x08,0x88,0x70,6,		//5
	0x30,0x40,0x80,0xF0,0x88,0x88,0x70,6,		//6
	0xF8,0x88,0x08,0x10,0x20,0x20,0x20,6,		//7
	0x70,0x88,0x88,0x70,0x88,0x88,0x70,6,		//8
	0x70,0x88,0x88,0x78,0x08,0x10,0x60,6,		//9
	0x00,0xC0,0xC0,0x00,0xC0,0xC0,0x00,3,		//:
	0x00,0xC0,0xC0,0x00,0xC0,0x40,0x80,3,		//;
	0x10,0x20,0x40,0x80,0x40,0x20,0x10,5,		//<
	0x00,0x00,0xF8,0x00,0xF8,0x00,0x00,6,		//=
	0x80,0x40,0x20,0x10,0x20,0x40,0x80,5,		//>
	0x70,0x88,0x08,0x10,0x20,0x00,0x20,6,		//?
	0x70,0x88,0x08,0x68,0xA8,0xA8,0x70,6,		//@ 
	0x70,0x88,0x88,0x88,0xF8,0x88,0x88,6,		//A
	0xF0,0x88,0x88,0xF0,0x88,0x88,0xF0,6,		//B
	0x70,0x88,0x80,0x80,0x80,0x88,0x70,6,		//C
	0xE0,0x90,0x88,0x88,0x88,0x90,0xE0,6,		//D
	0xF8,0x80,0x80,0xF0,0x80,0x80,0xF8,6,		//E
	0xF8,0x80,0x80,0xF0,0x80,0x80,0x80,6,		//F
	0x70,0x88,0x80,0xB8,0x88,0x88,0x70,6,		//G
	0x88,0x88,0x88,0xF8,0x88,0x88,0x88,6,		//H
	0xE0,0x40,0x40,0x40,0x40,0x40,0xE0,4,		//I
	0x38,0x10,0x10,0x10,0x10,0x90,0x60,6,		//J
	0x88,0x90,0xA0,0xC0,0xA0,0x90,0x88,6,		//K
	0x80,0x80,0x80,0x80,0x80,0x80,0xF8,6,		//L
	0x88,0xD8,0xA8,0xA8,0x88,0x88,0x88,6,		//M
	0x88,0x88,0xC8,0xA8,0x98,0x88,0x88,6,		//N
	0x70,0x88,0x88,0x88,0x88,0x88,0x70,6,		//O
	0xF0,0x88,0x88,0xF0,0x80,0x80,0x80,6,		//P
	0x70,0x88,0x88,0x88,0xA8,0x90,0x68,6,		//Q
	0xF0,0x88,0x88,0xF0,0xA0,0x90,0x88,6,		//R
	0x78,0x80,0x80,0x70,0x08,0x08,0xF0,6,		//S
	0xF8,0x20,0x20,0x20,0x20,0x20,0x20,6,		//T
	0x88,0x88,0x88,0x88,0x88,0x88,0x70,6,		//U
	0x88,0x88,0x88,0x88,0x88,0x50,0x20,6,		//V
	0x88,0x88,0x88,0xA8,0xA8,0xA8,0x50,6,		//W
	0x88,0x88,0x50,0x20,0x50,0x88,0x88,6,		//X
	0x88,0x88,0x88,0x50,0x20,0x20,0x20,6,		//Y
	0xF8,0x08,0x10,0x20,0x40,0x80,0xF8,6,		//Z
	0xE0,0x80,0x80,0x80,0x80,0x80,0xE0,4,		//[
	0x00,0x80,0x40,0x20,0x10,0x08,0x00,6,		// \ (Back slash)
	0xE0,0x20,0x20,0x20,0x20,0x20,0xE0,4,		//]
	0x20,0x50,0x88,0x00,0x00,0x00,0x00,6,		//^
	0x00,0x00,0x00,0x00,0x00,0x00,0xF8,6,		//_
	0x80,0x40,0x20,0x00,0x00,0x00,0x00,4,		//`
	0x00,0x00,0x70,0x08,0x78,0x88,0x78,6,		//a
	0x80,0x80,0xB0,0xC8,0x88,0x88,0xF0,6,		//b
	0x00,0x00,0x70,0x88,0x80,0x88,0x70,6,		//c
	0x08,0x08,0x68,0x98,0x88,0x88,0x78,6,		//d
	0x00,0x00,0x70,0x88,0xF8,0x80,0x70,6,		//e
	0x30,0x48,0x40,0xE0,0x40,0x40,0x40,6,		//f
	0x00,0x78,0x88,0x88,0x78,0x08,0x70,6,		//g
	0x80,0x80,0xB0,0xC8,0x88,0x88,0x88,6,		//h
	0x40,0x00,0xC0,0x40,0x40,0x40,0xE0,4,		//i
	0x10,0x00,0x30,0x10,0x10,0x90,0x60,5,		//j
	0x80,0x80,0x90,0xA0,0xC0,0xA0,0x90,5,		//k
	0xC0,0x40,0x40,0x40,0x40,0x40,0xE0,4,		//l
	0x00,0x00,0xD0,0xA8,0xA8,0x88,0x88,6,		//m
	0x00,0x00,0xB0,0xC8,0x88,0x88,0x88,6,		//n
	0x00,0x00,0x70,0x88,0x88,0x88,0x70,6,		//o
	0x00,0x00,0xF0,0x88,0xF0,0x80,0x80,6,		//p
	0x00,0x00,0x68,0x98,0x78,0x08,0x08,6,		//q
	0x00,0x00,0xB0,0xC8,0x80,0x80,0x80,6,		//r
	0x00,0x00,0x70,0x80,0x70,0x08,0xF0,6,		//s
	0x40,0x40,0xE0,0x40,0x40,0x48,0x30,6,		//t
	0x00,0x00,0x88,0x88,0x88,0x98,0x68,6,		//u
	0x00,0x00,0x88,0x88,0x88,0x50,0x20,6,		//v
	0x00,0x00,0x88,0xA8,0xA8,0xA8,0x50,6,		//w
	0x00,0x00,0x88,0x50,0x20,0x50,0x88,6,		//x
	0x00,0x00,0x88,0x88,0x78,0x08,0x70,6,		//y
	0x00,0x00,0xF8,0x10,0x20,0x40,0xF8,6,		//z
	0x20,0x40,0x40,0x80,0x40,0x40,0x20,4,		//{
	0x80,0x80,0x80,0x80,0x80,0x80,0x80,2,		//|
	0x80,0x40,0x40,0x20,0x40,0x40,0x80,4,		//}
	0x00,0x00,0x00,0x68,0x90,0x00,0x00,6,		//~
	0x60,0x90,0x90,0x60,0x00,0x00,0x00,5		//°

};


//obsluha matice

void shift_out_byte(uint8_t byte_to_send)
{
	SPID.DATA = byte_to_send;					// adresa 15
	while(!(SPID.STATUS & 0x80));		// wait for transmit complete
}

// odeslání sériových dat po SPI
void shift_out_data_to_unit(uint8_t num_of_unit, uint8_t ADDR, uint8_t DATA)
{
	uint8_t i = 0;
	
	LOAD_OUT_LO									// inicializace, nastavení bitu provedení zápisu na nulu
	
	if(num_of_unit < NUMBER_OF_LAST_MAX7219)			// ošetøení pro pøípad, kdy komunikovaná jednotka není na konci øady
	{
		for (i = num_of_unit; i < (NUMBER_OF_LAST_MAX7219); i++)
		{
			shift_out_byte(MAX7219_REGNOOP); // odeslání nulového adresního bajtu pro budièe, které jsou za komunikovaným
			shift_out_byte(MAX7219_REGNOOP); // odeslání nulového datového bajtu pro budièe, které jsou za komunikovaným
		}
	}
	
	// zaslání dat na požadovanou jednotku
	shift_out_byte(ADDR);				// odeslání adresního bajtu na požadovanou jednotku
	shift_out_byte(DATA);				// odeslání datového bajtu na požadovanou jednotku
	
	// zaslání prázdných bajtù na jednotky pøed adresovanou
	
	for (i=0; i < num_of_unit; i++)
	{
		shift_out_byte(MAX7219_REGNOOP); // odeslání nulového adresního bajtu pro budièe, které jsou za komunikovaným
		shift_out_byte(MAX7219_REGNOOP); // odeslání nulového datového bajtu pro budièe, které jsou za komunikovaným
	}
	
	LOAD_OUT_HI
	//	_delay_us(1);
	LOAD_OUT_LO
}

// funkce pro naètení znaku z progmem
void loadBufferLong(int ascii)
{
	for(int a = 0; a < 14; a++)		// vyèištìní bufferu
	{
		bufferLong [a] = 0;
	}

	if (ascii >= 0x20 && ascii <=0x7f)
	{
		for (int a=0;a<8;a++)
		{                      // Loop 7 times for a 5x7 font
			unsigned long c = pgm_read_byte_near(font5x7 + ((ascii - 0x20) * 8) + a);     // Index into character table to get row data
			//unsigned long x = bufferLong [a*2];     // Load current scroll buffer
			//x = x | c;                              // OR the new character onto end of current
			bufferLong [a] = c;                   // Store in buffer
		}
		
		uint8_t count = pgm_read_byte_near(font5x7 +((ascii - 0x20) * 8) + 7);     // Index into character table for kerning data
		for (uint8_t x=0; x<count;x++){
			//		rotateBufferLong();
			//		printBufferLong();
			//		_delay_ms(500);
		}
	}
}

// ovìøení hodnoty zadaného bitu promìnné
uint8_t bit_read(uint8_t variable, uint8_t bit_num)
{
	if(variable & (1<<bit_num))
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

//Funkce pro vložení znaku 5x7 do videopamìti 1
int set_char_5x7_on_XY(int x_offset, int y_offset, char character)
{

	
	loadBufferLong(character);
	
	uint8_t font_lenght = bufferLong[7];	// vyètení šíøky fontu v pixelech
	int pixel_to_start_draw = x_offset;
	int pixel_to_end_draw = (x_offset-1) + font_lenght;
	uint8_t bit_to_read;
	
	int start_row = y_offset;
	int end_row = y_offset + 7;
	int act_row;					// aktuální øádek ètení znaku z pamìti v rámci vykreslování

	//fonty jsou v rozmìru 5x7 bodù, tedy sedm bodù je øádek. Pøi vykreslování do videopamìti je y_offsetem øádek, od kterého se (v pøípadì vykreslování mimo rozsah videopamìti v záporných souøadnicích)
	//vykresluje pøíslušný znak, pøièemž øádkování se poèítá od výchozí souøadnice a inkrementuje do velikosti 7 (vertikální rozmìr znakové sady).


	for(int row=start_row; row<end_row;row++)				// proèítání jednotlivých øádkù (pro vykreslení výšky písma 7 øádkù)
	{


		
		bit_to_read = 7;
		
		
		for(int x_pos = x_offset; x_pos < 48; x_pos++)		//cyklus postupnì probìhne celý øádek pamìti
		{
			if (x_pos<(0))
			{
				bit_to_read--;
			}
			
			
			if(((-1)<x_pos)&&(x_pos<8))		//kreslení do pamìového prostoru první matice
			{
				if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))		//pozice pro zaèátek kreslení
				{
					
					if ((bit_read(bufferLong[act_row],bit_to_read)))	//jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
					{
						VIDEO_MEM_1[row][0] |= (1<<(7 - x_pos));

					}
					else
					{
						VIDEO_MEM_1[row][0] &= ~(1<<(7 - x_pos));
					}
					
					bit_to_read--;
				}
			}
			
			if((x_pos>7)&&(x_pos<16))		//kreslení do pamìového prostoru druhé matice
			{
				if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))		//pozice pro zaèátek kreslení
				{
					
					if ((bit_read(bufferLong[act_row],bit_to_read)))	//jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
					{
						VIDEO_MEM_1[row][1] |= (1<<(7 - (x_pos-8)));

					}
					
					bit_to_read--;
				}
			}
			
			if((x_pos>15)&&(x_pos<24))		//kreslení do pamìového prostoru tøetí matice
			{
				if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))		//pozice pro zaèátek kreslení
				{
					
					if ((bit_read(bufferLong[act_row],bit_to_read)))	//jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
					{
						VIDEO_MEM_1[row][2] |= (1<<(7 - (x_pos-16)));

					}
					
					bit_to_read--;
				}
			}
			
			if((x_pos>23)&&(x_pos<32))		//kreslení do pamìového prostoru ètvrté matice
			{
				if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))		//pozice pro zaèátek kreslení
				{
					
					if ((bit_read(bufferLong[act_row],bit_to_read)))	//jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
					{
						VIDEO_MEM_1[row][3] |= (1<<(7 - (x_pos-24)));

					}
					
					bit_to_read--;
				}
			}
			
			if((x_pos>31)&&(x_pos<40))		//kreslení do pamìového prostoru páté matice
			{
				if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))		//pozice pro zaèátek kreslení
				{
					
					if ((bit_read(bufferLong[act_row],bit_to_read)))	//jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
					{
						VIDEO_MEM_1[row][4] |= (1<<(7 - (x_pos-32)));

					}
					
					bit_to_read--;
				}
			}

			if((x_pos>39)&&(x_pos<48))		//kreslení do pamìového prostoru páté matice
			{
				if((x_pos > (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))		//pozice pro zaèátek kreslení
				{
					
					if ((bit_read(bufferLong[act_row],bit_to_read)))	//jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
					{
						VIDEO_MEM_1[row][5] |= (1<<(7 - (x_pos-40)));

					}
					
					bit_to_read--;
				}
			}





		}
		
		act_row++;
		
	}
	
	return font_lenght;
}

// funkce pro vyèištìní videopamìti 1
void clear_videoMem_1()
{
	for (int row = 0; row<8;row++)
	{
		for (int x = 0; x < 6; x++)
		{
			VIDEO_MEM_1 [row][x]=0x00;
		}

	}
}

// vykreslení videopamìti 1 na maticový display
void print_disp_memory_1()				// vykreslení video pamìti po øádcích
{
	LOAD_OUT_LO									// inicializace, nastavení bitu provedení zápisu na nulu
	for(int a=0; a<8 ; a++)				// pøepínání øádkù matic (øádek 0 - 7)
	{
		for(int i=0;i<6;i++)			// postupné odeslání dat øádkù pro všechny matice po SPI (i = 0: data øádku páté matice, odesílá se poøadím LSB first)
		{
			if(a==0)
			{
				shift_out_byte(MAX7219_REGROW1);
				shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
			}
			if(a==1)
			{
				shift_out_byte(MAX7219_REGROW2);
				shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
			}
			if(a==2)
			{
				shift_out_byte(MAX7219_REGROW3);
				shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
			}
			if(a==3)
			{
				shift_out_byte(MAX7219_REGROW4);
				shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
			}
			if(a==4)
			{
				shift_out_byte(MAX7219_REGROW5);
				shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
			}
			if(a==5)
			{
				shift_out_byte(MAX7219_REGROW6);
				shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
			}
			if(a==6)
			{
				shift_out_byte(MAX7219_REGROW7);
				shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
			}
			if(a==7)
			{
				shift_out_byte(MAX7219_REGROW8);
				shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
			}
		}
		
		LOAD_OUT_HI									// inicializace, nastavení bitu provedení zápisu na log 1
		LOAD_OUT_LO									// inicializace, nastavení bitu provedení zápisu na nulu
	}

/*
	for(int a=0; a < 8; a++)			// vykreslení øádkù první matice
	{
		set_row_on_chip(0,a+1,displayMemory[a*2]);			// vykreslení øádkù matice 1
		set_row_on_chip(1,a+1,displayMemory[(a*2)+1]);		// vykreslení øádkù matice 2	
	}
*/
}


void set_bode_to_videoMem(uint8_t x, uint8_t y)
{
	if(x<9)		//bod bude kreslen na první matici
	{
		VIDEO_MEM_1[y-1][0] |= (1<<(7-(x-1)));
	}
	
	if((x>8) && (x<17))	// bod bude kreslen na druhé matici
	{
		VIDEO_MEM_1[y-1][1] |= (1<<(7-(x-9)));
	}
	
	if((x>16) && (x<25))	// bod bude kreslen na tøetí matici
	{
		VIDEO_MEM_1[y-1][2] |= (1<<(7-(x-17)));
	}

	if((x>24) && (x<33))	// bod bude kreslen na ètvrtou matici
	{
		VIDEO_MEM_1[y-1][3] |= (1<<(7-(x-25)));
	}
	
	if((x>32) && (x<41))	// bod bude kreslen na ètvrtou matici
	{
		VIDEO_MEM_1[y-1][4] |= (1<<(7-(x-33)));
	}
	if((x>40) && (x<49))	// bod bude kreslen na ètvrtou matici
	{
		VIDEO_MEM_1[y-1][5] |= (1<<(7-(x-41)));
	}	
}

int check_string_lenght(char *string)

/*****************************************************
Funkce vrací šíøku zadaného øetìzce v pixelech dle použité znakové sady,
konkrétnì pozici na ose "x", na které by pøi vykreslení na maticovém dipleji
byla pozice, na které vykreslení skonèí - na další pozici mùže být ve videopamìti
vykreslen další znak.

jestliže je údaj = 4, a znak by byl umístìn na souøadnici x_offset = 0, pak pøíslušný
znak nebo znaky budou konèit na souøadnici x = 4
******************************************************/

{
	int string_on_display_lenght = 0;
	
	while (*string)		//v rámci cyklu je provádìno ètení celého pole, jehož koneèná pozice pro vykreslení má být zjištìna
	{
		loadBufferLong(*string);
		string_on_display_lenght = string_on_display_lenght + bufferLong[7];	// nejdøíve je zjištìna bitová délka zpracovávaného znaku øetìzce
		
		*string++;
	}

	return string_on_display_lenght;
	
}



void print_string(uint8_t clean_video_mem, int x_offset, int y_offset, char *string)
{
	
	if(clean_video_mem==1)
	{
		clear_videoMem_1();		
	}
	
			//videoMem[2][0]=0xf0;
		
	uint8_t font_lenght;		// promìnná, do které je naètena délka aktuálního znaku
	//int last_char_lenght;
	
	int act_char_position;		// pozice aktuálnì zpracovávaného znaku

	
	// vykreslování textového øetìzce je založeno na simultálním vykreslování znakù, které jsou za sebou v øetìzci obsaženy, pøièemž je daný znak nejprve naèten z pamìti
	// spoleènì s bitovou šíøkou znaku. Pouze v pøípadì, kdy èást znaku zasahuje do vykreslované plochy ohranièené offsetem na ose x, souøadnicí 0px a 39px (pro danou
	// aplikaci je pøedpokládaná šíøka zobrazovací plochy 40 bodù), je provedeno vykreslování do video pamìti, která je po koneèném zpracování zaslána k zobrazení
	// na maticový display. Funkce je urèena pro posuvné zobrazení textového øetìzce, který svou délkou (poètem znakù) pøesahuje zobrazovací možnosti (poèet vodorovných
	// bodù) maticového displaye.
	
	
	act_char_position = x_offset;	

		while (*string)		//v rámci cyklu je provádìno ètení celého pole, které má být zobrazeno
		{
			loadBufferLong(*string);
			font_lenght = bufferLong[7];	// nejdøíve je zjištìna bitová délka zpracovávaného znaku øetìzce
			
			
			if((act_char_position+font_lenght)>(-1))		// jestliže poslední bod znaku vykreslený od aktuální pozice zasahuje do zobrazované oblasti, je zavolána funkce vykreslení znaku do videopamìti
			{
				set_char_5x7_on_XY(act_char_position,y_offset,*string);
				//new_char_position = new_char_position + last_char_lenght;				
			}


			if (act_char_position > 47)		//jestliže je poèátek novì vykreslovaného znaku za zobrazovací plochou maticového displeje, vykreslování bude pøerušeno
			{
				break;
			}
			
			*string++;
			act_char_position = act_char_position + font_lenght;	//po provedení rozhodovacích, pøípadnì vykreslovacích krokù je navýšen ukazatel na další pozici pøípadného následujícího znaku
		}

	print_disp_memory_1();
}


void RUNNING_TEXT(int disp_points,int step_delay_time, char *text)
{

	
	//Ondrej Blazek, www.ondrashova-automatizace.webnode.cz
	
	int string_lenght;			// délka zobrazovaného textu v bodech na ose x
	
	string_lenght = check_string_lenght(text);
	
	//snprintf(rozborka,20,"Delka retezce: %d\n",string_lenght);
	//uart_puts(rozborka);
	
	
	//uart_puts(lenghs_print);
	
	
	for (int i = (disp_points + 1);i>(disp_points - string_lenght-disp_points);i--)
	{
		PORTH.OUTSET = PIN0_bm;	
		print_string(1,i,0,text);
		
		PORTH.OUTCLR = PIN0_bm;	
		for(int i=0;i<step_delay_time;i++)	
		{
			_delay_ms(1);	
		}	

	}
	
}




