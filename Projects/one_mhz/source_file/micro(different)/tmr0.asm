
_TMR0_Initialize:

;tmr0.c,11 :: 		void TMR0_Initialize(void)
;tmr0.c,14 :: 		OPTION_REG = (uint8)((OPTION_REG & 0xC0) | 0xD7 & 0x3F);
	MOVLW      192
	ANDWF      OPTION_REG+0, 0
	MOVWF      R0
	MOVLW      23
	IORWF       R0, 0
	MOVWF      OPTION_REG+0
;tmr0.c,15 :: 		TMR0 = 0xF8;              /* TMR0 248;*/
	MOVLW      248
	MOVWF      TMR0+0
;tmr0.c,16 :: 		timer0ReloadVal= 248;     /* Load the TMR value to reload variable */
	MOVLW      248
	MOVWF      _timer0ReloadVal+0
;tmr0.c,17 :: 		TMR0IF_bit = 0;           /*Clear Interrupt flag before enabling the interrupt*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,18 :: 		TMR0IE_bit = 1;           /* Enabling TMR0 interrupt */
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;tmr0.c,19 :: 		}
L_end_TMR0_Initialize:
	RETURN
; end of _TMR0_Initialize

_TMR0_Reload:

;tmr0.c,21 :: 		void TMR0_Reload(void)
;tmr0.c,23 :: 		TMR0 = timer0ReloadVal;     /* Write to the Timer0 register*/
	MOVF       _timer0ReloadVal+0, 0
	MOVWF      TMR0+0
;tmr0.c,24 :: 		}
L_end_TMR0_Reload:
	RETURN
; end of _TMR0_Reload

_TMR0_ISR:

;tmr0.c,26 :: 		void TMR0_ISR(void)
;tmr0.c,28 :: 		TMR0_Reload();
	CALL       _TMR0_Reload+0
;tmr0.c,29 :: 		asm CLRWDT ;
	CLRWDT
;tmr0.c,30 :: 		if(one_sec>1024)           /*Timer for 1 sec*/
	MOVF       _one_sec+1, 0
	SUBLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR5
	MOVF       _one_sec+0, 0
	SUBLW      0
L__TMR0_ISR5:
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
;tmr0.c,34 :: 		one_min++;
	MOVLW      1
	ADDWF      _one_min+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _one_min+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _one_min+0
	MOVF       R1, 0
	MOVWF      _one_min+1
;tmr0.c,35 :: 		TMR0_CallBack_one_Sec();
	CALL       _TMR0_CallBack_One_Sec+0
;tmr0.c,36 :: 		if(one_min>60)
	MOVF       _one_min+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__TMR0_ISR6
	MOVF       _one_min+0, 0
	SUBLW      60
L__TMR0_ISR6:
	BTFSC      STATUS+0, 0
	GOTO       L_TMR0_ISR1
;tmr0.c,38 :: 		one_min = 0;
	CLRF       _one_min+0
	CLRF       _one_min+1
;tmr0.c,39 :: 		guc_min++;
	INCF       _guc_min+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _guc_min+0
;tmr0.c,40 :: 		TMR0_CallBack_one_Min();
	CALL       _TMR0_CallBack_one_Min+0
;tmr0.c,44 :: 		}
L_TMR0_ISR1:
;tmr0.c,45 :: 		}
L_TMR0_ISR0:
;tmr0.c,46 :: 		one_sec++;
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
;tmr0.c,47 :: 		TMR0IF_bit = 0;            /*Clear the TMR0 interrupt flag8*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,48 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR

_TMR0_CallBack_one_Min:

;tmr0.c,50 :: 		void TMR0_CallBack_one_Min(void)
;tmr0.c,53 :: 		}
L_end_TMR0_CallBack_one_Min:
	RETURN
; end of _TMR0_CallBack_one_Min

_TMR0_CallBack_one_Sec:

;tmr0.c,55 :: 		void TMR0_CallBack_one_Sec(void)
;tmr0.c,58 :: 		}
L_end_TMR0_CallBack_one_Sec:
	RETURN
; end of _TMR0_CallBack_one_Sec
