
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
;tmr0.c,21 :: 		one_sec++;
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
;tmr0.c,22 :: 		if(one_sec>1047)           /*Timer for 1 sec*/
	MOVF       _one_sec+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR4
	MOVF       _one_sec+0, 0
	SUBLW      23
L__TMR0_ISR4:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR0
;tmr0.c,24 :: 		one_sec=0;
	CLRF       _one_sec+0
	CLRF       _one_sec+1
;tmr0.c,25 :: 		one_min++;
	INCF       _one_min+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _one_min+0
;tmr0.c,26 :: 		if(one_min > 60)
	MOVF       _one_min+0, 0
	SUBLW      60
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR1
;tmr0.c,28 :: 		one_min=1;
	MOVLW      1
	MOVWF      _one_min+0
;tmr0.c,29 :: 		}
L_TMR0_ISR1:
;tmr0.c,31 :: 		}
L_TMR0_ISR0:
;tmr0.c,32 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR
