
_interrupt:

;APP_OPSM.c,14 :: 		void interrupt()
;APP_OPSM.c,16 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt66:
;APP_OPSM.c,18 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,27 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;APP_OPSM.c,30 :: 		}
L_interrupt3:
;APP_OPSM.c,31 :: 		}
L_end_interrupt:
L__interrupt71:
	RETFIE     %s
; end of _interrupt

_CHCK_COND:

;APP_OPSM.c,33 :: 		void CHCK_COND(uint8 x)
;APP_OPSM.c,36 :: 		guc_deb[x]++;
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
;APP_OPSM.c,37 :: 		for(i=0;i<=TOTAL_COND && i!=x;i++){guc_deb[i] = 0;}
	CLRF       R4+0
L_CHCK_COND4:
	MOVF       R4+0, 0
	SUBLW      14
	BTFSS      STATUS+0, 0
	GOTO       L_CHCK_COND5
	MOVF       R4+0, 0
	XORWF      FARG_CHCK_COND_x+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CHCK_COND5
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
	GOTO       L_CHCK_COND4
L_CHCK_COND5:
;APP_OPSM.c,38 :: 		if(guc_deb[x] > DEBO_TIME){ guc_choice = x; guc_deb[x] = 0;}
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
	SUBLW      46
	BTFSS      STATUS+0, 2
	GOTO       L__CHCK_COND73
	MOVF       R1, 0
	SUBLW      224
L__CHCK_COND73:
	BTFSC      STATUS+0, 0
	GOTO       L_CHCK_COND9
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
L_CHCK_COND9:
;APP_OPSM.c,39 :: 		}
L_end_CHCK_COND:
	RETURN
; end of _CHCK_COND

_check_cond:

;APP_OPSM.c,42 :: 		void check_cond()
;APP_OPSM.c,44 :: 		guc_choice = 0;
	CLRF       _guc_choice+0
