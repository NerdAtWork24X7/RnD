
_interrupt:

;APP_OPSM.c,9 :: 		void interrupt()
;APP_OPSM.c,11 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,12 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt66:
;APP_OPSM.c,14 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,15 :: 		}
L_interrupt2:
;APP_OPSM.c,17 :: 		}
L_end_interrupt:
L__interrupt69:
	RETFIE     %s
; end of _interrupt

_CHCK_COND:

;APP_OPSM.c,19 :: 		void CHCK_COND(uint8 x)
;APP_OPSM.c,22 :: 		guc_deb[x]++;
	MOVF       FARG_CHCK_COND_x+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _guc_deb+0
	ADDWF      R0, 0
	MOVWF      R2
	MOVLW      hi_addr(_guc_deb+0)
	ADDWFC     R1, 0
	MOVWF      R3
	MOVF       R2, 0
	MOVWF      FSR0L
	MOVF       R3, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	INCF       R0, 1
	BTFSC      STATUS+0, 2
	INCF       R1, 1
	MOVF       R2, 0
	MOVWF      FSR1L
	MOVF       R3, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
	MOVF       R1, 0
	ADDFSR     1, 1
	MOVWF      INDF1+0
;APP_OPSM.c,23 :: 		for(i=0;i<=TOTAL_COND && i!=x;i++){guc_deb[i] = 0;}
	CLRF       R4+0
L_CHCK_COND3:
	MOVF       R4+0, 0
	SUBLW      18
	BTFSS      STATUS+0, 0
	GOTO       L_CHCK_COND4
	MOVF       R4+0, 0
	XORWF      FARG_CHCK_COND_x+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CHCK_COND4
L__CHCK_COND67:
	MOVF       R4+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _guc_deb+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_guc_deb+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	INCF       R4+0, 1
	GOTO       L_CHCK_COND3
L_CHCK_COND4:
;APP_OPSM.c,24 :: 		if(guc_deb[x] > DEBO_TIME){ guc_choice = x; guc_deb[x] = 0;}
	MOVF       FARG_CHCK_COND_x+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _guc_deb+0
	ADDWF      R0, 0
	MOVWF      FSR0L
	MOVLW      hi_addr(_guc_deb+0)
	ADDWFC     R1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R1
	ADDFSR     0, 1
	MOVF       INDF0+0, 0
	MOVWF      R2
	MOVF       R2, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__CHCK_COND71
	MOVF       R1, 0
	SUBLW      20
L__CHCK_COND71:
	BTFSC      STATUS+0, 0
	GOTO       L_CHCK_COND8
	MOVF       FARG_CHCK_COND_x+0, 0
	MOVWF      _guc_choice+0
	MOVF       FARG_CHCK_COND_x+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _guc_deb+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_guc_deb+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
L_CHCK_COND8:
;APP_OPSM.c,25 :: 		}
L_end_CHCK_COND:
	RETURN
; end of _CHCK_COND

_check_cond:

;APP_OPSM.c,28 :: 		void check_cond()
;APP_OPSM.c,30 :: 		guc_choice = 0;
	CLRF       _guc_choice+0
