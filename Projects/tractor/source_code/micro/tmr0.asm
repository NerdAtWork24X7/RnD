
_TMR0_Initialize:

;tmr0.c,10 :: 		void TMR0_Initialize(void)
;tmr0.c,13 :: 		OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
	MOVLW      192
	ANDWF      OPTION_REG+0, 0
	MOVWF      R0
	MOVLW      23
	IORWF       R0, 0
	MOVWF      OPTION_REG+0
;tmr0.c,14 :: 		TMR0 = 0xF8;            /* TMR0 248;*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,15 :: 		timer0ReloadVal= 248;   /* Load the TMR value to reload variable */
	MOVLW      248
	MOVWF      _timer0ReloadVal+0
;tmr0.c,16 :: 		TMR0IF_bit = 0;         /*Clear Interrupt flag before enabling the interrupt*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,17 :: 		TMR0IE_bit = 1;         /* Enabling TMR0 interrupt */
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;tmr0.c,18 :: 		}
L_end_TMR0_Initialize:
	RETURN
; end of _TMR0_Initialize

_TMR0_Reload:

;tmr0.c,20 :: 		void TMR0_Reload(void)
;tmr0.c,22 :: 		TMR0 = timer0ReloadVal; /* Write to the Timer0 register*/
	MOVF       _timer0ReloadVal+0, 0
	MOVWF      TMR0+0
;tmr0.c,23 :: 		}
L_end_TMR0_Reload:
	RETURN
; end of _TMR0_Reload

_TMR0_ISR:

;tmr0.c,25 :: 		void TMR0_ISR(void)
;tmr0.c,27 :: 		TMR0_Reload();
	CALL       _TMR0_Reload+0
;tmr0.c,28 :: 		TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,29 :: 		asm CLRWDT ;
	CLRWDT
;tmr0.c,30 :: 		if(one_sec>1024)           /*Timer for 1 sec*/
	MOVF       _one_sec+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR9
	MOVF       _one_sec+0, 0
	SUBLW      0
L__TMR0_ISR9:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR0
;tmr0.c,32 :: 		one_sec=0;
	CLRF       _one_sec+0
	CLRF       _one_sec+1
;tmr0.c,33 :: 		guc_sec++;
	INCF       _guc_sec+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _guc_sec+0
;tmr0.c,34 :: 		}
L_TMR0_ISR0:
;tmr0.c,35 :: 		if(half_sec>512) /*Timer count for 0.5 sec*/
	MOVF       _half_sec+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR10
	MOVF       _half_sec+0, 0
	SUBLW      0
L__TMR0_ISR10:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR1
;tmr0.c,37 :: 		half_sec=0;
	CLRF       _half_sec+0
	CLRF       _half_sec+1
;tmr0.c,38 :: 		if(guc_buzz_state==1)
	MOVF       _guc_buzz_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR2
;tmr0.c,40 :: 		guc_togg_half ^= 1;
	MOVLW      1
	XORWF      _guc_togg_half+0, 1
;tmr0.c,41 :: 		TMR0_CallBack_Half_Sec();
	CALL       _TMR0_CallBack_Half_Sec+0
;tmr0.c,42 :: 		}
	GOTO       L_TMR0_ISR3
L_TMR0_ISR2:
;tmr0.c,46 :: 		CCP3CON = 0;  /*Diable PWM */
	CLRF       CCP3CON+0
;tmr0.c,50 :: 		}
L_TMR0_ISR3:
;tmr0.c,51 :: 		}
L_TMR0_ISR1:
;tmr0.c,52 :: 		one_sec++;half_sec++;
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
;tmr0.c,53 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR

_TMR0_CallBack_Half_Sec:

;tmr0.c,55 :: 		void TMR0_CallBack_Half_Sec(void)
;tmr0.c,57 :: 		if(guc_togg_half==1)
	MOVF       _guc_togg_half+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_CallBack_Half_Sec4
;tmr0.c,60 :: 		CCP3CON = (uint8)(0x0C | ((PWM3_INITIALIZE_DUTY_VALUE & 0x0003)<<4));  /*Enable PWM */
	MOVLW      28
	MOVWF      CCP3CON+0
;tmr0.c,64 :: 		}
L_TMR0_CallBack_Half_Sec4:
;tmr0.c,65 :: 		if(guc_togg_half==0)
	MOVF       _guc_togg_half+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_CallBack_Half_Sec5
;tmr0.c,68 :: 		CCP3CON = 0;  /*Diable PWM */
	CLRF       CCP3CON+0
;tmr0.c,72 :: 		}
L_TMR0_CallBack_Half_Sec5:
;tmr0.c,73 :: 		}
L_end_TMR0_CallBack_Half_Sec:
	RETURN
; end of _TMR0_CallBack_Half_Sec