
_init_lcd:

;LCD.c,23 :: 		void init_lcd()
;LCD.c,25 :: 		Lcd_Init();                // Initialize LCD
	CALL       _Lcd_Init+0
;LCD.c,26 :: 		Lcd_Cmd(_LCD_CLEAR);       // Clear LCD display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,27 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  // Turn cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD.c,28 :: 		Lcd_Out(1,1,"ADC=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(?lstr1_LCD+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;LCD.c,29 :: 		}
L_end_init_lcd:
	RETURN
; end of _init_lcd

_Constant_to_temp:

;LCD.c,33 :: 		void Constant_to_temp(const uint8_t* source)
;LCD.c,36 :: 		for(i=0;i<15;i++) temp[i]=0;  //Clearing Temp
	CLRF       R1+0
L_Constant_to_temp0:
	MOVLW      15
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Constant_to_temp1
	MOVLW      _temp+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_temp+0)
	MOVWF      FSR1H
	MOVF       R1+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
	INCF       R1+0, 1
	GOTO       L_Constant_to_temp0
L_Constant_to_temp1:
;LCD.c,37 :: 		for(i=0;source[i];i++)
	CLRF       R1+0
L_Constant_to_temp3:
	MOVF       R1+0, 0
	ADDWF      FARG_Constant_to_temp_source+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_Constant_to_temp_source+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Constant_to_temp4
;LCD.c,38 :: 		temp[i]=source[i];
	MOVLW      _temp+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_temp+0)
	MOVWF      FSR1H
	MOVF       R1+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVF       R1+0, 0
	ADDWF      FARG_Constant_to_temp_source+0, 0
	MOVWF      FSR0L
	MOVLW      0
	ADDWFC     FARG_Constant_to_temp_source+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      INDF1+0
;LCD.c,37 :: 		for(i=0;source[i];i++)
	INCF       R1+0, 1
;LCD.c,38 :: 		temp[i]=source[i];
	GOTO       L_Constant_to_temp3
L_Constant_to_temp4:
;LCD.c,40 :: 		temp[i]='\0';
	MOVLW      _temp+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_temp+0)
	MOVWF      FSR1H
	MOVF       R1+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
;LCD.c,41 :: 		return;
;LCD.c,42 :: 		}
L_end_Constant_to_temp:
	RETURN
; end of _Constant_to_temp
