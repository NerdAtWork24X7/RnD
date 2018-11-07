
_PWM3_Initialize:

;pwm3.c,3 :: 		void PWM3_Initialize(void)
;pwm3.c,5 :: 		CCP3CON = 0x1C;
	MOVLW      28
	MOVWF      CCP3CON+0
;pwm3.c,6 :: 		CCPR3L = 0x0E;
	MOVLW      14
	MOVWF      CCPR3L+0
;pwm3.c,7 :: 		CCPR3H = 0x00;
	CLRF       CCPR3H+0
;pwm3.c,8 :: 		C3TSEL0_bit = 0x0;
	BCF        C3TSEL0_bit+0, BitPos(C3TSEL0_bit+0)
;pwm3.c,9 :: 		PWM3_LoadDutyValue(PWM3_INITIALIZE_DUTY_VALUE);
	MOVLW      35
	MOVWF      FARG_PWM3_LoadDutyValue_dutyValue+0
	MOVLW      0
	MOVWF      FARG_PWM3_LoadDutyValue_dutyValue+1
	CALL       _PWM3_LoadDutyValue+0
;pwm3.c,10 :: 		}
L_end_PWM3_Initialize:
	RETURN
; end of _PWM3_Initialize

_PWM3_LoadDutyValue:

;pwm3.c,12 :: 		void PWM3_LoadDutyValue(uint16 dutyValue)
;pwm3.c,14 :: 		CCPR3L = ((dutyValue & 0x03FC)>>2);
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
	MOVWF      CCPR3L+0
;pwm3.c,15 :: 		CCP3CON = ((CCP3CON & 0xCF) | ((dutyValue & 0x0003)<<4));
	MOVLW      207
	ANDWF      CCP3CON+0, 0
	MOVWF      R3
	MOVLW      3
	ANDWF      FARG_PWM3_LoadDutyValue_dutyValue+0, 0
	MOVWF      R2
	MOVF       R2, 0
	MOVWF      R0
	LSLF       R0, 1
	LSLF       R0, 1
	LSLF       R0, 1
	LSLF       R0, 1
	MOVF       R0, 0
	IORWF       R3, 0
	MOVWF      CCP3CON+0
;pwm3.c,16 :: 		}
L_end_PWM3_LoadDutyValue:
	RETURN
; end of _PWM3_LoadDutyValue
