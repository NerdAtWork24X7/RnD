
_shift_out_byte:

;matrix_disp_driving.c,159 :: 		void shift_out_byte(uint8_t byte_to_send)
;matrix_disp_driving.c,161 :: 		SPI1_Write(byte_to_Send);
	MOVF       FARG_shift_out_byte_byte_to_send+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;matrix_disp_driving.c,162 :: 		}
L_end_shift_out_byte:
	RETURN
; end of _shift_out_byte

_shift_out_data_to_unit:

;matrix_disp_driving.c,165 :: 		void shift_out_data_to_unit(uint8_t num_of_unit, uint8_t ADDR, uint8_t DATA)
;matrix_disp_driving.c,167 :: 		uint8_t i = 0;
	CLRF       shift_out_data_to_unit_i_L0+0
;matrix_disp_driving.c,168 :: 		LOAD_OUT_LO                                      // initialization, setting bit perform write zero
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_disp_driving.c,169 :: 		if(num_of_unit < NUMBER_OF_LAST_MAX7219)        // The case for first-aid kit, when the communication unit is not the end of the agencies
	MOVLW      6
	SUBWF      FARG_shift_out_data_to_unit_num_of_unit+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_shift_out_data_to_unit0
;matrix_disp_driving.c,171 :: 		for (i = num_of_unit; i < (NUMBER_OF_LAST_MAX7219); i++)
	MOVF       FARG_shift_out_data_to_unit_num_of_unit+0, 0
	MOVWF      shift_out_data_to_unit_i_L0+0
L_shift_out_data_to_unit1:
	MOVLW      6
	SUBWF      shift_out_data_to_unit_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_shift_out_data_to_unit2
;matrix_disp_driving.c,173 :: 		shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
	CLRF       FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,174 :: 		shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
	CLRF       FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,171 :: 		for (i = num_of_unit; i < (NUMBER_OF_LAST_MAX7219); i++)
	INCF       shift_out_data_to_unit_i_L0+0, 1
;matrix_disp_driving.c,175 :: 		}
	GOTO       L_shift_out_data_to_unit1
L_shift_out_data_to_unit2:
;matrix_disp_driving.c,176 :: 		}
L_shift_out_data_to_unit0:
;matrix_disp_driving.c,179 :: 		shift_out_byte(ADDR);                                // sending the address byte to the desired unit
	MOVF       FARG_shift_out_data_to_unit_ADDR+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,180 :: 		shift_out_byte(DATA);                                //sending a data byte to the desired unit
	MOVF       FARG_shift_out_data_to_unit_DATA+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,184 :: 		for (i=0; i < num_of_unit; i++)
	CLRF       shift_out_data_to_unit_i_L0+0
L_shift_out_data_to_unit4:
	MOVF       FARG_shift_out_data_to_unit_num_of_unit+0, 0
	SUBWF      shift_out_data_to_unit_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_shift_out_data_to_unit5
;matrix_disp_driving.c,186 :: 		shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
	CLRF       FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,187 :: 		shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicatedým
	CLRF       FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,184 :: 		for (i=0; i < num_of_unit; i++)
	INCF       shift_out_data_to_unit_i_L0+0, 1
;matrix_disp_driving.c,188 :: 		}
	GOTO       L_shift_out_data_to_unit4
L_shift_out_data_to_unit5:
;matrix_disp_driving.c,190 :: 		LOAD_OUT_HI
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_disp_driving.c,192 :: 		LOAD_OUT_LO
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_disp_driving.c,193 :: 		}
L_end_shift_out_data_to_unit:
	RETURN
; end of _shift_out_data_to_unit

_loadBufferLong:

;matrix_disp_driving.c,196 :: 		void loadBufferLong(uint8_t ascii)
;matrix_disp_driving.c,198 :: 		uint8_t c=0;
;matrix_disp_driving.c,200 :: 		for(a = 0; a < 14; a++)  bufferLong [a] = 0;        //compacting buffer
	CLRF       _a+0
L_loadBufferLong7:
	MOVLW      14
	SUBWF      _a+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadBufferLong8
	MOVF       _a+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       _a+0, 1
	GOTO       L_loadBufferLong7
L_loadBufferLong8:
;matrix_disp_driving.c,202 :: 		if (ascii >= 0x20 && ascii <=0x7f)
	MOVLW      32
	SUBWF      FARG_loadBufferLong_ascii+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_loadBufferLong12
	MOVF       FARG_loadBufferLong_ascii+0, 0
	SUBLW      127
	BTFSS      STATUS+0, 0
	GOTO       L_loadBufferLong12
L__loadBufferLong121:
;matrix_disp_driving.c,204 :: 		for (a=0;a<8;a++)                               // Loop 7 times for a 5x7 font
	CLRF       _a+0
L_loadBufferLong13:
	MOVLW      8
	SUBWF      _a+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadBufferLong14
;matrix_disp_driving.c,206 :: 		c=font5x7[((ascii - 0x20) * 8) + a];
	MOVLW      32
	SUBWF      FARG_loadBufferLong_ascii+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVLW      3
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__loadBufferLong142:
	BTFSC      STATUS+0, 2
	GOTO       L__loadBufferLong143
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__loadBufferLong142
L__loadBufferLong143:
	MOVF       _a+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      _font5x7+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_font5x7+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
;matrix_disp_driving.c,207 :: 		bufferLong[a] = c;                         // Store in buffer
	MOVF       _a+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,204 :: 		for (a=0;a<8;a++)                               // Loop 7 times for a 5x7 font
	INCF       _a+0, 1
