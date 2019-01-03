#ifndef OPSM_APP_H
#define OPSM_APP_H

#include "types.h"
#include "tmr0.h"
#include "tmr2.h"
#include "pwm3.h"

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



#define DEBO_TIME 10

#define TOTAL_COND 18

#define NO_CYCLE_1  1000
#define NO_CYCLE_2  1000
#define NO_CYCLE_3  1000
#define NO_CYCLE_4  1000
#define NO_CYCLE_5  1000
#define NO_CYCLE_6  1000

#define DEMO_ADDR    0x40u

#define ENGINE_SENSE PORTA.RA5    /* Input */
#define HAND_BRAKE   PORTC.RC0    /* Input */
#define PTO          PORTC.RC1    /* Input */
#define SEAT_SWITCH  PORTC.RC2    /* Input */

#define P_IND        PORTC.RC3    /* Output */
#define RELAY_SOL    PORTC.RC5    /* Output */
#define RELAY_STR    PORTC.RC4    /* Output */
#define BUZZER       PORTA.RA2    /* Output */

#define P_IND_EN 0
#define START_REL 0
#define PWM_EN    0

#define PWM_OFF   0x00
#define PWM_ON    0xD0

#define DEBUG  0

#define DEMO 0

typedef union
{
  uint8 diag_data;
  struct
  {
    uint8 diag_engine_sense : 1;
    uint8 diag_hand_brake : 1;
    uint8 diag_pto : 1;
    uint8 diag_seat_switch : 1;
    uint8 diag_p_ind : 1;
    uint8 diag_Relay_Sol : 1;
    uint8 diag_buzzer : 1;
    uint8 diag_relay_str : 1;
  }Diag_data_bit;
}Diag_data_t;

extern volatile uint8 guc_choice;
//extern volatile uint16 guc_cycle[13];
extern volatile uint8 guc_deb[TOTAL_COND];
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