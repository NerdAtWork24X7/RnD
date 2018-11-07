
_Display_Time:

;LCD.c,34 :: 		void Display_Time()
;LCD.c,37 :: 		ByteToStr(hrs,dat);
	MOVF       _hrs+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Display_Time_dat_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;LCD.c,38 :: 		Lcd_Out(1,6,dat+1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Display_Time_dat_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,39 :: 		if(dat[1]==' ') Lcd_Chr(1,6,'0');
	MOVF       Display_Time_dat_L0+1, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_Display_Time0
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_Display_Time0:
;LCD.c,40 :: 		memset(dat,0,2);
	MOVLW      Display_Time_dat_L0+0
	MOVWF      FARG_memset_p1+0
	CLRF       FARG_memset_character+0
	MOVLW      2
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;LCD.c,41 :: 		ByteToStr(mins,dat);
	MOVF       _mins+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Display_Time_dat_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;LCD.c,42 :: 		Lcd_Out(1,9,dat+1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Display_Time_dat_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,43 :: 		if(dat[1]==' ') Lcd_Chr(1,9,'0');
	MOVF       Display_Time_dat_L0+1, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_Display_Time1
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      48
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
L_Display_Time1:
;LCD.c,44 :: 		}
L_end_Display_Time:
	RETURN
; end of _Display_Time

_init_lcd:

;LCD.c,47 :: 		void init_lcd()
;LCD.c,49 :: 		Lcd_Init();                // Initialize LCD
	CALL       _Lcd_Init+0
;LCD.c,50 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,51 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,52 :: 		Lcd_Chr(1,8,':');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,53 :: 		Constant_to_temp(patt[pattern]+2);  Lcd_out(2,1,temp);
	MOVLW      4
	MOVWF      R2+0
	MOVF       _pattern+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	MOVF       R2+0, 0
L__init_lcd123:
	BTFSC      STATUS+0, 2
	GOTO       L__init_lcd124
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__init_lcd123
L__init_lcd124:
	MOVF       R0+0, 0
	ADDLW      _patt+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(_patt+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_Constant_to_temp_source+1
	MOVLW      2
	ADDWF      FARG_Constant_to_temp_source+0, 1
	BTFSC      STATUS+0, 0
	INCF       FARG_Constant_to_temp_source+1, 1
	CALL       _Constant_to_temp+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,56 :: 		}
L_end_init_lcd:
	RETURN
; end of _init_lcd

_config_Time:

;LCD.c,59 :: 		void config_Time(u8 tim,u8 addr)
;LCD.c,61 :: 		u8 max=0,dat[4]={0};
	CLRF       config_Time_max_L0+0
	CLRF       config_Time_dat_L0+0
	CLRF       config_Time_dat_L0+1
	CLRF       config_Time_dat_L0+2
	CLRF       config_Time_dat_L0+3
;LCD.c,63 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,64 :: 		if(addr==0x02)  { max=23; Constant_to_temp(disp_txt[0]); Lcd_Out(1,1,temp);}
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time2
	MOVLW      23
	MOVWF      config_Time_max_L0+0
	MOVLW      config_Time_disp_txt_L0+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(config_Time_disp_txt_L0+0)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_config_Time3
L_config_Time2:
;LCD.c,65 :: 		else if(addr==0x01){ max=59; Constant_to_temp(disp_txt[1]); Lcd_Out(1,1,temp);}
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time4
	MOVLW      59
	MOVWF      config_Time_max_L0+0
	MOVLW      config_Time_disp_txt_L0+20
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(config_Time_disp_txt_L0+20)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_config_Time5
L_config_Time4:
;LCD.c,66 :: 		else if(addr==0x04){ max=30; Constant_to_temp(disp_txt[2]);Lcd_Out(1,1,temp);}
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time6
	MOVLW      30
	MOVWF      config_Time_max_L0+0
	MOVLW      config_Time_disp_txt_L0+40
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(config_Time_disp_txt_L0+40)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_config_Time7
L_config_Time6:
;LCD.c,67 :: 		else if(addr==0x05){ max=12; Constant_to_temp(disp_txt[3]); Lcd_Out(1,1,temp);}
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time8
	MOVLW      12
	MOVWF      config_Time_max_L0+0
	MOVLW      config_Time_disp_txt_L0+60
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(config_Time_disp_txt_L0+60)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	GOTO       L_config_Time9
L_config_Time8:
;LCD.c,68 :: 		else if(addr==0x06){ max=99; Constant_to_temp(disp_txt[4]);Lcd_Out(1,1,temp); }
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time10
	MOVLW      99
	MOVWF      config_Time_max_L0+0
	MOVLW      config_Time_disp_txt_L0+80
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(config_Time_disp_txt_L0+80)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_config_Time10:
L_config_Time9:
L_config_Time7:
L_config_Time5:
L_config_Time3:
;LCD.c,70 :: 		while(!ENTER);
L_config_Time11:
	BTFSC      PORTB+0, 3
	GOTO       L_config_Time12
	GOTO       L_config_Time11
L_config_Time12:
;LCD.c,71 :: 		do
L_config_Time13:
;LCD.c,73 :: 		memset(dat,'0',2);
	MOVLW      config_Time_dat_L0+0
	MOVWF      FARG_memset_p1+0
	MOVLW      48
	MOVWF      FARG_memset_character+0
	MOVLW      2
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;LCD.c,74 :: 		ByteToStr(tim,dat);
	MOVF       FARG_config_Time_tim+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      config_Time_dat_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;LCD.c,75 :: 		Lcd_Out(2,1,dat+1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      config_Time_dat_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,76 :: 		if(!UP)
	BTFSC      PORTB+0, 1
	GOTO       L_config_Time16
;LCD.c,78 :: 		tim++; if(tim>max) tim=0;
	INCF       FARG_config_Time_tim+0, 1
	MOVF       FARG_config_Time_tim+0, 0
	SUBWF      config_Time_max_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_config_Time17
	CLRF       FARG_config_Time_tim+0
L_config_Time17:
;LCD.c,79 :: 		while(!UP);
L_config_Time18:
	BTFSC      PORTB+0, 1
	GOTO       L_config_Time19
	GOTO       L_config_Time18
L_config_Time19:
;LCD.c,80 :: 		}
	GOTO       L_config_Time20
L_config_Time16:
;LCD.c,81 :: 		else if(!DOWN)
	BTFSC      PORTB+0, 2
	GOTO       L_config_Time21
;LCD.c,83 :: 		tim--; if(tim>max) tim=max;
	DECF       FARG_config_Time_tim+0, 1
	MOVF       FARG_config_Time_tim+0, 0
	SUBWF      config_Time_max_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_config_Time22
	MOVF       config_Time_max_L0+0, 0
	MOVWF      FARG_config_Time_tim+0
L_config_Time22:
;LCD.c,84 :: 		while(!DOWN);
L_config_Time23:
	BTFSC      PORTB+0, 2
	GOTO       L_config_Time24
	GOTO       L_config_Time23
L_config_Time24:
;LCD.c,85 :: 		}
	GOTO       L_config_Time25
