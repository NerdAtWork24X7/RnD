
_interrupt:

;APP_OPSM.c,8 :: 		void interrupt()
;APP_OPSM.c,10 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,11 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt84:
;APP_OPSM.c,13 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,14 :: 		}
L_interrupt2:
;APP_OPSM.c,16 :: 		}
L_end_interrupt:
L__interrupt87:
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
L__CHCK_COND85:
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
	GOTO       L__CHCK_COND89
	MOVF       R1, 0
	SUBLW      10
L__CHCK_COND89:
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
	GOTO       L__check_cond91
	BSF        3, 0
	GOTO       L__check_cond92
L__check_cond91:
	BCF        3, 0
L__check_cond92:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond93
	BTFSS      3, 0
	GOTO       L__check_cond93
	BSF        R0, 0
	GOTO       L__check_cond94
L__check_cond93:
	BCF        R0, 0
L__check_cond94:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond95
	BSF        3, 0
	GOTO       L__check_cond96
L__check_cond95:
	BCF        3, 0
L__check_cond96:
	BTFSS      R0, 0
	GOTO       L__check_cond97
	BTFSS      3, 0
	GOTO       L__check_cond97
	BSF        R0, 0
	GOTO       L__check_cond98
L__check_cond97:
	BCF        R0, 0
