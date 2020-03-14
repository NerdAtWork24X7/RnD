
#include <p18cxxx.h>

void Cmd(char Value);
void delay_ms(unsigned int ms);

void Lcd_Initialize() 
{	
	delay_ms(15);                 /*  Minimum Delay To Power On LCD Module To Recieve Mode*/
	Cmd(0X30);	delay_ms(5);      /*  LCD Specification Commands                          */
	Cmd(0X30);	delay_ms(1);      /*  LCD Specification Commands                          */
	Cmd(0X30);	delay_ms(2);      /*  LCD Specification Commands                          */
	Cmd(0X38);                    /*  LCD Double Line Display Command                     */
	Cmd(0X06);                    /*  LCD Auto Increment Location Address Command         */
	Cmd(0X01);                    /*  LCD Display Clear Command                           */
	Cmd(0X0C);                    /*  LCD Display ON Command                              */
}

void AssignDataBit(char Value)
{
    PORTBbits.RB0 = Value & 0x01;
    PORTBbits.RB1 = (Value>>1) & 0x1;
    PORTBbits.RB2 = (Value>>2) & 0x1;
    PORTBbits.RB3 = (Value>>3) & 0x1;
    
    PORTDbits.RD4 = (Value>>4) & 0x1;
    PORTDbits.RD5 = (Value>>5) & 0x1;
    PORTDbits.RD6 = (Value>>6) & 0x1;
    PORTDbits.RD7 = (Value>>7) & 0x1;
    
}

void Cmd(char Value)
{    
	AssignDataBit(Value); 
	//PORTCbits.RC4=0;                /*  RC0=0(R/W=0)	[Write Process])                */
	PORTCbits.RC5=1;                  /*  PORTCbits.RC5=1(Enable=1)	[Enable Line ON]                */
	delay_ms(4);                      /*  Minimun Delay For Hold On Data                      */
	PORTCbits.RC5=0;                  /*  PORTCbits.RC5=0(Enable=0)	[Enable Line OFF]               */
}	

void Data(char Value)
{
	AssignDataBit(Value);
	PORTCbits.RC4=1;                     /*  RC4=1(RS=1)		[Data Registr Selection])       */
	PORTCbits.RC5=1;                     /*  PORTCbits.RC5=1(Enable=1)	[Enable Line ON]                */
	delay_ms(4);                         /*  Minimun Delay For Hold On Data                      */
	PORTCbits.RC5=0;                     /*  PORTCbits.RC5=0(Enable=0)	[Enable Line OFF]               */
}

void Send2Lcd(char Adr, const char *Lcd)
{
	Cmd(Adr);
	while(*Lcd!='\0')
	{	
		Data(*Lcd);		
		Lcd++;	
	}
}