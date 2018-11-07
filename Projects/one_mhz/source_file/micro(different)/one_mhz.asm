
_interrupt:

;one_mhz.c,14 :: 		void interrupt()
;one_mhz.c,16 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt27:
;one_mhz.c,18 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;one_mhz.c,19 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;one_mhz.c,22 :: 		}
L_interrupt3:
;one_mhz.c,23 :: 		}
L_end_interrupt:
L__interrupt29:
	RETFIE     %s
; end of _interrupt

_exe_cond:

;one_mhz.c,25 :: 		void exe_cond()
;one_mhz.c,27 :: 		RELAY = 1;
	BSF        PORTC+0, 4
;one_mhz.c,28 :: 		while(Set_Time<guc_min);
L_exe_cond4:
	MOVF       _guc_min+1, 0
	SUBWF      _Set_Time+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond31
	MOVF       _guc_min+0, 0
	SUBWF      _Set_Time+0, 0
L__exe_cond31:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond5
	GOTO       L_exe_cond4
L_exe_cond5:
;one_mhz.c,29 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;one_mhz.c,30 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_check_cond:

;one_mhz.c,33 :: 		void check_cond()
;one_mhz.c,35 :: 		if(!DEC)
	BTFSC      PORTC+0, 1
	GOTO       L_check_cond6
;one_mhz.c,37 :: 		Set_Time--;
	MOVLW      1
	SUBWF      _Set_Time+0, 0
	MOVWF      R0
	MOVLW      0
	SUBWFB     _Set_Time+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _Set_Time+0
	MOVF       R1, 0
	MOVWF      _Set_Time+1
;one_mhz.c,38 :: 		while(!DEC);
L_check_cond7:
	BTFSC      PORTC+0, 1
	GOTO       L_check_cond8
	GOTO       L_check_cond7
L_check_cond8:
;one_mhz.c,39 :: 		}
	GOTO       L_check_cond9
L_check_cond6:
;one_mhz.c,40 :: 		else if(!INC)
	BTFSC      PORTC+0, 0
	GOTO       L_check_cond10
;one_mhz.c,42 :: 		Set_Time++;
	MOVLW      1
	ADDWF      _Set_Time+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _Set_Time+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _Set_Time+0
	MOVF       R1, 0
	MOVWF      _Set_Time+1
;one_mhz.c,43 :: 		while(!INC);
L_check_cond11:
	BTFSC      PORTC+0, 0
	GOTO       L_check_cond12
	GOTO       L_check_cond11
L_check_cond12:
;one_mhz.c,44 :: 		}
	GOTO       L_check_cond13
L_check_cond10:
;one_mhz.c,45 :: 		else if(!START)
	BTFSC      PORTC+0, 2
	GOTO       L_check_cond14
;one_mhz.c,47 :: 		guc_min = 0;
	CLRF       _guc_min+0
	CLRF       _guc_min+1
;one_mhz.c,48 :: 		exe_cond();
	CALL       _exe_cond+0
;one_mhz.c,49 :: 		while(!START);
L_check_cond15:
	BTFSC      PORTC+0, 2
	GOTO       L_check_cond16
	GOTO       L_check_cond15
L_check_cond16:
;one_mhz.c,50 :: 		}
L_check_cond14:
L_check_cond13:
L_check_cond9:
;one_mhz.c,51 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_my_delay:

;one_mhz.c,85 :: 		void my_delay()
;one_mhz.c,87 :: 		for(i=0;i<1;i++)
	CLRF       _i+0
	CLRF       _i+1
L_my_delay17:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay34
	MOVLW      1
	SUBWF      _i+0, 0
L__my_delay34:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay18
;one_mhz.c,88 :: 		for(j=0;j<400;j++)
	CLRF       _j+0
	CLRF       _j+1
L_my_delay20:
	MOVLW      1
	SUBWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay35
	MOVLW      144
	SUBWF      _j+0, 0
L__my_delay35:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay21
;one_mhz.c,89 :: 		asm CLRWDT ;
	CLRWDT
;one_mhz.c,88 :: 		for(j=0;j<400;j++)
	MOVLW      1
	ADDWF      _j+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _j+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _j+0
	MOVF       R1, 0
	MOVWF      _j+1
;one_mhz.c,89 :: 		asm CLRWDT ;
	GOTO       L_my_delay20
L_my_delay21:
;one_mhz.c,87 :: 		for(i=0;i<1;i++)
	MOVLW      1
	ADDWF      _i+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _i+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _i+0
	MOVF       R1, 0
	MOVWF      _i+1
;one_mhz.c,89 :: 		asm CLRWDT ;
	GOTO       L_my_delay17
L_my_delay18:
;one_mhz.c,90 :: 		}
L_end_my_delay:
	RETURN
; end of _my_delay

_sys_init:

;one_mhz.c,93 :: 		void sys_init()
;one_mhz.c,96 :: 		OSCCON = 0x7A;   /* SCS INTOSC; SPLLEN disabled; IRCF 16MHz_HF; */
	MOVLW      122
	MOVWF      OSCCON+0
;one_mhz.c,97 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;one_mhz.c,98 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;one_mhz.c,99 :: 		TRISA=0x00;
	CLRF       TRISA+0
;one_mhz.c,100 :: 		TRISC=0x2F;
	MOVLW      47
	MOVWF      TRISC+0
;one_mhz.c,101 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;one_mhz.c,104 :: 		WDTCON = 0x16;   /*WDTPS 1:65536; SWDTEN OFF; */
	MOVLW      22
	MOVWF      WDTCON+0
;one_mhz.c,107 :: 		TMR2_Initialize();
	CALL       _TMR2_Initialize+0
;one_mhz.c,108 :: 		PWM3_Initialize();
	CALL       _PWM3_Initialize+0
;one_mhz.c,110 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;one_mhz.c,111 :: 		while(1);
L_sys_init23:
	GOTO       L_sys_init23
;one_mhz.c,112 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;one_mhz.c,114 :: 		void main()
;one_mhz.c,116 :: 		sys_init();
	CALL       _sys_init+0
;one_mhz.c,117 :: 		On_Time = DEFAULT_TME;
	MOVLW      10
	MOVWF      _On_Time+0
	MOVLW      0
	MOVWF      _On_Time+1
;one_mhz.c,118 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;one_mhz.c,119 :: 		while(1)
L_main25:
;one_mhz.c,121 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;one_mhz.c,126 :: 		}
	GOTO       L_main25
;one_mhz.c,127 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