;matrix_disp_driving.c,208 :: 		}
	GOTO       L_loadBufferLong13
L_loadBufferLong14:
;matrix_disp_driving.c,210 :: 		count = font5x7[((ascii - 0x20) * 8) + 7];     // Index into character table for kerning data
	MOVLW      32
	SUBWF      FARG_loadBufferLong_ascii+0, 0
	MOVWF      R3+0
	CLRF       R3+1
	BTFSS      STATUS+0, 0
	DECF       R3+1, 1
	MOVLW      3
	MOVWF      R2+0
	MOVF       R3+0, 0
	MOVWF      R0+0
	MOVF       R3+1, 0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__loadBufferLong144:
	BTFSC      STATUS+0, 2
	GOTO       L__loadBufferLong145
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__loadBufferLong144
L__loadBufferLong145:
	MOVLW      7
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      _font5x7+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_font5x7+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R6+0
;matrix_disp_driving.c,211 :: 		for (x=0; x<count;x++)
	CLRF       R5+0
L_loadBufferLong16:
	MOVF       R6+0, 0
	SUBWF      R5+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadBufferLong17
	INCF       R5+0, 1
;matrix_disp_driving.c,216 :: 		}
	GOTO       L_loadBufferLong16
L_loadBufferLong17:
;matrix_disp_driving.c,217 :: 		}
L_loadBufferLong12:
;matrix_disp_driving.c,218 :: 		}
L_end_loadBufferLong:
	RETURN
; end of _loadBufferLong

_bit_read:

;matrix_disp_driving.c,221 :: 		uint8_t bit_read(uint8_t variable, uint8_t bit_num)
;matrix_disp_driving.c,223 :: 		if(variable & (1<<bit_num)) return 1;
	MOVF       FARG_bit_read_bit_num+0, 0
	MOVWF      R2+0
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       R2+0, 0
L__bit_read147:
	BTFSC      STATUS+0, 2
	GOTO       L__bit_read148
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__bit_read147
L__bit_read148:
	MOVF       FARG_bit_read_variable+0, 0
	ANDWF      R0+0, 1
	MOVLW      0
	ANDWF      R0+1, 1
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_bit_read19
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_bit_read
L_bit_read19:
;matrix_disp_driving.c,224 :: 		else  return 0;
	CLRF       R0+0
;matrix_disp_driving.c,225 :: 		}
L_end_bit_read:
	RETURN
; end of _bit_read

_set_char_5x7_on_XY:

;matrix_disp_driving.c,228 :: 		sint8_t set_char_5x7_on_XY(sint16_t x_offset, sint16_t y_offset, uint8_t character)
;matrix_disp_driving.c,231 :: 		uint8_t font_lenght = bufferLong[7];        // Investigations Width font in pixels
	MOVF       _bufferLong+7, 0
	MOVWF      set_char_5x7_on_XY_font_lenght_L0+0
;matrix_disp_driving.c,232 :: 		sint8_t pixel_to_start_draw = x_offset;
	MOVF       FARG_set_char_5x7_on_XY_x_offset+0, 0
	MOVWF      set_char_5x7_on_XY_pixel_to_start_draw_L0+0
;matrix_disp_driving.c,233 :: 		sint8_t pixel_to_end_draw = (x_offset-1) + font_lenght;
	MOVLW      1
	SUBWF      FARG_set_char_5x7_on_XY_x_offset+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      FARG_set_char_5x7_on_XY_x_offset+1, 0
	MOVWF      R0+1
	MOVF       _bufferLong+7, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      set_char_5x7_on_XY_pixel_to_end_draw_L0+0
;matrix_disp_driving.c,236 :: 		sint8_t start_row = y_offset;
	MOVF       FARG_set_char_5x7_on_XY_y_offset+0, 0
	MOVWF      set_char_5x7_on_XY_start_row_L0+0
;matrix_disp_driving.c,237 :: 		sint8_t end_row = y_offset + 7;
	MOVLW      7
	ADDWF      FARG_set_char_5x7_on_XY_y_offset+0, 0
	MOVWF      R0+0
	MOVF       FARG_set_char_5x7_on_XY_y_offset+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      set_char_5x7_on_XY_end_row_L0+0
;matrix_disp_driving.c,238 :: 		sint8_t act_row=0,row;                                        //Current Line: reading a character from memory within the plot
	CLRF       set_char_5x7_on_XY_act_row_L0+0
;matrix_disp_driving.c,246 :: 		for(row=start_row; row<end_row;row++)                                // proèítání jednotlivých øádkù (pro vykreslení výšky písma 7 øádkù)
	MOVF       set_char_5x7_on_XY_start_row_L0+0, 0
	MOVWF      set_char_5x7_on_XY_row_L0+0
L_set_char_5x7_on_XY21:
	MOVLW      128
	XORWF      set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_end_row_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY22
;matrix_disp_driving.c,248 :: 		bit_to_read = 7;
	MOVLW      7
	MOVWF      set_char_5x7_on_XY_bit_to_read_L0+0
;matrix_disp_driving.c,249 :: 		for(x_pos = x_offset; x_pos < 48; x_pos++)                //cyklus postupnì probìhne celý øádek pamìti
	MOVF       FARG_set_char_5x7_on_XY_x_offset+0, 0
	MOVWF      set_char_5x7_on_XY_x_pos_L0+0
	MOVF       FARG_set_char_5x7_on_XY_x_offset+1, 0
	MOVWF      set_char_5x7_on_XY_x_pos_L0+1
