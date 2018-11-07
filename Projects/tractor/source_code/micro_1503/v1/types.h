#ifndef TYPES_H
#define TYPES_H
typedef unsigned char uint8;
typedef signed char int8;
typedef unsigned int uint16;
typedef signed int int16;
typedef unsigned long uint32;
typedef signed long int32;
#define NOP() asm nop

#define GEAR         PORTC.RC0
#define HAND_BRAKE   PORTC.RC1
#define PTO          PORTC.RC2
#define SEAT_SWITCH  PORTC.RC3
#define RELAY        PORTC.RC4
#define BUZZER       PORTA.RA2

#define PWM_EN 1

#define PWM_OFF   0x00
#define PWM_ON    0xD0

#define DEMO 1

#endif