
_init_uc:

;voltmeter.c,132 :: 		void init_uc()
;voltmeter.c,134 :: 		ADCON1=0x00;
	CLRF       ADCON1+0
;voltmeter.c,135 :: 		ANSEL=0x00;
	CLRF       ANSEL+0
;voltmeter.c,136 :: 		ANSELH = 0x08;
	MOVLW      8
	MOVWF      ANSELH+0
;voltmeter.c,137 :: 		TRISA=0x00;
	CLRF       TRISA+0
;voltmeter.c,138 :: 		TRISB=0xFF;
	MOVLW      255
	MOVWF      TRISB+0
;voltmeter.c,139 :: 		TRISC=0x00;
	CLRF       TRISC+0
;voltmeter.c,140 :: 		LCD_WR=0;
	BCF        RA1_bit+0, BitPos(RA1_bit+0)
;voltmeter.c,141 :: 		lcd_init();
	CALL       _Lcd_Init+0
;voltmeter.c,142 :: 		lcd_cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;voltmeter.c,143 :: 		lcd_Out(1,1,"ADC=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_voltmeter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;voltmeter.c,144 :: 		}
L_end_init_uc:
	RETURN
; end of _init_uc

_error_cor:

;voltmeter.c,146 :: 		void error_cor(float temp)
;voltmeter.c,149 :: 		if(temp<1 || (temp>=1.95&&temp<=4) || (temp>=12.95&&temp<=15) || (temp>=24.95&&temp<25.99) ){offset=0.01;}
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__error_cor57
	MOVLW      154
	MOVWF      R4+0
	MOVLW      153
	MOVWF      R4+1
	MOVLW      121
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor60
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R4+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R4+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R4+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      0
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor60
	GOTO       L__error_cor57
L__error_cor60:
	MOVLW      51
	MOVWF      R4+0
	MOVLW      51
	MOVWF      R4+1
	MOVLW      79
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor59
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R4+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R4+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R4+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      112
	MOVWF      R0+2
	MOVLW      130
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor59
	GOTO       L__error_cor57
L__error_cor59:
	MOVLW      154
	MOVWF      R4+0
	MOVLW      153
	MOVWF      R4+1
	MOVLW      71
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor58
	MOVLW      133
	MOVWF      R4+0
	MOVLW      235
	MOVWF      R4+1
	MOVLW      79
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor58
	GOTO       L__error_cor57
L__error_cor58:
	GOTO       L_error_cor8
L__error_cor57:
	MOVLW      10
	MOVWF      _offset+0
	MOVLW      215
	MOVWF      _offset+1
	MOVLW      35
	MOVWF      _offset+2
	MOVLW      120
	MOVWF      _offset+3
L_error_cor8:
;voltmeter.c,150 :: 		if((temp>=16&&temp<=19.99) || (temp>=28&&temp<=30) ||  (temp>=5.95 && temp<=7.99)){offset=-0.01;}
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor56
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R4+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R4+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R4+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R4+3
	MOVLW      133
	MOVWF      R0+0
	MOVLW      235
	MOVWF      R0+1
	MOVLW      31
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor56
	GOTO       L__error_cor53
L__error_cor56:
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      96
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor55
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R4+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R4+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R4+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      112
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor55
	GOTO       L__error_cor53
L__error_cor55:
	MOVLW      102
	MOVWF      R4+0
	MOVLW      102
	MOVWF      R4+1
	MOVLW      62
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor54
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R4+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R4+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R4+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R4+3
	MOVLW      20
	MOVWF      R0+0
	MOVLW      174
	MOVWF      R0+1
	MOVLW      127
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L__error_cor54
	GOTO       L__error_cor53
L__error_cor54:
	GOTO       L_error_cor17
L__error_cor53:
	MOVLW      10
	MOVWF      _offset+0
	MOVLW      215
	MOVWF      _offset+1
	MOVLW      163
	MOVWF      _offset+2
	MOVLW      120
	MOVWF      _offset+3
L_error_cor17:
;voltmeter.c,151 :: 		if(temp>=4.95&&temp<=5.99 ) {offset=0.02;}
	MOVLW      102
	MOVWF      R4+0
	MOVLW      102
	MOVWF      R4+1
	MOVLW      30
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_error_cor20
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R4+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R4+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R4+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R4+3
	MOVLW      20
	MOVWF      R0+0
	MOVLW      174
	MOVWF      R0+1
	MOVLW      63
	MOVWF      R0+2
	MOVLW      129
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_error_cor20
L__error_cor52:
	MOVLW      10
	MOVWF      _offset+0
	MOVLW      215
	MOVWF      _offset+1
	MOVLW      35
	MOVWF      _offset+2
	MOVLW      121
	MOVWF      _offset+3
L_error_cor20:
;voltmeter.c,152 :: 		if(temp>=25.95 && temp<=27.99) {offset=-0.02;}
	MOVLW      154
	MOVWF      R4+0
	MOVLW      153
	MOVWF      R4+1
	MOVLW      79
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R0+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R0+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R0+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_error_cor23
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R4+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R4+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R4+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R4+3
	MOVLW      133
	MOVWF      R0+0
	MOVLW      235
	MOVWF      R0+1
	MOVLW      95
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_error_cor23
L__error_cor51:
	MOVLW      10
	MOVWF      _offset+0
	MOVLW      215
	MOVWF      _offset+1
	MOVLW      163
	MOVWF      _offset+2
	MOVLW      121
	MOVWF      _offset+3
L_error_cor23:
;voltmeter.c,153 :: 		if(temp>29.95){offset=-0.01;}
	MOVF       FARG_error_cor_temp+0, 0
	MOVWF      R4+0
	MOVF       FARG_error_cor_temp+1, 0
	MOVWF      R4+1
	MOVF       FARG_error_cor_temp+2, 0
	MOVWF      R4+2
	MOVF       FARG_error_cor_temp+3, 0
	MOVWF      R4+3
	MOVLW      154
	MOVWF      R0+0
	MOVLW      153
	MOVWF      R0+1
	MOVLW      111
	MOVWF      R0+2
	MOVLW      131
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_error_cor24
	MOVLW      10
	MOVWF      _offset+0
	MOVLW      215
	MOVWF      _offset+1
	MOVLW      163
	MOVWF      _offset+2
	MOVLW      120
	MOVWF      _offset+3
L_error_cor24:
;voltmeter.c,154 :: 		}
L_end_error_cor:
	RETURN
