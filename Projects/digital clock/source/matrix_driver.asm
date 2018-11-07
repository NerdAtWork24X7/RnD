
_shift_out_byte:

;matrix_driver.c,140 :: 		void shift_out_byte(uint8_t byte_to_send)
;matrix_driver.c,142 :: 		SPI1_Write(byte_to_Send);
	MOVF       FARG_shift_out_byte_byte_to_send+0, 0
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;matrix_driver.c,144 :: 		}
L_end_shift_out_byte:
	RETURN
; end of _shift_out_byte

_shift_out_data_to_unit:

;matrix_driver.c,146 :: 		void shift_out_data_to_unit(uint8_t num_of_unit, uint8_t ADDR, uint8_t DATA)
;matrix_driver.c,148 :: 		uint8_t i = 0;
	CLRF       shift_out_data_to_unit_i_L0+0
;matrix_driver.c,149 :: 		LOAD_OUT_LO                                      // initialization, setting bit perform write zero
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_driver.c,150 :: 		if(num_of_unit < NUMBER_OF_LAST_MAX7219)        // The case for first-aid kit, when the communication unit is not the end of the agencies
	MOVLW      5
	SUBWF      FARG_shift_out_data_to_unit_num_of_unit+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_shift_out_data_to_unit0
;matrix_driver.c,152 :: 		for (i = num_of_unit; i < (NUMBER_OF_LAST_MAX7219); i++)
	MOVF       FARG_shift_out_data_to_unit_num_of_unit+0, 0
	MOVWF      shift_out_data_to_unit_i_L0+0
L_shift_out_data_to_unit1:
	MOVLW      5
	SUBWF      shift_out_data_to_unit_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_shift_out_data_to_unit2
;matrix_driver.c,154 :: 		shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
	CLRF       FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,155 :: 		shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
	CLRF       FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,152 :: 		for (i = num_of_unit; i < (NUMBER_OF_LAST_MAX7219); i++)
	INCF       shift_out_data_to_unit_i_L0+0, 1
;matrix_driver.c,156 :: 		}
	GOTO       L_shift_out_data_to_unit1
L_shift_out_data_to_unit2:
;matrix_driver.c,157 :: 		}
L_shift_out_data_to_unit0:
;matrix_driver.c,160 :: 		shift_out_byte(ADDR);                                // sending the address byte to the desired unit
	MOVF       FARG_shift_out_data_to_unit_ADDR+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,161 :: 		shift_out_byte(DATA);                                //sending a data byte to the desired unit
	MOVF       FARG_shift_out_data_to_unit_DATA+0, 0
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,163 :: 		for (i=0;i<num_of_unit;i++)
	CLRF       shift_out_data_to_unit_i_L0+0
L_shift_out_data_to_unit4:
	MOVF       FARG_shift_out_data_to_unit_num_of_unit+0, 0
	SUBWF      shift_out_data_to_unit_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_shift_out_data_to_unit5
;matrix_driver.c,165 :: 		shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicated
	CLRF       FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,166 :: 		shift_out_byte(MAX7219_REGNOOP); // sending a zero byte address budiee which are beyond the communicatedým
	CLRF       FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,163 :: 		for (i=0;i<num_of_unit;i++)
	INCF       shift_out_data_to_unit_i_L0+0, 1
;matrix_driver.c,167 :: 		}
	GOTO       L_shift_out_data_to_unit4
L_shift_out_data_to_unit5:
;matrix_driver.c,169 :: 		LOAD_OUT_HI
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_driver.c,170 :: 		LOAD_OUT_LO
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_driver.c,171 :: 		}
L_end_shift_out_data_to_unit:
	RETURN
; end of _shift_out_data_to_unit

_clear_videoMem_1:

;matrix_driver.c,174 :: 		void clear_videoMem_1()
;matrix_driver.c,176 :: 		uint8_t seg=0,row=0;
	CLRF       clear_videoMem_1_seg_L0+0
	CLRF       clear_videoMem_1_row_L0+0
;matrix_driver.c,177 :: 		for (row=0;row<8;row++)
	CLRF       clear_videoMem_1_row_L0+0
L_clear_videoMem_17:
	MOVLW      8
	SUBWF      clear_videoMem_1_row_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_clear_videoMem_18
;matrix_driver.c,179 :: 		for (seg=0;seg<6;seg++)
	CLRF       clear_videoMem_1_seg_L0+0
L_clear_videoMem_110:
	MOVLW      6
	SUBWF      clear_videoMem_1_seg_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_clear_videoMem_111
;matrix_driver.c,180 :: 		VIDEO_MEM_1[row][seg]=0x00;
	MOVLW      6
	MOVWF      R0+0
	MOVF       clear_videoMem_1_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVLW      _VIDEO_MEM_1+0
	ADDWF      R0+0, 1
	MOVF       clear_videoMem_1_seg_L0+0, 0
	ADDWF      R0+0, 0
	MOVWF      FSR
	CLRF       INDF+0
;matrix_driver.c,179 :: 		for (seg=0;seg<6;seg++)
	INCF       clear_videoMem_1_seg_L0+0, 1
;matrix_driver.c,180 :: 		VIDEO_MEM_1[row][seg]=0x00;
	GOTO       L_clear_videoMem_110
L_clear_videoMem_111:
;matrix_driver.c,177 :: 		for (row=0;row<8;row++)
	INCF       clear_videoMem_1_row_L0+0, 1
;matrix_driver.c,181 :: 		}
	GOTO       L_clear_videoMem_17
L_clear_videoMem_18:
;matrix_driver.c,182 :: 		}
L_end_clear_videoMem_1:
	RETURN
; end of _clear_videoMem_1

_loadBufferLong:

;matrix_driver.c,185 :: 		void loadBufferLong(uint8_t ascii)
;matrix_driver.c,187 :: 		uint8_t dat=0,i=0;
	CLRF       loadBufferLong_i_L0+0
;matrix_driver.c,188 :: 		for(i=0;i<8;i++) { bufferLong[i]=0x00;}  //clearing buffer
	CLRF       loadBufferLong_i_L0+0
L_loadBufferLong13:
	MOVLW      8
	SUBWF      loadBufferLong_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadBufferLong14
	MOVF       loadBufferLong_i_L0+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       loadBufferLong_i_L0+0, 1
	GOTO       L_loadBufferLong13
L_loadBufferLong14:
;matrix_driver.c,190 :: 		if (ascii>=0x20 && ascii<=0x7f)
	MOVLW      32
	SUBWF      FARG_loadBufferLong_ascii+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_loadBufferLong18
	MOVF       FARG_loadBufferLong_ascii+0, 0
	SUBLW      127
	BTFSS      STATUS+0, 0
	GOTO       L_loadBufferLong18
L__loadBufferLong121:
;matrix_driver.c,192 :: 		for (i=0;i<8;i++)                               // Loop 7 times for a 5x7 font
	CLRF       loadBufferLong_i_L0+0
L_loadBufferLong19:
	MOVLW      8
	SUBWF      loadBufferLong_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadBufferLong20
;matrix_driver.c,194 :: 		dat = font5x7[((ascii-0x20)*8)+i];
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
	MOVF       loadBufferLong_i_L0+0, 0
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
;matrix_driver.c,195 :: 		bufferLong[i] = dat;                         // Store in buffer
	MOVF       loadBufferLong_i_L0+0, 0
	ADDLW      _bufferLong+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_driver.c,192 :: 		for (i=0;i<8;i++)                               // Loop 7 times for a 5x7 font
	INCF       loadBufferLong_i_L0+0, 1
;matrix_driver.c,197 :: 		}
	GOTO       L_loadBufferLong19
L_loadBufferLong20:
;matrix_driver.c,198 :: 		}
L_loadBufferLong18:
;matrix_driver.c,199 :: 		}
L_end_loadBufferLong:
	RETURN
; end of _loadBufferLong

_bit_read:

;matrix_driver.c,201 :: 		uint8_t bit_read(uint8_t variable, uint8_t bit_num)
;matrix_driver.c,203 :: 		if(variable & (1<<bit_num)) return 1;
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
	GOTO       L_bit_read22
	MOVLW      1
	MOVWF      R0+0
	GOTO       L_end_bit_read
L_bit_read22:
;matrix_driver.c,204 :: 		else  return 0;
	CLRF       R0+0
;matrix_driver.c,205 :: 		}
L_end_bit_read:
	RETURN
; end of _bit_read

_set_char_5x7_on_XY:

;matrix_driver.c,208 :: 		void set_char_5x7_on_XY(sint8_t col_offset, sint8_t row_offset, uint8_t character)
;matrix_driver.c,212 :: 		sint8_t pixel_to_start_draw = col_offset;
	MOVF       FARG_set_char_5x7_on_XY_col_offset+0, 0
	MOVWF      set_char_5x7_on_XY_pixel_to_start_draw_L0+0
;matrix_driver.c,214 :: 		uint8_t bit_to_read=0;
	CLRF       set_char_5x7_on_XY_bit_to_read_L0+0
;matrix_driver.c,216 :: 		sint8_t start_row = row_offset;
	MOVF       FARG_set_char_5x7_on_XY_row_offset+0, 0
	MOVWF      set_char_5x7_on_XY_start_row_L0+0
;matrix_driver.c,217 :: 		sint8_t end_row = row_offset + 7;
	MOVLW      7
	ADDWF      FARG_set_char_5x7_on_XY_row_offset+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSC      FARG_set_char_5x7_on_XY_row_offset+0, 7
	MOVLW      255
	MOVWF      R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      set_char_5x7_on_XY_end_row_L0+0
;matrix_driver.c,218 :: 		sint8_t act_row=0,row=0;                                        //Current Line: reading a character from memory within the plot
	CLRF       set_char_5x7_on_XY_act_row_L0+0
	CLRF       set_char_5x7_on_XY_row_L0+0
	CLRF       set_char_5x7_on_XY_col_pos_L0+0
