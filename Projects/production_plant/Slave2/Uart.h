#ifndef UART_H
#define UART_H
#include"types.h"
	extern void init_uart(void);
	extern void uart_tx(u8);
	extern u8 uart_rx(void);
	extern void uart_tx_s(u8 *s);
#endif