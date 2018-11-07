#ifndef TMR0_H
#define TMR0_H
#include "Types.h"

#define TMR0_INTERRUPT_TICKER_FACTOR  1
extern uint8 TMR0_ReadTimer(void);
extern void TMR0_WriteTimer(uint8 timerVal);
extern void TMR0_Reload(void);
extern void TMR0_ISR(void);
extern void TMR0_CallBack(void);
extern void TMR0_SetInterruptHandler(void);
extern void TMR0_DefaultInterruptHandler(void);
extern void TMR0_CallBack_One_Sec(void);
extern void TMR0_CallBack_Half_Sec(void);
extern void TMR0_Initialize(void);
#endif