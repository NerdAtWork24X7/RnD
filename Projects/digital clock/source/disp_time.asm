
_init_LED_display:

;disp_time.c,18 :: 		void init_LED_display()
;disp_time.c,21 :: 		shift_out_data_to_unit(0,0x09,0x00);        //no decode digits
	CLRF       FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      9
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,22 :: 		shift_out_data_to_unit(1,0x09,0x00);        //no decode digits
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      9
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,23 :: 		shift_out_data_to_unit(2,0x09,0x00);        //no decode digits
	MOVLW      2
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      9
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,24 :: 		shift_out_data_to_unit(3,0x09,0x00);        //no decode digits
	MOVLW      3
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      9
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,25 :: 		shift_out_data_to_unit(4,0x09,0x00);        //no decode digits
	MOVLW      4
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      9
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,26 :: 		shift_out_data_to_unit(5,0x09,0x00);        //no decode digits
	MOVLW      5
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      9
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,29 :: 		shift_out_data_to_unit(0,0x0b,0x07);        //no decode digits
	CLRF       FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      11
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      7
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,30 :: 		shift_out_data_to_unit(1,0x0b,0x07);        //no decode digits
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      11
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      7
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,31 :: 		shift_out_data_to_unit(2,0x0b,0x07);        //no decode digits
	MOVLW      2
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      11
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      7
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,32 :: 		shift_out_data_to_unit(3,0x0b,0x07);        //no decode digits
	MOVLW      3
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      11
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      7
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,33 :: 		shift_out_data_to_unit(4,0x0b,0x07);        //no decode digits
	MOVLW      4
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      11
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      7
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,34 :: 		shift_out_data_to_unit(5,0x0b,0x07);        //no decode digits
	MOVLW      5
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      11
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      7
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,37 :: 		shift_out_data_to_unit(0,0x0C,0x01);
	CLRF       FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      12
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,38 :: 		shift_out_data_to_unit(1,0x0C,0x01);
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      12
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,39 :: 		shift_out_data_to_unit(2,0x0C,0x01);
	MOVLW      2
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      12
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,40 :: 		shift_out_data_to_unit(3,0x0C,0x01);
	MOVLW      3
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      12
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,41 :: 		shift_out_data_to_unit(4,0x0C,0x01);
	MOVLW      4
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      12
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,42 :: 		shift_out_data_to_unit(5,0x0C,0x01);
	MOVLW      5
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      12
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,45 :: 		shift_out_data_to_unit(0,0x0a,0x0f);        //15
	CLRF       FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      10
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,46 :: 		shift_out_data_to_unit(1,0x0a,0x0f);        //15
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      10
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,47 :: 		shift_out_data_to_unit(2,0x0a,0x0f);        //15
	MOVLW      2
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      10
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,48 :: 		shift_out_data_to_unit(3,0x0a,0x0f);        //15
	MOVLW      3
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      10
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,49 :: 		shift_out_data_to_unit(4,0x0a,0x0f);        //15
	MOVLW      4
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      10
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,50 :: 		shift_out_data_to_unit(5,0x0a,0x0f);        //15
	MOVLW      5
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      10
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,52 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;disp_time.c,53 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;disp_time.c,56 :: 		shift_out_data_to_unit(0,15,1);
	CLRF       FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,57 :: 		shift_out_data_to_unit(1,15,1);
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,58 :: 		shift_out_data_to_unit(2,15,1);
	MOVLW      2
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,59 :: 		shift_out_data_to_unit(3,15,1);
	MOVLW      3
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,60 :: 		shift_out_data_to_unit(4,15,1);
	MOVLW      4
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,61 :: 		shift_out_data_to_unit(5,15,1);
	MOVLW      5
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,63 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_init_LED_display0:
	DECFSZ     R13+0, 1
	GOTO       L_init_LED_display0
	DECFSZ     R12+0, 1
	GOTO       L_init_LED_display0
	DECFSZ     R11+0, 1
	GOTO       L_init_LED_display0
	NOP
	NOP
