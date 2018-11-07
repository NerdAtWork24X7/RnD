#include<reg51.h>
#include"types.h"
#include"delay.h"
#include<stdio.h>

#define STDIO_LIB 0
#define DOUBLE_BAUD 0

#define XTAL 11.0592
#define BAUD 9600
#define LOADVAL (256-(((XTAL/(12*32)/BAUD))*1000*1000))

void init_uart(void)
{
	SCON=0x50;
	TMOD|=0x20;
	TH1=TL1=LOADVAL;

	#if DOUBLE_BAUD>0
		PCON=0x80;
	#endif

	#if STDIO_LIB>0
		TI=1;
	#endif

	TR1=1;
}

void uart_tx(u8 dat)
{
	SBUF=dat;
	while(TI==0);
	TI=0;
	delay_1ms(50);
}

void uart_tx_s(u8 *s)
{
	while(*s)
	 {
	   uart_tx(*s);
	   s++;
	 }
}

/*u8 uart_rx(void)
{	
	while(RI==0);
	RI=0;
	return SBUF;
}

void uart_sint(u16 n)
{
	u8 arr[5]={0};
	s8 i=0;
	if(n==0)
	  uart_tx('0');
	
	else
	  {
	  	while(n>0)
		 {
		 	arr[i++]=(n%10)+48;
			n/=10;
		 }
	  	
		for(--i;i>=0;i--)
		 {
			uart_tx(arr[i]);
		 }
	  }
}
  */