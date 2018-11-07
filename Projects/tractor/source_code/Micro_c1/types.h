#DEVICE pic16f1824
#ifndef TYPES_H
#define TYPES_H
typedef unsigned char uint8;
typedef char sint8;
typedef unsigned int uint16;
typedef int sint16;
typedef unsigned long uint32;
typedef long sint32;
#define NOP() asm nop

#define SEAT_SWITCH  PORTC.RC0
#define PTO          PORTC.RC1
#define HAND_BRAKE   PORTC.RC2
#define GEAR         PORTC.RC3
#define RELAY        PORTC.RC4
#define BUZZER       PORTA.RA2

#define PWM_ON 1

#endif