;APP_OPSM.c,31 :: 		if(COND1){ CHCK_COND(1); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond73
	BSF        3, 0
	GOTO       L__check_cond74
L__check_cond73:
	BCF        3, 0
L__check_cond74:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond75
	BTFSS      3, 0
	GOTO       L__check_cond75
	BSF        R0, 0
	GOTO       L__check_cond76
L__check_cond75:
	BCF        R0, 0
L__check_cond76:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond77
	BSF        3, 0
	GOTO       L__check_cond78
L__check_cond77:
	BCF        3, 0
L__check_cond78:
	BTFSS      R0, 0
	GOTO       L__check_cond79
	BTFSS      3, 0
	GOTO       L__check_cond79
	BSF        R0, 0
	GOTO       L__check_cond80
L__check_cond79:
	BCF        R0, 0
L__check_cond80:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond81
	BSF        3, 0
	GOTO       L__check_cond82
L__check_cond81:
	BCF        3, 0
L__check_cond82:
	BTFSS      R0, 0
	GOTO       L__check_cond83
	BTFSS      3, 0
	GOTO       L__check_cond83
	BSF        R0, 0
	GOTO       L__check_cond84
L__check_cond83:
	BCF        R0, 0
L__check_cond84:
	BTFSS      R0, 0
	GOTO       L_check_cond9
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond10
L_check_cond9:
;APP_OPSM.c,35 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond85
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond85
	BSF        R0, 0
	GOTO       L__check_cond86
L__check_cond85:
	BCF        R0, 0
L__check_cond86:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond87
	BSF        3, 0
	GOTO       L__check_cond88
L__check_cond87:
	BCF        3, 0
L__check_cond88:
	BTFSS      R0, 0
	GOTO       L__check_cond89
	BTFSS      3, 0
	GOTO       L__check_cond89
	BSF        R0, 0
	GOTO       L__check_cond90
L__check_cond89:
	BCF        R0, 0
L__check_cond90:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond91
	BSF        3, 0
	GOTO       L__check_cond92
L__check_cond91:
	BCF        3, 0
L__check_cond92:
	BTFSS      R0, 0
	GOTO       L__check_cond93
	BTFSS      3, 0
	GOTO       L__check_cond93
	BSF        R0, 0
	GOTO       L__check_cond94
L__check_cond93:
	BCF        R0, 0
L__check_cond94:
	BTFSS      R0, 0
	GOTO       L_check_cond11
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond12
L_check_cond11:
;APP_OPSM.c,36 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond95
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond95
	BSF        R0, 0
	GOTO       L__check_cond96
L__check_cond95:
	BCF        R0, 0
L__check_cond96:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond97
	BSF        3, 0
	GOTO       L__check_cond98
L__check_cond97:
	BCF        3, 0
L__check_cond98:
	BTFSS      R0, 0
	GOTO       L__check_cond99
	BTFSS      3, 0
	GOTO       L__check_cond99
	BSF        R0, 0
	GOTO       L__check_cond100
L__check_cond99:
	BCF        R0, 0
L__check_cond100:
	BTFSS      R0, 0
	GOTO       L__check_cond101
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond101
	BSF        3, 0
	GOTO       L__check_cond102
L__check_cond101:
	BCF        3, 0
L__check_cond102:
	BTFSS      3, 0
	GOTO       L_check_cond13
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond14
L_check_cond13:
;APP_OPSM.c,39 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond103
	BSF        R0, 0
	GOTO       L__check_cond104
L__check_cond103:
	BCF        R0, 0
L__check_cond104:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond105
	BSF        3, 0
	GOTO       L__check_cond106
L__check_cond105:
	BCF        3, 0
L__check_cond106:
	BTFSS      R0, 0
	GOTO       L__check_cond107
	BTFSS      3, 0
	GOTO       L__check_cond107
	BSF        R0, 0
	GOTO       L__check_cond108
L__check_cond107:
	BCF        R0, 0
L__check_cond108:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond109
	BSF        3, 0
	GOTO       L__check_cond110
L__check_cond109:
	BCF        3, 0
L__check_cond110:
	BTFSS      R0, 0
	GOTO       L__check_cond111
	BTFSS      3, 0
	GOTO       L__check_cond111
	BSF        R0, 0
	GOTO       L__check_cond112
L__check_cond111:
	BCF        R0, 0
L__check_cond112:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond113
	BSF        3, 0
	GOTO       L__check_cond114
L__check_cond113:
	BCF        3, 0
L__check_cond114:
	BTFSS      R0, 0
	GOTO       L__check_cond115
	BTFSS      3, 0
	GOTO       L__check_cond115
	BSF        R0, 0
	GOTO       L__check_cond116
L__check_cond115:
	BCF        R0, 0
L__check_cond116:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond16
L_check_cond15:
;APP_OPSM.c,43 :: 		else if(COND13){ CHCK_COND(13); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond117
	BSF        3, 0
	GOTO       L__check_cond118
L__check_cond117:
	BCF        3, 0
L__check_cond118:
	BTFSS      3, 0
	GOTO       L__check_cond119
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond119
	BSF        R0, 0
	GOTO       L__check_cond120
L__check_cond119:
	BCF        R0, 0
L__check_cond120:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond121
	BSF        3, 0
	GOTO       L__check_cond122
L__check_cond121:
	BCF        3, 0
L__check_cond122:
	BTFSS      R0, 0
	GOTO       L__check_cond123
	BTFSS      3, 0
	GOTO       L__check_cond123
	BSF        R0, 0
	GOTO       L__check_cond124
L__check_cond123:
	BCF        R0, 0
L__check_cond124:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond125
	BSF        3, 0
	GOTO       L__check_cond126
L__check_cond125:
	BCF        3, 0
L__check_cond126:
	BTFSS      R0, 0
	GOTO       L__check_cond127
	BTFSS      3, 0
	GOTO       L__check_cond127
	BSF        R0, 0
	GOTO       L__check_cond128
L__check_cond127:
	BCF        R0, 0
L__check_cond128:
	BTFSS      R0, 0
	GOTO       L_check_cond17
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond18
L_check_cond17:
;APP_OPSM.c,44 :: 		else if(COND14){ CHCK_COND(14); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond129
	BSF        3, 0
	GOTO       L__check_cond130
L__check_cond129:
	BCF        3, 0
L__check_cond130:
	BTFSS      3, 0
	GOTO       L__check_cond131
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond131
	BSF        R0, 0
	GOTO       L__check_cond132
L__check_cond131:
	BCF        R0, 0
L__check_cond132:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond133
	BSF        3, 0
	GOTO       L__check_cond134
L__check_cond133:
	BCF        3, 0
L__check_cond134:
	BTFSS      R0, 0
	GOTO       L__check_cond135
	BTFSS      3, 0
	GOTO       L__check_cond135
	BSF        R0, 0
	GOTO       L__check_cond136
L__check_cond135:
	BCF        R0, 0
L__check_cond136:
	BTFSS      R0, 0
	GOTO       L__check_cond137
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond137
	BSF        3, 0
	GOTO       L__check_cond138
L__check_cond137:
	BCF        3, 0
L__check_cond138:
	BTFSS      3, 0
	GOTO       L_check_cond19
	MOVLW      14
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond20
L_check_cond19:
;APP_OPSM.c,47 :: 		else {guc_choice = (TOTAL_COND - 1);}
	MOVLW      17
	MOVWF      _guc_choice+0
L_check_cond20:
L_check_cond18:
L_check_cond16:
L_check_cond14:
L_check_cond12:
L_check_cond10:
;APP_OPSM.c,48 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_reset_all:

;APP_OPSM.c,50 :: 		void reset_all()
;APP_OPSM.c,52 :: 		guc_togg_half = 0;
	CLRF       _guc_togg_half+0
;APP_OPSM.c,53 :: 		guc_buzz_state = 0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,54 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,55 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,64 :: 		}
L_end_reset_all:
	RETURN
; end of _reset_all

_Chk_HB:

;APP_OPSM.c,66 :: 		void Chk_HB()
;APP_OPSM.c,68 :: 		volatile uint8 deb_cnt = 0,deb_buz = 0;
	CLRF       Chk_HB_deb_cnt_L0+0
	CLRF       Chk_HB_deb_buz_L0+0
;APP_OPSM.c,69 :: 		while(deb_cnt < 126)
L_Chk_HB21:
	MOVLW      126
	SUBWF      Chk_HB_deb_cnt_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Chk_HB22
;APP_OPSM.c,72 :: 		(HAND_BRAKE == 0)?(deb_buz++):(deb_buz = 0);
	BTFSC      PORTC+0, 0
	GOTO       L_Chk_HB23
	MOVF       Chk_HB_deb_buz_L0+0, 0
	MOVWF      R1
	INCF       Chk_HB_deb_buz_L0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      Chk_HB_deb_buz_L0+0
	MOVF       R1, 0
	MOVWF      R3+0
	GOTO       L_Chk_HB24
L_Chk_HB23:
	CLRF       Chk_HB_deb_buz_L0+0
	MOVF       Chk_HB_deb_buz_L0+0, 0
	MOVWF      R3+0
L_Chk_HB24:
;APP_OPSM.c,73 :: 		if(deb_buz > 126)
	MOVF       Chk_HB_deb_buz_L0+0, 0
	SUBLW      126
	BTFSC      STATUS+0, 0
	GOTO       L_Chk_HB25
;APP_OPSM.c,75 :: 		if((guc_buzz_state == 0) & (buz_fl)){guc_sec = 0; while(guc_sec<6);}
	MOVF       _guc_buzz_state+0, 0
	XORLW      0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R0
	MOVF       _buz_fl+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_Chk_HB26
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_Chk_HB27:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Chk_HB141
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__Chk_HB141:
	BTFSC      STATUS+0, 0
	GOTO       L_Chk_HB28
	GOTO       L_Chk_HB27
L_Chk_HB28:
L_Chk_HB26:
;APP_OPSM.c,76 :: 		guc_buzz_state = 1;deb_buz = 127; buz_fl = 1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	MOVLW      127
	MOVWF      Chk_HB_deb_buz_L0+0
	MOVLW      1
	MOVWF      _buz_fl+0
;APP_OPSM.c,77 :: 		}
	GOTO       L_Chk_HB29
L_Chk_HB25:
;APP_OPSM.c,78 :: 		else{guc_buzz_state = 0;}
	CLRF       _guc_buzz_state+0
L_Chk_HB29:
;APP_OPSM.c,79 :: 		(COND16 == 0)? (deb_cnt++) : (deb_cnt=0);
	BTFSC      PORTC+0, 2
	GOTO       L__Chk_HB142
	BSF        3, 0
	GOTO       L__Chk_HB143
L__Chk_HB142:
	BCF        3, 0
L__Chk_HB143:
	BTFSS      3, 0
	GOTO       L__Chk_HB144
	BTFSS      PORTC+0, 1
	GOTO       L__Chk_HB144
	BSF        R2, 0
	GOTO       L__Chk_HB145
L__Chk_HB144:
	BCF        R2, 0
L__Chk_HB145:
	BTFSC      R2, 0
	GOTO       L_Chk_HB30
	MOVF       Chk_HB_deb_cnt_L0+0, 0
	MOVWF      R1
	INCF       Chk_HB_deb_cnt_L0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      Chk_HB_deb_cnt_L0+0
	MOVF       R1, 0
	MOVWF      R4+0
	GOTO       L_Chk_HB31
L_Chk_HB30:
	CLRF       Chk_HB_deb_cnt_L0+0
	MOVF       Chk_HB_deb_cnt_L0+0, 0
	MOVWF      R4+0
L_Chk_HB31:
;APP_OPSM.c,80 :: 		}
	GOTO       L_Chk_HB21
