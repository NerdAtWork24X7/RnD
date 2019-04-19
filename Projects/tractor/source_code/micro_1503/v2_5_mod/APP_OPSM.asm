
_interrupt:

;APP_OPSM.c,15 :: 		void interrupt()
;APP_OPSM.c,17 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,18 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt21:
;APP_OPSM.c,20 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,21 :: 		}
L_interrupt2:
;APP_OPSM.c,23 :: 		}
L_end_interrupt:
L__interrupt23:
	RETFIE     %s
; end of _interrupt

_reset_all:

;APP_OPSM.c,25 :: 		void reset_all()
;APP_OPSM.c,27 :: 		BUZZER = 0;
	BCF        PORTC+0, 4
;APP_OPSM.c,28 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,29 :: 		guc_buzz_state = 0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,30 :: 		}
L_end_reset_all:
	RETURN
; end of _reset_all

_Uart_Send:

;APP_OPSM.c,80 :: 		void Uart_Send()
;APP_OPSM.c,82 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP_OPSM.c,83 :: 		if(PTO)
	BTFSS      PORTC+0, 1
	GOTO       L_Uart_Send3
;APP_OPSM.c,84 :: 		Soft_UART_Write('P');
	MOVLW      80
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
L_Uart_Send3:
;APP_OPSM.c,85 :: 		if(SEAT_SWITCH)
	BTFSS      PORTC+0, 2
	GOTO       L_Uart_Send4
;APP_OPSM.c,86 :: 		Soft_UART_Write('S');
	MOVLW      83
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
L_Uart_Send4:
;APP_OPSM.c,87 :: 		if(HAND_BRAKE)
	BTFSS      PORTC+0, 0
	GOTO       L_Uart_Send5
;APP_OPSM.c,88 :: 		Soft_UART_Write('H');
	MOVLW      72
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
L_Uart_Send5:
;APP_OPSM.c,89 :: 		}
L_end_Uart_Send:
	RETURN
; end of _Uart_Send

_Check_cond:

;APP_OPSM.c,91 :: 		void Check_cond()
;APP_OPSM.c,93 :: 		if(UART_Time > 2) { Uart_Send(); UART_Time = 0;}
	MOVF       _UART_Time+0, 0
	SUBLW      2
	BTFSC      STATUS+0, 0
	GOTO       L_Check_cond6
	CALL       _Uart_Send+0
	CLRF       _UART_Time+0
L_Check_cond6:
;APP_OPSM.c,94 :: 		if(PTO)
	BTFSS      PORTC+0, 1
	GOTO       L_Check_cond7
;APP_OPSM.c,96 :: 		if(SEAT_SWITCH)
	BTFSS      PORTC+0, 2
	GOTO       L_Check_cond8
;APP_OPSM.c,98 :: 		eng_sol = 0;
	CLRF       _eng_sol+0
;APP_OPSM.c,99 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,100 :: 		}
	GOTO       L_Check_cond9
L_Check_cond8:
;APP_OPSM.c,103 :: 		if(!eng_sol)
	MOVF       _eng_sol+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Check_cond10
;APP_OPSM.c,105 :: 		eng_sol = 1;
	MOVLW      1
	MOVWF      _eng_sol+0
;APP_OPSM.c,106 :: 		(eng_direct)?(eng_time = 6):(eng_time = 0);
	MOVF       _eng_direct+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Check_cond11
	MOVLW      6
	MOVWF      _eng_time+0
	MOVF       _eng_time+0, 0
	MOVWF      ?FLOC___Check_condT16+0
	GOTO       L_Check_cond12
L_Check_cond11:
	CLRF       _eng_time+0
	MOVF       _eng_time+0, 0
	MOVWF      ?FLOC___Check_condT16+0
L_Check_cond12:
;APP_OPSM.c,107 :: 		eng_direct = 0;
	CLRF       _eng_direct+0
;APP_OPSM.c,108 :: 		}
L_Check_cond10:
;APP_OPSM.c,109 :: 		}
L_Check_cond9:
;APP_OPSM.c,110 :: 		}
	GOTO       L_Check_cond13
L_Check_cond7:
;APP_OPSM.c,113 :: 		eng_direct = 1;
	MOVLW      1
	MOVWF      _eng_direct+0
;APP_OPSM.c,114 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,115 :: 		eng_sol = 0;
	CLRF       _eng_sol+0
;APP_OPSM.c,116 :: 		}
L_Check_cond13:
;APP_OPSM.c,120 :: 		if(SEAT_SWITCH)
	BTFSS      PORTC+0, 2
	GOTO       L_Check_cond14
;APP_OPSM.c,122 :: 		guc_buzz_state = 0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,123 :: 		BUZZER = 0;
	BCF        PORTC+0, 4
;APP_OPSM.c,124 :: 		}
	GOTO       L_Check_cond15
L_Check_cond14:
;APP_OPSM.c,127 :: 		if(HAND_BRAKE)
	BTFSS      PORTC+0, 0
	GOTO       L_Check_cond16
;APP_OPSM.c,129 :: 		guc_buzz_state = 0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,130 :: 		BUZZER = 0;
	BCF        PORTC+0, 4
;APP_OPSM.c,131 :: 		}
	GOTO       L_Check_cond17
L_Check_cond16:
;APP_OPSM.c,134 :: 		if(!guc_buzz_state)
	MOVF       _guc_buzz_state+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Check_cond18
;APP_OPSM.c,136 :: 		guc_buzz_state = 1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;APP_OPSM.c,137 :: 		buz_time = 0;
	CLRF       _buz_time+0
;APP_OPSM.c,138 :: 		}
L_Check_cond18:
;APP_OPSM.c,139 :: 		}
L_Check_cond17:
;APP_OPSM.c,140 :: 		}
L_Check_cond15:
;APP_OPSM.c,141 :: 		}
L_end_Check_cond:
	RETURN
; end of _Check_cond

_sys_init:

;APP_OPSM.c,144 :: 		void sys_init()
;APP_OPSM.c,146 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,148 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,149 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,150 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,151 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,153 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,154 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,155 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,156 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,158 :: 		reset_all();
	CALL       _reset_all+0
;APP_OPSM.c,160 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,161 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,163 :: 		Soft_UART_Init(&PORTA, 1, 0, 9600, 0); // Initialize Soft UART at 14400 bps
	MOVLW      PORTA+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      1
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	CLRF       FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
;APP_OPSM.c,165 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,170 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP_OPSM.c,172 :: 		void main()
;APP_OPSM.c,174 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,175 :: 		Soft_UART_Write(' ');
	MOVLW      32
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP_OPSM.c,176 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP_OPSM.c,177 :: 		while(1)
L_main19:
;APP_OPSM.c,180 :: 		Check_cond();
	CALL       _Check_cond+0
;APP_OPSM.c,181 :: 		}
	GOTO       L_main19
;APP_OPSM.c,182 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
