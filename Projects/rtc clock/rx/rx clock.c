#include<reg51.h>
sbit set=P3^4;
sbit mov=P3^3;
sbit inc=P3^5;
sbit dec=P3^6;
sbit ent=P3^7;
void all_disp();
#define First_Line 0x80
#define Second_Line 0xc0
#define Curser_On 0x0f
#define Curser_Off 0x0c
#define Clear_Display 0x01
#define Data_Port P2

sbit Lcd_rs = P0^5;
sbit Lcd_rw = P0^4;
sbit Lcd_en = P0^3;

void Lcd8_Init();
void Lcd8_Command(unsigned char);
void Lcd8_Write(unsigned char,unsigned char);
void Lcd8_Display(unsigned char,const unsigned char*,unsigned int);
void Lcd8_Decimal2(unsigned char,unsigned char);
void Delay(unsigned int);

#define SEC 0x00
#define MIN 0x01
#define HOUR 0x02
#define DATE 0x04
#define MONTH 0x05
#define YEAR 0x06
unsigned char lr,mybyte;
unsigned char i,j,a[10],cur=0;
unsigned char packet,sec,hour,min,date,month,year,sec1,hour1,min1,sec2, hour2,min2,hh,mm,ss,dd,mn,yy;
unsigned char count[6]={0x86,0x89,0x8c,0xc6,0xc9,0xcc};
unsigned char dec_hex(unsigned char tt)
{
if(tt>59)
tt+=36;
else if(tt>49)
tt+=30;
else if(tt>39)
tt+=24;
else if(tt>29)
tt+=18;
else if(tt>19)
tt+=12;
else if(tt>9)
tt+=6;
return(tt);
}

void all_disp()
{
	
if(packet=='T')
	{
		
		Delay(18000000);
		RI=0;
		hour=SBUF;
		Lcd8_Decimal2(0xc6,hour);
		Delay(10000000);
		RI=0;
Lcd8_Write(0xc8,'.');
		min=SBUF;
		Lcd8_Decimal2(0xc9,min);
		Delay(10000000);
		RI=0;

		
Lcd8_Write(0xcb,'.');
		sec=SBUF;
		Lcd8_Decimal2(0xcc,sec);
		Delay(1000000);
		RI=0;	
}


}
void main()
{

	TMOD=0x20;
	TH1=0xFD;
	SCON=0X50;
	TR1=1;
Lcd8_Init();
Lcd8_Display(0x80,"SV CORP",7);
Delay(65000);
Delay(65000);
Lcd8_Command(0x01);

Lcd8_Display(Second_Line,"Time:",5);

	
	
while(1)
{
packet=SBUF;
RI=0;
	all_disp();

	
}
}

void Lcd8_Init()
{
Lcd8_Command(0x38); //to select function set
Lcd8_Command(0x06); //entry mode set
Lcd8_Command(0x0c); //display on
Lcd8_Command(0x01); //clear display

}

void Lcd8_Command(unsigned char com)
{

Data_Port=com;
Lcd_en=1;
Lcd_rs=Lcd_rw=0;
Delay(125);
Lcd_en=0;
Delay(125);


}

void Lcd8_Write(unsigned char com,unsigned char lr)
{
	
Lcd8_Command(com);
Data_Port=lr;// Data
Lcd_en=Lcd_rs=1;
Lcd_rw=0;
Delay(125);
Lcd_en=0;
Delay(125);


}

void Lcd8_Display(unsigned char com,const unsigned char *word,unsigned int n)
{
unsigned char Lcd_i;
for(Lcd_i=0;Lcd_i<n;Lcd_i++)
{
Lcd8_Write(com+Lcd_i,word[Lcd_i]);

	
}
}

void Lcd8_Decimal2(unsigned char com,unsigned char val)
{
unsigned int Lcd_hr,Lcd_t,Lcd_o;

Lcd_hr=val%100;
Lcd_t=Lcd_hr/10;
Lcd_o=Lcd_hr%10;

Lcd8_Write(com,Lcd_t+0x30);
Lcd8_Write(com+1,Lcd_o+0x30);
	
}






void Delay(unsigned int del)
{
while(del--);
}

void del()
{
Delay(65000);
Delay(65000);
	
}





	