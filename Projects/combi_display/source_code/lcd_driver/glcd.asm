
_ctrl_off:

;glcd.c,34 :: 		void ctrl_off()
;glcd.c,36 :: 		RS=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;glcd.c,37 :: 		RW=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;glcd.c,38 :: 		EN=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,39 :: 		CS1=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;glcd.c,40 :: 		CS2=0;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;glcd.c,41 :: 		}
L_end_ctrl_off:
	RETURN
; end of _ctrl_off

_delay:

;glcd.c,44 :: 		void delay(unsigned int j)
;glcd.c,47 :: 		for(i=0;i<j;i++);
	CLRF       R1+0
	CLRF       R1+1
L_delay0:
	MOVF       FARG_delay_j+1, 0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__delay31
	MOVF       FARG_delay_j+0, 0
	SUBWF      R1+0, 0
L__delay31:
	BTFSC      STATUS+0, 0
	GOTO       L_delay1
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
	GOTO       L_delay0
L_delay1:
;glcd.c,48 :: 		}
L_end_delay:
	RETURN
; end of _delay

_display_on:

;glcd.c,51 :: 		void display_on()
;glcd.c,53 :: 		ctrl_off();
	CALL       _ctrl_off+0
;glcd.c,54 :: 		DPORT=0x3f;
	MOVLW      63
	MOVWF      PORTB+0
;glcd.c,55 :: 		CS1=0;CS2=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;glcd.c,56 :: 		RW=0;RS=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;glcd.c,57 :: 		EN=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,58 :: 		delay(100);
	MOVLW      100
	MOVWF      FARG_delay_j+0
	MOVLW      0
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;glcd.c,59 :: 		EN=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,60 :: 		}
L_end_display_on:
	RETURN
; end of _display_on

_display_off:

;glcd.c,63 :: 		void display_off()
;glcd.c,65 :: 		ctrl_off();
	CALL       _ctrl_off+0
;glcd.c,66 :: 		DPORT=0x3e;
	MOVLW      62
	MOVWF      PORTB+0
;glcd.c,67 :: 		CS1=1;CS2=1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
;glcd.c,68 :: 		RS=0;RW=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;glcd.c,69 :: 		EN=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,70 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_j+0
	MOVLW      0
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;glcd.c,71 :: 		EN=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,72 :: 		}
L_end_display_off:
	RETURN
; end of _display_off

_set_column:

;glcd.c,75 :: 		void set_column(unsigned char col)
;glcd.c,77 :: 		if(col<64)
	MOVLW      64
	SUBWF      FARG_set_column_col+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_set_column3
;glcd.c,79 :: 		ctrl_off();
	CALL       _ctrl_off+0
;glcd.c,80 :: 		column=col;
	MOVF       FARG_set_column_col+0, 0
	MOVWF      _column+0
;glcd.c,81 :: 		DPORT=0x40|(col&63);          //0x40 represents Column 0
	MOVLW      63
	ANDWF      FARG_set_column_col+0, 0
	MOVWF      R0+0
	MOVLW      64
	IORWF      R0+0, 0
	MOVWF      PORTB+0
;glcd.c,82 :: 		CS1=0;CS2=1;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
;glcd.c,83 :: 		RS=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;glcd.c,84 :: 		RW=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;glcd.c,85 :: 		EN=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,86 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_j+0
	MOVLW      0
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;glcd.c,87 :: 		EN=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,88 :: 		}
	GOTO       L_set_column4
L_set_column3:
;glcd.c,91 :: 		column=col;
	MOVF       FARG_set_column_col+0, 0
	MOVWF      _column+0
;glcd.c,92 :: 		DPORT=0x40|((col-64)&63);          //0x40 represents Column 0
	MOVLW      64
	SUBWF      FARG_set_column_col+0, 0
	MOVWF      R0+0
	MOVLW      63
	ANDWF      R0+0, 1
	MOVLW      64
	IORWF      R0+0, 0
	MOVWF      PORTB+0
