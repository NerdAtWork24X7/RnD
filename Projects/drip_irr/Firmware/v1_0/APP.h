#ifndef OPSM_APP_H
#define OPSM_APP_H

#include "types.h"
#include "tmr0.h"

#define COND1 ((ENGINE_SENSE)&(!PTO)&(!SEAT_SWITCH)&(!HAND_BRAKE))

#define DEBO_TIME 20

#define TOTAL_COND 18

#define NO_CYCLE_1  1000
#define NO_CYCLE_2  1000
#define NO_CYCLE_3  1000
#define NO_CYCLE_4  1000
#define NO_CYCLE_5  1000
#define NO_CYCLE_6  1000

#define DEMO_ADDR    0x40u

#define ENGINE_SENSE    PORTC.RC0    /* Input */
#define STOP_MIN_SW     PORTC.RC1    /* Input */
#define START_HR_SW     PORTC.RC2    /* Input */
#define RESET_SW        PORTC.RC3    /* Input */

#define P_IND        PORTC.RC4    /* Output */
#define RELAY_SOL    PORTC.RC5    /* Output */

#define BUZZER    PORTC.RC4    /* Output */


#define P_IND_EN 0
#define START_REL 0


extern void check_cond(void);
extern void exe_cond(void);
extern void sys_init(void);
extern void Uart_Send(void);
#endif