;disp_time.c,64 :: 		shift_out_data_to_unit(0,15,0);
	CLRF       FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,65 :: 		shift_out_data_to_unit(1,15,0);
	MOVLW      1
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,66 :: 		shift_out_data_to_unit(2,15,0);
	MOVLW      2
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,67 :: 		shift_out_data_to_unit(3,15,0);
	MOVLW      3
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,68 :: 		shift_out_data_to_unit(4,15,0);
	MOVLW      4
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,69 :: 		shift_out_data_to_unit(5,15,0);
	MOVLW      5
	MOVWF      FARG_shift_out_data_to_unit_num_of_unit+0
	MOVLW      15
	MOVWF      FARG_shift_out_data_to_unit_ADDR+0
	CLRF       FARG_shift_out_data_to_unit_DATA+0
	CALL       _shift_out_data_to_unit+0
;disp_time.c,70 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_init_LED_display1:
	DECFSZ     R13+0, 1
	GOTO       L_init_LED_display1
	DECFSZ     R12+0, 1
	GOTO       L_init_LED_display1
	DECFSZ     R11+0, 1
	GOTO       L_init_LED_display1
	NOP
	NOP
;disp_time.c,72 :: 		}
L_end_init_LED_display:
	RETURN
; end of _init_LED_display

_display_test:

;disp_time.c,76 :: 		void display_test()
;disp_time.c,79 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;disp_time.c,80 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;disp_time.c,81 :: 		for(i=1;i<9;i++)
	MOVLW      1
	MOVWF      display_test_i_L0+0
L_display_test2:
	MOVLW      9
	SUBWF      display_test_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_test3
;disp_time.c,83 :: 		for(j=1;j<49;j++)
	MOVLW      1
	MOVWF      display_test_j_L0+0
L_display_test5:
	MOVLW      49
	SUBWF      display_test_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_test6
;disp_time.c,85 :: 		set_bode_to_videoMem(j,i);
	MOVF       display_test_j_L0+0, 0
	MOVWF      FARG_set_bode_to_videoMem_x+0
	MOVF       display_test_i_L0+0, 0
	MOVWF      FARG_set_bode_to_videoMem_y+0
	CALL       _set_bode_to_videoMem+0
;disp_time.c,86 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;disp_time.c,87 :: 		delay_us(100);
	MOVLW      66
	MOVWF      R13+0
L_display_test8:
	DECFSZ     R13+0, 1
	GOTO       L_display_test8
	NOP
;disp_time.c,83 :: 		for(j=1;j<49;j++)
	INCF       display_test_j_L0+0, 1
;disp_time.c,88 :: 		}
	GOTO       L_display_test5
L_display_test6:
;disp_time.c,81 :: 		for(i=1;i<9;i++)
	INCF       display_test_i_L0+0, 1
;disp_time.c,89 :: 		}
	GOTO       L_display_test2
L_display_test3:
;disp_time.c,90 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;disp_time.c,91 :: 		}
L_end_display_test:
	RETURN
; end of _display_test

_display_time:

;disp_time.c,95 :: 		void display_time()
;disp_time.c,97 :: 		sint8_t row=0,col=0,temp=0;
;disp_time.c,99 :: 		len=2;
	MOVLW      2
	MOVWF      _len+0
;disp_time.c,100 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;disp_time.c,101 :: 		temp=(hrs>>4&0x0f)+48;  set_char_5x7_on_XY(len,0,temp);      len+=bufferLong[7];
	MOVF       _hrs+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	MOVLW      15
	ANDWF      FARG_set_char_5x7_on_XY_character+0, 1
	MOVLW      48
	ADDWF      FARG_set_char_5x7_on_XY_character+0, 1
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       _bufferLong+7, 0
	ADDWF      _len+0, 1
;disp_time.c,102 :: 		temp=(hrs&0x0f)+48;     set_char_5x7_on_XY(len,0,temp);     len+=bufferLong[7]+1;
	MOVLW      15
	ANDWF      _hrs+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	MOVLW      48
	ADDWF      FARG_set_char_5x7_on_XY_character+0, 1
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	CALL       _set_char_5x7_on_XY+0
	INCF       _bufferLong+7, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      _len+0, 1
