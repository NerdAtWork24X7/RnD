#include "types.h"
#include"pic16f1824.h"
#include "tmr2.h"
/*void (*TMR2_InterruptHandler)(void);*/

void TMR2_Initialize(void)
{
  T2CON = 0x02;   /* T2CKPS 1:16; T2OUTPS 1:1; TMR2ON off*/ 
  PR2 = 0x1D;     /* PR2 29;*/ 
  TMR2 = 0x00;     /* TMR2 0; */ 
  PIR1bits.TMR2IF = 0;    /* Clearing IF flag. */
  TMR2_StartTimer();     /*Start TMR2 */
}

void TMR2_StartTimer(void)
{
  T2CONbits.TMR2ON = 1;   /* Start the Timer by writing to TMRxON bit*/
}

/*void TMR2_StopTimer(void)
{
  T2CONbits.TMR2ON = 0;      Stop the Timer by writing to TMRxON bit 
}
*/
/*
uint8 TMR2_ReadTimer(void)
{
    uint8 readVal;
    readVal = TMR2;
    return readVal;
}

void TMR2_WriteTimer(uint8 timerVal)
{
   TMR2 = timerVal; // Write to the Timer2 registe
}

void TMR2_LoadPeriodRegister(uint8 periodVal)
{
   PR2 = periodVal;
}

bool TMR2_HasOverflowOccured(void)
{
    // check if  overflow has occurred by checking the TMRIF bit
    bool status = PIR1bits.TMR2IF;
    if(status)
     {
        PIR1bits.TMR2IF = 0; // Clearing IF flag.
     }
    return status;
}
*/