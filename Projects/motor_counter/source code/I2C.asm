
_write_I2C:

;I2C.c,12 :: 		void write_I2C(uint8_t sa_addr,uint16_t buf_addr,uint8_t dat)
;I2C.c,14 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;I2C.c,15 :: 		Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
	MOVLW      7
	MOVWF      R2+0
	MOVF       FARG_write_I2C_buf_addr+0, 0
	MOVWF      R0+0
	MOVF       FARG_write_I2C_buf_addr+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__write_I2C19:
	BTFSC      STATUS+0, 2
	GOTO       L__write_I2C20
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__write_I2C19
L__write_I2C20:
	MOVLW      14
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_write_I2C_sa_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,16 :: 		Soft_I2C_Write((uint8_t)buf_addr&0xFF);
	MOVLW      255
	ANDWF      FARG_write_I2C_buf_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,17 :: 		Soft_I2C_Write(dat);
	MOVF       FARG_write_I2C_dat+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,18 :: 		Soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;I2C.c,19 :: 		Delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_write_I2C0:
	DECFSZ     R13+0, 1
	GOTO       L_write_I2C0
	DECFSZ     R12+0, 1
	GOTO       L_write_I2C0
	NOP
	NOP
;I2C.c,20 :: 		}
L_end_write_I2C:
	RETURN
; end of _write_I2C

_read_I2C:

;I2C.c,21 :: 		uint8_t read_I2C(uint8_t sa_addr,uint16_t buf_addr)
;I2C.c,23 :: 		uint8_t buf=0;
	CLRF       read_I2C_buf_L0+0
;I2C.c,24 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;I2C.c,25 :: 		Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
	MOVLW      7
	MOVWF      R2+0
	MOVF       FARG_read_I2C_buf_addr+0, 0
	MOVWF      R0+0
	MOVF       FARG_read_I2C_buf_addr+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__read_I2C22:
	BTFSC      STATUS+0, 2
	GOTO       L__read_I2C23
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__read_I2C22
L__read_I2C23:
	MOVLW      14
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_read_I2C_sa_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,26 :: 		Soft_I2C_Write((uint8_t)buf_addr&0xFF);
	MOVLW      255
	ANDWF      FARG_read_I2C_buf_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,27 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;I2C.c,28 :: 		Soft_I2C_write(sa_addr|1);
	MOVLW      1
	IORWF      FARG_read_I2C_sa_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,29 :: 		buf=Soft_I2C_Read(0);
	CLRF       FARG_Soft_I2C_Read_ack+0
	CLRF       FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      read_I2C_buf_L0+0
;I2C.c,30 :: 		Soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;I2C.c,31 :: 		return buf;
	MOVF       read_I2C_buf_L0+0, 0
	MOVWF      R0+0
;I2C.c,32 :: 		}
L_end_read_I2C:
	RETURN
; end of _read_I2C

_Check_time:

;I2C.c,34 :: 		void Check_time(void)
;I2C.c,37 :: 		p_sec=sec;p_mins=mins;p_hrs=hrs;p_date=date;p_month=month;p_year=year;
	MOVF       _sec+0, 0
	MOVWF      _p_sec+0
	MOVF       _mins+0, 0
	MOVWF      _p_mins+0
	MOVF       _hrs+0, 0
	MOVWF      _p_hrs+0
	MOVF       _date+0, 0
	MOVWF      _p_date+0
	MOVF       _month+0, 0
	MOVWF      _p_month+0
	MOVF       _year+0, 0
	MOVWF      _p_year+0
;I2C.c,38 :: 		sec=Bcd2Dec(read_I2C(0xD0,0x00));
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	CLRF       FARG_read_I2C_buf_addr+0
	CLRF       FARG_read_I2C_buf_addr+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _sec+0
;I2C.c,39 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Check_time1:
	DECFSZ     R13+0, 1
	GOTO       L_Check_time1
	DECFSZ     R12+0, 1
	GOTO       L_Check_time1
	NOP
	NOP
;I2C.c,40 :: 		mins=Bcd2Dec(read_I2C(0xD0,0x01));
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      1
	MOVWF      FARG_read_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buf_addr+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _mins+0
;I2C.c,41 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Check_time2:
	DECFSZ     R13+0, 1
	GOTO       L_Check_time2
	DECFSZ     R12+0, 1
	GOTO       L_Check_time2
	NOP
	NOP
;I2C.c,42 :: 		hrs=Bcd2Dec(read_I2C(0XD0,0x02));
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      2
	MOVWF      FARG_read_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buf_addr+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _hrs+0