;matrix_driver.c,221 :: 		loadBufferLong(character);
	MOVF       FARG_set_char_5x7_on_XY_character+0, 0
	MOVWF      FARG_loadBufferLong_ascii+0
	CALL       _loadBufferLong+0
;matrix_driver.c,223 :: 		pixel_to_end_draw = (col_offset-1) + font_lenght;
	DECF       FARG_set_char_5x7_on_XY_col_offset+0, 0
	MOVWF      set_char_5x7_on_XY_pixel_to_end_draw_L0+0
	MOVF       _bufferLong+7, 0
	ADDWF      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 1
;matrix_driver.c,228 :: 		for(row=start_row; row<end_row;row++)                                // proèítání jednotlivých øádkù (pro vykreslení výšky písma 7 øádkù)
	MOVF       set_char_5x7_on_XY_start_row_L0+0, 0
	MOVWF      set_char_5x7_on_XY_row_L0+0
L_set_char_5x7_on_XY24:
	MOVLW      128
	XORWF      set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_end_row_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY25
;matrix_driver.c,230 :: 		if(row>=0&&row<9)
	MOVLW      128
	XORWF      set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY29
	MOVLW      128
	XORWF      set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      9
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY29
L__set_char_5x7_on_XY134:
;matrix_driver.c,232 :: 		bit_to_read = 7;
	MOVLW      7
	MOVWF      set_char_5x7_on_XY_bit_to_read_L0+0
;matrix_driver.c,233 :: 		for(col_pos = col_offset; col_pos < 48; col_pos++)                //cyklus postupnì probìhne celý øádek pamìti
	MOVF       FARG_set_char_5x7_on_XY_col_offset+0, 0
	MOVWF      set_char_5x7_on_XY_col_pos_L0+0
L_set_char_5x7_on_XY30:
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      48
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY31
;matrix_driver.c,235 :: 		if (col_pos<(0)){ bit_to_read--; }
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY33
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
L_set_char_5x7_on_XY33:
;matrix_driver.c,236 :: 		if((col_pos>-1)&&(col_pos<8))                //kreslení do pamìového prostoru první matice
	MOVLW      128
	XORLW      255
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY36
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      8
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY36
L__set_char_5x7_on_XY133:
;matrix_driver.c,238 :: 		if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
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
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_col_pos_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY150
	MOVF       set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R1+0, 0
L__set_char_5x7_on_XY150:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY39
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY39
L__set_char_5x7_on_XY132:
;matrix_driver.c,240 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
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
	GOTO       L_set_char_5x7_on_XY40
;matrix_driver.c,241 :: 		VIDEO_MEM_1[row][0] |= (1<<(7 - col_pos));
	MOVLW      6
	MOVWF      R0+0
	MOVF       set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY151:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY152
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY151
L__set_char_5x7_on_XY152:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	GOTO       L_set_char_5x7_on_XY41
L_set_char_5x7_on_XY40:
;matrix_driver.c,243 :: 		VIDEO_MEM_1[row][0] &= ~(1<<(7 - col_pos));
	MOVLW      6
	MOVWF      R0+0
	MOVF       set_char_5x7_on_XY_row_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY153:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY154
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY153
L__set_char_5x7_on_XY154:
	COMF       R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ANDWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_set_char_5x7_on_XY41:
;matrix_driver.c,244 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_driver.c,245 :: 		}
L_set_char_5x7_on_XY39:
;matrix_driver.c,246 :: 		}
L_set_char_5x7_on_XY36:
;matrix_driver.c,248 :: 		if((col_pos>7)&&(col_pos<16))                //kreslení do pamìového prostoru druhé matice
	MOVLW      128
	XORLW      7
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY44
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      16
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY44
L__set_char_5x7_on_XY131:
;matrix_driver.c,250 :: 		if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
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
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_col_pos_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY155
	MOVF       set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R1+0, 0
L__set_char_5x7_on_XY155:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY47
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY47
L__set_char_5x7_on_XY130:
;matrix_driver.c,252 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
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
	GOTO       L_set_char_5x7_on_XY48
;matrix_driver.c,253 :: 		VIDEO_MEM_1[row][1] |= (1<<(7 - (col_pos-8)));
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
	SUBWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
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
L_set_char_5x7_on_XY48:
;matrix_driver.c,256 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_driver.c,257 :: 		}
L_set_char_5x7_on_XY47:
;matrix_driver.c,258 :: 		}
L_set_char_5x7_on_XY44:
;matrix_driver.c,260 :: 		if((col_pos>15)&&(col_pos<24))                //kreslení do pamìového prostoru tøetí matice
	MOVLW      128
	XORLW      15
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY51
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      24
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY51
L__set_char_5x7_on_XY129:
;matrix_driver.c,262 :: 		if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
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
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_col_pos_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY158
	MOVF       set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R1+0, 0
