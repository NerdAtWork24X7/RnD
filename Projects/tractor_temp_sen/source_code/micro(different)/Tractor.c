#include "types.h"
#include "tmr0.h"
#include "tmr2.h"
#include "pwm1.h"
#include "adc.h"

#define NO_CYCLE_1  1000
#define DEMO_ADDR    0x40u

void interrupt()
{
  if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
  {
    TMR0_ISR();
  }
  else if (ADIF_bit == 1)                 /*ADC Interrupt*/
  {
    ADC_ISR();
  }
  else     /*Unhandle interrupt */
  {
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
  uint8 i,j;
  for(i=0;i<1;i++)
   for(j=0;j<400;j++)
     asm CLRWDT;
}

void port_init()
{
  ANSELA=0x04;
  ANSELC=0x00;
  TRISA=0x3F;
  TRISC=0x0F;
  WPUA = 0x00;
  BUZZER = 0;
  LED = 1;
}

void sys_init()
{
  OSCCON = 0x72;              /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
  port_init();
//  my_delay();
//  Check_Demo();
  WDTCON = 0x17;             /*WDTPS 1:65536; SWDTEN ON; */
  ADC_Initialize();
  TMR0_Initialize();
  #if PWM_EN == 1
  TMR2_Initialize();
  PWM1_Initialize();
  #endif
  GIE_bit = 1;               /* Enable INTs  */
}

void main()
{
  sys_init();
  check_adc();
  while(1)
  {
   check_adc();                   /*Check the condition*/
   chk_wait_time(1);
  }
}