;glcd.c,93 :: 		CS2=0;CS1=1;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;glcd.c,94 :: 		RS=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;glcd.c,95 :: 		RW=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;glcd.c,96 :: 		EN=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,97 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_j+0
	MOVLW      0
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;glcd.c,98 :: 		EN=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,100 :: 		}
L_set_column4:
;glcd.c,101 :: 		}
L_end_set_column:
	RETURN
; end of _set_column

_set_page:

;glcd.c,104 :: 		void set_page(unsigned char page)
;glcd.c,106 :: 		ctrl_off();
	CALL       _ctrl_off+0
;glcd.c,107 :: 		DPORT= 0xb8|page;           //0xb8 represents Page 0
	MOVLW      184
	IORWF      FARG_set_page_page+0, 0
	MOVWF      PORTB+0
;glcd.c,108 :: 		RS=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;glcd.c,109 :: 		RW=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;glcd.c,110 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_j+0
	MOVLW      0
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;glcd.c,111 :: 		EN=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,112 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_j+0
	MOVLW      0
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;glcd.c,113 :: 		EN=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,114 :: 		}
L_end_set_page:
	RETURN
; end of _set_page

_set_start_line:

;glcd.c,117 :: 		void set_start_line(unsigned char line)
;glcd.c,119 :: 		ctrl_off();
	CALL       _ctrl_off+0
;glcd.c,120 :: 		DPORT=0xc0|line;           //0xc0 represents Line 0
	MOVLW      192
	IORWF      FARG_set_start_line_line+0, 0
	MOVWF      PORTB+0
;glcd.c,121 :: 		CS1=0; CS2=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
;glcd.c,122 :: 		RS=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
;glcd.c,123 :: 		RW=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;glcd.c,124 :: 		EN=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,125 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_j+0
	MOVLW      0
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;glcd.c,126 :: 		EN=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,127 :: 		}
L_end_set_start_line:
	RETURN
; end of _set_start_line

_lcd_data:

;glcd.c,130 :: 		void lcd_data(const unsigned char *value,unsigned int limit)
;glcd.c,133 :: 		for(i=0;i<limit;i++)
	CLRF       lcd_data_i_L0+0
	CLRF       lcd_data_i_L0+1
L_lcd_data5:
	MOVF       FARG_lcd_data_limit+1, 0
	SUBWF      lcd_data_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lcd_data38
	MOVF       FARG_lcd_data_limit+0, 0
	SUBWF      lcd_data_i_L0+0, 0
L__lcd_data38:
	BTFSC      STATUS+0, 0
	GOTO       L_lcd_data6
;glcd.c,135 :: 		if(column<64)
	MOVLW      64
	SUBWF      _column+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_lcd_data8
;glcd.c,137 :: 		DPORT=value[i];
	MOVF       lcd_data_i_L0+0, 0
	ADDWF      FARG_lcd_data_value+0, 0
	MOVWF      R0+0
	MOVF       FARG_lcd_data_value+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      lcd_data_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;glcd.c,138 :: 		CS1=0;CS2=1;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
;glcd.c,139 :: 		RS=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;glcd.c,140 :: 		RW=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;glcd.c,141 :: 		EN=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,142 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_j+0
	MOVLW      0
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;glcd.c,143 :: 		EN=0        ;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,144 :: 		column++;
	INCF       _column+0, 1
;glcd.c,145 :: 		}
	GOTO       L_lcd_data9
L_lcd_data8:
;glcd.c,148 :: 		set_column(column);
	MOVF       _column+0, 0
	MOVWF      FARG_set_column_col+0
	CALL       _set_column+0
;glcd.c,149 :: 		DPORT=value[i];
	MOVF       lcd_data_i_L0+0, 0
	ADDWF      FARG_lcd_data_value+0, 0
	MOVWF      R0+0
	MOVF       FARG_lcd_data_value+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      lcd_data_i_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      PORTB+0
;glcd.c,150 :: 		CS2=0;CS1=1;
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;glcd.c,151 :: 		RS=1;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
;glcd.c,152 :: 		RW=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;glcd.c,153 :: 		EN=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,154 :: 		delay(10);
	MOVLW      10
	MOVWF      FARG_delay_j+0
	MOVLW      0
	MOVWF      FARG_delay_j+1
	CALL       _delay+0
;glcd.c,155 :: 		EN=0        ;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
;glcd.c,156 :: 		column++;
	INCF       _column+0, 1
