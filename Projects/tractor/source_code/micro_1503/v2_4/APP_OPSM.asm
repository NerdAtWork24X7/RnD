
_interrupt:

;APP_OPSM.c,14 :: 		void interrupt()
;APP_OPSM.c,16 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt99:
;APP_OPSM.c,18 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,27 :: 		}
L_interrupt2:
;APP_OPSM.c,29 :: 		}
L_end_interrupt:
L__interrupt104:
	RETFIE     %s
; end of _interrupt

_CHCK_COND:

;APP_OPSM.c,31 :: 		void CHCK_COND(uint8 x)
;APP_OPSM.c,34 :: 		guc_deb[x]++;
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
;APP_OPSM.c,35 :: 		for(i=0;i<=TOTAL_COND && i!=x;i++){guc_deb[i] = 0;}
	CLRF       R4+0
L_CHCK_COND3:
	MOVF       R4+0, 0
	SUBLW      15
	BTFSS      STATUS+0, 0
	GOTO       L_CHCK_COND4
	MOVF       R4+0, 0
	XORWF      FARG_CHCK_COND_x+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CHCK_COND4
L__CHCK_COND100:
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
;APP_OPSM.c,36 :: 		if(guc_deb[x] > DEBO_TIME){ guc_choice = x; guc_deb[x] = 0;}
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
	SUBLW      78
	BTFSS      STATUS+0, 2
	GOTO       L__CHCK_COND106
	MOVF       R1, 0
	SUBLW      32
L__CHCK_COND106:
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
;APP_OPSM.c,37 :: 		}
L_end_CHCK_COND:
	RETURN
; end of _CHCK_COND

_check_cond:

;APP_OPSM.c,40 :: 		void check_cond()
;APP_OPSM.c,42 :: 		guc_choice = 0;
	CLRF       _guc_choice+0
