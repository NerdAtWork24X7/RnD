
_sel_patt:

;EEPROM.c,16 :: 		void sel_patt()
;EEPROM.c,18 :: 		s8 i=0;
	CLRF       sel_patt_i_L0+0
;EEPROM.c,20 :: 		while(!ENTER);
L_sel_patt0:
	BTFSC      PORTB+0, 3
	GOTO       L_sel_patt1
	GOTO       L_sel_patt0
L_sel_patt1:
;EEPROM.c,21 :: 		while(ENTER)
L_sel_patt2:
	BTFSS      PORTB+0, 3
	GOTO       L_sel_patt3
;EEPROM.c,23 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,24 :: 		Constant_to_temp(disp_patt) ;Lcd_Out(1,6,temp);
	MOVLW      sel_patt_disp_patt_L0+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(sel_patt_disp_patt_L0+0)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,25 :: 		Constant_to_temp(patt[i]);  Lcd_Out(2,1,temp);
	MOVLW      _patt+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(_patt+0)
	MOVWF      FARG_Constant_to_temp_source+1
	MOVLW      4
	MOVWF      R2+0
	MOVF       sel_patt_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	MOVF       R2+0, 0
L__sel_patt96:
	BTFSC      STATUS+0, 2
	GOTO       L__sel_patt97
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__sel_patt96
L__sel_patt97:
	MOVF       R0+0, 0
	ADDWF      FARG_Constant_to_temp_source+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_Constant_to_temp_source+1, 1
	CALL       _Constant_to_temp+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,26 :: 		Lcd_Chr(1,16,'^');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      94
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,27 :: 		Lcd_Chr(2,16,'v');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      118
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,28 :: 		while(UP&&DOWN&&ENTER&&MENU);  //wait
L_sel_patt4:
	BTFSS      PORTB+0, 1
	GOTO       L_sel_patt5
	BTFSS      PORTB+0, 2
	GOTO       L_sel_patt5
	BTFSS      PORTB+0, 3
	GOTO       L_sel_patt5
	BTFSS      PORTB+0, 0
	GOTO       L_sel_patt5
L__sel_patt94:
	GOTO       L_sel_patt4
L_sel_patt5:
;EEPROM.c,29 :: 		if(!UP){ i++; while(!UP); }//wait till button is released
	BTFSC      PORTB+0, 1
	GOTO       L_sel_patt8
	INCF       sel_patt_i_L0+0, 1
L_sel_patt9:
	BTFSC      PORTB+0, 1
	GOTO       L_sel_patt10
	GOTO       L_sel_patt9
L_sel_patt10:
	GOTO       L_sel_patt11
L_sel_patt8:
;EEPROM.c,30 :: 		else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
	BTFSC      PORTB+0, 2
	GOTO       L_sel_patt12
	DECF       sel_patt_i_L0+0, 1
L_sel_patt13:
	BTFSC      PORTB+0, 2
	GOTO       L_sel_patt14
	GOTO       L_sel_patt13
L_sel_patt14:
	GOTO       L_sel_patt15
L_sel_patt12:
;EEPROM.c,31 :: 		else if(!MENU) break;
	BTFSC      PORTB+0, 0
	GOTO       L_sel_patt16
	GOTO       L_sel_patt3
L_sel_patt16:
L_sel_patt15:
L_sel_patt11:
;EEPROM.c,32 :: 		if(i<0) i=6;
	MOVLW      128
	XORWF      sel_patt_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sel_patt17
	MOVLW      6
	MOVWF      sel_patt_i_L0+0
L_sel_patt17:
;EEPROM.c,33 :: 		if(i>6) i=0;
	MOVLW      128
	XORLW      6
	MOVWF      R0+0
	MOVLW      128
	XORWF      sel_patt_i_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sel_patt18
	CLRF       sel_patt_i_L0+0
L_sel_patt18:
;EEPROM.c,34 :: 		}
	GOTO       L_sel_patt2
L_sel_patt3:
;EEPROM.c,35 :: 		while(!MENU);
L_sel_patt19:
	BTFSC      PORTB+0, 0
	GOTO       L_sel_patt20
	GOTO       L_sel_patt19
L_sel_patt20:
;EEPROM.c,36 :: 		pattern=i;
	MOVF       sel_patt_i_L0+0, 0
	MOVWF      _pattern+0
;EEPROM.c,38 :: 		}
L_end_sel_patt:
	RETURN
; end of _sel_patt

_save_data:

;EEPROM.c,43 :: 		void save_data(u8 tim)
;EEPROM.c,45 :: 		u8 flag=0,sin_flag=0,j,row=0,col=0;
	CLRF       save_data_flag_L0+0
	CLRF       save_data_sin_flag_L0+0
	CLRF       save_data_row_L0+0
	CLRF       save_data_col_L0+0
