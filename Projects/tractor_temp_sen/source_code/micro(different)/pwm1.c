#include "pwm3.h"

void PWM1_Initialize(void)
{
  PWM1DCH = 0x32;
  PWM1DCL = 0xC0;
}

void PWM1_LoadDutyValue(uint16 dutyValue)
{
  PWM1DCH = (dutyValue & 0x03FC)>>2;
  PWM1DCL = (dutyValue & 0x0003)<<6;
}