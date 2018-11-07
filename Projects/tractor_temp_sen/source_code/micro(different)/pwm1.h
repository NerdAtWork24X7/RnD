#ifndef PWM3_H
#define PWM3_H
#include "types.h"
#define PWM3_INITIALIZE_DUTY_VALUE    35
extern void PWM1_Initialize(void);
extern void PWM1_LoadDutyValue(uint16 dutyValue);
extern void PWM1_MStart();
extern void PWM1_MStop();

#endif