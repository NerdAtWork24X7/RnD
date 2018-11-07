
_sel_patt:

;EEPROM.c,18 :: 		void sel_patt()
;EEPROM.c,20 :: 		s8 i=0;
	CLRF       sel_patt_i_L0+0
;EEPROM.c,23 :: 		while(!ENTER);
L_sel_patt0:
	BTFSC      PORTB+0, 3
	GOTO       L_sel_patt1
	GOTO       L_sel_patt0
L_sel_patt1:
;EEPROM.c,24 :: 		while(ENTER)
L_sel_patt2:
	BTFSS      PORTB+0, 3
	GOTO       L_sel_patt3
;EEPROM.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,27 :: 		Constant_to_temp(disp_patt) ;Lcd_Out(1,6,temp);
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
;EEPROM.c,28 :: 		Constant_to_temp(patt[i]);  Lcd_Out(2,1,temp);
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
L__sel_patt100:
	BTFSC      STATUS+0, 2
	GOTO       L__sel_patt101
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__sel_patt100
L__sel_patt101:
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
;EEPROM.c,29 :: 		Lcd_Chr(1,16,'^');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      94
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,30 :: 		Lcd_Chr(2,16,'v');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      118
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,31 :: 		while(UP&&DOWN&&ENTER&&MENU);  //wait
L_sel_patt4:
	BTFSS      PORTB+0, 1
	GOTO       L_sel_patt5
	BTFSS      PORTB+0, 2
	GOTO       L_sel_patt5
	BTFSS      PORTB+0, 3
	GOTO       L_sel_patt5
	BTFSS      PORTB+0, 0
	GOTO       L_sel_patt5
L__sel_patt91:
	GOTO       L_sel_patt4
L_sel_patt5:
;EEPROM.c,32 :: 		if(!UP){ i++; while(!UP); }//wait till button is released
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
;EEPROM.c,33 :: 		else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
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
;EEPROM.c,34 :: 		else if(!MENU) return;
	BTFSC      PORTB+0, 0
	GOTO       L_sel_patt16
	GOTO       L_end_sel_patt
L_sel_patt16:
L_sel_patt15:
L_sel_patt11:
;EEPROM.c,35 :: 		if(i<0) i=6;
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
;EEPROM.c,36 :: 		if(i>6) i=0;
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
;EEPROM.c,37 :: 		}
	GOTO       L_sel_patt2
L_sel_patt3:
;EEPROM.c,38 :: 		pattern=i;
	MOVF       sel_patt_i_L0+0, 0
	MOVWF      _pattern+0
;EEPROM.c,39 :: 		}
L_end_sel_patt:
	RETURN
; end of _sel_patt

_sel_socket:

;EEPROM.c,41 :: 		void sel_socket(u8 tim)
;EEPROM.c,43 :: 		u8 i=0,exit=0;
	CLRF       sel_socket_i_L0+0
	CLRF       sel_socket_exit_L0+0
;EEPROM.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,46 :: 		while(!MENU ||!ENTER);
L_sel_socket19:
	BTFSS      PORTB+0, 0
	GOTO       L__sel_socket94
	BTFSS      PORTB+0, 3
	GOTO       L__sel_socket94
	GOTO       L_sel_socket20
L__sel_socket94:
	GOTO       L_sel_socket19
L_sel_socket20:
;EEPROM.c,47 :: 		while(exit==0)
L_sel_socket23:
	MOVF       sel_socket_exit_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_sel_socket24
;EEPROM.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,50 :: 		Constant_to_temp(patt[pattern]+2); Lcd_Out(1,2,temp);
	MOVLW      _patt+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(_patt+0)
	MOVWF      FARG_Constant_to_temp_source+1
	MOVLW      4
	MOVWF      R2+0
	MOVF       _pattern+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	MOVF       R2+0, 0
