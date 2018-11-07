#include "tmr0.h"
#include "types.h"
#include "config.h"
#include "pwm3.h"


volatile uint8 timer0ReloadVal,sec,guc_togg_half=1;
volatile uint16 one_sec,half_sec,guc_min=0;
extern volatile uint8 guc_sec,guc_buzz_state;
extern volatile uint16 demo_time;

void TMR0_Initialize(void)
{   
    /* PSA assigned; PS 1:256; TMRSE Increment_hi_lo; mask the nWPUEN and INTEDG bits*/
    OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
    TMR0 = 0xF8;              /* TMR0 248;*/
    timer0ReloadVal= 0xF8;     /* Load the TMR value to reload variable */
    TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
    TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
}

void TMR0_Reload(void)
{
    TMR0 = timer0ReloadVal;     /* Write to the Timer0 register*/
}

void TMR0_ISR(void)
{

}

void TMR0_CallBack_Half_Sec(void)
{

}