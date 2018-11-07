
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
;PWM.c,46 :: 		for(j=0;j<500;j++)
	CLRF       modify_pwm_ch_j_L0+0
L_modify_pwm_ch17:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORLW      1
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__modify_pwm_ch201
	MOVLW      244
	SUBWF      modify_pwm_ch_j_L0+0, 0
L__modify_pwm_ch201:
	BTFSC      STATUS+0, 0
	GOTO       L_modify_pwm_ch18
;PWM.c,48 :: 		if(!MENU) {while(!MENU); return;}
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch20
L_modify_pwm_ch21:
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch22
	GOTO       L_modify_pwm_ch21
L_modify_pwm_ch22:
	GOTO       L_end_modify_pwm_ch
L_modify_pwm_ch20:
;PWM.c,49 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_modify_pwm_ch23:
	DECFSZ     R13, 1
	GOTO       L_modify_pwm_ch23
	DECFSZ     R12, 1
	GOTO       L_modify_pwm_ch23
	NOP
	NOP
;PWM.c,46 :: 		for(j=0;j<500;j++)
	INCF       modify_pwm_ch_j_L0+0, 1
;PWM.c,50 :: 		}
	GOTO       L_modify_pwm_ch17
L_modify_pwm_ch18:
;PWM.c,52 :: 		}
	GOTO       L_modify_pwm_ch4
L_modify_pwm_ch5:
;PWM.c,53 :: 		}
	GOTO       L_modify_pwm_ch24
L_modify_pwm_ch3:
;PWM.c,54 :: 		else if(cur_intensity[i]>pre_intensity[i])
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
	GOTO       L_modify_pwm_ch25
;PWM.c,56 :: 		while(cur_intensity[i]>=pre_intensity[i])
L_modify_pwm_ch26:
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
	GOTO       L_modify_pwm_ch27
;PWM.c,58 :: 		pre_intensity[i]++;
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
;PWM.c,59 :: 		if(i==0) PWM1_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch28
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
	GOTO       L_modify_pwm_ch29
L_modify_pwm_ch28:
;PWM.c,60 :: 		else if(i==1) PWM2_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch30
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
	GOTO       L_modify_pwm_ch31
L_modify_pwm_ch30:
;PWM.c,61 :: 		else if(i==2) PWM3_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch32
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
	GOTO       L_modify_pwm_ch33
L_modify_pwm_ch32:
;PWM.c,62 :: 		else if(i==3) PWM4_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch34
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
	GOTO       L_modify_pwm_ch35
L_modify_pwm_ch34:
;PWM.c,63 :: 		else if(i==4) write_I2C(0xD2,0x01,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch36
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
	GOTO       L_modify_pwm_ch37
L_modify_pwm_ch36:
;PWM.c,64 :: 		else if(i==5) write_I2C(0xD2,0x02,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch38
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
L_modify_pwm_ch38:
L_modify_pwm_ch37:
L_modify_pwm_ch35:
L_modify_pwm_ch33:
L_modify_pwm_ch31:
L_modify_pwm_ch29:
;PWM.c,65 :: 		for(j=0;j<500;j++)
	CLRF       modify_pwm_ch_j_L0+0
L_modify_pwm_ch39:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORLW      1
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__modify_pwm_ch202
	MOVLW      244
	SUBWF      modify_pwm_ch_j_L0+0, 0
L__modify_pwm_ch202:
	BTFSC      STATUS+0, 0
	GOTO       L_modify_pwm_ch40
;PWM.c,67 :: 		if(!MENU){while(!MENU); return;}
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch42
L_modify_pwm_ch43:
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch44
	GOTO       L_modify_pwm_ch43
L_modify_pwm_ch44:
	GOTO       L_end_modify_pwm_ch
L_modify_pwm_ch42:
;PWM.c,68 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12
	MOVLW      151
	MOVWF      R13
L_modify_pwm_ch45:
	DECFSZ     R13, 1
	GOTO       L_modify_pwm_ch45
	DECFSZ     R12, 1
	GOTO       L_modify_pwm_ch45
	NOP
	NOP
;PWM.c,65 :: 		for(j=0;j<500;j++)
	INCF       modify_pwm_ch_j_L0+0, 1
;PWM.c,69 :: 		}
	GOTO       L_modify_pwm_ch39
L_modify_pwm_ch40:
;PWM.c,70 :: 		}
	GOTO       L_modify_pwm_ch26
