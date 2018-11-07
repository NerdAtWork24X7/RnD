
_Init_PWM:

;PWM.c,19 :: 		void Init_PWM()
;PWM.c,21 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWM.c,22 :: 		PWM2_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;PWM.c,23 :: 		PWM3_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM3_Init+0
;PWM.c,24 :: 		PWM4_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM4_Init+0
;PWM.c,25 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;PWM.c,26 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;PWM.c,27 :: 		PWM3_Start();
	CALL       _PWM3_Start+0
;PWM.c,28 :: 		PWM4_Start();
	CALL       _PWM4_Start+0
;PWM.c,29 :: 		}
L_end_Init_PWM:
	RETURN
; end of _Init_PWM

_modify_pwm_ch:

;PWM.c,30 :: 		void  modify_pwm_ch()
;PWM.c,33 :: 		for(i=0;i<6;i++)
	CLRF       modify_pwm_ch_i_L0+0
L_modify_pwm_ch0:
	MOVLW      6
	SUBWF      modify_pwm_ch_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_modify_pwm_ch1
;PWM.c,35 :: 		if(pre_intensity[i]>cur_intensity[i])
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      _cur_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_cur_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVLW      128
	XORWF      INDF0+0, 0
	MOVWF      R0
	MOVLW      128
	XORWF      R1, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_modify_pwm_ch3
;PWM.c,37 :: 		while(cur_intensity[i]<pre_intensity[i])
L_modify_pwm_ch4:
	MOVLW      _cur_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_cur_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVLW      128
	XORWF      R1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      INDF0+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_modify_pwm_ch5
;PWM.c,39 :: 		pre_intensity[i]--;
	MOVLW      _pre_intensity+0
	MOVWF      R1
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      R2
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      R1, 1
	BTFSC      STATUS+0, 0
	INCF       R2, 1
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	DECF       R0, 1
	MOVF       R1, 0
	MOVWF      FSR1L
	MOVF       R2, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
;PWM.c,40 :: 		if(i==0) PWM1_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch6
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+1
	CALL       _PWM1_Set_Duty+0
	GOTO       L_modify_pwm_ch7
L_modify_pwm_ch6:
;PWM.c,41 :: 		else if(i==1) PWM2_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch8
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+1
	CALL       _PWM2_Set_Duty+0
	GOTO       L_modify_pwm_ch9
L_modify_pwm_ch8:
;PWM.c,42 :: 		else if(i==2) PWM3_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch10
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM3_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM3_Set_Duty_new_duty+1
	CALL       _PWM3_Set_Duty+0
	GOTO       L_modify_pwm_ch11
L_modify_pwm_ch10:
;PWM.c,43 :: 		else if(i==3) PWM4_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch12
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM4_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM4_Set_Duty_new_duty+1
	CALL       _PWM4_Set_Duty+0
	GOTO       L_modify_pwm_ch13
L_modify_pwm_ch12:
;PWM.c,44 :: 		else if(i==4) write_I2C(0xD2,0x01,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch14
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_modify_pwm_ch15
L_modify_pwm_ch14:
;PWM.c,45 :: 		else if(i==5) write_I2C(0xD2,0x02,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch16
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_modify_pwm_ch16:
L_modify_pwm_ch15:
L_modify_pwm_ch13:
L_modify_pwm_ch11:
L_modify_pwm_ch9:
L_modify_pwm_ch7:
;PWM.c,46 :: 		if(!MENU) {while(!MENU); return;}
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch17
L_modify_pwm_ch18:
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch19
	GOTO       L_modify_pwm_ch18
L_modify_pwm_ch19:
	GOTO       L_end_modify_pwm_ch
L_modify_pwm_ch17:
;PWM.c,47 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_modify_pwm_ch20:
	DECFSZ     R13, 1
	GOTO       L_modify_pwm_ch20
	DECFSZ     R12, 1
	GOTO       L_modify_pwm_ch20
	DECFSZ     R11, 1
	GOTO       L_modify_pwm_ch20
	NOP
	NOP
;PWM.c,49 :: 		}
	GOTO       L_modify_pwm_ch4
L_modify_pwm_ch5:
;PWM.c,50 :: 		}
	GOTO       L_modify_pwm_ch21
L_modify_pwm_ch3:
;PWM.c,51 :: 		else if(cur_intensity[i]>pre_intensity[i])
	MOVLW      _cur_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_cur_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVLW      128
	XORWF      INDF0+0, 0
	MOVWF      R0
	MOVLW      128
	XORWF      R1, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_modify_pwm_ch22