L_set_char_5x7_on_XY24:
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY150
	MOVLW      48
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY150:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY25
;matrix_disp_driving.c,251 :: 		if (x_pos<(0)){ bit_to_read--; }
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY151
	MOVLW      0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY151:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY27
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
L_set_char_5x7_on_XY27:
;matrix_disp_driving.c,252 :: 		if((x_pos>=0)&&(x_pos<8))                //kreslení do pamìového prostoru první matice
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY152
	MOVLW      0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY152:
	BTFSS      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY30
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY153
	MOVLW      8
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY153:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY30
L__set_char_5x7_on_XY133:
;matrix_disp_driving.c,254 :: 		if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
	MOVLW      1
	SUBWF      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	BTFSC      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 7
	MOVLW      255
	ADDWF      R1+1, 1
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY154
	MOVF       R1+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY154:
	BTFSS      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY33
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY155
	MOVF       set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY155:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY33
L__set_char_5x7_on_XY132:
;matrix_disp_driving.c,256 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
	MOVF       set_char_5x7_on_XY_act_row_L0+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_bit_read_variable+0
	MOVF       set_char_5x7_on_XY_bit_to_read_L0+0, 0
	MOVWF      FARG_bit_read_bit_num+0
	CALL       _bit_read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_char_5x7_on_XY34
;matrix_disp_driving.c,258 :: 		VIDEO_MEM_1[row][0] |= (1<<(7 - x_pos));
	MOVLW      6
	MOVWF      R0+0
	MOVF       set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       set_char_5x7_on_XY_x_pos_L0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY156:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY157
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY156
L__set_char_5x7_on_XY157:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,259 :: 		}
	GOTO       L_set_char_5x7_on_XY35
L_set_char_5x7_on_XY34:
;matrix_disp_driving.c,262 :: 		VIDEO_MEM_1[row][0] &= ~(1<<(7 - x_pos));
	MOVLW      6
	MOVWF      R0+0
	MOVF       set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       set_char_5x7_on_XY_x_pos_L0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY158:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY159
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY158
L__set_char_5x7_on_XY159:
	COMF       R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,263 :: 		}
L_set_char_5x7_on_XY35:
;matrix_disp_driving.c,264 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_disp_driving.c,265 :: 		}
L_set_char_5x7_on_XY33:
;matrix_disp_driving.c,266 :: 		}
L_set_char_5x7_on_XY30:
;matrix_disp_driving.c,267 :: 		if((x_pos>7)&&(x_pos<17))                //kreslení do pamìového prostoru druhé matice
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY160
	MOVF       set_char_5x7_on_XY_x_pos_L0+0, 0
	SUBLW      7
L__set_char_5x7_on_XY160:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY38
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY161
	MOVLW      17
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY161:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY38
L__set_char_5x7_on_XY131:
;matrix_disp_driving.c,269 :: 		if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
	MOVLW      1
	SUBWF      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	BTFSC      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 7
	MOVLW      255
	ADDWF      R1+1, 1
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY162
	MOVF       R1+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY162:
	BTFSS      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY41
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY163
	MOVF       set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY163:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY41
L__set_char_5x7_on_XY130:
;matrix_disp_driving.c,271 :: 		if((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
	MOVF       set_char_5x7_on_XY_act_row_L0+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_bit_read_variable+0
	MOVF       set_char_5x7_on_XY_bit_to_read_L0+0, 0
	MOVWF      FARG_bit_read_bit_num+0
	CALL       _bit_read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_char_5x7_on_XY42
;matrix_disp_driving.c,273 :: 		VIDEO_MEM_1[row][1] |= (1<<(7 - (x_pos-8)));
	MOVLW      6
	MOVWF      R0+0
	MOVF       set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      R2+0
	MOVLW      8
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY164:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY165
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY164
L__set_char_5x7_on_XY165:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,274 :: 		}
L_set_char_5x7_on_XY42:
;matrix_disp_driving.c,275 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_disp_driving.c,276 :: 		}
L_set_char_5x7_on_XY41:
;matrix_disp_driving.c,277 :: 		}
L_set_char_5x7_on_XY38:
;matrix_disp_driving.c,278 :: 		if((x_pos>15)&&(x_pos<25))                //kreslení do pamìového prostoru tøetí matice
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY166
	MOVF       set_char_5x7_on_XY_x_pos_L0+0, 0
	SUBLW      15
L__set_char_5x7_on_XY166:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY45
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY167
	MOVLW      25
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY167:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY45
L__set_char_5x7_on_XY129:
;matrix_disp_driving.c,280 :: 		if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
	MOVLW      1
	SUBWF      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	BTFSC      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 7
	MOVLW      255
	ADDWF      R1+1, 1
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY168
	MOVF       R1+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY168:
	BTFSS      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY48
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY169
	MOVF       set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY169:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY48
L__set_char_5x7_on_XY128:
;matrix_disp_driving.c,282 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
	MOVF       set_char_5x7_on_XY_act_row_L0+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_bit_read_variable+0
	MOVF       set_char_5x7_on_XY_bit_to_read_L0+0, 0
	MOVWF      FARG_bit_read_bit_num+0
	CALL       _bit_read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_char_5x7_on_XY49
;matrix_disp_driving.c,284 :: 		VIDEO_MEM_1[row][2] |= (1<<(7 - (x_pos-16)));
	MOVLW      6
	MOVWF      R0+0
	MOVF       set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      16
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY170:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY171
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY170
L__set_char_5x7_on_XY171:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,285 :: 		}
L_set_char_5x7_on_XY49:
;matrix_disp_driving.c,286 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_disp_driving.c,287 :: 		}
L_set_char_5x7_on_XY48:
;matrix_disp_driving.c,288 :: 		}
L_set_char_5x7_on_XY45:
;matrix_disp_driving.c,290 :: 		if((x_pos>23)&&(x_pos<33))                //kreslení do pamìového prostoru ètvrté matice
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY172
	MOVF       set_char_5x7_on_XY_x_pos_L0+0, 0
	SUBLW      23
