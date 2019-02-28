
_TMR0_Initialize:

;tmr0.c,6 :: 		void TMR0_Initialize(void)
;tmr0.c,9 :: 		OPTION_REG = 0x17;
	MOVLW      23
	MOVWF      OPTION_REG+0
;tmr0.c,10 :: 		TMR0 = TMR0_RELOAD_VALUE;              /* TMR0 248;*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,11 :: 		TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,12 :: 		TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;tmr0.c,13 :: 		}
L_end_TMR0_Initialize:
	RETURN
; end of _TMR0_Initialize

_TMR0_ISR:

;tmr0.c,15 :: 		void TMR0_ISR(void)
;tmr0.c,17 :: 		TMR0 = TMR0_RELOAD_VALUE;     /* Write to the Timer0 register*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,18 :: 		TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,19 :: 		if(one_sec>1048)           /*Timer for 1 sec*/
	MOVF       _one_sec+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR7
	MOVF       _one_sec+0, 0
	SUBLW      24
L__TMR0_ISR7:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR0
;tmr0.c,21 :: 		one_sec=0;
	CLRF       _one_sec+0
	CLRF       _one_sec+1
;tmr0.c,22 :: 		guc_sec++;
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
;tmr0.c,23 :: 		if(guc_buzz_state==1)
	MOVF       _guc_buzz_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR1
;tmr0.c,25 :: 		guc_togg_half ^= 1;
	MOVLW      1
	XORWF      _guc_togg_half+0, 1
;tmr0.c,26 :: 		(guc_togg_half==1)?(BUZZER=1):(BUZZER=0);
	MOVF       _guc_togg_half+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR2
	BSF        PORTA+0, 2
	GOTO       L_TMR0_ISR3
L_TMR0_ISR2:
	BCF        PORTA+0, 2
L_TMR0_ISR3:
;tmr0.c,27 :: 		}
	GOTO       L_TMR0_ISR4
L_TMR0_ISR1:
;tmr0.c,30 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;tmr0.c,31 :: 		}
L_TMR0_ISR4:
;tmr0.c,32 :: 		}
L_TMR0_ISR0:
;tmr0.c,33 :: 		one_sec++;
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
;tmr0.c,34 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR
