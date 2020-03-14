#ifndef PWM3_H
#define PWM3_H
#include "types.h"

#define PWM3_INITIALIZE_DUTY_VALUE    35

extern void PWM3_Initialize(void);
extern void PWM3_LoadDutyValue(uint16 dutyValue);

#endif