L__set_char_5x7_on_XY172:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY52
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY173
	MOVLW      33
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY173:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY52
L__set_char_5x7_on_XY127:
;matrix_disp_driving.c,292 :: 		if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
	MOVLW      1
	SUBWF      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	BTFSC      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 7
	MOVLW      255
	ADDWF      R1+1, 1
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY174
	MOVF       R1+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY174:
	BTFSS      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY55
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY175
	MOVF       set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY175:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY55
L__set_char_5x7_on_XY126:
;matrix_disp_driving.c,294 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
	MOVF       set_char_5x7_on_XY_act_row_L0+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_bit_read_variable+0
	MOVF       set_char_5x7_on_XY_bit_to_read_L0+0, 0
	MOVWF      FARG_bit_read_bit_num+0
	CALL       _bit_read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_char_5x7_on_XY56
;matrix_disp_driving.c,296 :: 		VIDEO_MEM_1[row][3] |= (1<<(7 - (x_pos-24)));
	MOVLW      6
	MOVWF      R0+0
	MOVF       set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVLW      3
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      24
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY176:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY177
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY176
L__set_char_5x7_on_XY177:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,297 :: 		}
L_set_char_5x7_on_XY56:
;matrix_disp_driving.c,298 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_disp_driving.c,299 :: 		}
L_set_char_5x7_on_XY55:
;matrix_disp_driving.c,300 :: 		}
L_set_char_5x7_on_XY52:
;matrix_disp_driving.c,302 :: 		if((x_pos>31)&&(x_pos<41))                //kreslení do pamìového prostoru páté matice
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY178
	MOVF       set_char_5x7_on_XY_x_pos_L0+0, 0
	SUBLW      31
L__set_char_5x7_on_XY178:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY59
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY179
	MOVLW      41
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY179:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY59
L__set_char_5x7_on_XY125:
;matrix_disp_driving.c,304 :: 		if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
	MOVLW      1
	SUBWF      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	BTFSC      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 7
	MOVLW      255
	ADDWF      R1+1, 1
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY180
	MOVF       R1+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY180:
	BTFSS      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY62
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY181
	MOVF       set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY181:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY62
L__set_char_5x7_on_XY124:
;matrix_disp_driving.c,306 :: 		if((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
	MOVF       set_char_5x7_on_XY_act_row_L0+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_bit_read_variable+0
	MOVF       set_char_5x7_on_XY_bit_to_read_L0+0, 0
	MOVWF      FARG_bit_read_bit_num+0
	CALL       _bit_read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_char_5x7_on_XY63
;matrix_disp_driving.c,308 :: 		VIDEO_MEM_1[row][4] |= (1<<(7 - (x_pos-32)));
	MOVLW      6
	MOVWF      R0+0
	MOVF       set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVLW      4
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      32
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY182:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY183
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY182
L__set_char_5x7_on_XY183:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,309 :: 		}
L_set_char_5x7_on_XY63:
;matrix_disp_driving.c,310 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_disp_driving.c,311 :: 		}
L_set_char_5x7_on_XY62:
;matrix_disp_driving.c,312 :: 		}
L_set_char_5x7_on_XY59:
;matrix_disp_driving.c,314 :: 		if((x_pos>39)&&(x_pos<49))                //kreslení do pamìového prostoru páté matice
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY184
	MOVF       set_char_5x7_on_XY_x_pos_L0+0, 0
	SUBLW      39
L__set_char_5x7_on_XY184:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY66
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY185
	MOVLW      49
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY185:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY66
L__set_char_5x7_on_XY123:
;matrix_disp_driving.c,316 :: 		if((x_pos >= (pixel_to_start_draw - 1)) && (x_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
	MOVLW      1
	SUBWF      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 0
	MOVWF      R1+0
	CLRF       R1+1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
	MOVLW      0
	BTFSC      set_char_5x7_on_XY_pixel_to_start_draw_L0+0, 7
	MOVLW      255
	ADDWF      R1+1, 1
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY186
	MOVF       R1+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY186:
	BTFSS      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY69
	MOVLW      128
	XORWF      set_char_5x7_on_XY_x_pos_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY187
	MOVF       set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
L__set_char_5x7_on_XY187:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY69
L__set_char_5x7_on_XY122:
;matrix_disp_driving.c,319 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
	MOVF       set_char_5x7_on_XY_act_row_L0+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_bit_read_variable+0
	MOVF       set_char_5x7_on_XY_bit_to_read_L0+0, 0
	MOVWF      FARG_bit_read_bit_num+0
	CALL       _bit_read+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_set_char_5x7_on_XY70
;matrix_disp_driving.c,321 :: 		VIDEO_MEM_1[row][5] |= (1<<(7 - (x_pos-40)));
	MOVLW      6
	MOVWF      R0+0
	MOVF       set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVLW      5
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      40
	SUBWF      set_char_5x7_on_XY_x_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY188:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY189
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY188
L__set_char_5x7_on_XY189:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,323 :: 		}
L_set_char_5x7_on_XY70:
;matrix_disp_driving.c,325 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_disp_driving.c,326 :: 		}
L_set_char_5x7_on_XY69:
;matrix_disp_driving.c,327 :: 		}
L_set_char_5x7_on_XY66:
;matrix_disp_driving.c,249 :: 		for(x_pos = x_offset; x_pos < 48; x_pos++)                //cyklus postupnì probìhne celý øádek pamìti
	INCF       set_char_5x7_on_XY_x_pos_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       set_char_5x7_on_XY_x_pos_L0+1, 1
