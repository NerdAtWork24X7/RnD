
_Display_Time:

;LCD.c,30 :: 		void Display_Time()
;LCD.c,33 :: 		ByteToStr(hrs,dat);
	MOVF       _hrs+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Display_Time_dat_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(Display_Time_dat_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;LCD.c,34 :: 		Lcd_Out(1,6,dat+1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Display_Time_dat_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(Display_Time_dat_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,35 :: 		if(dat[1]==' ') Lcd_Chr(1,6,'0');
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
;LCD.c,36 :: 		memset(dat,0,2);
	MOVLW      Display_Time_dat_L0+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(Display_Time_dat_L0+0)
	MOVWF      FARG_memset_p1+1
	CLRF       FARG_memset_character+0
	MOVLW      2
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;LCD.c,37 :: 		ByteToStr(mins,dat);
	MOVF       _mins+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Display_Time_dat_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(Display_Time_dat_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;LCD.c,38 :: 		Lcd_Out(1,9,dat+1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Display_Time_dat_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(Display_Time_dat_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,39 :: 		if(dat[1]==' ') Lcd_Chr(1,9,'0');
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
;LCD.c,40 :: 		}
L_end_Display_Time:
	RETURN
; end of _Display_Time

_init_lcd:

;LCD.c,43 :: 		void init_lcd()
;LCD.c,45 :: 		Lcd_Init();                // Initialize LCD
	CALL       _Lcd_Init+0
;LCD.c,46 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,47 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,48 :: 		Lcd_Chr(1,8,':');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,49 :: 		Lcd_out(2,1,patt[pattern]+2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      4
	MOVWF      R2
	MOVF       _pattern+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__init_lcd94:
	BTFSC      STATUS+0, 2
	GOTO       L__init_lcd95
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__init_lcd94
L__init_lcd95:
	MOVLW      _patt+0
	ADDWF      R0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_patt+0)
	ADDWFC     R1, 0
	MOVWF      FARG_Lcd_Out_text+1
	MOVLW      2
	ADDWF      FARG_Lcd_Out_text+0, 1
	MOVLW      0
	ADDWFC     FARG_Lcd_Out_text+1, 1
	CALL       _Lcd_Out+0
;LCD.c,51 :: 		}
L_end_init_lcd:
	RETURN
; end of _init_lcd

_config_Time:

;LCD.c,54 :: 		void config_Time(u8 tim,u8 addr)
;LCD.c,56 :: 		u8 max=0,dat[4]={0};
	CLRF       config_Time_max_L0+0
	CLRF       config_Time_dat_L0+0
	CLRF       config_Time_dat_L0+1
	CLRF       config_Time_dat_L0+2
	CLRF       config_Time_dat_L0+3
;LCD.c,57 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,58 :: 		if(addr==0x02)  { max=23; Lcd_Out(1,1,"Enter Hours");}
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time2
	MOVLW      23
	MOVWF      config_Time_max_L0+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr1_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
	GOTO       L_config_Time3
L_config_Time2:
;LCD.c,59 :: 		else if(addr==0x01){ max=59; Lcd_Out(1,1,"Enter Mins");}
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time4
	MOVLW      59
	MOVWF      config_Time_max_L0+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr2_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
	GOTO       L_config_Time5
L_config_Time4:
;LCD.c,60 :: 		else if(addr==0x04){ max=30; Lcd_Out(1,1,"Enter Date");}
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time6
	MOVLW      30
	MOVWF      config_Time_max_L0+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr3_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
	GOTO       L_config_Time7
L_config_Time6:
;LCD.c,61 :: 		else if(addr==0x05){ max=12; Lcd_Out(1,1,"Enter month");}
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time8
	MOVLW      12
	MOVWF      config_Time_max_L0+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr4_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
	GOTO       L_config_Time9
L_config_Time8:
;LCD.c,62 :: 		else if(addr==0x06){ max=99;Lcd_Out(1,1,"Enter year"); }
	MOVF       FARG_config_Time_addr+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_config_Time10
	MOVLW      99
	MOVWF      config_Time_max_L0+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr5_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
L_config_Time10:
L_config_Time9:
L_config_Time7:
L_config_Time5:
L_config_Time3:
;LCD.c,64 :: 		while(!ENTER);
L_config_Time11:
	BTFSC      PORTA+0, 5
	GOTO       L_config_Time12
	GOTO       L_config_Time11
L_config_Time12:
;LCD.c,65 :: 		do
L_config_Time13:
;LCD.c,67 :: 		memset(dat,'0',2);
	MOVLW      config_Time_dat_L0+0
	MOVWF      FARG_memset_p1+0
	MOVLW      hi_addr(config_Time_dat_L0+0)
	MOVWF      FARG_memset_p1+1
	MOVLW      48
	MOVWF      FARG_memset_character+0
	MOVLW      2
	MOVWF      FARG_memset_n+0
	MOVLW      0
	MOVWF      FARG_memset_n+1
	CALL       _memset+0
;LCD.c,68 :: 		ByteToStr(tim,dat);
	MOVF       FARG_config_Time_tim+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      config_Time_dat_L0+0
	MOVWF      FARG_ByteToStr_output+0
	MOVLW      hi_addr(config_Time_dat_L0+0)
	MOVWF      FARG_ByteToStr_output+1
	CALL       _ByteToStr+0
;LCD.c,69 :: 		Lcd_Out(2,1,dat+1);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      config_Time_dat_L0+1
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(config_Time_dat_L0+1)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,70 :: 		if(!UP)
	BTFSC      PORTA+0, 1
	GOTO       L_config_Time16
;LCD.c,72 :: 		tim++; if(tim>max) tim=0;
	INCF       FARG_config_Time_tim+0, 1
	MOVF       FARG_config_Time_tim+0, 0
	SUBWF      config_Time_max_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_config_Time17
	CLRF       FARG_config_Time_tim+0
L_config_Time17:
;LCD.c,73 :: 		while(!UP);
L_config_Time18:
	BTFSC      PORTA+0, 1
	GOTO       L_config_Time19
	GOTO       L_config_Time18
L_config_Time19:
;LCD.c,74 :: 		}
	GOTO       L_config_Time20
L_config_Time16:
;LCD.c,75 :: 		else if(!DOWN)
	BTFSC      PORTA+0, 4
	GOTO       L_config_Time21
;LCD.c,77 :: 		tim--; if(tim>max) tim=max;
	DECF       FARG_config_Time_tim+0, 1
	MOVF       FARG_config_Time_tim+0, 0
	SUBWF      config_Time_max_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_config_Time22
	MOVF       config_Time_max_L0+0, 0
	MOVWF      FARG_config_Time_tim+0
L_config_Time22:
;LCD.c,78 :: 		while(!DOWN);
L_config_Time23:
	BTFSC      PORTA+0, 4
	GOTO       L_config_Time24
	GOTO       L_config_Time23
L_config_Time24:
;LCD.c,79 :: 		}
	GOTO       L_config_Time25
L_config_Time21:
;LCD.c,80 :: 		else if(!MENU) break;
	BTFSC      PORTA+0, 0
	GOTO       L_config_Time26
	GOTO       L_config_Time14
L_config_Time26:
L_config_Time25:
L_config_Time20:
;LCD.c,81 :: 		}while(ENTER);
	BTFSC      PORTA+0, 5
	GOTO       L_config_Time13
L_config_Time14:
;LCD.c,82 :: 		while(!MENU);
L_config_Time27:
	BTFSC      PORTA+0, 0
	GOTO       L_config_Time28
	GOTO       L_config_Time27
L_config_Time28:
;LCD.c,83 :: 		write_I2C(0xD0,addr,((tim/10)<<4)|tim%10);
	MOVLW      208
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVF       FARG_config_Time_addr+0, 0
	MOVWF      FARG_write_I2C_buf_addr+0
	CLRF       FARG_write_I2C_buf_addr+1
	MOVLW      10
	MOVWF      R4
	MOVF       FARG_config_Time_tim+0, 0
	MOVWF      R0
	CALL       _Div_8x8_U+0
	MOVLW      4
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      FLOC__config_Time+0
	CLRF       FLOC__config_Time+1
	MOVF       R1, 0
L__config_Time97:
	BTFSC      STATUS+0, 2
	GOTO       L__config_Time98
	LSLF       FLOC__config_Time+0, 1
	RLF        FLOC__config_Time+1, 1
	ADDLW      255
	GOTO       L__config_Time97
L__config_Time98:
	MOVLW      10
	MOVWF      R4
	MOVF       FARG_config_Time_tim+0, 0
	MOVWF      R0
	CALL       _Div_8x8_U+0
	MOVF       R8, 0
	MOVWF      R0
	MOVF       R0, 0
	IORWF       FLOC__config_Time+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;LCD.c,84 :: 		}
