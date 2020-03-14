
_TMR0_Initialize:

;tmr0.c,19 :: 		void TMR0_Initialize(void)
;tmr0.c,21 :: 		OPTION_REG = (uint8)((OPTION_REG & 0xC0) | (0xD7 & 0x3F));
	MOVLW      192
	ANDWF      OPTION_REG+0, 0
	MOVWF      R0
	MOVLW      23
	IORWF       R0, 0
	MOVWF      OPTION_REG+0
;tmr0.c,22 :: 		TMR0 = TMR0_RELOAD_VALUE;  /* TMR0 248;*/
	MOVLW      100
	MOVWF      TMR0+0
;tmr0.c,23 :: 		TMR0IF_bit = 0;        /*Clear Interrupt flag before enabling the interrupt*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,24 :: 		TMR0IE_bit = 1;        /* Enabling TMR0 interrupt */
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;tmr0.c,25 :: 		}
L_end_TMR0_Initialize:
	RETURN
; end of _TMR0_Initialize

_Check_ADC:

;tmr0.c,27 :: 		void Check_ADC()
;tmr0.c,29 :: 		uint8 i=0;
	CLRF       Check_ADC_i_L0+0
;tmr0.c,31 :: 		if(WARN_IND == 0)
	BTFSC      PORTA+0, 0
	GOTO       L_Check_ADC0
;tmr0.c,33 :: 		u16_warn_ind_adc[s8_100ms] =  ADC_GetConversion(ADC_CH_SHUNT);
	MOVF       _s8_100ms+0, 0
	MOVWF      R0
	MOVLW      0
	BTFSC      R0, 7
	MOVLW      255
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _u16_warn_ind_adc+0
	ADDWF      R0, 0
	MOVWF      FLOC__Check_ADC+0
	MOVLW      hi_addr(_u16_warn_ind_adc+0)
	ADDWFC     R1, 0
	MOVWF      FLOC__Check_ADC+1
	MOVLW      3
	MOVWF      FARG_ADC_GetConversion_channel+0
	CALL       _ADC_GetConversion+0
	MOVF       FLOC__Check_ADC+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__Check_ADC+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;tmr0.c,34 :: 		u16_power_adc[s8_100ms] =  ADC_GetConversion(ADC_CH_POWER);
	MOVF       _s8_100ms+0, 0
	MOVWF      R0
	MOVLW      0
	BTFSC      R0, 7
	MOVLW      255
	MOVWF      R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _u16_power_adc+0
	ADDWF      R0, 0
	MOVWF      FLOC__Check_ADC+0
	MOVLW      hi_addr(_u16_power_adc+0)
	ADDWFC     R1, 0
	MOVWF      FLOC__Check_ADC+1
	MOVLW      2
	MOVWF      FARG_ADC_GetConversion_channel+0
	CALL       _ADC_GetConversion+0
	MOVF       FLOC__Check_ADC+0, 0
	MOVWF      FSR1L
	MOVF       FLOC__Check_ADC+1, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;tmr0.c,36 :: 		if(s8_100ms >= 9)
	MOVLW      128
	XORWF      _s8_100ms+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      9
	SUBWF      R0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Check_ADC1
;tmr0.c,39 :: 		u16_avg_warn_ind_adc = 0;
	CLRF       _u16_avg_warn_ind_adc+0
	CLRF       _u16_avg_warn_ind_adc+1
;tmr0.c,40 :: 		u16_avg_power_adc = 0;
	CLRF       _u16_avg_power_adc+0
	CLRF       _u16_avg_power_adc+1
;tmr0.c,41 :: 		for(i=0;i<10;i++)
	CLRF       Check_ADC_i_L0+0
L_Check_ADC2:
	MOVLW      10
	SUBWF      Check_ADC_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_ADC3
;tmr0.c,43 :: 		u16_avg_warn_ind_adc += u16_warn_ind_adc[i];
	MOVF       Check_ADC_i_L0+0, 0
	MOVWF      R2
	CLRF       R3
	LSLF       R2, 1
	RLF        R3, 1
	MOVLW      _u16_warn_ind_adc+0
	ADDWF      R2, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_u16_warn_ind_adc+0)
	ADDWFC     R3, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVF       R0, 0
	ADDWF      _u16_avg_warn_ind_adc+0, 1
	MOVF       R1, 0
	ADDWFC     _u16_avg_warn_ind_adc+1, 1
;tmr0.c,44 :: 		u16_avg_power_adc += u16_power_adc[i];
	MOVLW      _u16_power_adc+0
	ADDWF      R2, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_u16_power_adc+0)
	ADDWFC     R3, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVF       R0, 0
	ADDWF      _u16_avg_power_adc+0, 1
	MOVF       R1, 0
	ADDWFC     _u16_avg_power_adc+1, 1
