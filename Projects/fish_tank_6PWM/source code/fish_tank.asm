
_main:

;fish_tank.c,15 :: 		void main()
;fish_tank.c,17 :: 		ANSEL = 0x00;                        // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;fish_tank.c,18 :: 		ANSELH=0x00;
	CLRF       ANSELH+0
;fish_tank.c,19 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;fish_tank.c,20 :: 		TRISA=0x00;                 //configure port as o/p
	CLRF       TRISA+0
;fish_tank.c,21 :: 		TRISB=0xFF;                       //Configure port B i/p
	MOVLW      255
	MOVWF      TRISB+0
;fish_tank.c,22 :: 		delay_ms(1000);
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
;fish_tank.c,23 :: 		pattern=read_I2C(0xA0,0x0210);   //read the pattern no from EEPROM
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      16
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      2
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      _pattern+0
;fish_tank.c,24 :: 		write_I2C(0xD0,0x00,0x00);
	MOVLW      208
	MOVWF      FARG_write_I2C_sa_addr+0
	CLRF       FARG_write_I2C_buf_addr+0
	CLRF       FARG_write_I2C_buf_addr+1
	CLRF       FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;fish_tank.c,25 :: 		if(pattern>6 || pattern<0) pattern=0;
	MOVLW      128
	XORLW      6
	MOVWF      R0+0
	MOVLW      128
	XORWF      _pattern+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main21
	MOVLW      128
	XORWF      _pattern+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__main21
	GOTO       L_main3
L__main21:
	CLRF       _pattern+0
L_main3:
;fish_tank.c,26 :: 		Init_PWM();
	CALL       _Init_PWM+0
;fish_tank.c,27 :: 		Check_time();
	CALL       _Check_time+0
;fish_tank.c,28 :: 		CHECK_VALID_TIME
	MOVF       _sec+0, 0
	SUBLW      60
	BTFSS      STATUS+0, 0
	GOTO       L__main20
	MOVF       _mins+0, 0
	SUBLW      60
	BTFSS      STATUS+0, 0
	GOTO       L__main20
	MOVF       _hrs+0, 0
	SUBLW      24
	BTFSS      STATUS+0, 0
	GOTO       L__main20
	GOTO       L_main6
L__main20:
	CLRF       _sec+0
	CLRF       _mins+0
	CLRF       _hrs+0
L_main6:
;fish_tank.c,29 :: 		init_lcd();
	CALL       _init_lcd+0
;fish_tank.c,30 :: 		Display_Time();
	CALL       _Display_Time+0
;fish_tank.c,31 :: 		set_Intensity();
	CALL       _Set_Intensity+0
;fish_tank.c,32 :: 		prev_hrs=hrs;prev_min=mins;
	MOVF       _hrs+0, 0
	MOVWF      _prev_hrs+0
	MOVF       _mins+0, 0
	MOVWF      _prev_min+0
;fish_tank.c,33 :: 		while(1)
L_main7:
;fish_tank.c,35 :: 		if(!MENU)
	BTFSC      PORTB+0, 0
	GOTO       L_main9
;fish_tank.c,37 :: 		menu_fnc();
	CALL       _menu_fnc+0
;fish_tank.c,38 :: 		write_I2C(0xA0,0x0210,pattern);    //Writing the pattern to EEPROM
	MOVLW      160
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      16
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       _pattern+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;fish_tank.c,39 :: 		Check_time();
	CALL       _Check_time+0
;fish_tank.c,40 :: 		CHECK_VALID_TIME
	MOVF       _sec+0, 0
	SUBLW      60
	BTFSS      STATUS+0, 0
	GOTO       L__main19
	MOVF       _mins+0, 0
	SUBLW      60
	BTFSS      STATUS+0, 0
	GOTO       L__main19
	MOVF       _hrs+0, 0
	SUBLW      24
	BTFSS      STATUS+0, 0
	GOTO       L__main19
	GOTO       L_main12
L__main19:
	CLRF       _sec+0
	CLRF       _mins+0
	CLRF       _hrs+0
L_main12:
;fish_tank.c,41 :: 		init_lcd();
	CALL       _init_lcd+0
;fish_tank.c,42 :: 		Display_Time();
	CALL       _Display_Time+0
;fish_tank.c,43 :: 		set_Intensity();
	CALL       _Set_Intensity+0
;fish_tank.c,44 :: 		}
L_main9:
;fish_tank.c,45 :: 		if(prev_min!=mins){init_lcd(); Display_Time();}          // Prepare and display on LCD
	MOVF       _prev_min+0, 0
	XORWF      _mins+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	CALL       _init_lcd+0
	CALL       _Display_Time+0
L_main13:
;fish_tank.c,46 :: 		if(prev_hrs!=hrs){init_lcd(); Display_Time(); set_Intensity(); }
	MOVF       _prev_hrs+0, 0
	XORWF      _hrs+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	CALL       _init_lcd+0
	CALL       _Display_Time+0
	CALL       _Set_Intensity+0
L_main14:
;fish_tank.c,47 :: 		Check_time();
	CALL       _Check_time+0
;fish_tank.c,48 :: 		CHECK_VALID_TIME
	MOVF       _sec+0, 0
	SUBLW      60
	BTFSS      STATUS+0, 0
	GOTO       L__main18
	MOVF       _mins+0, 0
	SUBLW      60
	BTFSS      STATUS+0, 0
	GOTO       L__main18
	MOVF       _hrs+0, 0
	SUBLW      24
	BTFSS      STATUS+0, 0
	GOTO       L__main18
	GOTO       L_main17
L__main18:
	CLRF       _sec+0
	CLRF       _mins+0
	CLRF       _hrs+0
L_main17:
;fish_tank.c,49 :: 		}
	GOTO       L_main7
;fish_tank.c,50 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
