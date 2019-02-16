/****************************************************************************
* NAME:        tmr0.h
* DESCRIPTION: Conatins Timer Header file
* AUTHOR:      Sahil Vartak
* COMPANY:     VS-CORP
* EMAIL-ID:    vs.corp.in@gmail.com
***************************************************************************/
#ifndef TMR0_H
#define TMR0_H
#include "types.h"

#define TMR0_INTERRUPT_TICKER_FACTOR    1

uint8 TMR0_ReadTimer(void);
void TMR0_WriteTimer(uint8 timerVal);
void TMR0_Reload(void);
void TMR0_ISR(void);
void TMR0_CallBack(void);
void TMR0_SetInterruptHandler(void *InterruptHandler);
extern void (*TMR0_InterruptHandler)(void);
void TMR0_DefaultInterruptHandler(void);
void TMR0_CallBack_One_Sec(void);
void TMR0_CallBack_Half_Sec(void);
void TMR0_Initialize(void);

#endif