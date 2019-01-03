
_interrupt:

;APP_OPSM.c,14 :: 		void interrupt()
;APP_OPSM.c,16 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt106:
;APP_OPSM.c,18 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,27 :: 		}
L_interrupt2:
;APP_OPSM.c,29 :: 		}
L_end_interrupt:
L__interrupt109:
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
	SUBLW      18
	BTFSS      STATUS+0, 0
	GOTO       L_CHCK_COND4
	MOVF       R4+0, 0
	XORWF      FARG_CHCK_COND_x+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CHCK_COND4
L__CHCK_COND107:
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
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__CHCK_COND111
	MOVF       R1, 0
	SUBLW      10
L__CHCK_COND111:
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
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond113
	BSF        R0, 0
	GOTO       L__check_cond114
L__check_cond113:
	BCF        R0, 0
L__check_cond114:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond123
	BSF        3, 0
	GOTO       L__check_cond124
L__check_cond123:
	BCF        3, 0
L__check_cond124:
	BTFSS      R0, 0
	GOTO       L__check_cond125
	BTFSS      3, 0
	GOTO       L__check_cond125
	BSF        R0, 0
	GOTO       L__check_cond126
L__check_cond125:
	BCF        R0, 0
L__check_cond126:
	BTFSS      R0, 0
	GOTO       L_check_cond9
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond10
L_check_cond9:
;APP_OPSM.c,44 :: 		else if(COND2){ CHCK_COND(2); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond127
	BSF        R0, 0
	GOTO       L__check_cond128
L__check_cond127:
	BCF        R0, 0
L__check_cond128:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond129
	BSF        3, 0
	GOTO       L__check_cond130
L__check_cond129:
	BCF        3, 0
L__check_cond130:
	BTFSS      R0, 0
	GOTO       L__check_cond131
	BTFSS      3, 0
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
	GOTO       L_check_cond11
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond12
L_check_cond11:
;APP_OPSM.c,45 :: 		else if(COND3){ CHCK_COND(3); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond139
	BSF        R0, 0
	GOTO       L__check_cond140
L__check_cond139:
	BCF        R0, 0
L__check_cond140:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond141
	BSF        3, 0
	GOTO       L__check_cond142
L__check_cond141:
	BCF        3, 0
L__check_cond142:
	BTFSS      R0, 0
	GOTO       L__check_cond143
	BTFSS      3, 0
	GOTO       L__check_cond143
	BSF        R0, 0
	GOTO       L__check_cond144
L__check_cond143:
	BCF        R0, 0
L__check_cond144:
	BTFSS      R0, 0
	GOTO       L__check_cond145
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond145
	BSF        R0, 0
	GOTO       L__check_cond146
L__check_cond145:
	BCF        R0, 0
L__check_cond146:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond147
	BSF        3, 0
	GOTO       L__check_cond148
L__check_cond147:
	BCF        3, 0
L__check_cond148:
	BTFSS      R0, 0
	GOTO       L__check_cond149
	BTFSS      3, 0
	GOTO       L__check_cond149
	BSF        R0, 0
	GOTO       L__check_cond150
L__check_cond149:
	BCF        R0, 0
L__check_cond150:
	BTFSS      R0, 0
	GOTO       L_check_cond13
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond14
L_check_cond13:
;APP_OPSM.c,46 :: 		else if(COND4){ CHCK_COND(4); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond151
	BSF        R0, 0
	GOTO       L__check_cond152
L__check_cond151:
	BCF        R0, 0
L__check_cond152:
	BTFSC      PORTC+0, 1
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
	GOTO       L__check_cond157
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond157
	BSF        3, 0
	GOTO       L__check_cond158
L__check_cond157:
	BCF        3, 0
L__check_cond158:
	BTFSS      3, 0
	GOTO       L__check_cond159
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond159
	BSF        R0, 0
	GOTO       L__check_cond160
L__check_cond159:
	BCF        R0, 0
L__check_cond160:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond16
L_check_cond15:
;APP_OPSM.c,47 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond161
	BSF        3, 0
	GOTO       L__check_cond162
L__check_cond161:
	BCF        3, 0
L__check_cond162:
	BTFSS      3, 0
	GOTO       L__check_cond163
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond163
	BSF        R0, 0
	GOTO       L__check_cond164
L__check_cond163:
	BCF        R0, 0
L__check_cond164:
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
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
	BTFSS      R0, 0
	GOTO       L_check_cond17
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond18
L_check_cond17:
;APP_OPSM.c,48 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond173
	BSF        3, 0
	GOTO       L__check_cond174
L__check_cond173:
	BCF        3, 0
L__check_cond174:
	BTFSS      3, 0
	GOTO       L__check_cond175
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond175
	BSF        R0, 0
	GOTO       L__check_cond176
L__check_cond175:
	BCF        R0, 0
L__check_cond176:
	BTFSC      PORTC+0, 2
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
	GOTO       L__check_cond181
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond181
	BSF        3, 0
	GOTO       L__check_cond182
L__check_cond181:
	BCF        3, 0
L__check_cond182:
	BTFSS      3, 0
	GOTO       L_check_cond19
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond20
L_check_cond19:
;APP_OPSM.c,49 :: 		else if(COND7){ CHCK_COND(7); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond183
	BSF        3, 0
	GOTO       L__check_cond184
L__check_cond183:
	BCF        3, 0
L__check_cond184:
	BTFSS      3, 0
	GOTO       L__check_cond185
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond185
	BSF        R0, 0
	GOTO       L__check_cond186
L__check_cond185:
	BCF        R0, 0
L__check_cond186:
	BTFSS      R0, 0
	GOTO       L__check_cond187
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond187
	BSF        R0, 0
	GOTO       L__check_cond188
L__check_cond187:
	BCF        R0, 0
L__check_cond188:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond189
	BSF        3, 0
	GOTO       L__check_cond190
L__check_cond189:
	BCF        3, 0
L__check_cond190:
	BTFSS      R0, 0
	GOTO       L__check_cond191
	BTFSS      3, 0
	GOTO       L__check_cond191
	BSF        R0, 0
	GOTO       L__check_cond192
L__check_cond191:
	BCF        R0, 0
L__check_cond192:
	BTFSS      R0, 0
	GOTO       L_check_cond21
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond22
L_check_cond21:
;APP_OPSM.c,50 :: 		else if(COND8){ CHCK_COND(8); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond193
	BSF        3, 0
	GOTO       L__check_cond194
L__check_cond193:
	BCF        3, 0
L__check_cond194:
	BTFSS      3, 0
	GOTO       L__check_cond195
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond195
	BSF        R0, 0
	GOTO       L__check_cond196
L__check_cond195:
	BCF        R0, 0
L__check_cond196:
	BTFSS      R0, 0
	GOTO       L__check_cond197
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond197
	BSF        3, 0
	GOTO       L__check_cond198
L__check_cond197:
	BCF        3, 0
L__check_cond198:
	BTFSS      3, 0
	GOTO       L__check_cond199
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond199
	BSF        R0, 0
	GOTO       L__check_cond200
L__check_cond199:
	BCF        R0, 0
L__check_cond200:
	BTFSS      R0, 0
	GOTO       L_check_cond23
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond24
L_check_cond23:
;APP_OPSM.c,51 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond201
	BSF        3, 0
	GOTO       L__check_cond202
L__check_cond201:
	BCF        3, 0
L__check_cond202:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond203
	BTFSS      3, 0
	GOTO       L__check_cond203
	BSF        R0, 0
	GOTO       L__check_cond204
L__check_cond203:
	BCF        R0, 0
L__check_cond204:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond205
	BSF        3, 0
	GOTO       L__check_cond206
L__check_cond205:
	BCF        3, 0
L__check_cond206:
	BTFSS      R0, 0
	GOTO       L__check_cond207
	BTFSS      3, 0
	GOTO       L__check_cond207
	BSF        R0, 0
	GOTO       L__check_cond208
L__check_cond207:
	BCF        R0, 0
L__check_cond208:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond209
	BSF        3, 0
	GOTO       L__check_cond210
L__check_cond209:
	BCF        3, 0
L__check_cond210:
	BTFSS      R0, 0
	GOTO       L__check_cond211
	BTFSS      3, 0
	GOTO       L__check_cond211
	BSF        R0, 0
	GOTO       L__check_cond212
L__check_cond211:
	BCF        R0, 0
L__check_cond212:
	BTFSS      R0, 0
	GOTO       L_check_cond25
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond26
L_check_cond25:
;APP_OPSM.c,52 :: 		else if(COND10){ CHCK_COND(10); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond213
	BSF        3, 0
	GOTO       L__check_cond214
L__check_cond213:
	BCF        3, 0
L__check_cond214:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond215
	BTFSS      3, 0
	GOTO       L__check_cond215
	BSF        R0, 0
	GOTO       L__check_cond216
L__check_cond215:
	BCF        R0, 0
L__check_cond216:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond217
	BSF        3, 0
	GOTO       L__check_cond218
L__check_cond217:
	BCF        3, 0
L__check_cond218:
	BTFSS      R0, 0
	GOTO       L__check_cond219
	BTFSS      3, 0
	GOTO       L__check_cond219
	BSF        R0, 0
	GOTO       L__check_cond220
L__check_cond219:
	BCF        R0, 0
L__check_cond220:
	BTFSS      R0, 0
	GOTO       L__check_cond221
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond221
	BSF        3, 0
	GOTO       L__check_cond222
L__check_cond221:
	BCF        3, 0
L__check_cond222:
	BTFSS      3, 0
	GOTO       L_check_cond27
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond28
L_check_cond27:
;APP_OPSM.c,53 :: 		else if(COND11){ CHCK_COND(11); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond223
	BSF        3, 0
	GOTO       L__check_cond224
L__check_cond223:
	BCF        3, 0
L__check_cond224:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond225
	BTFSS      3, 0
	GOTO       L__check_cond225
	BSF        R0, 0
	GOTO       L__check_cond226
L__check_cond225:
	BCF        R0, 0
L__check_cond226:
	BTFSS      R0, 0
	GOTO       L__check_cond227
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond227
	BSF        R0, 0
	GOTO       L__check_cond228
L__check_cond227:
	BCF        R0, 0
L__check_cond228:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond229
	BSF        3, 0
	GOTO       L__check_cond230
L__check_cond229:
	BCF        3, 0
L__check_cond230:
	BTFSS      R0, 0
	GOTO       L__check_cond231
	BTFSS      3, 0
	GOTO       L__check_cond231
	BSF        R0, 0
	GOTO       L__check_cond232
L__check_cond231:
	BCF        R0, 0
L__check_cond232:
	BTFSS      R0, 0
	GOTO       L_check_cond29
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond30
L_check_cond29:
;APP_OPSM.c,54 :: 		else if(COND12){ CHCK_COND(12); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond233
	BSF        3, 0
	GOTO       L__check_cond234
L__check_cond233:
	BCF        3, 0
L__check_cond234:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond235
	BTFSS      3, 0
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
	BSF        3, 0
	GOTO       L__check_cond238
L__check_cond237:
	BCF        3, 0
L__check_cond238:
	BTFSS      3, 0
	GOTO       L__check_cond239
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond239
	BSF        R0, 0
	GOTO       L__check_cond240
L__check_cond239:
	BCF        R0, 0
L__check_cond240:
	BTFSS      R0, 0
	GOTO       L_check_cond31
	MOVLW      12
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond32
L_check_cond31:
;APP_OPSM.c,55 :: 		else if(COND13){ CHCK_COND(13); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond241
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond241
	BSF        R0, 0
	GOTO       L__check_cond242
L__check_cond241:
	BCF        R0, 0
L__check_cond242:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond243
	BSF        3, 0
	GOTO       L__check_cond244
L__check_cond243:
	BCF        3, 0
L__check_cond244:
	BTFSS      R0, 0
	GOTO       L__check_cond245
	BTFSS      3, 0
	GOTO       L__check_cond245
	BSF        R0, 0
	GOTO       L__check_cond246
L__check_cond245:
	BCF        R0, 0
L__check_cond246:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond247
	BSF        3, 0
	GOTO       L__check_cond248
L__check_cond247:
	BCF        3, 0
L__check_cond248:
	BTFSS      R0, 0
	GOTO       L__check_cond249
	BTFSS      3, 0
	GOTO       L__check_cond249
	BSF        R0, 0
	GOTO       L__check_cond250
L__check_cond249:
	BCF        R0, 0
L__check_cond250:
	BTFSS      R0, 0
	GOTO       L_check_cond33
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond34
L_check_cond33:
;APP_OPSM.c,56 :: 		else if(COND14){ CHCK_COND(14); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond251
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond251
	BSF        R0, 0
	GOTO       L__check_cond252
L__check_cond251:
	BCF        R0, 0
L__check_cond252:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond253
	BSF        3, 0
	GOTO       L__check_cond254
L__check_cond253:
	BCF        3, 0
L__check_cond254:
	BTFSS      R0, 0
	GOTO       L__check_cond255
	BTFSS      3, 0
	GOTO       L__check_cond255
	BSF        R0, 0
	GOTO       L__check_cond256
L__check_cond255:
	BCF        R0, 0
L__check_cond256:
	BTFSS      R0, 0
	GOTO       L__check_cond257
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond257
	BSF        3, 0
	GOTO       L__check_cond258
L__check_cond257:
	BCF        3, 0
L__check_cond258:
	BTFSS      3, 0
	GOTO       L_check_cond35
	MOVLW      14
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond36
L_check_cond35:
;APP_OPSM.c,57 :: 		else if(COND15){ CHCK_COND(15); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond259
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond259
	BSF        3, 0
	GOTO       L__check_cond260
L__check_cond259:
	BCF        3, 0
L__check_cond260:
	BTFSS      3, 0
	GOTO       L__check_cond261
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond261
	BSF        R0, 0
	GOTO       L__check_cond262
L__check_cond261:
	BCF        R0, 0
L__check_cond262:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond263
	BSF        3, 0
	GOTO       L__check_cond264
L__check_cond263:
	BCF        3, 0
L__check_cond264:
	BTFSS      R0, 0
	GOTO       L__check_cond265
	BTFSS      3, 0
	GOTO       L__check_cond265
	BSF        R0, 0
	GOTO       L__check_cond266
L__check_cond265:
	BCF        R0, 0
L__check_cond266:
	BTFSS      R0, 0
	GOTO       L_check_cond37
	MOVLW      15
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond38
L_check_cond37:
;APP_OPSM.c,58 :: 		else if(COND16){ CHCK_COND(16); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond267
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond267
	BSF        3, 0
	GOTO       L__check_cond268
L__check_cond267:
	BCF        3, 0
L__check_cond268:
	BTFSS      3, 0
	GOTO       L__check_cond269
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond269
	BSF        R0, 0
	GOTO       L__check_cond270
L__check_cond269:
	BCF        R0, 0
L__check_cond270:
	BTFSS      R0, 0
	GOTO       L__check_cond271
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond271
	BSF        3, 0
	GOTO       L__check_cond272
L__check_cond271:
	BCF        3, 0
L__check_cond272:
	BTFSS      3, 0
	GOTO       L_check_cond39
	MOVLW      16
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond40
L_check_cond39:
;APP_OPSM.c,59 :: 		else {guc_choice = (TOTAL_COND - 1);}
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
;APP_OPSM.c,61 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,63 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_reset_all:

;APP_OPSM.c,65 :: 		void reset_all()
;APP_OPSM.c,67 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,68 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,69 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,71 :: 		P_IND = 0;
	BCF        PORTC+0, 3
;APP_OPSM.c,72 :: 		RELAY_STR = 0;
	BCF        PORTC+0, 4
;APP_OPSM.c,73 :: 		}
L_end_reset_all:
	RETURN
; end of _reset_all

_exe_cond:

;APP_OPSM.c,75 :: 		void exe_cond()
;APP_OPSM.c,77 :: 		switch(guc_choice)
	GOTO       L_exe_cond41
;APP_OPSM.c,79 :: 		case 1: guc_sec=0; while(guc_sec<5 & COND1);
L_exe_cond43:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond44:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond275
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond275:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond276
	BSF        R2, 0
	GOTO       L__exe_cond277
L__exe_cond276:
	BCF        R2, 0
L__exe_cond277:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond278
	BSF        3, 0
	GOTO       L__exe_cond279
L__exe_cond278:
	BCF        3, 0
L__exe_cond279:
	BTFSS      R2, 0
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
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond45
	GOTO       L_exe_cond44
L_exe_cond45:
;APP_OPSM.c,80 :: 		if(COND1){ guc_buzz_state=1;} while(COND1);
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond290
	BSF        R2, 0
	GOTO       L__exe_cond291
L__exe_cond290:
	BCF        R2, 0
L__exe_cond291:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond292
	BSF        3, 0
	GOTO       L__exe_cond293
L__exe_cond292:
	BCF        3, 0
L__exe_cond293:
	BTFSS      R2, 0
	GOTO       L__exe_cond294
	BTFSS      3, 0
	GOTO       L__exe_cond294
	BSF        R2, 0
	GOTO       L__exe_cond295
L__exe_cond294:
	BCF        R2, 0
L__exe_cond295:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond296
	BSF        3, 0
	GOTO       L__exe_cond297
L__exe_cond296:
	BCF        3, 0
L__exe_cond297:
	BTFSS      R2, 0
	GOTO       L__exe_cond298
	BTFSS      3, 0
	GOTO       L__exe_cond298
	BSF        R2, 0
	GOTO       L__exe_cond299
L__exe_cond298:
	BCF        R2, 0
L__exe_cond299:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond300
	BSF        3, 0
	GOTO       L__exe_cond301
L__exe_cond300:
	BCF        3, 0
L__exe_cond301:
	BTFSS      R2, 0
	GOTO       L__exe_cond302
	BTFSS      3, 0
	GOTO       L__exe_cond302
	BSF        R2, 0
	GOTO       L__exe_cond303
L__exe_cond302:
	BCF        R2, 0
L__exe_cond303:
	BTFSS      R2, 0
	GOTO       L_exe_cond46
	MOVLW      1
	MOVWF      _guc_buzz_state+0
L_exe_cond46:
L_exe_cond47:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond304
	BSF        R2, 0
	GOTO       L__exe_cond305
L__exe_cond304:
	BCF        R2, 0
L__exe_cond305:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond306
	BSF        3, 0
	GOTO       L__exe_cond307
L__exe_cond306:
	BCF        3, 0
L__exe_cond307:
	BTFSS      R2, 0
	GOTO       L__exe_cond308
	BTFSS      3, 0
	GOTO       L__exe_cond308
	BSF        R2, 0
	GOTO       L__exe_cond309
L__exe_cond308:
	BCF        R2, 0
L__exe_cond309:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond310
	BSF        3, 0
	GOTO       L__exe_cond311
L__exe_cond310:
	BCF        3, 0
L__exe_cond311:
	BTFSS      R2, 0
	GOTO       L__exe_cond312
	BTFSS      3, 0
	GOTO       L__exe_cond312
	BSF        R2, 0
	GOTO       L__exe_cond313
L__exe_cond312:
	BCF        R2, 0
L__exe_cond313:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond314
	BSF        3, 0
	GOTO       L__exe_cond315
L__exe_cond314:
	BCF        3, 0
L__exe_cond315:
	BTFSS      R2, 0
	GOTO       L__exe_cond316
	BTFSS      3, 0
	GOTO       L__exe_cond316
	BSF        R2, 0
	GOTO       L__exe_cond317
L__exe_cond316:
	BCF        R2, 0
L__exe_cond317:
	BTFSS      R2, 0
	GOTO       L_exe_cond48
	GOTO       L_exe_cond47
L_exe_cond48:
;APP_OPSM.c,81 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,83 :: 		case 5: RELAY_SOL = 1; guc_sec=0; while(guc_sec<5 & COND5);
L_exe_cond49:
	BSF        PORTC+0, 5
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond50:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond318
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond318:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond319
	BSF        3, 0
	GOTO       L__exe_cond320
L__exe_cond319:
	BCF        3, 0
L__exe_cond320:
	BTFSS      3, 0
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
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond327
	BSF        3, 0
	GOTO       L__exe_cond328
L__exe_cond327:
	BCF        3, 0
L__exe_cond328:
	BTFSS      R2, 0
	GOTO       L__exe_cond329
	BTFSS      3, 0
	GOTO       L__exe_cond329
	BSF        R2, 0
	GOTO       L__exe_cond330
L__exe_cond329:
	BCF        R2, 0
L__exe_cond330:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond51
	GOTO       L_exe_cond50
L_exe_cond51:
;APP_OPSM.c,84 :: 		if(COND5){ guc_buzz_state=1;} while(COND5);
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond331
	BSF        3, 0
	GOTO       L__exe_cond332
L__exe_cond331:
	BCF        3, 0
L__exe_cond332:
	BTFSS      3, 0
	GOTO       L__exe_cond333
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond333
	BSF        R2, 0
	GOTO       L__exe_cond334
L__exe_cond333:
	BCF        R2, 0
L__exe_cond334:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond335
	BSF        3, 0
	GOTO       L__exe_cond336
L__exe_cond335:
	BCF        3, 0
L__exe_cond336:
	BTFSS      R2, 0
	GOTO       L__exe_cond337
	BTFSS      3, 0
	GOTO       L__exe_cond337
	BSF        R2, 0
	GOTO       L__exe_cond338
L__exe_cond337:
	BCF        R2, 0
L__exe_cond338:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond339
	BSF        3, 0
	GOTO       L__exe_cond340
L__exe_cond339:
	BCF        3, 0
L__exe_cond340:
	BTFSS      R2, 0
	GOTO       L__exe_cond341
	BTFSS      3, 0
	GOTO       L__exe_cond341
	BSF        R2, 0
	GOTO       L__exe_cond342
L__exe_cond341:
	BCF        R2, 0
L__exe_cond342:
	BTFSS      R2, 0
	GOTO       L_exe_cond52
	MOVLW      1
	MOVWF      _guc_buzz_state+0
L_exe_cond52:
L_exe_cond53:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond343
	BSF        3, 0
	GOTO       L__exe_cond344
L__exe_cond343:
	BCF        3, 0
L__exe_cond344:
	BTFSS      3, 0
	GOTO       L__exe_cond345
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond345
	BSF        R2, 0
	GOTO       L__exe_cond346
L__exe_cond345:
	BCF        R2, 0
L__exe_cond346:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond347
	BSF        3, 0
	GOTO       L__exe_cond348
L__exe_cond347:
	BCF        3, 0
L__exe_cond348:
	BTFSS      R2, 0
	GOTO       L__exe_cond349
	BTFSS      3, 0
	GOTO       L__exe_cond349
	BSF        R2, 0
	GOTO       L__exe_cond350
L__exe_cond349:
	BCF        R2, 0
L__exe_cond350:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond351
	BSF        3, 0
	GOTO       L__exe_cond352
L__exe_cond351:
	BCF        3, 0
L__exe_cond352:
	BTFSS      R2, 0
	GOTO       L__exe_cond353
	BTFSS      3, 0
	GOTO       L__exe_cond353
	BSF        R2, 0
	GOTO       L__exe_cond354
L__exe_cond353:
	BCF        R2, 0
L__exe_cond354:
	BTFSS      R2, 0
	GOTO       L_exe_cond54
	GOTO       L_exe_cond53
L_exe_cond54:
;APP_OPSM.c,85 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,87 :: 		case 6: RELAY_SOL = 1; guc_buzz_state=0; while(COND6); reset_all(); break;
L_exe_cond55:
	BSF        PORTC+0, 5
	CLRF       _guc_buzz_state+0
L_exe_cond56:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond355
	BSF        3, 0
	GOTO       L__exe_cond356
L__exe_cond355:
	BCF        3, 0
L__exe_cond356:
	BTFSS      3, 0
	GOTO       L__exe_cond357
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond357
	BSF        R2, 0
	GOTO       L__exe_cond358
L__exe_cond357:
	BCF        R2, 0
L__exe_cond358:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond359
	BSF        3, 0
	GOTO       L__exe_cond360
L__exe_cond359:
	BCF        3, 0
L__exe_cond360:
	BTFSS      R2, 0
	GOTO       L__exe_cond361
	BTFSS      3, 0
	GOTO       L__exe_cond361
	BSF        R2, 0
	GOTO       L__exe_cond362
L__exe_cond361:
	BCF        R2, 0
L__exe_cond362:
	BTFSS      R2, 0
	GOTO       L__exe_cond363
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond363
	BSF        3, 0
	GOTO       L__exe_cond364
L__exe_cond363:
	BCF        3, 0
L__exe_cond364:
	BTFSS      3, 0
	GOTO       L_exe_cond57
	GOTO       L_exe_cond56
L_exe_cond57:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,89 :: 		case 7: RELAY_SOL = 1; guc_buzz_state=0; while(COND7); reset_all(); break;
L_exe_cond58:
	BSF        PORTC+0, 5
	CLRF       _guc_buzz_state+0
L_exe_cond59:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond365
	BSF        3, 0
	GOTO       L__exe_cond366
L__exe_cond365:
	BCF        3, 0
L__exe_cond366:
	BTFSS      3, 0
	GOTO       L__exe_cond367
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond367
	BSF        R2, 0
	GOTO       L__exe_cond368
L__exe_cond367:
	BCF        R2, 0
L__exe_cond368:
	BTFSS      R2, 0
	GOTO       L__exe_cond369
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond369
	BSF        R2, 0
	GOTO       L__exe_cond370
L__exe_cond369:
	BCF        R2, 0
L__exe_cond370:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond371
	BSF        3, 0
	GOTO       L__exe_cond372
L__exe_cond371:
	BCF        3, 0
L__exe_cond372:
	BTFSS      R2, 0
	GOTO       L__exe_cond373
	BTFSS      3, 0
	GOTO       L__exe_cond373
	BSF        R2, 0
	GOTO       L__exe_cond374
L__exe_cond373:
	BCF        R2, 0
L__exe_cond374:
	BTFSS      R2, 0
	GOTO       L_exe_cond60
	GOTO       L_exe_cond59
L_exe_cond60:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,91 :: 		case 8: RELAY_SOL = 1; guc_buzz_state=0; while(COND8); reset_all(); break;
L_exe_cond61:
	BSF        PORTC+0, 5
	CLRF       _guc_buzz_state+0
L_exe_cond62:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond375
	BSF        3, 0
	GOTO       L__exe_cond376
L__exe_cond375:
	BCF        3, 0
L__exe_cond376:
	BTFSS      3, 0
	GOTO       L__exe_cond377
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond377
	BSF        R2, 0
	GOTO       L__exe_cond378
L__exe_cond377:
	BCF        R2, 0
L__exe_cond378:
	BTFSS      R2, 0
	GOTO       L__exe_cond379
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond379
	BSF        3, 0
	GOTO       L__exe_cond380
L__exe_cond379:
	BCF        3, 0
L__exe_cond380:
	BTFSS      3, 0
	GOTO       L__exe_cond381
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond381
	BSF        R2, 0
	GOTO       L__exe_cond382
L__exe_cond381:
	BCF        R2, 0
L__exe_cond382:
	BTFSS      R2, 0
	GOTO       L_exe_cond63
	GOTO       L_exe_cond62
L_exe_cond63:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,93 :: 		case 9: guc_sec=0; while(guc_sec<5 & COND9);
L_exe_cond64:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond65:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond383
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond383:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond384
	BSF        3, 0
	GOTO       L__exe_cond385
L__exe_cond384:
	BCF        3, 0
L__exe_cond385:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond386
	BTFSS      3, 0
	GOTO       L__exe_cond386
	BSF        R2, 0
	GOTO       L__exe_cond387
L__exe_cond386:
	BCF        R2, 0
L__exe_cond387:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond388
	BSF        3, 0
	GOTO       L__exe_cond389
L__exe_cond388:
	BCF        3, 0
L__exe_cond389:
	BTFSS      R2, 0
	GOTO       L__exe_cond390
	BTFSS      3, 0
	GOTO       L__exe_cond390
	BSF        R2, 0
	GOTO       L__exe_cond391
L__exe_cond390:
	BCF        R2, 0
L__exe_cond391:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond392
	BSF        3, 0
	GOTO       L__exe_cond393
L__exe_cond392:
	BCF        3, 0
L__exe_cond393:
	BTFSS      R2, 0
	GOTO       L__exe_cond394
	BTFSS      3, 0
	GOTO       L__exe_cond394
	BSF        R2, 0
	GOTO       L__exe_cond395
L__exe_cond394:
	BCF        R2, 0
L__exe_cond395:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond66
	GOTO       L_exe_cond65
L_exe_cond66:
;APP_OPSM.c,94 :: 		if(COND9){ guc_buzz_state=1;} while(COND9);
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond396
	BSF        3, 0
	GOTO       L__exe_cond397
L__exe_cond396:
	BCF        3, 0
L__exe_cond397:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond398
	BTFSS      3, 0
	GOTO       L__exe_cond398
	BSF        R2, 0
	GOTO       L__exe_cond399
L__exe_cond398:
	BCF        R2, 0
L__exe_cond399:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond400
	BSF        3, 0
	GOTO       L__exe_cond401
L__exe_cond400:
	BCF        3, 0
L__exe_cond401:
	BTFSS      R2, 0
	GOTO       L__exe_cond402
	BTFSS      3, 0
	GOTO       L__exe_cond402
	BSF        R2, 0
	GOTO       L__exe_cond403
L__exe_cond402:
	BCF        R2, 0
L__exe_cond403:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond404
	BSF        3, 0
	GOTO       L__exe_cond405
L__exe_cond404:
	BCF        3, 0
L__exe_cond405:
	BTFSS      R2, 0
	GOTO       L__exe_cond406
	BTFSS      3, 0
	GOTO       L__exe_cond406
	BSF        R2, 0
	GOTO       L__exe_cond407
L__exe_cond406:
	BCF        R2, 0
L__exe_cond407:
	BTFSS      R2, 0
	GOTO       L_exe_cond67
	MOVLW      1
	MOVWF      _guc_buzz_state+0
L_exe_cond67:
L_exe_cond68:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond408
	BSF        3, 0
	GOTO       L__exe_cond409
L__exe_cond408:
	BCF        3, 0
L__exe_cond409:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond410
	BTFSS      3, 0
	GOTO       L__exe_cond410
	BSF        R2, 0
	GOTO       L__exe_cond411
L__exe_cond410:
	BCF        R2, 0
L__exe_cond411:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond412
	BSF        3, 0
	GOTO       L__exe_cond413
L__exe_cond412:
	BCF        3, 0
L__exe_cond413:
	BTFSS      R2, 0
	GOTO       L__exe_cond414
	BTFSS      3, 0
	GOTO       L__exe_cond414
	BSF        R2, 0
	GOTO       L__exe_cond415
L__exe_cond414:
	BCF        R2, 0
L__exe_cond415:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond416
	BSF        3, 0
	GOTO       L__exe_cond417
L__exe_cond416:
	BCF        3, 0
L__exe_cond417:
	BTFSS      R2, 0
	GOTO       L__exe_cond418
	BTFSS      3, 0
	GOTO       L__exe_cond418
	BSF        R2, 0
	GOTO       L__exe_cond419
L__exe_cond418:
	BCF        R2, 0
L__exe_cond419:
	BTFSS      R2, 0
	GOTO       L_exe_cond69
	GOTO       L_exe_cond68
L_exe_cond69:
;APP_OPSM.c,95 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,97 :: 		case 13: guc_sec=0; while(guc_sec<5 & COND13);
L_exe_cond70:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond71:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond420
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond420:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond421
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond421
	BSF        R2, 0
	GOTO       L__exe_cond422
L__exe_cond421:
	BCF        R2, 0
L__exe_cond422:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond423
	BSF        3, 0
	GOTO       L__exe_cond424
L__exe_cond423:
	BCF        3, 0
L__exe_cond424:
	BTFSS      R2, 0
	GOTO       L__exe_cond425
	BTFSS      3, 0
	GOTO       L__exe_cond425
	BSF        R2, 0
	GOTO       L__exe_cond426
L__exe_cond425:
	BCF        R2, 0
L__exe_cond426:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond427
	BSF        3, 0
	GOTO       L__exe_cond428
L__exe_cond427:
	BCF        3, 0
L__exe_cond428:
	BTFSS      R2, 0
	GOTO       L__exe_cond429
	BTFSS      3, 0
	GOTO       L__exe_cond429
	BSF        R2, 0
	GOTO       L__exe_cond430
L__exe_cond429:
	BCF        R2, 0
L__exe_cond430:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond72
	GOTO       L_exe_cond71
L_exe_cond72:
;APP_OPSM.c,98 :: 		if(COND13)
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond431
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond431
	BSF        R2, 0
	GOTO       L__exe_cond432
L__exe_cond431:
	BCF        R2, 0
L__exe_cond432:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond433
	BSF        3, 0
	GOTO       L__exe_cond434
L__exe_cond433:
	BCF        3, 0
L__exe_cond434:
	BTFSS      R2, 0
	GOTO       L__exe_cond435
	BTFSS      3, 0
	GOTO       L__exe_cond435
	BSF        R2, 0
	GOTO       L__exe_cond436
L__exe_cond435:
	BCF        R2, 0
L__exe_cond436:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond437
	BSF        3, 0
	GOTO       L__exe_cond438
L__exe_cond437:
	BCF        3, 0
L__exe_cond438:
	BTFSS      R2, 0
	GOTO       L__exe_cond439
	BTFSS      3, 0
	GOTO       L__exe_cond439
	BSF        R2, 0
	GOTO       L__exe_cond440
L__exe_cond439:
	BCF        R2, 0
L__exe_cond440:
	BTFSS      R2, 0
	GOTO       L_exe_cond73
;APP_OPSM.c,100 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;APP_OPSM.c,101 :: 		guc_sec=0; RELAY_SOL = 1; while(guc_sec<6); RELAY_SOL = 0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond74:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond441
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond441:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond75
	GOTO       L_exe_cond74
L_exe_cond75:
	BCF        PORTC+0, 5
;APP_OPSM.c,102 :: 		}
L_exe_cond73:
;APP_OPSM.c,103 :: 		while(COND13); reset_all(); break;
L_exe_cond76:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond442
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond442
	BSF        R2, 0
	GOTO       L__exe_cond443
L__exe_cond442:
	BCF        R2, 0
L__exe_cond443:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond444
	BSF        3, 0
	GOTO       L__exe_cond445
L__exe_cond444:
	BCF        3, 0
L__exe_cond445:
	BTFSS      R2, 0
	GOTO       L__exe_cond446
	BTFSS      3, 0
	GOTO       L__exe_cond446
	BSF        R2, 0
	GOTO       L__exe_cond447
L__exe_cond446:
	BCF        R2, 0
L__exe_cond447:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond448
	BSF        3, 0
	GOTO       L__exe_cond449
L__exe_cond448:
	BCF        3, 0
L__exe_cond449:
	BTFSS      R2, 0
	GOTO       L__exe_cond450
	BTFSS      3, 0
	GOTO       L__exe_cond450
	BSF        R2, 0
	GOTO       L__exe_cond451
L__exe_cond450:
	BCF        R2, 0
L__exe_cond451:
	BTFSS      R2, 0
	GOTO       L_exe_cond77
	GOTO       L_exe_cond76
L_exe_cond77:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,105 :: 		case 14: guc_buzz_state=0; guc_sec=0; while(guc_sec<5 & COND14);
L_exe_cond78:
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond79:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond452
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond452:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond453
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond453
	BSF        R2, 0
	GOTO       L__exe_cond454
L__exe_cond453:
	BCF        R2, 0
L__exe_cond454:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond455
	BSF        3, 0
	GOTO       L__exe_cond456
L__exe_cond455:
	BCF        3, 0
L__exe_cond456:
	BTFSS      R2, 0
	GOTO       L__exe_cond457
	BTFSS      3, 0
	GOTO       L__exe_cond457
	BSF        R2, 0
	GOTO       L__exe_cond458
L__exe_cond457:
	BCF        R2, 0
L__exe_cond458:
	BTFSS      R2, 0
	GOTO       L__exe_cond459
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond459
	BSF        3, 0
	GOTO       L__exe_cond460
L__exe_cond459:
	BCF        3, 0
L__exe_cond460:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond80
	GOTO       L_exe_cond79
L_exe_cond80:
;APP_OPSM.c,106 :: 		if(COND14)
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond461
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond461
	BSF        R2, 0
	GOTO       L__exe_cond462
L__exe_cond461:
	BCF        R2, 0
L__exe_cond462:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond463
	BSF        3, 0
	GOTO       L__exe_cond464
L__exe_cond463:
	BCF        3, 0
L__exe_cond464:
	BTFSS      R2, 0
	GOTO       L__exe_cond465
	BTFSS      3, 0
	GOTO       L__exe_cond465
	BSF        R2, 0
	GOTO       L__exe_cond466
L__exe_cond465:
	BCF        R2, 0
L__exe_cond466:
	BTFSS      R2, 0
	GOTO       L__exe_cond467
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond467
	BSF        3, 0
	GOTO       L__exe_cond468
L__exe_cond467:
	BCF        3, 0
L__exe_cond468:
	BTFSS      3, 0
	GOTO       L_exe_cond81
;APP_OPSM.c,108 :: 		guc_sec=0; RELAY_SOL = 1; while(guc_sec<6); RELAY_SOL = 0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond82:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond469
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond469:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond83
	GOTO       L_exe_cond82
L_exe_cond83:
	BCF        PORTC+0, 5
;APP_OPSM.c,109 :: 		}
L_exe_cond81:
;APP_OPSM.c,110 :: 		while(COND14); reset_all(); break;
L_exe_cond84:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond470
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond470
	BSF        R2, 0
	GOTO       L__exe_cond471
L__exe_cond470:
	BCF        R2, 0
L__exe_cond471:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond472
	BSF        3, 0
	GOTO       L__exe_cond473
L__exe_cond472:
	BCF        3, 0
L__exe_cond473:
	BTFSS      R2, 0
	GOTO       L__exe_cond474
	BTFSS      3, 0
	GOTO       L__exe_cond474
	BSF        R2, 0
	GOTO       L__exe_cond475
L__exe_cond474:
	BCF        R2, 0
L__exe_cond475:
	BTFSS      R2, 0
	GOTO       L__exe_cond476
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond476
	BSF        3, 0
	GOTO       L__exe_cond477
L__exe_cond476:
	BCF        3, 0
L__exe_cond477:
	BTFSS      3, 0
	GOTO       L_exe_cond85
	GOTO       L_exe_cond84
L_exe_cond85:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,112 :: 		case 15: guc_buzz_state=0; guc_sec=0; while(guc_sec<5 & COND15);
L_exe_cond86:
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond87:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond478
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond478:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond479
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond479
	BSF        3, 0
	GOTO       L__exe_cond480
L__exe_cond479:
	BCF        3, 0
L__exe_cond480:
	BTFSS      3, 0
	GOTO       L__exe_cond481
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond481
	BSF        R2, 0
	GOTO       L__exe_cond482
L__exe_cond481:
	BCF        R2, 0
L__exe_cond482:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond483
	BSF        3, 0
	GOTO       L__exe_cond484
L__exe_cond483:
	BCF        3, 0
L__exe_cond484:
	BTFSS      R2, 0
	GOTO       L__exe_cond485
	BTFSS      3, 0
	GOTO       L__exe_cond485
	BSF        R2, 0
	GOTO       L__exe_cond486
L__exe_cond485:
	BCF        R2, 0
L__exe_cond486:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond88
	GOTO       L_exe_cond87
L_exe_cond88:
;APP_OPSM.c,113 :: 		if(COND15)
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond487
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond487
	BSF        3, 0
	GOTO       L__exe_cond488
L__exe_cond487:
	BCF        3, 0
L__exe_cond488:
	BTFSS      3, 0
	GOTO       L__exe_cond489
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond489
	BSF        R2, 0
	GOTO       L__exe_cond490
L__exe_cond489:
	BCF        R2, 0
L__exe_cond490:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond491
	BSF        3, 0
	GOTO       L__exe_cond492
L__exe_cond491:
	BCF        3, 0
L__exe_cond492:
	BTFSS      R2, 0
	GOTO       L__exe_cond493
	BTFSS      3, 0
	GOTO       L__exe_cond493
	BSF        R2, 0
	GOTO       L__exe_cond494
L__exe_cond493:
	BCF        R2, 0
L__exe_cond494:
	BTFSS      R2, 0
	GOTO       L_exe_cond89
;APP_OPSM.c,115 :: 		guc_sec=0; RELAY_SOL = 1; while(guc_sec<6); RELAY_SOL = 0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond90:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond495
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond495:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond91
	GOTO       L_exe_cond90
L_exe_cond91:
	BCF        PORTC+0, 5
;APP_OPSM.c,116 :: 		}
L_exe_cond89:
;APP_OPSM.c,117 :: 		while(COND15); reset_all(); break;
L_exe_cond92:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond496
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond496
	BSF        3, 0
	GOTO       L__exe_cond497
L__exe_cond496:
	BCF        3, 0
L__exe_cond497:
	BTFSS      3, 0
	GOTO       L__exe_cond498
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond498
	BSF        R2, 0
	GOTO       L__exe_cond499
L__exe_cond498:
	BCF        R2, 0
L__exe_cond499:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond500
	BSF        3, 0
	GOTO       L__exe_cond501
L__exe_cond500:
	BCF        3, 0
L__exe_cond501:
	BTFSS      R2, 0
	GOTO       L__exe_cond502
	BTFSS      3, 0
	GOTO       L__exe_cond502
	BSF        R2, 0
	GOTO       L__exe_cond503
L__exe_cond502:
	BCF        R2, 0
L__exe_cond503:
	BTFSS      R2, 0
	GOTO       L_exe_cond93
	GOTO       L_exe_cond92
L_exe_cond93:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,119 :: 		case 16: guc_buzz_state=0; guc_sec=0; while(guc_sec<5 & COND16);
L_exe_cond94:
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond95:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond504
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond504:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond505
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond505
	BSF        3, 0
	GOTO       L__exe_cond506
L__exe_cond505:
	BCF        3, 0
L__exe_cond506:
	BTFSS      3, 0
	GOTO       L__exe_cond507
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond507
	BSF        R2, 0
	GOTO       L__exe_cond508
L__exe_cond507:
	BCF        R2, 0
L__exe_cond508:
	BTFSS      R2, 0
	GOTO       L__exe_cond509
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond509
	BSF        3, 0
	GOTO       L__exe_cond510
L__exe_cond509:
	BCF        3, 0
L__exe_cond510:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond96
	GOTO       L_exe_cond95
L_exe_cond96:
;APP_OPSM.c,120 :: 		if(COND16)
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond511
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond511
	BSF        3, 0
	GOTO       L__exe_cond512
L__exe_cond511:
	BCF        3, 0
L__exe_cond512:
	BTFSS      3, 0
	GOTO       L__exe_cond513
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond513
	BSF        R2, 0
	GOTO       L__exe_cond514
L__exe_cond513:
	BCF        R2, 0
L__exe_cond514:
	BTFSS      R2, 0
	GOTO       L__exe_cond515
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond515
	BSF        3, 0
	GOTO       L__exe_cond516
L__exe_cond515:
	BCF        3, 0
L__exe_cond516:
	BTFSS      3, 0
	GOTO       L_exe_cond97
;APP_OPSM.c,122 :: 		guc_sec=0; RELAY_SOL = 1; while(guc_sec<6); RELAY_SOL = 0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond98:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond517
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond517:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond99
	GOTO       L_exe_cond98
L_exe_cond99:
	BCF        PORTC+0, 5
;APP_OPSM.c,123 :: 		}
L_exe_cond97:
;APP_OPSM.c,124 :: 		while(COND16); reset_all(); break;
L_exe_cond100:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond518
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond518
	BSF        3, 0
	GOTO       L__exe_cond519
L__exe_cond518:
	BCF        3, 0
L__exe_cond519:
	BTFSS      3, 0
	GOTO       L__exe_cond520
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond520
	BSF        R2, 0
	GOTO       L__exe_cond521
L__exe_cond520:
	BCF        R2, 0
L__exe_cond521:
	BTFSS      R2, 0
	GOTO       L__exe_cond522
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond522
	BSF        3, 0
	GOTO       L__exe_cond523
L__exe_cond522:
	BCF        3, 0
L__exe_cond523:
	BTFSS      3, 0
	GOTO       L_exe_cond101
	GOTO       L_exe_cond100
L_exe_cond101:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,126 :: 		default: reset_all(); break;
L_exe_cond102:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,127 :: 		}
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
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond58
	MOVF       _guc_choice+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond61
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond64
	MOVF       _guc_choice+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond70
	MOVF       _guc_choice+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond78
	MOVF       _guc_choice+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond86
	MOVF       _guc_choice+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond94
	GOTO       L_exe_cond102
L_exe_cond42:
;APP_OPSM.c,128 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,131 :: 		void sys_init()
;APP_OPSM.c,134 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,136 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,137 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,138 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,139 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,141 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,142 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,143 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,144 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,146 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,147 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,150 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,151 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,162 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,167 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP_OPSM.c,184 :: 		void main()
;APP_OPSM.c,186 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,187 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;APP_OPSM.c,189 :: 		while(1)
L_main103:
;APP_OPSM.c,191 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,192 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main105
;APP_OPSM.c,194 :: 		diag_choice = guc_choice;
	MOVF       _guc_choice+0, 0
	MOVWF      _diag_choice+0
;APP_OPSM.c,195 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,196 :: 		}
L_main105:
;APP_OPSM.c,197 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,205 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,206 :: 		}
	GOTO       L_main103
;APP_OPSM.c,207 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
