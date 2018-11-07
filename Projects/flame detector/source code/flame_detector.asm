
_Stop:

;flame_detector.c,19 :: 		void Stop()
;flame_detector.c,21 :: 		LM1=0;LM2=0;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;flame_detector.c,22 :: 		RM1=0;RM2=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;flame_detector.c,23 :: 		}
L_end_Stop:
	RETURN
; end of _Stop

_Rotate:

;flame_detector.c,24 :: 		void Rotate()
;flame_detector.c,27 :: 		LM1=0;LM2=1;
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
;flame_detector.c,28 :: 		RM1=1;RM2=0;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;flame_detector.c,29 :: 		}
L_end_Rotate:
	RETURN
; end of _Rotate

_Forward:

;flame_detector.c,31 :: 		void Forward()
;flame_detector.c,33 :: 		LED=0;
	BCF        RA4_bit+0, BitPos(RA4_bit+0)
;flame_detector.c,34 :: 		BUZZER=1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;flame_detector.c,35 :: 		LM1=1;LM2=0;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;flame_detector.c,36 :: 		RM1=1;RM2=0;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
;flame_detector.c,37 :: 		delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Forward0:
	DECFSZ     R13+0, 1
	GOTO       L_Forward0
	DECFSZ     R12+0, 1
	GOTO       L_Forward0
	DECFSZ     R11+0, 1
	GOTO       L_Forward0
	NOP
;flame_detector.c,38 :: 		BUZZER=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;flame_detector.c,39 :: 		LED=1;
	BSF        RA4_bit+0, BitPos(RA4_bit+0)
;flame_detector.c,41 :: 		}
L_end_Forward:
	RETURN
; end of _Forward

_main:

;flame_detector.c,42 :: 		void main()
;flame_detector.c,46 :: 		TRISA  = 0x01;              // RA0 is ANI and RA4 is LED out
	MOVLW      1
	MOVWF      TRISA+0
;flame_detector.c,47 :: 		TRISC=0x00;                 //PORTC is output
	CLRF       TRISC+0
;flame_detector.c,48 :: 		ANSEL  = 0x01;              // Configure AN0 pin as analog
	MOVLW      1
	MOVWF      ANSEL+0
;flame_detector.c,49 :: 		CMCON=0;
	CLRF       CMCON+0
;flame_detector.c,50 :: 		BUZZER=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
;flame_detector.c,51 :: 		while(1)
L_main1:
;flame_detector.c,54 :: 		adc_value = ADC_Read(0);   // Get 10-bit results of AD conversion
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_value+0
	MOVF       R0+1, 0
	MOVWF      _adc_value+1
;flame_detector.c,56 :: 		if(adc_value>CLOSE && adc_value<FAR)
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main26
	MOVF       R0+0, 0
	SUBLW      200
L__main26:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
	MOVLW      3
	SUBWF      _adc_value+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main27
	MOVLW      182
	SUBWF      _adc_value+0, 0
L__main27:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
L__main21:
;flame_detector.c,58 :: 		RELAY=0; Forward();  Rotate();delay_ms(5);
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	CALL       _Forward+0
	CALL       _Rotate+0
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
;flame_detector.c,59 :: 		}
	GOTO       L_main7
L_main5:
;flame_detector.c,61 :: 		else if(adc_value<CLOSE)
	MOVLW      0
	SUBWF      _adc_value+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main28
	MOVLW      200
	SUBWF      _adc_value+0, 0
L__main28:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;flame_detector.c,63 :: 		Stop(); RELAY=1; delay_ms(5000);
	CALL       _Stop+0
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;flame_detector.c,64 :: 		for(i=0;i<20;i++){BUZZER=1; LED=1; delay_ms(1000); BUZZER=0; LED=0; delay_ms(500);}
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main10:
	MOVLW      0
	SUBWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main29
	MOVLW      20
	SUBWF      main_i_L0+0, 0
L__main29:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
	BSF        RA4_bit+0, BitPos(RA4_bit+0)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
	NOP
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BCF        RA4_bit+0, BitPos(RA4_bit+0)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	DECFSZ     R11+0, 1
	GOTO       L_main14
	NOP
	NOP
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
	GOTO       L_main10
L_main11:
;flame_detector.c,65 :: 		for(i=0;i<1024;i++){LED=1; delay_ms(1000); LED=0; delay_ms(500);}
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main15:
	MOVLW      4
	SUBWF      main_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main30
	MOVLW      0
	SUBWF      main_i_L0+0, 0
L__main30:
	BTFSC      STATUS+0, 0
	GOTO       L_main16
	BSF        RA4_bit+0, BitPos(RA4_bit+0)
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
	BCF        RA4_bit+0, BitPos(RA4_bit+0)
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
	GOTO       L_main15
L_main16:
;flame_detector.c,66 :: 		}
	GOTO       L_main20
L_main8:
;flame_detector.c,70 :: 		RELAY=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;flame_detector.c,71 :: 		Rotate();
	CALL       _Rotate+0
;flame_detector.c,72 :: 		}
L_main20:
L_main7:
;flame_detector.c,73 :: 		}
	GOTO       L_main1
;flame_detector.c,74 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