;glcd.c,157 :: 		}
L_lcd_data9:
;glcd.c,158 :: 		if(column>127)
	MOVF       _column+0, 0
	SUBLW      127
	BTFSC      STATUS+0, 0
	GOTO       L_lcd_data10
;glcd.c,159 :: 		return;
	GOTO       L_end_lcd_data
L_lcd_data10:
;glcd.c,133 :: 		for(i=0;i<limit;i++)
	INCF       lcd_data_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       lcd_data_i_L0+1, 1
;glcd.c,160 :: 		}
	GOTO       L_lcd_data5
L_lcd_data6:
;glcd.c,161 :: 		}
L_end_lcd_data:
	RETURN
; end of _lcd_data

_lcd_puts1:

;glcd.c,164 :: 		void lcd_puts1(unsigned char col,unsigned char page,unsigned char *str)
;glcd.c,168 :: 		set_column(col);
	MOVF       FARG_lcd_puts1_col+0, 0
	MOVWF      FARG_set_column_col+0
	CALL       _set_column+0
;glcd.c,169 :: 		set_page(page);
	MOVF       FARG_lcd_puts1_page+0, 0
	MOVWF      FARG_set_page_page+0
	CALL       _set_page+0
;glcd.c,170 :: 		for(i=0;str[i]!=0;i++)
	CLRF       lcd_puts1_i_L0+0
L_lcd_puts111:
	MOVF       lcd_puts1_i_L0+0, 0
	ADDWF      FARG_lcd_puts1_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_puts112
;glcd.c,172 :: 		a=(*(str+i));
	MOVF       lcd_puts1_i_L0+0, 0
	ADDWF      FARG_lcd_puts1_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      lcd_puts1_a_L0+0
	CLRF       lcd_puts1_a_L0+1
	MOVLW      0
	MOVWF      lcd_puts1_a_L0+1
;glcd.c,173 :: 		a*=8;
	MOVF       lcd_puts1_a_L0+0, 0
	MOVWF      R0+0
	MOVF       lcd_puts1_a_L0+1, 0
	MOVWF      R0+1
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      lcd_puts1_a_L0+0
	MOVF       R0+1, 0
	MOVWF      lcd_puts1_a_L0+1
;glcd.c,174 :: 		lcd_data(&Character8x8[a],8);
	MOVF       R0+0, 0
	ADDLW      _Character8x8+0
	MOVWF      FARG_lcd_data_value+0
	MOVLW      hi_addr(_Character8x8+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_lcd_data_value+1
	MOVLW      8
	MOVWF      FARG_lcd_data_limit+0
	MOVLW      0
	MOVWF      FARG_lcd_data_limit+1
	CALL       _lcd_data+0
;glcd.c,170 :: 		for(i=0;str[i]!=0;i++)
	INCF       lcd_puts1_i_L0+0, 1
;glcd.c,175 :: 		}
	GOTO       L_lcd_puts111
L_lcd_puts112:
;glcd.c,176 :: 		}
L_end_lcd_puts1:
	RETURN
; end of _lcd_puts1

_lcd_puts2:

;glcd.c,179 :: 		void lcd_puts2(unsigned char col,unsigned char page,unsigned char *str)
;glcd.c,183 :: 		set_column(col);
	MOVF       FARG_lcd_puts2_col+0, 0
	MOVWF      FARG_set_column_col+0
	CALL       _set_column+0
;glcd.c,184 :: 		set_page(page);
	MOVF       FARG_lcd_puts2_page+0, 0
	MOVWF      FARG_set_page_page+0
	CALL       _set_page+0
;glcd.c,185 :: 		for(i=0;str[i]!=0;i++)
	CLRF       lcd_puts2_i_L0+0
L_lcd_puts214:
	MOVF       lcd_puts2_i_L0+0, 0
	ADDWF      FARG_lcd_puts2_str+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_puts215
;glcd.c,187 :: 		a=(*(str+i)-32);
	MOVF       lcd_puts2_i_L0+0, 0
	ADDWF      FARG_lcd_puts2_str+0, 0
	MOVWF      FSR
	MOVLW      32
	SUBWF      INDF+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
