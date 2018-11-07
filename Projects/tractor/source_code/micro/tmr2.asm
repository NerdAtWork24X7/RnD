
_TMR2_Initialize:

;tmr2.c,4 :: 		void TMR2_Initialize(void)
;tmr2.c,6 :: 		T2CON = 0x01;      /* T2CKPS 1:16; T2OUTPS 1:1; TMR2ON off*/
	MOVLW      1
	MOVWF      T2CON+0
;tmr2.c,7 :: 		PR2 = 0xA6;        /* PR2 29;*/
	MOVLW      166
	MOVWF      PR2+0
;tmr2.c,8 :: 		TMR2 = 0x00;       /* TMR2 0; */
	CLRF       TMR2+0
;tmr2.c,9 :: 		TMR2IF_bit = 0;    /* Clearing IF flag. */
	BCF        TMR2IF_bit+0, BitPos(TMR2IF_bit+0)
;tmr2.c,10 :: 		TMR2_StartTimer(); /*Start TMR2 */
	CALL       _TMR2_StartTimer+0
;tmr2.c,11 :: 		}
L_end_TMR2_Initialize:
	RETURN
; end of _TMR2_Initialize

_TMR2_StartTimer:

;tmr2.c,13 :: 		void TMR2_StartTimer(void)
;tmr2.c,15 :: 		TMR2ON_bit = 1;   /* Start the Timer by writing to TMRxON bit*/
	BSF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;tmr2.c,16 :: 		}
L_end_TMR2_StartTimer:
	RETURN
; end of _TMR2_StartTimer
