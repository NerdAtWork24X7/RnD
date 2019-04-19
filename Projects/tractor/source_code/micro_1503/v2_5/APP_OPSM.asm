
_interrupt:

;APP_OPSM.c,9 :: 		void interrupt()
;APP_OPSM.c,11 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,12 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt61:
;APP_OPSM.c,14 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,15 :: 		}
L_interrupt2:
;APP_OPSM.c,17 :: 		}
L_end_interrupt:
L__interrupt64:
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
L__CHCK_COND62:
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
	GOTO       L__CHCK_COND66
	MOVF       R1, 0
	SUBLW      50
L__CHCK_COND66:
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
	GOTO       L__check_cond68
	BSF        3, 0
	GOTO       L__check_cond69
L__check_cond68:
	BCF        3, 0
L__check_cond69:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond70
	BTFSS      3, 0
	GOTO       L__check_cond70
	BSF        R0, 0
	GOTO       L__check_cond71
L__check_cond70:
	BCF        R0, 0
L__check_cond71:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond72
	BSF        3, 0
	GOTO       L__check_cond73
L__check_cond72:
	BCF        3, 0
L__check_cond73:
	BTFSS      R0, 0
	GOTO       L__check_cond74
	BTFSS      3, 0
	GOTO       L__check_cond74
	BSF        R0, 0
	GOTO       L__check_cond75
L__check_cond74:
	BCF        R0, 0
L__check_cond75:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond76
	BSF        3, 0
	GOTO       L__check_cond77
L__check_cond76:
	BCF        3, 0
L__check_cond77:
	BTFSS      R0, 0
	GOTO       L__check_cond78
	BTFSS      3, 0
	GOTO       L__check_cond78
	BSF        R0, 0
	GOTO       L__check_cond79
L__check_cond78:
	BCF        R0, 0
L__check_cond79:
	BTFSS      R0, 0
	GOTO       L_check_cond9
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond10
L_check_cond9:
;APP_OPSM.c,35 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond80
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond80
	BSF        R0, 0
	GOTO       L__check_cond81
L__check_cond80:
	BCF        R0, 0
L__check_cond81:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond82
	BSF        3, 0
	GOTO       L__check_cond83
L__check_cond82:
	BCF        3, 0
L__check_cond83:
	BTFSS      R0, 0
	GOTO       L__check_cond84
	BTFSS      3, 0
	GOTO       L__check_cond84
	BSF        R0, 0
	GOTO       L__check_cond85
L__check_cond84:
	BCF        R0, 0
L__check_cond85:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond86
	BSF        3, 0
	GOTO       L__check_cond87
L__check_cond86:
	BCF        3, 0
L__check_cond87:
	BTFSS      R0, 0
	GOTO       L__check_cond88
	BTFSS      3, 0
	GOTO       L__check_cond88
	BSF        R0, 0
	GOTO       L__check_cond89
L__check_cond88:
	BCF        R0, 0
L__check_cond89:
	BTFSS      R0, 0
	GOTO       L_check_cond11
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond12
L_check_cond11:
;APP_OPSM.c,36 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond90
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond90
	BSF        R0, 0
	GOTO       L__check_cond91
L__check_cond90:
	BCF        R0, 0
L__check_cond91:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond92
	BSF        3, 0
	GOTO       L__check_cond93
L__check_cond92:
	BCF        3, 0
L__check_cond93:
	BTFSS      R0, 0
	GOTO       L__check_cond94
	BTFSS      3, 0
	GOTO       L__check_cond94
	BSF        R0, 0
	GOTO       L__check_cond95
L__check_cond94:
	BCF        R0, 0
L__check_cond95:
	BTFSS      R0, 0
	GOTO       L__check_cond96
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond96
	BSF        3, 0
	GOTO       L__check_cond97
L__check_cond96:
	BCF        3, 0
L__check_cond97:
	BTFSS      3, 0
	GOTO       L_check_cond13
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond14
L_check_cond13:
;APP_OPSM.c,39 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond98
	BSF        R0, 0
	GOTO       L__check_cond99
L__check_cond98:
	BCF        R0, 0
L__check_cond99:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond100
	BSF        3, 0
	GOTO       L__check_cond101
L__check_cond100:
	BCF        3, 0
L__check_cond101:
	BTFSS      R0, 0
	GOTO       L__check_cond102
	BTFSS      3, 0
	GOTO       L__check_cond102
	BSF        R0, 0
	GOTO       L__check_cond103