L_end_config_Time:
	RETURN
; end of _config_Time

_config_patt:

;LCD.c,90 :: 		void config_patt()
;LCD.c,98 :: 		s8 i=0,exit=0;
	CLRF       config_patt_i_L0+0
	CLRF       config_patt_exit_L0+0
;LCD.c,99 :: 		if(pattern==0){
	MOVF       _pattern+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_config_patt29
;LCD.c,100 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,101 :: 		Lcd_Out(1,1,"Cannot modify");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr6_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,102 :: 		Lcd_Out(2,1,"Default Preset");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr7_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,103 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_config_patt30:
	DECFSZ     R13, 1
	GOTO       L_config_patt30
	DECFSZ     R12, 1
	GOTO       L_config_patt30
	DECFSZ     R11, 1
	GOTO       L_config_patt30
	NOP
	NOP
;LCD.c,104 :: 		return;
	GOTO       L_end_config_patt
;LCD.c,105 :: 		}
L_config_patt29:
;LCD.c,107 :: 		else if(pattern==1 || pattern==2 || pattern==3)
	MOVF       _pattern+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt90
	MOVF       _pattern+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt90
	MOVF       _pattern+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt90
	GOTO       L_config_patt34
L__config_patt90:
;LCD.c,109 :: 		while(exit==0)
L_config_patt35:
	MOVF       config_patt_exit_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_config_patt36
