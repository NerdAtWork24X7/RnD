
_TMR0_Initialize:

;tmr0.c,7 :: 		void TMR0_Initialize(void)
;tmr0.c,10 :: 		OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
	MOVLW      192
	ANDWF      OPTION_REG+0, 0
	MOVWF      R0
	MOVLW      23
	IORWF       R0, 0
	MOVWF      OPTION_REG+0
;tmr0.c,11 :: 		TMR0 = 0xF8;              /* TMR0 248;*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,12 :: 		timer0ReloadVal= 0xF8;     /* Load the TMR value to reload variable */
	MOVLW      248
	MOVWF      _timer0ReloadVal+0
;tmr0.c,13 :: 		TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,14 :: 		TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;tmr0.c,15 :: 		}
L_end_TMR0_Initialize:
	RETURN
; end of _TMR0_Initialize

_TMR0_Reload:

;tmr0.c,17 :: 		void TMR0_Reload(void)
;tmr0.c,19 :: 		TMR0 = timer0ReloadVal;     /* Write to the Timer0 register*/
	MOVF       _timer0ReloadVal+0, 0
	MOVWF      TMR0+0
;tmr0.c,20 :: 		}
L_end_TMR0_Reload:
	RETURN
; end of _TMR0_Reload

_TMR0_ISR:

;tmr0.c,22 :: 		void TMR0_ISR(void)
;tmr0.c,25 :: 		TMR0_Reload();
	CALL       _TMR0_Reload+0
;tmr0.c,26 :: 		TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,27 :: 		asm CLRWDT ;
	CLRWDT
;tmr0.c,28 :: 		if(one_sec>1048)           /*Timer for 1 sec*/
	MOVF       _one_sec+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR9
	MOVF       _one_sec+0, 0
	SUBLW      24
L__TMR0_ISR9:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR0
;tmr0.c,30 :: 		one_sec=0;
	CLRF       _one_sec+0
	CLRF       _one_sec+1
;tmr0.c,31 :: 		guc_sec++;
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
;tmr0.c,49 :: 		}
L_TMR0_ISR0:
;tmr0.c,51 :: 		if(half_sec>512) /*Timer count for 0.5 sec*/
	MOVF       _half_sec+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR10
	MOVF       _half_sec+0, 0
	SUBLW      0
L__TMR0_ISR10:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR1
;tmr0.c,53 :: 		half_sec=0;
	CLRF       _half_sec+0
	CLRF       _half_sec+1
;tmr0.c,54 :: 		if(guc_buzz_state==1)
	MOVF       _guc_buzz_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR2
;tmr0.c,56 :: 		guc_togg_half ^= 1;
	MOVLW      1
	XORWF      _guc_togg_half+0, 1
;tmr0.c,57 :: 		TMR0_CallBack_Half_Sec();
	CALL       _TMR0_CallBack_Half_Sec+0
;tmr0.c,58 :: 		}
	GOTO       L_TMR0_ISR3
L_TMR0_ISR2:
;tmr0.c,69 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;tmr0.c,71 :: 		}
L_TMR0_ISR3:
;tmr0.c,72 :: 		}
L_TMR0_ISR1:
;tmr0.c,73 :: 		one_sec++;half_sec++;
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
	MOVLW      1
	ADDWF      _half_sec+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _half_sec+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _half_sec+0
	MOVF       R1, 0
	MOVWF      _half_sec+1
;tmr0.c,74 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR

_TMR0_CallBack_Half_Sec:

;tmr0.c,76 :: 		void TMR0_CallBack_Half_Sec(void)
;tmr0.c,79 :: 		if(guc_togg_half==1)
	MOVF       _guc_togg_half+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_CallBack_Half_Sec4
;tmr0.c,84 :: 		BUZZER=1;
	BSF        PORTA+0, 2
;tmr0.c,86 :: 		}
L_TMR0_CallBack_Half_Sec4:
;tmr0.c,88 :: 		if(guc_togg_half==0)
	MOVF       _guc_togg_half+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_CallBack_Half_Sec5
;tmr0.c,98 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;tmr0.c,100 :: 		}
L_TMR0_CallBack_Half_Sec5:
;tmr0.c,101 :: 		}
L_end_TMR0_CallBack_Half_Sec:
	RETURN
; end of _TMR0_CallBack_Half_Sec