L__check_cond102:
	BCF        R0, 0
L__check_cond103:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond104
	BSF        3, 0
	GOTO       L__check_cond105
L__check_cond104:
	BCF        3, 0
L__check_cond105:
	BTFSS      R0, 0
	GOTO       L__check_cond106
	BTFSS      3, 0
	GOTO       L__check_cond106
	BSF        R0, 0
	GOTO       L__check_cond107
L__check_cond106:
	BCF        R0, 0
L__check_cond107:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond108
	BSF        3, 0
	GOTO       L__check_cond109
L__check_cond108:
	BCF        3, 0
L__check_cond109:
	BTFSS      R0, 0
	GOTO       L__check_cond110
	BTFSS      3, 0
	GOTO       L__check_cond110
	BSF        R0, 0
	GOTO       L__check_cond111
L__check_cond110:
	BCF        R0, 0
L__check_cond111:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond16
L_check_cond15:
;APP_OPSM.c,43 :: 		else if(COND13){ CHCK_COND(13); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond112
	BSF        3, 0
	GOTO       L__check_cond113
L__check_cond112:
	BCF        3, 0
L__check_cond113:
	BTFSS      3, 0
	GOTO       L__check_cond114
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond114
	BSF        R0, 0
	GOTO       L__check_cond115
L__check_cond114:
	BCF        R0, 0
L__check_cond115:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond116
	BSF        3, 0
	GOTO       L__check_cond117
L__check_cond116:
	BCF        3, 0
L__check_cond117:
	BTFSS      R0, 0
	GOTO       L__check_cond118
	BTFSS      3, 0
	GOTO       L__check_cond118
	BSF        R0, 0
	GOTO       L__check_cond119
L__check_cond118:
	BCF        R0, 0
L__check_cond119:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond120
	BSF        3, 0
	GOTO       L__check_cond121
L__check_cond120:
	BCF        3, 0
L__check_cond121:
	BTFSS      R0, 0
	GOTO       L__check_cond122
	BTFSS      3, 0
	GOTO       L__check_cond122
	BSF        R0, 0
	GOTO       L__check_cond123
L__check_cond122:
	BCF        R0, 0
L__check_cond123:
	BTFSS      R0, 0
	GOTO       L_check_cond17
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond18
L_check_cond17:
;APP_OPSM.c,44 :: 		else if(COND14){ CHCK_COND(14); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond124
	BSF        3, 0
	GOTO       L__check_cond125
L__check_cond124:
	BCF        3, 0
L__check_cond125:
	BTFSS      3, 0
	GOTO       L__check_cond126
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond126
	BSF        R0, 0
	GOTO       L__check_cond127
L__check_cond126:
	BCF        R0, 0
L__check_cond127:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond128
	BSF        3, 0
	GOTO       L__check_cond129
L__check_cond128:
	BCF        3, 0
L__check_cond129:
	BTFSS      R0, 0
	GOTO       L__check_cond130
	BTFSS      3, 0
	GOTO       L__check_cond130
	BSF        R0, 0
	GOTO       L__check_cond131
L__check_cond130:
	BCF        R0, 0
L__check_cond131:
	BTFSS      R0, 0
	GOTO       L__check_cond132
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond132
	BSF        3, 0
	GOTO       L__check_cond133
L__check_cond132:
	BCF        3, 0
L__check_cond133:
	BTFSS      3, 0
	GOTO       L_check_cond19
	MOVLW      14
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond20
L_check_cond19:
;APP_OPSM.c,47 :: 		else {guc_choice = (TOTAL_COND);}
	MOVLW      18
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
;APP_OPSM.c,69 :: 		while(deb_cnt < 200)
L_Chk_HB21:
	MOVLW      200
	SUBWF      Chk_HB_deb_cnt_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Chk_HB22
;APP_OPSM.c,71 :: 		(HAND_BRAKE == 0)?(guc_buzz_state = 1):(guc_buzz_state = 0);
	BTFSC      PORTC+0, 0
	GOTO       L_Chk_HB23
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	MOVF       _guc_buzz_state+0, 0
	MOVWF      R2+0
	GOTO       L_Chk_HB24
L_Chk_HB23:
	CLRF       _guc_buzz_state+0
	MOVF       _guc_buzz_state+0, 0
	MOVWF      R2+0
L_Chk_HB24:
;APP_OPSM.c,81 :: 		(COND16 == 0)? (deb_cnt++) : (deb_cnt=0);
	BTFSS      PORTC+0, 2
	GOTO       L_Chk_HB25
	MOVF       Chk_HB_deb_cnt_L0+0, 0
	MOVWF      R1
	INCF       Chk_HB_deb_cnt_L0+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      Chk_HB_deb_cnt_L0+0
	MOVF       R1, 0
	MOVWF      R3+0
	GOTO       L_Chk_HB26
L_Chk_HB25:
	CLRF       Chk_HB_deb_cnt_L0+0
	MOVF       Chk_HB_deb_cnt_L0+0, 0
	MOVWF      R3+0
L_Chk_HB26:
;APP_OPSM.c,82 :: 		}
	GOTO       L_Chk_HB21
L_Chk_HB22:
;APP_OPSM.c,83 :: 		}
L_end_Chk_HB:
	RETURN