L__set_char_5x7_on_XY158:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY54
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY54
L__set_char_5x7_on_XY128:
;matrix_driver.c,264 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
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
	GOTO       L_set_char_5x7_on_XY55
;matrix_driver.c,265 :: 		VIDEO_MEM_1[row][2] |= (1<<(7 - (col_pos-16)));
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
	SUBWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY159:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY160
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY159
L__set_char_5x7_on_XY160:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_set_char_5x7_on_XY55:
;matrix_driver.c,268 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_driver.c,269 :: 		}
L_set_char_5x7_on_XY54:
;matrix_driver.c,270 :: 		}
L_set_char_5x7_on_XY51:
;matrix_driver.c,272 :: 		if((col_pos>23)&&(col_pos<32))                //kreslení do pamìového prostoru ètvrté matice
	MOVLW      128
	XORLW      23
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY58
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      32
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY58
L__set_char_5x7_on_XY127:
;matrix_driver.c,274 :: 		if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
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
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_col_pos_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY161
	MOVF       set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R1+0, 0
L__set_char_5x7_on_XY161:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY61
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY61
L__set_char_5x7_on_XY126:
;matrix_driver.c,276 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
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
	GOTO       L_set_char_5x7_on_XY62
;matrix_driver.c,277 :: 		VIDEO_MEM_1[row][3] |= (1<<(7 - (col_pos-24)));
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
	SUBWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY162:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY163
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY162
L__set_char_5x7_on_XY163:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_set_char_5x7_on_XY62:
;matrix_driver.c,280 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_driver.c,281 :: 		}
L_set_char_5x7_on_XY61:
;matrix_driver.c,282 :: 		}
L_set_char_5x7_on_XY58:
;matrix_driver.c,284 :: 		if((col_pos>31)&&(col_pos<40))                //kreslení do pamìového prostoru páté matice
	MOVLW      128
	XORLW      31
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY65
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      40
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY65
L__set_char_5x7_on_XY125:
;matrix_driver.c,286 :: 		if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
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
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_col_pos_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY164
	MOVF       set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R1+0, 0
L__set_char_5x7_on_XY164:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY68
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY68
L__set_char_5x7_on_XY124:
;matrix_driver.c,288 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
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
	GOTO       L_set_char_5x7_on_XY69
;matrix_driver.c,289 :: 		VIDEO_MEM_1[row][4] |= (1<<(7 - (col_pos-32)));
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
	SUBWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY165:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY166
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY165
L__set_char_5x7_on_XY166:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_set_char_5x7_on_XY69:
;matrix_driver.c,292 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_driver.c,293 :: 		}
L_set_char_5x7_on_XY68:
;matrix_driver.c,294 :: 		}
L_set_char_5x7_on_XY65:
;matrix_driver.c,296 :: 		if((col_pos>39)&&(col_pos<48))                //kreslení do pamìového prostoru páté matice
	MOVLW      128
	XORLW      39
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY72
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      48
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY72
L__set_char_5x7_on_XY123:
;matrix_driver.c,298 :: 		if((col_pos > (pixel_to_start_draw - 1)) && (col_pos<pixel_to_end_draw))                //pozice pro zaèátek kreslení
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
	XORWF      R1+1, 0
	MOVWF      R0+0
	MOVLW      128
	BTFSC      set_char_5x7_on_XY_col_pos_L0+0, 7
	MOVLW      127
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY167
	MOVF       set_char_5x7_on_XY_col_pos_L0+0, 0
	SUBWF      R1+0, 0
L__set_char_5x7_on_XY167:
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY75
	MOVLW      128
	XORWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_char_5x7_on_XY_pixel_to_end_draw_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_char_5x7_on_XY75
L__set_char_5x7_on_XY122:
;matrix_driver.c,300 :: 		if ((bit_read(bufferLong[act_row],bit_to_read)))        //jestliže je hodnota bitu "1", uloží se postupnì tento stav do videopamìti
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
	GOTO       L_set_char_5x7_on_XY76
;matrix_driver.c,301 :: 		VIDEO_MEM_1[row][5] |= (1<<(7 - (col_pos-40)));
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
	SUBWF      set_char_5x7_on_XY_col_pos_L0+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__set_char_5x7_on_XY168:
	BTFSC      STATUS+0, 2
	GOTO       L__set_char_5x7_on_XY169
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_char_5x7_on_XY168
L__set_char_5x7_on_XY169:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_set_char_5x7_on_XY76:
;matrix_driver.c,304 :: 		bit_to_read--;
	DECF       set_char_5x7_on_XY_bit_to_read_L0+0, 1
;matrix_driver.c,305 :: 		}
L_set_char_5x7_on_XY75:
;matrix_driver.c,306 :: 		}
L_set_char_5x7_on_XY72:
;matrix_driver.c,233 :: 		for(col_pos = col_offset; col_pos < 48; col_pos++)                //cyklus postupnì probìhne celý øádek pamìti
	INCF       set_char_5x7_on_XY_col_pos_L0+0, 1
