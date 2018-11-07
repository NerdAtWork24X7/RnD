#include "types.h"
#include "tmr0.h"
#include "tmr2.h"
#include "pwm3.h"
#include "memory.h"

uint8 choice=0,ch_flg=0;
uint16 demo_time=0;

void interrupt()
{
   if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
    {

    }
    else                                   /*Unhandled Interrupt*/
    {
    }
}

void check_cond()
{
  if(!DEC)
    {
      choice--;
      while(!DEC);
    }
  else if(!INC)
    {
      choice++;
      while(!INC);
    }
  else if(!SET_0)
   {
     choice = 5;
     while(!SET_0);
   }
  if(choice>17) choice=5;

  if(choice>11)
   {
     if(OSCCON != 0x12)
      {
      /*  OSCCON &= 0xFC;  */
        OSCCON = 0x12; 
      /*  OSCCON |= 0x02;     */
      /*  while(LFIOFR_bit == 0);    */
      }
   }
  else
   {
     if(OSCCON != 0x7A)
      {
      /*  OSCCON &= 0xFC;      */
          OSCCON = 0x7A; 
      /*    OSCCON |= 0x02;    */
/*        while(HFIOFR_bit = 0);
        while(HFIOFS_bit = 0);   */
      }
   }
}

void exe_cond()
{
   switch (choice)
    {
      case 0: if(ch_flg != 0)   /* frequency = 2Mhz , time = 0.5us*/
               {
                 Load_TMR2(0x01,0x04,0x00);
                 Load_PWM3(0xC0,0x00,0x40);
                 TMR2IE_bit = 0;
                 ch_flg=0;
               }
              break;
      case 1: if(ch_flg != 1)  /* frequency = 1Mhz , time = 1us*/
               {
                 Load_TMR2(0x03,0x04,0x00);
                 Load_PWM3(0xC0,0x00,0x40);
                 TMR2IE_bit = 0;
                 ch_flg=1;
               }
              break;
      case 2: if(ch_flg != 2) /* frequency = 500Khz , time = 2us*/
               {
                 Load_TMR2(0x07,0x04,0x00);
                 Load_PWM3(0xC0,0x00,0x40);
                 TMR2IE_bit = 0;
                 ch_flg = 2;
               }
              break;
      case 3: if(ch_flg != 3) /* frequency = 200Khz , time = 5us*/
               {
                 Load_TMR2(0x13,0x04,0x00);
                 Load_PWM3(0xC0,0x04,0xC0);
                 TMR2IE_bit = 0;
                 ch_flg = 3;
               }
              break;
      case 4: if(ch_flg != 4)  /* frequency = 100Khz , time = 10us*/
               {
                 Load_TMR2(0x27,0x04,0x00);
                 Load_PWM3(0xC0,0x01,0xC0);
                 TMR2IE_bit = 0;
                 ch_flg = 4;
               }
              break;
      case 5: if(ch_flg != 5)  /* frequency = 50Khz , time = 20us*/
               {
                 Load_TMR2(0x4F,0x04,0x00);
                 Load_PWM3(0xC0,0x03,0xC0);
                 TMR2IE_bit = 0;
                 ch_flg = 5;
               }
              break;
      case 6: if(ch_flg != 6)  /* frequency = 20Khz , time = 50us*/
               {
                 Load_TMR2(0xC7,0x04,0x00);
                 Load_PWM3(0xC0,0x09,0xC0);
                 TMR2IE_bit = 0;
                 ch_flg=6;
               }
              break;
      case 7: if(ch_flg != 7) /* frequency = 10Khz , time = 0.1ms*/
               {
                 Load_TMR2(0x63,0x05,0x00);
                 Load_PWM3(0xC0,0x04,0xC0);
                 TMR2IE_bit = 0;
                 ch_flg = 7;
               }
              break;
      case 8: if(ch_flg != 8) /* frequency = 5Khz , time = 0.2ms*/
               {
                 Load_TMR2(0xC7,0x05,0x00);
                 Load_PWM3(0xC0,0x09,0xC0);
                 TMR2IE_bit = 0;
                 ch_flg = 8;
               }
              break;
      case 9: if(ch_flg != 9)  /* frequency = 2Khz , time = 0.5ms*/
               {
                 Load_TMR2(0x7C,0x06,0x00);
                 Load_PWM3(0xC0,0x06,0x00);
                 TMR2IE_bit = 0;
                 ch_flg = 9;
               }
              break;
      case 10: if(ch_flg != 10)  /* frequency = 1Khz , time = 1ms*/
               {
                 Load_TMR2(0xF9,0x06,0x00);
                 Load_PWM3(0xC0,0x0C,0x01);
                 TMR2IE_bit = 0;
                 ch_flg=10;
               }
              break;
      case 11: if(ch_flg != 11)  /* frequency = 500hz , time = 2ms*/
               {
                 Load_TMR2(0x7C,0x07,0x00);
                 Load_PWM3(0xC0,0x06,0x00);
                 TMR2IE_bit = 0;
                 ch_flg=11;
               }
              break;
      case 12: if(ch_flg != 12)  /* frequency = 200hz , time = 5ms*/
               {
                 Load_TMR2(0x26,0x04,0x00);
                 Load_PWM3(0xC0,0x01,0xC0);
                 TMR2IE_bit = 0;
                 ch_flg=12;
               }
              break;
      case 13: if(ch_flg != 13) /* frequency = 100hz , time = 10ms*/
               {
                 Load_TMR2(0x4D,0x04,0x00);
                 Load_PWM3(0xC0,0x03,0xC0);
                 ch_flg=13;
                 TMR2IE_bit = 1;
               }
              break;
      case 14: if(ch_flg != 14) /* frequency = 50hz , time = 20ms*/
               {
                 Load_TMR2(0x9A,0x04,0x00);
                 Load_PWM3(0xC0,0x07,0x02);
                 ch_flg=14;
                 TMR2IE_bit = 1;
               }
              break;
      case 15: if(ch_flg!=15) /* frequency = 20hz , time = 50ms*/
               {
                 Load_TMR2(0x60,0x05,0x00);
                 Load_PWM3(0xC0,0x04,0x80);
                 ch_flg=15;
                 TMR2IE_bit = 1;
               }
              break;
      case 16: if(ch_flg!=16) /* frequency = 10hz , time = 0.1s*/
               {
                 Load_TMR2(0x2F,0x06,0x00);
                 Load_PWM3(0xC0,0x02,0x40);
                 ch_flg=16;
                 TMR2IE_bit = 1;
               }
              break;
      case 17: if(ch_flg!=17)  /* frequency = 5hz , time = 0.2s*/
               {
                 Load_TMR2(0x60,0x06,0x00);
                 Load_PWM3(0xC0,0x04,0x02);
                 ch_flg=17;
                 TMR2IE_bit = 1;
               }
              break;
      default: break;

    }
}

