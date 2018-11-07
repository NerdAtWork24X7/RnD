#include "types.h"
#include"pic16f1824.h"
#include "tmr0.h"
#include "config.h"

volatile uint8 timer0ReloadVal,sec;
volatile uint16 one_sec,half_sec;
extern volatile uint8 guc_sec,guc_buzz_state;


void TMR0_Initialize(void)
{   /* PSA assigned; PS 1:256; TMRSE Increment_hi_lo; mask the nWPUEN and INTEDG bits*/
    OPTION_REG = (uint8)(OPTION_REG & 0xC0) | 0xD7 & 0x3F; 
    TMR0 = 0xF8;              /* TMR0 248;*/ 
    timer0ReloadVal= 248;     /* Load the TMR value to reload variable */
    INTCONbits.TMR0IF = 0;    /*Clear Interrupt flag before enabling the interrupt*/
    INTCONbits.TMR0IE = 1;    /* Enabling TMR0 interrupt */
}

void TMR0_Reload(void)
{
    TMR0 = timer0ReloadVal;     /* Write to the Timer0 register*/
}

void TMR0_ISR(void)
{
    TMR0_Reload();
    INTCONbits.TMR0IF = 0;     /*Clear the TMR0 interrupt flag8*/
    asm ("CLRWDT");
    if(one_sec>1024)           /*Timer for 1 sec*/
     {
       one_sec=0;
       guc_sec++;
     }      

    if(half_sec>512) /*Timer count for 0.5 sec*/
    {
        half_sec=0;
        TMR0_CallBack_Half_Sec();
    }
    
    one_sec++;half_sec++;
}

void TMR0_CallBack_Half_Sec(void)
{

    if(guc_buzz_state==1)
    {
        CCP3CON = (uint8)(0x0C | ((57 & 0x0003)<<4));  /*Enable PWM */
    }    

    if(guc_buzz_state==0)
     {
        CCP3CON = 0;  /*Diable PWM */
     }

}
