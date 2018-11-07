
_init_lcd:

;lcd_driver.c,10 :: 		void init_lcd()
;lcd_driver.c,13 :: 		display_on();
	CALL       _display_on+0
;lcd_driver.c,14 :: 		set_start_line(0);
	CLRF       FARG_set_start_line_l+0
	CALL       _set_start_line+0
;lcd_driver.c,18 :: 		clr_lcd();
	CALL       _clr_lcd+0
;lcd_driver.c,19 :: 		picture(layout);
	MOVLW      _layout+0
	MOVWF      FARG_picture_val+0
	MOVLW      hi_addr(_layout+0)
	MOVWF      FARG_picture_val+1
	CALL       _picture+0
;lcd_driver.c,21 :: 		lcd_puts2(0,0,"555659");             //Equipment code
	CLRF       FARG_lcd_puts2_y+0
	CLRF       FARG_lcd_puts2_x+0
	MOVLW      ?lstr1_lcd_driver+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
;lcd_driver.c,22 :: 		lcd_notify_const(120,0,5);             //Battery indication
	MOVLW      120
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      5
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,23 :: 		delay_ms(50);  lcd_notify_const(120,0,4);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_init_lcd0:
	DECFSZ     R13+0, 1
	GOTO       L_init_lcd0
	DECFSZ     R12+0, 1
	GOTO       L_init_lcd0
	NOP
	NOP
	MOVLW      120
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      4
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,24 :: 		delay_ms(50);  lcd_notify_const(120,0,3);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_init_lcd1:
	DECFSZ     R13+0, 1
	GOTO       L_init_lcd1
	DECFSZ     R12+0, 1
	GOTO       L_init_lcd1
	NOP
	NOP
	MOVLW      120
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      3
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,25 :: 		delay_ms(50);  lcd_notify_const(120,0,2);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_init_lcd2:
	DECFSZ     R13+0, 1
	GOTO       L_init_lcd2
	DECFSZ     R12+0, 1
	GOTO       L_init_lcd2
	NOP
	NOP
	MOVLW      120
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      2
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,26 :: 		delay_ms(50);  lcd_notify_const(120,0,1);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_init_lcd3:
	DECFSZ     R13+0, 1
	GOTO       L_init_lcd3
	DECFSZ     R12+0, 1
	GOTO       L_init_lcd3
	NOP
	NOP
	MOVLW      120
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      1
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,27 :: 		delay_ms(50);  lcd_notify_const(120,0,0);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_init_lcd4:
	DECFSZ     R13+0, 1
	GOTO       L_init_lcd4
	DECFSZ     R12+0, 1
	GOTO       L_init_lcd4
	NOP
	NOP
	MOVLW      120
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	CLRF       FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,29 :: 		lcd_puts2(100,0,"45%");
	MOVLW      100
	MOVWF      FARG_lcd_puts2_y+0
	CLRF       FARG_lcd_puts2_x+0
	MOVLW      ?lstr2_lcd_driver+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
;lcd_driver.c,30 :: 		lcd_notify_const(90,0,10);             //Network
	MOVLW      90
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      10
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,31 :: 		lcd_notify_const(80,0,11);             //Start
	MOVLW      80
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      11
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,32 :: 		lcd_notify_const(80,0,12);             //Stop
	MOVLW      80
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      12
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,33 :: 		lcd_notify_const(70,0,13);             //Hooter
	MOVLW      70
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      13
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,34 :: 		lcd_notify_const(60,0,14);            //Light OFF
	MOVLW      60
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      14
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,35 :: 		lcd_notify_const(60,0,15);            //Light ON
	MOVLW      60
	MOVWF      FARG_lcd_notify_const_col+0
	CLRF       FARG_lcd_notify_const_page+0
	MOVLW      15
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,37 :: 		lcd_notify_const(15,2,17);            //UP  OFF
	MOVLW      15
	MOVWF      FARG_lcd_notify_const_col+0
	MOVLW      2
	MOVWF      FARG_lcd_notify_const_page+0
	MOVLW      17
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,38 :: 		lcd_notify_const(5,3,21);             //LEFT  OFF
	MOVLW      5
	MOVWF      FARG_lcd_notify_const_col+0
	MOVLW      3
	MOVWF      FARG_lcd_notify_const_page+0
	MOVLW      21
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,39 :: 		lcd_notify_const(15,4,19);            //DOWN   OFF
	MOVLW      15
	MOVWF      FARG_lcd_notify_const_col+0
	MOVLW      4
	MOVWF      FARG_lcd_notify_const_page+0
	MOVLW      19
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,40 :: 		lcd_notify_const(25,3,23);           //RIGHT  OFF
	MOVLW      25
	MOVWF      FARG_lcd_notify_const_col+0
	MOVLW      3
	MOVWF      FARG_lcd_notify_const_page+0
	MOVLW      23
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,48 :: 		lcd_notify_const(105,2,16);         //UP PRESSED
	MOVLW      105
	MOVWF      FARG_lcd_notify_const_col+0
	MOVLW      2
	MOVWF      FARG_lcd_notify_const_page+0
	MOVLW      16
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,49 :: 		lcd_notify_const(95,3,20);          //LEFT PRESSED
	MOVLW      95
	MOVWF      FARG_lcd_notify_const_col+0
	MOVLW      3
	MOVWF      FARG_lcd_notify_const_page+0
	MOVLW      20
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,50 :: 		lcd_notify_const(105,4,18);            //DOWN PRESSED
	MOVLW      105
	MOVWF      FARG_lcd_notify_const_col+0
	MOVLW      4
	MOVWF      FARG_lcd_notify_const_page+0
	MOVLW      18
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,51 :: 		lcd_notify_const(115,3,22);           //RIGHT PPRESSED
	MOVLW      115
	MOVWF      FARG_lcd_notify_const_col+0
	MOVLW      3
	MOVWF      FARG_lcd_notify_const_page+0
	MOVLW      22
	MOVWF      FARG_lcd_notify_const_num+0
	CALL       _lcd_notify_const+0
;lcd_driver.c,53 :: 		lcd_puts2(95,6,"LOAD");lcd_puts2(85,7,"45000KG");
	MOVLW      95
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      6
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr3_lcd_driver+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      85
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      7
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr4_lcd_driver+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
;lcd_driver.c,56 :: 		}
L_end_init_lcd:
	RETURN
; end of _init_lcd

_main:

;lcd_driver.c,58 :: 		void main()
;lcd_driver.c,60 :: 		Init();
	CALL       _Init+0
;lcd_driver.c,61 :: 		Init_lcd();
	CALL       _init_lcd+0
;lcd_driver.c,64 :: 		while(1)
L_main5:
;lcd_driver.c,67 :: 		}
	GOTO       L_main5
;lcd_driver.c,68 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
