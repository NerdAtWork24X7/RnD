/****************************************************************************
* NAME:        tmr1.c
* DESCRIPTION: Conatins Timer Header file
* AUTHOR:      Sahil Vartak
* COMPANY:     VS-CORP
* EMAIL-ID:    vs.corp.in@gmail.com
***************************************************************************/
#include "tmr1.h"
#include "types.h"

extern volatile uint8 Eng_On;
extern volatile uint16 eng_H,eng_L;

/****************************************************************************
* NAME:        Check_Engine
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void Check_Engine()
{
  
  if(eng_H>0 && eng_L>0){ Eng_On = 1;}
  else Eng_On = 0;
  eng_H = 0;
  eng_L = 0;
}