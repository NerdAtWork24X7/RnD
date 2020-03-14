
_interrupt:

;APP.c,7 :: 		void interrupt()
;APP.c,9 :: 		asm CLRWDT ;
	CLRWDT
;APP.c,10 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt18:
;APP.c,12 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP.c,13 :: 		}
L_interrupt2:
;APP.c,15 :: 		}
L_end_interrupt:
L__interrupt20:
	RETFIE     %s
; end of _interrupt

_reset_all:

;APP.c,17 :: 		void reset_all()
;APP.c,19 :: 		OP_R = 0;
	BCF        PORTC+0, 5
;APP.c,20 :: 		OP_G = 0;
	BCF        PORTC+0, 4
;APP.c,21 :: 		OP_B = 0;
	BCF        PORTC+0, 3
;APP.c,22 :: 		}
L_end_reset_all:
	RETURN
; end of _reset_all

_Input_SW:

;APP.c,24 :: 		void Input_SW()
;APP.c,26 :: 		if(IP_R)
	BTFSS      PORTC+0, 2
	GOTO       L_Input_SW3
;APP.c,28 :: 		u_ip_r++;
	INCF       _u_ip_r+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _u_ip_r+0
;APP.c,29 :: 		if(u_ip_r > DEBO_TIME)
	MOVF       _u_ip_r+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_Input_SW4
;APP.c,31 :: 		ML_Status |= 0x01;
	BSF        _ML_Status+0, 0
;APP.c,32 :: 		u_ip_r = DEBO_TIME;
	MOVLW      20
	MOVWF      _u_ip_r+0
;APP.c,33 :: 		}
L_Input_SW4:
;APP.c,35 :: 		}
	GOTO       L_Input_SW5
L_Input_SW3:
;APP.c,38 :: 		u_ip_r = 0;
	CLRF       _u_ip_r+0
;APP.c,39 :: 		ML_Status &= 0xFE;
	MOVLW      254
	ANDWF      _ML_Status+0, 1
;APP.c,40 :: 		}
L_Input_SW5:
;APP.c,43 :: 		if(IP_G)
	BTFSS      PORTC+0, 1
	GOTO       L_Input_SW6
;APP.c,45 :: 		u_ip_g++;
	INCF       _u_ip_g+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _u_ip_g+0
;APP.c,46 :: 		if(u_ip_g > DEBO_TIME)
	MOVF       _u_ip_g+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_Input_SW7
;APP.c,48 :: 		ML_Status |= 0x02;
	BSF        _ML_Status+0, 1
;APP.c,49 :: 		u_ip_g = DEBO_TIME;
	MOVLW      20
	MOVWF      _u_ip_g+0
;APP.c,50 :: 		}
L_Input_SW7:
;APP.c,52 :: 		}
	GOTO       L_Input_SW8
L_Input_SW6:
;APP.c,55 :: 		u_ip_g = 0;
	CLRF       _u_ip_g+0
;APP.c,56 :: 		ML_Status &= 0xFD;
	MOVLW      253
	ANDWF      _ML_Status+0, 1
;APP.c,57 :: 		}
L_Input_SW8:
;APP.c,60 :: 		if(IP_B)
	BTFSS      PORTC+0, 0
	GOTO       L_Input_SW9
;APP.c,62 :: 		u_ip_b++;
	INCF       _u_ip_b+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _u_ip_b+0
;APP.c,63 :: 		if(u_ip_b > DEBO_TIME)
	MOVF       _u_ip_b+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_Input_SW10
;APP.c,65 :: 		ML_Status |= 0x04;
	BSF        _ML_Status+0, 2
;APP.c,66 :: 		u_ip_b = DEBO_TIME;
	MOVLW      20
	MOVWF      _u_ip_b+0
;APP.c,67 :: 		}
L_Input_SW10:
;APP.c,69 :: 		}
	GOTO       L_Input_SW11
L_Input_SW9:
;APP.c,72 :: 		u_ip_b = 0;
	CLRF       _u_ip_b+0
;APP.c,73 :: 		ML_Status &= 0xFB;
	MOVLW      251
	ANDWF      _ML_Status+0, 1
;APP.c,74 :: 		}
L_Input_SW11:
;APP.c,77 :: 		}
L_end_Input_SW:
	RETURN
; end of _Input_SW

_Uart_Send:

;APP.c,79 :: 		void Uart_Send(char* msg)
;APP.c,81 :: 		while(*msg)
L_Uart_Send12:
	MOVF       FARG_Uart_Send_msg+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Uart_Send_msg+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Uart_Send13
;APP.c,82 :: 		Soft_UART_Write(*msg++);
	MOVF       FARG_Uart_Send_msg+0, 0
	MOVWF      FSR0L
	MOVF       FARG_Uart_Send_msg+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
	INCF       FARG_Uart_Send_msg+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_Uart_Send_msg+1, 1
	GOTO       L_Uart_Send12
L_Uart_Send13:
;APP.c,83 :: 		Soft_UART_Write(0x0D);
	MOVLW      13
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,84 :: 		}
L_end_Uart_Send:
	RETURN
; end of _Uart_Send

_recv_mess:

;APP.c,87 :: 		char* recv_mess()
;APP.c,90 :: 		}
L_end_recv_mess:
	RETURN
; end of _recv_mess

_Send_mess:

;APP.c,92 :: 		void Send_mess()
;APP.c,95 :: 		}
L_end_Send_mess:
	RETURN
; end of _Send_mess

_Check_cond:

;APP.c,98 :: 		void Check_cond()
;APP.c,101 :: 		}
L_end_Check_cond:
	RETURN
; end of _Check_cond

_sys_init:

;APP.c,105 :: 		void sys_init()
;APP.c,107 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP.c,109 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP.c,110 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP.c,111 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP.c,112 :: 		TRISA = 0x00;
	CLRF       TRISA+0
;APP.c,114 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP.c,115 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP.c,116 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP.c,117 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP.c,119 :: 		reset_all();
	CALL       _reset_all+0
;APP.c,121 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP.c,122 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP.c,124 :: 		Soft_UART_Init(&PORTA, 5, 4, 9600, 0); // Initialize Soft UART at 14400 bps
	MOVLW      PORTA+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      5
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	MOVLW      4
	MOVWF      FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
;APP.c,126 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP.c,127 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP.c,129 :: 		void main()
;APP.c,131 :: 		sys_init();
	CALL       _sys_init+0
;APP.c,133 :: 		while(1)
L_main14:
;APP.c,135 :: 		if(one_min % 2 == 0)
	MOVLW      1
	ANDWF      _one_min+0, 0
	MOVWF      R1
	MOVF       R1, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main16
;APP.c,137 :: 		Input_SW();
	CALL       _Input_SW+0
;APP.c,138 :: 		}
L_main16:
;APP.c,139 :: 		if(one_min % 30 == 0)
	MOVLW      30
	MOVWF      R4
	MOVF       _one_min+0, 0
	MOVWF      R0
	CALL       _Div_8X8_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;APP.c,141 :: 		Check_Cond();
	CALL       _Check_cond+0
;APP.c,142 :: 		}
L_main17:
;APP.c,143 :: 		}
	GOTO       L_main14
;APP.c,144 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
