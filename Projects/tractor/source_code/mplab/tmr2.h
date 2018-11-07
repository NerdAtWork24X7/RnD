#ifndef _TMR2_H
#define _TMR2_H
#include "types.h"

void TMR2_Initialize(void);
void TMR2_StartTimer(void);
void TMR2_StopTimer(void);
uint8 TMR2_ReadTimer(void);
void TMR2_WriteTimer(uint8 timerVal);
void TMR2_LoadPeriodRegister(uint8 periodVal);
bool TMR2_HasOverflowOccured(void);

#endif