L_Chk_HB22:
;APP_OPSM.c,81 :: 		}
L_end_Chk_HB:
	RETURN
; end of _Chk_HB

_exe_cond:

;APP_OPSM.c,83 :: 		void exe_cond()
;APP_OPSM.c,85 :: 		buz_fl = 1;
	MOVLW      1
	MOVWF      _buz_fl+0
;APP_OPSM.c,86 :: 		switch(guc_choice)
	GOTO       L_exe_cond32
;APP_OPSM.c,88 :: 		case 1: guc_sec = 0; while(guc_sec<6 & COND1);
L_exe_cond34:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond35:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond147
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond147:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond148
	BSF        3, 0
	GOTO       L__exe_cond149
L__exe_cond148:
	BCF        3, 0
L__exe_cond149:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond150
	BTFSS      3, 0
	GOTO       L__exe_cond150
	BSF        R2, 0
	GOTO       L__exe_cond151
L__exe_cond150:
	BCF        R2, 0
L__exe_cond151:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond152
	BSF        3, 0
	GOTO       L__exe_cond153
L__exe_cond152:
	BCF        3, 0
L__exe_cond153:
	BTFSS      R2, 0
	GOTO       L__exe_cond154
	BTFSS      3, 0
	GOTO       L__exe_cond154
	BSF        R2, 0
	GOTO       L__exe_cond155