; end of _Chk_HB

_exe_cond:

;APP_OPSM.c,85 :: 		void exe_cond()
;APP_OPSM.c,87 :: 		buz_fl = 1;
	MOVLW      1
	MOVWF      _buz_fl+0
;APP_OPSM.c,88 :: 		Soft_UART_Write((guc_choice+48));
	MOVLW      48
	ADDWF      _guc_choice+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP_OPSM.c,89 :: 		switch(guc_choice)
	GOTO       L_exe_cond27
;APP_OPSM.c,91 :: 		case 1: guc_sec = 0; while(guc_sec<6 & COND1);
L_exe_cond29:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond30:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond137
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond137:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond138
	BSF        3, 0
	GOTO       L__exe_cond139
L__exe_cond138:
	BCF        3, 0
L__exe_cond139:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond140
	BTFSS      3, 0
	GOTO       L__exe_cond140
	BSF        R2, 0
	GOTO       L__exe_cond141
L__exe_cond140:
	BCF        R2, 0
L__exe_cond141:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond142
	BSF        3, 0
	GOTO       L__exe_cond143
L__exe_cond142:
	BCF        3, 0
L__exe_cond143:
	BTFSS      R2, 0
	GOTO       L__exe_cond144
	BTFSS      3, 0
	GOTO       L__exe_cond144
	BSF        R2, 0
	GOTO       L__exe_cond145
L__exe_cond144:
	BCF        R2, 0
L__exe_cond145:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond146
	BSF        3, 0
	GOTO       L__exe_cond147
L__exe_cond146:
	BCF        3, 0
L__exe_cond147:
	BTFSS      R2, 0
	GOTO       L__exe_cond148
	BTFSS      3, 0
	GOTO       L__exe_cond148
	BSF        R2, 0
	GOTO       L__exe_cond149
L__exe_cond148:
	BCF        R2, 0
L__exe_cond149:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond31
	GOTO       L_exe_cond30
L_exe_cond31:
;APP_OPSM.c,92 :: 		guc_buzz_state=1; while(COND1);
	MOVLW      1
	MOVWF      _guc_buzz_state+0
L_exe_cond32:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond150
	BSF        3, 0
	GOTO       L__exe_cond151
L__exe_cond150:
	BCF        3, 0
L__exe_cond151:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond152
	BTFSS      3, 0
	GOTO       L__exe_cond152
	BSF        R2, 0
	GOTO       L__exe_cond153
L__exe_cond152:
	BCF        R2, 0
L__exe_cond153:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond154
	BSF        3, 0
	GOTO       L__exe_cond155
L__exe_cond154:
	BCF        3, 0
L__exe_cond155:
	BTFSS      R2, 0
	GOTO       L__exe_cond156
	BTFSS      3, 0
	GOTO       L__exe_cond156
	BSF        R2, 0
	GOTO       L__exe_cond157
L__exe_cond156:
	BCF        R2, 0
L__exe_cond157:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond158
	BSF        3, 0
	GOTO       L__exe_cond159
L__exe_cond158:
	BCF        3, 0
L__exe_cond159:
	BTFSS      R2, 0
	GOTO       L__exe_cond160
	BTFSS      3, 0
	GOTO       L__exe_cond160
	BSF        R2, 0
	GOTO       L__exe_cond161
L__exe_cond160:
	BCF        R2, 0
L__exe_cond161:
	BTFSS      R2, 0
	GOTO       L_exe_cond33
	GOTO       L_exe_cond32
