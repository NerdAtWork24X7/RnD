
_cpu_init:

;Voltmeter.c,13 :: 		void cpu_init()
;Voltmeter.c,15 :: 		TRISA=0x04;
	MOVLW      4
	MOVWF      TRISA+0
;Voltmeter.c,16 :: 		ANSELA  = 0x04;              // Configure AN2 pin as analog
	MOVLW      4
	MOVWF      ANSELA+0
;Voltmeter.c,17 :: 		ANSELB = 0x00;                 // Configure other AN pins as digital I/O
	CLRF       ANSELB+0
;Voltmeter.c,18 :: 		C1ON_bit = 0;               // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;Voltmeter.c,19 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;Voltmeter.c,21 :: 		TRISB=0x00;
	CLRF       TRISB+0
;Voltmeter.c,22 :: 		TRISC=0x00;
	CLRF       TRISC+0
;Voltmeter.c,23 :: 		WPUB=0xff;
	MOVLW      255
	MOVWF      WPUB+0
;Voltmeter.c,24 :: 		init_lcd();
	CALL       _init_lcd+0
;Voltmeter.c,25 :: 		ADC_Init();
	CALL       _ADC_Init+0
;Voltmeter.c,26 :: 		}
L_end_cpu_init:
	RETURN
; end of _cpu_init

_main:

;Voltmeter.c,28 :: 		void main()
;Voltmeter.c,30 :: 		uint8_t cnt=0;
	CLRF       main_cnt_L0+0
;Voltmeter.c,31 :: 		cpu_init();
	CALL       _cpu_init+0
;Voltmeter.c,33 :: 		while(1)
L_main0:
;Voltmeter.c,36 :: 		sum_adc=0;
	CLRF       _sum_adc+0
	CLRF       _sum_adc+1
	CLRF       _sum_adc+2
	CLRF       _sum_adc+3
;Voltmeter.c,37 :: 		for(cnt=0;cnt<15;cnt++){ temp[cnt]=0; }
	CLRF       main_cnt_L0+0
L_main2:
	MOVLW      15
	SUBWF      main_cnt_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main3
	MOVLW      _temp+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_temp+0)
	MOVWF      FSR1H
	MOVF       main_cnt_L0+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
	INCF       main_cnt_L0+0, 1
	GOTO       L_main2
L_main3:
;Voltmeter.c,38 :: 		for(cnt=0;cnt<150;cnt++){ adc_dat[cnt]=0; }
	CLRF       main_cnt_L0+0
L_main5:
	MOVLW      150
	SUBWF      main_cnt_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main6
	MOVLW      _adc_dat+0
	MOVWF      R3
	MOVLW      hi_addr(_adc_dat+0)
	MOVWF      R4
	MOVF       main_cnt_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      R3, 0
	MOVWF      FSR1L
	MOVF       R1, 0
	ADDWFC     R4, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	INCF       main_cnt_L0+0, 1
	GOTO       L_main5
L_main6:
;Voltmeter.c,39 :: 		for(cnt=0;cnt<150;cnt++){ adc_dat[cnt]=ADC_Read(2); adc_dat[cnt]&=0x0fff;}
	CLRF       main_cnt_L0+0
L_main8:
	MOVLW      150
	SUBWF      main_cnt_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main9
	MOVLW      _adc_dat+0
	MOVWF      FLOC__main+2
	MOVLW      hi_addr(_adc_dat+0)
	MOVWF      FLOC__main+3
	MOVF       main_cnt_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      FLOC__main+2, 0
	MOVWF      FLOC__main+0
	MOVF       R1, 0
	ADDWFC     FLOC__main+3, 0
	MOVWF      FLOC__main+1
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       FLOC__main+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__main+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	MOVF       main_cnt_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      FLOC__main+2, 0
	MOVWF      R2
	MOVF       R1, 0
	ADDWFC     FLOC__main+3, 0
	MOVWF      R3
	MOVF       R2, 0
	MOVWF      FSR0L
	MOVF       R3, 0
	MOVWF      FSR0H
	MOVLW      255
	ANDWF      INDF0+0, 0
	MOVWF      R0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ANDLW      15
	MOVWF      R1
	MOVF       R2, 0
	MOVWF      FSR1L
	MOVF       R3, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
	INCF       main_cnt_L0+0, 1
	GOTO       L_main8
