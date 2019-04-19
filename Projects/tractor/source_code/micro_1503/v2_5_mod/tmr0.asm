
_TMR0_Initialize:

;tmr0.c,7 :: 		void TMR0_Initialize(void)
;tmr0.c,10 :: 		OPTION_REG = 0x17;
	MOVLW      23
	MOVWF      OPTION_REG+0
;tmr0.c,11 :: 		TMR0 = TMR0_RELOAD_VALUE;              /* TMR0 248;*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,12 :: 		TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,13 :: 		TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;tmr0.c,14 :: 		}
L_end_TMR0_Initialize:
	RETURN
; end of _TMR0_Initialize

_TMR0_ISR:

;tmr0.c,16 :: 		void TMR0_ISR(void)
;tmr0.c,18 :: 		TMR0 = TMR0_RELOAD_VALUE;     /* Write to the Timer0 register*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,19 :: 		TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,21 :: 		if(one_sec>1048)           /*Timer for 1 sec*/
	MOVF       _one_sec+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR10
	MOVF       _one_sec+0, 0
	SUBLW      24
L__TMR0_ISR10:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR0
;tmr0.c,23 :: 		one_sec=0;
	CLRF       _one_sec+0
	CLRF       _one_sec+1
;tmr0.c,24 :: 		guc_sec++;
	MOVLW      1
	ADDWF      _guc_sec+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _guc_sec+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _guc_sec+0
	MOVF       R1, 0
	MOVWF      _guc_sec+1
;tmr0.c,25 :: 		eng_time++;
	INCF       _eng_time+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _eng_time+0
;tmr0.c,26 :: 		buz_time++;
	INCF       _buz_time+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _buz_time+0
;tmr0.c,27 :: 		UART_Time++;
	INCF       _UART_Time+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _UART_Time+0
;tmr0.c,30 :: 		if(eng_sol)
	MOVF       _eng_sol+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_TMR0_ISR1
;tmr0.c,32 :: 		if(eng_time > 5){ RELAY_SOL = 1; eng_sol = 0;}
	MOVF       _eng_time+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR2
	BSF        PORTC+0, 5
	CLRF       _eng_sol+0
L_TMR0_ISR2:
;tmr0.c,33 :: 		}
L_TMR0_ISR1:
;tmr0.c,35 :: 		if(guc_buzz_state==1)
	MOVF       _guc_buzz_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR3
;tmr0.c,37 :: 		if(buz_time > 5)
	MOVF       _buz_time+0, 0
	SUBLW      5
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR4
;tmr0.c,39 :: 		guc_togg_half ^= 1;
	MOVLW      1
	XORWF      _guc_togg_half+0, 1
;tmr0.c,40 :: 		(guc_togg_half==1)?(BUZZER=1):(BUZZER=0);
	MOVF       _guc_togg_half+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR5
	BSF        PORTC+0, 4
	GOTO       L_TMR0_ISR6
L_TMR0_ISR5:
	BCF        PORTC+0, 4
L_TMR0_ISR6:
;tmr0.c,41 :: 		}
L_TMR0_ISR4:
;tmr0.c,42 :: 		}
	GOTO       L_TMR0_ISR7
L_TMR0_ISR3:
;tmr0.c,45 :: 		BUZZER = 0;
	BCF        PORTC+0, 4
;tmr0.c,46 :: 		}
L_TMR0_ISR7:
;tmr0.c,47 :: 		}
L_TMR0_ISR0:
;tmr0.c,48 :: 		one_sec++;
	MOVLW      1
	ADDWF      _one_sec+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _one_sec+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _one_sec+0
	MOVF       R1, 0
	MOVWF      _one_sec+1
;tmr0.c,49 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR
