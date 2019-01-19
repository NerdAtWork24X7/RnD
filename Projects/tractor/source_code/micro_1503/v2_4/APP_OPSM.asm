
_interrupt:

;APP_OPSM.c,18 :: 		void interrupt()
;APP_OPSM.c,20 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,21 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt98:
;APP_OPSM.c,23 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,32 :: 		}
L_interrupt2:
;APP_OPSM.c,34 :: 		}
L_end_interrupt:
L__interrupt101:
	RETFIE     %s
; end of _interrupt

_CHCK_COND:

;APP_OPSM.c,36 :: 		void CHCK_COND(uint8 x)
;APP_OPSM.c,39 :: 		guc_deb[x]++;
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
;APP_OPSM.c,40 :: 		for(i=0;i<=TOTAL_COND && i!=x;i++){guc_deb[i] = 0;}
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
L__CHCK_COND99:
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
;APP_OPSM.c,41 :: 		if(guc_deb[x] > DEBO_TIME){ guc_choice = x; guc_deb[x] = 0;}
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
	GOTO       L__CHCK_COND103
	MOVF       R1, 0
	SUBLW      10
L__CHCK_COND103:
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
;APP_OPSM.c,42 :: 		}
L_end_CHCK_COND:
	RETURN
; end of _CHCK_COND

_check_cond:

;APP_OPSM.c,45 :: 		void check_cond()
;APP_OPSM.c,47 :: 		guc_choice = 0;
	CLRF       _guc_choice+0
