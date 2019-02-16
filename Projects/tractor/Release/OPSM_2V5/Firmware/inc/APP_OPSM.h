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

#define COND1 ((!ENGINE_SENSE)&(!PTO)&(!SEAT_SWITCH)&(!HAND_BRAKE))
#define COND2 ((!ENGINE_SENSE)&(!PTO)&(!SEAT_SWITCH)&(HAND_BRAKE))
#define COND3 ((!ENGINE_SENSE)&(!PTO)&(SEAT_SWITCH)&(!HAND_BRAKE))
#define COND4 ((!ENGINE_SENSE)&(!PTO)&(SEAT_SWITCH)&(HAND_BRAKE))
#define COND5 ((!ENGINE_SENSE)&(PTO)&(!SEAT_SWITCH)&(!HAND_BRAKE))
#define COND6 ((!ENGINE_SENSE)&(PTO)&(!SEAT_SWITCH)&(HAND_BRAKE))
#define COND7 ((!ENGINE_SENSE)&(PTO)&(SEAT_SWITCH)&(!HAND_BRAKE))
#define COND8 ((!ENGINE_SENSE)&(PTO)&(SEAT_SWITCH)&(HAND_BRAKE))
#define COND9 ((ENGINE_SENSE)&(!PTO)&(!SEAT_SWITCH)&(!HAND_BRAKE))
#define COND10 ((ENGINE_SENSE)&(!PTO)&(!SEAT_SWITCH)&(HAND_BRAKE))
#define COND11 ((ENGINE_SENSE)&(!PTO)&(SEAT_SWITCH)&(!HAND_BRAKE))
#define COND12 ((ENGINE_SENSE)&(!PTO)&(SEAT_SWITCH)&(HAND_BRAKE))
#define COND13 ((ENGINE_SENSE)&(PTO)&(!SEAT_SWITCH)&(!HAND_BRAKE))
#define COND14 ((ENGINE_SENSE)&(PTO)&(!SEAT_SWITCH)&(HAND_BRAKE))
#define COND15 ((ENGINE_SENSE)&(PTO)&(SEAT_SWITCH)&(!HAND_BRAKE))
#define COND16 ((ENGINE_SENSE)&(PTO)&(SEAT_SWITCH)&(HAND_BRAKE))

#define TOTAL_COND 18

#define ENGINE_SENSE PORTA.RA5
#define HAND_BRAKE   PORTC.RC0
#define PTO          PORTC.RC1
#define SEAT_SWITCH  PORTC.RC2

#define P_IND        PORTC.RC3
#define RELAY_SOL    PORTC.RC5
#define RELAY_STR    PORTC.RC4
#define BUZZER       PORTA.RA2

extern volatile uint8 guc_choice;
extern volatile uint8 guc_deb[TOTAL_COND];
extern volatile uint16 guc_sec;
extern volatile uint8 guc_buzz_state;
extern volatile uint8 guc_togg_half;


extern void check_cond(void);
extern void exe_cond(void);
extern void sys_init(void);
#endif