;matrix_disp_driving.c,328 :: 		}
	GOTO       L_set_char_5x7_on_XY24
L_set_char_5x7_on_XY25:
;matrix_disp_driving.c,329 :: 		act_row++;
	INCF       set_char_5x7_on_XY_act_row_L0+0, 1
;matrix_disp_driving.c,246 :: 		for(row=start_row; row<end_row;row++)                                // proèítání jednotlivých øádkù (pro vykreslení výšky písma 7 øádkù)
	INCF       set_char_5x7_on_XY_row_L0+0, 1
;matrix_disp_driving.c,330 :: 		}
	GOTO       L_set_char_5x7_on_XY21
L_set_char_5x7_on_XY22:
;matrix_disp_driving.c,331 :: 		return font_lenght;
	MOVF       set_char_5x7_on_XY_font_lenght_L0+0, 0
	MOVWF      R0+0
;matrix_disp_driving.c,332 :: 		}
L_end_set_char_5x7_on_XY:
	RETURN
; end of _set_char_5x7_on_XY

_clear_videoMem_1:

;matrix_disp_driving.c,335 :: 		void clear_videoMem_1()
;matrix_disp_driving.c,338 :: 		for (row = 0; row<8;row++)
	CLRF       clear_videoMem_1_row_L0+0
L_clear_videoMem_171:
	MOVLW      8
	SUBWF      clear_videoMem_1_row_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_clear_videoMem_172
;matrix_disp_driving.c,340 :: 		for (x = 0; x < 7; x++)
	CLRF       clear_videoMem_1_x_L0+0
L_clear_videoMem_174:
	MOVLW      7
	SUBWF      clear_videoMem_1_x_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_clear_videoMem_175
;matrix_disp_driving.c,342 :: 		VIDEO_MEM_1 [row][x]=0x00;
	MOVLW      6
	MOVWF      R0+0
	MOVF       clear_videoMem_1_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVF       clear_videoMem_1_x_L0+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;matrix_disp_driving.c,340 :: 		for (x = 0; x < 7; x++)
	INCF       clear_videoMem_1_x_L0+0, 1
;matrix_disp_driving.c,343 :: 		}
	GOTO       L_clear_videoMem_174
L_clear_videoMem_175:
;matrix_disp_driving.c,338 :: 		for (row = 0; row<8;row++)
	INCF       clear_videoMem_1_row_L0+0, 1
;matrix_disp_driving.c,345 :: 		}
	GOTO       L_clear_videoMem_171
L_clear_videoMem_172:
;matrix_disp_driving.c,346 :: 		}
L_end_clear_videoMem_1:
	RETURN
; end of _clear_videoMem_1

_print_disp_memory_1:

;matrix_disp_driving.c,349 :: 		void print_disp_memory_1()                                //rendering video memory after OADC
;matrix_disp_driving.c,352 :: 		LOAD_OUT_LO                                      //initialization, setting bit perform write zero
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_disp_driving.c,353 :: 		for(a=0; a<8 ; a++)                             // Lines switching matrix (Line: 0-7)
	CLRF       _a+0
L_print_disp_memory_177:
	MOVLW      8
	SUBWF      _a+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print_disp_memory_178
;matrix_disp_driving.c,355 :: 		for(i=0;i<7;i++)                           // Lines of data submission process for all SPI nut for (i = 0: Lines fifth matrix data, sending the order of LSB first)
	CLRF       print_disp_memory_1_i_L0+0
L_print_disp_memory_180:
	MOVLW      7
	SUBWF      print_disp_memory_1_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print_disp_memory_181
;matrix_disp_driving.c,357 :: 		if(a==0)
	MOVF       _a+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_183
;matrix_disp_driving.c,359 :: 		shift_out_byte(MAX7219_REGROW1);
	MOVLW      1
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,360 :: 		shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,361 :: 		UART1_Write_text(VIDEO_MEM_1[a][6-i]);
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;matrix_disp_driving.c,362 :: 		}
L_print_disp_memory_183:
;matrix_disp_driving.c,364 :: 		if(a==1)
	MOVF       _a+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_184
;matrix_disp_driving.c,366 :: 		shift_out_byte(MAX7219_REGROW2);
	MOVLW      2
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,367 :: 		shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 first Itera
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,368 :: 		UART1_Write_text(VIDEO_MEM_1[a][6-i]);
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;matrix_disp_driving.c,369 :: 		}
L_print_disp_memory_184:
;matrix_disp_driving.c,370 :: 		if(a==2)
	MOVF       _a+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_185
;matrix_disp_driving.c,373 :: 		shift_out_byte(MAX7219_REGROW3);
	MOVLW      3
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,374 :: 		shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,375 :: 		UART1_Write_text(VIDEO_MEM_1[a][6-i]);
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;matrix_disp_driving.c,376 :: 		}
L_print_disp_memory_185:
;matrix_disp_driving.c,377 :: 		if(a==3)
	MOVF       _a+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_186
;matrix_disp_driving.c,379 :: 		shift_out_byte(MAX7219_REGROW4);
	MOVLW      4
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,380 :: 		shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,381 :: 		UART1_Write_text(VIDEO_MEM_1[a][6-i]);
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;matrix_disp_driving.c,382 :: 		}
L_print_disp_memory_186:
;matrix_disp_driving.c,383 :: 		if(a==4)
	MOVF       _a+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_187
