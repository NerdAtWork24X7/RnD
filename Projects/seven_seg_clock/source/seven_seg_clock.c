#include <p18cxxx.h>
#include <delays.h>

#define HIGH 1
#define LOW 0
#define CS        PORTBbits.RB5
#define DATA_bit  PORTBbits.RB6
#define SERCLK    PORTBbits.RB7
#define delay_us	Delay10TCYx

// function declarations
void ssrOut(unsigned char);
void pulseCS(void);
void init_MAX7219(void);
void writeMAX7219(char, char);

void delay_ms(int);
void init_18F2250(void);

// See c018i.c in your C18 compiler dir
extern void _startup( void );

#pragma code _RESET_INTERRUPT_VECTOR = 0x000800
void _reset( void )
{
    _asm goto _startup _endasm
}

#pragma code

int i, j, digit, count;

void main()
{
	init_18F2550();
        init_MAX7219();
	count = 9999;
	// convert to BCD send to MAXMAX7219
	for (i=0; i<=count; i++)   {
	j = i;
	// get 1st digit of j
	digit = j % 10; // MOD J
	writeMAX7219(1, digit);
	// get 2nd digit of j
	j = j / 10;
	digit = j % 10; // MOD j
	writeMAX7219(2, digit);
	// get 3rd digit of j
	j = j / 10;
	digit = j % 10; // MOD j
	writeMAX7219(3, digit);
	// get 4th digit of j
	j = j / 10;
	digit = j % 10; // MOD j
	writeMAX7219(4, digit);
	delay_ms(200);
	} // end for
} //end main



// shift data to MAX7219
// Rb7 -> SERCLK, Rb6 -> DATA_bit, Rb5 -> CS not
void ssrOut(unsigned char val)  {
	int j;
    for(j=1; j<=8; j++)  {   // shift out MSB first
    unsigned char  temp = val & 0x80; // MSB out first
    if (temp == 0x80) DATA_bit = HIGH; // Rb6 DATA
    else DATA_bit = LOW;
	SERCLK = HIGH;
	delay_us(20);
	SERCLK = LOW;
    val = val << 1; // shift one place left
  }  // next j
}

void writeMAX7219(char address, char data)   {
	if ((address < 1) || (address > 8)) return;
	ssrOut(address); // valid numbers 1-8
	ssrOut(data);
	pulseCS();
}


void pulseCS(void)  
 {
	CS = HIGH;
	delay_ms(1);
	CS = LOW;
}


void init_MAX7219(void)   
{
	CS = LOW; // CS NOT
	// set decode mode
	ssrOut(0x09); // address
	// ssrOut(0x00); // no decode
	ssrOut(0xFF); // 4-bit BCD decode eight digits
	pulseCS();

	// set intensity
	ssrOut(0x0A); // address
	ssrOut(0x0D); // 5/32s
	pulseCS();

	// set scan limit 0-7
	ssrOut(0x0B); // address
	// ssrOut(0x07); // 8 digits
	ssrOut(0x03); // 4 digits
	pulseCS();

	// clear MAX7219 all zeros
	// BCD mode all off otherwise
	for(i=1; i<=8; i++)   
	 {
		ssrOut(i);
		ssrOut(0x00);
		pulseCS();
         }

	// set for normal operation
	ssrOut(0x0C); // address
	// ssrOut(0x00); // Off
	ssrOut(0x01);  // On
	pulseCS();

}


void delay_ms(int i)
{
	long int j;
	for(j=0;j<i;j++)
	{
	Delay1KTCYx(12); 	//48 MHZ, DELAY OF 1 MS APPROX.
	}
}

//Ports initialized etc.
void init_18F2250(void)   {
	// disables converters A/D
	ADCON1=0x0F;
	// comparators off
	CMCON=7;
	//PORTB are outputs
	TRISB=0;
	// off LEDs
	PORTB=0;
	//Ra4,Ra5 are inputs Ra0,Ra1,Ra2,Ra3 outputs
	TRISA=0X30;
	//Rc0,Rc1 are inputs (MICRO SWITCHES)
	TRISC=0X0F;
	//select pull-up resistors on port B (Rb4...Rb7).
	INTCON2bits.RBPU=0;
}