
_PWM1_Initialize:

;pwm1.c,3 :: 		void PWM1_Initialize(void)
;pwm1.c,5 :: 		PWM1DCH = 0x32;
	MOVLW      50
	MOVWF      PWM1DCH+0
;pwm1.c,6 :: 		PWM1DCL = 0xC0;
	MOVLW      192
	MOVWF      PWM1DCL+0
;pwm1.c,7 :: 		}
L_end_PWM1_Initialize:
	RETURN
; end of _PWM1_Initialize

_PWM1_LoadDutyValue:

;pwm1.c,9 :: 		void PWM1_LoadDutyValue(uint16 dutyValue)
;pwm1.c,11 :: 		PWM1DCH = (dutyValue & 0x03FC)>>2;
	MOVLW      252
	ANDWF      FARG_PWM1_LoadDutyValue_dutyValue+0, 0
	MOVWF      R3
	MOVF       FARG_PWM1_LoadDutyValue_dutyValue+1, 0
	ANDLW      3
	MOVWF      R4
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	LSRF       R1, 1
	RRF        R0, 1
	LSRF       R1, 1
	RRF        R0, 1
	MOVF       R0, 0
	MOVWF      PWM1DCH+0
;pwm1.c,12 :: 		PWM1DCL = (dutyValue & 0x0003)<<6;
	MOVLW      3
	ANDWF      FARG_PWM1_LoadDutyValue_dutyValue+0, 0
	MOVWF      R2
	MOVLW      6
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__PWM1_LoadDutyValue2:
	BTFSC      STATUS+0, 2
	GOTO       L__PWM1_LoadDutyValue3
	LSLF       R0, 1
	ADDLW      255
	GOTO       L__PWM1_LoadDutyValue2
L__PWM1_LoadDutyValue3:
	MOVF       R0, 0
	MOVWF      PWM1DCL+0
;pwm1.c,13 :: 		}
L_end_PWM1_LoadDutyValue:
	RETURN
; end of _PWM1_LoadDutyValue