/*
void Check_Demo()
{
    uint8 udemo,ldemo;
    
    WDTCON = 0x16;
    if(PORTC.RC5==0)
     {
       DATAEE_WriteByte(DEMO_ADDR,0xFF);
       DATAEE_WriteByte(DEMO_ADDR+1,0xFF);
       while(1);
     }
    udemo=DATAEE_ReadByte(DEMO_ADDR);
    ldemo=DATAEE_ReadByte(DEMO_ADDR+1);
    Demo=(((udemo<<8)&0xFF00)|ldemo);

    if(Demo==0xFFFF)
    {
        Demo=0;
    }
    if(Demo>800) { while(1); }
    else 
    {
        Demo++;
        ldemo = (uint8)(Demo & 0x00FF);
        udemo = (uint8)(((Demo>>8)&0x00FF));
        
        DATAEE_WriteByte(DEMO_ADDR,udemo);
        DATAEE_WriteByte((DEMO_ADDR+1),ldemo);
    }   
}      */

void my_delay()
{
   int i,j;
   for(i=0;i<1;i++)
    for(j=0;j<400;j++)
      asm CLRWDT ;
}


void sys_init()
{
  OSCCON = 0x7A;   /* SCS INTOSC; SPLLEN disabled; IRCF 16MHz_HF; */
  ANSELA=0x00;
  ANSELC=0x00;
  TRISA=0x00;
  TRISC=0x0F;
  WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
  GIE_bit = 1;     /* Enable INTs  */
}

void main()
{
  sys_init();
  demo_time = 0;
  while(1)
   {
      check_cond();                 /*Check the condition*/
      exe_cond();
      #if(DEMO == 1)
      if(demo_time>360)
       {
         while(1);
       }
      #endif
   }
}