;disp_time.c,103 :: 		set_char_5x7_on_XY(len,0,':');       len+=bufferLong[7]+1;
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      58
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	INCF       _bufferLong+7, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      _len+0, 1
;disp_time.c,105 :: 		temp=(mins>>4&0x0f)+48;  set_char_5x7_on_XY(len,0,temp);     len+=bufferLong[7];
	MOVF       _mins+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	MOVLW      15
	ANDWF      FARG_set_char_5x7_on_XY_character+0, 1
	MOVLW      48
	ADDWF      FARG_set_char_5x7_on_XY_character+0, 1
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       _bufferLong+7, 0
	ADDWF      _len+0, 1
;disp_time.c,106 :: 		temp=(mins&0x0f)+48;     set_char_5x7_on_XY(len,0,temp);     len+=bufferLong[7]+1;
	MOVLW      15
	ANDWF      _mins+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	MOVLW      48
	ADDWF      FARG_set_char_5x7_on_XY_character+0, 1
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	CALL       _set_char_5x7_on_XY+0
	INCF       _bufferLong+7, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      _len+0, 1
;disp_time.c,107 :: 		set_char_5x7_on_XY(len,0,':');      len+=bufferLong[7]+1;
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      58
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	INCF       _bufferLong+7, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      _len+0, 1
;disp_time.c,109 :: 		temp=(sec>>4&0x0f)+48;  set_char_5x7_on_XY(len,0,temp);      len+=bufferLong[7];
	MOVF       _sec+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	RRF        FARG_set_char_5x7_on_XY_character+0, 1
	BCF        FARG_set_char_5x7_on_XY_character+0, 7
	MOVLW      15
	ANDWF      FARG_set_char_5x7_on_XY_character+0, 1
	MOVLW      48
	ADDWF      FARG_set_char_5x7_on_XY_character+0, 1
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       _bufferLong+7, 0
	ADDWF      _len+0, 1
;disp_time.c,110 :: 		temp=(sec&0x0f)+48;     set_char_5x7_on_XY(len,0,temp);                            //set_char_5x7_on_XY(38,i-8,'5');
	MOVLW      15
	ANDWF      _sec+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	MOVLW      48
	ADDWF      FARG_set_char_5x7_on_XY_character+0, 1
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	CALL       _set_char_5x7_on_XY+0
;disp_time.c,112 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;disp_time.c,114 :: 		}
L_end_display_time:
	RETURN
; end of _display_time

_display_date:

;disp_time.c,118 :: 		void display_date()
;disp_time.c,124 :: 		date_buff[0]=(date>>4&0x0f)+48;
	MOVF       _date+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      48
	ADDWF      R0+0, 1
	MOVF       R0+0, 0
	MOVWF      display_date_date_buff_L0+0
;disp_time.c,125 :: 		date_buff[1]=(date&0x0f)+48;
	MOVLW      15
	ANDWF      _date+0, 0
	MOVWF      display_date_date_buff_L0+1
	MOVLW      48
	ADDWF      display_date_date_buff_L0+1, 1
;disp_time.c,126 :: 		date_buff[2]=':';
	MOVLW      58
	MOVWF      display_date_date_buff_L0+2
;disp_time.c,127 :: 		date_buff[3]=(month>>4&0x0f)+48;
	MOVF       _month+0, 0
	MOVWF      display_date_date_buff_L0+3
	RRF        display_date_date_buff_L0+3, 1
	BCF        display_date_date_buff_L0+3, 7
	RRF        display_date_date_buff_L0+3, 1
	BCF        display_date_date_buff_L0+3, 7
	RRF        display_date_date_buff_L0+3, 1
	BCF        display_date_date_buff_L0+3, 7
	RRF        display_date_date_buff_L0+3, 1
	BCF        display_date_date_buff_L0+3, 7
	MOVLW      15
	ANDWF      display_date_date_buff_L0+3, 1
	MOVLW      48
	ADDWF      display_date_date_buff_L0+3, 1
;disp_time.c,128 :: 		date_buff[4]=(month&0x0f)+48;
	MOVLW      15
	ANDWF      _month+0, 0
	MOVWF      display_date_date_buff_L0+4
	MOVLW      48
	ADDWF      display_date_date_buff_L0+4, 1
;disp_time.c,129 :: 		date_buff[5]=':';
	MOVLW      58
	MOVWF      display_date_date_buff_L0+5
