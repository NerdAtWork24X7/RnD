
_interrupt:

;Flasher.c,7 :: 		void interrupt()
;Flasher.c,9 :: 		asm CLRWDT ;
	CLRWDT
;Flasher.c,10 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt5:
;Flasher.c,12 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;Flasher.c,13 :: 		}
L_interrupt2:
;Flasher.c,15 :: 		}
L_end_interrupt:
L__interrupt7:
	RETFIE     %s
; end of _interrupt

_reset_all:

;Flasher.c,17 :: 		void reset_all()
;Flasher.c,19 :: 		WARN_IND = 0;
	BCF        PORTA+0, 0
;Flasher.c,20 :: 		TRAIL_1 = 0;
	BCF        PORTA+0, 1
;Flasher.c,21 :: 		TRAIL_2 = 0;
	BCF        PORTA+0, 5
;Flasher.c,22 :: 		}
L_end_reset_all:
	RETURN
; end of _reset_all

_sys_init:

;Flasher.c,24 :: 		void sys_init()
;Flasher.c,26 :: 		OSCCON = 0x7A; // SCS INTOSC; SPLLEN disabled; IRCF 16MHz_HF;
	MOVLW      122
	MOVWF      OSCCON+0
;Flasher.c,27 :: 		LATA = 0x00;
	CLRF       LATA+0
;Flasher.c,28 :: 		TRISA = 0x1C;
	MOVLW      28
	MOVWF      TRISA+0
;Flasher.c,29 :: 		ANSELA = 0x14;
	MOVLW      20
	MOVWF      ANSELA+0
;Flasher.c,30 :: 		APFCON = 0x29;
	MOVLW      41
	MOVWF      APFCON+0
;Flasher.c,31 :: 		reset_all();
	CALL       _reset_all+0
;Flasher.c,32 :: 		WDTCON = 0x16;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      22
	MOVWF      WDTCON+0
;Flasher.c,33 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;Flasher.c,35 :: 		Soft_UART_Init(&PORTA, 1, 5, 9600, 0); // Initialize Soft UART at 14400 bps
	MOVLW      PORTA+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      1
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	MOVLW      5
	MOVWF      FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
;Flasher.c,37 :: 		ADC_Initialize();
	CALL       _ADC_Initialize+0
;Flasher.c,39 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Flasher.c,40 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;Flasher.c,42 :: 		void main()
;Flasher.c,44 :: 		sys_init();
	CALL       _sys_init+0
;Flasher.c,45 :: 		while(1)
L_main3:
;Flasher.c,47 :: 		asm CLRWDT;
	CLRWDT
;Flasher.c,48 :: 		}
	GOTO       L_main3
;Flasher.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
