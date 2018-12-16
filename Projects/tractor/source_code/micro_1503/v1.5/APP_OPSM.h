#ifndef OPSM_APP_H
#define OPSM_APP_H

#include "types.h"
#include "tmr0.h"
#include "tmr2.h"
#include "pwm3.h"

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


#define DEBO_TIME 10

#define TOTAL_COND 14

#define NO_CYCLE_1  1000
#define NO_CYCLE_2  1000
#define NO_CYCLE_3  1000
#define NO_CYCLE_4  1000
#define NO_CYCLE_5  1000
#define NO_CYCLE_6  1000

#define DEMO_ADDR    0x40u

#define ENGINE_SENSE PORTC.RC0    /* Input */
#define HAND_BRAKE   PORTC.RC1    /* Input */
#define PTO          PORTC.RC2    /* Input */
#define SEAT_SWITCH  PORTC.RC3    /* Input */
#define P_IND        PORTC.RC4    /* Output */
#define RELAY_SOL    PORTC.RC5    /* Output */
#define RELAY_STR    PORTA.RA4    /* Output */
#define BUZZER       PORTA.RA2    /* Output */

#define START_REL 0
#define PWM_EN    0

#define PWM_OFF   0x00
#define PWM_ON    0xD0

#define DEBUG  1

#define DEMO 0

typedef struct
{
  uint8 diag_engine_sense : 1;
  uint8 diag_hand_brake : 1;
  uint8 diag_pto : 1;
  uint8 diag_seat_switch : 1;
  uint8 diag_p_ind : 1;
  uint8 diag_Relay_Sol : 1;
  uint8 diag_buzzer : 1;
  uint8 diag_relay_str : 1;
}Diag_data_t;

extern volatile uint8 guc_choice;
//extern volatile uint16 guc_cycle[13];
extern volatile uint8 guc_deb[15];
extern volatile uint16 guc_sec;
extern volatile uint8 guc_buzz_state;
extern volatile uint16 demo_time;
extern volatile Diag_data_t Diag_data_var;
extern volatile uint8 diag_choice;

extern void CHCK_COND(uint8 x);
extern void check_cond(void);
extern void exe_cond(void);
extern void sys_init(void);
extern void Process_Uart(void);
#endif