L_modify_pwm_ch27:
;PWM.c,71 :: 		}
	GOTO       L_modify_pwm_ch46
L_modify_pwm_ch25:
;PWM.c,72 :: 		else if(cur_intensity[i]==pre_intensity[i])
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
	GOTO       L_modify_pwm_ch47
;PWM.c,74 :: 		if(i==0) PWM1_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      0
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
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+1
	CALL       _PWM1_Set_Duty+0
	GOTO       L_modify_pwm_ch49
L_modify_pwm_ch48:
;PWM.c,75 :: 		else if(i==1) PWM2_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch50
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
	GOTO       L_modify_pwm_ch51
L_modify_pwm_ch50:
;PWM.c,76 :: 		else if(i==2) PWM3_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch52
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
	GOTO       L_modify_pwm_ch53
L_modify_pwm_ch52:
;PWM.c,77 :: 		else if(i==3) PWM4_Set_Duty(pre_intensity[i]*100);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch54
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
	GOTO       L_modify_pwm_ch55
L_modify_pwm_ch54:
;PWM.c,78 :: 		else if(i==4) write_I2C(0xD2,0x01,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch56
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
	GOTO       L_modify_pwm_ch57
L_modify_pwm_ch56:
;PWM.c,79 :: 		else if(i==5) write_I2C(0xD2,0x02,pre_intensity[i]);
	MOVF       modify_pwm_ch_i_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_modify_pwm_ch58
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
L_modify_pwm_ch58:
L_modify_pwm_ch57:
L_modify_pwm_ch55:
L_modify_pwm_ch53:
L_modify_pwm_ch51:
L_modify_pwm_ch49:
;PWM.c,80 :: 		if(!MENU){while(!MENU);  return;}
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch59
L_modify_pwm_ch60:
	BTFSC      PORTA+0, 0
	GOTO       L_modify_pwm_ch61
	GOTO       L_modify_pwm_ch60
L_modify_pwm_ch61:
	GOTO       L_end_modify_pwm_ch
L_modify_pwm_ch59:
;PWM.c,81 :: 		}
L_modify_pwm_ch47:
L_modify_pwm_ch46:
L_modify_pwm_ch24:
;PWM.c,33 :: 		for(i=0;i<6;i++)
	INCF       modify_pwm_ch_i_L0+0, 1
;PWM.c,82 :: 		}
	GOTO       L_modify_pwm_ch0
L_modify_pwm_ch1:
;PWM.c,84 :: 		memmove(pre_intensity,cur_intensity,sizeof(pre_intensity));
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
;PWM.c,85 :: 		}
L_end_modify_pwm_ch:
	RETURN
; end of _modify_pwm_ch

_Set_Intensity:

;PWM.c,88 :: 		void Set_Intensity()
;PWM.c,92 :: 		if(pattern==1) addr=0x0000;
	MOVF       _pattern+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity62
	CLRF       Set_Intensity_addr_L0+0
	CLRF       Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity63
L_Set_Intensity62:
;PWM.c,93 :: 		else if(pattern==2) addr=0x00A9;
	MOVF       _pattern+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity64
	MOVLW      169
	MOVWF      Set_Intensity_addr_L0+0
	CLRF       Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity65
L_Set_Intensity64:
;PWM.c,94 :: 		else if(pattern==3) addr=0x0152;
	MOVF       _pattern+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity66
	MOVLW      82
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      1
	MOVWF      Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity67
L_Set_Intensity66:
;PWM.c,95 :: 		else if(pattern==4) addr=0x01FB;
	MOVF       _pattern+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity68
	MOVLW      251
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      1
	MOVWF      Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity69
L_Set_Intensity68:
;PWM.c,96 :: 		else if(pattern==5) addr=0x0202;
	MOVF       _pattern+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity70
	MOVLW      2
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      2
	MOVWF      Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity71
L_Set_Intensity70:
;PWM.c,97 :: 		else if(pattern==6) addr=0x0209;
	MOVF       _pattern+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity72
	MOVLW      9
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      2
	MOVWF      Set_Intensity_addr_L0+1