; end of _error_cor

_Read_voltage:

;voltmeter.c,156 :: 		void Read_voltage()
;voltmeter.c,158 :: 		uint16_t v_sum=0,avg_adc=0,temp[40];
	MOVLW      0
	MOVWF      Read_voltage_v_sum_L0+0
	MOVLW      0
	MOVWF      Read_voltage_v_sum_L0+1
	CLRF       Read_voltage_vol_L0+0
	CLRF       Read_voltage_vol_L0+1
	CLRF       Read_voltage_vol_L0+2
	CLRF       Read_voltage_vol_L0+3
	CLRF       Read_voltage_i_L0+0
	CLRF       Read_voltage_v_temp_L0+0
	CLRF       Read_voltage_v_temp_L0+1
	CLRF       Read_voltage_v_temp_L0+2
	CLRF       Read_voltage_v_temp_L0+3
	CLRF       Read_voltage_v_temp_L0+4
	CLRF       Read_voltage_v_temp_L0+5
	CLRF       Read_voltage_v_temp_L0+6
;voltmeter.c,162 :: 		for(i=0;i<40;i++){temp[i]=0;}
	CLRF       Read_voltage_i_L0+0
L_Read_voltage25:
	MOVLW      40
	SUBWF      Read_voltage_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Read_voltage26
	MOVF       Read_voltage_i_L0+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      Read_voltage_temp_L0+0
	MOVWF      FSR
	CLRF       INDF+0
	INCF       FSR, 1
	CLRF       INDF+0
	INCF       Read_voltage_i_L0+0, 1
	GOTO       L_Read_voltage25
L_Read_voltage26:
;voltmeter.c,163 :: 		for(i=0;i<40;i++){temp[i]=ADC_Read(11); delay_ms(10);}
	CLRF       Read_voltage_i_L0+0
L_Read_voltage28:
	MOVLW      40
	SUBWF      Read_voltage_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Read_voltage29
	MOVF       Read_voltage_i_L0+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      Read_voltage_temp_L0+0
	MOVWF      FLOC__Read_voltage+0
	MOVLW      11
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       FLOC__Read_voltage+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	MOVF       R0+1, 0
	INCF       FSR, 1
	MOVWF      INDF+0
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Read_voltage31:
	DECFSZ     R13+0, 1
	GOTO       L_Read_voltage31
	DECFSZ     R12+0, 1
	GOTO       L_Read_voltage31
	NOP
	INCF       Read_voltage_i_L0+0, 1
	GOTO       L_Read_voltage28
