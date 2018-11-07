
_PWM3_Initialize:

;pwm3.c,3 :: 		void PWM3_Initialize(void)
;pwm3.c,5 :: 		TRISA=0x00;
	CLRF       TRISA+0
;pwm3.c,6 :: 		PWM3DCH = 0x04;
	MOVLW      4
	MOVWF      PWM3DCH+0
;pwm3.c,7 :: 		PWM3DCL = 0x40;
	MOVLW      64
	MOVWF      PWM3DCL+0
;pwm3.c,8 :: 		}
L_end_PWM3_Initialize:
	RETURN
; end of _PWM3_Initialize

_PWM3_LoadDutyValue:

;pwm3.c,10 :: 		void PWM3_LoadDutyValue(uint16 dutyValue)
;pwm3.c,12 :: 		PWM3DCH = (dutyValue & 0x03FC)>>2;
	MOVLW      252
	ANDWF      FARG_PWM3_LoadDutyValue_dutyValue+0, 0
	MOVWF      R3
	MOVF       FARG_PWM3_LoadDutyValue_dutyValue+1, 0
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
	MOVWF      PWM3DCH+0
;pwm3.c,13 :: 		PWM3DCL = (dutyValue & 0x0003)<<6;
	MOVLW      3
	ANDWF      FARG_PWM3_LoadDutyValue_dutyValue+0, 0
	MOVWF      R2
	MOVLW      6
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      R0
	MOVF       R1, 0
L__PWM3_LoadDutyValue2:
	BTFSC      STATUS+0, 2
	GOTO       L__PWM3_LoadDutyValue3
	LSLF       R0, 1
	ADDLW      255
	GOTO       L__PWM3_LoadDutyValue2
L__PWM3_LoadDutyValue3:
	MOVF       R0, 0
	MOVWF      PWM3DCL+0
;pwm3.c,14 :: 		}
L_end_PWM3_LoadDutyValue:
	RETURN
; end of _PWM3_LoadDutyValue
