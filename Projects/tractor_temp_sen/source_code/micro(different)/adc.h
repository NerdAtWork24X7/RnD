#ifndef ADC_H
#define ADC_H
#include "types.h"

#define THRESHOLD_VAL 634
extern void ADC_Initialize(void);
extern uint32 ADC_GetConversion(void);
extern void ADC_ISR(void);
extern void check_adc(void);
#endif