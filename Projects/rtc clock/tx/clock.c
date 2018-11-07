#include<reg51.h>


sbit set=P3^4;
sbit mov=P3^3;
sbit inc=P3^5;
sbit dec=P3^6;
sbit ent=P3^7;
void all_disp();
void time_set();


#define First_Line 0x80
#define Second_Line 0xc0
#define Curser_On 0x0f
#define Curser_Off 0x0c
#define Clear_Display 0x01

#define Data_Port P2

sbit Lcd_rs = P0^5;
sbit Lcd_rw = P0^4;
sbit Lcd_en = P0^3;

sbit sda_rtc =P0^7;
sbit scl_rtc =P0^6;

/*sbit Lcd_rs = P3^5;
sbit Lcd_rw = P3^6;
sbit Lcd_en = P3^7; */

void Lcd8_Init();
void Lcd8_Command(unsigned char);
void Lcd8_Write(unsigned char,unsigned char);
void Lcd8_Display(unsigned char,const unsigned char*,unsigned int);
void Lcd8_Decimal2(unsigned char,unsigned char);
void Delay(unsigned int);
void del();
void SerTx(unsigned char );

#define DS1307_ID 0xD0
#define SEC 0x00
#define MIN 0x01
#define HOUR 0x02
#define DATE 0x04
#define MONTH 0x05
#define YEAR 0x06



DS1307_get(unsigned char);
void DS1307_settime(unsigned char, unsigned char, unsigned char);
void DS1307_setdate(unsigned char, unsigned char, unsigned char);
Send2lcd(unsigned char);
void Rtc_Write(unsigned char,unsigned char);
Rtc_Read(unsigned char);
void Rtc_rd_wr_sub();
void Rtc_Init();
void Rtc_Start();
void Rtc_Tx();
void Rtc_Rx();
void Rtc_Stop();
void Rtc_Ack();


unsigned int Rtc_add_wr,Rtc_add_rd;
unsigned char d_rtc,datain_rtc,in_rtc,temp_rtc,dat_rtc,flag_rtc;

unsigned char i,j,a[10],cur=0;
unsigned char sec,hour,min,date,month,year,sec1,hour1,min1,sec2, hour2,min2,hh,mm,ss,dd,mn,yy;
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
sec = DS1307_get(SEC);
min = DS1307_get(MIN);
hour = DS1307_get(HOUR);
date = DS1307_get(DATE);
month = DS1307_get(MONTH);
year = DS1307_get(YEAR);

sec=Send2lcd(sec);
min=Send2lcd(min);
hour=Send2lcd(hour);
date=Send2lcd(date);
month=Send2lcd(month);
year=Send2lcd(year);


Lcd8_Decimal2(0xc6,hour);
SerTx(hour);

Lcd8_Write(0xc8,'.');
Lcd8_Decimal2(0xc9,min);
SerTx(min);

Lcd8_Write(0xcb,'.');
Lcd8_Decimal2(0xcc,sec);
SerTx(sec);
}

char p_sw_state[5]={0};
volatile char sw_state=0xF0;


void Check_Switch()
{
  int i;
  char l_sw_state;
  l_sw_state=P3;
  l_sw_state>>=3;

  for(i=4;i>=0;i--)
  {
    if(!(l_sw_state&(1<<i)))
     {
       if(p_sw_state[i]==0)
	    {
          p_sw_state[i]=1;
	      sw_state^=(1<<i);
	    }	   
	 }
	if(p_sw_state[i]==2) p_sw_state[i]=0;
	if(l_sw_state&(1<<i))p_sw_state[i]=2; 
   }
}
void Disp_Switch()
{
  int i,col_n=0xC0;
  

  for(i=4;i>=0;i--)
   {
     col_n=0xC0+(i*3);
     if(sw_state&(1<<i))
	  {
        Lcd8_Write(col_n,'O');
		Lcd8_Write(col_n+1,'N');
	  }
	 else
	  {
	    Lcd8_Write(col_n,'O');
		Lcd8_Write(col_n+1,'F');
	  }
   }
}

