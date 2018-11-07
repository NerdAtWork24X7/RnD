#include"types.h"
#include"button.h"
#include"I2C.h"
#include"lcd.h"
#include"button.h"
#include"PWM.h"
#include"EEPROM.h"

extern u8 pattern,prev_hrs,hrs,mins,sec,day,date,month,year;
extern s8 pre_intensity[7],cur_intensity[7];
const u8 def_pat[24][7]={0,0,0,0,0,0,0,   0,0,0,0,0,0,0,  0,0,0,0,0,0,0,
                         0,0,0,0,0,0,0,   0,0,0,0,0,0,0,  0,0,0,0,0,0,0,
                         0,0,0,0,0,0,0,   0,1,0,0,0,0,0,  0,3,0,0,0,0,0,
                         1,3,0,0,1,0,0,   2,5,0,0,2,1,0,  4,7,0,1,4,2,0,
                         7,7,0,2,4,4,0,   8,4,3,4,2,2,0,  9,4,0,6,1,2,0,
                         7,3,0,8,0,0,0,   5,0,0,4,0,3,0,  2,2,0,1,4,6,0,
                         1,4,0,0,5,4,0,   0,6,2,3,7,2,0,  1,3,5,6,6,0,0,
                         1,1,0,0,0,0,0,   0,0,0,0,0,0,0,  0,0,0,0,0,0,0};
void Init_PWM()
{
   PWM1_Init(500);
   PWM2_Init(500);
   PWM3_Init(500);
   PWM4_Init(500);
   PWM1_Start();
   PWM2_Start();
   PWM3_Start();
   PWM4_Start();
}
void  modify_pwm_ch()
{
   u8 i;
   for(i=0;i<6;i++)
    {
      if(pre_intensity[i]>cur_intensity[i])
       {
          while(cur_intensity[i]<pre_intensity[i])
           {
               pre_intensity[i]--;
               if(i==0) PWM1_Set_Duty(pre_intensity[i]*100);
               else if(i==1) PWM2_Set_Duty(pre_intensity[i]*100);
               else if(i==2) PWM3_Set_Duty(pre_intensity[i]*100);
               else if(i==3) PWM4_Set_Duty(pre_intensity[i]*100);
               else if(i==4) write_I2C(0xD2,0x01,pre_intensity[i]);
               else if(i==5) write_I2C(0xD2,0x02,pre_intensity[i]);
               if(!MENU) {while(!MENU); return;}
               delay_ms(500);

           }
      }
        else if(cur_intensity[i]>pre_intensity[i])
       {
          while(cur_intensity[i]>=pre_intensity[i])
           {
               pre_intensity[i]++;
               if(i==0) PWM1_Set_Duty(pre_intensity[i]*100);
               else if(i==1) PWM2_Set_Duty(pre_intensity[i]*100);
               else if(i==2) PWM3_Set_Duty(pre_intensity[i]*100);
               else if(i==3) PWM4_Set_Duty(pre_intensity[i]*100);
               else if(i==4) write_I2C(0xD2,0x01,pre_intensity[i]);
               else if(i==5) write_I2C(0xD2,0x02,pre_intensity[i]);
               if(!MENU){ while(!MENU); return;}
               delay_ms(500);
           }
        }
        else if(cur_intensity[i]==pre_intensity[i])
       {
               if(i==0) PWM1_Set_Duty(pre_intensity[i]*100);
               else if(i==1) PWM2_Set_Duty(pre_intensity[i]*100);
               else if(i==2) PWM3_Set_Duty(pre_intensity[i]*100);
               else if(i==3) PWM4_Set_Duty(pre_intensity[i]*100);
               else if(i==4) write_I2C(0xD2,0x01,pre_intensity[i]);
               else if(i==5) write_I2C(0xD2,0x02,pre_intensity[i]);
               if(!MENU){while(!MENU)  return;}
           }
       }
       
      memmove(pre_intensity,cur_intensity,sizeof(pre_intensity));
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
      if(pattern==0)  cur_intensity[i]=def_pat[offset][i];
      else if(pattern<=3)  cur_intensity[i]=read_I2C(0xA0,addr+(offset*7)+i);
      else cur_intensity[i]=read_I2C(0xA0,addr+i);
    }
     modify_pwm_ch();
}