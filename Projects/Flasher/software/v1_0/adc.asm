
_ADC_Initialize:

;adc.c,8 :: 		void ADC_Initialize(void)
;adc.c,11 :: 		ADCON0 = 0x0B; // GO_nDONE start; ADON enabled; CHS AN2;
	MOVLW      11
	MOVWF      ADCON0+0
;adc.c,12 :: 		ADCON1 = 0x80; // ADFM Right; ADPREF VDD; ADCS FOSC/2;
	MOVLW      128
	MOVWF      ADCON1+0
;adc.c,13 :: 		ADRESL = 0x00;  // ADRESL 0;
	CLRF       ADRESL+0
;adc.c,14 :: 		ADRESH = 0x00;  // ADRESH 0;
	CLRF       ADRESH+0
;adc.c,16 :: 		}
L_end_ADC_Initialize:
	RETURN
; end of _ADC_Initialize

_ADC_GetConversion:

;adc.c,18 :: 		uint16 ADC_GetConversion(uint8 channel)
;adc.c,20 :: 		CHS0_bit = channel;  // select the A/D channel
	BTFSC      FARG_ADC_GetConversion_channel+0, 0
	GOTO       L__ADC_GetConversion5
	BCF        CHS0_bit+0, BitPos(CHS0_bit+0)
	GOTO       L__ADC_GetConversion6
L__ADC_GetConversion5:
	BSF        CHS0_bit+0, BitPos(CHS0_bit+0)
L__ADC_GetConversion6:
;adc.c,21 :: 		CHS1_bit = channel>>1;  // select the A/D channel
	MOVF       FARG_ADC_GetConversion_channel+0, 0
	MOVWF      R0
	LSRF       R0, 1
	BTFSC      R0, 0
	GOTO       L__ADC_GetConversion7
	BCF        CHS1_bit+0, BitPos(CHS1_bit+0)
	GOTO       L__ADC_GetConversion8
L__ADC_GetConversion7:
	BSF        CHS1_bit+0, BitPos(CHS1_bit+0)
L__ADC_GetConversion8:
;adc.c,22 :: 		ADON_bit = 1;             // Turn on the ADC module
	BSF        ADON_bit+0, BitPos(ADON_bit+0)
;adc.c,23 :: 		Delay_us(ACQ_US_DELAY) ;  // Acquisition time delay
	MOVLW      6
	MOVWF      R13
L_ADC_GetConversion0:
	DECFSZ     R13, 1
	GOTO       L_ADC_GetConversion0
	NOP
;adc.c,24 :: 		GO_NOT_DONE_bit = 1;      // Start the conversion
	BSF        GO_NOT_DONE_bit+0, BitPos(GO_NOT_DONE_bit+0)
;adc.c,25 :: 		while (GO_NOT_DONE_bit) asm CLRWDT ; // Wait for the conversion to finish
L_ADC_GetConversion1:
	BTFSS      GO_NOT_DONE_bit+0, BitPos(GO_NOT_DONE_bit+0)
	GOTO       L_ADC_GetConversion2
	CLRWDT
	GOTO       L_ADC_GetConversion1
L_ADC_GetConversion2:
;adc.c,26 :: 		return ((uint16)((ADRESH << 8) + ADRESL));  // Conversion finished, return the result
	MOVF       ADRESH+0, 0
	MOVWF      R1
	CLRF       R0
	MOVF       ADRESL+0, 0
	ADDWF      R0, 1
	MOVLW      0
	ADDWFC     R1, 1
;adc.c,27 :: 		}
L_end_ADC_GetConversion:
	RETURN
; end of _ADC_GetConversion
