
_write_I2C:

;I2C.c,12 :: 		void write_I2C(u8 sa_addr,u16 buf_addr,u8 dat)
;I2C.c,14 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;I2C.c,15 :: 		I2C1_Wr(sa_addr | ((buf_addr>>7)&0x0E));
	MOVLW      7
	MOVWF      R2+0
	MOVF       FARG_write_I2C_buf_addr+0, 0
	MOVWF      R0+0
	MOVF       FARG_write_I2C_buf_addr+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__write_I2C4:
	BTFSC      STATUS+0, 2
	GOTO       L__write_I2C5
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__write_I2C4
L__write_I2C5:
	MOVLW      14
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_write_I2C_sa_addr+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C.c,16 :: 		I2C1_Wr((u8)buf_addr&0xFF);
	MOVLW      255
	ANDWF      FARG_write_I2C_buf_addr+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C.c,17 :: 		I2C1_Wr(dat);
	MOVF       FARG_write_I2C_dat+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C.c,18 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;I2C.c,19 :: 		Delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_write_I2C0:
	DECFSZ     R13+0, 1
	GOTO       L_write_I2C0
	DECFSZ     R12+0, 1
	GOTO       L_write_I2C0
	NOP
;I2C.c,20 :: 		}
L_end_write_I2C:
	RETURN
; end of _write_I2C

_read_I2C:

;I2C.c,21 :: 		u8 read_I2C(u8 sa_addr,u16 buf_addr)
;I2C.c,23 :: 		u8 buf=0;
	CLRF       read_I2C_buf_L0+0
;I2C.c,24 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;I2C.c,25 :: 		I2C1_Wr(sa_addr | ((buf_addr>>7)&0x0E));
	MOVLW      7
	MOVWF      R2+0
	MOVF       FARG_read_I2C_buf_addr+0, 0
	MOVWF      R0+0
	MOVF       FARG_read_I2C_buf_addr+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__read_I2C7:
	BTFSC      STATUS+0, 2
	GOTO       L__read_I2C8
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__read_I2C7
L__read_I2C8:
	MOVLW      14
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_read_I2C_sa_addr+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C.c,26 :: 		I2C1_Wr((u8)buf_addr&0xFF);
	MOVLW      255
	ANDWF      FARG_read_I2C_buf_addr+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C.c,27 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;I2C.c,28 :: 		I2C1_wr(sa_addr|1);
	MOVLW      1
	IORWF      FARG_read_I2C_sa_addr+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;I2C.c,29 :: 		buf=I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      read_I2C_buf_L0+0
;I2C.c,30 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;I2C.c,31 :: 		return buf;
	MOVF       read_I2C_buf_L0+0, 0
	MOVWF      R0+0
;I2C.c,32 :: 		}
L_end_read_I2C:
	RETURN
; end of _read_I2C

_Check_time:

;I2C.c,33 :: 		void Check_time(void)
;I2C.c,35 :: 		prev_hrs=hrs;
	MOVF       _hrs+0, 0
	MOVWF      _prev_hrs+0
;I2C.c,36 :: 		prev_min=mins;
	MOVF       _mins+0, 0
	MOVWF      _prev_min+0
;I2C.c,37 :: 		mins=Bcd2Dec(read_I2C(0xD0,0x01));
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
;I2C.c,38 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Check_time1:
	DECFSZ     R13+0, 1
	GOTO       L_Check_time1
	DECFSZ     R12+0, 1
	GOTO       L_Check_time1
	NOP
;I2C.c,39 :: 		hrs=Bcd2Dec(read_I2C(0XD0,0x02));
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
;I2C.c,40 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Check_time2:
	DECFSZ     R13+0, 1
	GOTO       L_Check_time2
	DECFSZ     R12+0, 1
	GOTO       L_Check_time2
	NOP
;I2C.c,41 :: 		}
L_end_Check_time:
	RETURN
; end of _Check_time