L_exe_cond33:
;APP_OPSM.c,93 :: 		break;
	GOTO       L_exe_cond28
;APP_OPSM.c,95 :: 		case 5: RELAY_SOL = 1; guc_sec = 0; while(guc_sec<6 & COND5);
L_exe_cond34:
	BSF        PORTC+0, 5
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond35:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond162
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond162:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond163
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond163
	BSF        R2, 0
	GOTO       L__exe_cond164
L__exe_cond163:
	BCF        R2, 0
L__exe_cond164:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond165
	BSF        3, 0
	GOTO       L__exe_cond166
L__exe_cond165:
	BCF        3, 0
L__exe_cond166:
	BTFSS      R2, 0
	GOTO       L__exe_cond167
	BTFSS      3, 0
	GOTO       L__exe_cond167
	BSF        R2, 0
	GOTO       L__exe_cond168
L__exe_cond167:
	BCF        R2, 0
L__exe_cond168:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond169
	BSF        3, 0
	GOTO       L__exe_cond170
L__exe_cond169:
	BCF        3, 0
L__exe_cond170:
	BTFSS      R2, 0
	GOTO       L__exe_cond171
	BTFSS      3, 0
	GOTO       L__exe_cond171
	BSF        R2, 0
	GOTO       L__exe_cond172
L__exe_cond171:
	BCF        R2, 0
L__exe_cond172:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond36
	GOTO       L_exe_cond35
L_exe_cond36:
;APP_OPSM.c,96 :: 		if((!SEAT_SWITCH)&(!HAND_BRAKE)&(PTO))
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond173
	BSF        R2, 0
	GOTO       L__exe_cond174
L__exe_cond173:
	BCF        R2, 0
L__exe_cond174:
	BTFSC      PORTC+0, 0
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
	BTFSS      R2, 0
	GOTO       L__exe_cond179
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond179
	BSF        3, 0
	GOTO       L__exe_cond180
L__exe_cond179:
	BCF        3, 0
L__exe_cond180:
	BTFSS      3, 0
	GOTO       L_exe_cond37
;APP_OPSM.c,98 :: 		Chk_HB();
	CALL       _Chk_HB+0
;APP_OPSM.c,99 :: 		}
L_exe_cond37:
;APP_OPSM.c,100 :: 		break;
	GOTO       L_exe_cond28
;APP_OPSM.c,102 :: 		case 6: if((!SEAT_SWITCH)&(HAND_BRAKE)&(PTO))
L_exe_cond38:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond181
	BSF        3, 0
	GOTO       L__exe_cond182
L__exe_cond181:
	BCF        3, 0
L__exe_cond182:
	BTFSS      3, 0
	GOTO       L__exe_cond183
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond183
	BSF        R2, 0
	GOTO       L__exe_cond184
L__exe_cond183:
	BCF        R2, 0
L__exe_cond184:
	BTFSS      R2, 0
	GOTO       L__exe_cond185
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond185
	BSF        3, 0
	GOTO       L__exe_cond186
L__exe_cond185:
	BCF        3, 0
L__exe_cond186:
	BTFSS      3, 0
	GOTO       L_exe_cond39
;APP_OPSM.c,104 :: 		RELAY_SOL = 1;
	BSF        PORTC+0, 5
;APP_OPSM.c,105 :: 		Chk_HB();
	CALL       _Chk_HB+0
;APP_OPSM.c,106 :: 		}
L_exe_cond39:
;APP_OPSM.c,107 :: 		break;
	GOTO       L_exe_cond28
;APP_OPSM.c,109 :: 		case 9: guc_sec = 0; while(guc_sec < 6 & COND9);
L_exe_cond40:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond41:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond187
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond187:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond188
	BSF        R2, 0
	GOTO       L__exe_cond189
L__exe_cond188:
	BCF        R2, 0
L__exe_cond189:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond190
	BSF        3, 0
	GOTO       L__exe_cond191
L__exe_cond190:
	BCF        3, 0
L__exe_cond191:
	BTFSS      R2, 0
	GOTO       L__exe_cond192
	BTFSS      3, 0
	GOTO       L__exe_cond192
	BSF        R2, 0
	GOTO       L__exe_cond193
L__exe_cond192:
	BCF        R2, 0
L__exe_cond193:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond194
	BSF        3, 0
	GOTO       L__exe_cond195
L__exe_cond194:
	BCF        3, 0
