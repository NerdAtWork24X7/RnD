
_display_run:

;display_demo.c,18 :: 		void display_run()
;display_demo.c,22 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;display_demo.c,23 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;display_demo.c,24 :: 		for(a=1;a<9;a++)
	MOVLW      1
	MOVWF      _a+0
L_display_run0:
	MOVLW      9
	SUBWF      _a+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_run1
;display_demo.c,26 :: 		for(i=1;i<49;i++)
	MOVLW      1
	MOVWF      display_run_i_L0+0
L_display_run3:
	MOVLW      49
	SUBWF      display_run_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_run4
;display_demo.c,28 :: 		set_bode_to_videoMem(i,a);
	MOVF       display_run_i_L0+0, 0
	MOVWF      FARG_set_bode_to_videoMem_x+0
	MOVF       _a+0, 0
	MOVWF      FARG_set_bode_to_videoMem_y+0
	CALL       _set_bode_to_videoMem+0
;display_demo.c,29 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;display_demo.c,30 :: 		delay_us(100);
	MOVLW      66
	MOVWF      R13+0
L_display_run6:
	DECFSZ     R13+0, 1
	GOTO       L_display_run6
	NOP
;display_demo.c,26 :: 		for(i=1;i<49;i++)
	INCF       display_run_i_L0+0, 1
;display_demo.c,31 :: 		}
	GOTO       L_display_run3
L_display_run4:
;display_demo.c,24 :: 		for(a=1;a<9;a++)
	INCF       _a+0, 1
;display_demo.c,32 :: 		}
	GOTO       L_display_run0
L_display_run1:
;display_demo.c,33 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;display_demo.c,34 :: 		}
L_end_display_run:
	RETURN
; end of _display_run

_display_demo1:

;display_demo.c,39 :: 		void display_demo1()
;display_demo.c,44 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;display_demo.c,46 :: 		while(1)
L_display_demo17:
;display_demo.c,49 :: 		for(i=1;i<9;i++)
	MOVLW      1
	MOVWF      display_demo1_i_L0+0
	MOVLW      0
	MOVWF      display_demo1_i_L0+1
L_display_demo19:
	MOVLW      0
	SUBWF      display_demo1_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__display_demo122
	MOVLW      9
	SUBWF      display_demo1_i_L0+0, 0
L__display_demo122:
	BTFSC      STATUS+0, 0
	GOTO       L_display_demo110
;display_demo.c,51 :: 		set_char_5x7_on_XY(0,0,'1');
	CLRF       FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      49
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;display_demo.c,52 :: 		set_char_5x7_on_XY(4,0,'2');
	MOVLW      4
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      50
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;display_demo.c,53 :: 		set_char_5x7_on_XY(11,0,':');
	MOVLW      11
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      58
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;display_demo.c,54 :: 		set_char_5x7_on_XY(15,0,'2');
	MOVLW      15
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      50
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;display_demo.c,55 :: 		set_char_5x7_on_XY(21,0,'3');
	MOVLW      21
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      51
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;display_demo.c,56 :: 		set_char_5x7_on_XY(28,0,':');
	MOVLW      28
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      58
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;display_demo.c,57 :: 		set_char_5x7_on_XY(32,0,'3');
	MOVLW      32
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      51
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;display_demo.c,58 :: 		set_char_5x7_on_XY(38,i,'4');
	MOVLW      38
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVF       display_demo1_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      52
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;display_demo.c,59 :: 		set_char_5x7_on_XY(38,i-8,'5');
	MOVLW      38
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVLW      8
	SUBWF      display_demo1_i_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	MOVLW      53
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;display_demo.c,60 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;display_demo.c,61 :: 		delay_ms(50);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_display_demo112:
	DECFSZ     R13+0, 1
	GOTO       L_display_demo112
	DECFSZ     R12+0, 1
	GOTO       L_display_demo112
	NOP
	NOP
;display_demo.c,62 :: 		clear_videoMem_1();
	CALL       _clear_videoMem_1+0
;display_demo.c,49 :: 		for(i=1;i<9;i++)
	INCF       display_demo1_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       display_demo1_i_L0+1, 1
;display_demo.c,63 :: 		}
	GOTO       L_display_demo19
L_display_demo110:
;display_demo.c,64 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_display_demo113:
	DECFSZ     R13+0, 1
	GOTO       L_display_demo113
	DECFSZ     R12+0, 1
	GOTO       L_display_demo113
	DECFSZ     R11+0, 1
	GOTO       L_display_demo113
	NOP
;display_demo.c,66 :: 		}
	GOTO       L_display_demo17
;display_demo.c,68 :: 		while(1)
L_display_demo114:
;display_demo.c,70 :: 		for(l=-80;l<48;l++)
	MOVLW      176
	MOVWF      display_demo1_l_L0+0
L_display_demo116:
	MOVLW      128
	XORWF      display_demo1_l_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      48
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_demo117
;display_demo.c,71 :: 		{ print_string(1,l,0,"SAHIL VARTAK");
	MOVLW      1
	MOVWF      FARG_print_string_clean_video_mem+0
	MOVF       display_demo1_l_L0+0, 0
	MOVWF      FARG_print_string_x_offset+0
	CLRF       FARG_print_string_y_offset+0
	MOVLW      ?lstr1_display_demo+0
	MOVWF      FARG_print_string_string+0
	CALL       _print_string+0
;display_demo.c,72 :: 		delay_ms(1);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_display_demo119:
	DECFSZ     R13+0, 1
	GOTO       L_display_demo119
	DECFSZ     R12+0, 1
	GOTO       L_display_demo119
	NOP
	NOP
;display_demo.c,70 :: 		for(l=-80;l<48;l++)
	INCF       display_demo1_l_L0+0, 1
;display_demo.c,73 :: 		}
	GOTO       L_display_demo116
L_display_demo117:
;display_demo.c,74 :: 		}
	GOTO       L_display_demo114
;display_demo.c,76 :: 		}
L_end_display_demo1:
	RETURN
; end of _display_demo1