;PWM.c,53 :: 		while(cur_intensity[i]>=pre_intensity[i])
L_modify_pwm_ch23:
	MOVLW      _cur_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_cur_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVLW      128
	XORWF      R1, 0
	MOVWF      R0
	MOVLW      128
	XORWF      INDF0+0, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_modify_pwm_ch24
;PWM.c,55 :: 		pre_intensity[i]++;
	MOVLW      _pre_intensity+0
	MOVWF      R1
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      R2
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      R1, 1
	BTFSC      STATUS+0, 0
	INCF       R2, 1
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	INCF       R0, 1
	MOVF       R1, 0
	MOVWF      FSR1L
	MOVF       R2, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
;PWM.c,56 :: 		if(i==0) PWM1_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch25
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+1
	CALL       _PWM1_Set_Duty+0
	GOTO       L_modify_pwm_ch26
L_modify_pwm_ch25:
;PWM.c,57 :: 		else if(i==1) PWM2_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch27
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+1
	CALL       _PWM2_Set_Duty+0
	GOTO       L_modify_pwm_ch28
L_modify_pwm_ch27:
;PWM.c,58 :: 		else if(i==2) PWM3_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch29
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM3_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM3_Set_Duty_new_duty+1
	CALL       _PWM3_Set_Duty+0
	GOTO       L_modify_pwm_ch30
L_modify_pwm_ch29:
;PWM.c,59 :: 		else if(i==3) PWM4_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch31
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM4_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM4_Set_Duty_new_duty+1
	CALL       _PWM4_Set_Duty+0
	GOTO       L_modify_pwm_ch32
L_modify_pwm_ch31:
;PWM.c,60 :: 		else if(i==4) write_I2C(0xD2,0x01,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch33
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_modify_pwm_ch34
L_modify_pwm_ch33:
;PWM.c,61 :: 		else if(i==5) write_I2C(0xD2,0x02,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch35
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_modify_pwm_ch35:
L_modify_pwm_ch34:
L_modify_pwm_ch32:
L_modify_pwm_ch30:
L_modify_pwm_ch28:
L_modify_pwm_ch26:
;PWM.c,62 :: 		if(!MENU){ while(!MENU); return;}
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch36
L_modify_pwm_ch37:
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch38
	GOTO       L_modify_pwm_ch37
L_modify_pwm_ch38:
	GOTO       L_end_modify_pwm_ch
L_modify_pwm_ch36:
;PWM.c,63 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_modify_pwm_ch39:
	DECFSZ     R13, 1
	GOTO       L_modify_pwm_ch39
	DECFSZ     R12, 1
	GOTO       L_modify_pwm_ch39
	DECFSZ     R11, 1
	GOTO       L_modify_pwm_ch39
	NOP
	NOP
;PWM.c,64 :: 		}
	GOTO       L_modify_pwm_ch23
L_modify_pwm_ch24:
;PWM.c,65 :: 		}
	GOTO       L_modify_pwm_ch40
L_modify_pwm_ch22:
;PWM.c,66 :: 		else if(cur_intensity[i]==pre_intensity[i])
	MOVLW      _cur_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_cur_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       R1, 0
	XORWF      INDF0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch41
;PWM.c,68 :: 		if(i==0) PWM1_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch42
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+1
	CALL       _PWM1_Set_Duty+0
	GOTO       L_modify_pwm_ch43
L_modify_pwm_ch42:
;PWM.c,69 :: 		else if(i==1) PWM2_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch44
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+1
	CALL       _PWM2_Set_Duty+0
	GOTO       L_modify_pwm_ch45
L_modify_pwm_ch44:
;PWM.c,70 :: 		else if(i==2) PWM3_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch46
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM3_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM3_Set_Duty_new_duty+1
	CALL       _PWM3_Set_Duty+0
	GOTO       L_modify_pwm_ch47
L_modify_pwm_ch46:
;PWM.c,71 :: 		else if(i==3) PWM4_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch48
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_S+0
	MOVF       R0, 0
	MOVWF      FARG_PWM4_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM4_Set_Duty_new_duty+1
	CALL       _PWM4_Set_Duty+0
	GOTO       L_modify_pwm_ch49