L__sel_socket103:
	BTFSC      STATUS+0, 2
	GOTO       L__sel_socket104
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__sel_socket103
L__sel_socket104:
	MOVF       R0+0, 0
	ADDWF      FARG_Constant_to_temp_source+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_Constant_to_temp_source+1, 1
	MOVLW      2
	ADDWF      FARG_Constant_to_temp_source+0, 1
	BTFSC      STATUS+0, 0
	INCF       FARG_Constant_to_temp_source+1, 1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,51 :: 		lcd_chr(2,1,i+49);lcd_chr(2,2,'.');                                //no of socket
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      49
	ADDWF      sel_socket_i_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      46
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,52 :: 		Constant_to_temp(disp_txt); Lcd_Out(2,3,temp);
	MOVLW      sel_socket_disp_txt_L0+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(sel_socket_disp_txt_L0+0)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,53 :: 		lcd_chr(2,9,i+49);
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      49
	ADDWF      sel_socket_i_L0+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,54 :: 		Lcd_Chr(1,16,'^');                                                 //no of socket
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      94
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,55 :: 		Lcd_Chr(2,16,'v');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      118
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,56 :: 		while(UP&&DOWN&&ENTER&&MENU);  //wait
L_sel_socket25:
	BTFSS      PORTB+0, 1
	GOTO       L_sel_socket26
	BTFSS      PORTB+0, 2
	GOTO       L_sel_socket26
	BTFSS      PORTB+0, 3
	GOTO       L_sel_socket26
	BTFSS      PORTB+0, 0
	GOTO       L_sel_socket26
L__sel_socket93:
	GOTO       L_sel_socket25
L_sel_socket26:
;EEPROM.c,57 :: 		if(!UP){ i++; while(!UP); }//wait till button is released
	BTFSC      PORTB+0, 1
	GOTO       L_sel_socket29
	INCF       sel_socket_i_L0+0, 1
L_sel_socket30:
	BTFSC      PORTB+0, 1
	GOTO       L_sel_socket31
	GOTO       L_sel_socket30
L_sel_socket31:
	GOTO       L_sel_socket32
L_sel_socket29:
;EEPROM.c,58 :: 		else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
	BTFSC      PORTB+0, 2
	GOTO       L_sel_socket33
	DECF       sel_socket_i_L0+0, 1
L_sel_socket34:
	BTFSC      PORTB+0, 2
	GOTO       L_sel_socket35
	GOTO       L_sel_socket34
L_sel_socket35:
	GOTO       L_sel_socket36
L_sel_socket33:
;EEPROM.c,59 :: 		else if(!ENTER)
	BTFSC      PORTB+0, 3
	GOTO       L_sel_socket37
;EEPROM.c,61 :: 		save_data(i,tim);
	MOVF       sel_socket_i_L0+0, 0
	MOVWF      FARG_save_data+0
	MOVF       FARG_sel_socket_tim+0, 0
	MOVWF      FARG_save_data+0
	CALL       _save_data+0
;EEPROM.c,62 :: 		}
	GOTO       L_sel_socket38
L_sel_socket37:
;EEPROM.c,63 :: 		else if(!MENU) return;
	BTFSC      PORTB+0, 0
	GOTO       L_sel_socket39
	GOTO       L_end_sel_socket
L_sel_socket39:
L_sel_socket38:
L_sel_socket36:
L_sel_socket32:
;EEPROM.c,64 :: 		if(i<0) i=4;
	MOVLW      0
	SUBWF      sel_socket_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sel_socket40
	MOVLW      4
	MOVWF      sel_socket_i_L0+0
L_sel_socket40:
;EEPROM.c,65 :: 		if(i>4) i=0;
	MOVF       sel_socket_i_L0+0, 0
	SUBLW      4
	BTFSC      STATUS+0, 0
	GOTO       L_sel_socket41
	CLRF       sel_socket_i_L0+0
L_sel_socket41:
;EEPROM.c,66 :: 		}
	GOTO       L_sel_socket23
L_sel_socket24:
;EEPROM.c,67 :: 		while(!MENU || !ENTER);
L_sel_socket42:
	BTFSS      PORTB+0, 0
	GOTO       L__sel_socket92
	BTFSS      PORTB+0, 3
	GOTO       L__sel_socket92
	GOTO       L_sel_socket43
L__sel_socket92:
	GOTO       L_sel_socket42
L_sel_socket43:
;EEPROM.c,70 :: 		}
L_end_sel_socket:
	RETURN
; end of _sel_socket

_save_data:

;EEPROM.c,74 :: 		void save_data(u8 soc_no,u8 tim)
;EEPROM.c,76 :: 		u8 flag=0,i=0,exit=0;
	CLRF       save_data_i_L0+0
	CLRF       save_data_exit_L0+0
;EEPROM.c,80 :: 		while(!ENTER || !MENU);
L_save_data46:
	BTFSS      PORTB+0, 3
	GOTO       L__save_data98
	BTFSS      PORTB+0, 0
	GOTO       L__save_data98
	GOTO       L_save_data47
