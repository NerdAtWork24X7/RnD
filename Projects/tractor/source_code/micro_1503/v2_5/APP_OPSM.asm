
_interrupt:

;APP_OPSM.c,8 :: 		void interrupt()
;APP_OPSM.c,10 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,11 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt72:
;APP_OPSM.c,13 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,14 :: 		}
L_interrupt2:
;APP_OPSM.c,16 :: 		}
L_end_interrupt:
L__interrupt75:
	RETFIE     %s
; end of _interrupt

_CHCK_COND:

;APP_OPSM.c,18 :: 		void CHCK_COND(uint8 x)
;APP_OPSM.c,21 :: 		guc_deb[x]++;
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
;APP_OPSM.c,22 :: 		for(i=0;i<=TOTAL_COND && i!=x;i++){guc_deb[i] = 0;}
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
L__CHCK_COND73:
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
;APP_OPSM.c,23 :: 		if(guc_deb[x] > DEBO_TIME){ guc_choice = x; guc_deb[x] = 0;}
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
	GOTO       L__CHCK_COND77
	MOVF       R1, 0
	SUBLW      10
L__CHCK_COND77:
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
;APP_OPSM.c,24 :: 		}
L_end_CHCK_COND:
	RETURN
; end of _CHCK_COND

_check_cond:

;APP_OPSM.c,27 :: 		void check_cond()
;APP_OPSM.c,29 :: 		guc_choice = 0;
	CLRF       _guc_choice+0
