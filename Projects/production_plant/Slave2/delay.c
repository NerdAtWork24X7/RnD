#include"types.h"

void delay_1ms(u16 dly)
{
	u8 i;					//1MC
	for(;dly>0;dly--)			//dly*2 MC
	 {	
	 	for(i=255;i>0;i--);  //1+2*255=511
		for(i=232;i>0;i--);	 //1+2*232=465
							 //total  =976 
	 }
}