;APP_OPSM.c,48 :: 		if(COND1){ CHCK_COND(1); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond105
	BSF        R0, 0
	GOTO       L__check_cond106
L__check_cond105:
	BCF        R0, 0
L__check_cond106:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
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
	BTFSS      R0, 0
	GOTO       L_check_cond9
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond10
L_check_cond9:
;APP_OPSM.c,49 :: 		else if(COND2){ CHCK_COND(2); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond119
	BSF        R0, 0
	GOTO       L__check_cond120
L__check_cond119:
	BCF        R0, 0
L__check_cond120:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 2
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
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond129
	BSF        3, 0
	GOTO       L__check_cond130
L__check_cond129:
	BCF        3, 0
L__check_cond130:
	BTFSS      3, 0
	GOTO       L_check_cond11
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond12
L_check_cond11:
;APP_OPSM.c,50 :: 		else if(COND3){ CHCK_COND(3); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond131
	BSF        R0, 0
	GOTO       L__check_cond132
L__check_cond131:
	BCF        R0, 0
L__check_cond132:
	BTFSC      PORTC+0, 1
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
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond137
	BSF        R0, 0
	GOTO       L__check_cond138
L__check_cond137:
	BCF        R0, 0
L__check_cond138:
	BTFSC      PORTC+0, 0
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
	GOTO       L_check_cond13
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond14
L_check_cond13:
;APP_OPSM.c,51 :: 		else if(COND4){ CHCK_COND(4); }
	BTFSC      PORTA+0, 5
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
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond149
	BSF        3, 0
	GOTO       L__check_cond150
L__check_cond149:
	BCF        3, 0
L__check_cond150:
	BTFSS      3, 0
	GOTO       L__check_cond151
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond151
	BSF        R0, 0
	GOTO       L__check_cond152
L__check_cond151:
	BCF        R0, 0
L__check_cond152:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond16
L_check_cond15:
;APP_OPSM.c,52 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond153
	BSF        3, 0
	GOTO       L__check_cond154
L__check_cond153:
	BCF        3, 0
L__check_cond154:
	BTFSS      3, 0
	GOTO       L__check_cond155
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond155
	BSF        R0, 0
	GOTO       L__check_cond156
L__check_cond155:
	BCF        R0, 0
L__check_cond156:
	BTFSC      PORTC+0, 2
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
	BTFSS      R0, 0
	GOTO       L_check_cond17
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond18
L_check_cond17:
;APP_OPSM.c,53 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond165
	BSF        3, 0
	GOTO       L__check_cond166
L__check_cond165:
	BCF        3, 0
L__check_cond166:
	BTFSS      3, 0
	GOTO       L__check_cond167
	BTFSS      PORTC+0, 1
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
	BTFSS      R0, 0
	GOTO       L__check_cond173
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond173
	BSF        3, 0
	GOTO       L__check_cond174
L__check_cond173:
	BCF        3, 0
L__check_cond174:
	BTFSS      3, 0
	GOTO       L_check_cond19
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond20
L_check_cond19:
;APP_OPSM.c,54 :: 		else if(COND7){ CHCK_COND(7); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond175
	BSF        3, 0
	GOTO       L__check_cond176
L__check_cond175:
	BCF        3, 0
L__check_cond176:
	BTFSS      3, 0
	GOTO       L__check_cond177
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond177
	BSF        R0, 0
	GOTO       L__check_cond178
L__check_cond177:
	BCF        R0, 0
L__check_cond178:
	BTFSS      R0, 0
	GOTO       L__check_cond179
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond179
	BSF        R0, 0
	GOTO       L__check_cond180
L__check_cond179:
	BCF        R0, 0
L__check_cond180:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond181
	BSF        3, 0
	GOTO       L__check_cond182
L__check_cond181:
	BCF        3, 0
L__check_cond182:
	BTFSS      R0, 0
	GOTO       L__check_cond183
	BTFSS      3, 0
	GOTO       L__check_cond183
	BSF        R0, 0
	GOTO       L__check_cond184
L__check_cond183:
	BCF        R0, 0
L__check_cond184:
	BTFSS      R0, 0
	GOTO       L_check_cond21
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond22
L_check_cond21:
;APP_OPSM.c,55 :: 		else if(COND8){ CHCK_COND(8); }
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond185
	BSF        3, 0
	GOTO       L__check_cond186
L__check_cond185:
	BCF        3, 0
L__check_cond186:
	BTFSS      3, 0
	GOTO       L__check_cond187
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond187
	BSF        R0, 0
	GOTO       L__check_cond188
L__check_cond187:
	BCF        R0, 0
L__check_cond188:
	BTFSS      R0, 0
	GOTO       L__check_cond189
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond189
	BSF        3, 0
	GOTO       L__check_cond190
L__check_cond189:
	BCF        3, 0
L__check_cond190:
	BTFSS      3, 0
	GOTO       L__check_cond191
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond191
	BSF        R0, 0
	GOTO       L__check_cond192
L__check_cond191:
	BCF        R0, 0
L__check_cond192:
	BTFSS      R0, 0
	GOTO       L_check_cond23
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond24
L_check_cond23:
;APP_OPSM.c,56 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond193
	BSF        3, 0
	GOTO       L__check_cond194
L__check_cond193:
	BCF        3, 0
L__check_cond194:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond195
	BTFSS      3, 0
	GOTO       L__check_cond195
	BSF        R0, 0
	GOTO       L__check_cond196
L__check_cond195:
	BCF        R0, 0
L__check_cond196:
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond201
	BSF        3, 0
	GOTO       L__check_cond202
L__check_cond201:
	BCF        3, 0
L__check_cond202:
	BTFSS      R0, 0
	GOTO       L__check_cond203
	BTFSS      3, 0
	GOTO       L__check_cond203
	BSF        R0, 0
	GOTO       L__check_cond204
L__check_cond203:
	BCF        R0, 0
L__check_cond204:
	BTFSS      R0, 0
	GOTO       L_check_cond25
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond26
L_check_cond25:
;APP_OPSM.c,57 :: 		else if(COND10){ CHCK_COND(10); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond205
	BSF        3, 0
	GOTO       L__check_cond206
L__check_cond205:
	BCF        3, 0
L__check_cond206:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond207
	BTFSS      3, 0
	GOTO       L__check_cond207
	BSF        R0, 0
	GOTO       L__check_cond208
L__check_cond207:
	BCF        R0, 0
L__check_cond208:
	BTFSC      PORTC+0, 2
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
	GOTO       L__check_cond213
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond213
	BSF        3, 0
	GOTO       L__check_cond214
L__check_cond213:
	BCF        3, 0
L__check_cond214:
	BTFSS      3, 0
	GOTO       L_check_cond27
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond28
L_check_cond27:
;APP_OPSM.c,58 :: 		else if(COND11){ CHCK_COND(11); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond215
	BSF        3, 0
	GOTO       L__check_cond216
L__check_cond215:
	BCF        3, 0
L__check_cond216:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond217
	BTFSS      3, 0
	GOTO       L__check_cond217
	BSF        R0, 0
	GOTO       L__check_cond218
L__check_cond217:
	BCF        R0, 0
L__check_cond218:
	BTFSS      R0, 0
	GOTO       L__check_cond219
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond219
	BSF        R0, 0
	GOTO       L__check_cond220
L__check_cond219:
	BCF        R0, 0
L__check_cond220:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond221
	BSF        3, 0
	GOTO       L__check_cond222
L__check_cond221:
	BCF        3, 0
L__check_cond222:
	BTFSS      R0, 0
	GOTO       L__check_cond223
	BTFSS      3, 0
	GOTO       L__check_cond223
	BSF        R0, 0
	GOTO       L__check_cond224
L__check_cond223:
	BCF        R0, 0
L__check_cond224:
	BTFSS      R0, 0
	GOTO       L_check_cond29
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond30
L_check_cond29:
;APP_OPSM.c,59 :: 		else if(COND12){ CHCK_COND(12); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond225
	BSF        3, 0
	GOTO       L__check_cond226
L__check_cond225:
	BCF        3, 0
L__check_cond226:
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond227
	BTFSS      3, 0
	GOTO       L__check_cond227
	BSF        R0, 0
	GOTO       L__check_cond228
L__check_cond227:
	BCF        R0, 0
L__check_cond228:
	BTFSS      R0, 0
	GOTO       L__check_cond229
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond229
	BSF        3, 0
	GOTO       L__check_cond230
L__check_cond229:
	BCF        3, 0
L__check_cond230:
	BTFSS      3, 0
	GOTO       L__check_cond231
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond231
	BSF        R0, 0
	GOTO       L__check_cond232
L__check_cond231:
	BCF        R0, 0
L__check_cond232:
	BTFSS      R0, 0
	GOTO       L_check_cond31
	MOVLW      12
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond32
L_check_cond31:
;APP_OPSM.c,60 :: 		else if(COND13){ CHCK_COND(13); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond233
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond233
	BSF        R0, 0
	GOTO       L__check_cond234
L__check_cond233:
	BCF        R0, 0
L__check_cond234:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond235
	BSF        3, 0
	GOTO       L__check_cond236
L__check_cond235:
	BCF        3, 0
L__check_cond236:
	BTFSS      R0, 0
	GOTO       L__check_cond237
	BTFSS      3, 0
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
	GOTO       L_check_cond33
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond34
L_check_cond33:
;APP_OPSM.c,61 :: 		else if(COND14){ CHCK_COND(14); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond243
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond243
	BSF        R0, 0
	GOTO       L__check_cond244
L__check_cond243:
	BCF        R0, 0
L__check_cond244:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond245
	BSF        3, 0
	GOTO       L__check_cond246
L__check_cond245:
	BCF        3, 0
L__check_cond246:
	BTFSS      R0, 0
	GOTO       L__check_cond247
	BTFSS      3, 0
	GOTO       L__check_cond247
	BSF        R0, 0
	GOTO       L__check_cond248
L__check_cond247:
	BCF        R0, 0
L__check_cond248:
	BTFSS      R0, 0
	GOTO       L__check_cond249
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond249
	BSF        3, 0
	GOTO       L__check_cond250
L__check_cond249:
	BCF        3, 0
L__check_cond250:
	BTFSS      3, 0
	GOTO       L_check_cond35
	MOVLW      14
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond36
L_check_cond35:
;APP_OPSM.c,62 :: 		else if(COND15){ CHCK_COND(15); }
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond251
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond251
	BSF        3, 0
	GOTO       L__check_cond252
L__check_cond251:
	BCF        3, 0
L__check_cond252:
	BTFSS      3, 0
	GOTO       L__check_cond253
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond253
	BSF        R0, 0
	GOTO       L__check_cond254
L__check_cond253:
	BCF        R0, 0
L__check_cond254:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond255
	BSF        3, 0
	GOTO       L__check_cond256
L__check_cond255:
	BCF        3, 0
L__check_cond256:
	BTFSS      R0, 0
	GOTO       L__check_cond257
	BTFSS      3, 0
	GOTO       L__check_cond257
	BSF        R0, 0
	GOTO       L__check_cond258
L__check_cond257:
	BCF        R0, 0
L__check_cond258:
	BTFSS      R0, 0
	GOTO       L_check_cond37
	MOVLW      15
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond38
L_check_cond37:
;APP_OPSM.c,63 :: 		else if(COND16){ CHCK_COND(16); }
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
	BTFSS      R0, 0
	GOTO       L__check_cond263
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond263
	BSF        3, 0
	GOTO       L__check_cond264
L__check_cond263:
	BCF        3, 0
L__check_cond264:
	BTFSS      3, 0
	GOTO       L_check_cond39
	MOVLW      16
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond40
L_check_cond39:
;APP_OPSM.c,64 :: 		else {guc_choice = (TOTAL_COND - 1);}
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
;APP_OPSM.c,66 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,68 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_reset_all:

;APP_OPSM.c,70 :: 		void reset_all()
;APP_OPSM.c,72 :: 		guc_togg_half = 0;
	CLRF       _guc_togg_half+0
;APP_OPSM.c,73 :: 		guc_buzz_state = 0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,74 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,75 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,77 :: 		P_IND = 0;
	BCF        PORTC+0, 3
;APP_OPSM.c,78 :: 		RELAY_STR = 0;
	BCF        PORTC+0, 4
;APP_OPSM.c,79 :: 		}
L_end_reset_all:
	RETURN
; end of _reset_all

_exe_cond:

;APP_OPSM.c,81 :: 		void exe_cond()
;APP_OPSM.c,83 :: 		switch(guc_choice)
	GOTO       L_exe_cond41
;APP_OPSM.c,85 :: 		case 1: guc_sec = 0; while(guc_sec<5 & COND1);
L_exe_cond43:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond44:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond267
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond267:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond268
	BSF        R2, 0
	GOTO       L__exe_cond269
L__exe_cond268:
	BCF        R2, 0
L__exe_cond269:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
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
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond45
	GOTO       L_exe_cond44
L_exe_cond45:
;APP_OPSM.c,86 :: 		if(COND1){ while(COND1){guc_buzz_state=1;}}
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond282
	BSF        R2, 0
	GOTO       L__exe_cond283
L__exe_cond282:
	BCF        R2, 0
L__exe_cond283:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond284
	BSF        3, 0
	GOTO       L__exe_cond285
L__exe_cond284:
	BCF        3, 0
L__exe_cond285:
	BTFSS      R2, 0
	GOTO       L__exe_cond286
	BTFSS      3, 0
	GOTO       L__exe_cond286
	BSF        R2, 0
	GOTO       L__exe_cond287
L__exe_cond286:
	BCF        R2, 0
L__exe_cond287:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond288
	BSF        3, 0
	GOTO       L__exe_cond289
L__exe_cond288:
	BCF        3, 0
L__exe_cond289:
	BTFSS      R2, 0
	GOTO       L__exe_cond290
	BTFSS      3, 0
	GOTO       L__exe_cond290
	BSF        R2, 0
	GOTO       L__exe_cond291
L__exe_cond290:
	BCF        R2, 0
L__exe_cond291:
	BTFSC      PORTC+0, 0
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
	BTFSS      R2, 0
	GOTO       L_exe_cond46
L_exe_cond47:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond296
	BSF        R2, 0
	GOTO       L__exe_cond297
L__exe_cond296:
	BCF        R2, 0
L__exe_cond297:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond298
	BSF        3, 0
	GOTO       L__exe_cond299
L__exe_cond298:
	BCF        3, 0
L__exe_cond299:
	BTFSS      R2, 0
	GOTO       L__exe_cond300
	BTFSS      3, 0
	GOTO       L__exe_cond300
	BSF        R2, 0
	GOTO       L__exe_cond301
L__exe_cond300:
	BCF        R2, 0
L__exe_cond301:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond302
	BSF        3, 0
	GOTO       L__exe_cond303
L__exe_cond302:
	BCF        3, 0
L__exe_cond303:
	BTFSS      R2, 0
	GOTO       L__exe_cond304
	BTFSS      3, 0
	GOTO       L__exe_cond304
	BSF        R2, 0
	GOTO       L__exe_cond305
L__exe_cond304:
	BCF        R2, 0
L__exe_cond305:
	BTFSC      PORTC+0, 0
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
	BTFSS      R2, 0
	GOTO       L_exe_cond48
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond47
L_exe_cond48:
L_exe_cond46:
;APP_OPSM.c,87 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,89 :: 		case 5: RELAY_SOL = 1; guc_sec = 0; while(guc_sec<5 & COND5);
L_exe_cond49:
	BSF        PORTC+0, 5
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond50:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond310
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond310:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond311
	BSF        3, 0
	GOTO       L__exe_cond312
L__exe_cond311:
	BCF        3, 0
L__exe_cond312:
	BTFSS      3, 0
	GOTO       L__exe_cond313
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond313
	BSF        R2, 0
	GOTO       L__exe_cond314
L__exe_cond313:
	BCF        R2, 0
L__exe_cond314:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond315
	BSF        3, 0
	GOTO       L__exe_cond316
L__exe_cond315:
	BCF        3, 0
L__exe_cond316:
	BTFSS      R2, 0
	GOTO       L__exe_cond317
	BTFSS      3, 0
	GOTO       L__exe_cond317
	BSF        R2, 0
	GOTO       L__exe_cond318
L__exe_cond317:
	BCF        R2, 0
L__exe_cond318:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond319
	BSF        3, 0
	GOTO       L__exe_cond320
L__exe_cond319:
	BCF        3, 0
L__exe_cond320:
	BTFSS      R2, 0
	GOTO       L__exe_cond321
	BTFSS      3, 0
	GOTO       L__exe_cond321
	BSF        R2, 0
	GOTO       L__exe_cond322
L__exe_cond321:
	BCF        R2, 0
L__exe_cond322:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond51
	GOTO       L_exe_cond50
L_exe_cond51:
;APP_OPSM.c,90 :: 		if(COND5){while(COND5){guc_buzz_state=1;}}
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond323
	BSF        3, 0
	GOTO       L__exe_cond324
L__exe_cond323:
	BCF        3, 0
L__exe_cond324:
	BTFSS      3, 0
	GOTO       L__exe_cond325
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond325
	BSF        R2, 0
	GOTO       L__exe_cond326
L__exe_cond325:
	BCF        R2, 0
L__exe_cond326:
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond331
	BSF        3, 0
	GOTO       L__exe_cond332
L__exe_cond331:
	BCF        3, 0
L__exe_cond332:
	BTFSS      R2, 0
	GOTO       L__exe_cond333
	BTFSS      3, 0
	GOTO       L__exe_cond333
	BSF        R2, 0
	GOTO       L__exe_cond334
L__exe_cond333:
	BCF        R2, 0
L__exe_cond334:
	BTFSS      R2, 0
	GOTO       L_exe_cond52
L_exe_cond53:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond335
	BSF        3, 0
	GOTO       L__exe_cond336
L__exe_cond335:
	BCF        3, 0
L__exe_cond336:
	BTFSS      3, 0
	GOTO       L__exe_cond337
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond337
	BSF        R2, 0
	GOTO       L__exe_cond338
L__exe_cond337:
	BCF        R2, 0
L__exe_cond338:
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond343
	BSF        3, 0
	GOTO       L__exe_cond344
L__exe_cond343:
	BCF        3, 0
L__exe_cond344:
	BTFSS      R2, 0
	GOTO       L__exe_cond345
	BTFSS      3, 0
	GOTO       L__exe_cond345
	BSF        R2, 0
	GOTO       L__exe_cond346
L__exe_cond345:
	BCF        R2, 0
L__exe_cond346:
	BTFSS      R2, 0
	GOTO       L_exe_cond54
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond53
L_exe_cond54:
L_exe_cond52:
;APP_OPSM.c,91 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,93 :: 		case 6: while(COND6){RELAY_SOL = 1; guc_buzz_state = 0;} reset_all(); break;
L_exe_cond55:
L_exe_cond56:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond347
	BSF        3, 0
	GOTO       L__exe_cond348
L__exe_cond347:
	BCF        3, 0
L__exe_cond348:
	BTFSS      3, 0
	GOTO       L__exe_cond349
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond349
	BSF        R2, 0
	GOTO       L__exe_cond350
L__exe_cond349:
	BCF        R2, 0
L__exe_cond350:
	BTFSC      PORTC+0, 2
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
	GOTO       L__exe_cond355
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond355
	BSF        3, 0
	GOTO       L__exe_cond356
L__exe_cond355:
	BCF        3, 0
L__exe_cond356:
	BTFSS      3, 0
	GOTO       L_exe_cond57
	BSF        PORTC+0, 5
	CLRF       _guc_buzz_state+0
	GOTO       L_exe_cond56
L_exe_cond57:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,95 :: 		case 7: while(COND7){RELAY_SOL = 1; guc_buzz_state = 0;} reset_all(); break;
L_exe_cond58:
L_exe_cond59:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond357
	BSF        3, 0
	GOTO       L__exe_cond358
L__exe_cond357:
	BCF        3, 0
L__exe_cond358:
	BTFSS      3, 0
	GOTO       L__exe_cond359
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond359
	BSF        R2, 0
	GOTO       L__exe_cond360
L__exe_cond359:
	BCF        R2, 0
L__exe_cond360:
	BTFSS      R2, 0
	GOTO       L__exe_cond361
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond361
	BSF        R2, 0
	GOTO       L__exe_cond362
L__exe_cond361:
	BCF        R2, 0
L__exe_cond362:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond363
	BSF        3, 0
	GOTO       L__exe_cond364
L__exe_cond363:
	BCF        3, 0
L__exe_cond364:
	BTFSS      R2, 0
	GOTO       L__exe_cond365
	BTFSS      3, 0
	GOTO       L__exe_cond365
	BSF        R2, 0
	GOTO       L__exe_cond366
L__exe_cond365:
	BCF        R2, 0
L__exe_cond366:
	BTFSS      R2, 0
	GOTO       L_exe_cond60
	BSF        PORTC+0, 5
	CLRF       _guc_buzz_state+0
	GOTO       L_exe_cond59
L_exe_cond60:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,97 :: 		case 8: while(COND8){RELAY_SOL = 1; guc_buzz_state = 0;} reset_all(); break;
L_exe_cond61:
L_exe_cond62:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond367
	BSF        3, 0
	GOTO       L__exe_cond368
L__exe_cond367:
	BCF        3, 0
L__exe_cond368:
	BTFSS      3, 0
	GOTO       L__exe_cond369
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond369
	BSF        R2, 0
	GOTO       L__exe_cond370
L__exe_cond369:
	BCF        R2, 0
L__exe_cond370:
	BTFSS      R2, 0
	GOTO       L__exe_cond371
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond371
	BSF        3, 0
	GOTO       L__exe_cond372
L__exe_cond371:
	BCF        3, 0
L__exe_cond372:
	BTFSS      3, 0
	GOTO       L__exe_cond373
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond373
	BSF        R2, 0
	GOTO       L__exe_cond374
L__exe_cond373:
	BCF        R2, 0
L__exe_cond374:
	BTFSS      R2, 0
	GOTO       L_exe_cond63
	BSF        PORTC+0, 5
	CLRF       _guc_buzz_state+0
	GOTO       L_exe_cond62
L_exe_cond63:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,99 :: 		case 9: guc_sec = 0; while(guc_sec < 5 & COND9);
L_exe_cond64:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond65:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond375
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond375:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond376
	BSF        3, 0
	GOTO       L__exe_cond377
L__exe_cond376:
	BCF        3, 0
L__exe_cond377:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond378
	BTFSS      3, 0
	GOTO       L__exe_cond378
	BSF        R2, 0
	GOTO       L__exe_cond379
L__exe_cond378:
	BCF        R2, 0
L__exe_cond379:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond380
	BSF        3, 0
	GOTO       L__exe_cond381
L__exe_cond380:
	BCF        3, 0
L__exe_cond381:
	BTFSS      R2, 0
	GOTO       L__exe_cond382
	BTFSS      3, 0
	GOTO       L__exe_cond382
	BSF        R2, 0
	GOTO       L__exe_cond383
L__exe_cond382:
	BCF        R2, 0
L__exe_cond383:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond384
	BSF        3, 0
	GOTO       L__exe_cond385
L__exe_cond384:
	BCF        3, 0
L__exe_cond385:
	BTFSS      R2, 0
	GOTO       L__exe_cond386
	BTFSS      3, 0
	GOTO       L__exe_cond386
	BSF        R2, 0
	GOTO       L__exe_cond387
L__exe_cond386:
	BCF        R2, 0
L__exe_cond387:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond66
	GOTO       L_exe_cond65
L_exe_cond66:
;APP_OPSM.c,100 :: 		if(COND9){ while(COND9){guc_buzz_state = 1;}}
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond388
	BSF        3, 0
	GOTO       L__exe_cond389
L__exe_cond388:
	BCF        3, 0
L__exe_cond389:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond390
	BTFSS      3, 0
	GOTO       L__exe_cond390
	BSF        R2, 0
	GOTO       L__exe_cond391
L__exe_cond390:
	BCF        R2, 0
L__exe_cond391:
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond396
	BSF        3, 0
	GOTO       L__exe_cond397
L__exe_cond396:
	BCF        3, 0
L__exe_cond397:
	BTFSS      R2, 0
	GOTO       L__exe_cond398
	BTFSS      3, 0
	GOTO       L__exe_cond398
	BSF        R2, 0
	GOTO       L__exe_cond399
L__exe_cond398:
	BCF        R2, 0
L__exe_cond399:
	BTFSS      R2, 0
	GOTO       L_exe_cond67
L_exe_cond68:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond400
	BSF        3, 0
	GOTO       L__exe_cond401
L__exe_cond400:
	BCF        3, 0
L__exe_cond401:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond402
	BTFSS      3, 0
	GOTO       L__exe_cond402
	BSF        R2, 0
	GOTO       L__exe_cond403
L__exe_cond402:
	BCF        R2, 0
L__exe_cond403:
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond408
	BSF        3, 0
	GOTO       L__exe_cond409
L__exe_cond408:
	BCF        3, 0
L__exe_cond409:
	BTFSS      R2, 0
	GOTO       L__exe_cond410
	BTFSS      3, 0
	GOTO       L__exe_cond410
	BSF        R2, 0
	GOTO       L__exe_cond411
L__exe_cond410:
	BCF        R2, 0
L__exe_cond411:
	BTFSS      R2, 0
	GOTO       L_exe_cond69
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond68
L_exe_cond69:
L_exe_cond67:
;APP_OPSM.c,101 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,103 :: 		case 13: guc_sec = 0; while(guc_sec < 5 & COND13);
L_exe_cond70:
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond71:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond412
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond412:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
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
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond419
	BSF        3, 0
	GOTO       L__exe_cond420
L__exe_cond419:
	BCF        3, 0
L__exe_cond420:
	BTFSS      R2, 0
	GOTO       L__exe_cond421
	BTFSS      3, 0
	GOTO       L__exe_cond421
	BSF        R2, 0
	GOTO       L__exe_cond422
L__exe_cond421:
	BCF        R2, 0
L__exe_cond422:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond72
	GOTO       L_exe_cond71
L_exe_cond72:
;APP_OPSM.c,104 :: 		if(COND13)
	BTFSS      PORTA+0, 5
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
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond429
	BSF        3, 0
	GOTO       L__exe_cond430
L__exe_cond429:
	BCF        3, 0
L__exe_cond430:
	BTFSS      R2, 0
	GOTO       L__exe_cond431
	BTFSS      3, 0
	GOTO       L__exe_cond431
	BSF        R2, 0
	GOTO       L__exe_cond432
L__exe_cond431:
	BCF        R2, 0
L__exe_cond432:
	BTFSS      R2, 0
	GOTO       L_exe_cond73
;APP_OPSM.c,106 :: 		while(COND13){guc_buzz_state = 1; RELAY_SOL = 1;}
L_exe_cond74:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond433
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond433
	BSF        R2, 0
	GOTO       L__exe_cond434
L__exe_cond433:
	BCF        R2, 0
L__exe_cond434:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond435
	BSF        3, 0
	GOTO       L__exe_cond436
L__exe_cond435:
	BCF        3, 0
L__exe_cond436:
	BTFSS      R2, 0
	GOTO       L__exe_cond437
	BTFSS      3, 0
	GOTO       L__exe_cond437
	BSF        R2, 0
	GOTO       L__exe_cond438
L__exe_cond437:
	BCF        R2, 0
L__exe_cond438:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond439
	BSF        3, 0
	GOTO       L__exe_cond440
L__exe_cond439:
	BCF        3, 0
L__exe_cond440:
	BTFSS      R2, 0
	GOTO       L__exe_cond441
	BTFSS      3, 0
	GOTO       L__exe_cond441
	BSF        R2, 0
	GOTO       L__exe_cond442
L__exe_cond441:
	BCF        R2, 0
L__exe_cond442:
	BTFSS      R2, 0
	GOTO       L_exe_cond75
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	BSF        PORTC+0, 5
	GOTO       L_exe_cond74
L_exe_cond75:
;APP_OPSM.c,107 :: 		}
L_exe_cond73:
;APP_OPSM.c,108 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,110 :: 		case 14: guc_buzz_state = 0; guc_sec = 0; while(guc_sec<5 & COND14);
L_exe_cond76:
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond77:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond443
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond443:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond444
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond444
	BSF        R2, 0
	GOTO       L__exe_cond445
L__exe_cond444:
	BCF        R2, 0
L__exe_cond445:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond446
	BSF        3, 0
	GOTO       L__exe_cond447
L__exe_cond446:
	BCF        3, 0
L__exe_cond447:
	BTFSS      R2, 0
	GOTO       L__exe_cond448
	BTFSS      3, 0
	GOTO       L__exe_cond448
	BSF        R2, 0
	GOTO       L__exe_cond449
L__exe_cond448:
	BCF        R2, 0
L__exe_cond449:
	BTFSS      R2, 0
	GOTO       L__exe_cond450
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond450
	BSF        3, 0
	GOTO       L__exe_cond451
L__exe_cond450:
	BCF        3, 0
L__exe_cond451:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond78
	GOTO       L_exe_cond77
L_exe_cond78:
;APP_OPSM.c,111 :: 		if(COND14)
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond452
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond452
	BSF        R2, 0
	GOTO       L__exe_cond453
L__exe_cond452:
	BCF        R2, 0
L__exe_cond453:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond454
	BSF        3, 0
	GOTO       L__exe_cond455
L__exe_cond454:
	BCF        3, 0
L__exe_cond455:
	BTFSS      R2, 0
	GOTO       L__exe_cond456
	BTFSS      3, 0
	GOTO       L__exe_cond456
	BSF        R2, 0
	GOTO       L__exe_cond457
L__exe_cond456:
	BCF        R2, 0
L__exe_cond457:
	BTFSS      R2, 0
	GOTO       L__exe_cond458
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond458
	BSF        3, 0
	GOTO       L__exe_cond459
L__exe_cond458:
	BCF        3, 0
L__exe_cond459:
	BTFSS      3, 0
	GOTO       L_exe_cond79
;APP_OPSM.c,113 :: 		while(COND14){RELAY_SOL = 1;}
L_exe_cond80:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond460
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond460
	BSF        R2, 0
	GOTO       L__exe_cond461
L__exe_cond460:
	BCF        R2, 0
L__exe_cond461:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond462
	BSF        3, 0
	GOTO       L__exe_cond463
L__exe_cond462:
	BCF        3, 0
L__exe_cond463:
	BTFSS      R2, 0
	GOTO       L__exe_cond464
	BTFSS      3, 0
	GOTO       L__exe_cond464
	BSF        R2, 0
	GOTO       L__exe_cond465
L__exe_cond464:
	BCF        R2, 0
L__exe_cond465:
	BTFSS      R2, 0
	GOTO       L__exe_cond466
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond466
	BSF        3, 0
	GOTO       L__exe_cond467
L__exe_cond466:
	BCF        3, 0
L__exe_cond467:
	BTFSS      3, 0
	GOTO       L_exe_cond81
	BSF        PORTC+0, 5
	GOTO       L_exe_cond80
L_exe_cond81:
;APP_OPSM.c,114 :: 		}
L_exe_cond79:
;APP_OPSM.c,115 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,117 :: 		case 15: guc_buzz_state = 0; guc_sec = 0; while(guc_sec<5 & COND15);
L_exe_cond82:
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond83:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond468
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond468:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond469
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond469
	BSF        3, 0
	GOTO       L__exe_cond470
L__exe_cond469:
	BCF        3, 0
L__exe_cond470:
	BTFSS      3, 0
	GOTO       L__exe_cond471
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond471
	BSF        R2, 0
	GOTO       L__exe_cond472
L__exe_cond471:
	BCF        R2, 0
L__exe_cond472:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond473
	BSF        3, 0
	GOTO       L__exe_cond474
L__exe_cond473:
	BCF        3, 0
L__exe_cond474:
	BTFSS      R2, 0
	GOTO       L__exe_cond475
	BTFSS      3, 0
	GOTO       L__exe_cond475
	BSF        R2, 0
	GOTO       L__exe_cond476
L__exe_cond475:
	BCF        R2, 0
L__exe_cond476:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond84
	GOTO       L_exe_cond83
L_exe_cond84:
;APP_OPSM.c,118 :: 		if(COND15)
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond477
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond477
	BSF        3, 0
	GOTO       L__exe_cond478
L__exe_cond477:
	BCF        3, 0
L__exe_cond478:
	BTFSS      3, 0
	GOTO       L__exe_cond479
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond479
	BSF        R2, 0
	GOTO       L__exe_cond480
L__exe_cond479:
	BCF        R2, 0
L__exe_cond480:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond481
	BSF        3, 0
	GOTO       L__exe_cond482
L__exe_cond481:
	BCF        3, 0
L__exe_cond482:
	BTFSS      R2, 0
	GOTO       L__exe_cond483
	BTFSS      3, 0
	GOTO       L__exe_cond483
	BSF        R2, 0
	GOTO       L__exe_cond484
L__exe_cond483:
	BCF        R2, 0
L__exe_cond484:
	BTFSS      R2, 0
	GOTO       L_exe_cond85
;APP_OPSM.c,120 :: 		while(COND15){RELAY_SOL = 1;}
L_exe_cond86:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond485
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond485
	BSF        3, 0
	GOTO       L__exe_cond486
L__exe_cond485:
	BCF        3, 0
L__exe_cond486:
	BTFSS      3, 0
	GOTO       L__exe_cond487
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond487
	BSF        R2, 0
	GOTO       L__exe_cond488
L__exe_cond487:
	BCF        R2, 0
L__exe_cond488:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond489
	BSF        3, 0
	GOTO       L__exe_cond490
L__exe_cond489:
	BCF        3, 0
L__exe_cond490:
	BTFSS      R2, 0
	GOTO       L__exe_cond491
	BTFSS      3, 0
	GOTO       L__exe_cond491
	BSF        R2, 0
	GOTO       L__exe_cond492
L__exe_cond491:
	BCF        R2, 0
L__exe_cond492:
	BTFSS      R2, 0
	GOTO       L_exe_cond87
	BSF        PORTC+0, 5
	GOTO       L_exe_cond86
L_exe_cond87:
;APP_OPSM.c,121 :: 		}
L_exe_cond85:
;APP_OPSM.c,122 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,124 :: 		case 16: guc_buzz_state=0; guc_sec=0; while(guc_sec<5 & COND16);
L_exe_cond88:
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
L_exe_cond89:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond493
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond493:
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R1
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond494
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond494
	BSF        3, 0
	GOTO       L__exe_cond495
L__exe_cond494:
	BCF        3, 0
L__exe_cond495:
	BTFSS      3, 0
	GOTO       L__exe_cond496
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond496
	BSF        R2, 0
	GOTO       L__exe_cond497
L__exe_cond496:
	BCF        R2, 0
L__exe_cond497:
	BTFSS      R2, 0
	GOTO       L__exe_cond498
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond498
	BSF        3, 0
	GOTO       L__exe_cond499
L__exe_cond498:
	BCF        3, 0
L__exe_cond499:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond90
	GOTO       L_exe_cond89
L_exe_cond90:
;APP_OPSM.c,125 :: 		if(COND16)
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond500
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond500
	BSF        3, 0
	GOTO       L__exe_cond501
L__exe_cond500:
	BCF        3, 0
L__exe_cond501:
	BTFSS      3, 0
	GOTO       L__exe_cond502
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond502
	BSF        R2, 0
	GOTO       L__exe_cond503
L__exe_cond502:
	BCF        R2, 0
L__exe_cond503:
	BTFSS      R2, 0
	GOTO       L__exe_cond504
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond504
	BSF        3, 0
	GOTO       L__exe_cond505
L__exe_cond504:
	BCF        3, 0
L__exe_cond505:
	BTFSS      3, 0
	GOTO       L_exe_cond91
;APP_OPSM.c,127 :: 		while(COND16){RELAY_SOL = 1;}
L_exe_cond92:
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond506
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond506
	BSF        3, 0
	GOTO       L__exe_cond507
L__exe_cond506:
	BCF        3, 0
L__exe_cond507:
	BTFSS      3, 0
	GOTO       L__exe_cond508
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond508
	BSF        R2, 0
	GOTO       L__exe_cond509
L__exe_cond508:
	BCF        R2, 0
L__exe_cond509:
	BTFSS      R2, 0
	GOTO       L__exe_cond510
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond510
	BSF        3, 0
	GOTO       L__exe_cond511
L__exe_cond510:
	BCF        3, 0
L__exe_cond511:
	BTFSS      3, 0
	GOTO       L_exe_cond93
	BSF        PORTC+0, 5
	GOTO       L_exe_cond92
L_exe_cond93:
;APP_OPSM.c,128 :: 		}
L_exe_cond91:
;APP_OPSM.c,129 :: 		reset_all(); break;
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,131 :: 		default: reset_all(); break;
L_exe_cond94:
	CALL       _reset_all+0
	GOTO       L_exe_cond42
;APP_OPSM.c,132 :: 		}
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
	GOTO       L_exe_cond76
	MOVF       _guc_choice+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond82
	MOVF       _guc_choice+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond88
	GOTO       L_exe_cond94
L_exe_cond42:
;APP_OPSM.c,133 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,136 :: 		void sys_init()
;APP_OPSM.c,139 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,141 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,142 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,143 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,144 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,146 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,147 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,148 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,149 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,151 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,152 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,155 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,156 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,167 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,172 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP_OPSM.c,189 :: 		void main()
;APP_OPSM.c,191 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,192 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;APP_OPSM.c,194 :: 		while(1)
L_main95:
;APP_OPSM.c,196 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,197 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main97
;APP_OPSM.c,202 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,203 :: 		}
L_main97:
;APP_OPSM.c,204 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,212 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,213 :: 		}
	GOTO       L_main95
;APP_OPSM.c,214 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
