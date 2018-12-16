/**
  Section: Included Files
*/

#include <xc.h>
#include "tmr0.h"
#include "pin_manager.h"
#include "OPSM_APP.h"

/**
  Section: Global Variables Definitions
*/

volatile uint16_t one_sec=0;
volatile uint16_t guc_min=0;
volatile uint16_t guc_sec=0;
volatile uint16_t demo_time;
volatile uint8_t timer0ReloadVal;
volatile uint16_t CountCallBack = 0;
volatile uint16_t Count_sec = 0;

void (*TMR0_InterruptHandler)(void);
/**
  Section: TMR0 APIs
*/

void TMR0_Initialize(void)
{	
    // PSA assigned; PS 1:256; TMRSE Increment_hi_lo; mask the nWPUEN and INTEDG bits
    OPTION_REG = (uint8_t)((OPTION_REG & 0xC0) | (0xD7 & 0x3F)); 	
    // TMR0 240; 
    TMR0 = 0xF0;
    // Load the TMR value to reload variable
    timer0ReloadVal= 240;
    // Clear Interrupt flag before enabling the interrupt
    INTCONbits.TMR0IF = 0;
    // Enabling TMR0 interrupt
    INTCONbits.TMR0IE = 1;
}
/*
uint8_t TMR0_ReadTimer(void)
{
    uint8_t readVal;
    readVal = TMR0;
    return readVal;
}

void TMR0_WriteTimer(uint8_t timerVal)
{
    // Write to the Timer0 register
    TMR0 = timerVal;
}

void TMR0_Reload(void)
{
    // Write to the Timer0 register
    TMR0 = timer0ReloadVal;
}
*/
void TMR0_ISR(void)
{
    // Clear the TMR0 interrupt flag
    INTCONbits.TMR0IF = 0;
    TMR0 = timer0ReloadVal;
    CLRWDT() ;
    //1 sec
    if (Count_sec > 1024)
    {
         guc_sec++;
         one_sec++;
         if (one_sec > 10)
         {
             guc_min++;
             one_sec = 0;
         }
        // reset ticker counter
        Count_sec = 0;
    }

    // callback function - called every 500th pass
    if (CountCallBack >= TMR0_INTERRUPT_TICKER_FACTOR)
    {
        // ticker function call
        TMR0_DefaultInterruptHandler();
        // reset ticker counter
        CountCallBack = 0;
    }
    // add your TMR0 interrupt custom code
    Count_sec++;
    CountCallBack++;
}

void TMR0_DefaultInterruptHandler(void){
    // add your TMR0 interrupt custom code
    if(guc_buzz_state==1)
     {  
        BUZZER_Toggle();
     }
    
     else
     {
       BUZZER_SetLow();
     }
    // or set custom function using TMR0_SetInterruptHandler()
}

/**
  End of File
*/
