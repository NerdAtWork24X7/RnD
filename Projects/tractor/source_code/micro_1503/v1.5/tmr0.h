#ifndef TMR0_H
#define TMR0_H
#include "types.h"

#define TMR0_INTERRUPT_TICKER_FACTOR    1

extern void TMR0_Reload(void);
extern void TMR0_ISR(void);
extern void TMR0_CallBack_One_Sec(void);
extern void TMR0_CallBack_Half_Sec(void);
extern void TMR0_Initialize(void);

#endif