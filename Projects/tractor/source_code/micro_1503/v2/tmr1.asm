
_TMR1_Initialize:

;tmr1.c,6 :: 		void TMR1_Initialize(void)
;tmr1.c,8 :: 		T1CON = 0x84;
	MOVLW      132
	MOVWF      T1CON+0
;tmr1.c,9 :: 		T1GCON = 0x40;
	MOVLW      64
	MOVWF      T1GCON+0
;tmr1.c,10 :: 		TMR1H = 0x00;
	CLRF       TMR1H+0
;tmr1.c,11 :: 		TMR1L = 0x00;
	CLRF       TMR1L+0
;tmr1.c,12 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;tmr1.c,13 :: 		TMR1_StartTimer();
	CALL       _TMR1_StartTimer+0
;tmr1.c,14 :: 		}
L_end_TMR1_Initialize:
	RETURN
; end of _TMR1_Initialize

_TMR1_StartTimer:

;tmr1.c,16 :: 		void TMR1_StartTimer(void)
;tmr1.c,18 :: 		TMR1ON_bit = 1;
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;tmr1.c,19 :: 		}
L_end_TMR1_StartTimer:
	RETURN
; end of _TMR1_StartTimer

_TMR1_StopTimer:

;tmr1.c,21 :: 		void TMR1_StopTimer(void)
;tmr1.c,23 :: 		TMR1ON_bit = 0;
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;tmr1.c,24 :: 		}
L_end_TMR1_StopTimer:
	RETURN
; end of _TMR1_StopTimer

_TMR1_ReadTimer:

;tmr1.c,26 :: 		uint16 TMR1_ReadTimer(void)
;tmr1.c,32 :: 		readValLow = TMR1L;
	MOVF       TMR1L+0, 0
	MOVWF      R6+0
;tmr1.c,33 :: 		readValHigh = TMR1H;
	MOVF       TMR1H+0, 0
	MOVWF      R5+0
;tmr1.c,35 :: 		readVal = ((uint16)readValHigh << 8) | readValLow;
	MOVF       R5+0, 0
	MOVWF      R3
	CLRF       R4
	MOVF       R3, 0
	MOVWF      R1
	CLRF       R0
	MOVF       R6+0, 0
	IORWF       R0, 1
	MOVLW      0
	IORWF       R1, 1
;tmr1.c,37 :: 		return readVal;
;tmr1.c,38 :: 		}
L_end_TMR1_ReadTimer:
	RETURN
; end of _TMR1_ReadTimer

_TMR1_WriteTimer:

;tmr1.c,40 :: 		void TMR1_WriteTimer(uint16 timerVal)
;tmr1.c,42 :: 		while(TMR1ON_bit != 0){TMR1ON_bit = 0;}
L_TMR1_WriteTimer0:
	BTFSS      TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	GOTO       L_TMR1_WriteTimer1
	BCF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	GOTO       L_TMR1_WriteTimer0
L_TMR1_WriteTimer1:
;tmr1.c,43 :: 		TMR1H = (timerVal >> 8);
	MOVF       FARG_TMR1_WriteTimer_timerVal+1, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R0, 0
	MOVWF      TMR1H+0
;tmr1.c,44 :: 		TMR1L = timerVal;
	MOVF       FARG_TMR1_WriteTimer_timerVal+0, 0
	MOVWF      TMR1L+0
;tmr1.c,45 :: 		while(TMR1ON_bit != 1){TMR1ON_bit = 1;}
L_TMR1_WriteTimer2:
	BTFSC      TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	GOTO       L_TMR1_WriteTimer3
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
	GOTO       L_TMR1_WriteTimer2
L_TMR1_WriteTimer3:
;tmr1.c,46 :: 		}
L_end_TMR1_WriteTimer:
	RETURN
; end of _TMR1_WriteTimer

_Check_Engine:

;tmr1.c,48 :: 		void Check_Engine()
;tmr1.c,51 :: 		count = TMR1_ReadTimer();
	CALL       _TMR1_ReadTimer+0
;tmr1.c,52 :: 		if(count > 100) Eng_On = 1;
	MOVF       R1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Engine12
	MOVF       R0, 0
	SUBLW      100
L__Check_Engine12:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Engine4
	MOVLW      1
	MOVWF      _Eng_On+0
	GOTO       L_Check_Engine5
L_Check_Engine4:
;tmr1.c,53 :: 		else Eng_On = 0;
	CLRF       _Eng_On+0
L_Check_Engine5:
;tmr1.c,55 :: 		}
L_end_Check_Engine:
	RETURN
; end of _Check_Engine