;APP_OPSM.c,30 :: 		if(COND1){ CHCK_COND(1); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond79
	BSF        3, 0
	GOTO       L__check_cond80
L__check_cond79:
	BCF        3, 0
L__check_cond80:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond81
	BTFSS      3, 0
	GOTO       L__check_cond81
	BSF        R0, 0
	GOTO       L__check_cond82
L__check_cond81:
	BCF        R0, 0
L__check_cond82:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond83
	BSF        3, 0
	GOTO       L__check_cond84
L__check_cond83:
	BCF        3, 0
L__check_cond84:
	BTFSS      R0, 0
	GOTO       L__check_cond85
	BTFSS      3, 0
	GOTO       L__check_cond85
	BSF        R0, 0
	GOTO       L__check_cond86
L__check_cond85:
	BCF        R0, 0
L__check_cond86:
	BTFSC      PORTC+0, 0
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
	BTFSS      R0, 0
	GOTO       L_check_cond9
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond10
L_check_cond9:
;APP_OPSM.c,34 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond91
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond91
	BSF        R0, 0
	GOTO       L__check_cond92
L__check_cond91:
	BCF        R0, 0
L__check_cond92:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond93
	BSF        3, 0
	GOTO       L__check_cond94
L__check_cond93:
	BCF        3, 0
L__check_cond94:
	BTFSS      R0, 0
	GOTO       L__check_cond95
	BTFSS      3, 0
	GOTO       L__check_cond95
	BSF        R0, 0
	GOTO       L__check_cond96
L__check_cond95:
	BCF        R0, 0
L__check_cond96:
	BTFSC      PORTC+0, 0
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
	GOTO       L_check_cond11
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond12
L_check_cond11:
;APP_OPSM.c,35 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond101
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond101
	BSF        R0, 0
	GOTO       L__check_cond102
L__check_cond101:
	BCF        R0, 0
L__check_cond102:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond103
	BSF        3, 0
	GOTO       L__check_cond104
L__check_cond103:
	BCF        3, 0
L__check_cond104:
	BTFSS      R0, 0
	GOTO       L__check_cond105
	BTFSS      3, 0
	GOTO       L__check_cond105
	BSF        R0, 0
	GOTO       L__check_cond106
L__check_cond105:
	BCF        R0, 0
L__check_cond106:
	BTFSS      R0, 0
	GOTO       L__check_cond107
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond107
	BSF        3, 0
	GOTO       L__check_cond108
L__check_cond107:
	BCF        3, 0
L__check_cond108:
	BTFSS      3, 0
	GOTO       L_check_cond13
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond14
L_check_cond13:
;APP_OPSM.c,38 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond109
	BSF        R0, 0
	GOTO       L__check_cond110
L__check_cond109:
	BCF        R0, 0
L__check_cond110:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond111
	BSF        3, 0
	GOTO       L__check_cond112
L__check_cond111:
	BCF        3, 0
L__check_cond112:
	BTFSS      R0, 0
	GOTO       L__check_cond113
	BTFSS      3, 0
	GOTO       L__check_cond113
	BSF        R0, 0
	GOTO       L__check_cond114
L__check_cond113:
	BCF        R0, 0
L__check_cond114:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond115
	BSF        3, 0
	GOTO       L__check_cond116
L__check_cond115:
	BCF        3, 0
L__check_cond116:
	BTFSS      R0, 0
	GOTO       L__check_cond117
	BTFSS      3, 0
	GOTO       L__check_cond117
	BSF        R0, 0
	GOTO       L__check_cond118
L__check_cond117:
	BCF        R0, 0
L__check_cond118:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond119
	BSF        3, 0
	GOTO       L__check_cond120
L__check_cond119:
	BCF        3, 0
L__check_cond120:
	BTFSS      R0, 0
	GOTO       L__check_cond121
	BTFSS      3, 0
	GOTO       L__check_cond121
	BSF        R0, 0
	GOTO       L__check_cond122
L__check_cond121:
	BCF        R0, 0
L__check_cond122:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond16
L_check_cond15:
;APP_OPSM.c,42 :: 		else if(COND13){ CHCK_COND(13); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond123
	BSF        3, 0
	GOTO       L__check_cond124
L__check_cond123:
	BCF        3, 0
L__check_cond124:
	BTFSS      3, 0
	GOTO       L__check_cond125
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond125
	BSF        R0, 0
	GOTO       L__check_cond126
L__check_cond125:
	BCF        R0, 0
L__check_cond126:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond127
	BSF        3, 0
	GOTO       L__check_cond128
L__check_cond127:
	BCF        3, 0
L__check_cond128:
	BTFSS      R0, 0
	GOTO       L__check_cond129
	BTFSS      3, 0
	GOTO       L__check_cond129
	BSF        R0, 0
	GOTO       L__check_cond130
L__check_cond129:
	BCF        R0, 0
L__check_cond130:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond131
	BSF        3, 0
	GOTO       L__check_cond132
L__check_cond131:
	BCF        3, 0
L__check_cond132:
	BTFSS      R0, 0
	GOTO       L__check_cond133
	BTFSS      3, 0
	GOTO       L__check_cond133
	BSF        R0, 0
	GOTO       L__check_cond134
L__check_cond133:
	BCF        R0, 0
L__check_cond134:
	BTFSS      R0, 0
	GOTO       L_check_cond17
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond18
L_check_cond17:
;APP_OPSM.c,43 :: 		else if(COND14){ CHCK_COND(14); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond135
	BSF        3, 0
	GOTO       L__check_cond136
L__check_cond135:
	BCF        3, 0
L__check_cond136:
	BTFSS      3, 0
	GOTO       L__check_cond137
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond137
	BSF        R0, 0
	GOTO       L__check_cond138
L__check_cond137:
	BCF        R0, 0
L__check_cond138:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond139
	BSF        3, 0
	GOTO       L__check_cond140
L__check_cond139:
	BCF        3, 0
L__check_cond140:
	BTFSS      R0, 0
	GOTO       L__check_cond141
	BTFSS      3, 0
	GOTO       L__check_cond141
	BSF        R0, 0
	GOTO       L__check_cond142
L__check_cond141:
	BCF        R0, 0
L__check_cond142:
	BTFSS      R0, 0
	GOTO       L__check_cond143
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond143
	BSF        3, 0
	GOTO       L__check_cond144
L__check_cond143:
	BCF        3, 0
L__check_cond144:
	BTFSS      3, 0
	GOTO       L_check_cond19
	MOVLW      14
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond20
L_check_cond19:
;APP_OPSM.c,46 :: 		else {guc_choice = (TOTAL_COND - 1);}
	MOVLW      17
	MOVWF      _guc_choice+0
L_check_cond20:
L_check_cond18:
L_check_cond16:
L_check_cond14:
L_check_cond12:
L_check_cond10:
;APP_OPSM.c,47 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_reset_all:

;APP_OPSM.c,49 :: 		void reset_all()
;APP_OPSM.c,51 :: 		guc_togg_half = 0;
	CLRF       _guc_togg_half+0
;APP_OPSM.c,52 :: 		guc_buzz_state = 0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,53 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,54 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,63 :: 		}
L_end_reset_all:
	RETURN
; end of _reset_all

_exe_cond:

;APP_OPSM.c,65 :: 		void exe_cond()
;APP_OPSM.c,68 :: 		switch(guc_choice)
	GOTO       L_exe_cond21
;APP_OPSM.c,70 :: 		case 1: guc_sec = 0; while(guc_sec<6 & COND1);
L_exe_cond23:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond24:
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
	GOTO       L_exe_cond25
	GOTO       L_exe_cond24
L_exe_cond25:
;APP_OPSM.c,71 :: 		if(COND1){ while(COND1){guc_buzz_state=1;}}
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
	GOTO       L_exe_cond26
L_exe_cond27:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond172
	BSF        3, 0
	GOTO       L__exe_cond173
L__exe_cond172:
	BCF        3, 0
L__exe_cond173:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond174
	BTFSS      3, 0
	GOTO       L__exe_cond174
	BSF        R2, 0
	GOTO       L__exe_cond175
L__exe_cond174:
	BCF        R2, 0
L__exe_cond175:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond176
	BSF        3, 0
	GOTO       L__exe_cond177
L__exe_cond176:
	BCF        3, 0
L__exe_cond177:
	BTFSS      R2, 0
	GOTO       L__exe_cond178
	BTFSS      3, 0
	GOTO       L__exe_cond178
	BSF        R2, 0
	GOTO       L__exe_cond179
L__exe_cond178:
	BCF        R2, 0
L__exe_cond179:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond180
	BSF        3, 0
	GOTO       L__exe_cond181
L__exe_cond180:
	BCF        3, 0
L__exe_cond181:
	BTFSS      R2, 0
	GOTO       L__exe_cond182
	BTFSS      3, 0
	GOTO       L__exe_cond182
	BSF        R2, 0
	GOTO       L__exe_cond183
L__exe_cond182:
	BCF        R2, 0
L__exe_cond183:
	BTFSS      R2, 0
	GOTO       L_exe_cond28
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond27
L_exe_cond28:
L_exe_cond26:
;APP_OPSM.c,72 :: 		break;
	GOTO       L_exe_cond22
;APP_OPSM.c,74 :: 		case 5: RELAY_SOL = 1; guc_sec = 0; while(guc_sec<6 & COND5);
L_exe_cond29:
	BSF        PORTC+0, 5
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond30:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond184
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond184:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond185
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond185
	BSF        R2, 0
	GOTO       L__exe_cond186
L__exe_cond185:
	BCF        R2, 0
L__exe_cond186:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond187
	BSF        3, 0
	GOTO       L__exe_cond188
L__exe_cond187:
	BCF        3, 0
L__exe_cond188:
	BTFSS      R2, 0
	GOTO       L__exe_cond189
	BTFSS      3, 0
	GOTO       L__exe_cond189
	BSF        R2, 0
	GOTO       L__exe_cond190
L__exe_cond189:
	BCF        R2, 0
L__exe_cond190:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond191
	BSF        3, 0
	GOTO       L__exe_cond192
L__exe_cond191:
	BCF        3, 0
L__exe_cond192:
	BTFSS      R2, 0
	GOTO       L__exe_cond193
	BTFSS      3, 0
	GOTO       L__exe_cond193
	BSF        R2, 0
	GOTO       L__exe_cond194
L__exe_cond193:
	BCF        R2, 0
L__exe_cond194:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond31
	GOTO       L_exe_cond30
L_exe_cond31:
;APP_OPSM.c,75 :: 		if(COND5){while(COND5){guc_buzz_state=1;}}
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond195
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond195
	BSF        R2, 0
	GOTO       L__exe_cond196
L__exe_cond195:
	BCF        R2, 0
L__exe_cond196:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond197
	BSF        3, 0
	GOTO       L__exe_cond198
L__exe_cond197:
	BCF        3, 0
L__exe_cond198:
	BTFSS      R2, 0
	GOTO       L__exe_cond199
	BTFSS      3, 0
	GOTO       L__exe_cond199
	BSF        R2, 0
	GOTO       L__exe_cond200
L__exe_cond199:
	BCF        R2, 0
L__exe_cond200:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond201
	BSF        3, 0
	GOTO       L__exe_cond202
L__exe_cond201:
	BCF        3, 0
L__exe_cond202:
	BTFSS      R2, 0
	GOTO       L__exe_cond203
	BTFSS      3, 0
	GOTO       L__exe_cond203
	BSF        R2, 0
	GOTO       L__exe_cond204
L__exe_cond203:
	BCF        R2, 0
L__exe_cond204:
	BTFSS      R2, 0
	GOTO       L_exe_cond32
L_exe_cond33:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond205
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond205
	BSF        R2, 0
	GOTO       L__exe_cond206
L__exe_cond205:
	BCF        R2, 0
L__exe_cond206:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond207
	BSF        3, 0
	GOTO       L__exe_cond208
L__exe_cond207:
	BCF        3, 0
L__exe_cond208:
	BTFSS      R2, 0
	GOTO       L__exe_cond209
	BTFSS      3, 0
	GOTO       L__exe_cond209
	BSF        R2, 0
	GOTO       L__exe_cond210
L__exe_cond209:
	BCF        R2, 0
L__exe_cond210:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond211
	BSF        3, 0
	GOTO       L__exe_cond212
L__exe_cond211:
	BCF        3, 0
L__exe_cond212:
	BTFSS      R2, 0
	GOTO       L__exe_cond213
	BTFSS      3, 0
	GOTO       L__exe_cond213
	BSF        R2, 0
	GOTO       L__exe_cond214
L__exe_cond213:
	BCF        R2, 0
L__exe_cond214:
	BTFSS      R2, 0
	GOTO       L_exe_cond34
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond33
L_exe_cond34:
L_exe_cond32:
;APP_OPSM.c,76 :: 		break;
	GOTO       L_exe_cond22
;APP_OPSM.c,78 :: 		case 6: while(COND6){RELAY_SOL = 1; guc_buzz_state = 0;}
L_exe_cond35:
L_exe_cond36:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond215
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond215
	BSF        R2, 0
	GOTO       L__exe_cond216
L__exe_cond215:
	BCF        R2, 0
L__exe_cond216:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond217
	BSF        3, 0
	GOTO       L__exe_cond218
L__exe_cond217:
	BCF        3, 0
L__exe_cond218:
	BTFSS      R2, 0
	GOTO       L__exe_cond219
	BTFSS      3, 0
	GOTO       L__exe_cond219
	BSF        R2, 0
	GOTO       L__exe_cond220
L__exe_cond219:
	BCF        R2, 0
L__exe_cond220:
	BTFSS      R2, 0
	GOTO       L__exe_cond221
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond221
	BSF        3, 0
	GOTO       L__exe_cond222
L__exe_cond221:
	BCF        3, 0
L__exe_cond222:
	BTFSS      3, 0
	GOTO       L_exe_cond37
	BSF        PORTC+0, 5
	CLRF       _guc_buzz_state+0
	GOTO       L_exe_cond36
L_exe_cond37:
;APP_OPSM.c,79 :: 		break;
	GOTO       L_exe_cond22
;APP_OPSM.c,81 :: 		case 9: guc_sec = 0; while(guc_sec < 6 & COND9);
L_exe_cond38:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond39:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond223
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond223:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond224
	BSF        R2, 0
	GOTO       L__exe_cond225
L__exe_cond224:
	BCF        R2, 0
L__exe_cond225:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond226
	BSF        3, 0
	GOTO       L__exe_cond227
L__exe_cond226:
	BCF        3, 0
L__exe_cond227:
	BTFSS      R2, 0
	GOTO       L__exe_cond228
	BTFSS      3, 0
	GOTO       L__exe_cond228
	BSF        R2, 0
	GOTO       L__exe_cond229
L__exe_cond228:
	BCF        R2, 0
L__exe_cond229:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond230
	BSF        3, 0
	GOTO       L__exe_cond231
L__exe_cond230:
	BCF        3, 0
L__exe_cond231:
	BTFSS      R2, 0
	GOTO       L__exe_cond232
	BTFSS      3, 0
	GOTO       L__exe_cond232
	BSF        R2, 0
	GOTO       L__exe_cond233
L__exe_cond232:
	BCF        R2, 0
L__exe_cond233:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond234
	BSF        3, 0
	GOTO       L__exe_cond235
L__exe_cond234:
	BCF        3, 0
L__exe_cond235:
	BTFSS      R2, 0
	GOTO       L__exe_cond236
	BTFSS      3, 0
	GOTO       L__exe_cond236
	BSF        R2, 0
	GOTO       L__exe_cond237
L__exe_cond236:
	BCF        R2, 0
L__exe_cond237:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond40
	GOTO       L_exe_cond39
L_exe_cond40:
;APP_OPSM.c,82 :: 		if(COND9){ while(COND9){guc_buzz_state = 1;}}
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond238
	BSF        R2, 0
	GOTO       L__exe_cond239
L__exe_cond238:
	BCF        R2, 0
L__exe_cond239:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond240
	BSF        3, 0
	GOTO       L__exe_cond241
L__exe_cond240:
	BCF        3, 0
L__exe_cond241:
	BTFSS      R2, 0
	GOTO       L__exe_cond242
	BTFSS      3, 0
	GOTO       L__exe_cond242
	BSF        R2, 0
	GOTO       L__exe_cond243
L__exe_cond242:
	BCF        R2, 0
L__exe_cond243:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond244
	BSF        3, 0
	GOTO       L__exe_cond245
L__exe_cond244:
	BCF        3, 0
L__exe_cond245:
	BTFSS      R2, 0
	GOTO       L__exe_cond246
	BTFSS      3, 0
	GOTO       L__exe_cond246
	BSF        R2, 0
	GOTO       L__exe_cond247
L__exe_cond246:
	BCF        R2, 0
L__exe_cond247:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond248
	BSF        3, 0
	GOTO       L__exe_cond249
L__exe_cond248:
	BCF        3, 0
L__exe_cond249:
	BTFSS      R2, 0
	GOTO       L__exe_cond250
	BTFSS      3, 0
	GOTO       L__exe_cond250
	BSF        R2, 0
	GOTO       L__exe_cond251
L__exe_cond250:
	BCF        R2, 0
L__exe_cond251:
	BTFSS      R2, 0
	GOTO       L_exe_cond41
L_exe_cond42:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond252
	BSF        R2, 0
	GOTO       L__exe_cond253
L__exe_cond252:
	BCF        R2, 0
L__exe_cond253:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond254
	BSF        3, 0
	GOTO       L__exe_cond255
L__exe_cond254:
	BCF        3, 0
L__exe_cond255:
	BTFSS      R2, 0
	GOTO       L__exe_cond256
	BTFSS      3, 0
	GOTO       L__exe_cond256
	BSF        R2, 0
	GOTO       L__exe_cond257
L__exe_cond256:
	BCF        R2, 0
L__exe_cond257:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond258
	BSF        3, 0
	GOTO       L__exe_cond259
L__exe_cond258:
	BCF        3, 0
L__exe_cond259:
	BTFSS      R2, 0
	GOTO       L__exe_cond260
	BTFSS      3, 0
	GOTO       L__exe_cond260
	BSF        R2, 0
	GOTO       L__exe_cond261
L__exe_cond260:
	BCF        R2, 0
L__exe_cond261:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond262
	BSF        3, 0
	GOTO       L__exe_cond263
L__exe_cond262:
	BCF        3, 0
L__exe_cond263:
	BTFSS      R2, 0
	GOTO       L__exe_cond264
	BTFSS      3, 0
	GOTO       L__exe_cond264
	BSF        R2, 0
	GOTO       L__exe_cond265
L__exe_cond264:
	BCF        R2, 0
L__exe_cond265:
	BTFSS      R2, 0
	GOTO       L_exe_cond43
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond42
L_exe_cond43:
L_exe_cond41:
;APP_OPSM.c,83 :: 		break;
	GOTO       L_exe_cond22
;APP_OPSM.c,85 :: 		case 13: guc_sec = 0;
L_exe_cond44:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;APP_OPSM.c,86 :: 		while(guc_sec < 6 & COND13)
L_exe_cond45:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond266
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond266:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond267
	BSF        3, 0
	GOTO       L__exe_cond268
L__exe_cond267:
	BCF        3, 0
L__exe_cond268:
	BTFSS      3, 0
	GOTO       L__exe_cond269
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond269
	BSF        R2, 0
	GOTO       L__exe_cond270
L__exe_cond269:
	BCF        R2, 0
L__exe_cond270:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond271
	BSF        3, 0
	GOTO       L__exe_cond272
L__exe_cond271:
	BCF        3, 0
L__exe_cond272:
	BTFSS      R2, 0
	GOTO       L__exe_cond273
	BTFSS      3, 0
	GOTO       L__exe_cond273
	BSF        R2, 0
	GOTO       L__exe_cond274
L__exe_cond273:
	BCF        R2, 0
L__exe_cond274:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond275
	BSF        3, 0
	GOTO       L__exe_cond276
L__exe_cond275:
	BCF        3, 0
L__exe_cond276:
	BTFSS      R2, 0
	GOTO       L__exe_cond277
	BTFSS      3, 0
	GOTO       L__exe_cond277
	BSF        R2, 0
	GOTO       L__exe_cond278
L__exe_cond277:
	BCF        R2, 0
L__exe_cond278:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond46
;APP_OPSM.c,88 :: 		if((guc_sec < 2) & (ENGINE_SENSE == 1)){ RELAY_SOL = 1; }
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond279
	MOVLW      2
	SUBWF      _guc_sec+0, 0
L__exe_cond279:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond280
	BCF        3, 0
	GOTO       L__exe_cond281
L__exe_cond280:
	BSF        3, 0
L__exe_cond281:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond47
	BSF        PORTC+0, 5
L_exe_cond47:
;APP_OPSM.c,89 :: 		};
	GOTO       L_exe_cond45
L_exe_cond46:
;APP_OPSM.c,90 :: 		guc_sec = 0; guc_buzz_state = 1; RELAY_SOL = 1;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	BSF        PORTC+0, 5
;APP_OPSM.c,91 :: 		while(guc_sec < 6);while(COND13);
L_exe_cond48:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond282
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond282:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond49
	GOTO       L_exe_cond48
L_exe_cond49:
L_exe_cond50:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond283
	BSF        3, 0
	GOTO       L__exe_cond284
L__exe_cond283:
	BCF        3, 0
L__exe_cond284:
	BTFSS      3, 0
	GOTO       L__exe_cond285
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond285
	BSF        R2, 0
	GOTO       L__exe_cond286
L__exe_cond285:
	BCF        R2, 0
L__exe_cond286:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond287
	BSF        3, 0
	GOTO       L__exe_cond288
L__exe_cond287:
	BCF        3, 0
L__exe_cond288:
	BTFSS      R2, 0
	GOTO       L__exe_cond289
	BTFSS      3, 0
	GOTO       L__exe_cond289
	BSF        R2, 0
	GOTO       L__exe_cond290
L__exe_cond289:
	BCF        R2, 0
L__exe_cond290:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond291
	BSF        3, 0
	GOTO       L__exe_cond292
L__exe_cond291:
	BCF        3, 0
L__exe_cond292:
	BTFSS      R2, 0
	GOTO       L__exe_cond293
	BTFSS      3, 0
	GOTO       L__exe_cond293
	BSF        R2, 0
	GOTO       L__exe_cond294
L__exe_cond293:
	BCF        R2, 0
L__exe_cond294:
	BTFSS      R2, 0
	GOTO       L_exe_cond51
	GOTO       L_exe_cond50
L_exe_cond51:
;APP_OPSM.c,92 :: 		while(COND16)
L_exe_cond52:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond295
	BSF        3, 0
	GOTO       L__exe_cond296
L__exe_cond295:
	BCF        3, 0
L__exe_cond296:
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond297
	BTFSS      3, 0
	GOTO       L__exe_cond297
	BSF        R2, 0
	GOTO       L__exe_cond298
L__exe_cond297:
	BCF        R2, 0
L__exe_cond298:
	BTFSS      R2, 0
	GOTO       L_exe_cond53
;APP_OPSM.c,94 :: 		(HAND_BRAKE == 0)?(guc_buzz_state = 1):(guc_buzz_state = 0);
	BTFSC      PORTC+0, 0
	GOTO       L_exe_cond54
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	MOVF       _guc_buzz_state+0, 0
	MOVWF      ?FLOC___exe_condT234+0
	GOTO       L_exe_cond55
L_exe_cond54:
	CLRF       _guc_buzz_state+0
	MOVF       _guc_buzz_state+0, 0
	MOVWF      ?FLOC___exe_condT234+0
L_exe_cond55:
;APP_OPSM.c,95 :: 		}
	GOTO       L_exe_cond52
