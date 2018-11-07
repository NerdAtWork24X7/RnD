
_main:

;fish_tank.c,9 :: 		void main()
;fish_tank.c,11 :: 		ANSELA = 0;                        // Configure AN pins as digital I/O
	CLRF       ANSELA+0
;fish_tank.c,12 :: 		ANSELB = 0;
	CLRF       ANSELB+0
;fish_tank.c,13 :: 		ANSELC=0;
	CLRF       ANSELC+0
;fish_tank.c,14 :: 		TRISA=0x33;                        //configure port as i/p and o/p
	MOVLW      51
	MOVWF      TRISA+0
;fish_tank.c,15 :: 		TRISB=TRISC=0x00;                  //Configure port B and C as o/p
	CLRF       TRISC+0
	MOVF       TRISC+0, 0
	MOVWF      TRISB+0
;fish_tank.c,16 :: 		LATA=LATB=LATC=0x00;
	CLRF       LATC+0
	MOVF       LATC+0, 0
	MOVWF      LATB+0
	MOVF       LATB+0, 0
	MOVWF      LATA+0
;fish_tank.c,17 :: 		Soft_I2C_Init();
	CALL       _Soft_I2C_Init+0
;fish_tank.c,18 :: 		pattern=read_I2C(0xA0,0x0210);   //read the pattern no from EEPROM
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      16
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      2
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0, 0
	MOVWF      _pattern+0
;fish_tank.c,19 :: 		if(pattern>6) pattern==0;
	MOVF       R0, 0
	SUBLW      6
	BTFSC      STATUS+0, 0
	GOTO       L_main0
L_main0:
;fish_tank.c,20 :: 		Init_PWM();
	CALL       _Init_PWM+0
;fish_tank.c,21 :: 		Check_time();
	CALL       _Check_time+0
;fish_tank.c,22 :: 		init_lcd();
	CALL       _init_lcd+0
;fish_tank.c,23 :: 		Display_Time();
	CALL       _Display_Time+0
;fish_tank.c,24 :: 		set_Intensity();
	CALL       _Set_Intensity+0
;fish_tank.c,25 :: 		prev_hrs=hrs;prev_min=mins;
	MOVF       _hrs+0, 0
	MOVWF      _prev_hrs+0
	MOVF       _mins+0, 0
	MOVWF      _prev_min+0
;fish_tank.c,26 :: 		while(1)
L_main1:
;fish_tank.c,29 :: 		if(!MENU)
	BTFSC      PORTA+0, 0
	GOTO       L_main3
;fish_tank.c,31 :: 		menu_fnc();
	CALL       _menu_fnc+0
;fish_tank.c,32 :: 		write_I2C(0xA0,0x0210,pattern);    //Writing the pattern to EEPROM
	MOVLW      160
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      16
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       _pattern+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;fish_tank.c,33 :: 		Check_time();
	CALL       _Check_time+0
;fish_tank.c,34 :: 		init_lcd();
	CALL       _init_lcd+0
;fish_tank.c,35 :: 		Display_Time();
	CALL       _Display_Time+0
;fish_tank.c,36 :: 		set_Intensity();
	CALL       _Set_Intensity+0
;fish_tank.c,37 :: 		}
L_main3:
;fish_tank.c,38 :: 		if(prev_min!=mins){init_lcd(); Display_Time();}          // Prepare and display on LCD
	MOVF       _prev_min+0, 0
	XORWF      _mins+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	CALL       _init_lcd+0
	CALL       _Display_Time+0
L_main4:
;fish_tank.c,39 :: 		if(prev_hrs!=hrs){init_lcd(); Display_Time(); set_Intensity(); }
	MOVF       _prev_hrs+0, 0
	XORWF      _hrs+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	CALL       _init_lcd+0
	CALL       _Display_Time+0
	CALL       _Set_Intensity+0
L_main5:
;fish_tank.c,40 :: 		Check_time();
	CALL       _Check_time+0
;fish_tank.c,41 :: 		}
	GOTO       L_main1
;fish_tank.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
