
_write_I2C:

;I2C.c,10 :: 		void write_I2C(uint8_t sa_addr,uint16_t buf_addr,uint8_t dat)
;I2C.c,12 :: 		Soft_I2C_Start();
	CALL       _Soft_I2C_Start+0
;I2C.c,13 :: 		Soft_I2C_Write(sa_addr | ((buf_addr>>7)&0x0E));
	MOVLW      7
	MOVWF      R2+0
	MOVF       FARG_write_I2C_buf_addr+0, 0
	MOVWF      R0+0
	MOVF       FARG_write_I2C_buf_addr+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__write_I2C2:
	BTFSC      STATUS+0, 2
	GOTO       L__write_I2C3
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__write_I2C2
L__write_I2C3:
	MOVLW      14
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_write_I2C_sa_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,14 :: 		Soft_I2C_Write((uint8_t)buf_addr&0xFF);
	MOVLW      255
	ANDWF      FARG_write_I2C_buf_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,15 :: 		Soft_I2C_Write(dat);
	MOVF       FARG_write_I2C_dat+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,16 :: 		Soft_I2C_Stop();
	CALL       _Soft_I2C_Stop+0
;I2C.c,17 :: 		Delay_ms(10);
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
;I2C.c,18 :: 		}
L_end_write_I2C:
	RETURN
; end of _write_I2C

_read_I2C:

;I2C.c,20 :: 		uint8_t read_I2C(uint8_t sa_addr,uint16_t buf_addr)
;I2C.c,22 :: 		uint8_t buf=0;
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
L__read_I2C5:
	BTFSC      STATUS+0, 2
	GOTO       L__read_I2C6
	RRF        R0+1, 1
	RRF        R0+0, 1
	BCF        R0+1, 7
	ADDLW      255
	GOTO       L__read_I2C5
L__read_I2C6:
	MOVLW      14
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	IORWF      FARG_read_I2C_sa_addr+0, 0
	MOVWF      FARG_Soft_I2C_Write_data_+0
	CALL       _Soft_I2C_Write+0
;I2C.c,25 :: 		Soft_I2C_Write((uint8_t)buf_addr&0xFF);
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
;I2C.c,30 :: 		return buf;
	MOVF       read_I2C_buf_L0+0, 0
	MOVWF      R0+0
;I2C.c,31 :: 		}
L_end_read_I2C:
	RETURN
; end of _read_I2C
