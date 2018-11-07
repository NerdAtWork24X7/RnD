
_sel_patt:

;EEPROM.c,12 :: 		void sel_patt()
;EEPROM.c,14 :: 		s8 i=0;
	CLRF       sel_patt_i_L0+0
;EEPROM.c,15 :: 		while(!ENTER);
L_sel_patt0:
	BTFSC      PORTA+0, 5
	GOTO       L_sel_patt1
	GOTO       L_sel_patt0
L_sel_patt1:
;EEPROM.c,16 :: 		while(ENTER)
L_sel_patt2:
	BTFSS      PORTA+0, 5
	GOTO       L_sel_patt3
;EEPROM.c,18 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,19 :: 		Lcd_Out(1,6,"PATTERN");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr1_EEPROM+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,20 :: 		Lcd_Out(2,1,patt[i]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _patt+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_patt+0)
	MOVWF      FARG_Lcd_Out_text+1
	MOVLW      4
	MOVWF      R2
	MOVF       sel_patt_i_L0+0, 0
	MOVWF      R0
	MOVLW      0
	BTFSC      R0, 7
	MOVLW      255
	MOVWF      R1
	MOVF       R2, 0
L__sel_patt95:
	BTFSC      STATUS+0, 2
	GOTO       L__sel_patt96
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__sel_patt95
L__sel_patt96:
	MOVF       R0, 0
	ADDWF      FARG_Lcd_Out_text+0, 1
	MOVF       R1, 0
	ADDWFC     FARG_Lcd_Out_text+1, 1
	CALL       _Lcd_Out+0
;EEPROM.c,21 :: 		Lcd_Chr(1,16,'^');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      94
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,22 :: 		Lcd_Chr(2,16,'v');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      118
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,23 :: 		while(UP&&DOWN&&ENTER&&MENU);  //wait
L_sel_patt4:
	BTFSS      PORTA+0, 1
	GOTO       L_sel_patt5
	BTFSS      PORTA+0, 4
	GOTO       L_sel_patt5
	BTFSS      PORTA+0, 5
	GOTO       L_sel_patt5
	BTFSS      PORTA+0, 0
	GOTO       L_sel_patt5
L__sel_patt93:
	GOTO       L_sel_patt4
L_sel_patt5:
;EEPROM.c,24 :: 		if(!UP){ i++; while(!UP); }//wait till button is released
	BTFSC      PORTA+0, 1
	GOTO       L_sel_patt8
	INCF       sel_patt_i_L0+0, 1
L_sel_patt9:
	BTFSC      PORTA+0, 1
	GOTO       L_sel_patt10
	GOTO       L_sel_patt9
L_sel_patt10:
	GOTO       L_sel_patt11
L_sel_patt8:
;EEPROM.c,25 :: 		else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
	BTFSC      PORTA+0, 4
	GOTO       L_sel_patt12
	DECF       sel_patt_i_L0+0, 1
L_sel_patt13:
	BTFSC      PORTA+0, 4
	GOTO       L_sel_patt14
	GOTO       L_sel_patt13
L_sel_patt14:
	GOTO       L_sel_patt15
L_sel_patt12:
;EEPROM.c,26 :: 		else if(!MENU) break;
	BTFSC      PORTA+0, 0
	GOTO       L_sel_patt16
	GOTO       L_sel_patt3
L_sel_patt16:
L_sel_patt15:
L_sel_patt11:
;EEPROM.c,27 :: 		if(i<0) i=6;
	MOVLW      128
	XORWF      sel_patt_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sel_patt17
	MOVLW      6
	MOVWF      sel_patt_i_L0+0
L_sel_patt17:
;EEPROM.c,28 :: 		if(i>6) i=0;
	MOVLW      128
	XORLW      6
	MOVWF      R0
	MOVLW      128
	XORWF      sel_patt_i_L0+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sel_patt18
	CLRF       sel_patt_i_L0+0
L_sel_patt18:
;EEPROM.c,29 :: 		}
	GOTO       L_sel_patt2
L_sel_patt3:
;EEPROM.c,30 :: 		while(!MENU);
L_sel_patt19:
	BTFSC      PORTA+0, 0
	GOTO       L_sel_patt20
	GOTO       L_sel_patt19
