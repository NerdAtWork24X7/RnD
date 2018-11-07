
_Check_Engine:

;tmr1.c,50 :: 		void Check_Engine()
;tmr1.c,57 :: 		if(eng_H>0 && eng_L>0){ Eng_On = 1;}
	MOVF       _eng_H+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Engine6
	MOVF       _eng_H+0, 0
	SUBLW      0
L__Check_Engine6:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Engine2
	MOVF       _eng_L+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Engine7
	MOVF       _eng_L+0, 0
	SUBLW      0
L__Check_Engine7:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Engine2
L__Check_Engine4:
	MOVLW      1
	MOVWF      _Eng_On+0
	GOTO       L_Check_Engine3
L_Check_Engine2:
;tmr1.c,58 :: 		else Eng_On = 0;
	CLRF       _Eng_On+0
L_Check_Engine3:
;tmr1.c,59 :: 		eng_H = 0;
	CLRF       _eng_H+0
	CLRF       _eng_H+1
;tmr1.c,60 :: 		eng_L = 0;
	CLRF       _eng_L+0
	CLRF       _eng_L+1
;tmr1.c,61 :: 		}
L_end_Check_Engine:
	RETURN
; end of _Check_Engine