;disp_time.c,130 :: 		date_buff[6]=(year>>4&0x0f)+48;
	MOVF       _year+0, 0
	MOVWF      display_date_date_buff_L0+6
	RRF        display_date_date_buff_L0+6, 1
	BCF        display_date_date_buff_L0+6, 7
	RRF        display_date_date_buff_L0+6, 1
	BCF        display_date_date_buff_L0+6, 7
	RRF        display_date_date_buff_L0+6, 1
	BCF        display_date_date_buff_L0+6, 7
	RRF        display_date_date_buff_L0+6, 1
	BCF        display_date_date_buff_L0+6, 7
	MOVLW      15
	ANDWF      display_date_date_buff_L0+6, 1
	MOVLW      48
	ADDWF      display_date_date_buff_L0+6, 1
;disp_time.c,131 :: 		date_buff[7]=(year&0x0f)+48;
	MOVLW      15
	ANDWF      _year+0, 0
	MOVWF      display_date_date_buff_L0+7
	MOVLW      48
	ADDWF      display_date_date_buff_L0+7, 1
;disp_time.c,132 :: 		date_buff[8]='\0';
	CLRF       display_date_date_buff_L0+8
;disp_time.c,134 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;disp_time.c,136 :: 		for(i=48;i>-48;i--)
	MOVLW      48
	MOVWF      display_date_i_L0+0
L_display_date9:
	MOVLW      128
	XORLW      208
	MOVWF      R0+0
	MOVLW      128
	XORWF      display_date_i_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_date10
;disp_time.c,138 :: 		print_string(1,i,0,date_buff); if(i==5) {delay_ms(1000);}
	MOVLW      1
	MOVWF      FARG_print_string_clean_video_mem+0
	MOVF       display_date_i_L0+0, 0
	MOVWF      FARG_print_string_x_offset+0
	CLRF       FARG_print_string_y_offset+0
	MOVLW      display_date_date_buff_L0+0
	MOVWF      FARG_print_string_string+0
	CALL       _print_string+0
	MOVF       display_date_i_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_display_date12
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_display_date13:
	DECFSZ     R13+0, 1
	GOTO       L_display_date13
	DECFSZ     R12+0, 1
	GOTO       L_display_date13
	DECFSZ     R11+0, 1
	GOTO       L_display_date13
	NOP
	NOP
L_display_date12:
;disp_time.c,139 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_display_date14:
	DECFSZ     R13+0, 1
	GOTO       L_display_date14
	DECFSZ     R12+0, 1
	GOTO       L_display_date14
	NOP
	NOP
;disp_time.c,136 :: 		for(i=48;i>-48;i--)
	DECF       display_date_i_L0+0, 1
;disp_time.c,140 :: 		}
	GOTO       L_display_date9
L_display_date10:
;disp_time.c,142 :: 		}
L_end_display_date:
	RETURN
; end of _display_date

_Roll_time:

;disp_time.c,144 :: 		void Roll_time()
;disp_time.c,146 :: 		sint8_t i,j,prev=0,next=0,len=0;
	CLRF       Roll_time_prev_L0+0
	CLRF       Roll_time_next_L0+0
	CLRF       Roll_time_len_L0+0
;disp_time.c,147 :: 		p_hrs=hrs,p_mins=mins,p_sec=sec;
	MOVF       _hrs+0, 0
	MOVWF      _p_hrs+0
	MOVF       _mins+0, 0
	MOVWF      _p_mins+0
	MOVF       _sec+0, 0
	MOVWF      _p_sec+0
;disp_time.c,148 :: 		check_time();
	CALL       _Check_time+0
;disp_time.c,149 :: 		for(i=0;i<9;i++)
	CLRF       Roll_time_i_L0+0
L_Roll_time15:
	MOVLW      128
	XORWF      Roll_time_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      9
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Roll_time16
;disp_time.c,151 :: 		len=2;
	MOVLW      2
	MOVWF      Roll_time_len_L0+0
;disp_time.c,152 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;disp_time.c,154 :: 		next=(hrs>>4&0x0f)+48; prev=(p_hrs>>4&0x0f)+48;
	MOVF       _hrs+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      Roll_time_next_L0+0
	MOVF       _p_hrs+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      Roll_time_prev_L0+0
;disp_time.c,155 :: 		if(prev==next){set_char_5x7_on_XY(len,0,next);}
	MOVF       R1+0, 0
	XORWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Roll_time18
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	GOTO       L_Roll_time19
L_Roll_time18:
;disp_time.c,156 :: 		else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next); }
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVF       Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_prev_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVLW      8
	SUBWF      Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