L__exe_cond154:
	BCF        R2, 0
L__exe_cond155:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond156
	BSF        3, 0
	GOTO       L__exe_cond157
L__exe_cond156:
	BCF        3, 0
L__exe_cond157:
	BTFSS      R2, 0
	GOTO       L__exe_cond158
	BTFSS      3, 0
	GOTO       L__exe_cond158
	BSF        R2, 0
	GOTO       L__exe_cond159
L__exe_cond158:
	BCF        R2, 0
L__exe_cond159:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond36
	GOTO       L_exe_cond35
L_exe_cond36:
;APP_OPSM.c,89 :: 		guc_buzz_state=1; while(COND1);
	MOVLW      1
	MOVWF      _guc_buzz_state+0
L_exe_cond37:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond160
	BSF        3, 0
	GOTO       L__exe_cond161
L__exe_cond160:
	BCF        3, 0
L__exe_cond161:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond162
	BTFSS      3, 0
	GOTO       L__exe_cond162
	BSF        R2, 0
	GOTO       L__exe_cond163
L__exe_cond162:
	BCF        R2, 0
L__exe_cond163:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond164
	BSF        3, 0
	GOTO       L__exe_cond165
L__exe_cond164:
	BCF        3, 0
L__exe_cond165:
	BTFSS      R2, 0
	GOTO       L__exe_cond166
	BTFSS      3, 0
	GOTO       L__exe_cond166
	BSF        R2, 0
	GOTO       L__exe_cond167