L_Read_voltage29:
;voltmeter.c,164 :: 		for(i=0;i<40;i++){v_sum+=temp[i];}
	CLRF       Read_voltage_i_L0+0
L_Read_voltage32:
	MOVLW      40
	SUBWF      Read_voltage_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Read_voltage33
	MOVF       Read_voltage_i_L0+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R0+0, 0
	ADDLW      Read_voltage_temp_L0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	ADDWF      Read_voltage_v_sum_L0+0, 1
	INCF       FSR, 1
	MOVF       INDF+0, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      Read_voltage_v_sum_L0+1, 1
	INCF       Read_voltage_i_L0+0, 1
	GOTO       L_Read_voltage32
L_Read_voltage33:
;voltmeter.c,165 :: 		avg_adc=v_sum/40;
	MOVLW      40
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       Read_voltage_v_sum_L0+0, 0
	MOVWF      R0+0
	MOVF       Read_voltage_v_sum_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
;voltmeter.c,166 :: 		vol = ((avg_adc*4.89)/20)*120;//     vol = avg_adc*293;
	CALL       _word2double+0
	MOVLW      225
	MOVWF      R4+0
	MOVLW      122
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      131
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      112
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      Read_voltage_vol_L0+0
	MOVF       R0+1, 0
	MOVWF      Read_voltage_vol_L0+1
	MOVF       R0+2, 0
	MOVWF      Read_voltage_vol_L0+2
	MOVF       R0+3, 0
	MOVWF      Read_voltage_vol_L0+3
;voltmeter.c,167 :: 		vol/=1000;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      Read_voltage_vol_L0+0
	MOVF       R0+1, 0
	MOVWF      Read_voltage_vol_L0+1
	MOVF       R0+2, 0
	MOVWF      Read_voltage_vol_L0+2
	MOVF       R0+3, 0
	MOVWF      Read_voltage_vol_L0+3
;voltmeter.c,168 :: 		error_cor(vol);
	MOVF       R0+0, 0
	MOVWF      FARG_error_cor_temp+0
	MOVF       R0+1, 0
	MOVWF      FARG_error_cor_temp+1
	MOVF       R0+2, 0
	MOVWF      FARG_error_cor_temp+2
	MOVF       R0+3, 0
	MOVWF      FARG_error_cor_temp+3
	CALL       _error_cor+0
;voltmeter.c,169 :: 		vol+=offset;
	MOVF       Read_voltage_vol_L0+0, 0
	MOVWF      R0+0
	MOVF       Read_voltage_vol_L0+1, 0
	MOVWF      R0+1
	MOVF       Read_voltage_vol_L0+2, 0
	MOVWF      R0+2
	MOVF       Read_voltage_vol_L0+3, 0
	MOVWF      R0+3
	MOVF       _offset+0, 0
	MOVWF      R4+0
	MOVF       _offset+1, 0
	MOVWF      R4+1
	MOVF       _offset+2, 0
	MOVWF      R4+2
	MOVF       _offset+3, 0
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      Read_voltage_vol_L0+0
	MOVF       R0+1, 0
	MOVWF      Read_voltage_vol_L0+1
	MOVF       R0+2, 0
	MOVWF      Read_voltage_vol_L0+2
	MOVF       R0+3, 0
	MOVWF      Read_voltage_vol_L0+3
;voltmeter.c,170 :: 		if(vol<0.9){vol=0;}
	MOVLW      102
	MOVWF      R4+0
	MOVLW      102
	MOVWF      R4+1
	MOVLW      102
	MOVWF      R4+2
	MOVLW      126
	MOVWF      R4+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Read_voltage35
	CLRF       Read_voltage_vol_L0+0
	CLRF       Read_voltage_vol_L0+1
	CLRF       Read_voltage_vol_L0+2
	CLRF       Read_voltage_vol_L0+3
L_Read_voltage35:
;voltmeter.c,171 :: 		floatToStr(vol,v_temp);
	MOVF       Read_voltage_vol_L0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       Read_voltage_vol_L0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       Read_voltage_vol_L0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       Read_voltage_vol_L0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      Read_voltage_v_temp_L0+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;voltmeter.c,172 :: 		v_temp[5]='\0';
	CLRF       Read_voltage_v_temp_L0+5
