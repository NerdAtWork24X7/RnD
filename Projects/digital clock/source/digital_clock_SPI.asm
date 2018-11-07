
_main:

;digital_clock_SPI.C,9 :: 		void main(void)
;digital_clock_SPI.C,12 :: 		TRISB=0x02;
	MOVLW      2
	MOVWF      TRISB+0
;digital_clock_SPI.C,13 :: 		TRISC=0x00;
	CLRF       TRISC+0
;digital_clock_SPI.C,14 :: 		ADCON0=0X00;
	CLRF       ADCON0+0
;digital_clock_SPI.C,15 :: 		ADCON1=0x00;
	CLRF       ADCON1+0
;digital_clock_SPI.C,16 :: 		Soft_I2C_Init();
	CALL       _Soft_I2C_Init+0
;digital_clock_SPI.C,17 :: 		SPI1_Init();
	CALL       _SPI1_Init+0
;digital_clock_SPI.C,18 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;digital_clock_SPI.C,19 :: 		init_LED_display();
	CALL       _init_LED_display+0
;digital_clock_SPI.C,22 :: 		print_string(1,4,0,"VS-CORP");
	MOVLW      1
	MOVWF      FARG_print_string_clean_video_mem+0
	MOVLW      4
	MOVWF      FARG_print_string_x_offset+0
	CLRF       FARG_print_string_y_offset+0
	MOVLW      ?lstr1_digital_clock_SPI+0
	MOVWF      FARG_print_string_string+0
	CALL       _print_string+0
;digital_clock_SPI.C,23 :: 		Check_time(); Check_date();
	CALL       _Check_time+0
	CALL       _Check_date+0
;digital_clock_SPI.C,24 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;digital_clock_SPI.C,26 :: 		while(1)
L_main1:
;digital_clock_SPI.C,31 :: 		for(i=0;i<5;i++){  Roll_time(); }
	CLRF       main_i_L0+0
L_main3:
	MOVLW      5
	SUBWF      main_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main4
	CALL       _Roll_time+0
	INCF       main_i_L0+0, 1
	GOTO       L_main3
L_main4:
;digital_clock_SPI.C,32 :: 		display_date();
	CALL       _display_date+0
;digital_clock_SPI.C,34 :: 		}
	GOTO       L_main1
;digital_clock_SPI.C,38 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