;matrix_driver.c,307 :: 		}
	GOTO       L_set_char_5x7_on_XY30
L_set_char_5x7_on_XY31:
;matrix_driver.c,308 :: 		}
L_set_char_5x7_on_XY29:
;matrix_driver.c,309 :: 		act_row++;
	INCF       set_char_5x7_on_XY_act_row_L0+0, 1
;matrix_driver.c,228 :: 		for(row=start_row; row<end_row;row++)                                // proèítání jednotlivých øádkù (pro vykreslení výšky písma 7 øádkù)
	INCF       set_char_5x7_on_XY_row_L0+0, 1
;matrix_driver.c,311 :: 		}
	GOTO       L_set_char_5x7_on_XY24
L_set_char_5x7_on_XY25:
;matrix_driver.c,313 :: 		}
L_end_set_char_5x7_on_XY:
	RETURN
; end of _set_char_5x7_on_XY

_print_disp_memory_1:

;matrix_driver.c,315 :: 		void print_disp_memory_1()                                //rendering video memory after OADC
;matrix_driver.c,317 :: 		uint8_t a=0,i=0;
	CLRF       print_disp_memory_1_a_L0+0
	CLRF       print_disp_memory_1_i_L0+0
;matrix_driver.c,318 :: 		LOAD_OUT_LO                                      //initialization, setting bit perform write zero
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_driver.c,319 :: 		for(a=0; a<8 ; a++)                                // pøepínání øádkù matic (øádek 0 - 7)
	CLRF       print_disp_memory_1_a_L0+0
L_print_disp_memory_177:
	MOVLW      8
	SUBWF      print_disp_memory_1_a_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print_disp_memory_178
;matrix_driver.c,321 :: 		for(i=0;i<6;i++)                        // postupné odeslání dat øádkù pro všechny matice po SPI (i = 0: data øádku páté matice, odesílá se poøadím LSB first)
	CLRF       print_disp_memory_1_i_L0+0
L_print_disp_memory_180:
	MOVLW      6
	SUBWF      print_disp_memory_1_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print_disp_memory_181
;matrix_driver.c,323 :: 		if(a==0)
	MOVF       print_disp_memory_1_a_L0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_183
;matrix_driver.c,325 :: 		shift_out_byte(MAX7219_REGROW1);
	MOVLW      1
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,326 :: 		shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
	MOVLW      6
	MOVWF      R0+0
	MOVF       print_disp_memory_1_a_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      5
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
;matrix_driver.c,327 :: 		}
L_print_disp_memory_183:
;matrix_driver.c,328 :: 		if(a==1)
	MOVF       print_disp_memory_1_a_L0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_184
;matrix_driver.c,330 :: 		shift_out_byte(MAX7219_REGROW2);
	MOVLW      2
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,331 :: 		shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
	MOVLW      6
	MOVWF      R0+0
	MOVF       print_disp_memory_1_a_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      5
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
;matrix_driver.c,332 :: 		}
L_print_disp_memory_184:
;matrix_driver.c,333 :: 		if(a==2)
	MOVF       print_disp_memory_1_a_L0+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_185
;matrix_driver.c,335 :: 		shift_out_byte(MAX7219_REGROW3);
	MOVLW      3
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,336 :: 		shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
	MOVLW      6
	MOVWF      R0+0
	MOVF       print_disp_memory_1_a_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      5
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
;matrix_driver.c,337 :: 		}
L_print_disp_memory_185:
;matrix_driver.c,338 :: 		if(a==3)
	MOVF       print_disp_memory_1_a_L0+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_186
;matrix_driver.c,340 :: 		shift_out_byte(MAX7219_REGROW4);
	MOVLW      4
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,341 :: 		shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
	MOVLW      6
	MOVWF      R0+0
	MOVF       print_disp_memory_1_a_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      5
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
;matrix_driver.c,342 :: 		}
L_print_disp_memory_186:
;matrix_driver.c,343 :: 		if(a==4)
	MOVF       print_disp_memory_1_a_L0+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_187
;matrix_driver.c,345 :: 		shift_out_byte(MAX7219_REGROW5);
	MOVLW      5
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,346 :: 		shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
	MOVLW      6
	MOVWF      R0+0
	MOVF       print_disp_memory_1_a_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      5
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
;matrix_driver.c,347 :: 		}
L_print_disp_memory_187:
;matrix_driver.c,348 :: 		if(a==5)
	MOVF       print_disp_memory_1_a_L0+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_188
;matrix_driver.c,350 :: 		shift_out_byte(MAX7219_REGROW6);
	MOVLW      6
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,351 :: 		shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
	MOVLW      6
	MOVWF      R0+0
	MOVF       print_disp_memory_1_a_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      5
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
;matrix_driver.c,352 :: 		}
L_print_disp_memory_188:
;matrix_driver.c,353 :: 		if(a==6)
	MOVF       print_disp_memory_1_a_L0+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_189