L__exe_cond166:
	BCF        R2, 0
L__exe_cond167:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond168
	BSF        3, 0
	GOTO       L__exe_cond169
L__exe_cond168:
	BCF        3, 0
L__exe_cond169:
	BTFSS      R2, 0
	GOTO       L__exe_cond170
	BTFSS      3, 0
	GOTO       L__exe_cond170
	BSF        R2, 0
	GOTO       L__exe_cond171
L__exe_cond170:
	BCF        R2, 0
L__exe_cond171:
	BTFSS      R2, 0
	GOTO       L_exe_cond38
	GOTO       L_exe_cond37
L_exe_cond38:
;APP_OPSM.c,90 :: 		break;
	GOTO       L_exe_cond33
;APP_OPSM.c,92 :: 		case 5: RELAY_SOL = 1; guc_sec = 0; while(guc_sec<6 & COND5);
L_exe_cond39:
	BSF        PORTC+0, 5
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond40:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond172
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond172:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond173
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond173
	BSF        R2, 0
	GOTO       L__exe_cond174
L__exe_cond173:
	BCF        R2, 0
L__exe_cond174:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond175
	BSF        3, 0
	GOTO       L__exe_cond176
L__exe_cond175:
	BCF        3, 0
L__exe_cond176:
	BTFSS      R2, 0
	GOTO       L__exe_cond177
	BTFSS      3, 0
	GOTO       L__exe_cond177
	BSF        R2, 0
	GOTO       L__exe_cond178
L__exe_cond177:
	BCF        R2, 0
L__exe_cond178:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond179
	BSF        3, 0
	GOTO       L__exe_cond180
L__exe_cond179:
	BCF        3, 0
L__exe_cond180:
	BTFSS      R2, 0
	GOTO       L__exe_cond181
	BTFSS      3, 0
	GOTO       L__exe_cond181
	BSF        R2, 0
	GOTO       L__exe_cond182
L__exe_cond181:
	BCF        R2, 0
L__exe_cond182:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond41
	GOTO       L_exe_cond40
L_exe_cond41:
;APP_OPSM.c,93 :: 		if((!SEAT_SWITCH)&(!HAND_BRAKE)&(PTO))
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond183
	BSF        R2, 0
	GOTO       L__exe_cond184
L__exe_cond183:
	BCF        R2, 0
L__exe_cond184:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond185
	BSF        3, 0
	GOTO       L__exe_cond186
L__exe_cond185:
	BCF        3, 0
