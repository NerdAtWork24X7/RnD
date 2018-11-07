#include"types.h"
#include"button.h"
#include"I2C.h"
#include"lcd.h"
#include"button.h"
#include"socket.h"
#include"EEPROM.h"

#define SOC_1 RB5_bit
#define SOC_2 RB4_bit
#define SOC_3 RC7_bit
#define SOC_4 RC6_bit
#define SOC_5 RC5_bit

#define TIMER_SEC_2 3
#define TIMER_SEC_4 5
#define TIMER_SEC_6 7
#define TIMER_SEC_8 9
#define TIMER_SEC_10 11

#define TIMER_MIN_10 10
#define TIMER_MIN_30 30
#define TIMER_HRS_1  1
#define TIMER_HRS_6  6
#define TIMER_HRS_12  12

extern u8 prev_hrs,hrs,mins,sec,day,date,month,year;
extern s8 pre_mode[7],cur_mode[7],pattern;
extern u8 temp[20];
const u8 def_pat[24][7]={0,0,0,0,0,0,0,   0,0,0,0,0,0,0,  0,0,0,0,0,0,0,
                         0,0,0,0,0,0,0,   0,0,0,0,0,0,0,  0,0,0,0,0,0,0,
                         0,0,0,0,0,0,0,   0,1,0,0,0,0,0,  0,3,0,0,0,0,0,
                         1,3,0,0,1,0,0,   2,5,0,0,2,1,0,  4,7,0,1,4,2,0,
                         7,7,0,2,4,4,0,   8,4,3,4,2,2,0,  9,4,0,6,1,2,0,
                         7,3,0,8,0,0,0,   5,0,0,4,0,3,0,  2,2,0,1,4,6,0,
                         1,4,0,0,5,4,0,   0,6,2,3,7,2,0,  1,3,5,6,6,0,0,
                         1,1,0,0,0,0,0,   0,0,0,0,0,0,0,  0,0,0,0,0,0,0};

void set_socket()
{
//////////Configure socket1/////////////////
    switch(cur_mode[0])
    {
       case 0 : SOC_1=0; break;
       case 1 : SOC_1=1; break;
       case 2 : if((sec%TIMER_SEC_2)==0){ SOC_1^=1; }
                break;
       case 3 : if((mins%TIMER_MIN_10)==0){ SOC_1^=1; }
                break;
       default : SOC_1=0; break;
    }

//////////Configure socket2/////////////////
    switch(cur_mode[1])
    {
       case 0 : SOC_2=0; break;
       case 1 : SOC_2=1; break;
       case 2 : if((sec%TIMER_SEC_4)==0){ SOC_2^=1;}
                break;
       case 3 : if((mins%TIMER_MIN_30)==0){ SOC_2^=1;  }
                break;
       default :SOC_2=0; break;
    }

//////////Configure socket3/////////////////
    switch(cur_mode[2])
    {
       case 0 : SOC_3=0; break;
       case 1 : SOC_3=1; break;
       case 2 : if((sec%TIMER_SEC_6)==0){ SOC_3^=1;}
                break;
       case 3 : if((hrs%TIMER_HRS_1)==0){ SOC_3^=1; }
                break;
       default :SOC_3=0; break;
    }

//////////Configure socket4/////////////////
       switch(cur_mode[3])
    {
       case 0 : SOC_4=0; break;
       case 1 : SOC_4=1; break;
       case 2 : if((sec%TIMER_SEC_8)==0){ SOC_4^=1; }
                break;
       case 3 : if((hrs%TIMER_HRS_6)==0){ SOC_4^=1;}
                break;
       default :SOC_4=0; break;
    }

//////////Configure socket5/////////////////
         switch(cur_mode[4])
    {
       case 0 : SOC_5=0; break;
       case 1 : SOC_5=1; break;
       case 2 : if((sec%TIMER_SEC_10)==0){ SOC_5^=1;}
                break;
       case 3 : if((hrs%TIMER_HRS_12)==0){ SOC_5^=1;}
                break;
       default :SOC_5=0; break;
    }

}
      

void Set_Intensity()
{
   u8 i,offset;
   u16 addr;
   if(pattern==1) addr=0x0000;
   else if(pattern==2) addr=0x00A9;
   else if(pattern==3) addr=0x0152;
   else if(pattern==4) addr=0x01FB;
   else if(pattern==5) addr=0x0202;
   else if(pattern==6) addr=0x0209;

   if(hrs>=0 && hrs<1)        offset=0;
   else if(hrs>=1 && hrs<2)   offset=1;
   else if(hrs>=2 && hrs<3)   offset=2;
   else if(hrs>=3 && hrs<4)   offset=3;
   else if(hrs>=4 && hrs<5)   offset=4;
   else if(hrs>=5 && hrs<6)   offset=5;
   else if(hrs>=6 && hrs<7)   offset=6;
   else if(hrs>=7 && hrs<8)   offset=7;
   else if(hrs>=8 && hrs<9)   offset=8;
   else if(hrs>=9 && hrs<10)  offset=9;
   else if(hrs>=10 && hrs<11) offset=10;
   else if(hrs>=11 && hrs<12) offset=11;
   else if(hrs>=12 && hrs<13) offset=12;
   else if(hrs>=13 && hrs<14) offset=13;
   else if(hrs>=14 && hrs<15) offset=14;
   else if(hrs>=15 && hrs<16) offset=15;
   else if(hrs>=16 && hrs<17) offset=16;
   else if(hrs>=17 && hrs<18) offset=17;
   else if(hrs>=18 && hrs<19) offset=18;
   else if(hrs>=19 && hrs<20) offset=19;
   else if(hrs>=20 && hrs<21) offset=20;
   else if(hrs>=21 && hrs<22) offset=21;
   else if(hrs>=22 && hrs<23) offset=22;
   else if(hrs>=23 && hrs<24) offset=23;
   
   
   for(i=0;i<6;i++)
    {
      if(pattern==0)  cur_mode[i]=def_pat[offset][i];
      else if(pattern<=3)  cur_mode[i]=read_I2C(0xA0,addr+(offset*7)+i);
      else cur_mode[i]=read_I2C(0xA0,addr+i);
    }
    
     set_socket();

      memmove(pre_mode,cur_mode,sizeof(pre_mode));
}