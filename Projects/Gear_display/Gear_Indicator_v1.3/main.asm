
_ShowDigit:

;main.c,15 :: 		void ShowDigit(uint8_t Digit)
;main.c,19 :: 		PORTC |= (1 << RESET_BIT);       // RESET pin high
	BSF        PORTC+0, 0
;main.c,20 :: 		PORTC &= ~(1 << RESET_BIT);      // RESET pin low
	BCF        PORTC+0, 0
;main.c,22 :: 		for (i = 0; i < Digit; i++)
	CLRF       R1+0
L_ShowDigit0:
	MOVF       FARG_ShowDigit_Digit+0, 0
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ShowDigit1
;main.c,24 :: 		PORTC |= (1 << CLOCK_BIT);   // CLOCK pin high
	BSF        PORTC+0, 1
;main.c,25 :: 		PORTC &= ~(1 << CLOCK_BIT);  // CLOCK pin low
	BCF        PORTC+0, 1
;main.c,22 :: 		for (i = 0; i < Digit; i++)
	INCF       R1+0, 1
;main.c,26 :: 		}
	GOTO       L_ShowDigit0
L_ShowDigit1:
;main.c,27 :: 		}
L_end_ShowDigit:
	RETURN
; end of _ShowDigit

_Init:

;main.c,29 :: 		void Init()
;main.c,32 :: 		ANSEL=0x00;
	CLRF       ANSEL+0
;main.c,33 :: 		TRISC = 0xFC;
	MOVLW      252
	MOVWF      TRISC+0
;main.c,35 :: 		PORTC &= ~(1 << RESET_BIT);  // RESET pin low
	BCF        PORTC+0, 0
;main.c,39 :: 		ShowDigit(0);
	CLRF       FARG_ShowDigit_Digit+0
	CALL       _ShowDigit+0
;main.c,40 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Init3:
	DECFSZ     R13+0, 1
	GOTO       L_Init3
	DECFSZ     R12+0, 1
	GOTO       L_Init3
	DECFSZ     R11+0, 1
	GOTO       L_Init3
	NOP
	NOP
;main.c,42 :: 		for (i = 1; i < 10; i++)
	MOVLW      1
	MOVWF      Init_i_L0+0
L_Init4:
	MOVLW      10
	SUBWF      Init_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Init5
;main.c,44 :: 		ShowDigit(i);
	MOVF       Init_i_L0+0, 0
	MOVWF      FARG_ShowDigit_Digit+0
	CALL       _ShowDigit+0
;main.c,45 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_Init7:
	DECFSZ     R13+0, 1
	GOTO       L_Init7
	DECFSZ     R12+0, 1
	GOTO       L_Init7
	DECFSZ     R11+0, 1
	GOTO       L_Init7
	NOP
;main.c,42 :: 		for (i = 1; i < 10; i++)
	INCF       Init_i_L0+0, 1
;main.c,46 :: 		}
	GOTO       L_Init4
L_Init5:
;main.c,48 :: 		ShowDigit(0);
	CLRF       FARG_ShowDigit_Digit+0
	CALL       _ShowDigit+0
;main.c,49 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_Init8:
	DECFSZ     R13+0, 1
	GOTO       L_Init8
	DECFSZ     R12+0, 1
	GOTO       L_Init8
	DECFSZ     R11+0, 1
	GOTO       L_Init8
	NOP
	NOP
;main.c,51 :: 		Gear = EEPROM_Read(0);  // Read initial value from EEPROM
	CLRF       FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      _Gear+0
;main.c,52 :: 		ShowDigit(Gear);                       // Show initial value
	MOVF       R0+0, 0
	MOVWF      FARG_ShowDigit_Digit+0
	CALL       _ShowDigit+0
;main.c,53 :: 		}
L_end_Init:
	RETURN
; end of _Init

_Released:

;main.c,55 :: 		int Released(uint8_t Bit)
;main.c,57 :: 		if (Bit==1)
	MOVF       FARG_Released_Bit+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Released9
;main.c,59 :: 		delay_ms(DEBOUNCE_TIME);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_Released10:
	DECFSZ     R13+0, 1
	GOTO       L_Released10
	DECFSZ     R12+0, 1
	GOTO       L_Released10
	NOP
	NOP
;main.c,60 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	GOTO       L_end_Released
;main.c,61 :: 		}
L_Released9:
;main.c,63 :: 		return 0;
	CLRF       R0+0
	CLRF       R0+1
;main.c,64 :: 		}
L_end_Released:
	RETURN
; end of _Released

_main:

;main.c,66 :: 		int main(void)
;main.c,68 :: 		Init();
	CALL       _Init+0
;main.c,70 :: 		while(1)
L_main11:
;main.c,72 :: 		if (Released(NEUTRAL_BIT)) Gear = 0;
	MOVLW      0
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	MOVLW      1
	MOVWF      FARG_Released_Bit+0
	CALL       _Released+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	CLRF       _Gear+0
L_main13:
;main.c,73 :: 		if (Released(UP_BIT))
	MOVLW      0
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	MOVLW      1
	MOVWF      FARG_Released_Bit+0
	CALL       _Released+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main14
;main.c,75 :: 		if ((Gear > 0) && (Gear < TOP_GEAR)) Gear++;
	MOVF       _Gear+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main17
	MOVLW      5
	SUBWF      _Gear+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main17
L__main25:
	INCF       _Gear+0, 1
L_main17:
;main.c,76 :: 		if (Gear == 0) Gear = 2;
	MOVF       _Gear+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main18
	MOVLW      2
	MOVWF      _Gear+0
L_main18:
;main.c,77 :: 		if (NEUTRAL_BIT==1) Gear = 0;
	BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main19
	CLRF       _Gear+0
L_main19:
;main.c,78 :: 		}
L_main14:
;main.c,80 :: 		if (Released(DOWN_BIT))
	MOVLW      0
	BTFSC      RC4_bit+0, BitPos(RC4_bit+0)
	MOVLW      1
	MOVWF      FARG_Released_Bit+0
	CALL       _Released+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main20
;main.c,82 :: 		if (Gear > 1) Gear--;
	MOVF       _Gear+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_main21
	DECF       _Gear+0, 1
L_main21:
;main.c,83 :: 		if (Gear == 0) Gear = 1;
	MOVF       _Gear+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main22
	MOVLW      1
	MOVWF      _Gear+0
L_main22:
;main.c,84 :: 		if (NEUTRAL_BIT==1) Gear = 0;
	BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main23
	CLRF       _Gear+0
L_main23:
;main.c,85 :: 		}
L_main20:
;main.c,87 :: 		ShowDigit(Gear);
	MOVF       _Gear+0, 0
	MOVWF      FARG_ShowDigit_Digit+0
	CALL       _ShowDigit+0
;main.c,88 :: 		EEPROM_Write(0,Gear);
	CLRF       FARG_EEPROM_Write_Address+0
	MOVF       _Gear+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;main.c,89 :: 		delay_ms(LOCK_TIME);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
;main.c,90 :: 		}
	GOTO       L_main11
;main.c,91 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