L__exe_cond186:
	BTFSS      R2, 0
	GOTO       L__exe_cond187
	BTFSS      3, 0
	GOTO       L__exe_cond187
	BSF        R2, 0
	GOTO       L__exe_cond188
L__exe_cond187:
	BCF        R2, 0
L__exe_cond188:
	BTFSS      R2, 0
	GOTO       L__exe_cond189
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond189
	BSF        3, 0
	GOTO       L__exe_cond190
L__exe_cond189:
	BCF        3, 0
L__exe_cond190:
	BTFSS      3, 0
	GOTO       L_exe_cond42
;APP_OPSM.c,95 :: 		Chk_HB();
	CALL       _Chk_HB+0
;APP_OPSM.c,96 :: 		}
L_exe_cond42:
;APP_OPSM.c,97 :: 		break;
	GOTO       L_exe_cond33
;APP_OPSM.c,99 :: 		case 6: if((!SEAT_SWITCH)&(HAND_BRAKE)&(PTO))
L_exe_cond43:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond191
	BSF        3, 0
	GOTO       L__exe_cond192
L__exe_cond191:
	BCF        3, 0
L__exe_cond192:
	BTFSS      3, 0
	GOTO       L__exe_cond193
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond193
	BSF        R2, 0
	GOTO       L__exe_cond194
L__exe_cond193:
	BCF        R2, 0
L__exe_cond194:
	BTFSS      R2, 0
	GOTO       L__exe_cond195
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond195
	BSF        3, 0
	GOTO       L__exe_cond196
L__exe_cond195:
	BCF        3, 0
L__exe_cond196:
	BTFSS      3, 0
	GOTO       L_exe_cond44
;APP_OPSM.c,101 :: 		RELAY_SOL = 1;
	BSF        PORTC+0, 5
;APP_OPSM.c,102 :: 		Chk_HB();
	CALL       _Chk_HB+0
;APP_OPSM.c,103 :: 		}
L_exe_cond44:
;APP_OPSM.c,104 :: 		break;
	GOTO       L_exe_cond33
;APP_OPSM.c,106 :: 		case 9: guc_sec = 0; while(guc_sec < 6 & COND9);
L_exe_cond45:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond46:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond197
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond197:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond198
	BSF        R2, 0
	GOTO       L__exe_cond199
L__exe_cond198:
	BCF        R2, 0
L__exe_cond199:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond200
	BSF        3, 0
	GOTO       L__exe_cond201
L__exe_cond200:
	BCF        3, 0
L__exe_cond201:
	BTFSS      R2, 0
	GOTO       L__exe_cond202
	BTFSS      3, 0
	GOTO       L__exe_cond202
	BSF        R2, 0
	GOTO       L__exe_cond203
L__exe_cond202:
	BCF        R2, 0
L__exe_cond203:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond204
	BSF        3, 0
	GOTO       L__exe_cond205
L__exe_cond204:
	BCF        3, 0
L__exe_cond205:
	BTFSS      R2, 0
	GOTO       L__exe_cond206
	BTFSS      3, 0
	GOTO       L__exe_cond206
	BSF        R2, 0
	GOTO       L__exe_cond207
L__exe_cond206:
	BCF        R2, 0
L__exe_cond207:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond208
	BSF        3, 0
	GOTO       L__exe_cond209
L__exe_cond208:
	BCF        3, 0
L__exe_cond209:
	BTFSS      R2, 0
	GOTO       L__exe_cond210
	BTFSS      3, 0
	GOTO       L__exe_cond210
	BSF        R2, 0
	GOTO       L__exe_cond211
L__exe_cond210:
	BCF        R2, 0
L__exe_cond211:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond47
	GOTO       L_exe_cond46
L_exe_cond47:
;APP_OPSM.c,107 :: 		guc_buzz_state = 1; while(COND9);
	MOVLW      1
	MOVWF      _guc_buzz_state+0
L_exe_cond48:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond212
	BSF        R2, 0
	GOTO       L__exe_cond213
L__exe_cond212:
	BCF        R2, 0
L__exe_cond213:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond214
	BSF        3, 0
	GOTO       L__exe_cond215
L__exe_cond214:
	BCF        3, 0
