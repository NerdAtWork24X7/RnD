#include<reg51.h>
#include"types.h"
#include"delay.h"
#define data_port P2

u8 dp1=0xff,dp2=0xff,dp3=0xff,dp4=0xff;
sbit seg_1=P1^0;
sbit seg_2=P1^1;
sbit seg_3=P1^2;
sbit seg_4=P1^3;
sbit seg_5=P1^4;

u8 lut[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
void disp_seven_seg(u8 num1,u8 num2,u8 num3,u8 num4,u8 num5)
{
	seg_1=0;  						//selecting segments common anode
	data_port=lut[num1]&dp1; 	//sending 1 digit to seven seg 
	delay_1ms(10);
	seg_1=1;

	seg_2=0;  							//selecting segments common anode
	data_port=lut[num2]&dp2; 	//sending 2 digit to seven seg 
	delay_1ms(10);
	seg_2=1;

	seg_3=0;  								//selecting segments common anode
	data_port=lut[num3]&dp3; 	//sending 3 digit to seven seg 
	delay_1ms(10);
	seg_3=1;

	seg_4=0;  										//selecting segments common anode
	data_port=lut[num4]&dp4; 	//sending 4 digit to seven seg 
	delay_1ms(10);
	seg_4=1;

	seg_5=0;  										//selecting segments common anode
	data_port=lut[num5]&dp4; 	//sending 5 digit to seven seg 
	delay_1ms(10);
	seg_5=1;
}

/*void dispf_seven_seg(float num)
{
	u16 i;
	dp1=dp2=dp3=dp4=0xff;

	if(num>=0.0 && num<=10.0)
	 {
		i=num*10000;
		dp1=0x7f;
	 }

	 if(num>=10.0 && num<=100.0)
	 {
		i=num*1000;
		dp2=0x7f;
	 }

	 if(num>=100.0 && num<=1000.0)
	 {
		i=num*100;
		dp3=0x7f;
	 }

	 if(num>=1000.0 && num<=10000.0)
	 {
		i=num*10;
		dp4=0x7f;
	 }
	 
	 disp_seven_seg(i);
} */

void init_seg()
{
	u8 i=0;
	for(i=0;i<=9;i++)
	{ 
	  seg_1=0;seg_2=0;seg_3=0;seg_4=0;seg_5=0;  				//selecting segments common anode
	  data_port=lut[i]; 	//sending 1 digit to seven seg 
	  delay_1ms(500);
	  seg_1=1;seg_2=2;seg_3=3;seg_4=4;
	  }
}