L__exe_cond195:
	BTFSS      R2, 0
	GOTO       L__exe_cond196
	BTFSS      3, 0
	GOTO       L__exe_cond196
	BSF        R2, 0
	GOTO       L__exe_cond197
L__exe_cond196:
	BCF        R2, 0
L__exe_cond197:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond198
	BSF        3, 0
	GOTO       L__exe_cond199
L__exe_cond198:
	BCF        3, 0
L__exe_cond199:
	BTFSS      R2, 0
	GOTO       L__exe_cond200
	BTFSS      3, 0
	GOTO       L__exe_cond200
	BSF        R2, 0
	GOTO       L__exe_cond201
L__exe_cond200:
	BCF        R2, 0
L__exe_cond201:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond42
	GOTO       L_exe_cond41
L_exe_cond42:
;APP_OPSM.c,110 :: 		guc_buzz_state = 1; while(COND9);
	MOVLW      1
	MOVWF      _guc_buzz_state+0
L_exe_cond43:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond202
	BSF        R2, 0
	GOTO       L__exe_cond203
L__exe_cond202:
	BCF        R2, 0
L__exe_cond203:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond212
	BSF        3, 0
	GOTO       L__exe_cond213
L__exe_cond212:
	BCF        3, 0
L__exe_cond213:
	BTFSS      R2, 0
	GOTO       L__exe_cond214
	BTFSS      3, 0
	GOTO       L__exe_cond214
	BSF        R2, 0
	GOTO       L__exe_cond215
L__exe_cond214:
	BCF        R2, 0
L__exe_cond215:
	BTFSS      R2, 0
	GOTO       L_exe_cond44
	GOTO       L_exe_cond43
L_exe_cond44:
;APP_OPSM.c,111 :: 		break;
	GOTO       L_exe_cond28
;APP_OPSM.c,113 :: 		case 13: guc_sec = 0;while(guc_sec < 6  & COND13);
L_exe_cond45:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond46:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond216
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond216:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond217
	BSF        3, 0
	GOTO       L__exe_cond218
L__exe_cond217:
	BCF        3, 0
L__exe_cond218:
	BTFSS      3, 0
	GOTO       L__exe_cond219
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond219
	BSF        R2, 0
	GOTO       L__exe_cond220
L__exe_cond219:
	BCF        R2, 0
L__exe_cond220:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond221
	BSF        3, 0
	GOTO       L__exe_cond222
L__exe_cond221:
	BCF        3, 0
L__exe_cond222:
	BTFSS      R2, 0
	GOTO       L__exe_cond223
	BTFSS      3, 0
	GOTO       L__exe_cond223
	BSF        R2, 0
	GOTO       L__exe_cond224
L__exe_cond223:
	BCF        R2, 0
L__exe_cond224:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond225
	BSF        3, 0
	GOTO       L__exe_cond226
L__exe_cond225:
	BCF        3, 0
L__exe_cond226:
	BTFSS      R2, 0
	GOTO       L__exe_cond227
	BTFSS      3, 0
	GOTO       L__exe_cond227
	BSF        R2, 0
	GOTO       L__exe_cond228
L__exe_cond227:
	BCF        R2, 0
L__exe_cond228:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond47
	GOTO       L_exe_cond46
L_exe_cond47:
;APP_OPSM.c,114 :: 		if((!SEAT_SWITCH)&(!HAND_BRAKE)&(PTO))
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond229
	BSF        R2, 0
	GOTO       L__exe_cond230
L__exe_cond229:
	BCF        R2, 0
L__exe_cond230:
	BTFSC      PORTC+0, 0
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
	BTFSS      R2, 0
	GOTO       L__exe_cond235
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond235
	BSF        3, 0
	GOTO       L__exe_cond236
L__exe_cond235:
	BCF        3, 0
L__exe_cond236:
	BTFSS      3, 0
	GOTO       L_exe_cond48
;APP_OPSM.c,116 :: 		guc_sec = 0; guc_buzz_state = 1 ; buz_fl = 0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	CLRF       _buz_fl+0
;APP_OPSM.c,117 :: 		RELAY_SOL = 1; while(guc_sec < 6);
	BSF        PORTC+0, 5
L_exe_cond49:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond237
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond237:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond50
	GOTO       L_exe_cond49
L_exe_cond50:
;APP_OPSM.c,118 :: 		Chk_HB();
	CALL       _Chk_HB+0