;EEPROM.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,50 :: 		Constant_to_temp(disp_txt[0]); lcd_out(1,1,temp);
	MOVLW      save_data_disp_txt_L0+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(save_data_disp_txt_L0+0)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,51 :: 		Constant_to_temp(disp_txt[1]); lcd_out(1,7,temp);
	MOVLW      save_data_disp_txt_L0+4
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(save_data_disp_txt_L0+4)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,52 :: 		Constant_to_temp(disp_txt[2]); lcd_out(1,13,temp);
	MOVLW      save_data_disp_txt_L0+8
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(save_data_disp_txt_L0+8)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,53 :: 		Constant_to_temp(disp_txt[3]); lcd_out(2,1,temp);
	MOVLW      save_data_disp_txt_L0+12
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(save_data_disp_txt_L0+12)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,54 :: 		Constant_to_temp(disp_txt[4]); lcd_out(2,7,temp);
	MOVLW      save_data_disp_txt_L0+16
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(save_data_disp_txt_L0+16)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,55 :: 		Constant_to_temp(disp_txt[5]); lcd_out(2,13,temp);
	MOVLW      save_data_disp_txt_L0+20
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(save_data_disp_txt_L0+20)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,57 :: 		if(pattern==1) addr=0x0000;
	MOVF       _pattern+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data21
	CLRF       save_data_addr_L0+0
	CLRF       save_data_addr_L0+1
	GOTO       L_save_data22
L_save_data21:
;EEPROM.c,58 :: 		else if(pattern==2) addr=0x00A9;
	MOVF       _pattern+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_save_data23
	MOVLW      169
	MOVWF      save_data_addr_L0+0
	CLRF       save_data_addr_L0+1
	GOTO       L_save_data24
L_save_data23:
;EEPROM.c,59 :: 		else if(pattern==3) addr=0x0152;
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
;EEPROM.c,60 :: 		else if(pattern==4) addr=0x01FB;
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
;EEPROM.c,61 :: 		else if(pattern==5) addr=0x0202;
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
;EEPROM.c,62 :: 		else if(pattern==6) addr=0x0209;
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
;EEPROM.c,67 :: 		for(j=0;j<7;j++)
	CLRF       save_data_j_L0+0
L_save_data32:
	MOVLW      7
	SUBWF      save_data_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_save_data33
;EEPROM.c,69 :: 		if(pattern<=3)
	MOVF       _pattern+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_save_data35
;EEPROM.c,70 :: 		inten[j]=read_I2C(0xA0,(addr+(7*tim)+j));  //for pattern0,1,2,3
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FLOC__save_data+0
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      7
	MOVWF      R0+0
	MOVF       FARG_save_data_tim+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDWF      save_data_addr_L0+0, 0
	MOVWF      FARG_read_I2C_buff_add+0
	MOVF       save_data_addr_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_read_I2C_buff_add+1
	MOVF       save_data_j_L0+0, 0
	ADDWF      FARG_read_I2C_buff_add+0, 1
	BTFSC      STATUS+0, 0
	INCF       FARG_read_I2C_buff_add+1, 1
	CALL       _read_I2C+0
	MOVF       FLOC__save_data+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	GOTO       L_save_data36
L_save_data35:
;EEPROM.c,72 :: 		inten[j]=read_I2C(0XA0,(addr+j));          //for pattern4,5,6
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FLOC__save_data+0
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVF       save_data_j_L0+0, 0
	ADDWF      save_data_addr_L0+0, 0
	MOVWF      FARG_read_I2C_buff_add+0
	MOVF       save_data_addr_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       FLOC__save_data+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_save_data36:
;EEPROM.c,74 :: 		if(j==0) PWM1_Set_Duty(inten[j]*25);
	MOVF       save_data_j_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_save_data37
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      25
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
	GOTO       L_save_data38
