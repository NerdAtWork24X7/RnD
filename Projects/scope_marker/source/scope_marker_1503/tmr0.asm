
_TMR0_Initialize:

;tmr0.c,12 :: 		void TMR0_Initialize(void)
;tmr0.c,15 :: 		OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
	MOVLW      192
	ANDWF      OPTION_REG+0, 0
	MOVWF      R0
	MOVLW      23
	IORWF       R0, 0
	MOVWF      OPTION_REG+0
;tmr0.c,16 :: 		TMR0 = 0xF8;              /* TMR0 248;*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,17 :: 		timer0ReloadVal= 0xF8;     /* Load the TMR value to reload variable */
	MOVLW      248
	MOVWF      _timer0ReloadVal+0
;tmr0.c,18 :: 		TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,19 :: 		TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;tmr0.c,20 :: 		}
L_end_TMR0_Initialize:
	RETURN
; end of _TMR0_Initialize

_TMR0_Reload:

;tmr0.c,22 :: 		void TMR0_Reload(void)
;tmr0.c,24 :: 		TMR0 = timer0ReloadVal;     /* Write to the Timer0 register*/
	MOVF       _timer0ReloadVal+0, 0
	MOVWF      TMR0+0
;tmr0.c,25 :: 		}
L_end_TMR0_Reload:
	RETURN
; end of _TMR0_Reload

_TMR0_ISR:

;tmr0.c,27 :: 		void TMR0_ISR(void)
;tmr0.c,30 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR

_TMR0_CallBack_Half_Sec:

;tmr0.c,32 :: 		void TMR0_CallBack_Half_Sec(void)
;tmr0.c,35 :: 		}
L_end_TMR0_CallBack_Half_Sec:
	RETURN
; end of _TMR0_CallBack_Half_Sec