;matrix_disp_driving.c,385 :: 		shift_out_byte(MAX7219_REGROW5);
	MOVLW      5
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,386 :: 		shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,387 :: 		UART1_Write_text(VIDEO_MEM_1[a][6-i]);
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;matrix_disp_driving.c,388 :: 		}
L_print_disp_memory_187:
;matrix_disp_driving.c,389 :: 		if(a==5)
	MOVF       _a+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_188
;matrix_disp_driving.c,391 :: 		shift_out_byte(MAX7219_REGROW6);
	MOVLW      6
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,392 :: 		shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,393 :: 		UART1_Write_text(VIDEO_MEM_1[a][6-i]);
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;matrix_disp_driving.c,394 :: 		}
L_print_disp_memory_188:
;matrix_disp_driving.c,395 :: 		if(a==6)
	MOVF       _a+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_189
;matrix_disp_driving.c,397 :: 		shift_out_byte(MAX7219_REGROW7);
	MOVLW      7
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,398 :: 		shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,399 :: 		UART1_Write_text(VIDEO_MEM_1[a][6-i]);
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;matrix_disp_driving.c,400 :: 		}
L_print_disp_memory_189:
;matrix_disp_driving.c,401 :: 		if(a==7)
	MOVF       _a+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_190
;matrix_disp_driving.c,403 :: 		shift_out_byte(MAX7219_REGROW8);
	MOVLW      8
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,404 :: 		shift_out_byte(VIDEO_MEM_1[a][6-i]); // (5-i) - nejdøíve to send data matrix E.6 in the first iteration
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_disp_driving.c,405 :: 		UART1_Write_text(VIDEO_MEM_1[a][6-i]);
	MOVLW      6
	MOVWF      R0+0
	MOVF       _a+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      6
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDWF      R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;matrix_disp_driving.c,406 :: 		}
L_print_disp_memory_190:
;matrix_disp_driving.c,355 :: 		for(i=0;i<7;i++)                           // Lines of data submission process for all SPI nut for (i = 0: Lines fifth matrix data, sending the order of LSB first)
	INCF       print_disp_memory_1_i_L0+0, 1
;matrix_disp_driving.c,407 :: 		}
	GOTO       L_print_disp_memory_180
L_print_disp_memory_181:
;matrix_disp_driving.c,409 :: 		LOAD_OUT_HI                                                                        //initialization, setting bit perform write log 1
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_disp_driving.c,410 :: 		LOAD_OUT_LO                                                                        // initialization, setting bit perform write zero
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_disp_driving.c,353 :: 		for(a=0; a<8 ; a++)                             // Lines switching matrix (Line: 0-7)
	INCF       _a+0, 1
;matrix_disp_driving.c,411 :: 		}
	GOTO       L_print_disp_memory_177
L_print_disp_memory_178:
;matrix_disp_driving.c,413 :: 		}
L_end_print_disp_memory_1:
	RETURN
; end of _print_disp_memory_1

_set_bode_to_videoMem:

;matrix_disp_driving.c,416 :: 		void set_bode_to_videoMem(uint8_t x, uint8_t y)
;matrix_disp_driving.c,418 :: 		if(x<9)                //Point will draw a first matrix
	MOVLW      9
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem91
;matrix_disp_driving.c,420 :: 		VIDEO_MEM_1[y-1][0] |= (1<<(7-(x-1)));
	MOVLW      1
	SUBWF      FARG_set_bode_to_videoMem_y+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      6
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	DECF       FARG_set_bode_to_videoMem_x+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_bode_to_videoMem193:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem194
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem193
L__set_bode_to_videoMem194:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,421 :: 		}
L_set_bode_to_videoMem91:
;matrix_disp_driving.c,423 :: 		if((x>8) && (x<17))        // Point will draw a second matrix
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      8
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem94
	MOVLW      17
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem94
L__set_bode_to_videoMem138:
;matrix_disp_driving.c,425 :: 		VIDEO_MEM_1[y-1][1] |= (1<<(7-(x-9)));
	MOVLW      1
	SUBWF      FARG_set_bode_to_videoMem_y+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      6
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	INCF       R0+0, 0
	MOVWF      R2+0
	MOVLW      9
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_bode_to_videoMem195:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem196
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem195
L__set_bode_to_videoMem196:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,426 :: 		}
L_set_bode_to_videoMem94:
;matrix_disp_driving.c,428 :: 		if((x>16) && (x<25))        //Point will draw on the third matrix
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      16
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem97
	MOVLW      25
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem97
L__set_bode_to_videoMem137:
;matrix_disp_driving.c,430 :: 		VIDEO_MEM_1[y-1][2] |= (1<<(7-(x-17)));
	MOVLW      1
	SUBWF      FARG_set_bode_to_videoMem_y+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      6
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVLW      2
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      17
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_bode_to_videoMem197:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem198
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem197
L__set_bode_to_videoMem198:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,431 :: 		}
L_set_bode_to_videoMem97:
;matrix_disp_driving.c,433 :: 		if((x>24) && (x<33))        // Item will be drawing to a quarter of a matrix
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      24
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem100
	MOVLW      33
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem100
L__set_bode_to_videoMem136:
;matrix_disp_driving.c,435 :: 		VIDEO_MEM_1[y-1][3] |= (1<<(7-(x-25)));
	MOVLW      1
	SUBWF      FARG_set_bode_to_videoMem_y+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      6
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVLW      3
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      25
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_bode_to_videoMem199:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem200
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem199
L__set_bode_to_videoMem200:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,436 :: 		}
L_set_bode_to_videoMem100:
;matrix_disp_driving.c,438 :: 		if((x>32) && (x<41))        // Item will be drawing to a quarter of a matrix
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      32
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem103
	MOVLW      41
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem103
L__set_bode_to_videoMem135:
;matrix_disp_driving.c,440 :: 		VIDEO_MEM_1[y-1][4] |= (1<<(7-(x-33)));
	MOVLW      1
	SUBWF      FARG_set_bode_to_videoMem_y+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      6
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVLW      4
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      33
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_bode_to_videoMem201:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem202
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem201
L__set_bode_to_videoMem202:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,441 :: 		}
L_set_bode_to_videoMem103:
;matrix_disp_driving.c,442 :: 		if((x>40) && (x<49))        // Item will be drawing to a quarter of a matrix
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      40
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem106
	MOVLW      49
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem106
L__set_bode_to_videoMem134:
;matrix_disp_driving.c,444 :: 		VIDEO_MEM_1[y-1][5] |= (1<<(7-(x-41)));
	MOVLW      1
	SUBWF      FARG_set_bode_to_videoMem_y+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      6
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVLW      5
	ADDWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      41
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_bode_to_videoMem203:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem204
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem203
L__set_bode_to_videoMem204:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_disp_driving.c,445 :: 		}
L_set_bode_to_videoMem106:
;matrix_disp_driving.c,446 :: 		}
L_end_set_bode_to_videoMem:
	RETURN