;glcd.c,188 :: 		a*=6;
	MOVLW      6
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
;glcd.c,189 :: 		lcd_data(&font5x7[a],6);
	MOVF       R0+0, 0
	ADDLW      _font5x7+0
	MOVWF      FARG_lcd_data_value+0
	MOVLW      hi_addr(_font5x7+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_lcd_data_value+1
	MOVLW      6
	MOVWF      FARG_lcd_data_limit+0
	MOVLW      0
	MOVWF      FARG_lcd_data_limit+1
	CALL       _lcd_data+0
;glcd.c,185 :: 		for(i=0;str[i]!=0;i++)
	INCF       lcd_puts2_i_L0+0, 1
;glcd.c,190 :: 		}
	GOTO       L_lcd_puts214
L_lcd_puts215:
;glcd.c,191 :: 		}
L_end_lcd_puts2:
	RETURN
; end of _lcd_puts2

_lcd_notify_const:

;glcd.c,194 :: 		void lcd_notify_const(unsigned char col,unsigned char page,unsigned char num)
;glcd.c,198 :: 		set_column(col);
	MOVF       FARG_lcd_notify_const_col+0, 0
	MOVWF      FARG_set_column_col+0
	CALL       _set_column+0
;glcd.c,199 :: 		set_page(page);
	MOVF       FARG_lcd_notify_const_page+0, 0
	MOVWF      FARG_set_page_page+0
	CALL       _set_page+0
;glcd.c,200 :: 		num*=8;
	MOVF       FARG_lcd_notify_const_num+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	MOVWF      FARG_lcd_notify_const_num+0
;glcd.c,201 :: 		lcd_data(&noti_bar8x8[num],8);
	MOVF       R0+0, 0
	ADDLW      _noti_bar8x8+0
	MOVWF      FARG_lcd_data_value+0
	MOVLW      hi_addr(_noti_bar8x8+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      FARG_lcd_data_value+1
	MOVLW      8
	MOVWF      FARG_lcd_data_limit+0
	MOVLW      0
	MOVWF      FARG_lcd_data_limit+1
	CALL       _lcd_data+0
;glcd.c,203 :: 		}
L_end_lcd_notify_const:
	RETURN
; end of _lcd_notify_const

_lcd_puts2_const:

;glcd.c,206 :: 		void lcd_puts2_const(unsigned char col,unsigned char page,const unsigned char *str)
;glcd.c,210 :: 		set_column(col);
	MOVF       FARG_lcd_puts2_const_col+0, 0
	MOVWF      FARG_set_column_col+0
	CALL       _set_column+0
;glcd.c,211 :: 		set_page(page);
	MOVF       FARG_lcd_puts2_const_page+0, 0
	MOVWF      FARG_set_page_page+0
	CALL       _set_page+0
;glcd.c,212 :: 		for(i=0;str[i]!=0;i++)
	CLRF       lcd_puts2_const_i_L0+0
L_lcd_puts2_const17:
	MOVF       lcd_puts2_const_i_L0+0, 0
	ADDWF      FARG_lcd_puts2_const_str+0, 0
	MOVWF      R0+0
	MOVF       FARG_lcd_puts2_const_str+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R1+0
	MOVF       R1+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_lcd_puts2_const18
;glcd.c,214 :: 		a=(*(str+i)-32);
	MOVF       lcd_puts2_const_i_L0+0, 0
	ADDWF      FARG_lcd_puts2_const_str+0, 0
	MOVWF      R0+0
	MOVF       FARG_lcd_puts2_const_str+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVLW      32
	SUBWF      R0+0, 1
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
;glcd.c,215 :: 		a*=6;
	MOVLW      6
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
;glcd.c,216 :: 		lcd_data(&font5x7[a],6);
	MOVF       R0+0, 0
	ADDLW      _font5x7+0
	MOVWF      FARG_lcd_data_value+0
	MOVLW      hi_addr(_font5x7+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_lcd_data_value+1
	MOVLW      6
	MOVWF      FARG_lcd_data_limit+0
	MOVLW      0
	MOVWF      FARG_lcd_data_limit+1
	CALL       _lcd_data+0
;glcd.c,212 :: 		for(i=0;str[i]!=0;i++)
	INCF       lcd_puts2_const_i_L0+0, 1
;glcd.c,217 :: 		}
	GOTO       L_lcd_puts2_const17
