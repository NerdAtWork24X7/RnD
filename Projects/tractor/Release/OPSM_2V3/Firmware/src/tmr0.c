/****************************************************************************
* NAME:        tmr0.c
* DESCRIPTION: Conatins Timer code
* AUTHOR:      Sahil Vartak
* COMPANY:     VS-CORP
* EMAIL-ID:    vs.corp.in@gmail.com
***************************************************************************/
#include "tmr0.h"
#include "types.h"
#include "tmr1.h"

volatile uint8 timer0ReloadVal,sec,guc_togg_half=1;
volatile uint16 one_sec,half_sec,guc_min=0;
volatile int eng_pul=0;
extern volatile uint8 guc_sec,guc_buzz_state;
extern volatile uint16 demo_time;
volatile uint16 eng_H=0,eng_L=0;

/****************************************************************************
* NAME:        TMR0_Initialize
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void TMR0_Initialize(void)
{   
    /* PSA assigned; PS 1:256; TMRSE Increment_hi_lo; mask the nWPUEN and INTEDG bits*/
    OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
    TMR0 = 0xF8;              /* TMR0 248;*/
    timer0ReloadVal= 0xF8;     /* Load the TMR value to reload variable */
    TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
    TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
}

/****************************************************************************
* NAME:        TMR0_Reload
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void TMR0_Reload(void)
{
    TMR0 = timer0ReloadVal;     /* Write to the Timer0 register*/
}

/****************************************************************************
* NAME:        TMR0_ISR
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void TMR0_ISR(void)
{
    TMR0_Reload();
    TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
    asm CLRWDT ;
    if(ENGINE_SENSE == 1){ eng_H++;}
    if(ENGINE_SENSE == 0){ eng_L--;}
    if(one_sec>1048)           /*Timer for 1 sec*/
     {
       one_sec=0;
       guc_sec++;
     }      

    if(half_sec>512) /*Timer count for 0.5 sec*/
    {
        half_sec=0;
        Check_Engine();
        if(guc_buzz_state==1)
         {
           guc_togg_half ^= 1;
           TMR0_CallBack_Half_Sec();
         }
         else
          {
            #if(PWM_EN == 1)
            GIE_bit = 0;              /* Disable INTs  */
            while(BUZZER == 1);
            PWM3CON = PWM_OFF;        /*Diable PWM */
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

/****************************************************************************
* NAME:        TMR0_CallBack_Half_Sec
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void TMR0_CallBack_Half_Sec(void)
{

    if(guc_togg_half==1)
    {   
      #if(PWM_EN == 1)
      PWM3CON = PWM_ON;  /*Enable PWM */
      #else
      BUZZER=1;
      #endif
    }

    if(guc_togg_half==0)
     { 
        #if(PWM_EN == 1)
        GIE_bit = 0;               /* Disable INTs  */
        while(BUZZER == 1);
        PWM3CON = PWM_OFF;        /*Diable PWM */
        while(BUZZER == 1)
           BUZZER = 0;
        GIE_bit = 1;              /* Enable INTs  */
        #else
         BUZZER = 0;
        #endif
     }
}