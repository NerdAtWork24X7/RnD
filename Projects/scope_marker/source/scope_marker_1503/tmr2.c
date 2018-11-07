#include "tmr2.h"
#include "types.h"

void Load_TMR2(uint8 Prescalar,uint8 T2Control ,uint8 Timer2)
{
  TMR2ON_bit =0;                  /*Stop the timer*/
  PR2 = Prescalar;                /* PR2 ;*/
  TMR2 = Timer2;                  /* TMR2 0; */
  T2CON = T2Control;              /* T2CKPS  T2OUTPS  TMR2ON on*/
  TMR2IF_bit = 0;                 /* Clearing IF flag. */
  TMR2ON_bit = 1;                 /* Start the Timer by writing to TMRxON bit*/
}
