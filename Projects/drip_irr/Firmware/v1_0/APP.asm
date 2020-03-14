
_interrupt:

;APP.c,8 :: 		void interrupt()
;APP.c,10 :: 		asm CLRWDT ;
	CLRWDT
;APP.c,11 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt22:
;APP.c,13 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP.c,14 :: 		}
L_interrupt2:
;APP.c,16 :: 		}
L_end_interrupt:
L__interrupt24:
	RETFIE     %s
; end of _interrupt

_reset_all:

;APP.c,18 :: 		void reset_all()
;APP.c,20 :: 		BUZZER = 0;
	BCF        PORTC+0, 4
;APP.c,21 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP.c,22 :: 		one_sec = 0;
	CLRF       _one_sec+0
	CLRF       _one_sec+1
;APP.c,23 :: 		one_min = 0;
	CLRF       _one_min+0
;APP.c,24 :: 		one_hour = 59;
	MOVLW      59
	MOVWF      _one_hour+0
;APP.c,25 :: 		one_day = 0 ;
	CLRF       _one_day+0
;APP.c,26 :: 		guc_min = 0;
	CLRF       _guc_min+0
;APP.c,27 :: 		Start_Time_hour = 4;
	MOVLW      4
	MOVWF      _Start_Time_hour+0
;APP.c,28 :: 		Stop_mins = 1;
	MOVLW      1
	MOVWF      _Stop_mins+0
;APP.c,29 :: 		}
L_end_reset_all:
	RETURN
; end of _reset_all

_Input_SW:

;APP.c,31 :: 		void Input_SW()
;APP.c,34 :: 		if(!STOP_MIN_SW)
	BTFSC      PORTC+0, 1
	GOTO       L_Input_SW3
;APP.c,36 :: 		luc_stop_min_sw++;
	INCF       _luc_stop_min_sw+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _luc_stop_min_sw+0
;APP.c,37 :: 		luc_start_hr_sw = 0; luc_reset = 0;
	CLRF       _luc_start_hr_sw+0
	CLRF       _luc_reset+0
;APP.c,38 :: 		}
L_Input_SW3:
;APP.c,39 :: 		if(!START_HR_SW)
	BTFSC      PORTC+0, 2
	GOTO       L_Input_SW4
;APP.c,41 :: 		luc_start_hr_sw++;
	INCF       _luc_start_hr_sw+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _luc_start_hr_sw+0
;APP.c,42 :: 		luc_stop_min_sw = 0; luc_reset = 0;
	CLRF       _luc_stop_min_sw+0
	CLRF       _luc_reset+0
;APP.c,43 :: 		}
L_Input_SW4:
;APP.c,44 :: 		if(!RESET_SW)
	BTFSC      PORTC+0, 3
	GOTO       L_Input_SW5
;APP.c,46 :: 		luc_reset++;
	INCF       _luc_reset+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _luc_reset+0
;APP.c,47 :: 		luc_stop_min_sw = 0; luc_start_hr_sw = 0;
	CLRF       _luc_stop_min_sw+0
	CLRF       _luc_start_hr_sw+0
;APP.c,48 :: 		}
L_Input_SW5:
;APP.c,51 :: 		if(luc_stop_min_sw > DEBO_TIME)
	MOVF       _luc_stop_min_sw+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_Input_SW6
;APP.c,53 :: 		Stop_mins++;
	INCF       _Stop_mins+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _Stop_mins+0
;APP.c,54 :: 		if(Stop_mins>59) Stop_mins = 1;
	MOVF       _Stop_mins+0, 0
	SUBLW      59
	BTFSC      STATUS+0, 0
	GOTO       L_Input_SW7
	MOVLW      1
	MOVWF      _Stop_mins+0
L_Input_SW7:
;APP.c,55 :: 		luc_stop_min_sw = 0;
	CLRF       _luc_stop_min_sw+0
;APP.c,56 :: 		while(!STOP_MIN_SW);
L_Input_SW8:
	BTFSC      PORTC+0, 1
	GOTO       L_Input_SW9
	GOTO       L_Input_SW8
L_Input_SW9:
;APP.c,57 :: 		}
L_Input_SW6:
;APP.c,60 :: 		if(luc_start_hr_sw > DEBO_TIME)
	MOVF       _luc_start_hr_sw+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_Input_SW10
;APP.c,62 :: 		Start_Time_hour++;
	INCF       _Start_Time_hour+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _Start_Time_hour+0
;APP.c,63 :: 		if(Start_Time_hour>23) Start_Time_hour = 1;
	MOVF       _Start_Time_hour+0, 0
	SUBLW      23
	BTFSC      STATUS+0, 0
	GOTO       L_Input_SW11
	MOVLW      1
	MOVWF      _Start_Time_hour+0
L_Input_SW11:
;APP.c,64 :: 		luc_start_hr_sw = 0;
	CLRF       _luc_start_hr_sw+0
;APP.c,65 :: 		while(!START_HR_SW);
L_Input_SW12:
	BTFSC      PORTC+0, 2
	GOTO       L_Input_SW13
	GOTO       L_Input_SW12
L_Input_SW13:
;APP.c,66 :: 		}
L_Input_SW10:
;APP.c,69 :: 		if(luc_reset > DEBO_TIME)
	MOVF       _luc_reset+0, 0
	SUBLW      20
	BTFSC      STATUS+0, 0
	GOTO       L_Input_SW14
;APP.c,71 :: 		reset_all();
	CALL       _reset_all+0
