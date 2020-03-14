#include "tmr2.h"
#include "types.h"

#if PWM_EN == 1
void TMR2_Initialize(void)
{
  T2CON = 0x07;    /* T2CKPS 1:64; T2OUTPS 1:1; TMR2ON on*/
  PR2 = 0x8;      /* PR2 8;*/
  TMR2 = 0x00;     /* TMR2 0; */ 
  TMR2IF_bit = 0;    /* Clearing IF flag. */
  TMR2_StartTimer();     /*Start TMR2 */
}

void TMR2_StartTimer(void)
{
  TMR2ON_bit = 1;   /* Start the Timer by writing to TMRxON bit*/
}
#endif