L__check_cond98:
	BTFSC      PORTC+0, 0
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
	GOTO       L_check_cond9
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond10
L_check_cond9:
;APP_OPSM.c,31 :: 		else if(COND2){ CHCK_COND(2); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond103
	BSF        3, 0
	GOTO       L__check_cond104
L__check_cond103:
	BCF        3, 0
L__check_cond104:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond105
	BTFSS      3, 0
	GOTO       L__check_cond105
	BSF        R0, 0
	GOTO       L__check_cond106
L__check_cond105:
	BCF        R0, 0
L__check_cond106:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond107
	BSF        3, 0
	GOTO       L__check_cond108
L__check_cond107:
	BCF        3, 0
L__check_cond108:
	BTFSS      R0, 0
	GOTO       L__check_cond109
	BTFSS      3, 0
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
	GOTO       L_check_cond11
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond12
L_check_cond11:
;APP_OPSM.c,32 :: 		else if(COND3){ CHCK_COND(3); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond113
	BSF        3, 0
	GOTO       L__check_cond114
L__check_cond113:
	BCF        3, 0
L__check_cond114:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond115
	BTFSS      3, 0
	GOTO       L__check_cond115
	BSF        R0, 0
	GOTO       L__check_cond116
L__check_cond115:
	BCF        R0, 0
L__check_cond116:
	BTFSS      R0, 0
	GOTO       L__check_cond117
	BTFSS      PORTC+0, 2
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
	GOTO       L_check_cond13
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond14
L_check_cond13:
;APP_OPSM.c,33 :: 		else if(COND4){ CHCK_COND(4); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond123
	BSF        3, 0
	GOTO       L__check_cond124
L__check_cond123:
	BCF        3, 0
L__check_cond124:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond125
	BTFSS      3, 0
	GOTO       L__check_cond125
	BSF        R0, 0
	GOTO       L__check_cond126
L__check_cond125:
	BCF        R0, 0
L__check_cond126:
	BTFSS      R0, 0
	GOTO       L__check_cond127
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond127
	BSF        3, 0
	GOTO       L__check_cond128
L__check_cond127:
	BCF        3, 0
L__check_cond128:
	BTFSS      3, 0
	GOTO       L__check_cond129
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond129
	BSF        R0, 0
	GOTO       L__check_cond130
L__check_cond129:
	BCF        R0, 0
L__check_cond130:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond16
L_check_cond15:
;APP_OPSM.c,34 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSS      PORTA+0, 5
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
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond137
	BSF        3, 0
	GOTO       L__check_cond138
L__check_cond137:
	BCF        3, 0
L__check_cond138:
	BTFSS      R0, 0
	GOTO       L__check_cond139
	BTFSS      3, 0
	GOTO       L__check_cond139
	BSF        R0, 0
	GOTO       L__check_cond140
L__check_cond139:
	BCF        R0, 0
L__check_cond140:
	BTFSS      R0, 0
	GOTO       L_check_cond17
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond18
L_check_cond17:
;APP_OPSM.c,35 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond141
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond141
	BSF        R0, 0
	GOTO       L__check_cond142
L__check_cond141:
	BCF        R0, 0
L__check_cond142:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond143
	BSF        3, 0
	GOTO       L__check_cond144
L__check_cond143:
	BCF        3, 0
L__check_cond144:
	BTFSS      R0, 0
	GOTO       L__check_cond145
	BTFSS      3, 0
	GOTO       L__check_cond145
	BSF        R0, 0
	GOTO       L__check_cond146
L__check_cond145:
	BCF        R0, 0
L__check_cond146:
	BTFSS      R0, 0
	GOTO       L__check_cond147
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond147
	BSF        3, 0
	GOTO       L__check_cond148
L__check_cond147:
	BCF        3, 0
L__check_cond148:
	BTFSS      3, 0
	GOTO       L_check_cond19
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond20
L_check_cond19:
;APP_OPSM.c,36 :: 		else if(COND7){ CHCK_COND(7); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond149
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond149
	BSF        3, 0
	GOTO       L__check_cond150
L__check_cond149:
	BCF        3, 0
L__check_cond150:
	BTFSS      3, 0
	GOTO       L__check_cond151
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond151
	BSF        R0, 0
	GOTO       L__check_cond152
L__check_cond151:
	BCF        R0, 0
L__check_cond152:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond153
	BSF        3, 0
	GOTO       L__check_cond154
L__check_cond153:
	BCF        3, 0
L__check_cond154:
	BTFSS      R0, 0
	GOTO       L__check_cond155
	BTFSS      3, 0
	GOTO       L__check_cond155
	BSF        R0, 0
	GOTO       L__check_cond156
L__check_cond155:
	BCF        R0, 0
L__check_cond156:
	BTFSS      R0, 0
	GOTO       L_check_cond21
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond22
L_check_cond21:
;APP_OPSM.c,37 :: 		else if(COND8){ CHCK_COND(8); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond157
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond157
	BSF        3, 0
	GOTO       L__check_cond158
L__check_cond157:
	BCF        3, 0
L__check_cond158:
	BTFSS      3, 0
	GOTO       L__check_cond159
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond159
	BSF        R0, 0
	GOTO       L__check_cond160
L__check_cond159:
	BCF        R0, 0
L__check_cond160:
	BTFSS      R0, 0
	GOTO       L__check_cond161
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond161
	BSF        3, 0
	GOTO       L__check_cond162
L__check_cond161:
	BCF        3, 0
L__check_cond162:
	BTFSS      3, 0
	GOTO       L_check_cond23
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond24
L_check_cond23:
;APP_OPSM.c,38 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond163
	BSF        R0, 0
	GOTO       L__check_cond164
L__check_cond163:
	BCF        R0, 0
L__check_cond164:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond169
	BSF        3, 0
	GOTO       L__check_cond170
L__check_cond169:
	BCF        3, 0
L__check_cond170:
	BTFSS      R0, 0
	GOTO       L__check_cond171
	BTFSS      3, 0
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
	BTFSS      R0, 0
	GOTO       L_check_cond25
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond26
L_check_cond25:
;APP_OPSM.c,39 :: 		else if(COND10){ CHCK_COND(10); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond177
	BSF        R0, 0
	GOTO       L__check_cond178
L__check_cond177:
	BCF        R0, 0
L__check_cond178:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond179
	BSF        3, 0
	GOTO       L__check_cond180
L__check_cond179:
	BCF        3, 0
L__check_cond180:
	BTFSS      R0, 0
	GOTO       L__check_cond181
	BTFSS      3, 0
	GOTO       L__check_cond181
	BSF        R0, 0
	GOTO       L__check_cond182
L__check_cond181:
	BCF        R0, 0
L__check_cond182:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond183
	BSF        3, 0
	GOTO       L__check_cond184
L__check_cond183:
	BCF        3, 0
L__check_cond184:
	BTFSS      R0, 0
	GOTO       L__check_cond185
	BTFSS      3, 0
	GOTO       L__check_cond185
	BSF        R0, 0
	GOTO       L__check_cond186
L__check_cond185:
	BCF        R0, 0
L__check_cond186:
	BTFSS      R0, 0
	GOTO       L__check_cond187
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond187
	BSF        3, 0
	GOTO       L__check_cond188
L__check_cond187:
	BCF        3, 0
L__check_cond188:
	BTFSS      3, 0
	GOTO       L_check_cond27
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond28
L_check_cond27:
;APP_OPSM.c,40 :: 		else if(COND11){ CHCK_COND(11); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond189
	BSF        R0, 0
	GOTO       L__check_cond190
L__check_cond189:
	BCF        R0, 0
L__check_cond190:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond191
	BSF        3, 0
	GOTO       L__check_cond192
L__check_cond191:
	BCF        3, 0
L__check_cond192:
	BTFSS      R0, 0
	GOTO       L__check_cond193
	BTFSS      3, 0
	GOTO       L__check_cond193
	BSF        R0, 0
	GOTO       L__check_cond194
L__check_cond193:
	BCF        R0, 0
L__check_cond194:
	BTFSS      R0, 0
	GOTO       L__check_cond195
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond195
	BSF        R0, 0
	GOTO       L__check_cond196
L__check_cond195:
	BCF        R0, 0
L__check_cond196:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond197
	BSF        3, 0
	GOTO       L__check_cond198
L__check_cond197:
	BCF        3, 0
L__check_cond198:
	BTFSS      R0, 0
	GOTO       L__check_cond199
	BTFSS      3, 0
	GOTO       L__check_cond199
	BSF        R0, 0
	GOTO       L__check_cond200
L__check_cond199:
	BCF        R0, 0
L__check_cond200:
	BTFSS      R0, 0
	GOTO       L_check_cond29
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond30
L_check_cond29:
;APP_OPSM.c,41 :: 		else if(COND12){ CHCK_COND(12); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond201
	BSF        R0, 0
	GOTO       L__check_cond202
L__check_cond201:
	BCF        R0, 0
L__check_cond202:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond203
	BSF        3, 0
	GOTO       L__check_cond204
L__check_cond203:
	BCF        3, 0
L__check_cond204:
	BTFSS      R0, 0
	GOTO       L__check_cond205
	BTFSS      3, 0
	GOTO       L__check_cond205
	BSF        R0, 0
	GOTO       L__check_cond206
L__check_cond205:
	BCF        R0, 0
L__check_cond206:
	BTFSS      R0, 0
	GOTO       L__check_cond207
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond207
	BSF        3, 0
	GOTO       L__check_cond208
L__check_cond207:
	BCF        3, 0
L__check_cond208:
	BTFSS      3, 0
	GOTO       L__check_cond209
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond209
	BSF        R0, 0
	GOTO       L__check_cond210
L__check_cond209:
	BCF        R0, 0
L__check_cond210:
	BTFSS      R0, 0
	GOTO       L_check_cond31
	MOVLW      12
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond32
L_check_cond31:
;APP_OPSM.c,42 :: 		else if(COND13){ CHCK_COND(13); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond211
	BSF        3, 0
	GOTO       L__check_cond212
L__check_cond211:
	BCF        3, 0
L__check_cond212:
	BTFSS      3, 0
	GOTO       L__check_cond213
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond213
	BSF        R0, 0
	GOTO       L__check_cond214
L__check_cond213:
	BCF        R0, 0
L__check_cond214:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond215
	BSF        3, 0
	GOTO       L__check_cond216
L__check_cond215:
	BCF        3, 0
L__check_cond216:
	BTFSS      R0, 0
	GOTO       L__check_cond217
	BTFSS      3, 0
	GOTO       L__check_cond217
	BSF        R0, 0
	GOTO       L__check_cond218
L__check_cond217:
	BCF        R0, 0
L__check_cond218:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond219
	BSF        3, 0
	GOTO       L__check_cond220
L__check_cond219:
	BCF        3, 0
L__check_cond220:
	BTFSS      R0, 0
	GOTO       L__check_cond221
	BTFSS      3, 0
	GOTO       L__check_cond221
	BSF        R0, 0
	GOTO       L__check_cond222
L__check_cond221:
	BCF        R0, 0
L__check_cond222:
	BTFSS      R0, 0
	GOTO       L_check_cond33
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond34
L_check_cond33:
;APP_OPSM.c,43 :: 		else if(COND14){ CHCK_COND(14); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond223
	BSF        3, 0
	GOTO       L__check_cond224
L__check_cond223:
	BCF        3, 0
L__check_cond224:
	BTFSS      3, 0
	GOTO       L__check_cond225
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond225
	BSF        R0, 0
	GOTO       L__check_cond226
L__check_cond225:
	BCF        R0, 0
L__check_cond226:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond227
	BSF        3, 0
	GOTO       L__check_cond228
L__check_cond227:
	BCF        3, 0
L__check_cond228:
	BTFSS      R0, 0
	GOTO       L__check_cond229
	BTFSS      3, 0
	GOTO       L__check_cond229
	BSF        R0, 0
	GOTO       L__check_cond230
L__check_cond229:
	BCF        R0, 0
L__check_cond230:
	BTFSS      R0, 0
	GOTO       L__check_cond231
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond231
	BSF        3, 0
	GOTO       L__check_cond232
L__check_cond231:
	BCF        3, 0
L__check_cond232:
	BTFSS      3, 0
	GOTO       L_check_cond35
	MOVLW      14
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond36
L_check_cond35:
;APP_OPSM.c,44 :: 		else if(COND15){ CHCK_COND(15); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond233
	BSF        3, 0
	GOTO       L__check_cond234
L__check_cond233:
	BCF        3, 0
L__check_cond234:
	BTFSS      3, 0
	GOTO       L__check_cond235
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond235
	BSF        R0, 0
	GOTO       L__check_cond236
L__check_cond235:
	BCF        R0, 0
L__check_cond236:
	BTFSS      R0, 0
	GOTO       L__check_cond237
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond237
	BSF        R0, 0
	GOTO       L__check_cond238
L__check_cond237:
	BCF        R0, 0
L__check_cond238:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond239
	BSF        3, 0
	GOTO       L__check_cond240
L__check_cond239:
	BCF        3, 0
L__check_cond240:
	BTFSS      R0, 0
	GOTO       L__check_cond241
	BTFSS      3, 0
	GOTO       L__check_cond241
	BSF        R0, 0
	GOTO       L__check_cond242
L__check_cond241:
	BCF        R0, 0
L__check_cond242:
	BTFSS      R0, 0
	GOTO       L_check_cond37
	MOVLW      15
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond38
L_check_cond37:
;APP_OPSM.c,45 :: 		else if(COND16){ CHCK_COND(16); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond243
	BSF        3, 0
	GOTO       L__check_cond244
L__check_cond243:
	BCF        3, 0
L__check_cond244:
	BTFSS      3, 0
	GOTO       L__check_cond245
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond245
	BSF        R0, 0
	GOTO       L__check_cond246
L__check_cond245:
	BCF        R0, 0
L__check_cond246:
	BTFSS      R0, 0
	GOTO       L__check_cond247
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond247
	BSF        3, 0
	GOTO       L__check_cond248
L__check_cond247:
	BCF        3, 0
L__check_cond248:
	BTFSS      3, 0
	GOTO       L__check_cond249
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond249
	BSF        R0, 0
	GOTO       L__check_cond250
L__check_cond249:
	BCF        R0, 0
L__check_cond250:
	BTFSS      R0, 0
	GOTO       L_check_cond39
	MOVLW      16
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond40
L_check_cond39:
;APP_OPSM.c,46 :: 		else {guc_choice = (TOTAL_COND - 1);}
	MOVLW      17
	MOVWF      _guc_choice+0
L_check_cond40:
L_check_cond38:
L_check_cond36:
L_check_cond34:
L_check_cond32:
L_check_cond30:
L_check_cond28:
L_check_cond26:
L_check_cond24:
L_check_cond22:
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
;APP_OPSM.c,67 :: 		uint8 fl_br = 0;
;APP_OPSM.c,68 :: 		switch(guc_choice)
	GOTO       L_exe_cond41
;APP_OPSM.c,70 :: 		case 1: guc_sec = 0; while(guc_sec<6 & COND1);
L_exe_cond43:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond44:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond253
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond253:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond254
	BSF        3, 0
	GOTO       L__exe_cond255
L__exe_cond254:
	BCF        3, 0
L__exe_cond255:
	BTFSS      PORTA+0, 5
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
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond45
	GOTO       L_exe_cond44
L_exe_cond45:
;APP_OPSM.c,71 :: 		if(COND1){ while(COND1){guc_buzz_state=1;}}
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond266
	BSF        3, 0
	GOTO       L__exe_cond267
L__exe_cond266:
	BCF        3, 0
L__exe_cond267:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond268
	BTFSS      3, 0
	GOTO       L__exe_cond268
	BSF        R2, 0
	GOTO       L__exe_cond269
L__exe_cond268:
	BCF        R2, 0
L__exe_cond269:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond270
	BSF        3, 0
	GOTO       L__exe_cond271
L__exe_cond270:
	BCF        3, 0
L__exe_cond271:
	BTFSS      R2, 0
	GOTO       L__exe_cond272
	BTFSS      3, 0
	GOTO       L__exe_cond272
	BSF        R2, 0
	GOTO       L__exe_cond273
L__exe_cond272:
	BCF        R2, 0
L__exe_cond273:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond274
	BSF        3, 0
	GOTO       L__exe_cond275
L__exe_cond274:
	BCF        3, 0
L__exe_cond275:
	BTFSS      R2, 0
	GOTO       L__exe_cond276
	BTFSS      3, 0
	GOTO       L__exe_cond276
	BSF        R2, 0
	GOTO       L__exe_cond277
L__exe_cond276:
	BCF        R2, 0
L__exe_cond277:
	BTFSS      R2, 0
	GOTO       L_exe_cond46
L_exe_cond47:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond278
	BSF        3, 0
	GOTO       L__exe_cond279
L__exe_cond278:
	BCF        3, 0
L__exe_cond279:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond280
	BTFSS      3, 0
	GOTO       L__exe_cond280
	BSF        R2, 0
	GOTO       L__exe_cond281
L__exe_cond280:
	BCF        R2, 0
L__exe_cond281:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond282
	BSF        3, 0
	GOTO       L__exe_cond283
L__exe_cond282:
	BCF        3, 0
L__exe_cond283:
	BTFSS      R2, 0
	GOTO       L__exe_cond284
	BTFSS      3, 0
	GOTO       L__exe_cond284
	BSF        R2, 0
	GOTO       L__exe_cond285
L__exe_cond284:
	BCF        R2, 0
L__exe_cond285:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond286
	BSF        3, 0
	GOTO       L__exe_cond287
L__exe_cond286:
	BCF        3, 0
L__exe_cond287:
	BTFSS      R2, 0
	GOTO       L__exe_cond288
	BTFSS      3, 0
	GOTO       L__exe_cond288
	BSF        R2, 0
	GOTO       L__exe_cond289
L__exe_cond288:
	BCF        R2, 0
L__exe_cond289:
	BTFSS      R2, 0
	GOTO       L_exe_cond48
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond47
L_exe_cond48:
L_exe_cond46:
;APP_OPSM.c,72 :: 		break;
	GOTO       L_exe_cond42
;APP_OPSM.c,74 :: 		case 5: RELAY_SOL = 1; guc_sec = 0; while(guc_sec<6 & COND5);
L_exe_cond49:
	BSF        PORTC+0, 5
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond50:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond290
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond290:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond291
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond291
	BSF        R2, 0
	GOTO       L__exe_cond292
L__exe_cond291:
	BCF        R2, 0
L__exe_cond292:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond293
	BSF        3, 0
	GOTO       L__exe_cond294
L__exe_cond293:
	BCF        3, 0
L__exe_cond294:
	BTFSS      R2, 0
	GOTO       L__exe_cond295
	BTFSS      3, 0
	GOTO       L__exe_cond295
	BSF        R2, 0
	GOTO       L__exe_cond296
L__exe_cond295:
	BCF        R2, 0
L__exe_cond296:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond297
	BSF        3, 0
	GOTO       L__exe_cond298
L__exe_cond297:
	BCF        3, 0
L__exe_cond298:
	BTFSS      R2, 0
	GOTO       L__exe_cond299
	BTFSS      3, 0
	GOTO       L__exe_cond299
	BSF        R2, 0
	GOTO       L__exe_cond300
L__exe_cond299:
	BCF        R2, 0
L__exe_cond300:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond51
	GOTO       L_exe_cond50
L_exe_cond51:
;APP_OPSM.c,75 :: 		if(COND5){while(COND5){guc_buzz_state=1;}}
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond301
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond301
	BSF        R2, 0
	GOTO       L__exe_cond302
L__exe_cond301:
	BCF        R2, 0
L__exe_cond302:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond303
	BSF        3, 0
	GOTO       L__exe_cond304
L__exe_cond303:
	BCF        3, 0
L__exe_cond304:
	BTFSS      R2, 0
	GOTO       L__exe_cond305
	BTFSS      3, 0
	GOTO       L__exe_cond305
	BSF        R2, 0
	GOTO       L__exe_cond306
L__exe_cond305:
	BCF        R2, 0
L__exe_cond306:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond307
	BSF        3, 0
	GOTO       L__exe_cond308
L__exe_cond307:
	BCF        3, 0
L__exe_cond308:
	BTFSS      R2, 0
	GOTO       L__exe_cond309
	BTFSS      3, 0
	GOTO       L__exe_cond309
	BSF        R2, 0
	GOTO       L__exe_cond310
L__exe_cond309:
	BCF        R2, 0
L__exe_cond310:
	BTFSS      R2, 0
	GOTO       L_exe_cond52
L_exe_cond53:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond311
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond311
	BSF        R2, 0
	GOTO       L__exe_cond312
L__exe_cond311:
	BCF        R2, 0
L__exe_cond312:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond313
	BSF        3, 0
	GOTO       L__exe_cond314
L__exe_cond313:
	BCF        3, 0
L__exe_cond314:
	BTFSS      R2, 0
	GOTO       L__exe_cond315
	BTFSS      3, 0
	GOTO       L__exe_cond315
	BSF        R2, 0
	GOTO       L__exe_cond316
L__exe_cond315:
	BCF        R2, 0
L__exe_cond316:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond317
	BSF        3, 0
	GOTO       L__exe_cond318
L__exe_cond317:
	BCF        3, 0
L__exe_cond318:
	BTFSS      R2, 0
	GOTO       L__exe_cond319
	BTFSS      3, 0
	GOTO       L__exe_cond319
	BSF        R2, 0
	GOTO       L__exe_cond320
L__exe_cond319:
	BCF        R2, 0
L__exe_cond320:
	BTFSS      R2, 0
	GOTO       L_exe_cond54
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond53
L_exe_cond54:
L_exe_cond52:
;APP_OPSM.c,76 :: 		break;
	GOTO       L_exe_cond42
;APP_OPSM.c,78 :: 		case 6: while(COND6){RELAY_SOL = 1; guc_buzz_state = 0;} break;
L_exe_cond55:
L_exe_cond56:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond321
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond321
	BSF        R2, 0
	GOTO       L__exe_cond322
L__exe_cond321:
	BCF        R2, 0
L__exe_cond322:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond323
	BSF        3, 0
	GOTO       L__exe_cond324
L__exe_cond323:
	BCF        3, 0
L__exe_cond324:
	BTFSS      R2, 0
	GOTO       L__exe_cond325
	BTFSS      3, 0
	GOTO       L__exe_cond325
	BSF        R2, 0
	GOTO       L__exe_cond326
L__exe_cond325:
	BCF        R2, 0
L__exe_cond326:
	BTFSS      R2, 0
	GOTO       L__exe_cond327
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond327
	BSF        3, 0
	GOTO       L__exe_cond328
L__exe_cond327:
	BCF        3, 0
L__exe_cond328:
	BTFSS      3, 0
	GOTO       L_exe_cond57
	BSF        PORTC+0, 5
	CLRF       _guc_buzz_state+0
	GOTO       L_exe_cond56
L_exe_cond57:
	GOTO       L_exe_cond42
;APP_OPSM.c,80 :: 		case 9: guc_sec = 0; while(guc_sec < 6 & COND9);
L_exe_cond58:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond59:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond329
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond329:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond330
	BSF        R2, 0
	GOTO       L__exe_cond331
L__exe_cond330:
	BCF        R2, 0
L__exe_cond331:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond332
	BSF        3, 0
	GOTO       L__exe_cond333
L__exe_cond332:
	BCF        3, 0
L__exe_cond333:
	BTFSS      R2, 0
	GOTO       L__exe_cond334
	BTFSS      3, 0
	GOTO       L__exe_cond334
	BSF        R2, 0
	GOTO       L__exe_cond335
L__exe_cond334:
	BCF        R2, 0
L__exe_cond335:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond336
	BSF        3, 0
	GOTO       L__exe_cond337
L__exe_cond336:
	BCF        3, 0
L__exe_cond337:
	BTFSS      R2, 0
	GOTO       L__exe_cond338
	BTFSS      3, 0
	GOTO       L__exe_cond338
	BSF        R2, 0
	GOTO       L__exe_cond339
L__exe_cond338:
	BCF        R2, 0
L__exe_cond339:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond340
	BSF        3, 0
	GOTO       L__exe_cond341
L__exe_cond340:
	BCF        3, 0
L__exe_cond341:
	BTFSS      R2, 0
	GOTO       L__exe_cond342
	BTFSS      3, 0
	GOTO       L__exe_cond342
	BSF        R2, 0
	GOTO       L__exe_cond343
L__exe_cond342:
	BCF        R2, 0
L__exe_cond343:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond60
	GOTO       L_exe_cond59
L_exe_cond60:
;APP_OPSM.c,81 :: 		if(COND9){ while(COND9){guc_buzz_state = 1;}}
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond344
	BSF        R2, 0
	GOTO       L__exe_cond345
L__exe_cond344:
	BCF        R2, 0
L__exe_cond345:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond346
	BSF        3, 0
	GOTO       L__exe_cond347
L__exe_cond346:
	BCF        3, 0
L__exe_cond347:
	BTFSS      R2, 0
	GOTO       L__exe_cond348
	BTFSS      3, 0
	GOTO       L__exe_cond348
	BSF        R2, 0
	GOTO       L__exe_cond349
L__exe_cond348:
	BCF        R2, 0
L__exe_cond349:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond350
	BSF        3, 0
	GOTO       L__exe_cond351
L__exe_cond350:
	BCF        3, 0
L__exe_cond351:
	BTFSS      R2, 0
	GOTO       L__exe_cond352
	BTFSS      3, 0
	GOTO       L__exe_cond352
	BSF        R2, 0
	GOTO       L__exe_cond353
L__exe_cond352:
	BCF        R2, 0
L__exe_cond353:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond354
	BSF        3, 0
	GOTO       L__exe_cond355
L__exe_cond354:
	BCF        3, 0
L__exe_cond355:
	BTFSS      R2, 0
	GOTO       L__exe_cond356
	BTFSS      3, 0
	GOTO       L__exe_cond356
	BSF        R2, 0
	GOTO       L__exe_cond357
L__exe_cond356:
	BCF        R2, 0
L__exe_cond357:
	BTFSS      R2, 0
	GOTO       L_exe_cond61
L_exe_cond62:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond358
	BSF        R2, 0
	GOTO       L__exe_cond359
L__exe_cond358:
	BCF        R2, 0
L__exe_cond359:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond360
	BSF        3, 0
	GOTO       L__exe_cond361
L__exe_cond360:
	BCF        3, 0
L__exe_cond361:
	BTFSS      R2, 0
	GOTO       L__exe_cond362
	BTFSS      3, 0
	GOTO       L__exe_cond362
	BSF        R2, 0
	GOTO       L__exe_cond363
L__exe_cond362:
	BCF        R2, 0
L__exe_cond363:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond364
	BSF        3, 0
	GOTO       L__exe_cond365
L__exe_cond364:
	BCF        3, 0
L__exe_cond365:
	BTFSS      R2, 0
	GOTO       L__exe_cond366
	BTFSS      3, 0
	GOTO       L__exe_cond366
	BSF        R2, 0
	GOTO       L__exe_cond367
L__exe_cond366:
	BCF        R2, 0
L__exe_cond367:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond368
	BSF        3, 0
	GOTO       L__exe_cond369
L__exe_cond368:
	BCF        3, 0
L__exe_cond369:
	BTFSS      R2, 0
	GOTO       L__exe_cond370
	BTFSS      3, 0
	GOTO       L__exe_cond370
	BSF        R2, 0
	GOTO       L__exe_cond371
L__exe_cond370:
	BCF        R2, 0
L__exe_cond371:
	BTFSS      R2, 0
	GOTO       L_exe_cond63
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond62
L_exe_cond63:
L_exe_cond61:
;APP_OPSM.c,82 :: 		break;
	GOTO       L_exe_cond42
;APP_OPSM.c,84 :: 		case 13: guc_sec = 0; while(guc_sec < 6 & COND13);
L_exe_cond64:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond65:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond372
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond372:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond373
	BSF        3, 0
	GOTO       L__exe_cond374
L__exe_cond373:
	BCF        3, 0
L__exe_cond374:
	BTFSS      3, 0
	GOTO       L__exe_cond375
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond375
	BSF        R2, 0
	GOTO       L__exe_cond376
L__exe_cond375:
	BCF        R2, 0
L__exe_cond376:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond377
	BSF        3, 0
	GOTO       L__exe_cond378
L__exe_cond377:
	BCF        3, 0
L__exe_cond378:
	BTFSS      R2, 0
	GOTO       L__exe_cond379
	BTFSS      3, 0
	GOTO       L__exe_cond379
	BSF        R2, 0
	GOTO       L__exe_cond380
L__exe_cond379:
	BCF        R2, 0
L__exe_cond380:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond381
	BSF        3, 0
	GOTO       L__exe_cond382
L__exe_cond381:
	BCF        3, 0
L__exe_cond382:
	BTFSS      R2, 0
	GOTO       L__exe_cond383
	BTFSS      3, 0
	GOTO       L__exe_cond383
	BSF        R2, 0
	GOTO       L__exe_cond384
L__exe_cond383:
	BCF        R2, 0
L__exe_cond384:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond66
	GOTO       L_exe_cond65
L_exe_cond66:
;APP_OPSM.c,85 :: 		if(COND13)
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond385
	BSF        3, 0
	GOTO       L__exe_cond386
L__exe_cond385:
	BCF        3, 0
L__exe_cond386:
	BTFSS      3, 0
	GOTO       L__exe_cond387
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond387
	BSF        R2, 0
	GOTO       L__exe_cond388
L__exe_cond387:
	BCF        R2, 0
L__exe_cond388:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond389
	BSF        3, 0
	GOTO       L__exe_cond390
L__exe_cond389:
	BCF        3, 0
L__exe_cond390:
	BTFSS      R2, 0
	GOTO       L__exe_cond391
	BTFSS      3, 0
	GOTO       L__exe_cond391
	BSF        R2, 0
	GOTO       L__exe_cond392
L__exe_cond391:
	BCF        R2, 0
L__exe_cond392:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond393
	BSF        3, 0
	GOTO       L__exe_cond394
L__exe_cond393:
	BCF        3, 0
L__exe_cond394:
	BTFSS      R2, 0
	GOTO       L__exe_cond395
	BTFSS      3, 0
	GOTO       L__exe_cond395
	BSF        R2, 0
	GOTO       L__exe_cond396
L__exe_cond395:
	BCF        R2, 0
L__exe_cond396:
	BTFSS      R2, 0
	GOTO       L_exe_cond67
;APP_OPSM.c,87 :: 		guc_sec = 0; guc_buzz_state = 1; RELAY_SOL = 1;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	BSF        PORTC+0, 5
;APP_OPSM.c,88 :: 		while(guc_sec < 6);while(COND13);
L_exe_cond68:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond397
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond397:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond69
	GOTO       L_exe_cond68
L_exe_cond69:
L_exe_cond70:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond398
	BSF        3, 0
	GOTO       L__exe_cond399
L__exe_cond398:
	BCF        3, 0
L__exe_cond399:
	BTFSS      3, 0
	GOTO       L__exe_cond400
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond400
	BSF        R2, 0
	GOTO       L__exe_cond401
L__exe_cond400:
	BCF        R2, 0
L__exe_cond401:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond402
	BSF        3, 0
	GOTO       L__exe_cond403
L__exe_cond402:
	BCF        3, 0
L__exe_cond403:
	BTFSS      R2, 0
	GOTO       L__exe_cond404
	BTFSS      3, 0
	GOTO       L__exe_cond404
	BSF        R2, 0
	GOTO       L__exe_cond405
L__exe_cond404:
	BCF        R2, 0
L__exe_cond405:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond406
	BSF        3, 0
	GOTO       L__exe_cond407
L__exe_cond406:
	BCF        3, 0
L__exe_cond407:
	BTFSS      R2, 0
	GOTO       L__exe_cond408
	BTFSS      3, 0
	GOTO       L__exe_cond408
	BSF        R2, 0
	GOTO       L__exe_cond409
L__exe_cond408:
	BCF        R2, 0
L__exe_cond409:
	BTFSS      R2, 0
	GOTO       L_exe_cond71
	GOTO       L_exe_cond70
L_exe_cond71:
;APP_OPSM.c,89 :: 		}
L_exe_cond67:
;APP_OPSM.c,90 :: 		break;
	GOTO       L_exe_cond42
;APP_OPSM.c,92 :: 		case 14: guc_buzz_state = 0; guc_sec = 0; while(guc_sec<6 & COND14);
L_exe_cond72:
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond73:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond410
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond410:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond411
	BSF        3, 0
	GOTO       L__exe_cond412
L__exe_cond411:
	BCF        3, 0
L__exe_cond412:
	BTFSS      3, 0
	GOTO       L__exe_cond413
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond413
	BSF        R2, 0
	GOTO       L__exe_cond414
L__exe_cond413:
	BCF        R2, 0
L__exe_cond414:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond415
	BSF        3, 0
	GOTO       L__exe_cond416
L__exe_cond415:
	BCF        3, 0
L__exe_cond416:
	BTFSS      R2, 0
	GOTO       L__exe_cond417
	BTFSS      3, 0
	GOTO       L__exe_cond417
	BSF        R2, 0
	GOTO       L__exe_cond418
L__exe_cond417:
	BCF        R2, 0
L__exe_cond418:
	BTFSS      R2, 0
	GOTO       L__exe_cond419
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond419
	BSF        3, 0
	GOTO       L__exe_cond420
L__exe_cond419:
	BCF        3, 0
L__exe_cond420:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond74
	GOTO       L_exe_cond73
L_exe_cond74:
;APP_OPSM.c,93 :: 		if(COND14)
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond421
	BSF        3, 0
	GOTO       L__exe_cond422
L__exe_cond421:
	BCF        3, 0
L__exe_cond422:
	BTFSS      3, 0
	GOTO       L__exe_cond423
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond423
	BSF        R2, 0
	GOTO       L__exe_cond424
L__exe_cond423:
	BCF        R2, 0
L__exe_cond424:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond425
	BSF        3, 0
	GOTO       L__exe_cond426
L__exe_cond425:
	BCF        3, 0
L__exe_cond426:
	BTFSS      R2, 0
	GOTO       L__exe_cond427
	BTFSS      3, 0
	GOTO       L__exe_cond427
	BSF        R2, 0
	GOTO       L__exe_cond428
L__exe_cond427:
	BCF        R2, 0
L__exe_cond428:
	BTFSS      R2, 0
	GOTO       L__exe_cond429
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond429
	BSF        3, 0
	GOTO       L__exe_cond430
L__exe_cond429:
	BCF        3, 0
L__exe_cond430:
	BTFSS      3, 0
	GOTO       L_exe_cond75
;APP_OPSM.c,95 :: 		guc_sec = 0;RELAY_SOL = 1;while(guc_sec < 6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond76:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond431
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond431:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond77
	GOTO       L_exe_cond76
L_exe_cond77:
;APP_OPSM.c,96 :: 		while(COND14);
L_exe_cond78:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond432
	BSF        3, 0
	GOTO       L__exe_cond433
L__exe_cond432:
	BCF        3, 0
L__exe_cond433:
	BTFSS      3, 0
	GOTO       L__exe_cond434
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond434
	BSF        R2, 0
	GOTO       L__exe_cond435
L__exe_cond434:
	BCF        R2, 0
L__exe_cond435:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond436
	BSF        3, 0
	GOTO       L__exe_cond437
L__exe_cond436:
	BCF        3, 0
L__exe_cond437:
	BTFSS      R2, 0
	GOTO       L__exe_cond438
	BTFSS      3, 0
	GOTO       L__exe_cond438
	BSF        R2, 0
	GOTO       L__exe_cond439
L__exe_cond438:
	BCF        R2, 0
L__exe_cond439:
	BTFSS      R2, 0
	GOTO       L__exe_cond440
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond440
	BSF        3, 0
	GOTO       L__exe_cond441
L__exe_cond440:
	BCF        3, 0
L__exe_cond441:
	BTFSS      3, 0
	GOTO       L_exe_cond79
	GOTO       L_exe_cond78
L_exe_cond79:
;APP_OPSM.c,97 :: 		}
L_exe_cond75:
;APP_OPSM.c,98 :: 		break;
	GOTO       L_exe_cond42
;APP_OPSM.c,141 :: 		default: break;
L_exe_cond80:
	GOTO       L_exe_cond42
;APP_OPSM.c,142 :: 		}
L_exe_cond41:
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond43
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond49
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond55
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond58
	MOVF       _guc_choice+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond64
	MOVF       _guc_choice+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond72
	GOTO       L_exe_cond80
L_exe_cond42:
;APP_OPSM.c,143 :: 		reset_all();
	CALL       _reset_all+0
;APP_OPSM.c,144 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,147 :: 		void sys_init()
;APP_OPSM.c,149 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,151 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,152 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,153 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,154 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,156 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,157 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,158 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,159 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,161 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,162 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,164 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,165 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,167 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,172 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP_OPSM.c,175 :: 		void main()
;APP_OPSM.c,177 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,178 :: 		while(1)
L_main81:
;APP_OPSM.c,180 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,181 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main83
;APP_OPSM.c,183 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,184 :: 		}
L_main83:
;APP_OPSM.c,185 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,186 :: 		}
	GOTO       L_main81
;APP_OPSM.c,187 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
