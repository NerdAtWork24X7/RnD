
_TMR0_Initialize:

;tmr0.c,9 :: 		void TMR0_Initialize(void)
;tmr0.c,12 :: 		OPTION_REG = 0x17;
	MOVLW      23
	MOVWF      OPTION_REG+0
;tmr0.c,13 :: 		TMR0 = TMR0_RELOAD_VALUE;              /* TMR0 248;*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,14 :: 		TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,15 :: 		TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;tmr0.c,16 :: 		}
L_end_TMR0_Initialize:
	RETURN
; end of _TMR0_Initialize

_TMR0_ISR:

;tmr0.c,18 :: 		void TMR0_ISR(void)
;tmr0.c,20 :: 		TMR0 = TMR0_RELOAD_VALUE;     /* Write to the Timer0 register*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,21 :: 		TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,23 :: 		one_sec++;
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
;tmr0.c,24 :: 		if(one_sec>1047)           /*Timer for 1 sec*/
	MOVF       _one_sec+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR10
	MOVF       _one_sec+0, 0
	SUBLW      23
L__TMR0_ISR10:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR0
;tmr0.c,26 :: 		one_sec=0;
	CLRF       _one_sec+0
	CLRF       _one_sec+1
;tmr0.c,27 :: 		(one_min % 5 == 0)? (one_min_flag = 1) : (one_min_flag = 0);
	MOVLW      5
	MOVWF      R4
	MOVF       _one_min+0, 0
	MOVWF      R0
	CALL       _Div_8X8_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR1
	MOVLW      1
	MOVWF      _one_min_flag+0
	MOVF       _one_min_flag+0, 0
	MOVWF      ?FLOC___TMR0_ISRT4+0
	GOTO       L_TMR0_ISR2
L_TMR0_ISR1:
	CLRF       _one_min_flag+0
	MOVF       _one_min_flag+0, 0
	MOVWF      ?FLOC___TMR0_ISRT4+0
L_TMR0_ISR2:
;tmr0.c,28 :: 		one_min++;
	INCF       _one_min+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _one_min+0
;tmr0.c,29 :: 		if(one_min > 59)
	MOVF       _one_min+0, 0
	SUBLW      59
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR3
;tmr0.c,31 :: 		one_min=0;
	CLRF       _one_min+0
;tmr0.c,32 :: 		guc_min++;
	INCF       _guc_min+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _guc_min+0
;tmr0.c,33 :: 		one_hour++;
	INCF       _one_hour+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _one_hour+0
;tmr0.c,34 :: 		if(one_hour > 59)
	MOVF       _one_hour+0, 0
	SUBLW      59
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR4
;tmr0.c,36 :: 		one_hour=0;
	CLRF       _one_hour+0
;tmr0.c,37 :: 		guc_min = 0;
	CLRF       _guc_min+0
;tmr0.c,38 :: 		(one_day % Start_Time_hour == 0)? (one_day_flag = 1) : (one_day_flag = 0);
	MOVF       _Start_Time_hour+0, 0
	MOVWF      R4
	MOVF       _one_day+0, 0
	MOVWF      R0
	CALL       _Div_8X8_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR5
	MOVLW      1
	MOVWF      _one_day_flag+0
	MOVF       _one_day_flag+0, 0
	MOVWF      ?FLOC___TMR0_ISRT12+0
	GOTO       L_TMR0_ISR6
L_TMR0_ISR5:
	CLRF       _one_day_flag+0
	MOVF       _one_day_flag+0, 0
	MOVWF      ?FLOC___TMR0_ISRT12+0
L_TMR0_ISR6:
;tmr0.c,39 :: 		one_day++;
	INCF       _one_day+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _one_day+0
;tmr0.c,40 :: 		if(one_day > 23)
	MOVF       _one_day+0, 0
	SUBLW      23
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR7
;tmr0.c,42 :: 		one_day = 0;
	CLRF       _one_day+0
;tmr0.c,43 :: 		}
L_TMR0_ISR7:
;tmr0.c,44 :: 		}
L_TMR0_ISR4:
;tmr0.c,46 :: 		}
L_TMR0_ISR3:
;tmr0.c,47 :: 		}
L_TMR0_ISR0:
;tmr0.c,48 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR
