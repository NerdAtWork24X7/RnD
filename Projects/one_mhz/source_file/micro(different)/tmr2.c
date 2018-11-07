#include "types.h"
#include "tmr2.h"
/*void (*TMR2_InterruptHandler)(void);*/

void TMR2_Initialize(void)
{
  T2CON = 0x00; //0x00;    /* T2CKPS 1:4; T2OUTPS 1:1; TMR2ON off*/
  PR2 = 0x02; //0x03;      /* PR2 29;*/
  TMR2 = 0x00;     /* TMR2 0; */ 
  TMR2IF_bit = 0;    /* Clearing IF flag. */
  TMR2_StartTimer();     /*Start TMR2 */
}

void TMR2_StartTimer(void)
{
  TMR2ON_bit = 1;   /* Start the Timer by writing to TMRxON bit*/
}