;matrix_driver.c,355 :: 		shift_out_byte(MAX7219_REGROW7);
	MOVLW      7
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,356 :: 		shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
	MOVLW      6
	MOVWF      R0+0
	MOVF       print_disp_memory_1_a_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      5
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
;matrix_driver.c,357 :: 		}
L_print_disp_memory_189:
;matrix_driver.c,358 :: 		if(a==7)
	MOVF       print_disp_memory_1_a_L0+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_print_disp_memory_190
;matrix_driver.c,360 :: 		shift_out_byte(MAX7219_REGROW8);
	MOVLW      8
	MOVWF      FARG_shift_out_byte_byte_to_send+0
	CALL       _shift_out_byte+0
;matrix_driver.c,361 :: 		shift_out_byte(VIDEO_MEM_1[a][5-i]); // (5-i) - nejdøíve se odesílají data matice è.6 v první iteraci
	MOVLW      6
	MOVWF      R0+0
	MOVF       print_disp_memory_1_a_L0+0, 0
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDLW      _VIDEO_MEM_1+0
	MOVWF      R2+0
	MOVF       print_disp_memory_1_i_L0+0, 0
	SUBLW      5
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
;matrix_driver.c,362 :: 		}
L_print_disp_memory_190:
;matrix_driver.c,321 :: 		for(i=0;i<6;i++)                        // postupné odeslání dat øádkù pro všechny matice po SPI (i = 0: data øádku páté matice, odesílá se poøadím LSB first)
	INCF       print_disp_memory_1_i_L0+0, 1
;matrix_driver.c,363 :: 		}
	GOTO       L_print_disp_memory_180
L_print_disp_memory_181:
;matrix_driver.c,366 :: 		LOAD_OUT_HI                                                                        // inicializace, nastavení bitu provedení zápisu na log 1
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_driver.c,367 :: 		LOAD_OUT_LO                                                                        // inicializace, nastavení bitu provedení zápisu na nulu
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;matrix_driver.c,319 :: 		for(a=0; a<8 ; a++)                                // pøepínání øádkù matic (øádek 0 - 7)
	INCF       print_disp_memory_1_a_L0+0, 1
;matrix_driver.c,368 :: 		}
	GOTO       L_print_disp_memory_177
L_print_disp_memory_178:
;matrix_driver.c,369 :: 		}
L_end_print_disp_memory_1:
	RETURN
; end of _print_disp_memory_1

_print_string:

;matrix_driver.c,372 :: 		void print_string(sint8_t clean_video_mem, sint8_t col_offset, sint8_t row_offset,uint8_t *string)
;matrix_driver.c,374 :: 		sint8_t seg=0,act_char_position=0;           //the position of the currently processed character
	CLRF       print_string_act_char_position_L0+0
	CLRF       print_string_font_lenght_L0+0
;matrix_driver.c,377 :: 		if(clean_video_mem==1){  clear_videoMem_1(); }
	MOVF       FARG_print_string_clean_video_mem+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_print_string91
	CALL       _clear_videoMem_1+0
L_print_string91:
;matrix_driver.c,378 :: 		act_char_position = col_offset;
	MOVF       FARG_print_string_col_offset+0, 0
	MOVWF      print_string_act_char_position_L0+0
;matrix_driver.c,379 :: 		while(*string)                //in the cycle is maintained as reading the entire field, which should be displayed
L_print_string92:
	MOVF       FARG_print_string_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_print_string93
;matrix_driver.c,382 :: 		loadBufferLong(*string);
	MOVF       FARG_print_string_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_loadBufferLong_ascii+0
	CALL       _loadBufferLong+0
;matrix_driver.c,383 :: 		font_lenght = bufferLong[7];        // first detected in the bit length of the processed character string
	MOVF       _bufferLong+7, 0
	MOVWF      print_string_font_lenght_L0+0
;matrix_driver.c,384 :: 		if((act_char_position+font_lenght)>(-1))   //if the last point of a character rendered from the current position extends into the display area is called rendering function character in videopamìti
	MOVF       _bufferLong+7, 0
	ADDWF      print_string_act_char_position_L0+0, 0
	MOVWF      R1+0
	MOVLW      0
	BTFSC      print_string_act_char_position_L0+0, 7
	MOVLW      255
	MOVWF      R1+1
	BTFSC      STATUS+0, 0
	INCF       R1+1, 1
	MOVLW      127
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__print_string172
	MOVF       R1+0, 0
	SUBLW      255
L__print_string172:
	BTFSC      STATUS+0, 0
	GOTO       L_print_string94
;matrix_driver.c,385 :: 		set_char_5x7_on_XY(act_char_position,row_offset,*string);
	MOVF       print_string_act_char_position_L0+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_col_offset+0
	MOVF       FARG_print_string_row_offset+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_row_offset+0
	MOVF       FARG_print_string_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_set_char_5x7_on_XY_character+0
	CALL       _set_char_5x7_on_XY+0