; end of _set_bode_to_videoMem

_check_string_lenght:

;matrix_disp_driving.c,448 :: 		uint8_t check_string_lenght(uint8_t *string)
;matrix_disp_driving.c,460 :: 		uint8_t string_on_display_lenght = 0;
	CLRF       check_string_lenght_string_on_display_lenght_L0+0
;matrix_disp_driving.c,461 :: 		while (*string)                //in the cycle is maintained as reading the entire field, which finally position for rendering has to be detected in
L_check_string_lenght107:
	MOVF       FARG_check_string_lenght_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_check_string_lenght108
;matrix_disp_driving.c,463 :: 		loadBufferLong(*string);
	MOVF       FARG_check_string_lenght_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_loadBufferLong_ascii+0
	CALL       _loadBufferLong+0
;matrix_disp_driving.c,464 :: 		string_on_display_lenght = string_on_display_lenght + bufferLong[7];        // first detected in the bit length of the processed character strings
	MOVF       _bufferLong+7, 0
	ADDWF      check_string_lenght_string_on_display_lenght_L0+0, 1
;matrix_disp_driving.c,465 :: 		*string++;
	INCF       FARG_check_string_lenght_string+0, 1
;matrix_disp_driving.c,466 :: 		}
	GOTO       L_check_string_lenght107
L_check_string_lenght108:
;matrix_disp_driving.c,468 :: 		return string_on_display_lenght;
	MOVF       check_string_lenght_string_on_display_lenght_L0+0, 0
	MOVWF      R0+0
;matrix_disp_driving.c,469 :: 		}
L_end_check_string_lenght:
	RETURN
; end of _check_string_lenght

_print_string:

;matrix_disp_driving.c,473 :: 		void print_string(uint8_t clean_video_mem, uint8_t x_offset, uint8_t y_offset,  uint8_t *string)
;matrix_disp_driving.c,476 :: 		sint8_t act_char_position=0;                //the position of the currently processed character
	CLRF       print_string_act_char_position_L0+0
	CLRF       print_string_font_lenght_L0+0
;matrix_disp_driving.c,479 :: 		if(clean_video_mem==1){  clear_videoMem_1(); }
	MOVF       FARG_print_string_clean_video_mem+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_string109
	CALL       _clear_videoMem_1+0
L_print_string109:
;matrix_disp_driving.c,487 :: 		act_char_position = x_offset;
	MOVF       FARG_print_string_x_offset+0, 0
	MOVWF      print_string_act_char_position_L0+0
;matrix_disp_driving.c,489 :: 		while(*string)                //in the cycle is maintained as reading the entire field, which should be displayed
L_print_string110:
	MOVF       FARG_print_string_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_print_string111
;matrix_disp_driving.c,491 :: 		loadBufferLong(*string);
	MOVF       FARG_print_string_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_loadBufferLong_ascii+0
	CALL       _loadBufferLong+0
;matrix_disp_driving.c,492 :: 		font_lenght = bufferLong[7];        // first detected in the bit length of the processed character string
	MOVF       _bufferLong+7, 0
	MOVWF      print_string_font_lenght_L0+0
;matrix_disp_driving.c,493 :: 		if((act_char_position+font_lenght)>(0))   //if the last point of a character rendered from the current position extends into the display area is called rendering function character in videopamìti
	MOVF       _bufferLong+7, 0
	ADDWF      print_string_act_char_position_L0+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSC      print_string_act_char_position_L0+0, 7
	MOVLW      255
	MOVWF      R1+1
	BTFSC      STATUS+0, 0
	INCF       R1+1, 1
	MOVLW      0
	BTFSC      _bufferLong+7, 7
	MOVLW      255
	ADDWF      R1+1, 1
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__print_string207
	MOVF       R1+0, 0
	SUBLW      0
L__print_string207:
	BTFSC      STATUS+0, 0
	GOTO       L_print_string112
