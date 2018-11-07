#include "tmr1.h"
#include "types.h"

extern volatile uint8 Eng_On;
extern volatile uint16 eng_H,eng_L;

/* void TMR1_Initialize(void)
{
    T1CON = 0x84;
    T1GCON = 0x40;
    TMR1H = 0x00;
    TMR1L = 0x00;
    TMR1IF_bit = 0;
    TMR1_StartTimer();
}

void TMR1_StartTimer(void)
{
    TMR1ON_bit = 1;
}

void TMR1_StopTimer(void)
{
   TMR1ON_bit = 0;
}

uint16 TMR1_ReadTimer(void)
{
    uint16 readVal;
    uint8 readValHigh;
    uint8 readValLow;

    readValLow = TMR1L;
    readValHigh = TMR1H;

    readVal = ((uint16)readValHigh << 8) | readValLow;

    return readVal;
}

void TMR1_WriteTimer(uint16 timerVal)
{
  while(TMR1ON_bit != 0){TMR1ON_bit = 0;}
  TMR1H = (timerVal >> 8);
  TMR1L = timerVal;
  while(TMR1ON_bit != 1){TMR1ON_bit = 1;}
}
*/

void Check_Engine()
{
//  uint16 count;
//  count = TMR1_ReadTimer();
//  if(count > 100) Eng_On = 1;
//  else Eng_On = 0;
  
  if(eng_H>0 && eng_L>0){ Eng_On = 1;}
  else Eng_On = 0;
  eng_H = 0;
  eng_L = 0;
}