L_config_Time21:
;LCD.c,86 :: 		else if(!MENU) break;
	BTFSC      PORTB+0, 0
	GOTO       L_config_Time26
	GOTO       L_config_Time14
L_config_Time26:
L_config_Time25:
L_config_Time20:
;LCD.c,87 :: 		}while(ENTER);
	BTFSC      PORTB+0, 3
	GOTO       L_config_Time13
L_config_Time14:
;LCD.c,88 :: 		while(!MENU || !ENTER);
L_config_Time27:
	BTFSS      PORTB+0, 0
	GOTO       L__config_Time112
	BTFSS      PORTB+0, 3
	GOTO       L__config_Time112
	GOTO       L_config_Time28
L__config_Time112:
	GOTO       L_config_Time27
L_config_Time28:
;LCD.c,89 :: 		write_I2C(0xD0,addr,((tim/10)<<4)|tim%10);
	MOVLW      208
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVF       FARG_config_Time_addr+0, 0
	MOVWF      FARG_write_I2C_buf_addr+0
	CLRF       FARG_write_I2C_buf_addr+1
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_config_Time_tim+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      4
	MOVWF      R1+0
	MOVF       R0+0, 0
	MOVWF      FLOC__config_Time+0
	CLRF       FLOC__config_Time+1
	MOVF       R1+0, 0
