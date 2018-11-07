
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
;tmr0.c,29 :: 		TMR0_Reload();
	CALL       _TMR0_Reload+0
;tmr0.c,30 :: 		TMR0IF_bit = 0;     /*Clear the TMR0 interrupt flag8*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,31 :: 		asm CLRWDT ;
	CLRWDT
;tmr0.c,32 :: 		if(one_sec>1048)           /*Timer for 1 sec*/
	MOVF       _one_sec+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR18
	MOVF       _one_sec+0, 0
	SUBLW      24
L__TMR0_ISR18:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR0
;tmr0.c,34 :: 		Check_Engine();
	CALL       _Check_Engine+0
;tmr0.c,35 :: 		one_sec=0;
	CLRF       _one_sec+0
	CLRF       _one_sec+1
;tmr0.c,36 :: 		guc_sec++;
	INCF       _guc_sec+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _guc_sec+0
;tmr0.c,38 :: 		guc_min++;
	MOVLW      1
	ADDWF      _guc_min+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _guc_min+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _guc_min+0
	MOVF       R1, 0
	MOVWF      _guc_min+1
;tmr0.c,39 :: 		if(guc_min>60)
	MOVF       _guc_min+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR19
	MOVF       _guc_min+0, 0
	SUBLW      60
L__TMR0_ISR19:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR1
;tmr0.c,41 :: 		guc_min=0;
	CLRF       _guc_min+0
	CLRF       _guc_min+1
;tmr0.c,42 :: 		demo_time++;
	MOVLW      1
	ADDWF      _demo_time+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _demo_time+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _demo_time+0
	MOVF       R1, 0
	MOVWF      _demo_time+1
;tmr0.c,43 :: 		}
L_TMR0_ISR1:
;tmr0.c,45 :: 		TMR1_WriteTimer(0x0000);
	CLRF       FARG_TMR1_WriteTimer_timerVal+0
	CLRF       FARG_TMR1_WriteTimer_timerVal+1
	CALL       _TMR1_WriteTimer+0
;tmr0.c,46 :: 		}
L_TMR0_ISR0:
;tmr0.c,48 :: 		if(half_sec>512) /*Timer count for 0.5 sec*/
	MOVF       _half_sec+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR20
	MOVF       _half_sec+0, 0
	SUBLW      0
L__TMR0_ISR20:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR2
;tmr0.c,50 :: 		half_sec=0;
	CLRF       _half_sec+0
	CLRF       _half_sec+1
;tmr0.c,51 :: 		if(guc_buzz_state==1)
	MOVF       _guc_buzz_state+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_ISR3
;tmr0.c,53 :: 		guc_togg_half ^= 1;
	MOVLW      1
	XORWF      _guc_togg_half+0, 1
;tmr0.c,54 :: 		TMR0_CallBack_Half_Sec();
	CALL       _TMR0_CallBack_Half_Sec+0
;tmr0.c,55 :: 		}
	GOTO       L_TMR0_ISR4
L_TMR0_ISR3:
;tmr0.c,59 :: 		GIE_bit = 0;              /* Disable INTs  */
	BCF        GIE_bit+0, BitPos(GIE_bit+0)
;tmr0.c,60 :: 		while(BUZZER == 1);
L_TMR0_ISR5:
	BTFSS      PORTA+0, 2
	GOTO       L_TMR0_ISR6
	GOTO       L_TMR0_ISR5
L_TMR0_ISR6:
;tmr0.c,61 :: 		PWM3CON = PWM_OFF;        /*Diable PWM */
	CLRF       PWM3CON+0
;tmr0.c,62 :: 		while(BUZZER == 1)
L_TMR0_ISR7:
	BTFSS      PORTA+0, 2
	GOTO       L_TMR0_ISR8
;tmr0.c,63 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
	GOTO       L_TMR0_ISR7
L_TMR0_ISR8:
;tmr0.c,64 :: 		GIE_bit = 1;              /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;tmr0.c,68 :: 		}
L_TMR0_ISR4:
;tmr0.c,69 :: 		}
L_TMR0_ISR2:
;tmr0.c,70 :: 		one_sec++;half_sec++;
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
;tmr0.c,71 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR

_TMR0_CallBack_Half_Sec:

;tmr0.c,73 :: 		void TMR0_CallBack_Half_Sec(void)
;tmr0.c,76 :: 		if(guc_togg_half==1)
	MOVF       _guc_togg_half+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_CallBack_Half_Sec9
;tmr0.c,79 :: 		PWM3CON = PWM_ON;  /*Enable PWM */
	MOVLW      208
	MOVWF      PWM3CON+0
;tmr0.c,83 :: 		}
L_TMR0_CallBack_Half_Sec9:
;tmr0.c,85 :: 		if(guc_togg_half==0)
	MOVF       _guc_togg_half+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_TMR0_CallBack_Half_Sec10
;tmr0.c,88 :: 		GIE_bit = 0;               /* Disable INTs  */
	BCF        GIE_bit+0, BitPos(GIE_bit+0)
;tmr0.c,89 :: 		while(BUZZER == 1);
L_TMR0_CallBack_Half_Sec11:
	BTFSS      PORTA+0, 2
	GOTO       L_TMR0_CallBack_Half_Sec12
	GOTO       L_TMR0_CallBack_Half_Sec11
L_TMR0_CallBack_Half_Sec12:
;tmr0.c,90 :: 		PWM3CON = PWM_OFF;        /*Diable PWM */
	CLRF       PWM3CON+0
;tmr0.c,91 :: 		while(BUZZER == 1)
L_TMR0_CallBack_Half_Sec13:
	BTFSS      PORTA+0, 2
	GOTO       L_TMR0_CallBack_Half_Sec14
;tmr0.c,92 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
	GOTO       L_TMR0_CallBack_Half_Sec13
L_TMR0_CallBack_Half_Sec14:
;tmr0.c,93 :: 		GIE_bit = 1;              /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;tmr0.c,97 :: 		}
L_TMR0_CallBack_Half_Sec10:
;tmr0.c,98 :: 		}
L_end_TMR0_CallBack_Half_Sec:
	RETURN
; end of _TMR0_CallBack_Half_Sec
