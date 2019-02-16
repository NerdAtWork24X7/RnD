/****************************************************************************
* NAME:        tmr0.c
* DESCRIPTION: Conatins Timer code
* AUTHOR:      Sahil Vartak
* COMPANY:     VS-CORP
* EMAIL-ID:    vs.corp.in@gmail.com
***************************************************************************/
#include "../inc/APP_OPSM.h"

volatile uint8 timer0ReloadVal,guc_togg_half=1;
volatile uint16 one_sec,half_sec,guc_min=0;


/****************************************************************************
* NAME:        TMR0_Initialize
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void TMR0_Initialize(void)
{
    OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
    TMR0 = 0xF8;
    timer0ReloadVal= 0xF8;
    TMR0IF_bit = 0;
    TMR0IE_bit = 1;
}

/****************************************************************************
* NAME:        TMR0_Reload
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void TMR0_Reload(void)
{
    TMR0 = timer0ReloadVal;
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
    TMR0IF_bit = 0;
    if(one_sec>1048)
     {
       one_sec=0;
       guc_sec++;
     }

    if(half_sec>512)
    {
        half_sec=0;
        if(guc_buzz_state==1)
         {
           guc_togg_half ^= 1;
           TMR0_CallBack_Half_Sec();
         }
         else
          {
            BUZZER = 0;
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
      BUZZER=1;
    }

    if(guc_togg_half==0)
     {
         BUZZER = 0;
     }
}