L_exe_cond53:
;APP_OPSM.c,96 :: 		break;
	GOTO       L_exe_cond22
;APP_OPSM.c,98 :: 		case 14: guc_buzz_state = 0; guc_sec = 0;
L_exe_cond56:
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;APP_OPSM.c,99 :: 		while(guc_sec < 6 & COND14)
L_exe_cond57:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond299
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond299:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond300
	BSF        3, 0
	GOTO       L__exe_cond301
L__exe_cond300:
	BCF        3, 0
L__exe_cond301:
	BTFSS      3, 0
	GOTO       L__exe_cond302
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond302
	BSF        R2, 0
	GOTO       L__exe_cond303
L__exe_cond302:
	BCF        R2, 0
L__exe_cond303:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond304
	BSF        3, 0
	GOTO       L__exe_cond305
L__exe_cond304:
	BCF        3, 0
L__exe_cond305:
	BTFSS      R2, 0
	GOTO       L__exe_cond306
	BTFSS      3, 0
	GOTO       L__exe_cond306
	BSF        R2, 0
	GOTO       L__exe_cond307
L__exe_cond306:
	BCF        R2, 0
L__exe_cond307:
	BTFSS      R2, 0
	GOTO       L__exe_cond308
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond308
	BSF        3, 0
	GOTO       L__exe_cond309