L_modify_pwm_ch48:
;PWM.c,72 :: 		else if(i==4) write_I2C(0xD2,0x01,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch50
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_modify_pwm_ch51
L_modify_pwm_ch50:
;PWM.c,73 :: 		else if(i==5) write_I2C(0xD2,0x02,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch52
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      _pre_intensity+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FSR0H
	MOVF       modify_pwm_ch_i_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_modify_pwm_ch52:
L_modify_pwm_ch51:
L_modify_pwm_ch49:
L_modify_pwm_ch47:
L_modify_pwm_ch45:
L_modify_pwm_ch43:
;PWM.c,74 :: 		if(!MENU){while(!MENU)  return;}
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch53
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch55
	GOTO       L_end_modify_pwm_ch
L_modify_pwm_ch55:
L_modify_pwm_ch53:
;PWM.c,75 :: 		}
L_modify_pwm_ch41:
L_modify_pwm_ch40:
L_modify_pwm_ch21:
;PWM.c,33 :: 		for(i=0;i<6;i++)
	INCF       modify_pwm_ch_i_L0+0, 1
;PWM.c,76 :: 		}
	GOTO       L_modify_pwm_ch0
L_modify_pwm_ch1:
;PWM.c,78 :: 		memmove(pre_intensity,cur_intensity,sizeof(pre_intensity));
	MOVLW      _pre_intensity+0
	MOVWF      FARG_memmove_to+0
	MOVLW      hi_addr(_pre_intensity+0)
	MOVWF      FARG_memmove_to+1
	MOVLW      _cur_intensity+0
	MOVWF      FARG_memmove_from+0
	MOVLW      hi_addr(_cur_intensity+0)
	MOVWF      FARG_memmove_from+1
	MOVLW      7
	MOVWF      FARG_memmove_n+0
	MOVLW      0
	MOVWF      FARG_memmove_n+1
	CALL       _memmove+0
;PWM.c,79 :: 		}
L_end_modify_pwm_ch:
	RETURN
; end of _modify_pwm_ch

_Set_Intensity:

;PWM.c,82 :: 		void Set_Intensity()
;PWM.c,86 :: 		if(pattern==1) addr=0x0000;
	MOVF       _pattern+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity56
	CLRF       Set_Intensity_addr_L0+0
	CLRF       Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity57
L_Set_Intensity56:
;PWM.c,87 :: 		else if(pattern==2) addr=0x00A9;
	MOVF       _pattern+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity58
	MOVLW      169
	MOVWF      Set_Intensity_addr_L0+0
	CLRF       Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity59
L_Set_Intensity58:
;PWM.c,88 :: 		else if(pattern==3) addr=0x0152;
	MOVF       _pattern+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity60
	MOVLW      82
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      1
	MOVWF      Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity61
L_Set_Intensity60:
;PWM.c,89 :: 		else if(pattern==4) addr=0x01FB;
	MOVF       _pattern+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity62
	MOVLW      251
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      1
	MOVWF      Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity63
L_Set_Intensity62:
;PWM.c,90 :: 		else if(pattern==5) addr=0x0202;
	MOVF       _pattern+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity64
	MOVLW      2
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      2
	MOVWF      Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity65
L_Set_Intensity64:
;PWM.c,91 :: 		else if(pattern==6) addr=0x0209;
	MOVF       _pattern+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity66
	MOVLW      9
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      2
	MOVWF      Set_Intensity_addr_L0+1
L_Set_Intensity66:
L_Set_Intensity65:
L_Set_Intensity63:
L_Set_Intensity61:
L_Set_Intensity59:
L_Set_Intensity57:
;PWM.c,93 :: 		if(hrs>=0 && hrs<1)        offset=0;
	MOVLW      0
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity69
	MOVLW      1
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity69
L__Set_Intensity192:
	CLRF       Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity70
