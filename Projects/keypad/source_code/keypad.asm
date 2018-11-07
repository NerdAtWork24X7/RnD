
_colscan:

;keypad.c,32 :: 		char colscan(void)
;keypad.c,34 :: 		return(C0|C1|C2|C3);
	CLRF       R1+0
	BTFSC      RC4_bit+0, BitPos(RC4_bit+0)
	INCF       R1+0, 1
	CLRF       R0+0
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	INCF       R0+0, 1
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	CLRF       R0+0
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	INCF       R0+0, 1
	MOVF       R0+0, 0
	IORWF      R1+0, 1
	CLRF       R0+0
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	INCF       R0+0, 1
	MOVF       R1+0, 0
	IORWF      R0+0, 1
;keypad.c,35 :: 		}
L_end_colscan:
	RETURN
; end of _colscan

_init_rows:

;keypad.c,37 :: 		void init_rows(void)
;keypad.c,39 :: 		R0=R1=R2=R3=1;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__init_rows39
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__init_rows40
L__init_rows39:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__init_rows40:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__init_rows41
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__init_rows42
L__init_rows41:
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
L__init_rows42:
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__init_rows43
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__init_rows44
L__init_rows43:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__init_rows44:
;keypad.c,40 :: 		}
L_end_init_rows:
	RETURN
; end of _init_rows

_init_cols:

;keypad.c,42 :: 		void init_cols(void)
;keypad.c,44 :: 		C0=C1=C2=C3=0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L__init_cols46
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__init_cols47
L__init_cols46:
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
L__init_cols47:
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__init_cols48
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__init_cols49
L__init_cols48:
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
L__init_cols49:
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__init_cols50
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__init_cols51
L__init_cols50:
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
L__init_cols51:
;keypad.c,45 :: 		}
L_end_init_cols:
	RETURN
; end of _init_cols

_keyscan:

;keypad.c,47 :: 		void keyscan()
;keypad.c,49 :: 		init_cols();
	CALL       _init_cols+0
;keypad.c,50 :: 		init_rows();
	CALL       _init_rows+0
;keypad.c,51 :: 		PortB=0x00;PortA=0x00;
	CLRF       PORTB+0
	CLRF       PORTA+0
;keypad.c,52 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan0
;keypad.c,55 :: 		R0=1;R1=R2=R3=0;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__keyscan53
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan54
L__keyscan53:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__keyscan54:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan55
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__keyscan56
L__keyscan55:
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
L__keyscan56:
;keypad.c,56 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan1
;keypad.c,58 :: 		if(C0==1) { Relay1=1;}  delay_ms(100);
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_keyscan2
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
L_keyscan2:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan3:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan3
	DECFSZ     R12+0, 1
	GOTO       L_keyscan3
	DECFSZ     R11+0, 1
	GOTO       L_keyscan3
	NOP
;keypad.c,59 :: 		if(C1==1) { Relay2=1;}  delay_ms(100);
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_keyscan4
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
L_keyscan4:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan5:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan5
	DECFSZ     R12+0, 1
	GOTO       L_keyscan5
	DECFSZ     R11+0, 1
	GOTO       L_keyscan5
	NOP
;keypad.c,60 :: 		if(C2==1) { Relay3=1;}  delay_ms(100);
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_keyscan6
	BSF        RA2_bit+0, BitPos(RA2_bit+0)
L_keyscan6:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan7:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan7
	DECFSZ     R12+0, 1
	GOTO       L_keyscan7
	DECFSZ     R11+0, 1
	GOTO       L_keyscan7
	NOP
;keypad.c,61 :: 		if(C3==1) { Relay4=1;}  delay_ms(100);
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_keyscan8
	BSF        RA3_bit+0, BitPos(RA3_bit+0)
L_keyscan8:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan9:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan9
	DECFSZ     R12+0, 1
	GOTO       L_keyscan9
	DECFSZ     R11+0, 1
	GOTO       L_keyscan9
	NOP
;keypad.c,62 :: 		}
L_keyscan1:
;keypad.c,64 :: 		R1=1;R0=R2=R3=0;
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__keyscan57
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan58
L__keyscan57:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__keyscan58:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan59
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__keyscan60
L__keyscan59:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__keyscan60:
;keypad.c,65 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan10
;keypad.c,67 :: 		if(C0==1) {Relay5=1;}   delay_ms(100);
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_keyscan11
	BSF        RA4_bit+0, BitPos(RA4_bit+0)
L_keyscan11:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan12:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan12
	DECFSZ     R12+0, 1
	GOTO       L_keyscan12
	DECFSZ     R11+0, 1
	GOTO       L_keyscan12
	NOP
;keypad.c,68 :: 		if(C1==1) {Relay6=1;}   delay_ms(100);
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_keyscan13
	BSF        RA5_bit+0, BitPos(RA5_bit+0)