L_Roll_time19:
;disp_time.c,157 :: 		len+=bufferLong[7];
	MOVF       _bufferLong+7, 0
	ADDWF      Roll_time_len_L0+0, 1
;disp_time.c,159 :: 		next=(hrs&0x0f)+48; prev=(p_hrs&0x0f)+48;
	MOVLW      15
	ANDWF      _hrs+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      Roll_time_next_L0+0
	MOVLW      15
	ANDWF      _p_hrs+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      Roll_time_prev_L0+0
;disp_time.c,160 :: 		if(prev==next){ set_char_5x7_on_XY(len,0,next);}
	MOVF       R1+0, 0
	XORWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Roll_time20
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	GOTO       L_Roll_time21
L_Roll_time20:
;disp_time.c,161 :: 		else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVF       Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_prev_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVLW      8
	SUBWF      Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
L_Roll_time21:
;disp_time.c,162 :: 		len+=bufferLong[7];
	MOVF       _bufferLong+7, 0
	ADDWF      Roll_time_len_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      Roll_time_len_L0+0
;disp_time.c,164 :: 		set_char_5x7_on_XY(len,0,':');       len+=bufferLong[7]+1;
	MOVF       R0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      58
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	INCF       _bufferLong+7, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      Roll_time_len_L0+0, 1
;disp_time.c,166 :: 		next=(mins>>4&0x0f)+48;  prev=(p_mins>>4&0x0f)+48;
	MOVF       _mins+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      Roll_time_next_L0+0
	MOVF       _p_mins+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      Roll_time_prev_L0+0
;disp_time.c,167 :: 		if(prev==next){set_char_5x7_on_XY(len,0,next);}
	MOVF       R1+0, 0
	XORWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Roll_time22
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	GOTO       L_Roll_time23
L_Roll_time22:
;disp_time.c,168 :: 		else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVF       Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_prev_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVLW      8
	SUBWF      Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
L_Roll_time23:
;disp_time.c,169 :: 		len+=bufferLong[7];
	MOVF       _bufferLong+7, 0
	ADDWF      Roll_time_len_L0+0, 1
;disp_time.c,171 :: 		next=(mins&0x0f)+48; prev=(p_mins&0x0f)+48;
	MOVLW      15
	ANDWF      _mins+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      Roll_time_next_L0+0
	MOVLW      15
	ANDWF      _p_mins+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      Roll_time_prev_L0+0
;disp_time.c,172 :: 		if(prev==next){ set_char_5x7_on_XY(len,0,next);}
	MOVF       R1+0, 0
	XORWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Roll_time24
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	GOTO       L_Roll_time25
L_Roll_time24:
;disp_time.c,173 :: 		else { set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVF       Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_prev_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVLW      8
	SUBWF      Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
L_Roll_time25:
;disp_time.c,174 :: 		len+=bufferLong[7];
	MOVF       _bufferLong+7, 0
	ADDWF      Roll_time_len_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      Roll_time_len_L0+0
;disp_time.c,176 :: 		set_char_5x7_on_XY(len,0,':');       len+=bufferLong[7]+1;
	MOVF       R0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      58
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	INCF       _bufferLong+7, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	ADDWF      Roll_time_len_L0+0, 1
;disp_time.c,178 :: 		next=(sec>>4&0x0f)+48; prev=(p_sec>>4&0x0f)+48;
	MOVF       _sec+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      Roll_time_next_L0+0
	MOVF       _p_sec+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      Roll_time_prev_L0+0
;disp_time.c,179 :: 		if(prev==next){set_char_5x7_on_XY(len,0,next);}
	MOVF       R1+0, 0
	XORWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Roll_time26
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	GOTO       L_Roll_time27
L_Roll_time26:
;disp_time.c,180 :: 		else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVF       Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_prev_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVLW      8
	SUBWF      Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
L_Roll_time27:
;disp_time.c,181 :: 		len+=bufferLong[7];
	MOVF       _bufferLong+7, 0
	ADDWF      Roll_time_len_L0+0, 1
;disp_time.c,183 :: 		next=(sec&0x0f)+48; prev=(p_sec&0x0f)+48;
	MOVLW      15
	ANDWF      _sec+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      Roll_time_next_L0+0
	MOVLW      15
	ANDWF      _p_sec+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R1+0, 0
	MOVWF      Roll_time_prev_L0+0
;disp_time.c,184 :: 		if(prev==next){ set_char_5x7_on_XY(len,0,next);}
	MOVF       R1+0, 0
	XORWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_Roll_time28
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	GOTO       L_Roll_time29
L_Roll_time28:
;disp_time.c,185 :: 		else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVF       Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_prev_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       Roll_time_len_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVLW      8
	SUBWF      Roll_time_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       Roll_time_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
L_Roll_time29:
;disp_time.c,186 :: 		len+=bufferLong[7];
	MOVF       _bufferLong+7, 0
	ADDWF      Roll_time_len_L0+0, 1
;disp_time.c,188 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;disp_time.c,149 :: 		for(i=0;i<9;i++)
	INCF       Roll_time_i_L0+0, 1
;disp_time.c,190 :: 		}
	GOTO       L_Roll_time15