;voltmeter.c,173 :: 		lcd_Out(2,1,v_temp);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      Read_voltage_v_temp_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;voltmeter.c,175 :: 		}
L_end_Read_voltage:
	RETURN
; end of _Read_voltage

_calibrate_vol:

;voltmeter.c,177 :: 		void calibrate_vol()
;voltmeter.c,180 :: 		lcd_out(1,1,"Cal");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_voltmeter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;voltmeter.c,181 :: 		do
L_calibrate_vol36:
;voltmeter.c,183 :: 		lcd_Out(1,6,temp);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      calibrate_vol_temp_L0+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;voltmeter.c,184 :: 		if(!INC){offset+=0.01; while(!INC);}
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_calibrate_vol39
	MOVF       _offset+0, 0
	MOVWF      R0+0
	MOVF       _offset+1, 0
	MOVWF      R0+1
	MOVF       _offset+2, 0
	MOVWF      R0+2
	MOVF       _offset+3, 0
	MOVWF      R0+3
	MOVLW      10
	MOVWF      R4+0
	MOVLW      215
	MOVWF      R4+1
	MOVLW      35
	MOVWF      R4+2
	MOVLW      120
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _offset+0
	MOVF       R0+1, 0
	MOVWF      _offset+1
	MOVF       R0+2, 0
	MOVWF      _offset+2
	MOVF       R0+3, 0
	MOVWF      _offset+3
L_calibrate_vol40:
	BTFSC      RB1_bit+0, BitPos(RB1_bit+0)
	GOTO       L_calibrate_vol41
	GOTO       L_calibrate_vol40
L_calibrate_vol41:
L_calibrate_vol39:
;voltmeter.c,185 :: 		if(!DEC){offset-=0.01; while(!DEC);}
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_calibrate_vol42
	MOVLW      10
	MOVWF      R4+0
	MOVLW      215
	MOVWF      R4+1
	MOVLW      35
	MOVWF      R4+2
	MOVLW      120
	MOVWF      R4+3
	MOVF       _offset+0, 0
	MOVWF      R0+0
	MOVF       _offset+1, 0
	MOVWF      R0+1
	MOVF       _offset+2, 0
	MOVWF      R0+2
	MOVF       _offset+3, 0
	MOVWF      R0+3
	CALL       _Sub_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _offset+0
	MOVF       R0+1, 0
	MOVWF      _offset+1
	MOVF       R0+2, 0
	MOVWF      _offset+2
	MOVF       R0+3, 0
	MOVWF      _offset+3
L_calibrate_vol43:
	BTFSC      RB2_bit+0, BitPos(RB2_bit+0)
	GOTO       L_calibrate_vol44
	GOTO       L_calibrate_vol43
L_calibrate_vol44:
L_calibrate_vol42:
;voltmeter.c,186 :: 		Read_voltage();
	CALL       _Read_voltage+0
;voltmeter.c,187 :: 		}while(ENTER);
	BTFSC      RB3_bit+0, BitPos(RB3_bit+0)
	GOTO       L_calibrate_vol36
;voltmeter.c,190 :: 		}
L_end_calibrate_vol:
	RETURN
; end of _calibrate_vol

_main:

;voltmeter.c,195 :: 		void main()
;voltmeter.c,197 :: 		uint32_t v_sum=0,offset=0;
;voltmeter.c,199 :: 		init_uc();
	CALL       _init_uc+0
;voltmeter.c,200 :: 		while(1)
L_main45:
;voltmeter.c,202 :: 		if(CAL==0) {while(CAL==0); calibrate_vol(); lcd_out(1,1,"ADC=");}
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main47
L_main48:
	BTFSC      RB0_bit+0, BitPos(RB0_bit+0)
	GOTO       L_main49
	GOTO       L_main48
L_main49:
	CALL       _calibrate_vol+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_voltmeter+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
L_main47:
;voltmeter.c,203 :: 		Read_voltage();
	CALL       _Read_voltage+0
;voltmeter.c,204 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main50:
	DECFSZ     R13+0, 1
	GOTO       L_main50
	DECFSZ     R12+0, 1
	GOTO       L_main50
	DECFSZ     R11+0, 1
	GOTO       L_main50
	NOP
;voltmeter.c,205 :: 		}
	GOTO       L_main45
;voltmeter.c,206 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
