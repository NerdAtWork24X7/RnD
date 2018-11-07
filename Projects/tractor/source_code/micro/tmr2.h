#ifndef TMR2_H
#define TMR2_H
#include "types.h"
extern void TMR2_Initialize(void);
extern void TMR2_StartTimer(void);
extern void TMR2_StopTimer(void);
extern uint8 TMR2_ReadTimer(void);
extern void TMR2_WriteTimer(uint8 timerVal);
extern void TMR2_LoadPeriodRegister(uint8 periodVal);
extern uint8 TMR2_HasOverflowOccured(void);
#endif