#ifndef UART_H
#define UART_H

	extern void init_uart(void);
	extern void uart_tx(u8 dat);
	extern u8 uart_rx(void);
	extern void uart_tx_s(u8 *s);
	extern void uart_sint(u16 dat);
#endif