L_save_data37:
;EEPROM.c,75 :: 		else if(j==1) PWM2_Set_Duty(inten[j]*25);
	MOVF       save_data_j_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data39
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      25
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	GOTO       L_save_data40
L_save_data39:
;EEPROM.c,76 :: 		else if(j==2) write_I2C(0xE0,0x01,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_save_data41
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data42
L_save_data41:
;EEPROM.c,77 :: 		else if(j==3) write_I2C(0xE0,0x02,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_save_data43
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data44
L_save_data43:
;EEPROM.c,78 :: 		else if(j==4) write_I2C(0xE0,0x03,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_save_data45
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      3
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data46
L_save_data45:
;EEPROM.c,79 :: 		else if(j==5) write_I2C(0xE0,0x04,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_save_data47
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      4
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_save_data47:
L_save_data46:
L_save_data44:
L_save_data42:
L_save_data40:
L_save_data38:
;EEPROM.c,67 :: 		for(j=0;j<7;j++)
	INCF       save_data_j_L0+0, 1
;EEPROM.c,80 :: 		}
	GOTO       L_save_data32
L_save_data33:
;EEPROM.c,82 :: 		ByteToStr(inten[0]*10,val);  lcd_out(1,3,val+1);
	MOVF       _inten+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _val+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _val+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,83 :: 		ByteToStr(inten[1]*10,val);  lcd_out(1,9,val+1);
	MOVF       _inten+1, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _val+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _val+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,84 :: 		ByteToStr(inten[2]*10,val);  lcd_out(1,15,val+1);
	MOVF       _inten+2, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _val+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _val+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,85 :: 		ByteToStr(inten[3]*10,val);  lcd_out(2,3,val+1);
	MOVF       _inten+3, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _val+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _val+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,86 :: 		ByteToStr(inten[4]*10,val);  lcd_out(2,9,val+1);
	MOVF       _inten+4, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _val+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _val+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,87 :: 		ByteToStr(inten[5]*10,val);  lcd_out(2,15,val+1);
	MOVF       _inten+5, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _val+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      15
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _val+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,88 :: 		for(j=0;j<6;j++)
	CLRF       save_data_j_L0+0
L_save_data48:
	MOVLW      6
	SUBWF      save_data_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_save_data49
;EEPROM.c,90 :: 		if(j==0){row=1 ; col=3;}
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
;EEPROM.c,91 :: 		else if(j==1){row=1; col=9;}
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
;EEPROM.c,92 :: 		else if(j==2){row=1 ; col=15;}
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
;EEPROM.c,93 :: 		else if(j==3){row=2 ; col=3;}
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
;EEPROM.c,94 :: 		else if(j==4){row=2; col=9;}
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
;EEPROM.c,95 :: 		else if(j==5){row=2; col=15;}
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
;EEPROM.c,96 :: 		lcd_cmd(_LCD_UNDERLINE_ON);
	MOVLW      14
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,97 :: 		sin_flag=0;
	CLRF       save_data_sin_flag_L0+0
;EEPROM.c,98 :: 		while(ENTER)
L_save_data62:
	BTFSS      PORTB+0, 3
	GOTO       L_save_data63
;EEPROM.c,100 :: 		if(sin_flag==0)
	MOVF       save_data_sin_flag_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_save_data64
;EEPROM.c,102 :: 		ByteToStr(inten[j]*10,val);  lcd_out(row,col,val+1);
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _val+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVF       save_data_row_L0+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       save_data_col_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _val+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,103 :: 		lcd_cmd(_LCD_MOVE_CURSOR_LEFT);lcd_cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,104 :: 		}
L_save_data64:
;EEPROM.c,105 :: 		if(!UP)
	BTFSC      PORTB+0, 1
	GOTO       L_save_data65
;EEPROM.c,107 :: 		inten[j]++;
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	INCF       R0+0, 1
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;EEPROM.c,108 :: 		if(inten[j]>9) inten[j]=0;
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVLW      128
	XORLW      9
	MOVWF      R0+0
	MOVLW      128
	XORWF      INDF+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_save_data66
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	CLRF       INDF+0
L_save_data66:
;EEPROM.c,109 :: 		ByteToStr((inten[j])*10,val);
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _val+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;EEPROM.c,110 :: 		lcd_out(row,col,val+1);
	MOVF       save_data_row_L0+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       save_data_col_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _val+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,111 :: 		lcd_cmd(_LCD_MOVE_CURSOR_LEFT);lcd_cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,112 :: 		flag=1;
	MOVLW      1
	MOVWF      save_data_flag_L0+0
;EEPROM.c,113 :: 		while(!UP);
L_save_data67:
	BTFSC      PORTB+0, 1
	GOTO       L_save_data68
	GOTO       L_save_data67
L_save_data68:
;EEPROM.c,114 :: 		}
	GOTO       L_save_data69
L_save_data65:
;EEPROM.c,115 :: 		else if(!DOWN)
	BTFSC      PORTB+0, 2
	GOTO       L_save_data70
;EEPROM.c,117 :: 		inten[j]--;
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	DECF       R0+0, 1
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;EEPROM.c,118 :: 		if(inten[j]<0) inten[j]=9;
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVLW      128
	XORWF      INDF+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_save_data71
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVLW      9
	MOVWF      INDF+0
L_save_data71:
;EEPROM.c,119 :: 		ByteToStr((inten[j])*10,val);
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      10
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _val+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;EEPROM.c,120 :: 		lcd_out(row,col,val+1);
	MOVF       save_data_row_L0+0, 0
	MOVWF      FARG_Lcd_Out_row+0
	MOVF       save_data_col_L0+0, 0
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _val+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,121 :: 		lcd_cmd(_LCD_MOVE_CURSOR_LEFT);lcd_cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	MOVLW      16
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,122 :: 		flag=1;
	MOVLW      1
	MOVWF      save_data_flag_L0+0
;EEPROM.c,123 :: 		while(!DOWN);
L_save_data72:
	BTFSC      PORTB+0, 2
	GOTO       L_save_data73
	GOTO       L_save_data72
L_save_data73:
;EEPROM.c,124 :: 		}
	GOTO       L_save_data74