;APP.c,72 :: 		luc_reset = 0;
	CLRF       _luc_reset+0
;APP.c,73 :: 		while(!RESET_SW);
L_Input_SW15:
	BTFSC      PORTC+0, 3
	GOTO       L_Input_SW16
	GOTO       L_Input_SW15
L_Input_SW16:
;APP.c,74 :: 		}
L_Input_SW14:
;APP.c,75 :: 		}
L_end_Input_SW:
	RETURN
; end of _Input_SW

_Uart_Send:

;APP.c,77 :: 		void Uart_Send()
;APP.c,79 :: 		char str[3] = {'0'};
	MOVLW      48
	MOVWF      Uart_Send_str_L0+0
	CLRF       Uart_Send_str_L0+1
	CLRF       Uart_Send_str_L0+2
;APP.c,81 :: 		ByteToStr(one_day,str);
	MOVF       _one_day+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Uart_Send_str_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(Uart_Send_str_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;APP.c,82 :: 		Soft_UART_Write(str[1]);
	MOVF       Uart_Send_str_L0+1, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,83 :: 		Soft_UART_Write(str[2]);
	MOVF       Uart_Send_str_L0+2, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,84 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,87 :: 		ByteToStr(one_hour,str);
	MOVF       _one_hour+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Uart_Send_str_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(Uart_Send_str_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;APP.c,88 :: 		Soft_UART_Write(str[1]);
	MOVF       Uart_Send_str_L0+1, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,89 :: 		Soft_UART_Write(str[2]);
	MOVF       Uart_Send_str_L0+2, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,90 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,93 :: 		ByteToStr(one_min,str);
	MOVF       _one_min+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Uart_Send_str_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(Uart_Send_str_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;APP.c,94 :: 		Soft_UART_Write(str[1]);
	MOVF       Uart_Send_str_L0+1, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,95 :: 		Soft_UART_Write(str[2]);
	MOVF       Uart_Send_str_L0+2, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,96 :: 		Soft_UART_Write(13);
	MOVLW      13
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,99 :: 		ByteToStr(Start_Time_hour,str);
	MOVF       _Start_Time_hour+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Uart_Send_str_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(Uart_Send_str_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;APP.c,100 :: 		Soft_UART_Write(str[1]);
	MOVF       Uart_Send_str_L0+1, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,101 :: 		Soft_UART_Write(str[2]);
	MOVF       Uart_Send_str_L0+2, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,102 :: 		Soft_UART_Write(':');
	MOVLW      58
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,105 :: 		ByteToStr(Stop_mins,str);
	MOVF       _Stop_mins+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Uart_Send_str_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(Uart_Send_str_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;APP.c,106 :: 		Soft_UART_Write(str[1]);
	MOVF       Uart_Send_str_L0+1, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,107 :: 		Soft_UART_Write(str[2]);
	MOVF       Uart_Send_str_L0+2, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,109 :: 		Soft_UART_Write(13);
	MOVLW      13
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,110 :: 		Soft_UART_Write(13);
	MOVLW      13
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP.c,112 :: 		}
L_end_Uart_Send:
	RETURN
; end of _Uart_Send

_Check_cond:

;APP.c,114 :: 		void Check_cond()
;APP.c,116 :: 		if(one_min_flag == 1)
	MOVF       _one_min_flag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Check_cond17
;APP.c,118 :: 		Uart_Send();
	CALL       _Uart_Send+0
;APP.c,119 :: 		one_min_flag = 0;
	CLRF       _one_min_flag+0
;APP.c,120 :: 		}
L_Check_cond17:
;APP.c,121 :: 		if(one_day_flag == 1)
	MOVF       _one_day_flag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Check_cond18
;APP.c,124 :: 		RELAY_SOL = 1;
	BSF        PORTC+0, 5
;APP.c,125 :: 		if(guc_min >= Stop_mins)
	MOVF       _Stop_mins+0, 0
	SUBWF      _guc_min+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Check_cond19
;APP.c,127 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP.c,128 :: 		one_day_flag = 0;
	CLRF       _one_day_flag+0
;APP.c,129 :: 		}
L_Check_cond19:
;APP.c,130 :: 		}
L_Check_cond18:
;APP.c,131 :: 		}
L_end_Check_cond:
	RETURN
; end of _Check_cond

_sys_init:

;APP.c,134 :: 		void sys_init()
;APP.c,136 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP.c,138 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP.c,139 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP.c,140 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP.c,141 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP.c,143 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP.c,144 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP.c,145 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP.c,146 :: 		TRISC = 0x0F;
	MOVLW      15
	MOVWF      TRISC+0
;APP.c,148 :: 		reset_all();
	CALL       _reset_all+0
;APP.c,150 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP.c,151 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP.c,153 :: 		Soft_UART_Init(&PORTA, 1, 0, 9600, 0); // Initialize Soft UART at 14400 bps
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
;APP.c,155 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP.c,160 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP.c,162 :: 		void main()
;APP.c,164 :: 		sys_init();
	CALL       _sys_init+0
;APP.c,165 :: 		Uart_Send();
	CALL       _Uart_Send+0
;APP.c,166 :: 		while(1)
L_main20:
;APP.c,168 :: 		Check_Cond();
	CALL       _Check_cond+0
;APP.c,169 :: 		Input_SW();
	CALL       _Input_SW+0
;APP.c,170 :: 		}
	GOTO       L_main20
;APP.c,171 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