L_keyscan13:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan14:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan14
	DECFSZ     R12+0, 1
	GOTO       L_keyscan14
	DECFSZ     R11+0, 1
	GOTO       L_keyscan14
	NOP
;keypad.c,69 :: 		if(C2==1) {Relay7=1;}   delay_ms(100);
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_keyscan15
	BSF        RA6_bit+0, BitPos(RA6_bit+0)
L_keyscan15:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan16:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan16
	DECFSZ     R12+0, 1
	GOTO       L_keyscan16
	DECFSZ     R11+0, 1
	GOTO       L_keyscan16
	NOP
;keypad.c,70 :: 		if(C3==1) {Relay8=1;}   delay_ms(100);
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_keyscan17
	BSF        RA7_bit+0, BitPos(RA7_bit+0)
L_keyscan17:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan18:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan18
	DECFSZ     R12+0, 1
	GOTO       L_keyscan18
	DECFSZ     R11+0, 1
	GOTO       L_keyscan18
	NOP
;keypad.c,71 :: 		}
L_keyscan10:
;keypad.c,72 :: 		R2=1;R0=R1=R3=0;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__keyscan61
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__keyscan62
L__keyscan61:
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
L__keyscan62:
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__keyscan63
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__keyscan64
L__keyscan63:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__keyscan64:
;keypad.c,73 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan19
;keypad.c,75 :: 		if(C0==1) {Relay9=1;}  delay_ms(100);
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_keyscan20
	BSF        RB0_bit+0, BitPos(RB0_bit+0)
L_keyscan20:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan21:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan21
	DECFSZ     R12+0, 1
	GOTO       L_keyscan21
	DECFSZ     R11+0, 1
	GOTO       L_keyscan21
	NOP
;keypad.c,76 :: 		if(C1==1) {Relay10=1;} delay_ms(100);
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_keyscan22
	BSF        RB1_bit+0, BitPos(RB1_bit+0)
L_keyscan22:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan23:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan23
	DECFSZ     R12+0, 1
	GOTO       L_keyscan23
	DECFSZ     R11+0, 1
	GOTO       L_keyscan23
	NOP
;keypad.c,77 :: 		if(C2==1) {Relay11=1;} delay_ms(100);
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_keyscan24
	BSF        RB2_bit+0, BitPos(RB2_bit+0)
L_keyscan24:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan25:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan25
	DECFSZ     R12+0, 1
	GOTO       L_keyscan25
	DECFSZ     R11+0, 1
	GOTO       L_keyscan25
	NOP
;keypad.c,78 :: 		if(C3==1) {Relay12=1;} delay_ms(100);
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_keyscan26
	BSF        RB3_bit+0, BitPos(RB3_bit+0)
L_keyscan26:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan27:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan27
	DECFSZ     R12+0, 1
	GOTO       L_keyscan27
	DECFSZ     R11+0, 1
	GOTO       L_keyscan27
	NOP
;keypad.c,79 :: 		}
L_keyscan19:
;keypad.c,80 :: 		R3=1;R0=R2=R1=0;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__keyscan65
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan66
L__keyscan65:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__keyscan66:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan67
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__keyscan68
L__keyscan67:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__keyscan68:
;keypad.c,81 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan28
;keypad.c,83 :: 		if(C0==1) {Relay13=1;}   delay_ms(100);
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_keyscan29
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
L_keyscan29:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan30:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan30
	DECFSZ     R12+0, 1
	GOTO       L_keyscan30
	DECFSZ     R11+0, 1
	GOTO       L_keyscan30
	NOP
;keypad.c,84 :: 		if(C1==1) {Relay14=1;}   delay_ms(100);
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_keyscan31
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
L_keyscan31:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan32:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan32
	DECFSZ     R12+0, 1
	GOTO       L_keyscan32
	DECFSZ     R11+0, 1
	GOTO       L_keyscan32
	NOP
;keypad.c,85 :: 		if(C2==1) {Relay15=1;}   delay_ms(100);
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_keyscan33
	BSF        RB6_bit+0, BitPos(RB6_bit+0)
L_keyscan33:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan34:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan34
	DECFSZ     R12+0, 1
	GOTO       L_keyscan34
	DECFSZ     R11+0, 1
	GOTO       L_keyscan34
	NOP
;keypad.c,86 :: 		if(C3==1) {Relay16=1;}   delay_ms(100);
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_keyscan35
	BSF        RB7_bit+0, BitPos(RB7_bit+0)
L_keyscan35:
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_keyscan36:
	DECFSZ     R13+0, 1
	GOTO       L_keyscan36
	DECFSZ     R12+0, 1
	GOTO       L_keyscan36
	DECFSZ     R11+0, 1
	GOTO       L_keyscan36
	NOP
;keypad.c,87 :: 		}
L_keyscan28:
;keypad.c,88 :: 		}
L_keyscan0:
;keypad.c,90 :: 		}
L_end_keyscan:
	RETURN
; end of _keyscan