void main()
{
  int n=0;
	TMOD=0x20;
	TH1=0xFD;
	SCON=0X50;
	TR1=1; 
Lcd8_Init();
Lcd8_Display(0x80,"S1 S2 S3 S4 S5",15);
while(1)
{
Check_Switch();
Disp_Switch();
if(n=100000)
{
  SerTx('T');
  SerTx(sw_state);
  n=0;
}
 n++;
}
/*Lcd8_Display(Second_Line,"Time:",5);*/
/*Rtc_Init();*/ 

	
	
	
	
	
//DS1307_setdate(0x04,0x11,0x11);
//DS1307_settime(0x16,0x00,0x00);

while(1)
{
SerTx('T');
all_disp();
if(!set)
time_set();



}
}

void SerTx(unsigned char x)
{

SBUF=x;
while(TI==0);
Delay(1000);
//Delay(10000000);
TI=0;


}


void time_set()
{
Lcd8_Display(0x80," TIME SET ",16);
Lcd8_Display(0xc0," MODE ",16);
Delay(65000);
Lcd8_Command(0x01);
Lcd8_Display(First_Line,"Date:",5);
Lcd8_Display(Second_Line,"Time:",5);
all_disp();

cur=0;

while(ent)
{
Lcd8_Command(0x0f);
Lcd8_Command(count[cur]);
if(mov==0)
{
while(!mov);
cur++;
if(cur==6)
cur=0;
}
else if(count[cur]==0x86)
{
if(inc==0)
{
while(!inc);
date++;
if(date>=32)
date=1;
Lcd8_Decimal2(count[cur],date);
}
else if(dec==0)
{
while(!dec);
date--;
if(date==0xff)
date=31;
Lcd8_Decimal2(count[cur],date);
}
}

else if(count[cur]==0x89)
{
if(inc==0)
{
while(!inc);
month++;
if(month>=13)
month=1;
Lcd8_Decimal2(count[cur],month);
}
else if(dec==0)
{
while(!dec);
month--;
if(month==0xff)
month=12;
Lcd8_Decimal2(count[cur],month);
}
}

else if(count[cur]==0x8c)
{
if(inc==0)
{
while(!inc);
year++;
if(year>99)
year=0;
Lcd8_Decimal2(count[cur],year);
}
else if(dec==0)
{
while(!dec);
year--;
if(year==0xff)
year=99;
Lcd8_Decimal2(count[cur],year);
}
}

else if(count[cur]==0xc6)
{
if(inc==0)
{
while(inc==0);
hour++;
if(hour>=24)
hour=0;
Lcd8_Decimal2(count[cur],hour);
}
else if(dec==0)
{
while(dec==0);
hour--;
if(hour==0)
hour=23;
Lcd8_Decimal2(count[cur],hour);
}
}

else if(count[cur]==0xc9)
{
if(inc==0)
{
while(inc==0);
min++;
if(min>=60)
min=0;
Lcd8_Decimal2(count[cur],min);
}
else if(dec==0)
{
while(dec==0);
min--;
if(min==0)
min=59;
Lcd8_Decimal2(count[cur],min);
}
}

else if(count[cur]==0xcc)
{
if(inc==0)
{
while(inc==0);
Lcd8_Command(0x0c);
sec++;
if(sec>=60)
sec=0;
Lcd8_Decimal2(count[cur],sec);
}
else if(dec==0)
{
while(dec==0);
Lcd8_Command(0x0c);
sec--;
if(sec==0xff)
sec=59;
Lcd8_Decimal2(count[cur],sec);
}
}
}


Lcd8_Command(0x0c);
Lcd8_Display(0x80," TIME IS ",16);
Lcd8_Display(0xc0," STORED ",16);
Delay(65000);Delay(65000);

dd=dec_hex(date);
mn=dec_hex(month);
yy=dec_hex(year);
hh=dec_hex(hour);
mm=dec_hex(min);
ss=dec_hex(sec);

DS1307_settime(hh,mm,ss);
DS1307_setdate(dd,mn,yy);
Lcd8_Command(0x01);
Lcd8_Display(First_Line,"Date:",5);
Lcd8_Display(Second_Line,"Time:",5);
Delay(65000);

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


/*********************************LCD HEADER FILE END*************************************/



/*********************************RTC HEADER FILE START*********************************/


DS1307_get(unsigned char addr)
{
unsigned char ret;

Rtc_Start();
ret = Rtc_Read(addr);
Rtc_Stop();


return ret;
}

void DS1307_settime(unsigned char hh, unsigned char mm, unsigned char ss)
{
Rtc_Start();

Rtc_Write(0x00,ss); /* Write sec on RAM address 00H */
Rtc_Write(0x01,mm); /* Write min on RAM address 01H */
Rtc_Write(0x02,hh); /* Write hour on RAM address 02H */

Rtc_Stop(); /* Stop i2c bus */
}


void DS1307_setdate(unsigned char dd, unsigned char mm, unsigned char yy)
{
Rtc_Start();

Rtc_Write(0x04,dd); /* Write date on RAM address 04H */
Rtc_Write(0x05,mm); /* Write month on RAM address 05H */
Rtc_Write(0x06,yy); /* Write year on RAM address 06H */

Rtc_Stop(); /* Stop i2c bus */
}


Send2lcd(unsigned char value)
{
unsigned char buf1,buf2,buf = 0;

buf1 = value & 0xF0; /* Filter for high byte */
buf1 = (buf1>>4); /* Convert to ascii code */
buf2 = value & 0x0F; /* Filter for low byte */
buf=(buf1*10)+buf2;


return buf;
}


void Rtc_Init()//lower order 256 bytes of the chip
{
Rtc_add_wr=0xd0;
Rtc_add_rd=0xd1;
}


void Rtc_Write(unsigned char zig,unsigned char zag)// program to write to EEPROM
{
dat_rtc=zig;
temp_rtc=zag;
Rtc_rd_wr_sub();
above:
d_rtc=temp_rtc;
Rtc_Tx();
if (CY==1)goto above;
CY=0;
	
Rtc_Stop();
}


Rtc_Read(unsigned char zig)// program to read from EEPROM
{
dat_rtc=zig;
Rtc_rd_wr_sub();
Rtc_Start();
be:
d_rtc=Rtc_add_rd; // 0xd1 =Rtc_add_rd
Rtc_Tx();
if(CY==1)goto be;
Rtc_Rx();
Rtc_Ack();
CY=0;
Rtc_Stop();

return(datain_rtc);
}


void Rtc_Start()// must for any operation on EEPROM
{
sda_rtc=1;
scl_rtc=1;
sda_rtc=0;
scl_rtc=0;
}


void Rtc_Stop()// this is similar to the START operation whereas this should be performed after the completion of any operation
{
sda_rtc=0;
scl_rtc=1;
sda_rtc=1;
}


void Rtc_Tx()// program to send the device address, read/write address,data to be written
{
signed char i_rtc;
for(i_rtc=7;i_rtc>=0;i_rtc--)// should necessarily be initialised as signed char.
{
CY=(d_rtc>>i_rtc)&0x01;
sda_rtc=CY;
scl_rtc=1;// clock is essential inorder to write or read
scl_rtc=0;// clk should be alternated
}
sda_rtc=1;
scl_rtc=1;
CY=sda_rtc;
scl_rtc=0;

}


void Rtc_Rx()// program read the data from the EEPROM
{
unsigned char l_rtc;
sda_rtc=1;
for (l_rtc=0;l_rtc<=7;l_rtc++)
{
scl_rtc=1;
in_rtc=in_rtc<<1;
in_rtc|=sda_rtc;
scl_rtc=0;
}
datain_rtc=in_rtc;
in_rtc=0;
}


void Rtc_Ack()// this is to intimate the EEPROM that the read operation is over
{
sda_rtc=1;
scl_rtc=1;
scl_rtc=0;
}


void Rtc_rd_wr_sub()// this routine will be used by both the read & write operations to send the device address & the address at which the corresponding action is to be taken
{
Rtc_Start();
here1:
d_rtc=Rtc_add_wr;// 0xd0 device address is passed
Rtc_Tx();
if(CY==1)goto here1;
again1:
d_rtc=dat_rtc;// the address from which data is to be read/written is to be passed
Rtc_Tx();
if(CY==1)goto again1;
	
}


	