;LCD.c,111 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,112 :: 		Lcd_Out(1,2,patt[pattern]+2);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      4
	MOVWF      R2
	MOVF       _pattern+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__config_patt100:
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt101
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__config_patt100
L__config_patt101:
	MOVLW      _patt+0
	ADDWF      R0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_patt+0)
	ADDWFC     R1, 0
	MOVWF      FARG_Lcd_Out_text+1
	MOVLW      2
	ADDWF      FARG_Lcd_Out_text+0, 1
	MOVLW      0
	ADDWFC     FARG_Lcd_Out_text+1, 1
	CALL       _Lcd_Out+0
;LCD.c,113 :: 		Lcd_Out(2,1,tim[i]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      13
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       config_patt_i_L0+0, 0
	MOVWF      R4
	MOVLW      0
	BTFSC      R4, 7
	MOVLW      255
	MOVWF      R5
	CALL       _Mul_16x16_U+0
	MOVLW      config_patt_tim_L0+0
	ADDWF      R0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(config_patt_tim_L0+0)
	ADDWFC     R1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,114 :: 		Lcd_Chr(1,16,'^');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      94
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,115 :: 		Lcd_Chr(2,16,'v');
	MOVLW      2
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      118
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;LCD.c,116 :: 		while(UP&&DOWN&&ENTER&&MENU);  //wait
L_config_patt37:
	BTFSS      PORTA+0, 1
	GOTO       L_config_patt38
	BTFSS      PORTA+0, 4
	GOTO       L_config_patt38
	BTFSS      PORTA+0, 5
	GOTO       L_config_patt38
	BTFSS      PORTA+0, 0
	GOTO       L_config_patt38
L__config_patt89:
	GOTO       L_config_patt37
L_config_patt38:
;LCD.c,117 :: 		if(!UP){ i++; while(!UP); }//wait till button is released
	BTFSC      PORTA+0, 1
	GOTO       L_config_patt41
	INCF       config_patt_i_L0+0, 1
L_config_patt42:
	BTFSC      PORTA+0, 1
	GOTO       L_config_patt43
	GOTO       L_config_patt42
L_config_patt43:
	GOTO       L_config_patt44
L_config_patt41:
;LCD.c,118 :: 		else if(!DOWN){ i--;while(!DOWN);}  //wait till button is realeased
	BTFSC      PORTA+0, 4
	GOTO       L_config_patt45
	DECF       config_patt_i_L0+0, 1
L_config_patt46:
	BTFSC      PORTA+0, 4
	GOTO       L_config_patt47
	GOTO       L_config_patt46
L_config_patt47:
	GOTO       L_config_patt48
L_config_patt45:
;LCD.c,119 :: 		else if(!ENTER)
	BTFSC      PORTA+0, 5
	GOTO       L_config_patt49
;LCD.c,121 :: 		if(i==24) { exit=1;}
	MOVF       config_patt_i_L0+0, 0
	XORLW      24
	BTFSS      STATUS+0, 2
	GOTO       L_config_patt50
	MOVLW      1
	MOVWF      config_patt_exit_L0+0
	GOTO       L_config_patt51
L_config_patt50:
;LCD.c,122 :: 		else { save_data(i);}
	MOVF       config_patt_i_L0+0, 0
	MOVWF      FARG_save_data+0
	CALL       _save_data+0
L_config_patt51:
;LCD.c,123 :: 		}
	GOTO       L_config_patt52
