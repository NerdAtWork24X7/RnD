/****************************************************************************
* NAME:        APP_OPSM.h
* DESCRIPTION: Conatins OPSM Header file
* AUTHOR:      Sahil Vartak
* COMPANY:     VS-CORP
* EMAIL-ID:    vs.corp.in@gmail.com
***************************************************************************/
#ifndef OPSM_APP_H
#define OPSM_APP_H

#include "types.h"
#include "tmr0.h"

#define COND1 ((SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(ENGINE_SENSE))
#define COND2 ((SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(!ENGINE_SENSE))
#define COND3 ((SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(ENGINE_SENSE))
#define COND4 ((SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(!ENGINE_SENSE))
#define COND5 ((SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(ENGINE_SENSE))
#define COND6 ((SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(!ENGINE_SENSE))
#define COND7 ((SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(ENGINE_SENSE))
#define COND8 ((SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(!ENGINE_SENSE))
#define COND9 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(ENGINE_SENSE))
#define COND10 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(!ENGINE_SENSE))
#define COND11 ((!SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(ENGINE_SENSE))
#define COND12 ((!SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(!ENGINE_SENSE))
#define COND13 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(ENGINE_SENSE))


#define TOTAL_COND 16

#define DEMO_ADDR    0x40u

#define ENGINE_SENSE PORTC.RC0
#define HAND_BRAKE   PORTC.RC1
#define PTO          PORTC.RC2
#define SEAT_SWITCH  PORTC.RC3
#define P_IND        PORTC.RC4
#define RELAY_SOL    PORTC.RC5
#define RELAY_STR    PORTA.RA4
#define BUZZER       PORTA.RA2


extern volatile uint8 guc_choice;
extern volatile uint8 guc_deb[15];
extern volatile uint16 guc_sec;
extern volatile uint8 guc_buzz_state;

extern void CHCK_COND(uint8 x);
extern void exe_cond(void);
extern void sys_init(void);
#endif