;APP_OPSM.c,45 :: 		if(COND1){ CHCK_COND(1); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond75
	BSF        R0, 0
	GOTO       L__check_cond76
L__check_cond75:
	BCF        R0, 0
L__check_cond76:
	BTFSC      PORTC+0, 1
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
	GOTO       L__check_cond85
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond85
	BSF        3, 0
	GOTO       L__check_cond86
L__check_cond85:
	BCF        3, 0
L__check_cond86:
	BTFSS      3, 0
	GOTO       L_check_cond10
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond11
L_check_cond10:
;APP_OPSM.c,46 :: 		else if(COND2){ CHCK_COND(2); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond87
	BSF        3, 0
	GOTO       L__check_cond88
L__check_cond87:
	BCF        3, 0
L__check_cond88:
	BTFSS      PORTC+0, 2
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
	GOTO       L__check_cond95
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond95
	BSF        3, 0
	GOTO       L__check_cond96
L__check_cond95:
	BCF        3, 0
L__check_cond96:
	BTFSS      3, 0
	GOTO       L_check_cond12
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond13
L_check_cond12:
;APP_OPSM.c,47 :: 		else if(COND3){ CHCK_COND(3); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond97
	BSF        R0, 0
	GOTO       L__check_cond98
L__check_cond97:
	BCF        R0, 0
L__check_cond98:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond99
	BSF        3, 0
	GOTO       L__check_cond100
L__check_cond99:
	BCF        3, 0
L__check_cond100:
	BTFSS      R0, 0
	GOTO       L__check_cond101
	BTFSS      3, 0
	GOTO       L__check_cond101
	BSF        R0, 0
	GOTO       L__check_cond102
L__check_cond101:
	BCF        R0, 0
L__check_cond102:
	BTFSS      R0, 0
	GOTO       L__check_cond103
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond103
	BSF        3, 0
	GOTO       L__check_cond104
L__check_cond103:
	BCF        3, 0
L__check_cond104:
	BTFSS      3, 0
	GOTO       L__check_cond105
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond105
	BSF        R0, 0
	GOTO       L__check_cond106
L__check_cond105:
	BCF        R0, 0
L__check_cond106:
	BTFSS      R0, 0
	GOTO       L_check_cond14
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond15
L_check_cond14:
;APP_OPSM.c,48 :: 		else if(COND4){ CHCK_COND(4); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond107
	BSF        3, 0
	GOTO       L__check_cond108
L__check_cond107:
	BCF        3, 0
L__check_cond108:
	BTFSS      3, 0
	GOTO       L__check_cond109
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond109
	BSF        R0, 0
	GOTO       L__check_cond110
L__check_cond109:
	BCF        R0, 0
L__check_cond110:
	BTFSS      R0, 0
	GOTO       L__check_cond111
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond111
	BSF        3, 0
	GOTO       L__check_cond112
L__check_cond111:
	BCF        3, 0
L__check_cond112:
	BTFSS      3, 0
	GOTO       L__check_cond113
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond113
	BSF        R0, 0
	GOTO       L__check_cond114
L__check_cond113:
	BCF        R0, 0
L__check_cond114:
	BTFSS      R0, 0
	GOTO       L_check_cond16
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond17
L_check_cond16:
;APP_OPSM.c,49 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond115
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond115
	BSF        3, 0
	GOTO       L__check_cond116
L__check_cond115:
	BCF        3, 0
L__check_cond116:
	BTFSS      3, 0
	GOTO       L__check_cond117
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond117
	BSF        R0, 0
	GOTO       L__check_cond118
L__check_cond117:
	BCF        R0, 0
L__check_cond118:
	BTFSS      R0, 0
	GOTO       L__check_cond119
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond119
	BSF        3, 0
	GOTO       L__check_cond120
L__check_cond119:
	BCF        3, 0
L__check_cond120:
	BTFSS      3, 0
	GOTO       L_check_cond18
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond19
L_check_cond18:
;APP_OPSM.c,50 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond121
	BSF        3, 0
	GOTO       L__check_cond122
L__check_cond121:
	BCF        3, 0
L__check_cond122:
	BTFSS      3, 0
	GOTO       L__check_cond123
	BTFSS      PORTC+0, 1
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
	GOTO       L__check_cond129
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond129
	BSF        3, 0
	GOTO       L__check_cond130
L__check_cond129:
	BCF        3, 0
L__check_cond130:
	BTFSS      3, 0
	GOTO       L_check_cond20
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond21
L_check_cond20:
;APP_OPSM.c,51 :: 		else if(COND7){ CHCK_COND(7); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond131
	BSF        3, 0
	GOTO       L__check_cond132
L__check_cond131:
	BCF        3, 0
L__check_cond132:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond133
	BTFSS      3, 0
	GOTO       L__check_cond133
	BSF        R0, 0
	GOTO       L__check_cond134
L__check_cond133:
	BCF        R0, 0
L__check_cond134:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond135
	BSF        3, 0
	GOTO       L__check_cond136
L__check_cond135:
	BCF        3, 0
L__check_cond136:
	BTFSS      R0, 0
	GOTO       L__check_cond137
	BTFSS      3, 0
	GOTO       L__check_cond137
	BSF        R0, 0
	GOTO       L__check_cond138
L__check_cond137:
	BCF        R0, 0
L__check_cond138:
	BTFSC      PORTA+0, 5
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
	GOTO       L_check_cond22
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond23
L_check_cond22:
;APP_OPSM.c,52 :: 		else if(COND8){ CHCK_COND(8); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond143
	BSF        R0, 0
	GOTO       L__check_cond144
L__check_cond143:
	BCF        R0, 0
L__check_cond144:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond145
	BSF        3, 0
	GOTO       L__check_cond146
L__check_cond145:
	BCF        3, 0
L__check_cond146:
	BTFSS      R0, 0
	GOTO       L__check_cond147
	BTFSS      3, 0
	GOTO       L__check_cond147
	BSF        R0, 0
	GOTO       L__check_cond148
L__check_cond147:
	BCF        R0, 0
L__check_cond148:
	BTFSS      R0, 0
	GOTO       L__check_cond149
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond149
	BSF        R0, 0
	GOTO       L__check_cond150
L__check_cond149:
	BCF        R0, 0
L__check_cond150:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond151
	BSF        3, 0
	GOTO       L__check_cond152
L__check_cond151:
	BCF        3, 0
L__check_cond152:
	BTFSS      R0, 0
	GOTO       L__check_cond153
	BTFSS      3, 0
	GOTO       L__check_cond153
	BSF        R0, 0
	GOTO       L__check_cond154
L__check_cond153:
	BCF        R0, 0
L__check_cond154:
	BTFSS      R0, 0
	GOTO       L_check_cond24
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond25
L_check_cond24:
;APP_OPSM.c,53 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond155
	BSF        R0, 0
	GOTO       L__check_cond156
L__check_cond155:
	BCF        R0, 0
L__check_cond156:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond157
	BSF        3, 0
	GOTO       L__check_cond158
L__check_cond157:
	BCF        3, 0
L__check_cond158:
	BTFSS      R0, 0
	GOTO       L__check_cond159
	BTFSS      3, 0
	GOTO       L__check_cond159
	BSF        R0, 0
	GOTO       L__check_cond160
L__check_cond159:
	BCF        R0, 0
L__check_cond160:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond161
	BSF        3, 0
	GOTO       L__check_cond162
L__check_cond161:
	BCF        3, 0
L__check_cond162:
	BTFSS      R0, 0
	GOTO       L__check_cond163
	BTFSS      3, 0
	GOTO       L__check_cond163
	BSF        R0, 0
	GOTO       L__check_cond164
L__check_cond163:
	BCF        R0, 0
L__check_cond164:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond165
	BSF        3, 0
	GOTO       L__check_cond166
L__check_cond165:
	BCF        3, 0
L__check_cond166:
	BTFSS      R0, 0
	GOTO       L__check_cond167
	BTFSS      3, 0
	GOTO       L__check_cond167
	BSF        R0, 0
	GOTO       L__check_cond168
L__check_cond167:
	BCF        R0, 0
L__check_cond168:
	BTFSS      R0, 0
	GOTO       L_check_cond26
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond27
L_check_cond26:
;APP_OPSM.c,54 :: 		else if(COND10){ CHCK_COND(10); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond169
	BSF        3, 0
	GOTO       L__check_cond170
L__check_cond169:
	BCF        3, 0
L__check_cond170:
	BTFSS      3, 0
	GOTO       L__check_cond171
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond171
	BSF        R0, 0
	GOTO       L__check_cond172
L__check_cond171:
	BCF        R0, 0
L__check_cond172:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond173
	BSF        3, 0
	GOTO       L__check_cond174
L__check_cond173:
	BCF        3, 0
L__check_cond174:
	BTFSS      R0, 0
	GOTO       L__check_cond175
	BTFSS      3, 0
	GOTO       L__check_cond175
	BSF        R0, 0
	GOTO       L__check_cond176
L__check_cond175:
	BCF        R0, 0
L__check_cond176:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond177
	BSF        3, 0
	GOTO       L__check_cond178
L__check_cond177:
	BCF        3, 0
L__check_cond178:
	BTFSS      R0, 0
	GOTO       L__check_cond179
	BTFSS      3, 0
	GOTO       L__check_cond179
	BSF        R0, 0
	GOTO       L__check_cond180
L__check_cond179:
	BCF        R0, 0
L__check_cond180:
	BTFSS      R0, 0
	GOTO       L_check_cond28
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond29
L_check_cond28:
;APP_OPSM.c,55 :: 		else if(COND11){ CHCK_COND(11); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond181
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond181
	BSF        3, 0
	GOTO       L__check_cond182
L__check_cond181:
	BCF        3, 0
L__check_cond182:
	BTFSS      3, 0
	GOTO       L__check_cond183
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond183
	BSF        R0, 0
	GOTO       L__check_cond184
L__check_cond183:
	BCF        R0, 0
L__check_cond184:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond185
	BSF        3, 0
	GOTO       L__check_cond186
L__check_cond185:
	BCF        3, 0
L__check_cond186:
	BTFSS      R0, 0
	GOTO       L__check_cond187
	BTFSS      3, 0
	GOTO       L__check_cond187
	BSF        R0, 0
	GOTO       L__check_cond188
L__check_cond187:
	BCF        R0, 0
L__check_cond188:
	BTFSS      R0, 0
	GOTO       L_check_cond30
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond31
L_check_cond30:
;APP_OPSM.c,56 :: 		else if(COND12){ CHCK_COND(12); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond189
	BSF        3, 0
	GOTO       L__check_cond190
L__check_cond189:
	BCF        3, 0
L__check_cond190:
	BTFSS      3, 0
	GOTO       L__check_cond191
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond191
	BSF        R0, 0
	GOTO       L__check_cond192
L__check_cond191:
	BCF        R0, 0
L__check_cond192:
	BTFSS      R0, 0
	GOTO       L__check_cond193
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond193
	BSF        R0, 0
	GOTO       L__check_cond194
L__check_cond193:
	BCF        R0, 0
L__check_cond194:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond195
	BSF        3, 0
	GOTO       L__check_cond196
L__check_cond195:
	BCF        3, 0
L__check_cond196:
	BTFSS      R0, 0
	GOTO       L__check_cond197
	BTFSS      3, 0
	GOTO       L__check_cond197
	BSF        R0, 0
	GOTO       L__check_cond198
L__check_cond197:
	BCF        R0, 0
L__check_cond198:
	BTFSS      R0, 0
	GOTO       L_check_cond32
	MOVLW      12
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond33
L_check_cond32:
;APP_OPSM.c,57 :: 		else {CHCK_COND(14);}
	MOVLW      14
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond33:
L_check_cond31:
L_check_cond29:
L_check_cond27:
L_check_cond25:
L_check_cond23:
L_check_cond21:
L_check_cond19:
L_check_cond17:
L_check_cond15:
L_check_cond13:
L_check_cond11:
;APP_OPSM.c,59 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,61 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;APP_OPSM.c,63 :: 		void exe_cond()
;APP_OPSM.c,65 :: 		if(guc_choice == 1 || guc_choice == 6 || guc_choice == 9
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond69
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond69
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond69
;APP_OPSM.c,66 :: 		|| guc_choice == 10){guc_buzz_state=1;}
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond69
	GOTO       L_exe_cond36
L__exe_cond69:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond37
L_exe_cond36:
;APP_OPSM.c,67 :: 		else { guc_buzz_state=0;}
	CLRF       _guc_buzz_state+0
L_exe_cond37:
;APP_OPSM.c,69 :: 		if(guc_choice == 8 || guc_choice == 11 || guc_choice == 12)
	MOVF       _guc_choice+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond68
	MOVF       _guc_choice+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond68
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond68
	GOTO       L_exe_cond40
L__exe_cond68:
;APP_OPSM.c,70 :: 		{P_IND = 1;}
	BSF        PORTC+0, 3
	GOTO       L_exe_cond41
L_exe_cond40:
;APP_OPSM.c,71 :: 		else { P_IND = 0;}
	BCF        PORTC+0, 3
L_exe_cond41:
;APP_OPSM.c,79 :: 		if(guc_choice == 10)
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond42
;APP_OPSM.c,81 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond43:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond200
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond200:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond44
	GOTO       L_exe_cond43
L_exe_cond44:
;APP_OPSM.c,82 :: 		RELAY_SOL = 0;rel_lock = 1;
	BCF        PORTC+0, 5
	MOVLW      1
	MOVWF      _rel_lock+0
;APP_OPSM.c,83 :: 		while(COND10)asm CLRWDT ;
L_exe_cond45:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond201
	BSF        3, 0
	GOTO       L__exe_cond202
L__exe_cond201:
	BCF        3, 0
L__exe_cond202:
	BTFSS      3, 0
	GOTO       L__exe_cond203
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond203
	BSF        R1, 0
	GOTO       L__exe_cond204
L__exe_cond203:
	BCF        R1, 0
L__exe_cond204:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond205
	BSF        3, 0
	GOTO       L__exe_cond206
L__exe_cond205:
	BCF        3, 0
L__exe_cond206:
	BTFSS      R1, 0
	GOTO       L__exe_cond207
	BTFSS      3, 0
	GOTO       L__exe_cond207
	BSF        R1, 0
	GOTO       L__exe_cond208
L__exe_cond207:
	BCF        R1, 0
L__exe_cond208:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond209
	BSF        3, 0
	GOTO       L__exe_cond210
L__exe_cond209:
	BCF        3, 0
L__exe_cond210:
	BTFSS      R1, 0
	GOTO       L__exe_cond211
	BTFSS      3, 0
	GOTO       L__exe_cond211
	BSF        R1, 0
	GOTO       L__exe_cond212
L__exe_cond211:
	BCF        R1, 0
L__exe_cond212:
	BTFSS      R1, 0
	GOTO       L_exe_cond46
	CLRWDT
	GOTO       L_exe_cond45
L_exe_cond46:
;APP_OPSM.c,84 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,85 :: 		}
	GOTO       L_exe_cond47
L_exe_cond42:
;APP_OPSM.c,86 :: 		else if(guc_choice == 12)
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond48
;APP_OPSM.c,89 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond49:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond213
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond213:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond50
	GOTO       L_exe_cond49
L_exe_cond50:
;APP_OPSM.c,90 :: 		RELAY_SOL = 0;rel_lock = 1;
	BCF        PORTC+0, 5
	MOVLW      1
	MOVWF      _rel_lock+0
;APP_OPSM.c,91 :: 		while(COND12)asm CLRWDT ;
L_exe_cond51:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond214
	BSF        3, 0
	GOTO       L__exe_cond215
L__exe_cond214:
	BCF        3, 0
L__exe_cond215:
	BTFSS      3, 0
	GOTO       L__exe_cond216
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond216
	BSF        R1, 0
	GOTO       L__exe_cond217
L__exe_cond216:
	BCF        R1, 0
L__exe_cond217:
	BTFSS      R1, 0
	GOTO       L__exe_cond218
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond218
	BSF        R1, 0
	GOTO       L__exe_cond219
L__exe_cond218:
	BCF        R1, 0
L__exe_cond219:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond220
	BSF        3, 0
	GOTO       L__exe_cond221
L__exe_cond220:
	BCF        3, 0
L__exe_cond221:
	BTFSS      R1, 0
	GOTO       L__exe_cond222
	BTFSS      3, 0
	GOTO       L__exe_cond222
	BSF        R1, 0
	GOTO       L__exe_cond223
L__exe_cond222:
	BCF        R1, 0
L__exe_cond223:
	BTFSS      R1, 0
	GOTO       L_exe_cond52
	CLRWDT
	GOTO       L_exe_cond51
L_exe_cond52:
;APP_OPSM.c,92 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,93 :: 		}
	GOTO       L_exe_cond53
L_exe_cond48:
;APP_OPSM.c,94 :: 		else { RELAY_SOL = 0;}
	BCF        PORTC+0, 5
L_exe_cond53:
L_exe_cond47:
;APP_OPSM.c,96 :: 		if (guc_choice == 14)
	MOVF       _guc_choice+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond54
;APP_OPSM.c,98 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,99 :: 		P_IND = 0;
	BCF        PORTC+0, 3
;APP_OPSM.c,100 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,101 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,102 :: 		}
L_exe_cond54:
;APP_OPSM.c,103 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,106 :: 		void sys_init()
;APP_OPSM.c,109 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,111 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,112 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,113 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,114 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,116 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,117 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,118 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,119 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,121 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,122 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,125 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,126 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,137 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,142 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_process_uart:

;APP_OPSM.c,144 :: 		void process_uart()
;APP_OPSM.c,146 :: 		if(ENGINE_SENSE) Diag_data_var.diag_engine_sense = 1;
	BTFSS      PORTA+0, 5
	GOTO       L_process_uart55
	BSF        _Diag_data_var+0, 0
L_process_uart55:
;APP_OPSM.c,147 :: 		if(HAND_BRAKE)  Diag_data_var.diag_hand_brake = 1;
	BTFSS      PORTC+0, 0
	GOTO       L_process_uart56
	BSF        _Diag_data_var+0, 1
L_process_uart56:
;APP_OPSM.c,148 :: 		if(PTO)         Diag_data_var.diag_pto = 1;
	BTFSS      PORTC+0, 1
	GOTO       L_process_uart57
	BSF        _Diag_data_var+0, 2
L_process_uart57:
;APP_OPSM.c,149 :: 		if(SEAT_SWITCH) Diag_data_var.diag_seat_switch = 1;
	BTFSS      PORTC+0, 2
	GOTO       L_process_uart58
	BSF        _Diag_data_var+0, 3
L_process_uart58:
;APP_OPSM.c,150 :: 		if(P_IND)       Diag_data_var.diag_p_ind = 1;
	BTFSS      PORTC+0, 3
	GOTO       L_process_uart59
	BSF        _Diag_data_var+0, 4
L_process_uart59:
;APP_OPSM.c,151 :: 		if(RELAY_SOL)   Diag_data_var.diag_Relay_Sol = 1;
	BTFSS      PORTC+0, 5
	GOTO       L_process_uart60
	BSF        _Diag_data_var+0, 5
L_process_uart60:
;APP_OPSM.c,152 :: 		if(BUZZER)      Diag_data_var.diag_buzzer = 1;
	BTFSS      PORTA+0, 2
	GOTO       L_process_uart61
	BSF        _Diag_data_var+0, 6
L_process_uart61:
;APP_OPSM.c,153 :: 		if(RELAY_STR)   Diag_data_var.diag_relay_str = 1;
	BTFSS      PORTC+0, 4
	GOTO       L_process_uart62
	BSF        _Diag_data_var+0, 7
L_process_uart62:
;APP_OPSM.c,154 :: 		}
L_end_process_uart:
	RETURN
; end of _process_uart

_main:

;APP_OPSM.c,156 :: 		void main()
;APP_OPSM.c,158 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,159 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;APP_OPSM.c,161 :: 		while(1)
L_main63:
;APP_OPSM.c,163 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,164 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main65
;APP_OPSM.c,166 :: 		diag_choice = guc_choice;
	MOVF       _guc_choice+0, 0
	MOVWF      _diag_choice+0
;APP_OPSM.c,167 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,168 :: 		}
L_main65:
;APP_OPSM.c,169 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,177 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,178 :: 		}
	GOTO       L_main63
;APP_OPSM.c,179 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
