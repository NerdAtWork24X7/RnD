#include "pwm3.h"

void PWM3_Initialize(void)
{
  TRISA=0x00;
  PWM3DCH = 0x04;
  PWM3DCL = 0x40;
}

void PWM3_LoadDutyValue(uint16 dutyValue)
{
  PWM3DCH = (dutyValue & 0x03FC)>>2;
  PWM3DCL = (dutyValue & 0x0003)<<6;
}

void Load_PWM3(uint8 Control,uint8 HByte,uint8 LByte)
{
  TRISA=0x00;
  PWM3CON = PWM_OFF;        /*Diable PWM */
  PWM3DCH = HByte;
  PWM3DCL = LByte;
  PWM3CON = PWM_ON;        /*Enable PWM */
}