;tmr0.c,41 :: 		for(i=0;i<10;i++)
	INCF       Check_ADC_i_L0+0, 1
;tmr0.c,45 :: 		}
	GOTO       L_Check_ADC2
L_Check_ADC3:
;tmr0.c,46 :: 		u16_avg_warn_ind_adc/=10;
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       _u16_avg_warn_ind_adc+0, 0
	MOVWF      R0
	MOVF       _u16_avg_warn_ind_adc+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R0, 0
	MOVWF      _u16_avg_warn_ind_adc+0
	MOVF       R1, 0
	MOVWF      _u16_avg_warn_ind_adc+1
;tmr0.c,47 :: 		u16_avg_power_adc/=10;
	MOVLW      10
	MOVWF      R4
	MOVLW      0
	MOVWF      R5
	MOVF       _u16_avg_power_adc+0, 0
	MOVWF      R0
	MOVF       _u16_avg_power_adc+1, 0
	MOVWF      R1
	CALL       _Div_16X16_U+0
	MOVF       R0, 0
	MOVWF      _u16_avg_power_adc+0
	MOVF       R1, 0
	MOVWF      _u16_avg_power_adc+1
;tmr0.c,48 :: 		u8_avg_warn_ind_voltage = (50 * u16_avg_warn_ind_adc)/1023;
	MOVLW      50
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       _u16_avg_warn_ind_adc+0, 0
	MOVWF      R4
	MOVF       _u16_avg_warn_ind_adc+1, 0
	MOVWF      R5
	CALL       _Mul_16X16_U+0
	MOVLW      255
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16X16_U+0
	MOVF       R0, 0
	MOVWF      _u8_avg_warn_ind_voltage+0
;tmr0.c,49 :: 		u8_avg_power_voltage = (50 * u16_avg_power_adc)/1023;
	MOVLW      50
	MOVWF      R0
	MOVLW      0
	MOVWF      R1
	MOVF       _u16_avg_power_adc+0, 0
	MOVWF      R4
	MOVF       _u16_avg_power_adc+1, 0
	MOVWF      R5
	CALL       _Mul_16X16_U+0
	MOVLW      255
	MOVWF      R4
	MOVLW      3
	MOVWF      R5
	CALL       _Div_16X16_U+0
	MOVF       R0, 0
	MOVWF      _u8_avg_power_voltage+0
;tmr0.c,50 :: 		s8_Load_diff_voltage = (sint8)u8_avg_power_voltage - (sint8)u8_avg_warn_ind_voltage;
	MOVF       _u8_avg_power_voltage+0, 0
	MOVWF      R1
	MOVF       _u8_avg_warn_ind_voltage+0, 0
	MOVWF      R0
	MOVF       R0, 0
	SUBWF      R1, 0
	MOVWF      _s8_Load_diff_voltage+0
;tmr0.c,52 :: 		if(s8_Load_diff_voltage > -4 && s8_Load_diff_voltage <= 2) switch_choice=1;
	MOVLW      128
	XORLW      252
	MOVWF      R0
	MOVLW      128
	XORWF      _s8_Load_diff_voltage+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_ADC7
	MOVLW      128
	XORLW      2
	MOVWF      R0
	MOVLW      128
	XORWF      _s8_Load_diff_voltage+0, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Check_ADC7
L__Check_ADC46:
	MOVLW      1
	MOVWF      _switch_choice+0
	GOTO       L_Check_ADC8
L_Check_ADC7:
;tmr0.c,53 :: 		else if(s8_Load_diff_voltage > 2 && s8_Load_diff_voltage <=7) switch_choice=2; /* 21W Load */
	MOVLW      128
	XORLW      2
	MOVWF      R0
	MOVLW      128
	XORWF      _s8_Load_diff_voltage+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_ADC11
	MOVLW      128
	XORLW      7
	MOVWF      R0
	MOVLW      128
	XORWF      _s8_Load_diff_voltage+0, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Check_ADC11
L__Check_ADC45:
	MOVLW      2
	MOVWF      _switch_choice+0
	GOTO       L_Check_ADC12
L_Check_ADC11:
;tmr0.c,54 :: 		else if(s8_Load_diff_voltage > 7 && s8_Load_diff_voltage <=12) switch_choice=3; /* 42W Load */
	MOVLW      128
	XORLW      7
	MOVWF      R0
	MOVLW      128
	XORWF      _s8_Load_diff_voltage+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_ADC15
	MOVLW      128
	XORLW      12
	MOVWF      R0
	MOVLW      128
	XORWF      _s8_Load_diff_voltage+0, 0
	SUBWF      R0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Check_ADC15