L_lcd_puts2_const18:
;glcd.c,218 :: 		}
L_end_lcd_puts2_const:
	RETURN
; end of _lcd_puts2_const

_picture:

;glcd.c,220 :: 		void picture(const unsigned char * val)
;glcd.c,223 :: 		set_column(0);
	CLRF       FARG_set_column_col+0
	CALL       _set_column+0
;glcd.c,224 :: 		set_page(0);
	CLRF       FARG_set_page_page+0
	CALL       _set_page+0
;glcd.c,225 :: 		for (j=0;j<8;j++)
	CLRF       picture_j_L0+0
L_picture20:
	MOVLW      8
	SUBWF      picture_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_picture21
;glcd.c,227 :: 		set_page(j);
	MOVF       picture_j_L0+0, 0
	MOVWF      FARG_set_page_page+0
	CALL       _set_page+0
;glcd.c,228 :: 		set_column(0);
	CLRF       FARG_set_column_col+0
	CALL       _set_column+0
;glcd.c,229 :: 		lcd_data(&val[(j*128)],128);
	MOVLW      7
	MOVWF      R2+0
	MOVF       picture_j_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVF       R2+0, 0
L__picture44:
	BTFSC      STATUS+0, 2
	GOTO       L__picture45
	RLF        R0+0, 1
	RLF        R0+1, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__picture44
L__picture45:
	MOVF       R0+0, 0
	ADDWF      FARG_picture_val+0, 0
	MOVWF      FARG_lcd_data_value+0
	MOVF       FARG_picture_val+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_lcd_data_value+1
	MOVLW      128
	MOVWF      FARG_lcd_data_limit+0
	CLRF       FARG_lcd_data_limit+1
	CALL       _lcd_data+0
;glcd.c,225 :: 		for (j=0;j<8;j++)
	INCF       picture_j_L0+0, 1
;glcd.c,230 :: 		}
	GOTO       L_picture20
L_picture21:
;glcd.c,231 :: 		}
L_end_picture:
	RETURN
; end of _picture

_clr_lcd:

;glcd.c,234 :: 		void clr_lcd()
;glcd.c,237 :: 		for (i=0;i < 8;i++)
	CLRF       clr_lcd_i_L0+0
L_clr_lcd23:
	MOVLW      8
	SUBWF      clr_lcd_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_clr_lcd24
;glcd.c,239 :: 		set_page(i);
	MOVF       clr_lcd_i_L0+0, 0
	MOVWF      FARG_set_page_page+0
	CALL       _set_page+0
;glcd.c,240 :: 		set_column(0);
	CLRF       FARG_set_column_col+0
	CALL       _set_column+0
;glcd.c,241 :: 		for (j= 0 ;j < 128; j++)
	CLRF       clr_lcd_j_L0+0
L_clr_lcd26:
	MOVLW      128
	SUBWF      clr_lcd_j_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_clr_lcd27
;glcd.c,242 :: 		lcd_data(zero,1);
	MOVLW      _zero+0
	MOVWF      FARG_lcd_data_value+0
	MOVLW      hi_addr(_zero+0)
	MOVWF      FARG_lcd_data_value+1
	MOVLW      1
	MOVWF      FARG_lcd_data_limit+0
	MOVLW      0
	MOVWF      FARG_lcd_data_limit+1
	CALL       _lcd_data+0
;glcd.c,241 :: 		for (j= 0 ;j < 128; j++)
	INCF       clr_lcd_j_L0+0, 1
;glcd.c,242 :: 		lcd_data(zero,1);
	GOTO       L_clr_lcd26
L_clr_lcd27:
;glcd.c,237 :: 		for (i=0;i < 8;i++)
	INCF       clr_lcd_i_L0+0, 1
;glcd.c,243 :: 		}
	GOTO       L_clr_lcd23
L_clr_lcd24:
;glcd.c,244 :: 		}
L_end_clr_lcd:
	RETURN
; end of _clr_lcd