L_config_patt49:
;LCD.c,124 :: 		else if(!MENU) break;
	BTFSC      PORTA+0, 0
	GOTO       L_config_patt53
	GOTO       L_config_patt36
L_config_patt53:
L_config_patt52:
L_config_patt48:
L_config_patt44:
;LCD.c,125 :: 		if(i<0) i=24;
	MOVLW      128
	XORWF      config_patt_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_config_patt54
	MOVLW      24
	MOVWF      config_patt_i_L0+0
L_config_patt54:
;LCD.c,126 :: 		if(i>24) i=0;
	MOVLW      128
	XORLW      24
	MOVWF      R0
	MOVLW      128
	XORWF      config_patt_i_L0+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_config_patt55
	CLRF       config_patt_i_L0+0
L_config_patt55:
;LCD.c,127 :: 		}
	GOTO       L_config_patt35
L_config_patt36:
;LCD.c,128 :: 		while(!MENU);
L_config_patt56:
	BTFSC      PORTA+0, 0
	GOTO       L_config_patt57
	GOTO       L_config_patt56
L_config_patt57:
;LCD.c,129 :: 		}
	GOTO       L_config_patt58
L_config_patt34:
;LCD.c,131 :: 		else if(pattern==4 || pattern==5 || pattern==6) save_data(0);
	MOVF       _pattern+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt88
	MOVF       _pattern+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt88
	MOVF       _pattern+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L__config_patt88
	GOTO       L_config_patt61
L__config_patt88:
	CLRF       FARG_save_data+0
	CALL       _save_data+0
L_config_patt61:
L_config_patt58:
;LCD.c,132 :: 		}
L_end_config_patt:
	RETURN
; end of _config_patt

_menu_fnc:

;LCD.c,136 :: 		void menu_fnc(void)
;LCD.c,138 :: 		s8 i=1,exit=0;
	MOVLW      1
	MOVWF      menu_fnc_i_L0+0
	CLRF       menu_fnc_exit_L0+0
;LCD.c,140 :: 		while(exit==0)
L_menu_fnc62:
	MOVF       menu_fnc_exit_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_menu_fnc63
;LCD.c,142 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,143 :: 		Lcd_Out(1,6,"MENU");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr8_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,144 :: 		Lcd_Out(2,1,menu[i-1]);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      1
	SUBWF      menu_fnc_i_L0+0, 0
	MOVWF      R3
	MOVLW      0
	BTFSC      menu_fnc_i_L0+0, 7
	MOVLW      255
	MOVWF      R4
	MOVLW      0
	SUBWFB     R4, 1
	MOVLW      4
	MOVWF      R2
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	MOVF       R2, 0
L__menu_fnc103:
	BTFSC      STATUS+0, 2
	GOTO       L__menu_fnc104
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__menu_fnc103
L__menu_fnc104:
	MOVLW      menu_fnc_menu_L0+0
	ADDWF      R0, 0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(menu_fnc_menu_L0+0)
	ADDWFC     R1, 0
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,145 :: 		Lcd_Out(1,16,"^");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr9_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,146 :: 		Lcd_Out(2,16,"v");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr10_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,147 :: 		while(UP&&DOWN&&ENTER&&MENU);  //wait
L_menu_fnc64:
	BTFSS      PORTA+0, 1
	GOTO       L_menu_fnc65
	BTFSS      PORTA+0, 4
	GOTO       L_menu_fnc65
	BTFSS      PORTA+0, 5
	GOTO       L_menu_fnc65
	BTFSS      PORTA+0, 0
	GOTO       L_menu_fnc65
L__menu_fnc91:
	GOTO       L_menu_fnc64
L_menu_fnc65:
;LCD.c,149 :: 		if(!UP) { i++; while(!UP); }//wait till button is release
	BTFSC      PORTA+0, 1
	GOTO       L_menu_fnc68
	INCF       menu_fnc_i_L0+0, 1
L_menu_fnc69:
	BTFSC      PORTA+0, 1
	GOTO       L_menu_fnc70
	GOTO       L_menu_fnc69
