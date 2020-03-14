#ifndef OPSM_APP_H
#define OPSM_APP_H

#define DEBO_TIME 20

#define IP_B     PORTCbits.RC0   /* Input */
#define IP_G     PORTCbits.RC1    /* Input */
#define IP_R     PORTCbits.RC2    /* Input */

#define OP_B     PORTCbits.RC3    /* Output */
#define OP_G     PORTCbits.RC4    /* Output */
#define OP_R     PORTCbits.RC5    /* Output */




extern void check_cond(void);
extern void exe_cond(void);
extern void sys_init(void);
extern void Uart_Send(void);
#endif