L__exe_cond308:
	BCF        3, 0
L__exe_cond309:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond58
;APP_OPSM.c,101 :: 		if((guc_sec < 2) & (ENGINE_SENSE == 1)){ RELAY_SOL = 1; }
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond310
	MOVLW      2
	SUBWF      _guc_sec+0, 0
L__exe_cond310:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond311
	BCF        3, 0
	GOTO       L__exe_cond312
L__exe_cond311:
	BSF        3, 0
L__exe_cond312:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond59
	BSF        PORTC+0, 5
L_exe_cond59:
;APP_OPSM.c,102 :: 		};
	GOTO       L_exe_cond57
L_exe_cond58:
;APP_OPSM.c,103 :: 		guc_sec = 0;RELAY_SOL = 1;while(guc_sec < 6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond60:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond313
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond313:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond61
	GOTO       L_exe_cond60
L_exe_cond61:
;APP_OPSM.c,104 :: 		while(COND14);
L_exe_cond62:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond314
	BSF        3, 0
	GOTO       L__exe_cond315
L__exe_cond314:
	BCF        3, 0
L__exe_cond315:
	BTFSS      3, 0
	GOTO       L__exe_cond316
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond316
	BSF        R2, 0
	GOTO       L__exe_cond317
L__exe_cond316:
	BCF        R2, 0
L__exe_cond317:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond318
	BSF        3, 0
	GOTO       L__exe_cond319
L__exe_cond318:
	BCF        3, 0
L__exe_cond319:
	BTFSS      R2, 0
	GOTO       L__exe_cond320
	BTFSS      3, 0
	GOTO       L__exe_cond320
	BSF        R2, 0
	GOTO       L__exe_cond321
L__exe_cond320:
	BCF        R2, 0
L__exe_cond321:
	BTFSS      R2, 0
	GOTO       L__exe_cond322
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond322
	BSF        3, 0
	GOTO       L__exe_cond323
L__exe_cond322:
	BCF        3, 0
L__exe_cond323:
	BTFSS      3, 0
	GOTO       L_exe_cond63
	GOTO       L_exe_cond62
L_exe_cond63:
;APP_OPSM.c,105 :: 		while(COND16)
L_exe_cond64:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond324
	BSF        3, 0
	GOTO       L__exe_cond325
L__exe_cond324:
	BCF        3, 0
L__exe_cond325:
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond326
	BTFSS      3, 0
	GOTO       L__exe_cond326
	BSF        R2, 0
	GOTO       L__exe_cond327
L__exe_cond326:
	BCF        R2, 0
L__exe_cond327:
	BTFSS      R2, 0
	GOTO       L_exe_cond65
;APP_OPSM.c,107 :: 		(HAND_BRAKE == 0)?(guc_buzz_state = 1):(guc_buzz_state = 0);
	BTFSC      PORTC+0, 0
	GOTO       L_exe_cond66
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	MOVF       _guc_buzz_state+0, 0
	MOVWF      ?FLOC___exe_condT272+0
	GOTO       L_exe_cond67
L_exe_cond66:
	CLRF       _guc_buzz_state+0
	MOVF       _guc_buzz_state+0, 0
	MOVWF      ?FLOC___exe_condT272+0
L_exe_cond67:
;APP_OPSM.c,108 :: 		}
	GOTO       L_exe_cond64
L_exe_cond65:
;APP_OPSM.c,109 :: 		break;
	GOTO       L_exe_cond22
;APP_OPSM.c,152 :: 		default: break;
L_exe_cond68:
	GOTO       L_exe_cond22
;APP_OPSM.c,153 :: 		}
L_exe_cond21:
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond23
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond29
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond35
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond38
	MOVF       _guc_choice+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond44
	MOVF       _guc_choice+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond56
	GOTO       L_exe_cond68
L_exe_cond22:
;APP_OPSM.c,154 :: 		reset_all();
	CALL       _reset_all+0
;APP_OPSM.c,155 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,158 :: 		void sys_init()
;APP_OPSM.c,160 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,162 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,163 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,164 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,165 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,167 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,168 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,169 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,170 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,172 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,173 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,175 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,176 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,178 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,183 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP_OPSM.c,186 :: 		void main()
;APP_OPSM.c,188 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,189 :: 		while(1)
L_main69:
;APP_OPSM.c,191 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,192 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main71
;APP_OPSM.c,194 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,195 :: 		}
L_main71:
;APP_OPSM.c,196 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,197 :: 		}
	GOTO       L_main69
;APP_OPSM.c,198 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
