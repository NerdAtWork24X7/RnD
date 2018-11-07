
_Load_TMR2:

;tmr2.c,4 :: 		void Load_TMR2(uint8 Prescalar,uint8 T2Control ,uint8 Timer2)
;tmr2.c,6 :: 		TMR2ON_bit =0;                  /*Stop the timer*/
	BCF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;tmr2.c,7 :: 		PR2 = Prescalar;                /* PR2 ;*/
	MOVF       FARG_Load_TMR2_Prescalar+0, 0
	MOVWF      PR2+0
;tmr2.c,8 :: 		TMR2 = Timer2;                  /* TMR2 0; */
	MOVF       FARG_Load_TMR2_Timer2+0, 0
	MOVWF      TMR2+0
;tmr2.c,9 :: 		T2CON = T2Control;              /* T2CKPS  T2OUTPS  TMR2ON on*/
	MOVF       FARG_Load_TMR2_T2Control+0, 0
	MOVWF      T2CON+0
;tmr2.c,10 :: 		TMR2IF_bit = 0;                 /* Clearing IF flag. */
	BCF        TMR2IF_bit+0, BitPos(TMR2IF_bit+0)
;tmr2.c,11 :: 		TMR2ON_bit = 1;                 /* Start the Timer by writing to TMRxON bit*/
	BSF        TMR2ON_bit+0, BitPos(TMR2ON_bit+0)
;tmr2.c,12 :: 		}
L_end_Load_TMR2:
	RETURN
; end of _Load_TMR2