;I2C.c,43 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Check_time3:
	DECFSZ     R13+0, 1
	GOTO       L_Check_time3
	DECFSZ     R12+0, 1
	GOTO       L_Check_time3
	NOP
	NOP
;I2C.c,44 :: 		date=Bcd2Dec(read_I2C(0XD0,0x04));
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      4
	MOVWF      FARG_read_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buf_addr+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _date+0
;I2C.c,45 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Check_time4:
	DECFSZ     R13+0, 1
	GOTO       L_Check_time4
	DECFSZ     R12+0, 1
	GOTO       L_Check_time4
	NOP
	NOP
;I2C.c,46 :: 		month=Bcd2Dec(read_I2C(0XD0,0x05));
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      5
	MOVWF      FARG_read_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buf_addr+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _month+0
;I2C.c,47 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Check_time5:
	DECFSZ     R13+0, 1
	GOTO       L_Check_time5
	DECFSZ     R12+0, 1
	GOTO       L_Check_time5
	NOP
	NOP
;I2C.c,48 :: 		year=Bcd2Dec(read_I2C(0XD0,0x06));
	MOVLW      208
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      6
	MOVWF      FARG_read_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_read_I2C_buf_addr+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _year+0
;I2C.c,49 :: 		delay_ms(10);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_Check_time6:
	DECFSZ     R13+0, 1
	GOTO       L_Check_time6
	DECFSZ     R12+0, 1
	GOTO       L_Check_time6
	NOP
	NOP
;I2C.c,51 :: 		if(p_date!=date){ByteToStr(date,temp); lcd_puts2(30,1,temp+1); if(date<10) lcd_puts2(30,1,"0");}
	MOVF       _p_date+0, 0
	XORWF      _date+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Check_time7
	MOVF       _date+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Check_time_temp_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      30
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      1
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      Check_time_temp_L0+1
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      10
	SUBWF      _date+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_time8
	MOVLW      30
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      1
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr1_I2C+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
L_Check_time8:
L_Check_time7:
;I2C.c,52 :: 		if(p_month!=month){ByteToStr(month,temp); lcd_puts2(47,1,temp+1); if(month<10) lcd_puts2(47,1,"0");}
	MOVF       _p_month+0, 0
	XORWF      _month+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Check_time9
	MOVF       _month+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Check_time_temp_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      47
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      1
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      Check_time_temp_L0+1
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      10
	SUBWF      _month+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_time10
	MOVLW      47
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      1
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr2_I2C+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
L_Check_time10:
L_Check_time9:
;I2C.c,53 :: 		if(p_year!=year){ByteToStr(year,temp); lcd_puts2(75,1,temp+1);}
	MOVF       _p_year+0, 0
	XORWF      _year+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Check_time11
	MOVF       _year+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Check_time_temp_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      75
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      1
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      Check_time_temp_L0+1
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
L_Check_time11:
;I2C.c,55 :: 		if(p_hrs!=hrs){ByteToStr(hrs,temp); lcd_puts2(30,2,temp+1); if(hrs<10) lcd_puts2(30,2,"0");}
	MOVF       _p_hrs+0, 0
	XORWF      _hrs+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Check_time12
	MOVF       _hrs+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Check_time_temp_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      30
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      2
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      Check_time_temp_L0+1
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      10
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_time13
	MOVLW      30
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      2
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr3_I2C+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
L_Check_time13:
L_Check_time12:
;I2C.c,56 :: 		if(p_mins!=mins){ByteToStr(mins,temp); lcd_puts2(47,2,temp+1); if(mins<10) lcd_puts2(47,2,"0");}
	MOVF       _p_mins+0, 0
	XORWF      _mins+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Check_time14
	MOVF       _mins+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Check_time_temp_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      47
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      2
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      Check_time_temp_L0+1
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      10
	SUBWF      _mins+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_time15
	MOVLW      47
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      2
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr4_I2C+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
L_Check_time15:
L_Check_time14:
;I2C.c,57 :: 		if(p_sec!=sec){ByteToStr(sec,temp); lcd_puts2(65,2,temp+1); if(sec<10) lcd_puts2(65,2,"0");}
	MOVF       _p_sec+0, 0
	XORWF      _sec+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Check_time16
	MOVF       _sec+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      Check_time_temp_L0+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
	MOVLW      65
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      2
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      Check_time_temp_L0+1
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      10
	SUBWF      _sec+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_time17
	MOVLW      65
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      2
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr5_I2C+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
L_Check_time17:
L_Check_time16:
;I2C.c,59 :: 		}
L_end_Check_time:
	RETURN
; end of _Check_time
