
_Check_Engine:

;tmr1.c,48 :: 		void Check_Engine()
;tmr1.c,50 :: 		uint16 cnt,eng_pul=0;
	MOVLW      0
	MOVWF      Check_Engine_eng_pul_L0+0
	MOVLW      0
	MOVWF      Check_Engine_eng_pul_L0+1
;tmr1.c,54 :: 		Eng_On = 0;
	CLRF       _Eng_On+0
;tmr1.c,55 :: 		for (cnt = 10 ; cnt > 0; cnt--)
	MOVLW      10
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_Check_Engine0:
	MOVF       R1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Engine6
	MOVF       R1+0, 0
	SUBLW      0
L__Check_Engine6:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Engine1
;tmr1.c,57 :: 		if(ENGINE_SENSE == 0)
	BTFSC      PORTC+0, 0
	GOTO       L_Check_Engine3
;tmr1.c,59 :: 		eng_pul ++;
	INCF       Check_Engine_eng_pul_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       Check_Engine_eng_pul_L0+1, 1
;tmr1.c,60 :: 		}
L_Check_Engine3:
;tmr1.c,61 :: 		if(eng_pul > 5)
	MOVF       Check_Engine_eng_pul_L0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Engine7
	MOVF       Check_Engine_eng_pul_L0+0, 0
	SUBLW      5
L__Check_Engine7:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Engine4
;tmr1.c,63 :: 		Eng_On = 1;
	MOVLW      1
	MOVWF      _Eng_On+0
;tmr1.c,64 :: 		break;
	GOTO       L_Check_Engine1
;tmr1.c,65 :: 		}
L_Check_Engine4:
;tmr1.c,66 :: 		asm CLRWDT ;
	CLRWDT
;tmr1.c,55 :: 		for (cnt = 10 ; cnt > 0; cnt--)
	MOVLW      1
	SUBWF      R1+0, 1
	MOVLW      0
	SUBWFB     R1+1, 1
;tmr1.c,67 :: 		}
	GOTO       L_Check_Engine0
L_Check_Engine1:
;tmr1.c,69 :: 		}
L_end_Check_Engine:
	RETURN
; end of _Check_Engine