L__Check_ADC44:
	MOVLW      3
	MOVWF      _switch_choice+0
	GOTO       L_Check_ADC16
L_Check_ADC15:
;tmr0.c,55 :: 		else if(s8_Load_diff_voltage > 12) switch_choice=4; /* 84W,105W,126W,147W,168W Load */
	MOVLW      128
	XORLW      12
	MOVWF      R0
	MOVLW      128
	XORWF      _s8_Load_diff_voltage+0, 0
	SUBWF      R0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Check_ADC17
	MOVLW      4
	MOVWF      _switch_choice+0
	GOTO       L_Check_ADC18
L_Check_ADC17:
;tmr0.c,56 :: 		else  switch_choice=5;
	MOVLW      5
	MOVWF      _switch_choice+0
L_Check_ADC18:
L_Check_ADC16:
L_Check_ADC12:
L_Check_ADC8:
;tmr0.c,57 :: 		s8_100ms = -1;
	MOVLW      255
	MOVWF      _s8_100ms+0
;tmr0.c,58 :: 		}
L_Check_ADC1:
;tmr0.c,59 :: 		s8_100ms++;
	INCF       _s8_100ms+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _s8_100ms+0
;tmr0.c,60 :: 		}
L_Check_ADC0:
;tmr0.c,61 :: 		}
L_end_Check_ADC:
	RETURN
; end of _Check_ADC

_Execute_Flash:

;tmr0.c,63 :: 		void Execute_Flash()
;tmr0.c,65 :: 		switch(switch_choice)
	GOTO       L_Execute_Flash19
;tmr0.c,67 :: 		case 1: (WARN_IND == 0)?(WARN_IND = 1):(WARN_IND = 0);
L_Execute_Flash21:
	BTFSC      PORTA+0, 0
	GOTO       L_Execute_Flash22
	BSF        PORTA+0, 0
	GOTO       L_Execute_Flash23
L_Execute_Flash22:
	BCF        PORTA+0, 0
L_Execute_Flash23:
;tmr0.c,68 :: 		TRAIL_1 = 0; TRAIL_2 = 0;break;
	BCF        PORTA+0, 1
	BCF        PORTA+0, 5
	GOTO       L_Execute_Flash20
;tmr0.c,70 :: 		case 2: if(u8_FlashRate > 1)
L_Execute_Flash24:
	MOVF       _u8_FlashRate+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_Execute_Flash25
;tmr0.c,72 :: 		(WARN_IND == 0)? (WARN_IND = 1):(WARN_IND = 0);
	BTFSC      PORTA+0, 0
	GOTO       L_Execute_Flash26
	BSF        PORTA+0, 0
	GOTO       L_Execute_Flash27
L_Execute_Flash26:
	BCF        PORTA+0, 0
L_Execute_Flash27:
;tmr0.c,73 :: 		TRAIL_1 = 0; TRAIL_2 = 0;
	BCF        PORTA+0, 1
	BCF        PORTA+0, 5
;tmr0.c,74 :: 		u8_FlashRate = 0 ;
	CLRF       _u8_FlashRate+0
;tmr0.c,75 :: 		}
L_Execute_Flash25:
;tmr0.c,76 :: 		u8_FlashRate++;
	INCF       _u8_FlashRate+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _u8_FlashRate+0
;tmr0.c,77 :: 		break;
	GOTO       L_Execute_Flash20
;tmr0.c,78 :: 		case 3: if(u8_FlashRate > 1)
L_Execute_Flash28:
	MOVF       _u8_FlashRate+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_Execute_Flash29
;tmr0.c,80 :: 		(WARN_IND == 0)? (WARN_IND = 1):(WARN_IND = 0);
	BTFSC      PORTA+0, 0
	GOTO       L_Execute_Flash30
	BSF        PORTA+0, 0
	GOTO       L_Execute_Flash31
L_Execute_Flash30:
	BCF        PORTA+0, 0
L_Execute_Flash31:
;tmr0.c,81 :: 		(TRAIL_1 == 0)? (TRAIL_1 = 1):(TRAIL_1 = 0);
	BTFSC      PORTA+0, 1
	GOTO       L_Execute_Flash32
	BSF        PORTA+0, 1
	GOTO       L_Execute_Flash33
L_Execute_Flash32:
	BCF        PORTA+0, 1
