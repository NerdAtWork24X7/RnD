#include "types.h"
#include "tmr0.h"
#include "tmr2.h"
#include "pwm3.h"

#define DEMO_ADDR    0x40u

uint16 Demo=0;
volatile uint8 st_flag=0;
volatile uint16 guc_sec=0,guc_min=0;
volatile uint8 cnt,guc_demo_time=0;
volatile uint16  On_Time,i,j,Set_Time;

void interrupt()
{
   if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
    {
        TMR0_ISR();
    }
    else                                   /*Unhandled Interrupt*/
    {
    }
}

void exe_cond()
{
   RELAY = 1;
   while(Set_Time<guc_min);
   RELAY = 0;
}


void check_cond()
{
  if(!DEC)
    {
      Set_Time--;
      while(!DEC);
    }
  else if(!INC)
    {
      Set_Time++;
      while(!INC);
    }
  else if(!START)
   {
     guc_min = 0;
     exe_cond();
     while(!START);
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
   for(i=0;i<1;i++)
    for(j=0;j<400;j++)
      asm CLRWDT ;
}


void sys_init()
{
  uint8 i;
  OSCCON = 0x7A;   /* SCS INTOSC; SPLLEN disabled; IRCF 16MHz_HF; */
  ANSELA=0x00;
  ANSELC=0x00;
  TRISA=0x00;
  TRISC=0x2F;
  RELAY = 0;
//  my_delay();
//  Check_Demo();
  WDTCON = 0x16;   /*WDTPS 1:65536; SWDTEN OFF; */
//  TMR0_Initialize();
  #if PWM_EN == 1
  TMR2_Initialize();
  PWM3_Initialize();
  #endif
  GIE_bit = 1;     /* Enable INTs  */
  while(1);
}

void main()
{
  sys_init();
  On_Time = DEFAULT_TME;
  RELAY = 0;
  while(1)
   {
      check_cond();                 /*Check the condition*/
      #if(DEMO == 1)
       if(guc_demo_time>DEMO_TIME)
         while(1);
      #endif
   }
}