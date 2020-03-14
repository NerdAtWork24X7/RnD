#include "APP.h"

volatile uint16 one_sec=0;
volatile uint8 one_min=0,one_hour=0,one_day=0,guc_min=0;

extern volatile uint8 one_day_flag,one_min_flag;
extern volatile uint8 Start_Time_hour,Stop_mins; 

void TMR0_Initialize(void)
{   
  //  OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
    OPTION_REG = 0x17;
    TMR0 = TMR0_RELOAD_VALUE;              /* TMR0 248;*/
    TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
    TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
}

void TMR0_ISR(void)
{
    TMR0 = TMR0_RELOAD_VALUE;     /* Write to the Timer0 register*/
    TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
    
    one_sec++;
    if(one_sec>1047)           /*Timer for 1 sec*/
     {
       one_sec=0;
       (one_min % 5 == 0)? (one_min_flag = 1) : (one_min_flag = 0);
       one_min++;
       if(one_min > 59)
       {
          one_min=0;
          guc_min++;
          one_hour++;
          if(one_hour > 59)
          {
            one_hour=0;
            guc_min = 0;
            (one_day % Start_Time_hour == 0)? (one_day_flag = 1) : (one_day_flag = 0);
            one_day++;
            if(one_day > 23)
            {
              one_day = 0;
            }
          }
          
       }
     }
}