L_menu_fnc70:
	GOTO       L_menu_fnc71
L_menu_fnc68:
;LCD.c,150 :: 		else if(!DOWN){ i--; while(!DOWN); }  //wait till button is realeased
	BTFSC      PORTA+0, 4
	GOTO       L_menu_fnc72
	DECF       menu_fnc_i_L0+0, 1
L_menu_fnc73:
	BTFSC      PORTA+0, 4
	GOTO       L_menu_fnc74
	GOTO       L_menu_fnc73
L_menu_fnc74:
	GOTO       L_menu_fnc75
L_menu_fnc72:
;LCD.c,151 :: 		else if(!MENU) break;
	BTFSC      PORTA+0, 0
	GOTO       L_menu_fnc76
	GOTO       L_menu_fnc63
L_menu_fnc76:
L_menu_fnc75:
L_menu_fnc71:
;LCD.c,152 :: 		if(i<1) i=4;
	MOVLW      128
	XORWF      menu_fnc_i_L0+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      1
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_fnc77
	MOVLW      4
	MOVWF      menu_fnc_i_L0+0
L_menu_fnc77:
;LCD.c,153 :: 		if(i>4) i=1;
	MOVLW      128
	XORLW      4
	MOVWF      R0
	MOVLW      128
	XORWF      menu_fnc_i_L0+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_menu_fnc78
	MOVLW      1
	MOVWF      menu_fnc_i_L0+0
L_menu_fnc78:
;LCD.c,154 :: 		if(!ENTER)
	BTFSC      PORTA+0, 5
	GOTO       L_menu_fnc79
;LCD.c,156 :: 		switch(i)
	GOTO       L_menu_fnc80
;LCD.c,158 :: 		case 1: config_Time(hrs=Bcd2Dec(read_I2C(0xD0,0x02)),0x02);
L_menu_fnc82:
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0, 0
	MOVWF      _hrs+0
	MOVF       R0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      2
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,159 :: 		config_Time(mins=Bcd2Dec(read_I2C(0xD0,0x01)),0x01);
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0, 0
	MOVWF      _mins+0
	MOVF       R0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      1
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,160 :: 		config_Time(date=Bcd2Dec(read_I2C(0xD0,0x04)),0x04);
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      4
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0, 0
	MOVWF      _date+0
	MOVF       R0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      4
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,161 :: 		config_Time(month=Bcd2Dec(read_I2C(0xD0,0x05)),0x05);
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      5
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0, 0
	MOVWF      _month+0
	MOVF       R0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      5
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,162 :: 		config_Time(year=Bcd2Dec(read_I2C(0xD0,0x06)),0x06);
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      6
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0, 0
	MOVWF      _year+0
	MOVF       R0, 0
	MOVWF      FARG_config_Time_tim+0
	MOVLW      6
	MOVWF      FARG_config_Time_addr+0
	CALL       _config_Time+0
;LCD.c,163 :: 		break;
	GOTO       L_menu_fnc81
;LCD.c,164 :: 		case 2: sel_patt();
L_menu_fnc83:
	CALL       _sel_patt+0
;LCD.c,165 :: 		break;
	GOTO       L_menu_fnc81
;LCD.c,166 :: 		case 3: config_patt();
L_menu_fnc84:
	CALL       _config_patt+0
;LCD.c,167 :: 		break;
	GOTO       L_menu_fnc81
;LCD.c,168 :: 		case 4: exit=1;
L_menu_fnc85:
	MOVLW      1
	MOVWF      menu_fnc_exit_L0+0
;LCD.c,169 :: 		break;
	GOTO       L_menu_fnc81
;LCD.c,170 :: 		}
L_menu_fnc80:
	MOVF       menu_fnc_i_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_menu_fnc82
	MOVF       menu_fnc_i_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_menu_fnc83
	MOVF       menu_fnc_i_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_menu_fnc84
	MOVF       menu_fnc_i_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_menu_fnc85
L_menu_fnc81:
;LCD.c,171 :: 		}
L_menu_fnc79:
;LCD.c,173 :: 		}
	GOTO       L_menu_fnc62
L_menu_fnc63:
;LCD.c,174 :: 		while(!MENU);
L_menu_fnc86:
	BTFSC      PORTA+0, 0
	GOTO       L_menu_fnc87
	GOTO       L_menu_fnc86
L_menu_fnc87:
;LCD.c,175 :: 		}
L_end_menu_fnc:
	RETURN
; end of _menu_fnc
