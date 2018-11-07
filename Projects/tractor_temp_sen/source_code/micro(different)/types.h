#ifndef TYPES_H
#define TYPES_H
typedef unsigned char uint8;
typedef signed char int8;
typedef unsigned int uint16;
typedef signed int int16;
typedef unsigned long uint32;
typedef signed long int32;
#define NOP() asm nop

#define LED          PORTC.RC4
#define OVERIDE      PORTC.RC3
#define BUZZER       PORTC.RC5

#define PWM_EN 0

#define PWM_OFF   0x00
#define PWM_ON    0xD0

#endif