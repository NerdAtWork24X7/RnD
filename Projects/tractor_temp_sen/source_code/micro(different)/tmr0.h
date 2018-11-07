#ifndef TMR0_H
#define TMR0_H
#include "types.h"

#define TMR0_INTERRUPT_TICKER_FACTOR    1

extern volatile uint8 timer0ReloadVal,sec,guc_togg_half;
extern volatile uint8 guc_sec,guc_buzz_state,wt_flag;
extern volatile uint16 guc_min,guc_wait_time,one_sec,half_sec;


extern uint8 TMR0_ReadTimer(void);
extern void TMR0_WriteTimer(uint8 timerVal);
extern void TMR0_Reload(void);
extern void TMR0_ISR(void);
extern void TMR0_CallBack(void);
extern void TMR0_SetInterruptHandler(void *InterruptHandler);
extern void (*TMR0_InterruptHandler)(void);
extern void TMR0_DefaultInterruptHandler(void);
extern void TMR0_CallBack_One_Sec(void);
extern void TMR0_CallBack_Half_Sec(void);
extern void TMR0_Initialize(void);
extern void chk_wait_time(uint16 t_mins);

#endif