L_Roll_time16:
;disp_time.c,193 :: 		}
L_end_Roll_time:
	RETURN
; end of _Roll_time

_demo_disp:

;disp_time.c,195 :: 		void demo_disp()
;disp_time.c,197 :: 		volatile sint8_t i,j,prev=0,next=0;
	CLRF       demo_disp_prev_L0+0
	CLRF       demo_disp_next_L0+0
;disp_time.c,199 :: 		for(j=1;j<99;j++)
	MOVLW      1
	MOVWF      demo_disp_j_L0+0
L_demo_disp30:
	MOVLW      128
	XORWF      demo_disp_j_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      99
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_demo_disp31
;disp_time.c,201 :: 		for(i=0;i<9;i++)
	CLRF       demo_disp_i_L0+0
L_demo_disp33:
	MOVLW      128
	XORWF      demo_disp_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      9
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_demo_disp34
;disp_time.c,203 :: 		len=2;
	MOVLW      2
	MOVWF      _len+0
;disp_time.c,204 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;disp_time.c,211 :: 		next=(j%10)+48; prev=((j-1)%10)+48;
	MOVLW      10
	MOVWF      R4+0
	MOVF       demo_disp_j_L0+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      demo_disp_next_L0+0
	MOVLW      1
	SUBWF      demo_disp_j_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      0
	BTFSC      demo_disp_j_L0+0, 7
	MOVLW      255
	ADDWF      R0+1, 1
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      demo_disp_prev_L0+0
;disp_time.c,212 :: 		if(prev==next){ set_char_5x7_on_XY(len,0,next);}
	MOVF       demo_disp_prev_L0+0, 0
	XORWF      demo_disp_next_L0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_demo_disp36
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       demo_disp_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	GOTO       L_demo_disp37
L_demo_disp36:
;disp_time.c,213 :: 		else{ set_char_5x7_on_XY(len,i,prev); set_char_5x7_on_XY(len,i-8,next);}
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVF       demo_disp_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       demo_disp_prev_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
	MOVF       _len+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVLW      8
	SUBWF      demo_disp_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVF       demo_disp_next_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
L_demo_disp37:
;disp_time.c,214 :: 		len+=bufferLong[7];
	MOVF       _bufferLong+7, 0
	ADDWF      _len+0, 1
;disp_time.c,215 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;disp_time.c,201 :: 		for(i=0;i<9;i++)
	INCF       demo_disp_i_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      demo_disp_i_L0+0
;disp_time.c,217 :: 		}
	GOTO       L_demo_disp33
L_demo_disp34:
;disp_time.c,218 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_demo_disp38:
	DECFSZ     R13+0, 1
	GOTO       L_demo_disp38
	DECFSZ     R12+0, 1
	GOTO       L_demo_disp38
	DECFSZ     R11+0, 1
	GOTO       L_demo_disp38
	NOP
	NOP
;disp_time.c,199 :: 		for(j=1;j<99;j++)
	INCF       demo_disp_j_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      demo_disp_j_L0+0
;disp_time.c,219 :: 		}
	GOTO       L_demo_disp30
L_demo_disp31:
;disp_time.c,220 :: 		}
L_end_demo_disp:
	RETURN
; end of _demo_disp
