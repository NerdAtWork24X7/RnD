
_colscan:

;keypad.c,17 :: 		char colscan(void)
;keypad.c,19 :: 		return(C0|C1|C2|C3);
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
;keypad.c,20 :: 		}
L_end_colscan:
	RETURN
; end of _colscan

_init_rows:

;keypad.c,22 :: 		void init_rows(void)
;keypad.c,24 :: 		R0=R1=R2=R3=1;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__init_rows26
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__init_rows27
L__init_rows26:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__init_rows27:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__init_rows28
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__init_rows29
L__init_rows28:
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
L__init_rows29:
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__init_rows30
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__init_rows31
L__init_rows30:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__init_rows31:
;keypad.c,25 :: 		}
L_end_init_rows:
	RETURN
; end of _init_rows

_init_cols:

;keypad.c,27 :: 		void init_cols(void)
;keypad.c,29 :: 		C0=C1=C2=C3=0;
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L__init_cols33
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__init_cols34
L__init_cols33:
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
L__init_cols34:
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L__init_cols35
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__init_cols36
L__init_cols35:
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
L__init_cols36:
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__init_cols37
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__init_cols38
L__init_cols37:
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
L__init_cols38:
;keypad.c,30 :: 		}
L_end_init_cols:
	RETURN
; end of _init_cols

_keyscan:

;keypad.c,32 :: 		void keyscan()
;keypad.c,36 :: 		init_cols();
	CALL       _init_cols+0
;keypad.c,37 :: 		init_rows();
	CALL       _init_rows+0
;keypad.c,38 :: 		for(i=0;i<MAX_CHANNEL;i++) {channel[i]=0xFF;}       //Clear Channel
	CLRF       keyscan_i_L0+0
L_keyscan0:
	MOVLW      6
	SUBWF      keyscan_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_keyscan1
	MOVF       keyscan_i_L0+0, 0
	ADDLW      _channel+0
	MOVWF      FSR
	MOVLW      255
	MOVWF      INDF+0
	INCF       keyscan_i_L0+0, 1
	GOTO       L_keyscan0
L_keyscan1:
;keypad.c,40 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan3
;keypad.c,43 :: 		R0=1;R1=R2=R3=0;
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__keyscan40
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan41
L__keyscan40:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__keyscan41:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan42
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__keyscan43
L__keyscan42:
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
L__keyscan43:
;keypad.c,44 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan4
;keypad.c,46 :: 		if(C0==1) {channel[0]&=~(1<<0);}
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_keyscan5
	BCF        _channel+0, 0
L_keyscan5:
;keypad.c,47 :: 		if(C1==1) { channel[0]&=~(1<<1);}
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_keyscan6
	BCF        _channel+0, 1
L_keyscan6:
;keypad.c,48 :: 		if(C2==1) { channel[0]&=~(1<<2);}
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_keyscan7
	BCF        _channel+0, 2
L_keyscan7:
;keypad.c,49 :: 		if(C3==1) { channel[0]&=~(1<<3);}
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_keyscan8
	BCF        _channel+0, 3
L_keyscan8:
;keypad.c,50 :: 		}
L_keyscan4:
;keypad.c,52 :: 		R1=1;R0=R2=R3=0;
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__keyscan44
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan45
L__keyscan44:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__keyscan45:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan46
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__keyscan47
L__keyscan46:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__keyscan47:
;keypad.c,53 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan9
;keypad.c,55 :: 		if(C0==1) {channel[0]&=~(1<<4);}
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_keyscan10
	BCF        _channel+0, 4
L_keyscan10:
;keypad.c,56 :: 		if(C1==1) {channel[0]&=~(1<<5);}
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_keyscan11
	BCF        _channel+0, 5
L_keyscan11:
;keypad.c,57 :: 		if(C2==1) {channel[0]&=~(1<<6);}
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_keyscan12
	BCF        _channel+0, 6
L_keyscan12:
;keypad.c,58 :: 		if(C3==1) {channel[0]&=~(1<<7);}
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_keyscan13
	MOVLW      127
	ANDWF      _channel+0, 1
L_keyscan13:
;keypad.c,59 :: 		}
L_keyscan9:
;keypad.c,60 :: 		R2=1;R0=R1=R3=0;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__keyscan48
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__keyscan49
L__keyscan48:
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
L__keyscan49:
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__keyscan50
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__keyscan51
L__keyscan50:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__keyscan51:
;keypad.c,61 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan14
;keypad.c,63 :: 		if(C0==1) {channel[1]&=~(1<<0);}
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_keyscan15
	BCF        _channel+1, 0
L_keyscan15:
;keypad.c,64 :: 		if(C1==1) {channel[1]&=~(1<<1);}
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_keyscan16
	BCF        _channel+1, 1
L_keyscan16:
;keypad.c,65 :: 		if(C2==1) {channel[1]&=~(1<<2);}
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_keyscan17
	BCF        _channel+1, 2
L_keyscan17:
;keypad.c,66 :: 		if(C3==1) {channel[1]&=~(1<<3);}
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_keyscan18
	BCF        _channel+1, 3
L_keyscan18:
;keypad.c,67 :: 		}
L_keyscan14:
;keypad.c,68 :: 		R3=1;R0=R2=R1=0;
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__keyscan52
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan53
L__keyscan52:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__keyscan53:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__keyscan54
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__keyscan55
L__keyscan54:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__keyscan55:
;keypad.c,69 :: 		if(colscan())
	CALL       _colscan+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_keyscan19
;keypad.c,71 :: 		if(C0==1) {channel[1]&=~(1<<4);}
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_keyscan20
	BCF        _channel+1, 4
L_keyscan20:
;keypad.c,72 :: 		if(C1==1) {channel[1]&=~(1<<5);}
	BTFSS      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_keyscan21
	BCF        _channel+1, 5
L_keyscan21:
;keypad.c,73 :: 		if(C2==1) {channel[1]&=~(1<<6);}
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_keyscan22
	BCF        _channel+1, 6
L_keyscan22:
;keypad.c,74 :: 		if(C3==1) {channel[1]&=~(1<<7);}
	BTFSS      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_keyscan23
	MOVLW      127
	ANDWF      _channel+1, 1
L_keyscan23:
;keypad.c,75 :: 		}
L_keyscan19:
;keypad.c,76 :: 		}
L_keyscan3:
;keypad.c,78 :: 		}
L_end_keyscan:
	RETURN
; end of _keyscan