L_Set_Intensity72:
L_Set_Intensity71:
L_Set_Intensity69:
L_Set_Intensity67:
L_Set_Intensity65:
L_Set_Intensity63:
;PWM.c,99 :: 		if(hrs>=0 && hrs<1)        offset=0;
	MOVLW      0
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity75
	MOVLW      1
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity75
L__Set_Intensity198:
	CLRF       Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity76
L_Set_Intensity75:
;PWM.c,100 :: 		else if(hrs>=1 && hrs<2)   offset=1;
	MOVLW      1
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity79
	MOVLW      2
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity79
L__Set_Intensity197:
	MOVLW      1
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity80
L_Set_Intensity79:
;PWM.c,101 :: 		else if(hrs>=2 && hrs<3)   offset=2;
	MOVLW      2
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity83
	MOVLW      3
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity83
L__Set_Intensity196:
	MOVLW      2
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity84
L_Set_Intensity83:
;PWM.c,102 :: 		else if(hrs>=3 && hrs<4)   offset=3;
	MOVLW      3
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity87
	MOVLW      4
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity87
L__Set_Intensity195:
	MOVLW      3
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity88
L_Set_Intensity87:
;PWM.c,103 :: 		else if(hrs>=4 && hrs<5)   offset=4;
	MOVLW      4
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity91
	MOVLW      5
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity91
L__Set_Intensity194:
	MOVLW      4
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity92
L_Set_Intensity91:
;PWM.c,104 :: 		else if(hrs>=5 && hrs<6)   offset=5;
	MOVLW      5
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity95
	MOVLW      6
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity95
L__Set_Intensity193:
	MOVLW      5
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity96
L_Set_Intensity95:
;PWM.c,105 :: 		else if(hrs>=6 && hrs<7)   offset=6;
	MOVLW      6
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity99
	MOVLW      7
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity99
L__Set_Intensity192:
	MOVLW      6
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity100
L_Set_Intensity99:
;PWM.c,106 :: 		else if(hrs>=7 && hrs<8)   offset=7;
	MOVLW      7
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity103
	MOVLW      8
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity103
L__Set_Intensity191:
	MOVLW      7
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity104
L_Set_Intensity103:
;PWM.c,107 :: 		else if(hrs>=8 && hrs<9)   offset=8;
	MOVLW      8
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity107
	MOVLW      9
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity107
L__Set_Intensity190:
	MOVLW      8
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity108
L_Set_Intensity107:
;PWM.c,108 :: 		else if(hrs>=9 && hrs<10)  offset=9;
	MOVLW      9
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity111
	MOVLW      10
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity111
L__Set_Intensity189:
	MOVLW      9
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity112
L_Set_Intensity111:
;PWM.c,109 :: 		else if(hrs>=10 && hrs<11) offset=10;
	MOVLW      10
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity115
	MOVLW      11
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity115
L__Set_Intensity188:
	MOVLW      10
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity116
L_Set_Intensity115:
;PWM.c,110 :: 		else if(hrs>=11 && hrs<12) offset=11;
	MOVLW      11
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity119
	MOVLW      12
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity119
L__Set_Intensity187:
	MOVLW      11
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity120
L_Set_Intensity119:
;PWM.c,111 :: 		else if(hrs>=12 && hrs<13) offset=12;
	MOVLW      12
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity123
	MOVLW      13
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity123
L__Set_Intensity186:
	MOVLW      12
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity124
L_Set_Intensity123:
;PWM.c,112 :: 		else if(hrs>=13 && hrs<14) offset=13;
	MOVLW      13
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity127
	MOVLW      14
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity127
L__Set_Intensity185:
	MOVLW      13
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity128
L_Set_Intensity127:
;PWM.c,113 :: 		else if(hrs>=14 && hrs<15) offset=14;
	MOVLW      14
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity131
	MOVLW      15
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity131
L__Set_Intensity184:
	MOVLW      14
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity132
L_Set_Intensity131:
;PWM.c,114 :: 		else if(hrs>=15 && hrs<16) offset=15;
	MOVLW      15
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity135
	MOVLW      16
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity135
L__Set_Intensity183:
	MOVLW      15
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity136
L_Set_Intensity135:
;PWM.c,115 :: 		else if(hrs>=16 && hrs<17) offset=16;
	MOVLW      16
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity139
	MOVLW      17
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity139
L__Set_Intensity182:
	MOVLW      16
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity140
L_Set_Intensity139:
;PWM.c,116 :: 		else if(hrs>=17 && hrs<18) offset=17;
	MOVLW      17
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity143
	MOVLW      18
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity143
L__Set_Intensity181:
	MOVLW      17
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity144
L_Set_Intensity143:
;PWM.c,117 :: 		else if(hrs>=18 && hrs<19) offset=18;
	MOVLW      18
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity147
	MOVLW      19
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity147
L__Set_Intensity180:
	MOVLW      18
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity148
L_Set_Intensity147:
;PWM.c,118 :: 		else if(hrs>=19 && hrs<20) offset=19;
	MOVLW      19
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity151
	MOVLW      20
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity151
L__Set_Intensity179:
	MOVLW      19
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity152
L_Set_Intensity151:
;PWM.c,119 :: 		else if(hrs>=20 && hrs<21) offset=20;
	MOVLW      20
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity155
	MOVLW      21
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity155
L__Set_Intensity178:
	MOVLW      20
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity156
L_Set_Intensity155:
;PWM.c,120 :: 		else if(hrs>=21 && hrs<22) offset=21;
	MOVLW      21
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity159
	MOVLW      22
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity159
L__Set_Intensity177:
	MOVLW      21
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity160
L_Set_Intensity159:
;PWM.c,121 :: 		else if(hrs>=22 && hrs<23) offset=22;
	MOVLW      22
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity163
	MOVLW      23
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity163
L__Set_Intensity176:
	MOVLW      22
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity164
L_Set_Intensity163:
;PWM.c,122 :: 		else if(hrs>=23 && hrs<24) offset=23;
	MOVLW      23
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity167
	MOVLW      24
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity167
L__Set_Intensity175:
	MOVLW      23
	MOVWF      Set_Intensity_offset_L0+0
