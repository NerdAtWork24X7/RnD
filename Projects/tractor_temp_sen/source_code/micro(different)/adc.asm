
_ADC_Initialize:

;adc.c,6 :: 		void ADC_Initialize(void)
;adc.c,8 :: 		ADCON0 = 0x08;                      /*GO_nDONE stop; ADON enabled; CHS AN2; */
	MOVLW      8
	MOVWF      ADCON0+0
;adc.c,9 :: 		ADCON1 = 0xC0;                      /*ADFM Right; ADPREF VDD; ADCS FOSC/4; */
	MOVLW      192
	MOVWF      ADCON1+0
;adc.c,10 :: 		ADCON2 = 0x00;                      /* TRIGSEL no_auto_trigger */
	CLRF       ADCON2+0
;adc.c,11 :: 		ADRESL = 0x00;                      /* ADRESL 0*/
	CLRF       ADRESL+0
;adc.c,12 :: 		ADRESH = 0x00;                      /* ADRESH 0*/
	CLRF       ADRESH+0
;adc.c,13 :: 		ADIE_bit = 1;                       /* Enabling ADC interrupt. */
	BSF        ADIE_bit+0, BitPos(ADIE_bit+0)
;adc.c,14 :: 		}
L_end_ADC_Initialize:
	RETURN
; end of _ADC_Initialize

_ADC_GetConversion:

;adc.c,16 :: 		uint32 ADC_GetConversion()
;adc.c,18 :: 		ADCON0 = 0x08;                     /* select the A/D channel2 */
	MOVLW      8
	MOVWF      ADCON0+0
;adc.c,19 :: 		ADON_bit = 1;                      /*Turn on the ADC module*/
	BSF        ADON_bit+0, BitPos(ADON_bit+0)
;adc.c,20 :: 		delay_us(50);                      /*Acquisition time delay */
	MOVLW      33
	MOVWF      R13
L_ADC_GetConversion0:
	DECFSZ     R13, 1
	GOTO       L_ADC_GetConversion0
;adc.c,21 :: 		GO_NOT_DONE_bit = 1;               /*Start the conversion*/
	BSF        GO_NOT_DONE_bit+0, BitPos(GO_NOT_DONE_bit+0)
;adc.c,22 :: 		while (GO_NOT_DONE_bit);           /*Wait for the conversion to finish*/
L_ADC_GetConversion1:
	BTFSS      GO_NOT_DONE_bit+0, BitPos(GO_NOT_DONE_bit+0)
	GOTO       L_ADC_GetConversion2
	GOTO       L_ADC_GetConversion1
L_ADC_GetConversion2:
;adc.c,23 :: 		return ((ADRESH << 8) + ADRESL);   /*Conversion finished, return the result*/
	MOVF       ADRESH+0, 0
	MOVWF      R1
	CLRF       R0
	MOVF       ADRESL+0, 0
	ADDWF      R0, 1
	MOVLW      0
	ADDWFC     R1, 1
	MOVLW      0
	MOVWF      R2
	MOVWF      R3
;adc.c,25 :: 		}
L_end_ADC_GetConversion:
	RETURN
; end of _ADC_GetConversion

_ADC_ISR:

;adc.c,27 :: 		void ADC_ISR(void)
;adc.c,29 :: 		ADIF_bit = 0;                     /*Clear the ADC interrupt flag*/
	BCF        ADIF_bit+0, BitPos(ADIF_bit+0)
;adc.c,30 :: 		}
L_end_ADC_ISR:
	RETURN
; end of _ADC_ISR

_check_adc:

;adc.c,32 :: 		void check_adc()
;adc.c,35 :: 		uint32 res = 0;
	CLRF       check_adc_res_L0+0
	CLRF       check_adc_res_L0+1
	CLRF       check_adc_res_L0+2
	CLRF       check_adc_res_L0+3
;adc.c,36 :: 		if(wt_flag == 1)                   /*wait time flag*/
	MOVF       _wt_flag+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_check_adc3
;adc.c,38 :: 		res = 0;
	CLRF       check_adc_res_L0+0
	CLRF       check_adc_res_L0+1
	CLRF       check_adc_res_L0+2
	CLRF       check_adc_res_L0+3
;adc.c,39 :: 		for(i=0;i<50;i++)
	CLRF       check_adc_i_L0+0
L_check_adc4:
	MOVLW      50
	SUBWF      check_adc_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_check_adc5
;adc.c,41 :: 		res+=ADC_GetConversion();     /*Take 50 sample from adc conversion*/
	CALL       _ADC_GetConversion+0
	MOVF       R0, 0
	ADDWF      check_adc_res_L0+0, 1
	MOVF       R1, 0
	ADDWFC     check_adc_res_L0+1, 1
	MOVF       R2, 0
	ADDWFC     check_adc_res_L0+2, 1
	MOVF       R3, 0
	ADDWFC     check_adc_res_L0+3, 1
;adc.c,39 :: 		for(i=0;i<50;i++)
	INCF       check_adc_i_L0+0, 1
;adc.c,42 :: 		}
	GOTO       L_check_adc4
L_check_adc5:
;adc.c,43 :: 		res/=50;                        /*Take average of ADC conversion*/
	MOVLW      50
	MOVWF      R4
	CLRF       R5
	CLRF       R6
	CLRF       R7
	MOVF       check_adc_res_L0+0, 0
	MOVWF      R0
	MOVF       check_adc_res_L0+1, 0
	MOVWF      R1
	MOVF       check_adc_res_L0+2, 0
	MOVWF      R2
	MOVF       check_adc_res_L0+3, 0
	MOVWF      R3
	CALL       _Div_32x32_U+0
	MOVF       R0, 0
	MOVWF      check_adc_res_L0+0
	MOVF       R1, 0
	MOVWF      check_adc_res_L0+1
	MOVF       R2, 0
	MOVWF      check_adc_res_L0+2
	MOVF       R3, 0
	MOVWF      check_adc_res_L0+3
;adc.c,44 :: 		if(res > THRESHOLD_VAL)
	MOVF       R3, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__check_adc14
	MOVF       R2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__check_adc14
	MOVF       R1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__check_adc14
	MOVF       R0, 0
	SUBLW      122
L__check_adc14:
	BTFSC      STATUS+0, 0
	GOTO       L_check_adc7
;adc.c,46 :: 		LED = 0;
	BCF        PORTC+0, 4
;adc.c,47 :: 		guc_buzz_state = 1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;adc.c,48 :: 		}
	GOTO       L_check_adc8
L_check_adc7:
;adc.c,51 :: 		LED = 1;
	BSF        PORTC+0, 4
;adc.c,52 :: 		guc_buzz_state = 0;
	CLRF       _guc_buzz_state+0
;adc.c,53 :: 		}
L_check_adc8:
;adc.c,54 :: 		}
	GOTO       L_check_adc9
L_check_adc3:
;adc.c,57 :: 		ADON_bit = 0;                   /*Turn off the ADC module*/
	BCF        ADON_bit+0, BitPos(ADON_bit+0)
;adc.c,58 :: 		LED = 1;
	BSF        PORTC+0, 4
;adc.c,59 :: 		guc_buzz_state = 0;
	CLRF       _guc_buzz_state+0
;adc.c,60 :: 		}
L_check_adc9:
;adc.c,61 :: 		}
L_end_check_adc:
	RETURN
; end of _check_adc