L_Execute_Flash33:
;tmr0.c,82 :: 		TRAIL_2 = 0;
	BCF        PORTA+0, 5
;tmr0.c,83 :: 		u8_FlashRate = 0 ;
	CLRF       _u8_FlashRate+0
;tmr0.c,84 :: 		}
L_Execute_Flash29:
;tmr0.c,85 :: 		u8_FlashRate++;
	INCF       _u8_FlashRate+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _u8_FlashRate+0
;tmr0.c,86 :: 		break;
	GOTO       L_Execute_Flash20
;tmr0.c,88 :: 		case 4: if(u8_FlashRate > 1)
L_Execute_Flash34:
	MOVF       _u8_FlashRate+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_Execute_Flash35
;tmr0.c,90 :: 		(WARN_IND == 0)? (WARN_IND = 1):(WARN_IND = 0);
	BTFSC      PORTA+0, 0
	GOTO       L_Execute_Flash36
	BSF        PORTA+0, 0
	GOTO       L_Execute_Flash37
L_Execute_Flash36:
	BCF        PORTA+0, 0
L_Execute_Flash37:
;tmr0.c,91 :: 		(TRAIL_1 == 0)? (TRAIL_1 = 1):(TRAIL_1 = 0);
	BTFSC      PORTA+0, 1
	GOTO       L_Execute_Flash38
	BSF        PORTA+0, 1
	GOTO       L_Execute_Flash39
L_Execute_Flash38:
	BCF        PORTA+0, 1
L_Execute_Flash39:
;tmr0.c,92 :: 		(TRAIL_2 == 0)? (TRAIL_2 = 1):(TRAIL_2 = 0);
	BTFSC      PORTA+0, 5
	GOTO       L_Execute_Flash40
	BSF        PORTA+0, 5
	GOTO       L_Execute_Flash41
L_Execute_Flash40:
	BCF        PORTA+0, 5
L_Execute_Flash41:
;tmr0.c,93 :: 		u8_FlashRate = 0;
	CLRF       _u8_FlashRate+0
;tmr0.c,94 :: 		}
L_Execute_Flash35:
;tmr0.c,95 :: 		u8_FlashRate++;
	INCF       _u8_FlashRate+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _u8_FlashRate+0
;tmr0.c,96 :: 		break;
	GOTO       L_Execute_Flash20
;tmr0.c,97 :: 		default: WARN_IND = 0; TRAIL_1 = 0; TRAIL_2 = 0;break;
L_Execute_Flash42:
	BCF        PORTA+0, 0
	BCF        PORTA+0, 1
	BCF        PORTA+0, 5
	GOTO       L_Execute_Flash20
;tmr0.c,99 :: 		}
L_Execute_Flash19:
	MOVF       _switch_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Execute_Flash21
	MOVF       _switch_choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Execute_Flash24
	MOVF       _switch_choice+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Execute_Flash28
	MOVF       _switch_choice+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Execute_Flash34
	GOTO       L_Execute_Flash42
L_Execute_Flash20:
;tmr0.c,100 :: 		}
L_end_Execute_Flash:
	RETURN
; end of _Execute_Flash

_TMR0_ISR:

;tmr0.c,102 :: 		void TMR0_ISR(void)
;tmr0.c,104 :: 		TMR0 = TMR0_RELOAD_VALUE;     /* Write to the Timer0 register*/
	MOVLW      100
	MOVWF      TMR0+0
;tmr0.c,106 :: 		Check_ADC();
	CALL       _Check_ADC+0
;tmr0.c,107 :: 		if(s8_200ms >= 19)
	MOVLW      128
	XORWF      _s8_200ms+0, 0
	MOVWF      R0
	MOVLW      128
	XORLW      19
	SUBWF      R0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_TMR0_ISR43
;tmr0.c,109 :: 		Execute_Flash();
	CALL       _Execute_Flash+0
;tmr0.c,110 :: 		Soft_UART_Write((uint8)(switch_choice));
	MOVF       _switch_choice+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;tmr0.c,111 :: 		Soft_UART_Write(0xFF);
	MOVLW      255
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;tmr0.c,112 :: 		s8_200ms = -1;
	MOVLW      255
	MOVWF      _s8_200ms+0
;tmr0.c,113 :: 		}
L_TMR0_ISR43:
;tmr0.c,114 :: 		s8_200ms++;
	INCF       _s8_200ms+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _s8_200ms+0
;tmr0.c,115 :: 		TMR0IF_bit = 0;           /*Clear the TMR0 interrupt flag8*/
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;tmr0.c,117 :: 		}
L_end_TMR0_ISR:
	RETURN
; end of _TMR0_ISR