L__save_data98:
	GOTO       L_save_data46
L_save_data47:
;EEPROM.c,81 :: 		if(pattern==1) addr=0x0000;
	MOVF       _pattern+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_save_data50
	CLRF       save_data_addr_L0+0
	CLRF       save_data_addr_L0+1
	GOTO       L_save_data51
L_save_data50:
;EEPROM.c,82 :: 		else if(pattern==2) addr=0x00A9;
	MOVF       _pattern+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_save_data52
	MOVLW      169
	MOVWF      save_data_addr_L0+0
	CLRF       save_data_addr_L0+1
	GOTO       L_save_data53
L_save_data52:
;EEPROM.c,83 :: 		else if(pattern==3) addr=0x0152;
	MOVF       _pattern+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_save_data54
	MOVLW      82
	MOVWF      save_data_addr_L0+0
	MOVLW      1
	MOVWF      save_data_addr_L0+1
	GOTO       L_save_data55
L_save_data54:
;EEPROM.c,84 :: 		else if(pattern==4) addr=0x01FB;
	MOVF       _pattern+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_save_data56
	MOVLW      251
	MOVWF      save_data_addr_L0+0
	MOVLW      1
	MOVWF      save_data_addr_L0+1
	GOTO       L_save_data57
L_save_data56:
;EEPROM.c,85 :: 		else if(pattern==5) addr=0x0202;
	MOVF       _pattern+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_save_data58
	MOVLW      2
	MOVWF      save_data_addr_L0+0
	MOVLW      2
	MOVWF      save_data_addr_L0+1
	GOTO       L_save_data59
L_save_data58:
;EEPROM.c,86 :: 		else if(pattern==6) addr=0x0209;
	MOVF       _pattern+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_save_data60
	MOVLW      9
	MOVWF      save_data_addr_L0+0
	MOVLW      2
	MOVWF      save_data_addr_L0+1
L_save_data60:
L_save_data59:
L_save_data57:
L_save_data55:
L_save_data53:
L_save_data51:
;EEPROM.c,89 :: 		if(pattern<=3)
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _pattern+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_save_data61
;EEPROM.c,90 :: 		inten[soc_no]=read_I2C(0xA0,(addr+(7*tim)+soc_no));  //for pattern0,1,2,3
	MOVF       FARG_save_data_soc_no+0, 0
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
	MOVF       FARG_save_data_soc_no+0, 0
	ADDWF      FARG_read_I2C_buff_add+0, 1
	BTFSC      STATUS+0, 0
	INCF       FARG_read_I2C_buff_add+1, 1
	CALL       _read_I2C+0
	MOVF       FLOC__save_data+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	GOTO       L_save_data62
L_save_data61:
;EEPROM.c,92 :: 		inten[soc_no]=read_I2C(0XA0,(addr+soc_no));          //for pattern4,5,6
	MOVF       FARG_save_data_soc_no+0, 0
	ADDLW      _inten+0
	MOVWF      FLOC__save_data+0
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVF       FARG_save_data_soc_no+0, 0
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
L_save_data62:
;EEPROM.c,94 :: 		if(inten[soc_no]>4 || inten[soc_no]<0) inten[soc_no]=0;                     //Check for valid option
	MOVF       FARG_save_data_soc_no+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVLW      128
	XORLW      4
	MOVWF      R0+0
	MOVLW      128
	XORWF      INDF+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__save_data97
	MOVF       FARG_save_data_soc_no+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVLW      128
	XORWF      INDF+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__save_data97
	GOTO       L_save_data65
L__save_data97:
	MOVF       FARG_save_data_soc_no+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	CLRF       INDF+0
L_save_data65:
;EEPROM.c,95 :: 		i=inten[soc_no];
	MOVF       FARG_save_data_soc_no+0, 0
	ADDLW      _inten+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      save_data_i_L0+0
;EEPROM.c,97 :: 		while(exit==0)
L_save_data66:
	MOVF       save_data_exit_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_save_data67
;EEPROM.c,99 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,100 :: 		Constant_to_temp(patt[pattern]+2); Lcd_Out(1,2,temp);
	MOVLW      _patt+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(_patt+0)
	MOVWF      FARG_Constant_to_temp_source+1
	MOVLW      4
	MOVWF      R2+0
	MOVF       _pattern+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	MOVF       R2+0, 0
