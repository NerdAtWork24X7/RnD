
_TMR0_Initialize:

;tmr0.c,6 :: 		void TMR0_Initialize(void)
;tmr0.c,8 :: 		OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
	MOVLW      192
	ANDWF      OPTION_REG+0, 0
	MOVWF      R0
	MOVLW      23
	IORWF       R0, 0
	MOVWF      OPTION_REG+0
;tmr0.c,9 :: 		TMR0 = TMR0_RELOAD_VALUE;              /* TMR0 248;*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,10 :: 		TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,11 :: 		TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;tmr0.c,12 :: 		}
L_end_TMR0_Initialize:
	RETURN
; end of _TMR0_Initialize

_TMR0_ISR:

;tmr0.c,14 :: 		void TMR0_ISR(void)
;tmr0.c,16 :: 		TMR0 = TMR0_RELOAD_VALUE;     /* Write to the Timer0 register*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,17 :: 		TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,18 :: 		if(one_sec>1048)           /*Timer for 1 sec*/
	MOVF       _one_sec+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR7
	MOVF       _one_sec+0, 0
	SUBLW      24
L__TMR0_ISR7:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR0
;tmr0.c,20 :: 		one_sec=0;
	CLRF       _one_sec+0
	CLRF       _one_sec+1
;tmr0.c,21 :: 		guc_sec++;
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
;tmr0.c,22 :: 		if(guc_buzz_state==1)
	MOVF       _guc_buzz_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR1
;tmr0.c,24 :: 		guc_togg_half ^= 1;
	MOVLW      1
	XORWF      _guc_togg_half+0, 1
;tmr0.c,25 :: 		(guc_togg_half==1)?(BUZZER=1):(BUZZER=0);
	MOVF       _guc_togg_half+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR2
	BSF        PORTA+0, 2
	GOTO       L_TMR0_ISR3
L_TMR0_ISR2:
	BCF        PORTA+0, 2
L_TMR0_ISR3:
;tmr0.c,26 :: 		}
	GOTO       L_TMR0_ISR4
L_TMR0_ISR1:
;tmr0.c,29 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;tmr0.c,30 :: 		}
L_TMR0_ISR4:
;tmr0.c,31 :: 		}
L_TMR0_ISR0:
;tmr0.c,32 :: 		one_sec++;
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
;tmr0.c,33 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR
