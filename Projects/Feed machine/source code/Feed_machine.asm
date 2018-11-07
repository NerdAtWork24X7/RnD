
_main:

;Feed_machine.c,12 :: 		void main()
;Feed_machine.c,14 :: 		ANSEL = 0x00;                        // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;Feed_machine.c,15 :: 		ANSELH=0x00;
	CLRF       ANSELH+0
;Feed_machine.c,16 :: 		TRISA=0x00;                 //configure port as o/p
	CLRF       TRISA+0
;Feed_machine.c,17 :: 		TRISB=0x0F;                       //Configure port B i/p
	MOVLW      15
	MOVWF      TRISB+0
;Feed_machine.c,18 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Feed_machine.c,19 :: 		Soft_I2C_Init();
	CALL       _Soft_I2C_Init+0
;Feed_machine.c,20 :: 		pattern=read_I2C(0xA0,0x0210);   //read the pattern no from EEPROM
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVLW      16
	MOVWF      FARG_read_I2C_buff_add+0
	MOVLW      2
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       R0+0, 0
	MOVWF      _pattern+0
;Feed_machine.c,21 :: 		if(pattern>6) pattern==0;
	MOVF       R0+0, 0
	SUBLW      6
	BTFSC      STATUS+0, 0
	GOTO       L_main0
L_main0:
;Feed_machine.c,22 :: 		Check_time();
	CALL       _Check_time+0
;Feed_machine.c,23 :: 		init_lcd();
	CALL       _init_lcd+0
;Feed_machine.c,24 :: 		Display_Time();
	CALL       _Display_Time+0
;Feed_machine.c,25 :: 		set_Intensity();
	CALL       _Set_Intensity+0
;Feed_machine.c,26 :: 		prev_hrs=hrs;prev_min=mins;prev_sec=sec;
	MOVF       _hrs+0, 0
	MOVWF      _prev_hrs+0
	MOVF       _mins+0, 0
	MOVWF      _prev_min+0
	MOVF       _sec+0, 0
	MOVWF      _prev_sec+0
;Feed_machine.c,27 :: 		while(1)
L_main1:
;Feed_machine.c,30 :: 		if(!MENU)
	BTFSC      PORTB+0, 0
	GOTO       L_main3
;Feed_machine.c,32 :: 		menu_fnc();
	CALL       _menu_fnc+0
;Feed_machine.c,33 :: 		write_I2C(0xA0,0x0210,pattern);    //Writing the pattern to EEPROM
	MOVLW      160
	MOVWF      FARG_write_I2C_sa_addr+0
	MOVLW      16
	MOVWF      FARG_write_I2C_buf_addr+0
	MOVLW      2
	MOVWF      FARG_write_I2C_buf_addr+1
	MOVF       _pattern+0, 0
	MOVWF      FARG_write_I2C_dat+0
	CALL       _write_I2C+0
;Feed_machine.c,34 :: 		Check_time();
	CALL       _Check_time+0
;Feed_machine.c,35 :: 		init_lcd();
	CALL       _init_lcd+0
;Feed_machine.c,36 :: 		Display_Time();
	CALL       _Display_Time+0
;Feed_machine.c,37 :: 		set_Intensity();
	CALL       _Set_Intensity+0
;Feed_machine.c,38 :: 		}
L_main3:
;Feed_machine.c,39 :: 		if(prev_min!=mins){init_lcd(); Display_Time();}          // Prepare and display on LCD
	MOVF       _prev_min+0, 0
	XORWF      _mins+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main4
	CALL       _init_lcd+0
	CALL       _Display_Time+0
L_main4:
;Feed_machine.c,40 :: 		if(prev_hrs!=hrs){init_lcd(); Display_Time();}
	MOVF       _prev_hrs+0, 0
	XORWF      _hrs+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
	CALL       _init_lcd+0
	CALL       _Display_Time+0
L_main5:
;Feed_machine.c,41 :: 		if(prev_sec!=sec){set_Intensity(); }
	MOVF       _prev_sec+0, 0
	XORWF      _sec+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	CALL       _Set_Intensity+0
L_main6:
;Feed_machine.c,42 :: 		Check_time();
	CALL       _Check_time+0
;Feed_machine.c,44 :: 		}
	GOTO       L_main1
;Feed_machine.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