L_sel_patt20:
;EEPROM.c,31 :: 		pattern=i;
	MOVF       sel_patt_i_L0+0, 0
	MOVWF      _pattern+0
;EEPROM.c,33 :: 		}
L_end_sel_patt:
	RETURN
; end of _sel_patt

_save_data:

;EEPROM.c,38 :: 		void save_data(u8 tim)
;EEPROM.c,40 :: 		u8 flag=0,j,val[4],row=0,col=0;
	CLRF       save_data_flag_L0+0
	CLRF       save_data_row_L0+0
	CLRF       save_data_col_L0+0
;EEPROM.c,43 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,44 :: 		lcd_out(1,1,"W:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr2_EEPROM+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,45 :: 		lcd_out(1,7,"B:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr3_EEPROM+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,46 :: 		lcd_out(1,13,"U:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr4_EEPROM+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,47 :: 		lcd_out(2,1,"V:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr5_EEPROM+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,48 :: 		lcd_out(2,7,"G:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr6_EEPROM+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,49 :: 		lcd_out(2,13,"R:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr7_EEPROM+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,51 :: 		if(pattern==1) addr=0x0000;
	MOVF       _pattern+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data21
	CLRF       save_data_addr_L0+0
	CLRF       save_data_addr_L0+1
	GOTO       L_save_data22
L_save_data21:
;EEPROM.c,52 :: 		else if(pattern==2) addr=0x00A9;
	MOVF       _pattern+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_save_data23
	MOVLW      169
	MOVWF      save_data_addr_L0+0
	CLRF       save_data_addr_L0+1
	GOTO       L_save_data24
L_save_data23:
;EEPROM.c,53 :: 		else if(pattern==3) addr=0x0152;
	MOVF       _pattern+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_save_data25
	MOVLW      82
	MOVWF      save_data_addr_L0+0
	MOVLW      1
	MOVWF      save_data_addr_L0+1
	GOTO       L_save_data26
L_save_data25:
;EEPROM.c,54 :: 		else if(pattern==4) addr=0x01FB;
	MOVF       _pattern+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_save_data27
	MOVLW      251
	MOVWF      save_data_addr_L0+0
	MOVLW      1
	MOVWF      save_data_addr_L0+1
	GOTO       L_save_data28
L_save_data27:
;EEPROM.c,55 :: 		else if(pattern==5) addr=0x0202;
	MOVF       _pattern+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_save_data29
	MOVLW      2
	MOVWF      save_data_addr_L0+0
	MOVLW      2
	MOVWF      save_data_addr_L0+1
	GOTO       L_save_data30
L_save_data29:
;EEPROM.c,56 :: 		else if(pattern==6) addr=0x0209;
	MOVF       _pattern+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_save_data31
	MOVLW      9
	MOVWF      save_data_addr_L0+0
	MOVLW      2
	MOVWF      save_data_addr_L0+1
L_save_data31:
L_save_data30:
L_save_data28:
L_save_data26:
L_save_data24:
L_save_data22:
;EEPROM.c,61 :: 		for(j=0;j<7;j++)
	CLRF       save_data_j_L0+0
L_save_data32:
	MOVLW      7
	SUBWF      save_data_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_save_data33
;EEPROM.c,63 :: 		if(pattern<=3)
	MOVF       _pattern+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_save_data35
;EEPROM.c,64 :: 		inten[j]=read_I2C(0xA0,(addr+(7*tim)+j));  //for pattern0,1,2,3
	MOVLW      save_data_inten_L0+0
	MOVWF      FLOC__save_data+0
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FLOC__save_data+1
	MOVF       save_data_j_L0+0, 0
	ADDWF      FLOC__save_data+0, 1
	BTFSC      STATUS+0, 0
	INCF       FLOC__save_data+1, 1
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      7
	MOVWF      R0
	MOVF       FARG_save_data_tim+0, 0
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	ADDWF      save_data_addr_L0+0, 0
	MOVWF      FARG_read_I2C_buff_add+0
	MOVF       R1, 0
	ADDWFC     save_data_addr_L0+1, 0
	MOVWF      FARG_read_I2C_buff_add+1
	MOVF       save_data_j_L0+0, 0
	ADDWF      FARG_read_I2C_buff_add+0, 1
	MOVLW      0
	ADDWFC     FARG_read_I2C_buff_add+1, 1
	CALL       _read_I2C+0
	MOVF       FLOC__save_data+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__save_data+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	GOTO       L_save_data36
L_save_data35:
;EEPROM.c,66 :: 		inten[j]=read_I2C(0XA0,(addr+j));          //for pattern4,5,6
	MOVLW      save_data_inten_L0+0
	MOVWF      FLOC__save_data+0
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FLOC__save_data+1
	MOVF       save_data_j_L0+0, 0
	ADDWF      FLOC__save_data+0, 1
	BTFSC      STATUS+0, 0
	INCF       FLOC__save_data+1, 1
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVF       save_data_j_L0+0, 0
	ADDWF      save_data_addr_L0+0, 0
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	ADDWFC     save_data_addr_L0+1, 0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       FLOC__save_data+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__save_data+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
L_save_data36:
;EEPROM.c,68 :: 		if(j==0) PWM1_Set_Duty(inten[j]*100);
	MOVF       save_data_j_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_save_data37
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
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
	GOTO       L_save_data38
L_save_data37:
;EEPROM.c,69 :: 		else if(j==1) PWM2_Set_Duty(inten[j]*100);
	MOVF       save_data_j_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data39
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
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
	GOTO       L_save_data40
L_save_data39:
;EEPROM.c,70 :: 		else if(j==2) PWM3_Set_Duty(inten[j]*100);
	MOVF       save_data_j_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_save_data41
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
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
	GOTO       L_save_data42
L_save_data41:
;EEPROM.c,71 :: 		else if(j==3) PWM4_Set_Duty(inten[j]*100);
	MOVF       save_data_j_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_save_data43
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
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
	GOTO       L_save_data44
L_save_data43:
;EEPROM.c,72 :: 		else if(j==4) write_I2C(0xD2,0x01,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_save_data45
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data46
L_save_data45:
;EEPROM.c,73 :: 		else if(j==5) write_I2C(0xD2,0x02,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_save_data47
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_save_data47:
L_save_data46:
L_save_data44:
L_save_data42:
L_save_data40:
L_save_data38:
;EEPROM.c,61 :: 		for(j=0;j<7;j++)
	INCF       save_data_j_L0+0, 1
;EEPROM.c,74 :: 		}
	GOTO       L_save_data32
L_save_data33:
;EEPROM.c,76 :: 		ByteToStr(inten[0]*10,val);  lcd_out(1,3,val+1);
	MOVF       save_data_inten_L0+0, 0
	MOVWF      R0
	MOVLW      10
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      save_data_val_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(save_data_val_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      save_data_val_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(save_data_val_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,77 :: 		ByteToStr(inten[1]*10,val);  lcd_out(1,9,val+1);
	MOVF       save_data_inten_L0+1, 0
	MOVWF      R0
	MOVLW      10
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      save_data_val_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(save_data_val_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      save_data_val_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(save_data_val_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,78 :: 		ByteToStr(inten[2]*10,val);  lcd_out(1,15,val+1);
	MOVF       save_data_inten_L0+2, 0
	MOVWF      R0
	MOVLW      10
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      save_data_val_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(save_data_val_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      save_data_val_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(save_data_val_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,79 :: 		ByteToStr(inten[3]*10,val);  lcd_out(2,3,val+1);
	MOVF       save_data_inten_L0+3, 0
	MOVWF      R0
	MOVLW      10
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      save_data_val_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(save_data_val_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      save_data_val_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(save_data_val_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,80 :: 		ByteToStr(inten[4]*10,val);  lcd_out(2,9,val+1);
	MOVF       save_data_inten_L0+4, 0
	MOVWF      R0
	MOVLW      10
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      save_data_val_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(save_data_val_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      save_data_val_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(save_data_val_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,81 :: 		ByteToStr(inten[5]*10,val);  lcd_out(2,15,val+1);
	MOVF       save_data_inten_L0+5, 0
	MOVWF      R0
	MOVLW      10
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      save_data_val_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(save_data_val_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      save_data_val_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(save_data_val_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,83 :: 		lcd_cmd(_LCD_UNDERLINE_ON);
	MOVLW      14
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,84 :: 		for(j=0;j<6;j++)
	CLRF       save_data_j_L0+0
L_save_data48:
	MOVLW      6
	SUBWF      save_data_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_save_data49
;EEPROM.c,86 :: 		if(j==0){row=1 ; col=3;}
	MOVF       save_data_j_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_save_data51
	MOVLW      1
	MOVWF      save_data_row_L0+0
	MOVLW      3
	MOVWF      save_data_col_L0+0
	GOTO       L_save_data52
L_save_data51:
;EEPROM.c,87 :: 		else if(j==1){row=1; col=9;}
	MOVF       save_data_j_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data53
	MOVLW      1
	MOVWF      save_data_row_L0+0
	MOVLW      9
	MOVWF      save_data_col_L0+0
	GOTO       L_save_data54
L_save_data53:
;EEPROM.c,88 :: 		else if(j==2){row=1 ; col=15;}
	MOVF       save_data_j_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_save_data55
	MOVLW      1
	MOVWF      save_data_row_L0+0
	MOVLW      15
	MOVWF      save_data_col_L0+0
	GOTO       L_save_data56
L_save_data55:
;EEPROM.c,89 :: 		else if(j==3){row=2 ; col=3;}
	MOVF       save_data_j_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_save_data57
	MOVLW      2
	MOVWF      save_data_row_L0+0
	MOVLW      3
	MOVWF      save_data_col_L0+0
	GOTO       L_save_data58
L_save_data57:
;EEPROM.c,90 :: 		else if(j==4){row=2; col=9;}
	MOVF       save_data_j_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_save_data59
	MOVLW      2
	MOVWF      save_data_row_L0+0
	MOVLW      9
	MOVWF      save_data_col_L0+0
	GOTO       L_save_data60
L_save_data59:
;EEPROM.c,91 :: 		else if(j==5){row=2; col=15;}
	MOVF       save_data_j_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_save_data61
	MOVLW      2
	MOVWF      save_data_row_L0+0
	MOVLW      15
	MOVWF      save_data_col_L0+0
L_save_data61:
L_save_data60:
L_save_data58:
L_save_data56:
L_save_data54:
L_save_data52:
;EEPROM.c,92 :: 		while(ENTER)
L_save_data62:
	BTFSS      PORTA+0, 5
	GOTO       L_save_data63
;EEPROM.c,94 :: 		if(!UP)
	BTFSC      PORTA+0, 1
	GOTO       L_save_data64
;EEPROM.c,96 :: 		inten[j]++;
	MOVLW      save_data_inten_L0+0
	MOVWF      R1
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      R2
	MOVF       save_data_j_L0+0, 0
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
;EEPROM.c,97 :: 		if(inten[j]>9) inten[j]=0;
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVLW      128
	XORLW      9
	MOVWF      R0
	MOVLW      128
	XORWF      INDF0+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_save_data65
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR1H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
L_save_data65:
;EEPROM.c,98 :: 		ByteToStr((inten[j])*10,val);
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      10
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      save_data_val_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(save_data_val_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;EEPROM.c,99 :: 		lcd_out(row,col,val+1);
	MOVF       save_data_row_L0+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       save_data_col_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      save_data_val_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(save_data_val_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,100 :: 		flag=1;
	MOVLW      1
	MOVWF      save_data_flag_L0+0
;EEPROM.c,101 :: 		while(!UP);
L_save_data66:
	BTFSC      PORTA+0, 1
	GOTO       L_save_data67
	GOTO       L_save_data66
L_save_data67:
;EEPROM.c,102 :: 		}
	GOTO       L_save_data68
L_save_data64:
;EEPROM.c,103 :: 		else if(!DOWN)
	BTFSC      PORTA+0, 4
	GOTO       L_save_data69
;EEPROM.c,105 :: 		inten[j]--;
	MOVLW      save_data_inten_L0+0
	MOVWF      R1
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      R2
	MOVF       save_data_j_L0+0, 0
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
;EEPROM.c,106 :: 		if(inten[j]<0) inten[j]=9;
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVLW      128
	XORWF      INDF0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_save_data70
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR1L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR1H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVLW      9
	MOVWF      INDF1+0
L_save_data70:
;EEPROM.c,107 :: 		ByteToStr((inten[j])*10,val);
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVLW      10
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      save_data_val_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(save_data_val_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;EEPROM.c,108 :: 		lcd_out(row,col,val+1);
	MOVF       save_data_row_L0+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       save_data_col_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      save_data_val_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(save_data_val_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;EEPROM.c,109 :: 		flag=1;
	MOVLW      1
	MOVWF      save_data_flag_L0+0
;EEPROM.c,110 :: 		while(!DOWN);
L_save_data71:
	BTFSC      PORTA+0, 4
	GOTO       L_save_data72
	GOTO       L_save_data71
L_save_data72:
;EEPROM.c,111 :: 		}
	GOTO       L_save_data73
L_save_data69:
;EEPROM.c,112 :: 		else if(!MENU) break;
	BTFSC      PORTA+0, 0
	GOTO       L_save_data74
	GOTO       L_save_data63
L_save_data74:
L_save_data73:
L_save_data68:
;EEPROM.c,113 :: 		if(flag==1)
	MOVF       save_data_flag_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data75
;EEPROM.c,115 :: 		flag=0;
	CLRF       save_data_flag_L0+0
;EEPROM.c,116 :: 		if(j==0) PWM1_Set_Duty(inten[j]*100);
	MOVF       save_data_j_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_save_data76
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
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
	GOTO       L_save_data77
L_save_data76:
;EEPROM.c,117 :: 		else if(j==1) PWM2_Set_Duty(inten[j]*100);
	MOVF       save_data_j_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data78
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
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
	GOTO       L_save_data79
L_save_data78:
;EEPROM.c,118 :: 		else if(j==2) PWM3_Set_Duty(inten[j]*100);
	MOVF       save_data_j_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_save_data80
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
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
	GOTO       L_save_data81
L_save_data80:
;EEPROM.c,119 :: 		else if(j==3) PWM4_Set_Duty(inten[j]*100);
	MOVF       save_data_j_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_save_data82
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
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
	GOTO       L_save_data83
L_save_data82:
;EEPROM.c,120 :: 		else if(j==4) write_I2C(0xD2,0x01,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_save_data84
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data85
L_save_data84:
;EEPROM.c,121 :: 		else if(j==5) write_I2C(0xD2,0x02,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_save_data86
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_save_data86:
L_save_data85:
L_save_data83:
L_save_data81:
L_save_data79:
L_save_data77:
;EEPROM.c,122 :: 		}
L_save_data75:
;EEPROM.c,123 :: 		}
	GOTO       L_save_data62
L_save_data63:
;EEPROM.c,124 :: 		while(!ENTER);
L_save_data87:
	BTFSC      PORTA+0, 5
	GOTO       L_save_data88
	GOTO       L_save_data87
L_save_data88:
;EEPROM.c,125 :: 		while(!MENU);
L_save_data89:
	BTFSC      PORTA+0, 0
	GOTO       L_save_data90
	GOTO       L_save_data89
L_save_data90:
;EEPROM.c,126 :: 		if(pattern<=3)
	MOVF       _pattern+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_save_data91
;EEPROM.c,127 :: 		write_I2C(0xA0,(addr+(7*tim)+j),inten[j]);
	MOVLW      160
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      7
	MOVWF      R0
	MOVF       FARG_save_data_tim+0, 0
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	ADDWF      save_data_addr_L0+0, 0
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVF       R1, 0
	ADDWFC     save_data_addr_L0+1, 0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDWF      FARG_write_I2C_buf_addr+0, 1
	MOVLW      0
	ADDWFC     FARG_write_I2C_buf_addr+1, 1
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data92
L_save_data91:
;EEPROM.c,129 :: 		write_I2C(0xA0,(addr+j),inten[j]);          //for pattern4,5,6
	MOVLW      160
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVF       save_data_j_L0+0, 0
	ADDWF      save_data_addr_L0+0, 0
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	ADDWFC     save_data_addr_L0+1, 0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      save_data_inten_L0+0
	MOVWF      FSR0L
	MOVLW      hi_addr(save_data_inten_L0+0)
	MOVWF      FSR0H
	MOVF       save_data_j_L0+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_save_data92:
;EEPROM.c,84 :: 		for(j=0;j<6;j++)
	INCF       save_data_j_L0+0, 1
;EEPROM.c,131 :: 		}
	GOTO       L_save_data48
L_save_data49:
;EEPROM.c,132 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,133 :: 		}
L_end_save_data:
	RETURN
; end of _save_data
