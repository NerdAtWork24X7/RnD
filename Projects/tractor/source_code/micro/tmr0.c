#include "tmr0.h"
#include "types.h"
#include "config.h"
#include "pwm3.h"

volatile uint8 timer0ReloadVal,sec,guc_togg_half=1;
volatile uint16 one_sec,half_sec;
extern volatile uint8 guc_sec,guc_buzz_state;

void TMR0_Initialize(void)
{   
  /* PSA assigned; PS 1:256; TMRSE Increment_hi_lo; mask the nWPUEN and INTEDG bits*/
  OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
  TMR0 = 0xF8;            /* TMR0 248;*/
  timer0ReloadVal= 248;   /* Load the TMR value to reload variable */
  TMR0IF_bit = 0;         /*Clear Interrupt flag before enabling the interrupt*/
  TMR0IE_bit = 1;         /* Enabling TMR0 interrupt */
}

void TMR0_Reload(void)
{
  TMR0 = timer0ReloadVal; /* Write to the Timer0 register*/
}

void TMR0_ISR(void)
{
  TMR0_Reload();
  TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
  asm CLRWDT ;
  if(one_sec>1024)           /*Timer for 1 sec*/
   {
     one_sec=0;
     guc_sec++;
   }
  if(half_sec>512) /*Timer count for 0.5 sec*/
   {
    half_sec=0;
    if(guc_buzz_state==1)
     {
      guc_togg_half ^= 1;
      TMR0_CallBack_Half_Sec();
     }
     else
      {
       #if PWM_ON == 1
       CCP3CON = 0;  /*Diable PWM */
       #else
       BUZZER=0;
       #endif
      }
    }
   one_sec++;half_sec++;
}

void TMR0_CallBack_Half_Sec(void)
{
  if(guc_togg_half==1)
   {
    #if PWM_ON == 1
    CCP3CON = (uint8)(0x0C | ((PWM3_INITIALIZE_DUTY_VALUE & 0x0003)<<4));  /*Enable PWM */
    #else
    BUZZER=1;
    #endif
   }
  if(guc_togg_half==0)
   {
    #if PWM_ON == 1
    CCP3CON = 0;  /*Diable PWM */
    #else
    BUZZER=0;
    #endif
   }
}