L__exe_cond215:
	BTFSS      R2, 0
	GOTO       L__exe_cond216
	BTFSS      3, 0
	GOTO       L__exe_cond216
	BSF        R2, 0
	GOTO       L__exe_cond217
L__exe_cond216:
	BCF        R2, 0
L__exe_cond217:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond218
	BSF        3, 0
	GOTO       L__exe_cond219
L__exe_cond218:
	BCF        3, 0
L__exe_cond219:
	BTFSS      R2, 0
	GOTO       L__exe_cond220
	BTFSS      3, 0
	GOTO       L__exe_cond220
	BSF        R2, 0
	GOTO       L__exe_cond221
L__exe_cond220:
	BCF        R2, 0
L__exe_cond221:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond222
	BSF        3, 0
	GOTO       L__exe_cond223
L__exe_cond222:
	BCF        3, 0
L__exe_cond223:
	BTFSS      R2, 0
	GOTO       L__exe_cond224
	BTFSS      3, 0
	GOTO       L__exe_cond224
	BSF        R2, 0
	GOTO       L__exe_cond225
L__exe_cond224:
	BCF        R2, 0
L__exe_cond225:
	BTFSS      R2, 0
	GOTO       L_exe_cond49
	GOTO       L_exe_cond48
L_exe_cond49:
;APP_OPSM.c,108 :: 		break;
	GOTO       L_exe_cond33
;APP_OPSM.c,110 :: 		case 13: guc_sec = 0;while(guc_sec < 6  & COND13);
L_exe_cond50:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond51:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond226
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond226:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond227
	BSF        3, 0
	GOTO       L__exe_cond228
L__exe_cond227:
	BCF        3, 0
L__exe_cond228:
	BTFSS      3, 0
	GOTO       L__exe_cond229
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond229
	BSF        R2, 0
	GOTO       L__exe_cond230
L__exe_cond229:
	BCF        R2, 0
L__exe_cond230:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond231
	BSF        3, 0
	GOTO       L__exe_cond232
L__exe_cond231:
	BCF        3, 0
L__exe_cond232:
	BTFSS      R2, 0
	GOTO       L__exe_cond233
	BTFSS      3, 0
	GOTO       L__exe_cond233
	BSF        R2, 0
	GOTO       L__exe_cond234
L__exe_cond233:
	BCF        R2, 0
L__exe_cond234:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond235
	BSF        3, 0
	GOTO       L__exe_cond236
L__exe_cond235:
	BCF        3, 0
L__exe_cond236:
	BTFSS      R2, 0
	GOTO       L__exe_cond237
	BTFSS      3, 0
	GOTO       L__exe_cond237
	BSF        R2, 0
	GOTO       L__exe_cond238
L__exe_cond237:
	BCF        R2, 0
L__exe_cond238:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond52
	GOTO       L_exe_cond51
L_exe_cond52:
;APP_OPSM.c,111 :: 		if((!SEAT_SWITCH)&(!HAND_BRAKE)&(PTO))
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond239
	BSF        R2, 0
	GOTO       L__exe_cond240
L__exe_cond239:
	BCF        R2, 0
L__exe_cond240:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond241
	BSF        3, 0
	GOTO       L__exe_cond242
L__exe_cond241:
	BCF        3, 0
L__exe_cond242:
	BTFSS      R2, 0
	GOTO       L__exe_cond243
	BTFSS      3, 0
	GOTO       L__exe_cond243
	BSF        R2, 0
	GOTO       L__exe_cond244
L__exe_cond243:
	BCF        R2, 0
L__exe_cond244:
	BTFSS      R2, 0
	GOTO       L__exe_cond245
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond245
	BSF        3, 0
	GOTO       L__exe_cond246
L__exe_cond245:
	BCF        3, 0
L__exe_cond246:
	BTFSS      3, 0
	GOTO       L_exe_cond53
;APP_OPSM.c,113 :: 		guc_sec = 0; guc_buzz_state = 1 ; buz_fl = 0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	CLRF       _buz_fl+0
;APP_OPSM.c,114 :: 		RELAY_SOL = 1; while(guc_sec < 6);
	BSF        PORTC+0, 5
