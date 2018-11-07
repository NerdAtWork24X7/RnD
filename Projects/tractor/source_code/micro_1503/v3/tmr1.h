#ifndef TMR1_H
#define TMR1_H
#include "types.h"

extern void TMR1_Initialize(void);
extern void TMR1_StartTimer(void);
extern void TMR1_StopTimer(void);
extern uint16 TMR1_ReadTimer(void);
extern void TMR1_WriteTimer(uint16 timerVal);
extern void Check_Engine();

#endif