;matrix_disp_driving.c,495 :: 		set_char_5x7_on_XY(act_char_position,y_offset,*string);
	MOVF       print_string_act_char_position_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+0
	MOVLW      0
	BTFSC      FARG_set_char_5x7_on_XY_x_offset+0, 7
	MOVLW      255
	MOVWF      FARG_set_char_5x7_on_XY_x_offset+1
	MOVF       FARG_print_string_y_offset+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_y_offset+0
	CLRF       FARG_set_char_5x7_on_XY_y_offset+1
	MOVF       FARG_print_string_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
;matrix_disp_driving.c,496 :: 		}
L_print_string112:
;matrix_disp_driving.c,497 :: 		if (act_char_position > 47)  //if poeatek newly rendered character display area for matrix display, rendering will be interrupted
	MOVLW      128
	XORLW      47
	MOVWF      R0+0
	MOVLW      128
	XORWF      print_string_act_char_position_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print_string113
;matrix_disp_driving.c,499 :: 		break;
	GOTO       L_print_string111
;matrix_disp_driving.c,500 :: 		}
L_print_string113:
;matrix_disp_driving.c,501 :: 		*string++;
	INCF       FARG_print_string_string+0, 1
;matrix_disp_driving.c,502 :: 		act_char_position+=font_lenght;   //after the decision, product or to rendering step is increased further pointer to the next character position pøípadného
	MOVF       print_string_font_lenght_L0+0, 0
	ADDWF      print_string_act_char_position_L0+0, 1
;matrix_disp_driving.c,503 :: 		}
	GOTO       L_print_string110
L_print_string111:
;matrix_disp_driving.c,504 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;matrix_disp_driving.c,505 :: 		}
L_end_print_string:
	RETURN
; end of _print_string

_RUNNING_TEXT:

;matrix_disp_driving.c,508 :: 		void RUNNING_TEXT(sint8_t disp_points,sint8_t step_delay_time, uint8_t *text)
;matrix_disp_driving.c,511 :: 		string_lenght = check_string_lenght(text);
	MOVF       FARG_RUNNING_TEXT_text+0, 0
	MOVWF      FARG_check_string_lenght_string+0
	CALL       _check_string_lenght+0
	MOVF       R0+0, 0
	MOVWF      RUNNING_TEXT_string_lenght_L0+0
;matrix_disp_driving.c,517 :: 		for (i = (disp_points + 1);i>(disp_points - string_lenght-disp_points);i--)
	INCF       FARG_RUNNING_TEXT_disp_points+0, 0
	MOVWF      RUNNING_TEXT_i_L0+0
L_RUNNING_TEXT114:
	MOVF       RUNNING_TEXT_string_lenght_L0+0, 0
	SUBWF      FARG_RUNNING_TEXT_disp_points+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      0
	BTFSC      FARG_RUNNING_TEXT_disp_points+0, 7
	MOVLW      255
	ADDWF      R0+1, 1
	MOVLW      1
	BTFSS      RUNNING_TEXT_string_lenght_L0+0, 7
	MOVLW      0
	ADDWF      R0+1, 1
	MOVF       FARG_RUNNING_TEXT_disp_points+0, 0
	SUBWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      0
	BTFSC      FARG_RUNNING_TEXT_disp_points+0, 7
	MOVLW      255
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      R0+1, 0
	MOVWF      R2+1
	MOVLW      128
	XORWF      R2+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      RUNNING_TEXT_i_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__RUNNING_TEXT209
	MOVF       RUNNING_TEXT_i_L0+0, 0
	SUBWF      R2+0, 0
L__RUNNING_TEXT209:
	BTFSC      STATUS+0, 0
	GOTO       L_RUNNING_TEXT115
;matrix_disp_driving.c,519 :: 		LED = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;matrix_disp_driving.c,520 :: 		print_string(1,i,0,text);
	MOVLW      1
	MOVWF      FARG_print_string_clean_video_mem+0
	MOVF       RUNNING_TEXT_i_L0+0, 0
	MOVWF      FARG_print_string_x_offset+0
	CLRF       FARG_print_string_y_offset+0
	MOVF       FARG_RUNNING_TEXT_text+0, 0
	MOVWF      FARG_print_string_string+0
	CALL       _print_string+0
;matrix_disp_driving.c,522 :: 		LED = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;matrix_disp_driving.c,523 :: 		for(i=0;i<step_delay_time;i++)
	CLRF       RUNNING_TEXT_i_L0+0
L_RUNNING_TEXT117:
	MOVLW      128
	XORWF      RUNNING_TEXT_i_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_RUNNING_TEXT_step_delay_time+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_RUNNING_TEXT118
;matrix_disp_driving.c,525 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_RUNNING_TEXT120:
	DECFSZ     R13+0, 1
	GOTO       L_RUNNING_TEXT120
	DECFSZ     R12+0, 1
	GOTO       L_RUNNING_TEXT120
	DECFSZ     R11+0, 1
	GOTO       L_RUNNING_TEXT120
	NOP
;matrix_disp_driving.c,523 :: 		for(i=0;i<step_delay_time;i++)
	INCF       RUNNING_TEXT_i_L0+0, 1
;matrix_disp_driving.c,526 :: 		}
	GOTO       L_RUNNING_TEXT117
L_RUNNING_TEXT118:
;matrix_disp_driving.c,517 :: 		for (i = (disp_points + 1);i>(disp_points - string_lenght-disp_points);i--)
	DECF       RUNNING_TEXT_i_L0+0, 1
;matrix_disp_driving.c,528 :: 		}
	GOTO       L_RUNNING_TEXT114
L_RUNNING_TEXT115:
;matrix_disp_driving.c,530 :: 		}
L_end_RUNNING_TEXT:
	RETURN
; end of _RUNNING_TEXT
