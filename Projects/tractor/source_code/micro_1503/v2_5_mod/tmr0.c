#include "APP_OPSM.h"

volatile uint8 guc_togg_half=1;
volatile uint16 one_sec,guc_min=0;


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
    
    if(one_sec>1048)           /*Timer for 1 sec*/
     {
       one_sec=0;
       guc_sec++;
       eng_time++;
       buz_time++;
       UART_Time++;

       
       if(eng_sol)
       {
         if(eng_time > 5){ RELAY_SOL = 1; eng_sol = 0;}
       }
       
       if(guc_buzz_state==1)
         {
           if(buz_time > 5)
           {
             guc_togg_half ^= 1;
             (guc_togg_half==1)?(BUZZER=1):(BUZZER=0);
           }
         }
         else
          {
            BUZZER = 0;
          }
     }
    one_sec++;
}