L__config_Time126:
	BTFSC      STATUS+0, 2
	GOTO       L__config_Time127
	RLF        FLOC__config_Time+0, 1
	RLF        FLOC__config_Time+1, 1
	BCF        FLOC__config_Time+0, 0
	ADDLW      255
	GOTO       L__config_Time126
L__config_Time127:
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_config_Time_tim+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	IORWF      FLOC__config_Time+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;LCD.c,90 :: 		}
L_end_config_Time:
	RETURN
; end of _config_Time

_config_patt:

;LCD.c,96 :: 		void config_patt()
;LCD.c,105 :: 		s8 i=0,exit=0;
	CLRF       config_patt_i_L0+0
	CLRF       config_patt_exit_L0+0
;LCD.c,106 :: 		while(!MENU || !ENTER);
L_config_patt31:
	BTFSS      PORTB+0, 0
	GOTO       L__config_patt117
	BTFSS      PORTB+0, 3
	GOTO       L__config_patt117
	GOTO       L_config_patt32
L__config_patt117:
	GOTO       L_config_patt31
L_config_patt32:
;LCD.c,107 :: 		if(pattern==0)
	MOVF       _pattern+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_config_patt35
;LCD.c,109 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,110 :: 		Constant_to_temp(disp_txt[0]);  Lcd_Out(1,1,temp);
	MOVLW      config_patt_disp_txt_L0+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(config_patt_disp_txt_L0+0)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,111 :: 		Constant_to_temp(disp_txt[1]);   Lcd_Out(2,1,temp);
	MOVLW      config_patt_disp_txt_L0+20
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(config_patt_disp_txt_L0+20)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,112 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_config_patt36:
	DECFSZ     R13+0, 1
	GOTO       L_config_patt36
	DECFSZ     R12+0, 1
	GOTO       L_config_patt36
	DECFSZ     R11+0, 1
	GOTO       L_config_patt36
	NOP
	NOP
;LCD.c,113 :: 		return;
	GOTO       L_end_config_patt
;LCD.c,114 :: 		}
L_config_patt35:
;LCD.c,116 :: 		else if(pattern==1 || pattern==2 || pattern==3)
	MOVF       _pattern+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt116
	MOVF       _pattern+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt116
	MOVF       _pattern+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt116
	GOTO       L_config_patt40
L__config_patt116:
;LCD.c,118 :: 		while(exit==0)
L_config_patt41:
	MOVF       config_patt_exit_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_config_patt42
;LCD.c,120 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,121 :: 		Constant_to_temp(patt[pattern]+2); Lcd_Out(1,2,temp);
	MOVLW      4
	MOVWF      R2+0
	MOVF       _pattern+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      R0+0, 7
	MOVLW      255
	MOVWF      R0+1
	MOVF       R2+0, 0
L__config_patt129:
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt130
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__config_patt129
L__config_patt130:
	MOVF       R0+0, 0
	ADDLW      _patt+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(_patt+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_Constant_to_temp_source+1
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
;LCD.c,122 :: 		Constant_to_temp(tim[i]); Lcd_Out(2,1,temp);
	MOVLW      13
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       config_patt_i_L0+0, 0
	MOVWF      R4+0
	MOVLW      0
	BTFSC      R4+0, 7
	MOVLW      255
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      config_patt_tim_L0+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(config_patt_tim_L0+0)
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
;LCD.c,123 :: 		Lcd_Chr(1,16,'^');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      94
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,124 :: 		Lcd_Chr(2,16,'v');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      118
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,125 :: 		while(UP&&DOWN&&ENTER&&MENU);  //wait
L_config_patt43:
	BTFSS      PORTB+0, 1
	GOTO       L_config_patt44
	BTFSS      PORTB+0, 2
	GOTO       L_config_patt44
	BTFSS      PORTB+0, 3
	GOTO       L_config_patt44
	BTFSS      PORTB+0, 0
	GOTO       L_config_patt44
L__config_patt115:
	GOTO       L_config_patt43
L_config_patt44:
;LCD.c,126 :: 		if(!UP){ i++; while(!UP); }//wait till button is released
	BTFSC      PORTB+0, 1
	GOTO       L_config_patt47
	INCF       config_patt_i_L0+0, 1
L_config_patt48:
	BTFSC      PORTB+0, 1
	GOTO       L_config_patt49
	GOTO       L_config_patt48
L_config_patt49:
	GOTO       L_config_patt50
L_config_patt47:
;LCD.c,127 :: 		else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
	BTFSC      PORTB+0, 2
	GOTO       L_config_patt51
	DECF       config_patt_i_L0+0, 1
L_config_patt52:
	BTFSC      PORTB+0, 2
	GOTO       L_config_patt53
	GOTO       L_config_patt52
L_config_patt53:
	GOTO       L_config_patt54
L_config_patt51:
;LCD.c,128 :: 		else if(!ENTER)
	BTFSC      PORTB+0, 3
	GOTO       L_config_patt55
;LCD.c,130 :: 		if(i==24) { exit=1;}
	MOVF       config_patt_i_L0+0, 0
	XORLW      24
	BTFSS      STATUS+0, 2
	GOTO       L_config_patt56
	MOVLW      1
	MOVWF      config_patt_exit_L0+0
	GOTO       L_config_patt57
L_config_patt56:
;LCD.c,131 :: 		else { sel_socket(i);}
	MOVF       config_patt_i_L0+0, 0
	MOVWF      FARG_sel_socket_tim+0
	CALL       _sel_socket+0
L_config_patt57:
;LCD.c,132 :: 		}
	GOTO       L_config_patt58