;APP_OPSM.c,43 :: 		if(COND1){ CHCK_COND(1); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond108
	BSF        R0, 0
	GOTO       L__check_cond109
L__check_cond108:
	BCF        R0, 0
L__check_cond109:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond110
	BSF        3, 0
	GOTO       L__check_cond111
L__check_cond110:
	BCF        3, 0
L__check_cond111:
	BTFSS      R0, 0
	GOTO       L__check_cond112
	BTFSS      3, 0
	GOTO       L__check_cond112
	BSF        R0, 0
	GOTO       L__check_cond113
L__check_cond112:
	BCF        R0, 0
L__check_cond113:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond114
	BSF        3, 0
	GOTO       L__check_cond115
L__check_cond114:
	BCF        3, 0
L__check_cond115:
	BTFSS      R0, 0
	GOTO       L__check_cond116
	BTFSS      3, 0
	GOTO       L__check_cond116
	BSF        R0, 0
	GOTO       L__check_cond117
L__check_cond116:
	BCF        R0, 0
L__check_cond117:
	BTFSS      R0, 0
	GOTO       L__check_cond118
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond118
	BSF        3, 0
	GOTO       L__check_cond119
L__check_cond118:
	BCF        3, 0
L__check_cond119:
	BTFSS      3, 0
	GOTO       L_check_cond9
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond10
L_check_cond9:
;APP_OPSM.c,44 :: 		else if(COND2){ CHCK_COND(2); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond120
	BSF        3, 0
	GOTO       L__check_cond121
L__check_cond120:
	BCF        3, 0
L__check_cond121:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond122
	BTFSS      3, 0
	GOTO       L__check_cond122
	BSF        R0, 0
	GOTO       L__check_cond123
L__check_cond122:
	BCF        R0, 0
L__check_cond123:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond124
	BSF        3, 0
	GOTO       L__check_cond125
L__check_cond124:
	BCF        3, 0
L__check_cond125:
	BTFSS      R0, 0
	GOTO       L__check_cond126
	BTFSS      3, 0
	GOTO       L__check_cond126
	BSF        R0, 0
	GOTO       L__check_cond127
L__check_cond126:
	BCF        R0, 0
L__check_cond127:
	BTFSS      R0, 0
	GOTO       L__check_cond128
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond128
	BSF        3, 0
	GOTO       L__check_cond129
L__check_cond128:
	BCF        3, 0
L__check_cond129:
	BTFSS      3, 0
	GOTO       L_check_cond11
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond12
L_check_cond11:
;APP_OPSM.c,45 :: 		else if(COND3){ CHCK_COND(3); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond130
	BSF        R0, 0
	GOTO       L__check_cond131
L__check_cond130:
	BCF        R0, 0
L__check_cond131:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond132
	BSF        3, 0
	GOTO       L__check_cond133
L__check_cond132:
	BCF        3, 0
L__check_cond133:
	BTFSS      R0, 0
	GOTO       L__check_cond134
	BTFSS      3, 0
	GOTO       L__check_cond134
	BSF        R0, 0
	GOTO       L__check_cond135
L__check_cond134:
	BCF        R0, 0
L__check_cond135:
	BTFSS      R0, 0
	GOTO       L__check_cond136
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond136
	BSF        3, 0
	GOTO       L__check_cond137
L__check_cond136:
	BCF        3, 0
L__check_cond137:
	BTFSS      3, 0
	GOTO       L__check_cond138
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond138
	BSF        R0, 0
	GOTO       L__check_cond139
L__check_cond138:
	BCF        R0, 0
L__check_cond139:
	BTFSS      R0, 0
	GOTO       L_check_cond13
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond14
L_check_cond13:
;APP_OPSM.c,46 :: 		else if(COND4){ CHCK_COND(4); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond140
	BSF        3, 0
	GOTO       L__check_cond141
L__check_cond140:
	BCF        3, 0
L__check_cond141:
	BTFSS      3, 0
	GOTO       L__check_cond142
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond142
	BSF        R0, 0
	GOTO       L__check_cond143
L__check_cond142:
	BCF        R0, 0
L__check_cond143:
	BTFSS      R0, 0
	GOTO       L__check_cond144
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond144
	BSF        3, 0
	GOTO       L__check_cond145
L__check_cond144:
	BCF        3, 0
L__check_cond145:
	BTFSS      3, 0
	GOTO       L__check_cond146
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond146
	BSF        R0, 0
	GOTO       L__check_cond147
L__check_cond146:
	BCF        R0, 0
L__check_cond147:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond16
L_check_cond15:
;APP_OPSM.c,47 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond148
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond148
	BSF        3, 0
	GOTO       L__check_cond149
L__check_cond148:
	BCF        3, 0
L__check_cond149:
	BTFSS      3, 0
	GOTO       L__check_cond150
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond150
	BSF        R0, 0
	GOTO       L__check_cond151
L__check_cond150:
	BCF        R0, 0
L__check_cond151:
	BTFSS      R0, 0
	GOTO       L__check_cond152
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond152
	BSF        3, 0
	GOTO       L__check_cond153
L__check_cond152:
	BCF        3, 0
L__check_cond153:
	BTFSS      3, 0
	GOTO       L_check_cond17
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond18
L_check_cond17:
;APP_OPSM.c,48 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond154
	BSF        3, 0
	GOTO       L__check_cond155
L__check_cond154:
	BCF        3, 0
L__check_cond155:
	BTFSS      3, 0
	GOTO       L__check_cond156
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond156
	BSF        R0, 0
	GOTO       L__check_cond157
L__check_cond156:
	BCF        R0, 0
L__check_cond157:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond158
	BSF        3, 0
	GOTO       L__check_cond159
L__check_cond158:
	BCF        3, 0
L__check_cond159:
	BTFSS      R0, 0
	GOTO       L__check_cond160
	BTFSS      3, 0
	GOTO       L__check_cond160
	BSF        R0, 0
	GOTO       L__check_cond161
L__check_cond160:
	BCF        R0, 0
L__check_cond161:
	BTFSS      R0, 0
	GOTO       L__check_cond162
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond162
	BSF        3, 0
	GOTO       L__check_cond163
L__check_cond162:
	BCF        3, 0
L__check_cond163:
	BTFSS      3, 0
	GOTO       L_check_cond19
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond20
L_check_cond19:
;APP_OPSM.c,49 :: 		else if(COND7){ CHCK_COND(7); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond164
	BSF        3, 0
	GOTO       L__check_cond165
L__check_cond164:
	BCF        3, 0
L__check_cond165:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond166
	BTFSS      3, 0
	GOTO       L__check_cond166
	BSF        R0, 0
	GOTO       L__check_cond167
L__check_cond166:
	BCF        R0, 0
L__check_cond167:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond168
	BSF        3, 0
	GOTO       L__check_cond169
L__check_cond168:
	BCF        3, 0
L__check_cond169:
	BTFSS      R0, 0
	GOTO       L__check_cond170
	BTFSS      3, 0
	GOTO       L__check_cond170
	BSF        R0, 0
	GOTO       L__check_cond171
L__check_cond170:
	BCF        R0, 0
L__check_cond171:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond172
	BSF        3, 0
	GOTO       L__check_cond173
L__check_cond172:
	BCF        3, 0
L__check_cond173:
	BTFSS      R0, 0
	GOTO       L__check_cond174
	BTFSS      3, 0
	GOTO       L__check_cond174
	BSF        R0, 0
	GOTO       L__check_cond175
L__check_cond174:
	BCF        R0, 0
L__check_cond175:
	BTFSS      R0, 0
	GOTO       L_check_cond21
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond22
L_check_cond21:
;APP_OPSM.c,50 :: 		else if(COND8){ CHCK_COND(8); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond176
	BSF        R0, 0
	GOTO       L__check_cond177
L__check_cond176:
	BCF        R0, 0
L__check_cond177:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond178
	BSF        3, 0
	GOTO       L__check_cond179
L__check_cond178:
	BCF        3, 0
L__check_cond179:
	BTFSS      R0, 0
	GOTO       L__check_cond180
	BTFSS      3, 0
	GOTO       L__check_cond180
	BSF        R0, 0
	GOTO       L__check_cond181
L__check_cond180:
	BCF        R0, 0
L__check_cond181:
	BTFSS      R0, 0
	GOTO       L__check_cond182
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond182
	BSF        R0, 0
	GOTO       L__check_cond183
L__check_cond182:
	BCF        R0, 0
L__check_cond183:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond184
	BSF        3, 0
	GOTO       L__check_cond185
L__check_cond184:
	BCF        3, 0
L__check_cond185:
	BTFSS      R0, 0
	GOTO       L__check_cond186
	BTFSS      3, 0
	GOTO       L__check_cond186
	BSF        R0, 0
	GOTO       L__check_cond187
L__check_cond186:
	BCF        R0, 0
L__check_cond187:
	BTFSS      R0, 0
	GOTO       L_check_cond23
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond24
L_check_cond23:
;APP_OPSM.c,51 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond188
	BSF        R0, 0
	GOTO       L__check_cond189
L__check_cond188:
	BCF        R0, 0
L__check_cond189:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond190
	BSF        3, 0
	GOTO       L__check_cond191
L__check_cond190:
	BCF        3, 0
L__check_cond191:
	BTFSS      R0, 0
	GOTO       L__check_cond192
	BTFSS      3, 0
	GOTO       L__check_cond192
	BSF        R0, 0
	GOTO       L__check_cond193
L__check_cond192:
	BCF        R0, 0
L__check_cond193:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond194
	BSF        3, 0
	GOTO       L__check_cond195
L__check_cond194:
	BCF        3, 0
L__check_cond195:
	BTFSS      R0, 0
	GOTO       L__check_cond196
	BTFSS      3, 0
	GOTO       L__check_cond196
	BSF        R0, 0
	GOTO       L__check_cond197
L__check_cond196:
	BCF        R0, 0
L__check_cond197:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond198
	BSF        3, 0
	GOTO       L__check_cond199
L__check_cond198:
	BCF        3, 0
L__check_cond199:
	BTFSS      R0, 0
	GOTO       L__check_cond200
	BTFSS      3, 0
	GOTO       L__check_cond200
	BSF        R0, 0
	GOTO       L__check_cond201
L__check_cond200:
	BCF        R0, 0
L__check_cond201:
	BTFSS      R0, 0
	GOTO       L_check_cond25
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond26
L_check_cond25:
;APP_OPSM.c,52 :: 		else if(COND10){ CHCK_COND(10); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond202
	BSF        3, 0
	GOTO       L__check_cond203
L__check_cond202:
	BCF        3, 0
L__check_cond203:
	BTFSS      3, 0
	GOTO       L__check_cond204
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond204
	BSF        R0, 0
	GOTO       L__check_cond205
L__check_cond204:
	BCF        R0, 0
L__check_cond205:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond206
	BSF        3, 0
	GOTO       L__check_cond207
L__check_cond206:
	BCF        3, 0
L__check_cond207:
	BTFSS      R0, 0
	GOTO       L__check_cond208
	BTFSS      3, 0
	GOTO       L__check_cond208
	BSF        R0, 0
	GOTO       L__check_cond209
L__check_cond208:
	BCF        R0, 0
L__check_cond209:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond210
	BSF        3, 0
	GOTO       L__check_cond211
L__check_cond210:
	BCF        3, 0
L__check_cond211:
	BTFSS      R0, 0
	GOTO       L__check_cond212
	BTFSS      3, 0
	GOTO       L__check_cond212
	BSF        R0, 0
	GOTO       L__check_cond213
L__check_cond212:
	BCF        R0, 0
L__check_cond213:
	BTFSS      R0, 0
	GOTO       L_check_cond27
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond28
L_check_cond27:
;APP_OPSM.c,53 :: 		else if(COND11){ CHCK_COND(11); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond214
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond214
	BSF        3, 0
	GOTO       L__check_cond215
L__check_cond214:
	BCF        3, 0
L__check_cond215:
	BTFSS      3, 0
	GOTO       L__check_cond216
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond216
	BSF        R0, 0
	GOTO       L__check_cond217
L__check_cond216:
	BCF        R0, 0
L__check_cond217:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond218
	BSF        3, 0
	GOTO       L__check_cond219
L__check_cond218:
	BCF        3, 0
L__check_cond219:
	BTFSS      R0, 0
	GOTO       L__check_cond220
	BTFSS      3, 0
	GOTO       L__check_cond220
	BSF        R0, 0
	GOTO       L__check_cond221
L__check_cond220:
	BCF        R0, 0
L__check_cond221:
	BTFSS      R0, 0
	GOTO       L_check_cond29
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond30
L_check_cond29:
;APP_OPSM.c,54 :: 		else if(COND12){ CHCK_COND(12); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond222
	BSF        3, 0
	GOTO       L__check_cond223
L__check_cond222:
	BCF        3, 0
L__check_cond223:
	BTFSS      3, 0
	GOTO       L__check_cond224
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond224
	BSF        R0, 0
	GOTO       L__check_cond225
L__check_cond224:
	BCF        R0, 0
L__check_cond225:
	BTFSS      R0, 0
	GOTO       L__check_cond226
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond226
	BSF        R0, 0
	GOTO       L__check_cond227
L__check_cond226:
	BCF        R0, 0
L__check_cond227:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond228
	BSF        3, 0
	GOTO       L__check_cond229
L__check_cond228:
	BCF        3, 0
L__check_cond229:
	BTFSS      R0, 0
	GOTO       L__check_cond230
	BTFSS      3, 0
	GOTO       L__check_cond230
	BSF        R0, 0
	GOTO       L__check_cond231
L__check_cond230:
	BCF        R0, 0
L__check_cond231:
	BTFSS      R0, 0
	GOTO       L_check_cond31
	MOVLW      12
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond32
L_check_cond31:
;APP_OPSM.c,55 :: 		else {guc_choice = 14;}
	MOVLW      14
	MOVWF      _guc_choice+0
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
;APP_OPSM.c,56 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_reset_all:

;APP_OPSM.c,58 :: 		void reset_all()
;APP_OPSM.c,60 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,61 :: 		P_IND = 0;
	BCF        PORTC+0, 3
;APP_OPSM.c,62 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,63 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,64 :: 		}
L_end_reset_all:
	RETURN
; end of _reset_all

_wait_cond:

;APP_OPSM.c,66 :: 		void wait_cond()
;APP_OPSM.c,68 :: 		if(guc_choice == 1){ while(COND1); }
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond33
L_wait_cond34:
	BTFSC      PORTC+0, 2
	GOTO       L__wait_cond234
	BSF        R1, 0
	GOTO       L__wait_cond235
L__wait_cond234:
	BCF        R1, 0
L__wait_cond235:
	BTFSC      PORTC+0, 1
	GOTO       L__wait_cond236
	BSF        3, 0
	GOTO       L__wait_cond237
L__wait_cond236:
	BCF        3, 0
L__wait_cond237:
	BTFSS      R1, 0
	GOTO       L__wait_cond238
	BTFSS      3, 0
	GOTO       L__wait_cond238
	BSF        R1, 0
	GOTO       L__wait_cond239
L__wait_cond238:
	BCF        R1, 0
L__wait_cond239:
	BTFSC      PORTC+0, 0
	GOTO       L__wait_cond240
	BSF        3, 0
	GOTO       L__wait_cond241
L__wait_cond240:
	BCF        3, 0
L__wait_cond241:
	BTFSS      R1, 0
	GOTO       L__wait_cond242
	BTFSS      3, 0
	GOTO       L__wait_cond242
	BSF        R1, 0
	GOTO       L__wait_cond243
L__wait_cond242:
	BCF        R1, 0
L__wait_cond243:
	BTFSS      R1, 0
	GOTO       L__wait_cond244
	BTFSS      PORTA+0, 5
	GOTO       L__wait_cond244
	BSF        3, 0
	GOTO       L__wait_cond245
L__wait_cond244:
	BCF        3, 0
L__wait_cond245:
	BTFSS      3, 0
	GOTO       L_wait_cond35
	GOTO       L_wait_cond34
L_wait_cond35:
	GOTO       L_wait_cond36
L_wait_cond33:
;APP_OPSM.c,69 :: 		else if(guc_choice == 2){ while(COND2); }
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond37
L_wait_cond38:
	BTFSC      PORTC+0, 1
	GOTO       L__wait_cond246
	BSF        3, 0
	GOTO       L__wait_cond247
L__wait_cond246:
	BCF        3, 0
L__wait_cond247:
	BTFSS      PORTC+0, 2
	GOTO       L__wait_cond248
	BTFSS      3, 0
	GOTO       L__wait_cond248
	BSF        R1, 0
	GOTO       L__wait_cond249
L__wait_cond248:
	BCF        R1, 0
L__wait_cond249:
	BTFSC      PORTC+0, 0
	GOTO       L__wait_cond250
	BSF        3, 0
	GOTO       L__wait_cond251
L__wait_cond250:
	BCF        3, 0
L__wait_cond251:
	BTFSS      R1, 0
	GOTO       L__wait_cond252
	BTFSS      3, 0
	GOTO       L__wait_cond252
	BSF        R1, 0
	GOTO       L__wait_cond253
L__wait_cond252:
	BCF        R1, 0
L__wait_cond253:
	BTFSS      R1, 0
	GOTO       L__wait_cond254
	BTFSS      PORTA+0, 5
	GOTO       L__wait_cond254
	BSF        3, 0
	GOTO       L__wait_cond255
L__wait_cond254:
	BCF        3, 0
L__wait_cond255:
	BTFSS      3, 0
	GOTO       L_wait_cond39
	GOTO       L_wait_cond38
L_wait_cond39:
	GOTO       L_wait_cond40
L_wait_cond37:
;APP_OPSM.c,70 :: 		else if(guc_choice == 3){ while(COND3); }
	MOVF       _guc_choice+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond41
L_wait_cond42:
	BTFSC      PORTC+0, 2
	GOTO       L__wait_cond256
	BSF        R1, 0
	GOTO       L__wait_cond257
L__wait_cond256:
	BCF        R1, 0
L__wait_cond257:
	BTFSC      PORTC+0, 1
	GOTO       L__wait_cond258
	BSF        3, 0
	GOTO       L__wait_cond259
L__wait_cond258:
	BCF        3, 0
L__wait_cond259:
	BTFSS      R1, 0
	GOTO       L__wait_cond260
	BTFSS      3, 0
	GOTO       L__wait_cond260
	BSF        R1, 0
	GOTO       L__wait_cond261
L__wait_cond260:
	BCF        R1, 0
L__wait_cond261:
	BTFSS      R1, 0
	GOTO       L__wait_cond262
	BTFSS      PORTC+0, 0
	GOTO       L__wait_cond262
	BSF        3, 0
	GOTO       L__wait_cond263
L__wait_cond262:
	BCF        3, 0
L__wait_cond263:
	BTFSS      3, 0
	GOTO       L__wait_cond264
	BTFSS      PORTA+0, 5
	GOTO       L__wait_cond264
	BSF        R1, 0
	GOTO       L__wait_cond265
L__wait_cond264:
	BCF        R1, 0
L__wait_cond265:
	BTFSS      R1, 0
	GOTO       L_wait_cond43
	GOTO       L_wait_cond42
L_wait_cond43:
	GOTO       L_wait_cond44
L_wait_cond41:
;APP_OPSM.c,71 :: 		else if(guc_choice == 4){ while(COND4); }
	MOVF       _guc_choice+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond45
L_wait_cond46:
	BTFSC      PORTC+0, 2
	GOTO       L__wait_cond266
	BSF        3, 0
	GOTO       L__wait_cond267
L__wait_cond266:
	BCF        3, 0
L__wait_cond267:
	BTFSS      3, 0
	GOTO       L__wait_cond268
	BTFSS      PORTC+0, 1
	GOTO       L__wait_cond268
	BSF        R1, 0
	GOTO       L__wait_cond269
L__wait_cond268:
	BCF        R1, 0
L__wait_cond269:
	BTFSS      R1, 0
	GOTO       L__wait_cond270
	BTFSS      PORTC+0, 0
	GOTO       L__wait_cond270
	BSF        3, 0
	GOTO       L__wait_cond271
L__wait_cond270:
	BCF        3, 0
L__wait_cond271:
	BTFSS      3, 0
	GOTO       L__wait_cond272
	BTFSS      PORTA+0, 5
	GOTO       L__wait_cond272
	BSF        R1, 0
	GOTO       L__wait_cond273
L__wait_cond272:
	BCF        R1, 0
L__wait_cond273:
	BTFSS      R1, 0
	GOTO       L_wait_cond47
	GOTO       L_wait_cond46
L_wait_cond47:
	GOTO       L_wait_cond48
L_wait_cond45:
;APP_OPSM.c,72 :: 		else if(guc_choice == 5){ while(COND5); }
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond49
L_wait_cond50:
	BTFSS      PORTC+0, 2
	GOTO       L__wait_cond274
	BTFSS      PORTC+0, 1
	GOTO       L__wait_cond274
	BSF        3, 0
	GOTO       L__wait_cond275
L__wait_cond274:
	BCF        3, 0
L__wait_cond275:
	BTFSS      3, 0
	GOTO       L__wait_cond276
	BTFSS      PORTC+0, 0
	GOTO       L__wait_cond276
	BSF        R1, 0
	GOTO       L__wait_cond277
L__wait_cond276:
	BCF        R1, 0
L__wait_cond277:
	BTFSS      R1, 0
	GOTO       L__wait_cond278
	BTFSS      PORTA+0, 5
	GOTO       L__wait_cond278
	BSF        3, 0
	GOTO       L__wait_cond279
L__wait_cond278:
	BCF        3, 0
L__wait_cond279:
	BTFSS      3, 0
	GOTO       L_wait_cond51
	GOTO       L_wait_cond50
L_wait_cond51:
	GOTO       L_wait_cond52
L_wait_cond49:
;APP_OPSM.c,73 :: 		else if(guc_choice == 6){ while(COND6); }
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond53
L_wait_cond54:
	BTFSC      PORTC+0, 2
	GOTO       L__wait_cond280
	BSF        3, 0
	GOTO       L__wait_cond281
L__wait_cond280:
	BCF        3, 0
L__wait_cond281:
	BTFSS      3, 0
	GOTO       L__wait_cond282
	BTFSS      PORTC+0, 1
	GOTO       L__wait_cond282
	BSF        R1, 0
	GOTO       L__wait_cond283
L__wait_cond282:
	BCF        R1, 0
L__wait_cond283:
	BTFSC      PORTC+0, 0
	GOTO       L__wait_cond284
	BSF        3, 0
	GOTO       L__wait_cond285
L__wait_cond284:
	BCF        3, 0
L__wait_cond285:
	BTFSS      R1, 0
	GOTO       L__wait_cond286
	BTFSS      3, 0
	GOTO       L__wait_cond286
	BSF        R1, 0
	GOTO       L__wait_cond287
L__wait_cond286:
	BCF        R1, 0
L__wait_cond287:
	BTFSS      R1, 0
	GOTO       L__wait_cond288
	BTFSS      PORTA+0, 5
	GOTO       L__wait_cond288
	BSF        3, 0
	GOTO       L__wait_cond289
L__wait_cond288:
	BCF        3, 0
L__wait_cond289:
	BTFSS      3, 0
	GOTO       L_wait_cond55
	GOTO       L_wait_cond54
L_wait_cond55:
	GOTO       L_wait_cond56
L_wait_cond53:
;APP_OPSM.c,74 :: 		else if(guc_choice == 7){ while(COND7); }
	MOVF       _guc_choice+0, 0
	XORLW      7
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond57
L_wait_cond58:
	BTFSC      PORTC+0, 1
	GOTO       L__wait_cond290
	BSF        3, 0
	GOTO       L__wait_cond291
L__wait_cond290:
	BCF        3, 0
L__wait_cond291:
	BTFSS      PORTC+0, 2
	GOTO       L__wait_cond292
	BTFSS      3, 0
	GOTO       L__wait_cond292
	BSF        R1, 0
	GOTO       L__wait_cond293
L__wait_cond292:
	BCF        R1, 0
L__wait_cond293:
	BTFSC      PORTC+0, 0
	GOTO       L__wait_cond294
	BSF        3, 0
	GOTO       L__wait_cond295
L__wait_cond294:
	BCF        3, 0
L__wait_cond295:
	BTFSS      R1, 0
	GOTO       L__wait_cond296
	BTFSS      3, 0
	GOTO       L__wait_cond296
	BSF        R1, 0
	GOTO       L__wait_cond297
L__wait_cond296:
	BCF        R1, 0
L__wait_cond297:
	BTFSC      PORTA+0, 5
	GOTO       L__wait_cond298
	BSF        3, 0
	GOTO       L__wait_cond299
L__wait_cond298:
	BCF        3, 0
L__wait_cond299:
	BTFSS      R1, 0
	GOTO       L__wait_cond300
	BTFSS      3, 0
	GOTO       L__wait_cond300
	BSF        R1, 0
	GOTO       L__wait_cond301
L__wait_cond300:
	BCF        R1, 0
L__wait_cond301:
	BTFSS      R1, 0
	GOTO       L_wait_cond59
	GOTO       L_wait_cond58
L_wait_cond59:
	GOTO       L_wait_cond60
L_wait_cond57:
;APP_OPSM.c,75 :: 		else if(guc_choice == 8){ while(COND8); }
	MOVF       _guc_choice+0, 0
	XORLW      8
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond61
L_wait_cond62:
	BTFSC      PORTC+0, 2
	GOTO       L__wait_cond302
	BSF        R1, 0
	GOTO       L__wait_cond303
L__wait_cond302:
	BCF        R1, 0
L__wait_cond303:
	BTFSC      PORTC+0, 1
	GOTO       L__wait_cond304
	BSF        3, 0
	GOTO       L__wait_cond305
L__wait_cond304:
	BCF        3, 0
L__wait_cond305:
	BTFSS      R1, 0
	GOTO       L__wait_cond306
	BTFSS      3, 0
	GOTO       L__wait_cond306
	BSF        R1, 0
	GOTO       L__wait_cond307
L__wait_cond306:
	BCF        R1, 0
L__wait_cond307:
	BTFSS      R1, 0
	GOTO       L__wait_cond308
	BTFSS      PORTC+0, 0
	GOTO       L__wait_cond308
	BSF        R1, 0
	GOTO       L__wait_cond309
L__wait_cond308:
	BCF        R1, 0
L__wait_cond309:
	BTFSC      PORTA+0, 5
	GOTO       L__wait_cond310
	BSF        3, 0
	GOTO       L__wait_cond311
L__wait_cond310:
	BCF        3, 0
L__wait_cond311:
	BTFSS      R1, 0
	GOTO       L__wait_cond312
	BTFSS      3, 0
	GOTO       L__wait_cond312
	BSF        R1, 0
	GOTO       L__wait_cond313
L__wait_cond312:
	BCF        R1, 0
L__wait_cond313:
	BTFSS      R1, 0
	GOTO       L_wait_cond63
	GOTO       L_wait_cond62
L_wait_cond63:
	GOTO       L_wait_cond64
L_wait_cond61:
;APP_OPSM.c,76 :: 		else if(guc_choice == 9){ while(COND9); }
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond65
L_wait_cond66:
	BTFSC      PORTC+0, 2
	GOTO       L__wait_cond314
	BSF        R1, 0
	GOTO       L__wait_cond315
L__wait_cond314:
	BCF        R1, 0
L__wait_cond315:
	BTFSC      PORTC+0, 1
	GOTO       L__wait_cond316
	BSF        3, 0
	GOTO       L__wait_cond317
L__wait_cond316:
	BCF        3, 0
L__wait_cond317:
	BTFSS      R1, 0
	GOTO       L__wait_cond318
	BTFSS      3, 0
	GOTO       L__wait_cond318
	BSF        R1, 0
	GOTO       L__wait_cond319
L__wait_cond318:
	BCF        R1, 0
L__wait_cond319:
	BTFSC      PORTC+0, 0
	GOTO       L__wait_cond320
	BSF        3, 0
	GOTO       L__wait_cond321
L__wait_cond320:
	BCF        3, 0
L__wait_cond321:
	BTFSS      R1, 0
	GOTO       L__wait_cond322
	BTFSS      3, 0
	GOTO       L__wait_cond322
	BSF        R1, 0
	GOTO       L__wait_cond323
L__wait_cond322:
	BCF        R1, 0
L__wait_cond323:
	BTFSC      PORTA+0, 5
	GOTO       L__wait_cond324
	BSF        3, 0
	GOTO       L__wait_cond325
L__wait_cond324:
	BCF        3, 0
L__wait_cond325:
	BTFSS      R1, 0
	GOTO       L__wait_cond326
	BTFSS      3, 0
	GOTO       L__wait_cond326
	BSF        R1, 0
	GOTO       L__wait_cond327
L__wait_cond326:
	BCF        R1, 0
L__wait_cond327:
	BTFSS      R1, 0
	GOTO       L_wait_cond67
	GOTO       L_wait_cond66
L_wait_cond67:
	GOTO       L_wait_cond68
L_wait_cond65:
;APP_OPSM.c,77 :: 		else if(guc_choice == 10){ while(COND10); }
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond69
L_wait_cond70:
	BTFSC      PORTC+0, 2
	GOTO       L__wait_cond328
	BSF        3, 0
	GOTO       L__wait_cond329
L__wait_cond328:
	BCF        3, 0
L__wait_cond329:
	BTFSS      3, 0
	GOTO       L__wait_cond330
	BTFSS      PORTC+0, 1
	GOTO       L__wait_cond330
	BSF        R1, 0
	GOTO       L__wait_cond331
L__wait_cond330:
	BCF        R1, 0
L__wait_cond331:
	BTFSC      PORTC+0, 0
	GOTO       L__wait_cond332
	BSF        3, 0
	GOTO       L__wait_cond333
L__wait_cond332:
	BCF        3, 0
L__wait_cond333:
	BTFSS      R1, 0
	GOTO       L__wait_cond334
	BTFSS      3, 0
	GOTO       L__wait_cond334
	BSF        R1, 0
	GOTO       L__wait_cond335
L__wait_cond334:
	BCF        R1, 0
L__wait_cond335:
	BTFSC      PORTA+0, 5
	GOTO       L__wait_cond336
	BSF        3, 0
	GOTO       L__wait_cond337
L__wait_cond336:
	BCF        3, 0
L__wait_cond337:
	BTFSS      R1, 0
	GOTO       L__wait_cond338
	BTFSS      3, 0
	GOTO       L__wait_cond338
	BSF        R1, 0
	GOTO       L__wait_cond339
L__wait_cond338:
	BCF        R1, 0
L__wait_cond339:
	BTFSS      R1, 0
	GOTO       L_wait_cond71
	GOTO       L_wait_cond70
L_wait_cond71:
	GOTO       L_wait_cond72
L_wait_cond69:
;APP_OPSM.c,78 :: 		else if(guc_choice == 11){ while(COND11); }
	MOVF       _guc_choice+0, 0
	XORLW      11
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond73
L_wait_cond74:
	BTFSS      PORTC+0, 2
	GOTO       L__wait_cond340
	BTFSS      PORTC+0, 1
	GOTO       L__wait_cond340
	BSF        3, 0
	GOTO       L__wait_cond341
L__wait_cond340:
	BCF        3, 0
L__wait_cond341:
	BTFSS      3, 0
	GOTO       L__wait_cond342
	BTFSS      PORTC+0, 0
	GOTO       L__wait_cond342
	BSF        R1, 0
	GOTO       L__wait_cond343
L__wait_cond342:
	BCF        R1, 0
L__wait_cond343:
	BTFSC      PORTA+0, 5
	GOTO       L__wait_cond344
	BSF        3, 0
	GOTO       L__wait_cond345
L__wait_cond344:
	BCF        3, 0
L__wait_cond345:
	BTFSS      R1, 0
	GOTO       L__wait_cond346
	BTFSS      3, 0
	GOTO       L__wait_cond346
	BSF        R1, 0
	GOTO       L__wait_cond347
L__wait_cond346:
	BCF        R1, 0
L__wait_cond347:
	BTFSS      R1, 0
	GOTO       L_wait_cond75
	GOTO       L_wait_cond74
L_wait_cond75:
	GOTO       L_wait_cond76
L_wait_cond73:
;APP_OPSM.c,79 :: 		else if(guc_choice == 12){ while(COND12); }
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_wait_cond77
L_wait_cond78:
	BTFSC      PORTC+0, 2
	GOTO       L__wait_cond348
	BSF        3, 0
	GOTO       L__wait_cond349
L__wait_cond348:
	BCF        3, 0
L__wait_cond349:
	BTFSS      3, 0
	GOTO       L__wait_cond350
	BTFSS      PORTC+0, 1
	GOTO       L__wait_cond350
	BSF        R1, 0
	GOTO       L__wait_cond351
L__wait_cond350:
	BCF        R1, 0
L__wait_cond351:
	BTFSS      R1, 0
	GOTO       L__wait_cond352
	BTFSS      PORTC+0, 0
	GOTO       L__wait_cond352
	BSF        R1, 0
	GOTO       L__wait_cond353
L__wait_cond352:
	BCF        R1, 0
L__wait_cond353:
	BTFSC      PORTA+0, 5
	GOTO       L__wait_cond354
	BSF        3, 0
	GOTO       L__wait_cond355
L__wait_cond354:
	BCF        3, 0
L__wait_cond355:
	BTFSS      R1, 0
	GOTO       L__wait_cond356
	BTFSS      3, 0
	GOTO       L__wait_cond356
	BSF        R1, 0
	GOTO       L__wait_cond357
L__wait_cond356:
	BCF        R1, 0
L__wait_cond357:
	BTFSS      R1, 0
	GOTO       L_wait_cond79
	GOTO       L_wait_cond78
L_wait_cond79:
L_wait_cond77:
L_wait_cond76:
L_wait_cond72:
L_wait_cond68:
L_wait_cond64:
L_wait_cond60:
L_wait_cond56:
L_wait_cond52:
L_wait_cond48:
L_wait_cond44:
L_wait_cond40:
L_wait_cond36:
;APP_OPSM.c,80 :: 		reset_all();
	CALL       _reset_all+0
;APP_OPSM.c,82 :: 		}
L_end_wait_cond:
	RETURN
; end of _wait_cond

_exe_cond:

;APP_OPSM.c,86 :: 		void exe_cond()
;APP_OPSM.c,88 :: 		if(guc_choice == 1 || guc_choice == 6 || guc_choice == 9
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond102
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond102
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond102
;APP_OPSM.c,89 :: 		|| guc_choice == 10){guc_buzz_state=1;}
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond102
	GOTO       L_exe_cond82
L__exe_cond102:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond83
L_exe_cond82:
;APP_OPSM.c,90 :: 		else { guc_buzz_state=0;}
	CLRF       _guc_buzz_state+0
L_exe_cond83:
;APP_OPSM.c,92 :: 		if(guc_choice == 8 || guc_choice == 11 || guc_choice == 12)
	MOVF       _guc_choice+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond101
	MOVF       _guc_choice+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond101
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond101
	GOTO       L_exe_cond86
L__exe_cond101:
;APP_OPSM.c,93 :: 		{P_IND = 1;}
	BSF        PORTC+0, 3
	GOTO       L_exe_cond87
L_exe_cond86:
;APP_OPSM.c,94 :: 		else { P_IND = 0;}
	BCF        PORTC+0, 3
L_exe_cond87:
;APP_OPSM.c,102 :: 		if(guc_choice == 10)
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond88
;APP_OPSM.c,104 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond89:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond359
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond359:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond90
	GOTO       L_exe_cond89
L_exe_cond90:
;APP_OPSM.c,105 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,106 :: 		}
	GOTO       L_exe_cond91
L_exe_cond88:
;APP_OPSM.c,107 :: 		else if(guc_choice == 12)
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond92
;APP_OPSM.c,109 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond93:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond360
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond360:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond94
	GOTO       L_exe_cond93
L_exe_cond94:
;APP_OPSM.c,110 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,111 :: 		}
	GOTO       L_exe_cond95
L_exe_cond92:
;APP_OPSM.c,112 :: 		else { RELAY_SOL = 0;}
	BCF        PORTC+0, 5
L_exe_cond95:
L_exe_cond91:
;APP_OPSM.c,114 :: 		wait_cond();
	CALL       _wait_cond+0
;APP_OPSM.c,115 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,118 :: 		void sys_init()
;APP_OPSM.c,121 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,123 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,124 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,125 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,126 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,128 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,129 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,130 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,131 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,133 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,134 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,137 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,138 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,149 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,154 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP_OPSM.c,171 :: 		void main()
;APP_OPSM.c,173 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,174 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;APP_OPSM.c,176 :: 		while(1)
L_main96:
;APP_OPSM.c,178 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,179 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main98
;APP_OPSM.c,181 :: 		diag_choice = guc_choice;
	MOVF       _guc_choice+0, 0
	MOVWF      _diag_choice+0
;APP_OPSM.c,182 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,183 :: 		}
L_main98:
;APP_OPSM.c,184 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,192 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,193 :: 		}
	GOTO       L_main96
;APP_OPSM.c,194 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