L__save_data106:
	BTFSC      STATUS+0, 2
	GOTO       L__save_data107
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__save_data106
L__save_data107:
	MOVF       R0+0, 0
	ADDWF      FARG_Constant_to_temp_source+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      FARG_Constant_to_temp_source+1, 1
	MOVLW      2
	ADDWF      FARG_Constant_to_temp_source+0, 1
	BTFSC      STATUS+0, 0
	INCF       FARG_Constant_to_temp_source+1, 1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,101 :: 		Constant_to_temp(disp_txt[i]); Lcd_Out(2,1,temp);
	MOVLW      20
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       save_data_i_L0+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      save_data_disp_txt_L0+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(save_data_disp_txt_L0+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,102 :: 		Lcd_Chr(1,16,'^');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      94
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,103 :: 		Lcd_Chr(2,16,'v');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      118
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;EEPROM.c,104 :: 		while(UP&&DOWN&&ENTER&&MENU);  //wait
L_save_data68:
	BTFSS      PORTB+0, 1
	GOTO       L_save_data69
	BTFSS      PORTB+0, 2
	GOTO       L_save_data69
	BTFSS      PORTB+0, 3
	GOTO       L_save_data69
	BTFSS      PORTB+0, 0
	GOTO       L_save_data69
L__save_data96:
	GOTO       L_save_data68
L_save_data69:
;EEPROM.c,105 :: 		if(!UP){ i++; while(!UP); }//wait till button is released
	BTFSC      PORTB+0, 1
	GOTO       L_save_data72
	INCF       save_data_i_L0+0, 1
L_save_data73:
	BTFSC      PORTB+0, 1
	GOTO       L_save_data74
	GOTO       L_save_data73
L_save_data74:
	GOTO       L_save_data75
L_save_data72:
;EEPROM.c,106 :: 		else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
	BTFSC      PORTB+0, 2
	GOTO       L_save_data76
	DECF       save_data_i_L0+0, 1
L_save_data77:
	BTFSC      PORTB+0, 2
	GOTO       L_save_data78
	GOTO       L_save_data77
L_save_data78:
	GOTO       L_save_data79
L_save_data76:
;EEPROM.c,107 :: 		else if(!ENTER){flag=1; break;}
	BTFSC      PORTB+0, 3
	GOTO       L_save_data80
	GOTO       L_save_data67
L_save_data80:
;EEPROM.c,108 :: 		else if(!MENU) return;
	BTFSC      PORTB+0, 0
	GOTO       L_save_data82
	GOTO       L_end_save_data
L_save_data82:
L_save_data79:
L_save_data75:
;EEPROM.c,109 :: 		if(i<0) i=4;
	MOVLW      0
	SUBWF      save_data_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_save_data83
	MOVLW      4
	MOVWF      save_data_i_L0+0
L_save_data83:
;EEPROM.c,110 :: 		if(i>4) i=0;
	MOVF       save_data_i_L0+0, 0
	SUBLW      4
	BTFSC      STATUS+0, 0
	GOTO       L_save_data84
	CLRF       save_data_i_L0+0
L_save_data84:
;EEPROM.c,111 :: 		}
	GOTO       L_save_data66
L_save_data67:
;EEPROM.c,112 :: 		while(!MENU || !ENTER);
L_save_data85:
	BTFSS      PORTB+0, 0
	GOTO       L__save_data95
	BTFSS      PORTB+0, 3
	GOTO       L__save_data95
	GOTO       L_save_data86
L__save_data95:
	GOTO       L_save_data85
L_save_data86:
;EEPROM.c,115 :: 		if(pattern<=3)
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _pattern+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_save_data89
;EEPROM.c,116 :: 		write_I2C(0xA0,(addr+(7*tim)+soc_no),i);
	MOVLW      160
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
	MOVF       FARG_save_data_soc_no+0, 0
	ADDWF      FARG_write_I2C_buf_addr+0, 1
	BTFSC      STATUS+0, 0
	INCF       FARG_write_I2C_buf_addr+1, 1
	MOVF       save_data_i_L0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
	GOTO       L_save_data90
L_save_data89:
;EEPROM.c,118 :: 		write_I2C(0xA0,(addr+soc_no),i);          //for pattern4,5,6
	MOVLW      160
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVF       FARG_save_data_soc_no+0, 0
	ADDWF      save_data_addr_L0+0, 0
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVF       save_data_addr_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       save_data_i_L0+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
L_save_data90:
;EEPROM.c,120 :: 		}
L_end_save_data:
	RETURN
; end of _save_data
