#ifndef TYPES_H
#define TYPES_H
typedef unsigned char uint8;
typedef signed char int8;
typedef unsigned int uint16;
typedef signed int int16;
typedef unsigned long uint32;
typedef signed long int32;
#define NOP() asm nop

#define DEC            PORTC.RC0
#define INC            PORTC.RC1
#define SET_0          PORTC.RC2

#define DEMO 0
#define PWM_OFF   0x00
#define PWM_ON    0xC0

#endif