L_print_string94:
;matrix_driver.c,386 :: 		if (act_char_position > 47)  //if poeatek newly rendered character display area for matrix display, rendering will be interrupted
	MOVLW      128
	XORLW      47
	MOVWF      R0+0
	MOVLW      128
	XORWF      print_string_act_char_position_L0+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_print_string95
;matrix_driver.c,387 :: 		break;
	GOTO       L_print_string93
L_print_string95:
;matrix_driver.c,388 :: 		*string++;
	INCF       FARG_print_string_string+0, 1
;matrix_driver.c,389 :: 		act_char_position = act_char_position + font_lenght;   //after the decision, product or to rendering step is increased further pointer to the next character position pøípadného
	MOVF       print_string_font_lenght_L0+0, 0
	ADDWF      print_string_act_char_position_L0+0, 1
;matrix_driver.c,391 :: 		}
	GOTO       L_print_string92
L_print_string93:
;matrix_driver.c,393 :: 		print_disp_memory_1();
	CALL       _print_disp_memory_1+0
;matrix_driver.c,394 :: 		}
L_end_print_string:
	RETURN
; end of _print_string

_set_bode_to_videoMem:

;matrix_driver.c,396 :: 		void set_bode_to_videoMem(uint8_t x, uint8_t y)
;matrix_driver.c,398 :: 		if(x<9)                //bod bude kreslen na první matici
	MOVLW      9
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem96
;matrix_driver.c,400 :: 		VIDEO_MEM_1[y-1][0] |= (1<<(7-(x-1)));
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
L__set_bode_to_videoMem174:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem175
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem174
L__set_bode_to_videoMem175:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_driver.c,401 :: 		}
L_set_bode_to_videoMem96:
;matrix_driver.c,403 :: 		if((x>8) && (x<17))        // bod bude kreslen na druhé matici
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      8
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem99
	MOVLW      17
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem99
L__set_bode_to_videoMem139:
;matrix_driver.c,405 :: 		VIDEO_MEM_1[y-1][1] |= (1<<(7-(x-9)));
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
L__set_bode_to_videoMem176:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem177
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem176
L__set_bode_to_videoMem177:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_driver.c,406 :: 		}
L_set_bode_to_videoMem99:
;matrix_driver.c,408 :: 		if((x>16) && (x<25))        // bod bude kreslen na tøetí matici
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      16
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem102
	MOVLW      25
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem102
L__set_bode_to_videoMem138:
;matrix_driver.c,410 :: 		VIDEO_MEM_1[y-1][2] |= (1<<(7-(x-17)));
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
L__set_bode_to_videoMem178:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem179
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem178
L__set_bode_to_videoMem179:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_driver.c,411 :: 		}
L_set_bode_to_videoMem102:
;matrix_driver.c,413 :: 		if((x>24) && (x<33))        // bod bude kreslen na ètvrtou matici
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      24
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem105
	MOVLW      33
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem105
L__set_bode_to_videoMem137:
;matrix_driver.c,415 :: 		VIDEO_MEM_1[y-1][3] |= (1<<(7-(x-25)));
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
L__set_bode_to_videoMem180:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem181
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem180
L__set_bode_to_videoMem181:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_driver.c,416 :: 		}
L_set_bode_to_videoMem105:
;matrix_driver.c,418 :: 		if((x>32) && (x<41))        // bod bude kreslen na ètvrtou matici
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      32
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem108
	MOVLW      41
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem108
L__set_bode_to_videoMem136:
;matrix_driver.c,420 :: 		VIDEO_MEM_1[y-1][4] |= (1<<(7-(x-33)));
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
L__set_bode_to_videoMem182:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem183
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem182
L__set_bode_to_videoMem183:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_driver.c,421 :: 		}
L_set_bode_to_videoMem108:
;matrix_driver.c,422 :: 		if((x>40) && (x<49))        // bod bude kreslen na ètvrtou matici
	MOVF       FARG_set_bode_to_videoMem_x+0, 0
	SUBLW      40
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem111
	MOVLW      49
	SUBWF      FARG_set_bode_to_videoMem_x+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_bode_to_videoMem111
L__set_bode_to_videoMem135:
;matrix_driver.c,424 :: 		VIDEO_MEM_1[y-1][5] |= (1<<(7-(x-41)));
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
L__set_bode_to_videoMem184:
	BTFSC      STATUS+0, 2
	GOTO       L__set_bode_to_videoMem185
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__set_bode_to_videoMem184
L__set_bode_to_videoMem185:
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	IORWF      R0+0, 1
	MOVF       R2+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;matrix_driver.c,425 :: 		}
L_set_bode_to_videoMem111:
;matrix_driver.c,426 :: 		}
L_end_set_bode_to_videoMem:
	RETURN
; end of _set_bode_to_videoMem

_check_string_lenght:

;matrix_driver.c,429 :: 		uint16_t check_string_lenght(uint8_t *string)
;matrix_driver.c,441 :: 		uint16_t string_on_display_lenght = 0;
	MOVLW      0
	MOVWF      check_string_lenght_string_on_display_lenght_L0+0
	MOVLW      0
	MOVWF      check_string_lenght_string_on_display_lenght_L0+1
;matrix_driver.c,442 :: 		while (*string)                //in the cycle is maintained as reading the entire field, which finally position for rendering has to be detected in
L_check_string_lenght112:
	MOVF       FARG_check_string_lenght_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_check_string_lenght113
;matrix_driver.c,444 :: 		loadBufferLong(*string);
	MOVF       FARG_check_string_lenght_string+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_loadBufferLong_ascii+0
	CALL       _loadBufferLong+0
;matrix_driver.c,445 :: 		string_on_display_lenght = string_on_display_lenght + bufferLong[7];        // first detected in the bit length of the processed character strings
	MOVF       _bufferLong+7, 0
	ADDWF      check_string_lenght_string_on_display_lenght_L0+0, 1
	BTFSC      STATUS+0, 0
	INCF       check_string_lenght_string_on_display_lenght_L0+1, 1
;matrix_driver.c,446 :: 		*string++;
	INCF       FARG_check_string_lenght_string+0, 1
;matrix_driver.c,447 :: 		}
	GOTO       L_check_string_lenght112
L_check_string_lenght113:
;matrix_driver.c,449 :: 		return string_on_display_lenght;
	MOVF       check_string_lenght_string_on_display_lenght_L0+0, 0
	MOVWF      R0+0
	MOVF       check_string_lenght_string_on_display_lenght_L0+1, 0
	MOVWF      R0+1
;matrix_driver.c,450 :: 		}
L_end_check_string_lenght:
	RETURN
; end of _check_string_lenght

_RUNNING_TEXT:

;matrix_driver.c,453 :: 		void RUNNING_TEXT(sint8_t disp_points,sint16_t step_delay_time,uint8_t *text)
;matrix_driver.c,456 :: 		string_lenght = check_string_lenght(text);
	MOVF       FARG_RUNNING_TEXT_text+0, 0
	MOVWF      FARG_check_string_lenght_string+0
	CALL       _check_string_lenght+0
	MOVF       R0+0, 0
	MOVWF      RUNNING_TEXT_string_lenght_L0+0
;matrix_driver.c,461 :: 		for (i = (disp_points + 1);i>(disp_points - string_lenght-disp_points);i--)
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
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__RUNNING_TEXT188
	MOVF       RUNNING_TEXT_i_L0+0, 0
	SUBWF      R2+0, 0
L__RUNNING_TEXT188:
	BTFSC      STATUS+0, 0
	GOTO       L_RUNNING_TEXT115
;matrix_driver.c,463 :: 		LED = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;matrix_driver.c,464 :: 		print_string(1,i,0,text);
	MOVLW      1
	MOVWF      FARG_print_string_clean_video_mem+0
	MOVF       RUNNING_TEXT_i_L0+0, 0
	MOVWF      FARG_print_string_col_offset+0
	CLRF       FARG_print_string_row_offset+0
	MOVF       FARG_RUNNING_TEXT_text+0, 0
	MOVWF      FARG_print_string_string+0
	CALL       _print_string+0
;matrix_driver.c,466 :: 		LED = 1;
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
;matrix_driver.c,467 :: 		for(i=0;i<step_delay_time;i++)
	CLRF       RUNNING_TEXT_i_L0+0
L_RUNNING_TEXT117:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      FARG_RUNNING_TEXT_step_delay_time+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__RUNNING_TEXT189
	MOVF       FARG_RUNNING_TEXT_step_delay_time+0, 0
	SUBWF      RUNNING_TEXT_i_L0+0, 0
L__RUNNING_TEXT189:
	BTFSC      STATUS+0, 0
	GOTO       L_RUNNING_TEXT118
;matrix_driver.c,469 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_RUNNING_TEXT120:
	DECFSZ     R13+0, 1
	GOTO       L_RUNNING_TEXT120
	DECFSZ     R12+0, 1
	GOTO       L_RUNNING_TEXT120
	NOP
;matrix_driver.c,467 :: 		for(i=0;i<step_delay_time;i++)
	INCF       RUNNING_TEXT_i_L0+0, 1
;matrix_driver.c,470 :: 		}
	GOTO       L_RUNNING_TEXT117
L_RUNNING_TEXT118:
;matrix_driver.c,461 :: 		for (i = (disp_points + 1);i>(disp_points - string_lenght-disp_points);i--)
	DECF       RUNNING_TEXT_i_L0+0, 1
;matrix_driver.c,472 :: 		}
	GOTO       L_RUNNING_TEXT114
L_RUNNING_TEXT115:
;matrix_driver.c,474 :: 		}
L_end_RUNNING_TEXT:
	RETURN
; end of _RUNNING_TEXT
