
_write_I2C:

;I2C.c,11 :: 		void write_I2C(u8 sa_addr,u16 buf_addr,u8 dat)
;I2C.c,13 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;I2C.c,14 :: 		Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
	MOVLW      7
	MOVWF      R2+0
	MOVF       FARG_write_I2C_buf_addr+0, 0
	MOVWF      R0+0
	MOVF       FARG_write_I2C_buf_addr+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__write_I2C3:
	BTFSC      STATUS+0, 2
	GOTO       L__write_I2C4
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__write_I2C3
L__write_I2C4:
	MOVLW      14
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_write_I2C_sa_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,15 :: 		Soft_I2C_Write((u8)buf_addr&0xFF);
	MOVLW      255
	ANDWF      FARG_write_I2C_buf_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,16 :: 		Soft_I2C_Write(dat);
	MOVF       FARG_write_I2C_dat+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,17 :: 		Soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;I2C.c,18 :: 		Delay_ms(5);
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
;I2C.c,19 :: 		}
L_end_write_I2C:
	RETURN
; end of _write_I2C

_read_I2C:

;I2C.c,20 :: 		u8 read_I2C(u8 sa_addr,u16 buf_addr)
;I2C.c,22 :: 		u8 buf=0;
	CLRF       read_I2C_buf_L0+0
;I2C.c,23 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;I2C.c,24 :: 		Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
	MOVLW      7
	MOVWF      R2+0
	MOVF       FARG_read_I2C_buf_addr+0, 0
	MOVWF      R0+0
	MOVF       FARG_read_I2C_buf_addr+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__read_I2C6:
	BTFSC      STATUS+0, 2
	GOTO       L__read_I2C7
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__read_I2C6
L__read_I2C7:
	MOVLW      14
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_read_I2C_sa_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,25 :: 		Soft_I2C_Write((u8)buf_addr&0xFF);
	MOVLW      255
	ANDWF      FARG_read_I2C_buf_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,26 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;I2C.c,27 :: 		Soft_I2C_write(sa_addr|1);
	MOVLW      1
	IORWF      FARG_read_I2C_sa_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,28 :: 		buf=Soft_I2C_Read(0);
	CLRF       FARG_Soft_I2C_Read_ack+0
	CLRF       FARG_Soft_I2C_Read_ack+1
	CALL       _Soft_I2C_Read+0
	MOVF       R0+0, 0
	MOVWF      read_I2C_buf_L0+0
;I2C.c,29 :: 		Soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;I2C.c,30 :: 		Delay_ms(5);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_read_I2C1:
	DECFSZ     R13+0, 1
	GOTO       L_read_I2C1
	DECFSZ     R12+0, 1
	GOTO       L_read_I2C1
	NOP
	NOP
;I2C.c,31 :: 		return buf;
	MOVF       read_I2C_buf_L0+0, 0
	MOVWF      R0+0
;I2C.c,32 :: 		}
L_end_read_I2C:
	RETURN
; end of _read_I2C

_Check_time:

;I2C.c,34 :: 		void Check_time(void)
;I2C.c,36 :: 		prev_hrs=hrs;
	MOVF       _hrs+0, 0
	MOVWF      _prev_hrs+0
;I2C.c,37 :: 		prev_min=mins;
	MOVF       _mins+0, 0
	MOVWF      _prev_min+0
;I2C.c,38 :: 		prev_sec=sec;
	MOVF       _sec+0, 0
	MOVWF      _prev_sec+0
;I2C.c,39 :: 		sec=Bcd2Dec(read_I2C(0xD0,0x00));
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
;I2C.c,41 :: 		hrs=Bcd2Dec(read_I2C(0XD0,0x02));
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
;I2C.c,42 :: 		}
L_end_Check_time:
	RETURN
; end of _Check_time