L_Set_Intensity167:
L_Set_Intensity164:
L_Set_Intensity160:
L_Set_Intensity156:
L_Set_Intensity152:
L_Set_Intensity148:
L_Set_Intensity144:
L_Set_Intensity140:
L_Set_Intensity136:
L_Set_Intensity132:
L_Set_Intensity128:
L_Set_Intensity124:
L_Set_Intensity120:
L_Set_Intensity116:
L_Set_Intensity112:
L_Set_Intensity108:
L_Set_Intensity104:
L_Set_Intensity100:
L_Set_Intensity96:
L_Set_Intensity92:
L_Set_Intensity88:
L_Set_Intensity84:
L_Set_Intensity80:
L_Set_Intensity76:
;PWM.c,125 :: 		for(i=0;i<6;i++)
	CLRF       Set_Intensity_i_L0+0
L_Set_Intensity168:
	MOVLW      6
	SUBWF      Set_Intensity_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity169
;PWM.c,127 :: 		if(pattern==0)  cur_intensity[i]=def_pat[offset][i];
	MOVF       _pattern+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity171
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
	GOTO       L_Set_Intensity172
L_Set_Intensity171:
;PWM.c,128 :: 		else if(pattern<=3)  cur_intensity[i]=read_I2C(0xA0,addr+(offset*7)+i);
	MOVF       _pattern+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity173
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
	GOTO       L_Set_Intensity174
L_Set_Intensity173:
;PWM.c,129 :: 		else cur_intensity[i]=read_I2C(0xA0,addr+i);
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
L_Set_Intensity174:
L_Set_Intensity172:
;PWM.c,125 :: 		for(i=0;i<6;i++)
	INCF       Set_Intensity_i_L0+0, 1
;PWM.c,130 :: 		}
	GOTO       L_Set_Intensity168
L_Set_Intensity169:
;PWM.c,131 :: 		modify_pwm_ch();
	CALL       _modify_pwm_ch+0
;PWM.c,132 :: 		}
L_end_Set_Intensity:
	RETURN
; end of _Set_Intensity
