#include"types.h"
extern void keyscan();
void init_uc()
{
  TRISA=0x00;
  TRISB=0x00;
  TRISC=0xF0;
  ANSEL=0x00;
  ANSELH=0x00;
}

main()
{
       init_uc();

	while(1)
	{
	  keyscan();
//	  led2=1^led2;

         PORTA=0x00;PORTB=0x00;
	}
}