L_config_patt55:
;LCD.c,133 :: 		else if(!MENU) return;
	BTFSC      PORTB+0, 0
	GOTO       L_config_patt59
	GOTO       L_end_config_patt
L_config_patt59:
L_config_patt58:
L_config_patt54:
L_config_patt50:
;LCD.c,134 :: 		if(i<0) i=24;
	MOVLW      128
	XORWF      config_patt_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_config_patt60
	MOVLW      24
	MOVWF      config_patt_i_L0+0
L_config_patt60:
;LCD.c,135 :: 		if(i>24) i=0;
	MOVLW      128
	XORLW      24
	MOVWF      R0+0
	MOVLW      128
	XORWF      config_patt_i_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_config_patt61
	CLRF       config_patt_i_L0+0
L_config_patt61:
;LCD.c,136 :: 		}
	GOTO       L_config_patt41
L_config_patt42:
;LCD.c,137 :: 		while(!MENU || !ENTER);
L_config_patt62:
	BTFSS      PORTB+0, 0
	GOTO       L__config_patt114
	BTFSS      PORTB+0, 3
	GOTO       L__config_patt114
	GOTO       L_config_patt63
L__config_patt114:
	GOTO       L_config_patt62
L_config_patt63:
;LCD.c,138 :: 		}
	GOTO       L_config_patt66
L_config_patt40:
;LCD.c,140 :: 		else if(pattern==4 || pattern==5 || pattern==6) sel_socket(0);
	MOVF       _pattern+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt113
	MOVF       _pattern+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt113
	MOVF       _pattern+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt113
	GOTO       L_config_patt69
L__config_patt113:
	CLRF       FARG_sel_socket_tim+0
	CALL       _sel_socket+0
L_config_patt69:
L_config_patt66:
;LCD.c,141 :: 		}
L_end_config_patt:
	RETURN
; end of _config_patt

_menu_fnc:

;LCD.c,145 :: 		void menu_fnc(void)
;LCD.c,147 :: 		s8 i=1,exit=0;
	MOVLW      1
	MOVWF      menu_fnc_i_L0+0
	CLRF       menu_fnc_exit_L0+0
;LCD.c,150 :: 		while(!MENU);
L_menu_fnc70:
	BTFSC      PORTB+0, 0
	GOTO       L_menu_fnc71
	GOTO       L_menu_fnc70
L_menu_fnc71:
;LCD.c,151 :: 		while(exit==0)
L_menu_fnc72:
	MOVF       menu_fnc_exit_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_menu_fnc73
