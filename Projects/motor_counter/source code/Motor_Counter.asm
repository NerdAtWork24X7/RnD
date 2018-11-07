
_init_mcu:

;Motor_Counter.c,13 :: 		void init_mcu()
;Motor_Counter.c,16 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Motor_Counter.c,17 :: 		TRISB=0x01;
	MOVLW      1
	MOVWF      TRISB+0
;Motor_Counter.c,18 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Motor_Counter.c,19 :: 		ANSEL = 0;                        // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;Motor_Counter.c,20 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Motor_Counter.c,21 :: 		}
L_end_init_mcu:
	RETURN
; end of _init_mcu

_init_lcd:

;Motor_Counter.c,23 :: 		void init_lcd()
;Motor_Counter.c,26 :: 		display_on();
	CALL       _display_on+0
;Motor_Counter.c,27 :: 		set_start_line(0);
	CLRF       FARG_set_start_line_l+0
	CALL       _set_start_line+0
;Motor_Counter.c,28 :: 		picture(&logo[0]);
	MOVLW      _logo+0
	MOVWF      FARG_picture_val+0
	MOVLW      hi_addr(_logo+0)
	MOVWF      FARG_picture_val+1
	CALL       _picture+0
;Motor_Counter.c,29 :: 		for(i=20;i>0;i--)
	MOVLW      20
	MOVWF      init_lcd_i_L0+0
L_init_lcd0:
	MOVF       init_lcd_i_L0+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_init_lcd1
;Motor_Counter.c,30 :: 		delay(6500);
	MOVLW      100
	MOVWF      FARG_delay_j+0
	MOVLW      25
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;Motor_Counter.c,29 :: 		for(i=20;i>0;i--)
	DECF       init_lcd_i_L0+0, 1
;Motor_Counter.c,30 :: 		delay(6500);
	GOTO       L_init_lcd0
L_init_lcd1:
;Motor_Counter.c,31 :: 		clr_lcd();
	CALL       _clr_lcd+0
;Motor_Counter.c,33 :: 		lcd_puts1(0,0,"*****SV-CORP****");
	CLRF       FARG_lcd_puts1_y+0
	CLRF       FARG_lcd_puts1_x+0
	MOVLW      ?lstr1_Motor_Counter+0
	MOVWF      FARG_lcd_puts1_str+0
	CALL       _lcd_puts1+0
;Motor_Counter.c,34 :: 		lcd_puts2(0,1,"DATE:-"); lcd_puts2(42,1,":"); lcd_puts2(59,1,":"); lcd_puts2(65,1,"20");
	CLRF       FARG_lcd_puts2_y+0
	MOVLW      1
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr2_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      42
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      1
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr3_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      59
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      1
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr4_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      65
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      1
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr5_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
;Motor_Counter.c,35 :: 		lcd_puts2(0,2,"TIME:-"); lcd_puts2(42,2,":"); lcd_puts2(59,2,":");
	CLRF       FARG_lcd_puts2_y+0
	MOVLW      2
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr6_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      42
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      2
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr7_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      59
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      2
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr8_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
;Motor_Counter.c,37 :: 		lcd_puts2(0,4,"MOTOR:-");  lcd_puts2(37,4,"00");
	CLRF       FARG_lcd_puts2_y+0
	MOVLW      4
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr9_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      37
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      4
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr10_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
;Motor_Counter.c,38 :: 		lcd_puts2(64,4,"ROT:-");  lcd_puts2(91,4,"00");
	MOVLW      64
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      4
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr11_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      91
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      4
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr12_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
;Motor_Counter.c,39 :: 		lcd_puts2(0,5,"COMP:-");  lcd_puts2(32,5,"00");
	CLRF       FARG_lcd_puts2_y+0
	MOVLW      5
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr13_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      32
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      5
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr14_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
;Motor_Counter.c,40 :: 		lcd_puts2(64,5,"REM:-"); lcd_puts2(91,5,"00");
	MOVLW      64
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      5
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr15_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      91
	MOVWF      FARG_lcd_puts2_y+0
	MOVLW      5
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr16_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
;Motor_Counter.c,41 :: 		lcd_puts2(0,7,"STATUS:-"); lcd_puts2_const(42,7,stop);
	CLRF       FARG_lcd_puts2_y+0
	MOVLW      7
	MOVWF      FARG_lcd_puts2_x+0
	MOVLW      ?lstr17_Motor_Counter+0
	MOVWF      FARG_lcd_puts2_str+0
	CALL       _lcd_puts2+0
	MOVLW      42
	MOVWF      FARG_lcd_puts2_const_y+0
	MOVLW      7
	MOVWF      FARG_lcd_puts2_const_x+0
	MOVLW      _stop+0
	MOVWF      FARG_lcd_puts2_const_str+0
	MOVLW      hi_addr(_stop+0)
	MOVWF      FARG_lcd_puts2_const_str+1
	CALL       _lcd_puts2_const+0
;Motor_Counter.c,43 :: 		}
L_end_init_lcd:
	RETURN
; end of _init_lcd

_main:

;Motor_Counter.c,45 :: 		void main()
;Motor_Counter.c,48 :: 		init_mcu();
	CALL       _init_mcu+0
;Motor_Counter.c,49 :: 		init_lcd();
	CALL       _init_lcd+0
;Motor_Counter.c,50 :: 		while(1)
L_main3:
;Motor_Counter.c,51 :: 		Check_time();
	CALL       _Check_time+0
	GOTO       L_main3
;Motor_Counter.c,53 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