L_save_data70:
;EEPROM.c,125 :: 		else if(!MENU) break;
	BTFSC      PORTB+0, 0
	GOTO       L_save_data75
	GOTO       L_save_data63
L_save_data75:
L_save_data74:
L_save_data69:
;EEPROM.c,126 :: 		if(flag==1)
	MOVF       save_data_flag_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data76
;EEPROM.c,128 :: 		flag=0;
	CLRF       save_data_flag_L0+0
;EEPROM.c,129 :: 		if(j==0) PWM1_Set_Duty(inten[j]*25);
	MOVF       save_data_j_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_save_data77
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      25
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
	GOTO       L_save_data78
L_save_data77:
;EEPROM.c,130 :: 		else if(j==1) PWM2_Set_Duty(inten[j]*25);
	MOVF       save_data_j_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data79
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVLW      25
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
	GOTO       L_save_data80
L_save_data79:
;EEPROM.c,131 :: 		else if(j==2) write_I2C(0xE0,0x01,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_save_data81
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data82
L_save_data81:
;EEPROM.c,132 :: 		else if(j==3) write_I2C(0xE0,0x02,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_save_data83
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data84
L_save_data83:
;EEPROM.c,133 :: 		else if(j==4) write_I2C(0xE0,0x03,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_save_data85
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      3
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data86
L_save_data85:
;EEPROM.c,134 :: 		else if(j==5) write_I2C(0xE0,0x04,inten[j]);
	MOVF       save_data_j_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_save_data87
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      4
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_save_data87:
L_save_data86:
L_save_data84:
L_save_data82:
L_save_data80:
L_save_data78:
;EEPROM.c,135 :: 		}
L_save_data76:
;EEPROM.c,136 :: 		sin_flag=1;
	MOVLW      1
	MOVWF      save_data_sin_flag_L0+0
;EEPROM.c,137 :: 		}
	GOTO       L_save_data62
L_save_data63:
;EEPROM.c,138 :: 		while(!ENTER);
L_save_data88:
	BTFSC      PORTB+0, 3
	GOTO       L_save_data89
	GOTO       L_save_data88
L_save_data89:
;EEPROM.c,139 :: 		while(!MENU);
L_save_data90:
	BTFSC      PORTB+0, 0
	GOTO       L_save_data91
	GOTO       L_save_data90
L_save_data91:
;EEPROM.c,140 :: 		if(pattern<=3)
	MOVF       _pattern+0, 0
	SUBLW      3
	BTFSS      STATUS+0, 0
	GOTO       L_save_data92
;EEPROM.c,141 :: 		write_I2C(0xE0,(addr+(7*tim)+j),inten[j]);
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      7
	MOVWF      R0+0
	MOVF       FARG_save_data_tim+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDWF      save_data_addr_L0+0, 0
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVF       save_data_addr_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDWF      FARG_write_I2C_buf_addr+0, 1
	BTFSC      STATUS+0, 0
	INCF       FARG_write_I2C_buf_addr+1, 1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data93
L_save_data92:
;EEPROM.c,143 :: 		write_I2C(0xE0,(addr+j),inten[j]);          //for pattern4,5,6
	MOVLW      224
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVF       save_data_j_L0+0, 0
	ADDWF      save_data_addr_L0+0, 0
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVF       save_data_addr_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_j_L0+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_save_data93:
;EEPROM.c,144 :: 		sin_flag=0;
	CLRF       save_data_sin_flag_L0+0
;EEPROM.c,88 :: 		for(j=0;j<6;j++)
	INCF       save_data_j_L0+0, 1
;EEPROM.c,145 :: 		}
	GOTO       L_save_data48
L_save_data49:
;EEPROM.c,146 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,147 :: 		}
L_end_save_data:
	RETURN
; end of _save_data
