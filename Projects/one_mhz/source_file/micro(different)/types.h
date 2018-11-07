#ifndef TYPES_H
#define TYPES_H

typedef unsigned char uint8;
typedef signed char int8;
typedef unsigned int uint16;
typedef signed int int16;
typedef unsigned long uint32;
typedef signed long int32;

#define NOP()       asm nop

#define DEFAULT_TME  10
#define MAX_TIME     100
#define DEMO_TIME    10
#define DEMO          0


#define INC         PORTC.RC0
#define DEC         PORTC.RC1
#define START       PORTC.RC2
#define RELAY       PORTC.RC4

#define PWM_EN 1

#define PWM_OFF   0x00
#define PWM_ON    0xC0


#endif