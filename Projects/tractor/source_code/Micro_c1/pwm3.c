#include "pwm3.h"

void PWM3_Initialize(void)
{
    CCP3CON = 0x1C;
    CCPR3L = 0x0E;
    CCPR3H = 0x00;
    C3TSEL0_bit = 0x0;
    PWM3_LoadDutyValue(PWM3_INITIALIZE_DUTY_VALUE);
}

void PWM3_LoadDutyValue(uint16 dutyValue)
{
    CCPR3L = ((dutyValue & 0x03FC)>>2);
    CCP3CON = ((CCP3CON & 0xCF) | ((dutyValue & 0x0003)<<4));
}