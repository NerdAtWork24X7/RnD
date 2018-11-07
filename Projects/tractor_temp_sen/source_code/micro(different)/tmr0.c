#include "tmr0.h"
#include "types.h"
#include "config.h"
#include "pwm3.h"


volatile uint8 timer0ReloadVal,sec,guc_togg_half=1;
volatile uint16 guc_min=0,guc_wait_time=0,one_sec=0,half_sec=0;
volatile uint8 guc_sec=0,guc_buzz_state=0,wt_flag=1,st_flag=1;

void TMR0_Initialize(void)
{   
    /* PSA assigned; PS 1:256; TMRSE Increment_hi_lo; mask the nWPUEN and INTEDG bits*/
    OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
    TMR0 = 0xF8;              /* TMR0 248;*/ 
    timer0ReloadVal= 248;     /* Load the TMR value to reload variable */
    TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
    TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
}

void TMR0_Reload(void)
{
    TMR0 = timer0ReloadVal;     /* Write to the Timer0 register*/
}

void TMR0_ISR(void)
{
  TMR0_Reload();
  TMR0IF_bit = 0;             /*Clear the TMR0 interrupt flag8*/
  asm CLRWDT ;
  if(one_sec>1024)           /*Timer for 1 sec*/
  {
   one_sec=0;
   guc_sec++;
  }
  if(guc_sec>60)
  {
   guc_sec = 0;
   guc_min++;
   guc_wait_time++;
  }
  if(guc_min>60)
   {
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
    #if PWM_EN == 1
    GIE_bit = 0;              /* Disable INTs  */
    while(BUZZER == 1);
    PWM1CON = PWM_OFF;        /*Diable PWM */
    while(BUZZER == 1)
    BUZZER = 0;
    GIE_bit = 1;              /* Enable INTs  */
    #else
    BUZZER = 0;
    #endif
   }
 }
 one_sec++;half_sec++;
}

void TMR0_CallBack_Half_Sec(void)
{
  if(guc_togg_half==1)
  {
   #if PWM_EN == 1
   PWM1CON = PWM_ON;             /*Enable PWM */
   #else
   BUZZER=1;
   #endif
  }
  if(guc_togg_half==0)
  {
   #if PWM_EN == 1
   GIE_bit = 0;               /* Disable INTs  */
   while(BUZZER == 1);
   PWM1CON = PWM_OFF;        /*Diable PWM */
   while(BUZZER == 1)
   BUZZER = 0;
   GIE_bit = 1;              /* Enable INTs  */
   #else
        BUZZER=0;
        #endif
     }
}

void chk_wait_time(uint16 t_mins)
{
  if(OVERIDE == 0)
   {
     while(OVERIDE == 0);
     guc_wait_time = 0;
     wt_flag = 0;             /*wait time flag*/
     st_flag = 0;             /*start of system flag*/
   }
   if(st_flag == 0 && t_mins>guc_wait_time) wt_flag = 0;
   else wt_flag = 1;
}