;LCD.c,153 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,154 :: 		Constant_to_temp(disp_menu); Lcd_Out(1,6,temp);
	MOVLW      menu_fnc_disp_menu_L0+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(menu_fnc_disp_menu_L0+0)
	MOVWF      FARG_Constant_to_temp_source+1
	CALL       _Constant_to_temp+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD.c,155 :: 		Constant_to_temp(menu[i-1]); Lcd_Out(2,1,temp);
	MOVLW      1
	SUBWF      menu_fnc_i_L0+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVLW      0
	BTFSC      menu_fnc_i_L0+0, 7
	MOVLW      255
	ADDWF      R3+1, 1
	MOVLW      4
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__menu_fnc132:
	BTFSC      STATUS+0, 2
	GOTO       L__menu_fnc133
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__menu_fnc132
L__menu_fnc133:
	MOVF       R0+0, 0
	ADDLW      menu_fnc_menu_L0+0
	MOVWF      FARG_Constant_to_temp_source+0
	MOVLW      hi_addr(menu_fnc_menu_L0+0)
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
;LCD.c,156 :: 		Lcd_Chr(1,16,'^');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      94
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,157 :: 		Lcd_Chr(2,16,'v');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      118
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,158 :: 		while(UP&&DOWN&&ENTER&&MENU);  //wait
L_menu_fnc74:
	BTFSS      PORTB+0, 1
	GOTO       L_menu_fnc75
	BTFSS      PORTB+0, 2
	GOTO       L_menu_fnc75
	BTFSS      PORTB+0, 3
	GOTO       L_menu_fnc75
	BTFSS      PORTB+0, 0
	GOTO       L_menu_fnc75
L__menu_fnc120:
	GOTO       L_menu_fnc74
L_menu_fnc75:
;LCD.c,160 :: 		if(!UP) { i++; while(!UP); }//wait till button is release
	BTFSC      PORTB+0, 1
	GOTO       L_menu_fnc78
	INCF       menu_fnc_i_L0+0, 1
L_menu_fnc79:
	BTFSC      PORTB+0, 1
	GOTO       L_menu_fnc80
	GOTO       L_menu_fnc79
L_menu_fnc80:
	GOTO       L_menu_fnc81
L_menu_fnc78:
;LCD.c,161 :: 		else if(!DOWN){ i--; while(!DOWN); }  //wait till button is realeased
	BTFSC      PORTB+0, 2
	GOTO       L_menu_fnc82
	DECF       menu_fnc_i_L0+0, 1
L_menu_fnc83:
	BTFSC      PORTB+0, 2
	GOTO       L_menu_fnc84
	GOTO       L_menu_fnc83
L_menu_fnc84:
	GOTO       L_menu_fnc85
L_menu_fnc82:
;LCD.c,162 :: 		else if(!MENU) break;
	BTFSC      PORTB+0, 0
	GOTO       L_menu_fnc86
	GOTO       L_menu_fnc73
L_menu_fnc86:
L_menu_fnc85:
L_menu_fnc81:
;LCD.c,163 :: 		if(i<1) i=4;
	MOVLW      128
	XORWF      menu_fnc_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_fnc87
	MOVLW      4
	MOVWF      menu_fnc_i_L0+0
L_menu_fnc87:
;LCD.c,164 :: 		if(i>4) i=1;
	MOVLW      128
	XORLW      4
	MOVWF      R0+0
	MOVLW      128
	XORWF      menu_fnc_i_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_fnc88
	MOVLW      1
	MOVWF      menu_fnc_i_L0+0
L_menu_fnc88:
;LCD.c,165 :: 		if(!ENTER)
	BTFSC      PORTB+0, 3
	GOTO       L_menu_fnc89
;LCD.c,167 :: 		switch(i)
	GOTO       L_menu_fnc90
;LCD.c,169 :: 		case 1: config_Time(hrs=Bcd2Dec(read_I2C(0xD0,0x02)),0x02);
L_menu_fnc92:
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _hrs+0
	MOVF       R0+0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      2
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,170 :: 		config_Time(mins=Bcd2Dec(read_I2C(0xD0,0x01)),0x01);
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _mins+0
	MOVF       R0+0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      1
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,171 :: 		config_Time(date=Bcd2Dec(read_I2C(0xD0,0x04)),0x04);
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      4
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _date+0
	MOVF       R0+0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      4
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,172 :: 		config_Time(month=Bcd2Dec(read_I2C(0xD0,0x05)),0x05);
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      5
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _month+0
	MOVF       R0+0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      5
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,173 :: 		config_Time(year=Bcd2Dec(read_I2C(0xD0,0x06)),0x06);
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      6
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _year+0
	MOVF       R0+0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      6
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,174 :: 		break;
	GOTO       L_menu_fnc91
