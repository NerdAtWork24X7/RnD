#ifndef OPSM_APP_H
#define OPSM_APP_H

#include "types.h"
#include "tmr0.h"

#define DEBO_TIME 20

#define IP_B     PORTC.RC0    /* Input */
#define IP_G     PORTC.RC1    /* Input */
#define IP_R     PORTC.RC2    /* Input */

#define OP_B     PORTC.RC3    /* Output */
#define OP_G     PORTC.RC4    /* Output */
#define OP_R     PORTC.RC5    /* Output */




extern void check_cond(void);
extern void exe_cond(void);
extern void sys_init(void);
extern void Uart_Send(void);
#endif