L_Set_Intensity69:
;PWM.c,94 :: 		else if(hrs>=1 && hrs<2)   offset=1;
	MOVLW      1
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity73
	MOVLW      2
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity73
L__Set_Intensity191:
	MOVLW      1
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity74
L_Set_Intensity73:
;PWM.c,95 :: 		else if(hrs>=2 && hrs<3)   offset=2;
	MOVLW      2
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity77
	MOVLW      3
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity77
L__Set_Intensity190:
	MOVLW      2
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity78
L_Set_Intensity77:
;PWM.c,96 :: 		else if(hrs>=3 && hrs<4)   offset=3;
	MOVLW      3
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity81
	MOVLW      4
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity81
L__Set_Intensity189:
	MOVLW      3
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity82
L_Set_Intensity81:
;PWM.c,97 :: 		else if(hrs>=4 && hrs<5)   offset=4;
	MOVLW      4
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity85
	MOVLW      5
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity85
L__Set_Intensity188:
	MOVLW      4
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity86
L_Set_Intensity85:
;PWM.c,98 :: 		else if(hrs>=5 && hrs<6)   offset=5;
	MOVLW      5
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity89
	MOVLW      6
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity89
L__Set_Intensity187:
	MOVLW      5
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity90
L_Set_Intensity89:
;PWM.c,99 :: 		else if(hrs>=6 && hrs<7)   offset=6;
	MOVLW      6
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity93
	MOVLW      7
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity93
L__Set_Intensity186:
	MOVLW      6
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity94
L_Set_Intensity93:
;PWM.c,100 :: 		else if(hrs>=7 && hrs<8)   offset=7;
	MOVLW      7
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity97
	MOVLW      8
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity97
L__Set_Intensity185:
	MOVLW      7
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity98
L_Set_Intensity97:
;PWM.c,101 :: 		else if(hrs>=8 && hrs<9)   offset=8;
	MOVLW      8
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity101
	MOVLW      9
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity101
L__Set_Intensity184:
	MOVLW      8
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity102
L_Set_Intensity101:
;PWM.c,102 :: 		else if(hrs>=9 && hrs<10)  offset=9;
	MOVLW      9
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity105
	MOVLW      10
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity105
L__Set_Intensity183:
	MOVLW      9
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity106
L_Set_Intensity105:
;PWM.c,103 :: 		else if(hrs>=10 && hrs<11) offset=10;
	MOVLW      10
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity109
	MOVLW      11
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity109
L__Set_Intensity182:
	MOVLW      10
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity110
L_Set_Intensity109:
;PWM.c,104 :: 		else if(hrs>=11 && hrs<12) offset=11;
	MOVLW      11
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity113
	MOVLW      12
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity113
L__Set_Intensity181:
	MOVLW      11
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity114
L_Set_Intensity113:
;PWM.c,105 :: 		else if(hrs>=12 && hrs<13) offset=12;
	MOVLW      12
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity117
	MOVLW      13
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity117
L__Set_Intensity180:
	MOVLW      12
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity118
L_Set_Intensity117:
;PWM.c,106 :: 		else if(hrs>=13 && hrs<14) offset=13;
	MOVLW      13
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity121
	MOVLW      14
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity121
L__Set_Intensity179:
	MOVLW      13
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity122
L_Set_Intensity121:
;PWM.c,107 :: 		else if(hrs>=14 && hrs<15) offset=14;
	MOVLW      14
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity125
	MOVLW      15
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity125
L__Set_Intensity178:
	MOVLW      14
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity126
L_Set_Intensity125:
;PWM.c,108 :: 		else if(hrs>=15 && hrs<16) offset=15;
	MOVLW      15
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity129
	MOVLW      16
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity129
L__Set_Intensity177:
	MOVLW      15
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity130
L_Set_Intensity129:
;PWM.c,109 :: 		else if(hrs>=16 && hrs<17) offset=16;
	MOVLW      16
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity133
	MOVLW      17
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity133
L__Set_Intensity176:
	MOVLW      16
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity134
L_Set_Intensity133:
;PWM.c,110 :: 		else if(hrs>=17 && hrs<18) offset=17;
	MOVLW      17
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity137
	MOVLW      18
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity137
L__Set_Intensity175:
	MOVLW      17
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity138
L_Set_Intensity137:
;PWM.c,111 :: 		else if(hrs>=18 && hrs<19) offset=18;
	MOVLW      18
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity141
	MOVLW      19
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity141
L__Set_Intensity174:
	MOVLW      18
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity142
L_Set_Intensity141:
;PWM.c,112 :: 		else if(hrs>=19 && hrs<20) offset=19;
	MOVLW      19
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity145
	MOVLW      20
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity145
L__Set_Intensity173:
	MOVLW      19
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity146
L_Set_Intensity145:
;PWM.c,113 :: 		else if(hrs>=20 && hrs<21) offset=20;
	MOVLW      20
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity149
	MOVLW      21
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity149
L__Set_Intensity172:
	MOVLW      20
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity150
L_Set_Intensity149:
;PWM.c,114 :: 		else if(hrs>=21 && hrs<22) offset=21;
	MOVLW      21
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity153
	MOVLW      22
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity153
L__Set_Intensity171:
	MOVLW      21
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity154
L_Set_Intensity153:
;PWM.c,115 :: 		else if(hrs>=22 && hrs<23) offset=22;
	MOVLW      22
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity157
	MOVLW      23
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity157
L__Set_Intensity170:
	MOVLW      22
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity158
L_Set_Intensity157:
;PWM.c,116 :: 		else if(hrs>=23 && hrs<24) offset=23;
	MOVLW      23
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity161
	MOVLW      24
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity161
L__Set_Intensity169:
	MOVLW      23
	MOVWF      Set_Intensity_offset_L0+0
