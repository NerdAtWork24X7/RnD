#ifndef TYPES_H
#define TYPES_H
typedef unsigned char uint8;
typedef signed char int8;
typedef unsigned int uint16;
typedef signed int int16;
typedef unsigned long uint32;
typedef signed long int32;
#define NOP() asm nop

#define HAND_BRAKE   PORTC.RC0    /* Input */
#define PTO          PORTC.RC1    /* Input */
#define SEAT_SWITCH  PORTC.RC2    /* Input */
#define ENGINE_SENSE PORTA.RA5    /* Input */
#define BUZZER       PORTA.RA2    /* Output */
#define RELAY_STR    PORTC.RC4    /* Output */
#define P_IND        PORTC.RC3    /* Output */
#define RELAY_SOL    PORTC.RC5    /* Output */


#define START_REL 0
#define PWM_EN 0

#define PWM_OFF   0x00
#define PWM_ON    0xD0

#define DEMO 0

/*
#define CHCK_COND(x)  guc_deb[x]++; \
                      for(i=0;i<=13 && i!=x;i++){guc_deb[i] = 0;}  \
                      if(guc_deb[x] > 60){ guc_choice = x; guc_deb[x] = 0;}
*/

#endif