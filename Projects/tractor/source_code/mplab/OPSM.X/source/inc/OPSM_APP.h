/* 
 * File:   OPSM_APP.h
 * Author: Your Name <Sahil Vartak at Vs.Corp.in@gmail.com>
 *
 * Created on December 15, 2018, 8:23 PM
 */

#ifndef OPSM_APP_H
#define	OPSM_APP_H
/****************************Header Files**************************************/
#include "mcc.h"
/******************************************************************************/

#ifdef	__cplusplus
extern "C" {
#endif

/*************************************Macro************************************/
#define COND1 ((SEAT_SWITCH)&&(PTO)&&(HAND_BRAKE)&&(ENGINE_SENSE))
#define COND2 ((SEAT_SWITCH)&&(PTO)&&(HAND_BRAKE)&&(!ENGINE_SENSE))
#define COND3 ((SEAT_SWITCH)&&(!PTO)&&(HAND_BRAKE)&&(ENGINE_SENSE))
#define COND4 ((SEAT_SWITCH)&&(!PTO)&&(HAND_BRAKE)&&(!ENGINE_SENSE))
#define COND5 ((SEAT_SWITCH)&&(PTO)&&(!HAND_BRAKE)&&(ENGINE_SENSE))
#define COND6 ((SEAT_SWITCH)&&(PTO)&&(!HAND_BRAKE)&&(!ENGINE_SENSE))
#define COND7 ((SEAT_SWITCH)&&(!PTO)&&(!HAND_BRAKE)&&(ENGINE_SENSE))
#define COND8 ((SEAT_SWITCH)&&(!PTO)&&(!HAND_BRAKE)&&(!ENGINE_SENSE))
#define COND9 ((!SEAT_SWITCH)&&(PTO)&&(!HAND_BRAKE)&&(ENGINE_SENSE))
#define COND10 ((!SEAT_SWITCH)&&(PTO)&&(!HAND_BRAKE)&&(!ENGINE_SENSE))
#define COND11 ((!SEAT_SWITCH)&&(!PTO)&&(!HAND_BRAKE)&&(ENGINE_SENSE))
#define COND12 ((!SEAT_SWITCH)&&(!PTO)&&(!HAND_BRAKE)&&(!ENGINE_SENSE))
#define COND13 ((!SEAT_SWITCH)&&(PTO)&&(HAND_BRAKE)&&(ENGINE_SENSE))

#define NO_CYCLE_1  1000
#define NO_CYCLE_2  1000
#define NO_CYCLE_3  1000
#define NO_CYCLE_4  1000
#define NO_CYCLE_5  1000
#define NO_CYCLE_6  1000    
    
/******************************************************************************/

/****************************Extern Global Variables***************************/
extern volatile uint8_t guc_choice;
extern volatile uint16_t guc_cycle[13];
extern volatile uint16_t guc_deb[15];
extern volatile uint8_t guc_buzz_state;

/******************************************************************************/

/****************************Extern Function Declaration***********************/
extern void CHCK_COND(uint8_t x);

extern void check_cond(void);

extern void exe_cond(void);
/******************************************************************************/


#ifdef	__cplusplus
}
#endif

#endif	/* OPSM_APP_H */

