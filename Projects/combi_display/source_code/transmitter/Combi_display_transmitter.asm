
_init_uc:

;Combi_display_transmitter.c,6 :: 		void init_uc()
;Combi_display_transmitter.c,8 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Combi_display_transmitter.c,9 :: 		TRISB=0x00;
	CLRF       TRISB+0
;Combi_display_transmitter.c,10 :: 		TRISC=0xF0;
	MOVLW      240
	MOVWF      TRISC+0
;Combi_display_transmitter.c,11 :: 		ANSEL=0x00;
	CLRF       ANSEL+0
;Combi_display_transmitter.c,12 :: 		ANSELH=0x00;
	CLRF       ANSELH+0
;Combi_display_transmitter.c,13 :: 		}
L_end_init_uc:
	RETURN
; end of _init_uc

_send_data_lcd:

;Combi_display_transmitter.c,15 :: 		void send_data_lcd()
;Combi_display_transmitter.c,17 :: 		write_I2C(0xD2,CHANNEL_0,channel[0]);
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      16
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       _channel+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;Combi_display_transmitter.c,18 :: 		write_I2C(0xD2,CHANNEL_1,channel[1]);
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      17
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       _channel+1, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;Combi_display_transmitter.c,19 :: 		write_I2C(0xD2,CHANNEL_2,channel[2]);
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      18
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       _channel+2, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;Combi_display_transmitter.c,20 :: 		write_I2C(0xD2,CHANNEL_3,channel[3]);
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      19
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       _channel+3, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;Combi_display_transmitter.c,21 :: 		write_I2C(0xD2,CHANNEL_4,channel[4]);
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      20
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       _channel+4, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;Combi_display_transmitter.c,22 :: 		write_I2C(0xD2,CHANNEL_5,channel[5]);
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      21
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       _channel+5, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;Combi_display_transmitter.c,23 :: 		write_I2C(0xD2,RSSI,0x84);
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      32
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      132
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;Combi_display_transmitter.c,24 :: 		write_I2C(0xD2,WEIGHT,0x12);
	MOVLW      210
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      48
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      0
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVLW      18
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;Combi_display_transmitter.c,25 :: 		}
L_end_send_data_lcd:
	RETURN
; end of _send_data_lcd

_main:

;Combi_display_transmitter.c,26 :: 		main()
;Combi_display_transmitter.c,28 :: 		init_uc();
	CALL       _init_uc+0
;Combi_display_transmitter.c,30 :: 		while(1)
L_main0:
;Combi_display_transmitter.c,32 :: 		keyscan();
	CALL       _keyscan+0
;Combi_display_transmitter.c,33 :: 		PORTA=channel[0];
	MOVF       _channel+0, 0
	MOVWF      PORTA+0
;Combi_display_transmitter.c,34 :: 		PORTB=channel[1];
	MOVF       _channel+1, 0
	MOVWF      PORTB+0
;Combi_display_transmitter.c,35 :: 		send_data_lcd();
	CALL       _send_data_lcd+0
;Combi_display_transmitter.c,37 :: 		}
	GOTO       L_main0
;Combi_display_transmitter.c,38 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