L_main9:
;Voltmeter.c,40 :: 		for(cnt=0;cnt<150;cnt++){ sum_adc+=adc_dat[cnt]; }
	CLRF       main_cnt_L0+0
L_main11:
	MOVLW      150
	SUBWF      main_cnt_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main12
	MOVLW      _adc_dat+0
	MOVWF      R3
	MOVLW      hi_addr(_adc_dat+0)
	MOVWF      R4
	MOVF       main_cnt_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      R3, 0
	MOVWF      FSR0L
	MOVF       R1, 0
	ADDWFC     R4, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	ADDWF      _sum_adc+0, 1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	ADDWFC     _sum_adc+1, 1
	MOVLW      0
	ADDWFC     _sum_adc+2, 1
	ADDWFC     _sum_adc+3, 1
	INCF       main_cnt_L0+0, 1
	GOTO       L_main11
L_main12:
;Voltmeter.c,41 :: 		avg_adc=sum_adc/150;
	MOVLW      150
	MOVWF      R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       _sum_adc+0, 0
	MOVWF      R0
	MOVF       _sum_adc+1, 0
	MOVWF      R1
	MOVF       _sum_adc+2, 0
	MOVWF      R2
	MOVF       _sum_adc+3, 0
	MOVWF      R3
	CALL       _Div_32x32_U+0
	MOVF       R0, 0
	MOVWF      _avg_adc+0
	MOVF       R1, 0
	MOVWF      _avg_adc+1
;Voltmeter.c,43 :: 		volt_value=(avg_adc*0.00732422);
	CALL       _Word2Double+0
	MOVLW      3
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      112
	MOVWF      R6
	MOVLW      119
	MOVWF      R7
	CALL       _Mul_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _volt_value+0
	MOVF       R1, 0
	MOVWF      _volt_value+1
	MOVF       R2, 0
	MOVWF      _volt_value+2
	MOVF       R3, 0
	MOVWF      _volt_value+3
;Voltmeter.c,44 :: 		volt_value-=OFFSET;
	MOVLW      154
	MOVWF      R4
	MOVLW      153
	MOVWF      R5
	MOVLW      25
	MOVWF      R6
	MOVLW      126
	MOVWF      R7
	CALL       _Sub_32x32_FP+0
	MOVF       R0, 0
	MOVWF      _volt_value+0
	MOVF       R1, 0
	MOVWF      _volt_value+1
	MOVF       R2, 0
	MOVWF      _volt_value+2
	MOVF       R3, 0
	MOVWF      _volt_value+3
;Voltmeter.c,45 :: 		if(volt_value<1) volt_value=0;
	MOVLW      0
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVLW      0
	MOVWF      R6
	MOVLW      127
	MOVWF      R7
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	CLRF       _volt_value+0
	CLRF       _volt_value+1
	CLRF       _volt_value+2
	CLRF       _volt_value+3
L_main14:
;Voltmeter.c,46 :: 		whole_no=volt_value;
	MOVF       _volt_value+0, 0
	MOVWF      R0
	MOVF       _volt_value+1, 0
	MOVWF      R1
	MOVF       _volt_value+2, 0
	MOVWF      R2
	MOVF       _volt_value+3, 0
	MOVWF      R3
	CALL       _Double2Byte+0
	MOVF       R0, 0
	MOVWF      _whole_no+0
;Voltmeter.c,47 :: 		floatToStr(volt_value,temp);
	MOVF       _volt_value+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _volt_value+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _volt_value+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _volt_value+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _temp+0
	MOVWF      FARG_FloatToStr_str+0
	MOVLW      hi_addr(_temp+0)
	MOVWF      FARG_FloatToStr_str+1
	CALL       _FloatToStr+0
;Voltmeter.c,48 :: 		if(whole_no&(0x0f) < 10) temp[4]='\0';
	MOVLW      0
	ANDWF      _whole_no+0, 0
	MOVWF      R0
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	CLRF       _temp+4
	GOTO       L_main16
L_main15:
;Voltmeter.c,49 :: 		else temp[5]='\0';
	CLRF       _temp+5
L_main16:
;Voltmeter.c,50 :: 		Lcd_Out(2,2,temp);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _temp+0
	MOVWF      FARG_Lcd_Out_text+0
	MOVLW      hi_addr(_temp+0)
	MOVWF      FARG_Lcd_Out_text+1
	CALL       _Lcd_Out+0
;Voltmeter.c,60 :: 		}
	GOTO       L_main0
;Voltmeter.c,64 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