;LCD.c,175 :: 		case 2: sel_patt(); while(!MENU || !ENTER);
L_menu_fnc93:
	CALL       _sel_patt+0
L_menu_fnc94:
	BTFSS      PORTB+0, 0
	GOTO       L__menu_fnc119
	BTFSS      PORTB+0, 3
	GOTO       L__menu_fnc119
	GOTO       L_menu_fnc95
L__menu_fnc119:
	GOTO       L_menu_fnc94
L_menu_fnc95:
;LCD.c,176 :: 		break;
	GOTO       L_menu_fnc91
;LCD.c,177 :: 		case 3: config_patt(); while(!MENU || !ENTER);
L_menu_fnc98:
	CALL       _config_patt+0
L_menu_fnc99:
	BTFSS      PORTB+0, 0
	GOTO       L__menu_fnc118
	BTFSS      PORTB+0, 3
	GOTO       L__menu_fnc118
	GOTO       L_menu_fnc100
L__menu_fnc118:
	GOTO       L_menu_fnc99
L_menu_fnc100:
;LCD.c,178 :: 		break;
	GOTO       L_menu_fnc91
;LCD.c,179 :: 		case 4: exit=1;
L_menu_fnc103:
	MOVLW      1
	MOVWF      menu_fnc_exit_L0+0
;LCD.c,180 :: 		break;
	GOTO       L_menu_fnc91
;LCD.c,181 :: 		}
L_menu_fnc90:
	MOVF       menu_fnc_i_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_menu_fnc92
	MOVF       menu_fnc_i_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_menu_fnc93
	MOVF       menu_fnc_i_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_menu_fnc98
	MOVF       menu_fnc_i_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_menu_fnc103
L_menu_fnc91:
;LCD.c,182 :: 		}
L_menu_fnc89:
;LCD.c,184 :: 		}
	GOTO       L_menu_fnc72
L_menu_fnc73:
;LCD.c,185 :: 		while(!MENU);
L_menu_fnc104:
	BTFSC      PORTB+0, 0
	GOTO       L_menu_fnc105
	GOTO       L_menu_fnc104
L_menu_fnc105:
;LCD.c,186 :: 		}
L_end_menu_fnc:
	RETURN
; end of _menu_fnc

_Constant_to_temp:

;LCD.c,190 :: 		void Constant_to_temp(const u8* source)
;LCD.c,193 :: 		for(i=0;i<15;i++) temp[i]=0;  //Clearing Temp
	CLRF       R3+0
L_Constant_to_temp106:
	MOVLW      15
	SUBWF      R3+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Constant_to_temp107
	MOVF       R3+0, 0
	ADDLW      _temp+0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       R3+0, 1
	GOTO       L_Constant_to_temp106
L_Constant_to_temp107:
;LCD.c,194 :: 		for(i=0;source[i];i++)
	CLRF       R3+0
L_Constant_to_temp109:
	MOVF       R3+0, 0
	ADDWF      FARG_Constant_to_temp_source+0, 0
	MOVWF      R0+0
	MOVF       FARG_Constant_to_temp_source+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Constant_to_temp110
;LCD.c,195 :: 		temp[i]=source[i];
	MOVF       R3+0, 0
	ADDLW      _temp+0
	MOVWF      R2+0
	MOVF       R3+0, 0
	ADDWF      FARG_Constant_to_temp_source+0, 0
	MOVWF      R0+0
	MOVF       FARG_Constant_to_temp_source+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;LCD.c,194 :: 		for(i=0;source[i];i++)
	INCF       R3+0, 1
;LCD.c,195 :: 		temp[i]=source[i];
	GOTO       L_Constant_to_temp109
L_Constant_to_temp110:
;LCD.c,197 :: 		temp[i]='\0';
	MOVF       R3+0, 0
	ADDLW      _temp+0
	MOVWF      FSR
	CLRF       INDF+0
;LCD.c,198 :: 		return;
;LCD.c,199 :: 		}
L_end_Constant_to_temp:
	RETURN
; end of _Constant_to_temp