;APP_OPSM.c,119 :: 		}
L_exe_cond48:
;APP_OPSM.c,120 :: 		break;
	GOTO       L_exe_cond28
;APP_OPSM.c,122 :: 		case 14: guc_sec = 0;while(guc_sec < 6  & COND14);
L_exe_cond51:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond52:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond238
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond238:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond239
	BSF        3, 0
	GOTO       L__exe_cond240
L__exe_cond239:
	BCF        3, 0
L__exe_cond240:
	BTFSS      3, 0
	GOTO       L__exe_cond241
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond241
	BSF        R2, 0
	GOTO       L__exe_cond242
L__exe_cond241:
	BCF        R2, 0
L__exe_cond242:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond243
	BSF        3, 0
	GOTO       L__exe_cond244
L__exe_cond243:
	BCF        3, 0
L__exe_cond244:
	BTFSS      R2, 0
	GOTO       L__exe_cond245
	BTFSS      3, 0
	GOTO       L__exe_cond245
	BSF        R2, 0
	GOTO       L__exe_cond246
L__exe_cond245:
	BCF        R2, 0
L__exe_cond246:
	BTFSS      R2, 0
	GOTO       L__exe_cond247
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond247
	BSF        3, 0
	GOTO       L__exe_cond248
L__exe_cond247:
	BCF        3, 0
L__exe_cond248:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond53
	GOTO       L_exe_cond52
L_exe_cond53:
;APP_OPSM.c,123 :: 		if((!SEAT_SWITCH)&(HAND_BRAKE)&(PTO))
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond249
	BSF        3, 0
	GOTO       L__exe_cond250
L__exe_cond249:
	BCF        3, 0
L__exe_cond250:
	BTFSS      3, 0
	GOTO       L__exe_cond251
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond251
	BSF        R2, 0
	GOTO       L__exe_cond252
L__exe_cond251:
	BCF        R2, 0
L__exe_cond252:
	BTFSS      R2, 0
	GOTO       L__exe_cond253
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond253
	BSF        3, 0
	GOTO       L__exe_cond254
L__exe_cond253:
	BCF        3, 0
L__exe_cond254:
	BTFSS      3, 0
	GOTO       L_exe_cond54
;APP_OPSM.c,125 :: 		guc_sec = 0;RELAY_SOL = 1;while(guc_sec < 6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond55:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond255
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond255:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond56
	GOTO       L_exe_cond55
L_exe_cond56:
;APP_OPSM.c,126 :: 		Chk_HB();
	CALL       _Chk_HB+0
;APP_OPSM.c,127 :: 		}
L_exe_cond54:
;APP_OPSM.c,128 :: 		break;
	GOTO       L_exe_cond28
;APP_OPSM.c,171 :: 		default: break;
L_exe_cond57:
	GOTO       L_exe_cond28
;APP_OPSM.c,172 :: 		}
L_exe_cond27:
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond29
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond34
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond38
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond40
	MOVF       _guc_choice+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond45
	MOVF       _guc_choice+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond51
	GOTO       L_exe_cond57
L_exe_cond28:
;APP_OPSM.c,173 :: 		reset_all();
	CALL       _reset_all+0
;APP_OPSM.c,174 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,177 :: 		void sys_init()
;APP_OPSM.c,179 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,181 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,182 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,183 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,184 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,186 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,187 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,188 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,189 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,191 :: 		reset_all();
	CALL       _reset_all+0
;APP_OPSM.c,193 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,194 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,196 :: 		Soft_UART_Init(&PORTA, 1, 0, 9600, 0); // Initialize Soft UART at 14400 bps
	MOVLW      PORTA+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      1
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	CLRF       FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
;APP_OPSM.c,198 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,203 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP_OPSM.c,205 :: 		void main()
;APP_OPSM.c,207 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,208 :: 		Soft_UART_Write('R');
	MOVLW      82
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;APP_OPSM.c,209 :: 		while(1)
L_main58:
;APP_OPSM.c,211 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,212 :: 		if((guc_choice > 0) & (guc_choice < TOTAL_COND))
	MOVF       _guc_choice+0, 0
	SUBLW      0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	MOVLW      18
	SUBWF      _guc_choice+0, 0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_main60
;APP_OPSM.c,214 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,215 :: 		}
L_main60:
;APP_OPSM.c,216 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,217 :: 		}
	GOTO       L_main58
;APP_OPSM.c,218 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