L_Set_Intensity161:
L_Set_Intensity158:
L_Set_Intensity154:
L_Set_Intensity150:
L_Set_Intensity146:
L_Set_Intensity142:
L_Set_Intensity138:
L_Set_Intensity134:
L_Set_Intensity130:
L_Set_Intensity126:
L_Set_Intensity122:
L_Set_Intensity118:
L_Set_Intensity114:
L_Set_Intensity110:
L_Set_Intensity106:
L_Set_Intensity102:
L_Set_Intensity98:
L_Set_Intensity94:
L_Set_Intensity90:
L_Set_Intensity86:
L_Set_Intensity82:
L_Set_Intensity78:
L_Set_Intensity74:
L_Set_Intensity70:
;PWM.c,119 :: 		for(i=0;i<6;i++)
	CLRF       Set_Intensity_i_L0+0
L_Set_Intensity162:
	MOVLW      6
	SUBWF      Set_Intensity_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity163
;PWM.c,121 :: 		if(pattern==0)  cur_intensity[i]=def_pat[offset][i];
	MOVF       _pattern+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity165
	MOVLW      _cur_intensity+0
	MOVWF      FLOC__Set_Intensity+0
	MOVLW      hi_addr(_cur_intensity+0)
	MOVWF      FLOC__Set_Intensity+1
	MOVF       Set_Intensity_i_L0+0, 0
	ADDWF      FLOC__Set_Intensity+0, 1
	BTFSC      STATUS+0, 0
	INCF       FLOC__Set_Intensity+1, 1
	MOVLW      7
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       Set_Intensity_offset_L0+0, 0
	MOVWF      R4
	CLRF       R5
	CALL       _Mul_16x16_U+0
	MOVLW      _def_pat+0
	ADDWF      R0, 1
	MOVLW      hi_addr(_def_pat+0)
	ADDWFC     R1, 1
	MOVF       Set_Intensity_i_L0+0, 0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVF       FLOC__Set_Intensity+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__Set_Intensity+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	GOTO       L_Set_Intensity166
L_Set_Intensity165:
;PWM.c,122 :: 		else if(pattern<=3)  cur_intensity[i]=read_I2C(0xA0,addr+(offset*7)+i);
	MOVF       _pattern+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity167
	MOVLW      _cur_intensity+0
	MOVWF      FLOC__Set_Intensity+0
	MOVLW      hi_addr(_cur_intensity+0)
	MOVWF      FLOC__Set_Intensity+1
	MOVF       Set_Intensity_i_L0+0, 0
	ADDWF      FLOC__Set_Intensity+0, 1
	BTFSC      STATUS+0, 0
	INCF       FLOC__Set_Intensity+1, 1
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVF       Set_Intensity_offset_L0+0, 0
	MOVWF      R0
	MOVLW      7
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	ADDWF      Set_Intensity_addr_L0+0, 0
	MOVWF      FARG_read_I2C_buff_add+0
	MOVF       R1, 0
	ADDWFC     Set_Intensity_addr_L0+1, 0
	MOVWF      FARG_read_I2C_buff_add+1
	MOVF       Set_Intensity_i_L0+0, 0
	ADDWF      FARG_read_I2C_buff_add+0, 1
	MOVLW      0
	ADDWFC     FARG_read_I2C_buff_add+1, 1
	CALL       _read_I2C+0
	MOVF       FLOC__Set_Intensity+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__Set_Intensity+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	GOTO       L_Set_Intensity168
L_Set_Intensity167:
;PWM.c,123 :: 		else cur_intensity[i]=read_I2C(0xA0,addr+i);
	MOVLW      _cur_intensity+0
	MOVWF      FLOC__Set_Intensity+0
	MOVLW      hi_addr(_cur_intensity+0)
	MOVWF      FLOC__Set_Intensity+1
	MOVF       Set_Intensity_i_L0+0, 0
	ADDWF      FLOC__Set_Intensity+0, 1
	BTFSC      STATUS+0, 0
	INCF       FLOC__Set_Intensity+1, 1
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVF       Set_Intensity_i_L0+0, 0
	ADDWF      Set_Intensity_addr_L0+0, 0
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	ADDWFC     Set_Intensity_addr_L0+1, 0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       FLOC__Set_Intensity+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__Set_Intensity+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
L_Set_Intensity168:
L_Set_Intensity166:
;PWM.c,119 :: 		for(i=0;i<6;i++)
	INCF       Set_Intensity_i_L0+0, 1
;PWM.c,124 :: 		}
	GOTO       L_Set_Intensity162
L_Set_Intensity163:
;PWM.c,125 :: 		modify_pwm_ch();
	CALL       _modify_pwm_ch+0
;PWM.c,126 :: 		}
L_end_Set_Intensity:
	RETURN
; end of _Set_Intensity
