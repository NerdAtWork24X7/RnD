/****************************************************************************
* NAME:        types.h
* DESCRIPTION: Conatins types header
* AUTHOR:      Sahil Vartak
* COMPANY:     VS-CORP
* EMAIL-ID:    vs.corp.in@gmail.com
***************************************************************************/
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

#define COND1 ((!SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(GEAR))
#define COND2 ((!SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(!GEAR))
#define COND3 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(GEAR))
#define COND4 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(!GEAR))
#define COND5 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(GEAR))
#define COND6 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(!GEAR))

#define NO_CYCLE_1  1000
#define NO_CYCLE_2  1000
#define NO_CYCLE_3  1000
#define NO_CYCLE_4  1000
#define NO_CYCLE_5  1000
#define NO_CYCLE_6  1000

#endif