L_exe_cond54:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond247
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond247:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond55
	GOTO       L_exe_cond54
L_exe_cond55:
;APP_OPSM.c,115 :: 		Chk_HB();
	CALL       _Chk_HB+0
;APP_OPSM.c,116 :: 		}
L_exe_cond53:
;APP_OPSM.c,117 :: 		break;
	GOTO       L_exe_cond33
;APP_OPSM.c,119 :: 		case 14: guc_sec = 0;while(guc_sec < 6  & COND14);
L_exe_cond56:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond57:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond248
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond248:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond249
	BSF        3, 0
	GOTO       L__exe_cond250
L__exe_cond249:
	BCF        3, 0
L__exe_cond250:
	BTFSS      3, 0
	GOTO       L__exe_cond251
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond251
	BSF        R2, 0
	GOTO       L__exe_cond252
L__exe_cond251:
	BCF        R2, 0
L__exe_cond252:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond253
	BSF        3, 0
	GOTO       L__exe_cond254
L__exe_cond253:
	BCF        3, 0
L__exe_cond254:
	BTFSS      R2, 0
	GOTO       L__exe_cond255
	BTFSS      3, 0
	GOTO       L__exe_cond255
	BSF        R2, 0
	GOTO       L__exe_cond256
L__exe_cond255:
	BCF        R2, 0
L__exe_cond256:
	BTFSS      R2, 0
	GOTO       L__exe_cond257
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond257
	BSF        3, 0
	GOTO       L__exe_cond258
L__exe_cond257:
	BCF        3, 0
L__exe_cond258:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond58
	GOTO       L_exe_cond57
L_exe_cond58:
;APP_OPSM.c,120 :: 		if((!SEAT_SWITCH)&(HAND_BRAKE)&(PTO))
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond259
	BSF        3, 0
	GOTO       L__exe_cond260
L__exe_cond259:
	BCF        3, 0
L__exe_cond260:
	BTFSS      3, 0
	GOTO       L__exe_cond261
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond261
	BSF        R2, 0
	GOTO       L__exe_cond262
L__exe_cond261:
	BCF        R2, 0
L__exe_cond262:
	BTFSS      R2, 0
	GOTO       L__exe_cond263
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond263
	BSF        3, 0
	GOTO       L__exe_cond264
L__exe_cond263:
	BCF        3, 0
L__exe_cond264:
	BTFSS      3, 0
	GOTO       L_exe_cond59
;APP_OPSM.c,122 :: 		guc_sec = 0;RELAY_SOL = 1;while(guc_sec < 6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond60:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond265
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond265:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond61
	GOTO       L_exe_cond60
L_exe_cond61:
;APP_OPSM.c,123 :: 		Chk_HB();
	CALL       _Chk_HB+0
;APP_OPSM.c,124 :: 		}
L_exe_cond59:
;APP_OPSM.c,125 :: 		break;
	GOTO       L_exe_cond33
;APP_OPSM.c,168 :: 		default: break;
L_exe_cond62:
	GOTO       L_exe_cond33
;APP_OPSM.c,169 :: 		}
L_exe_cond32:
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond34
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond39
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond43
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond45
	MOVF       _guc_choice+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond50
	MOVF       _guc_choice+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond56
	GOTO       L_exe_cond62
L_exe_cond33:
;APP_OPSM.c,170 :: 		reset_all();
	CALL       _reset_all+0
;APP_OPSM.c,171 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,174 :: 		void sys_init()
;APP_OPSM.c,176 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,178 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,179 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,180 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,181 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,183 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,184 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,185 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,186 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,188 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,189 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,191 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,192 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,194 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,199 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP_OPSM.c,202 :: 		void main()
;APP_OPSM.c,204 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,205 :: 		while(1)
L_main63:
;APP_OPSM.c,207 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,208 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main65
;APP_OPSM.c,210 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,211 :: 		}
L_main65:
;APP_OPSM.c,212 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,213 :: 		}
	GOTO       L_main63
;APP_OPSM.c,214 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
