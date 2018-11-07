
_interrupt:

;Tractor.c,29 :: 		void interrupt()
;Tractor.c,31 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)  /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt109:
;Tractor.c,33 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;Tractor.c,34 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;Tractor.c,37 :: 		}
L_interrupt3:
;Tractor.c,38 :: 		}
L_end_interrupt:
L__interrupt122:
	RETFIE     %s
; end of _interrupt

_check_cond:

;Tractor.c,40 :: 		void check_cond()
;Tractor.c,42 :: 		if(COND1)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond124
	BSF        R2, 0
	GOTO       L__check_cond125
L__check_cond124:
	BCF        R2, 0
L__check_cond125:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond126
	BSF        3, 0
	GOTO       L__check_cond127
L__check_cond126:
	BCF        3, 0
L__check_cond127:
	BTFSS      R2, 0
	GOTO       L__check_cond128
	BTFSS      3, 0
	GOTO       L__check_cond128
	BSF        R2, 0
	GOTO       L__check_cond129
L__check_cond128:
	BCF        R2, 0
L__check_cond129:
	BTFSS      R2, 0
	GOTO       L__check_cond130
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond130
	BSF        3, 0
	GOTO       L__check_cond131
L__check_cond130:
	BCF        3, 0
L__check_cond131:
	BTFSS      3, 0
	GOTO       L__check_cond132
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond132
	BSF        R2, 0
	GOTO       L__check_cond133
L__check_cond132:
	BCF        R2, 0
L__check_cond133:
	BTFSS      R2, 0
	GOTO       L_check_cond4
;Tractor.c,44 :: 		if(guc_cycle[0]<NO_CYCLE_1)
	MOVLW      3
	SUBWF      _guc_cycle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond134
	MOVLW      232
	SUBWF      _guc_cycle+0, 0
L__check_cond134:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond5
;Tractor.c,46 :: 		guc_choice=1; guc_cycle[0]++;guc_cycle[1]=0; guc_cycle[2]=0;
	MOVLW      1
	MOVWF      _guc_choice+0
	MOVLW      1
	ADDWF      _guc_cycle+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _guc_cycle+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _guc_cycle+0
	MOVF       R1, 0
	MOVWF      _guc_cycle+1
	CLRF       _guc_cycle+2
	CLRF       _guc_cycle+3
	CLRF       _guc_cycle+4
	CLRF       _guc_cycle+5
;Tractor.c,47 :: 		guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]=0;
	CLRF       _guc_cycle+6
	CLRF       _guc_cycle+7
	CLRF       _guc_cycle+8
	CLRF       _guc_cycle+9
	CLRF       _guc_cycle+10
	CLRF       _guc_cycle+11
;Tractor.c,48 :: 		}
L_check_cond5:
;Tractor.c,49 :: 		}
	GOTO       L_check_cond6
L_check_cond4:
;Tractor.c,50 :: 		else if(COND2)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond135
	BSF        R2, 0
	GOTO       L__check_cond136
L__check_cond135:
	BCF        R2, 0
L__check_cond136:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond137
	BSF        3, 0
	GOTO       L__check_cond138
L__check_cond137:
	BCF        3, 0
L__check_cond138:
	BTFSS      R2, 0
	GOTO       L__check_cond139
	BTFSS      3, 0
	GOTO       L__check_cond139
	BSF        R2, 0
	GOTO       L__check_cond140
L__check_cond139:
	BCF        R2, 0
L__check_cond140:
	BTFSS      R2, 0
	GOTO       L__check_cond141
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond141
	BSF        R2, 0
	GOTO       L__check_cond142
L__check_cond141:
	BCF        R2, 0
L__check_cond142:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond143
	BSF        3, 0
	GOTO       L__check_cond144
L__check_cond143:
	BCF        3, 0
L__check_cond144:
	BTFSS      R2, 0
	GOTO       L__check_cond145
	BTFSS      3, 0
	GOTO       L__check_cond145
	BSF        R2, 0
	GOTO       L__check_cond146
L__check_cond145:
	BCF        R2, 0
L__check_cond146:
	BTFSS      R2, 0
	GOTO       L_check_cond7
;Tractor.c,52 :: 		if(guc_cycle[1]<NO_CYCLE_2)
	MOVLW      3
	SUBWF      _guc_cycle+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond147
	MOVLW      232
	SUBWF      _guc_cycle+2, 0
L__check_cond147:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond8
;Tractor.c,54 :: 		guc_choice=2; guc_cycle[0]=0;guc_cycle[1]++; guc_cycle[2]=0;
	MOVLW      2
	MOVWF      _guc_choice+0
	CLRF       _guc_cycle+0
	CLRF       _guc_cycle+1
	MOVLW      1
	ADDWF      _guc_cycle+2, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _guc_cycle+3, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _guc_cycle+2
	MOVF       R1, 0
	MOVWF      _guc_cycle+3
	CLRF       _guc_cycle+4
	CLRF       _guc_cycle+5
;Tractor.c,55 :: 		guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]=0;
	CLRF       _guc_cycle+6
	CLRF       _guc_cycle+7
	CLRF       _guc_cycle+8
	CLRF       _guc_cycle+9
	CLRF       _guc_cycle+10
	CLRF       _guc_cycle+11
;Tractor.c,56 :: 		}
L_check_cond8:
;Tractor.c,57 :: 		}
	GOTO       L_check_cond9
L_check_cond7:
;Tractor.c,58 :: 		else if(COND3)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond148
	BSF        3, 0
	GOTO       L__check_cond149
L__check_cond148:
	BCF        3, 0
L__check_cond149:
	BTFSS      3, 0
	GOTO       L__check_cond150
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond150
	BSF        R2, 0
	GOTO       L__check_cond151
L__check_cond150:
	BCF        R2, 0
L__check_cond151:
	BTFSS      R2, 0
	GOTO       L__check_cond152
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond152
	BSF        3, 0
	GOTO       L__check_cond153
L__check_cond152:
	BCF        3, 0
L__check_cond153:
	BTFSS      3, 0
	GOTO       L__check_cond154
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond154
	BSF        R2, 0
	GOTO       L__check_cond155
L__check_cond154:
	BCF        R2, 0
L__check_cond155:
	BTFSS      R2, 0
	GOTO       L_check_cond10
;Tractor.c,60 :: 		if(guc_cycle[2]<NO_CYCLE_3)
	MOVLW      3
	SUBWF      _guc_cycle+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond156
	MOVLW      232
	SUBWF      _guc_cycle+4, 0
L__check_cond156:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond11
;Tractor.c,62 :: 		guc_choice=3; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]++;
	MOVLW      3
	MOVWF      _guc_choice+0
	CLRF       _guc_cycle+0
	CLRF       _guc_cycle+1
	CLRF       _guc_cycle+2
	CLRF       _guc_cycle+3
	MOVLW      1
	ADDWF      _guc_cycle+4, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _guc_cycle+5, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _guc_cycle+4
	MOVF       R1, 0
	MOVWF      _guc_cycle+5
;Tractor.c,63 :: 		guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]=0;
	CLRF       _guc_cycle+6
	CLRF       _guc_cycle+7
	CLRF       _guc_cycle+8
	CLRF       _guc_cycle+9
	CLRF       _guc_cycle+10
	CLRF       _guc_cycle+11
;Tractor.c,64 :: 		}
L_check_cond11:
;Tractor.c,65 :: 		}
	GOTO       L_check_cond12
L_check_cond10:
;Tractor.c,66 :: 		else if(COND4)
	BTFSC      PORTC+0, 3
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
	BSF        R2, 0
	GOTO       L__check_cond160
L__check_cond159:
	BCF        R2, 0
L__check_cond160:
	BTFSS      R2, 0
	GOTO       L__check_cond161
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond161
	BSF        R2, 0
	GOTO       L__check_cond162
L__check_cond161:
	BCF        R2, 0
L__check_cond162:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond163
	BSF        3, 0
	GOTO       L__check_cond164
L__check_cond163:
	BCF        3, 0
L__check_cond164:
	BTFSS      R2, 0
	GOTO       L__check_cond165
	BTFSS      3, 0
	GOTO       L__check_cond165
	BSF        R2, 0
	GOTO       L__check_cond166
L__check_cond165:
	BCF        R2, 0
L__check_cond166:
	BTFSS      R2, 0
	GOTO       L_check_cond13
;Tractor.c,68 :: 		if(guc_cycle[3]<NO_CYCLE_4)
	MOVLW      3
	SUBWF      _guc_cycle+7, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond167
	MOVLW      232
	SUBWF      _guc_cycle+6, 0
L__check_cond167:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond14
;Tractor.c,70 :: 		guc_choice=4; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]=0;
	MOVLW      4
	MOVWF      _guc_choice+0
	CLRF       _guc_cycle+0
	CLRF       _guc_cycle+1
	CLRF       _guc_cycle+2
	CLRF       _guc_cycle+3
	CLRF       _guc_cycle+4
	CLRF       _guc_cycle+5
;Tractor.c,71 :: 		guc_cycle[3]++; guc_cycle[4]=0; guc_cycle[5]=0;
	MOVLW      1
	ADDWF      _guc_cycle+6, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _guc_cycle+7, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _guc_cycle+6
	MOVF       R1, 0
	MOVWF      _guc_cycle+7
	CLRF       _guc_cycle+8
	CLRF       _guc_cycle+9
	CLRF       _guc_cycle+10
	CLRF       _guc_cycle+11
;Tractor.c,72 :: 		}
L_check_cond14:
;Tractor.c,73 :: 		}
	GOTO       L_check_cond15
L_check_cond13:
;Tractor.c,74 :: 		else if(COND5)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond168
	BSF        3, 0
	GOTO       L__check_cond169
L__check_cond168:
	BCF        3, 0
L__check_cond169:
	BTFSS      3, 0
	GOTO       L__check_cond170
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond170
	BSF        R2, 0
	GOTO       L__check_cond171
L__check_cond170:
	BCF        R2, 0
L__check_cond171:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond172
	BSF        3, 0
	GOTO       L__check_cond173
L__check_cond172:
	BCF        3, 0
L__check_cond173:
	BTFSS      R2, 0
	GOTO       L__check_cond174
	BTFSS      3, 0
	GOTO       L__check_cond174
	BSF        R2, 0
	GOTO       L__check_cond175
L__check_cond174:
	BCF        R2, 0
L__check_cond175:
	BTFSS      R2, 0
	GOTO       L__check_cond176
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond176
	BSF        3, 0
	GOTO       L__check_cond177
L__check_cond176:
	BCF        3, 0
L__check_cond177:
	BTFSS      3, 0
	GOTO       L_check_cond16
;Tractor.c,76 :: 		if(guc_cycle[4]<NO_CYCLE_5)
	MOVLW      3
	SUBWF      _guc_cycle+9, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond178
	MOVLW      232
	SUBWF      _guc_cycle+8, 0
L__check_cond178:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond17
;Tractor.c,78 :: 		guc_choice=5; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]=0;
	MOVLW      5
	MOVWF      _guc_choice+0
	CLRF       _guc_cycle+0
	CLRF       _guc_cycle+1
	CLRF       _guc_cycle+2
	CLRF       _guc_cycle+3
	CLRF       _guc_cycle+4
	CLRF       _guc_cycle+5
;Tractor.c,79 :: 		guc_cycle[3]=0; guc_cycle[4]++; guc_cycle[5]=0;
	CLRF       _guc_cycle+6
	CLRF       _guc_cycle+7
	MOVLW      1
	ADDWF      _guc_cycle+8, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _guc_cycle+9, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _guc_cycle+8
	MOVF       R1, 0
	MOVWF      _guc_cycle+9
	CLRF       _guc_cycle+10
	CLRF       _guc_cycle+11
;Tractor.c,80 :: 		}
L_check_cond17:
;Tractor.c,81 :: 		}
	GOTO       L_check_cond18
L_check_cond16:
;Tractor.c,82 :: 		else if(COND6)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond179
	BSF        3, 0
	GOTO       L__check_cond180
L__check_cond179:
	BCF        3, 0
L__check_cond180:
	BTFSS      3, 0
	GOTO       L__check_cond181
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond181
	BSF        R2, 0
	GOTO       L__check_cond182
L__check_cond181:
	BCF        R2, 0
L__check_cond182:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond183
	BSF        3, 0
	GOTO       L__check_cond184
L__check_cond183:
	BCF        3, 0
L__check_cond184:
	BTFSS      R2, 0
	GOTO       L__check_cond185
	BTFSS      3, 0
	GOTO       L__check_cond185
	BSF        R2, 0
	GOTO       L__check_cond186
L__check_cond185:
	BCF        R2, 0
L__check_cond186:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond187
	BSF        3, 0
	GOTO       L__check_cond188
L__check_cond187:
	BCF        3, 0
L__check_cond188:
	BTFSS      R2, 0
	GOTO       L__check_cond189
	BTFSS      3, 0
	GOTO       L__check_cond189
	BSF        R2, 0
	GOTO       L__check_cond190
L__check_cond189:
	BCF        R2, 0
L__check_cond190:
	BTFSS      R2, 0
	GOTO       L_check_cond19
;Tractor.c,84 :: 		if(guc_cycle[5]<NO_CYCLE_6)
	MOVLW      3
	SUBWF      _guc_cycle+11, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond191
	MOVLW      232
	SUBWF      _guc_cycle+10, 0
L__check_cond191:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond20
;Tractor.c,86 :: 		guc_choice=6; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]=0;
	MOVLW      6
	MOVWF      _guc_choice+0
	CLRF       _guc_cycle+0
	CLRF       _guc_cycle+1
	CLRF       _guc_cycle+2
	CLRF       _guc_cycle+3
	CLRF       _guc_cycle+4
	CLRF       _guc_cycle+5
;Tractor.c,87 :: 		guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]++;
	CLRF       _guc_cycle+6
	CLRF       _guc_cycle+7
	CLRF       _guc_cycle+8
	CLRF       _guc_cycle+9
	MOVLW      1
	ADDWF      _guc_cycle+10, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _guc_cycle+11, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _guc_cycle+10
	MOVF       R1, 0
	MOVWF      _guc_cycle+11
;Tractor.c,88 :: 		}
L_check_cond20:
;Tractor.c,89 :: 		}
L_check_cond19:
L_check_cond18:
L_check_cond15:
L_check_cond12:
L_check_cond9:
L_check_cond6:
;Tractor.c,90 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;Tractor.c,92 :: 		void exe_cond()
;Tractor.c,94 :: 		guc_sec=0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,95 :: 		switch(guc_choice)
	GOTO       L_exe_cond21
;Tractor.c,97 :: 		case 1: while(guc_sec<2)
L_exe_cond23:
L_exe_cond24:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond193
	MOVLW      2
	SUBWF      _guc_sec+0, 0
L__exe_cond193:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond25
;Tractor.c,99 :: 		if(COND2 || !COND1) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond194
	BSF        R1, 0
	GOTO       L__exe_cond195
L__exe_cond194:
	BCF        R1, 0
L__exe_cond195:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond196
	BSF        3, 0
	GOTO       L__exe_cond197
L__exe_cond196:
	BCF        3, 0
L__exe_cond197:
	BTFSS      R1, 0
	GOTO       L__exe_cond198
	BTFSS      3, 0
	GOTO       L__exe_cond198
	BSF        R1, 0
	GOTO       L__exe_cond199
L__exe_cond198:
	BCF        R1, 0
L__exe_cond199:
	BTFSS      R1, 0
	GOTO       L__exe_cond200
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond200
	BSF        R1, 0
	GOTO       L__exe_cond201
L__exe_cond200:
	BCF        R1, 0
L__exe_cond201:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond202
	BSF        3, 0
	GOTO       L__exe_cond203
L__exe_cond202:
	BCF        3, 0
L__exe_cond203:
	BTFSS      R1, 0
	GOTO       L__exe_cond204
	BTFSS      3, 0
	GOTO       L__exe_cond204
	BSF        R1, 0
	GOTO       L__exe_cond205
L__exe_cond204:
	BCF        R1, 0
L__exe_cond205:
	BTFSC      R1, 0
	GOTO       L__exe_cond120
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond206
	BSF        R1, 0
	GOTO       L__exe_cond207
L__exe_cond206:
	BCF        R1, 0
L__exe_cond207:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond208
	BSF        3, 0
	GOTO       L__exe_cond209
L__exe_cond208:
	BCF        3, 0
L__exe_cond209:
	BTFSS      R1, 0
	GOTO       L__exe_cond210
	BTFSS      3, 0
	GOTO       L__exe_cond210
	BSF        R1, 0
	GOTO       L__exe_cond211
L__exe_cond210:
	BCF        R1, 0
L__exe_cond211:
	BTFSS      R1, 0
	GOTO       L__exe_cond212
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond212
	BSF        3, 0
	GOTO       L__exe_cond213
L__exe_cond212:
	BCF        3, 0
L__exe_cond213:
	BTFSS      3, 0
	GOTO       L__exe_cond214
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond214
	BSF        R1, 0
	GOTO       L__exe_cond215
L__exe_cond214:
	BCF        R1, 0
L__exe_cond215:
	BTFSS      R1, 0
	GOTO       L__exe_cond120
	GOTO       L_exe_cond28
L__exe_cond120:
	GOTO       L_exe_cond25
L_exe_cond28:
;Tractor.c,100 :: 		}
	GOTO       L_exe_cond24
L_exe_cond25:
;Tractor.c,101 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,102 :: 		while(COND1);
L_exe_cond29:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond216
	BSF        R1, 0
	GOTO       L__exe_cond217
L__exe_cond216:
	BCF        R1, 0
L__exe_cond217:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond218
	BSF        3, 0
	GOTO       L__exe_cond219
L__exe_cond218:
	BCF        3, 0
L__exe_cond219:
	BTFSS      R1, 0
	GOTO       L__exe_cond220
	BTFSS      3, 0
	GOTO       L__exe_cond220
	BSF        R1, 0
	GOTO       L__exe_cond221
L__exe_cond220:
	BCF        R1, 0
L__exe_cond221:
	BTFSS      R1, 0
	GOTO       L__exe_cond222
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond222
	BSF        3, 0
	GOTO       L__exe_cond223
L__exe_cond222:
	BCF        3, 0
L__exe_cond223:
	BTFSS      3, 0
	GOTO       L__exe_cond224
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond224
	BSF        R1, 0
	GOTO       L__exe_cond225
L__exe_cond224:
	BCF        R1, 0
L__exe_cond225:
	BTFSS      R1, 0
	GOTO       L_exe_cond30
	GOTO       L_exe_cond29
L_exe_cond30:
;Tractor.c,103 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,104 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,105 :: 		case 2: guc_buzz_state=1;
L_exe_cond31:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,106 :: 		while(COND2);
L_exe_cond32:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond226
	BSF        R1, 0
	GOTO       L__exe_cond227
L__exe_cond226:
	BCF        R1, 0
L__exe_cond227:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond228
	BSF        3, 0
	GOTO       L__exe_cond229
L__exe_cond228:
	BCF        3, 0
L__exe_cond229:
	BTFSS      R1, 0
	GOTO       L__exe_cond230
	BTFSS      3, 0
	GOTO       L__exe_cond230
	BSF        R1, 0
	GOTO       L__exe_cond231
L__exe_cond230:
	BCF        R1, 0
L__exe_cond231:
	BTFSS      R1, 0
	GOTO       L__exe_cond232
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond232
	BSF        R1, 0
	GOTO       L__exe_cond233
L__exe_cond232:
	BCF        R1, 0
L__exe_cond233:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond234
	BSF        3, 0
	GOTO       L__exe_cond235
L__exe_cond234:
	BCF        3, 0
L__exe_cond235:
	BTFSS      R1, 0
	GOTO       L__exe_cond236
	BTFSS      3, 0
	GOTO       L__exe_cond236
	BSF        R1, 0
	GOTO       L__exe_cond237
L__exe_cond236:
	BCF        R1, 0
L__exe_cond237:
	BTFSS      R1, 0
	GOTO       L_exe_cond33
	GOTO       L_exe_cond32
L_exe_cond33:
;Tractor.c,107 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,108 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,109 :: 		case 3: while(guc_sec<3)
L_exe_cond34:
L_exe_cond35:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond238
	MOVLW      3
	SUBWF      _guc_sec+0, 0
L__exe_cond238:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond36
;Tractor.c,111 :: 		if(COND2 || !COND3) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond239
	BSF        R1, 0
	GOTO       L__exe_cond240
L__exe_cond239:
	BCF        R1, 0
L__exe_cond240:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond241
	BSF        3, 0
	GOTO       L__exe_cond242
L__exe_cond241:
	BCF        3, 0
L__exe_cond242:
	BTFSS      R1, 0
	GOTO       L__exe_cond243
	BTFSS      3, 0
	GOTO       L__exe_cond243
	BSF        R1, 0
	GOTO       L__exe_cond244
L__exe_cond243:
	BCF        R1, 0
L__exe_cond244:
	BTFSS      R1, 0
	GOTO       L__exe_cond245
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond245
	BSF        R1, 0
	GOTO       L__exe_cond246
L__exe_cond245:
	BCF        R1, 0
L__exe_cond246:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond247
	BSF        3, 0
	GOTO       L__exe_cond248
L__exe_cond247:
	BCF        3, 0
L__exe_cond248:
	BTFSS      R1, 0
	GOTO       L__exe_cond249
	BTFSS      3, 0
	GOTO       L__exe_cond249
	BSF        R1, 0
	GOTO       L__exe_cond250
L__exe_cond249:
	BCF        R1, 0
L__exe_cond250:
	BTFSC      R1, 0
	GOTO       L__exe_cond119
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond251
	BSF        3, 0
	GOTO       L__exe_cond252
L__exe_cond251:
	BCF        3, 0
L__exe_cond252:
	BTFSS      3, 0
	GOTO       L__exe_cond253
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond253
	BSF        R1, 0
	GOTO       L__exe_cond254
L__exe_cond253:
	BCF        R1, 0
L__exe_cond254:
	BTFSS      R1, 0
	GOTO       L__exe_cond255
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond255
	BSF        3, 0
	GOTO       L__exe_cond256
L__exe_cond255:
	BCF        3, 0
L__exe_cond256:
	BTFSS      3, 0
	GOTO       L__exe_cond257
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond257
	BSF        R1, 0
	GOTO       L__exe_cond258
L__exe_cond257:
	BCF        R1, 0
L__exe_cond258:
	BTFSS      R1, 0
	GOTO       L__exe_cond119
	GOTO       L_exe_cond39
L__exe_cond119:
	GOTO       L_exe_cond36
L_exe_cond39:
;Tractor.c,112 :: 		}
	GOTO       L_exe_cond35
L_exe_cond36:
;Tractor.c,113 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,114 :: 		guc_sec=0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,115 :: 		while(guc_sec<5)
L_exe_cond40:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond259
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond259:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond41
;Tractor.c,117 :: 		if(COND2 || !COND3) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond260
	BSF        R1, 0
	GOTO       L__exe_cond261
L__exe_cond260:
	BCF        R1, 0
L__exe_cond261:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond262
	BSF        3, 0
	GOTO       L__exe_cond263
L__exe_cond262:
	BCF        3, 0
L__exe_cond263:
	BTFSS      R1, 0
	GOTO       L__exe_cond264
	BTFSS      3, 0
	GOTO       L__exe_cond264
	BSF        R1, 0
	GOTO       L__exe_cond265
L__exe_cond264:
	BCF        R1, 0
L__exe_cond265:
	BTFSS      R1, 0
	GOTO       L__exe_cond266
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond266
	BSF        R1, 0
	GOTO       L__exe_cond267
L__exe_cond266:
	BCF        R1, 0
L__exe_cond267:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond268
	BSF        3, 0
	GOTO       L__exe_cond269
L__exe_cond268:
	BCF        3, 0
L__exe_cond269:
	BTFSS      R1, 0
	GOTO       L__exe_cond270
	BTFSS      3, 0
	GOTO       L__exe_cond270
	BSF        R1, 0
	GOTO       L__exe_cond271
L__exe_cond270:
	BCF        R1, 0
L__exe_cond271:
	BTFSC      R1, 0
	GOTO       L__exe_cond118
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond272
	BSF        3, 0
	GOTO       L__exe_cond273
L__exe_cond272:
	BCF        3, 0
L__exe_cond273:
	BTFSS      3, 0
	GOTO       L__exe_cond274
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond274
	BSF        R1, 0
	GOTO       L__exe_cond275
L__exe_cond274:
	BCF        R1, 0
L__exe_cond275:
	BTFSS      R1, 0
	GOTO       L__exe_cond276
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond276
	BSF        3, 0
	GOTO       L__exe_cond277
L__exe_cond276:
	BCF        3, 0
L__exe_cond277:
	BTFSS      3, 0
	GOTO       L__exe_cond278
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond278
	BSF        R1, 0
	GOTO       L__exe_cond279
L__exe_cond278:
	BCF        R1, 0
L__exe_cond279:
	BTFSS      R1, 0
	GOTO       L__exe_cond118
	GOTO       L_exe_cond44
L__exe_cond118:
	GOTO       L_exe_cond41
L_exe_cond44:
;Tractor.c,118 :: 		}
	GOTO       L_exe_cond40
L_exe_cond41:
;Tractor.c,119 :: 		guc_buzz_state=0;guc_sec=0;
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,120 :: 		RELAY = 1;
	BSF        PORTC+0, 4
;Tractor.c,121 :: 		while(guc_sec<5)
L_exe_cond45:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond280
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond280:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond46
;Tractor.c,123 :: 		if(COND2 || !COND3) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond281
	BSF        R1, 0
	GOTO       L__exe_cond282
L__exe_cond281:
	BCF        R1, 0
L__exe_cond282:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond283
	BSF        3, 0
	GOTO       L__exe_cond284
L__exe_cond283:
	BCF        3, 0
L__exe_cond284:
	BTFSS      R1, 0
	GOTO       L__exe_cond285
	BTFSS      3, 0
	GOTO       L__exe_cond285
	BSF        R1, 0
	GOTO       L__exe_cond286
L__exe_cond285:
	BCF        R1, 0
L__exe_cond286:
	BTFSS      R1, 0
	GOTO       L__exe_cond287
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond287
	BSF        R1, 0
	GOTO       L__exe_cond288
L__exe_cond287:
	BCF        R1, 0
L__exe_cond288:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond289
	BSF        3, 0
	GOTO       L__exe_cond290
L__exe_cond289:
	BCF        3, 0
L__exe_cond290:
	BTFSS      R1, 0
	GOTO       L__exe_cond291
	BTFSS      3, 0
	GOTO       L__exe_cond291
	BSF        R1, 0
	GOTO       L__exe_cond292
L__exe_cond291:
	BCF        R1, 0
L__exe_cond292:
	BTFSC      R1, 0
	GOTO       L__exe_cond117
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond293
	BSF        3, 0
	GOTO       L__exe_cond294
L__exe_cond293:
	BCF        3, 0
L__exe_cond294:
	BTFSS      3, 0
	GOTO       L__exe_cond295
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond295
	BSF        R1, 0
	GOTO       L__exe_cond296
L__exe_cond295:
	BCF        R1, 0
L__exe_cond296:
	BTFSS      R1, 0
	GOTO       L__exe_cond297
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond297
	BSF        3, 0
	GOTO       L__exe_cond298
L__exe_cond297:
	BCF        3, 0
L__exe_cond298:
	BTFSS      3, 0
	GOTO       L__exe_cond299
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond299
	BSF        R1, 0
	GOTO       L__exe_cond300
L__exe_cond299:
	BCF        R1, 0
L__exe_cond300:
	BTFSS      R1, 0
	GOTO       L__exe_cond117
	GOTO       L_exe_cond49
L__exe_cond117:
	GOTO       L_exe_cond46
L_exe_cond49:
;Tractor.c,124 :: 		}
	GOTO       L_exe_cond45
L_exe_cond46:
;Tractor.c,125 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;Tractor.c,126 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,127 :: 		case 4: while(guc_sec<3)
L_exe_cond50:
L_exe_cond51:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond301
	MOVLW      3
	SUBWF      _guc_sec+0, 0
L__exe_cond301:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond52
;Tractor.c,129 :: 		if(COND2 || !COND4) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond302
	BSF        R1, 0
	GOTO       L__exe_cond303
L__exe_cond302:
	BCF        R1, 0
L__exe_cond303:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond304
	BSF        3, 0
	GOTO       L__exe_cond305
L__exe_cond304:
	BCF        3, 0
L__exe_cond305:
	BTFSS      R1, 0
	GOTO       L__exe_cond306
	BTFSS      3, 0
	GOTO       L__exe_cond306
	BSF        R1, 0
	GOTO       L__exe_cond307
L__exe_cond306:
	BCF        R1, 0
L__exe_cond307:
	BTFSS      R1, 0
	GOTO       L__exe_cond308
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond308
	BSF        R1, 0
	GOTO       L__exe_cond309
L__exe_cond308:
	BCF        R1, 0
L__exe_cond309:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond310
	BSF        3, 0
	GOTO       L__exe_cond311
L__exe_cond310:
	BCF        3, 0
L__exe_cond311:
	BTFSS      R1, 0
	GOTO       L__exe_cond312
	BTFSS      3, 0
	GOTO       L__exe_cond312
	BSF        R1, 0
	GOTO       L__exe_cond313
L__exe_cond312:
	BCF        R1, 0
L__exe_cond313:
	BTFSC      R1, 0
	GOTO       L__exe_cond116
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond314
	BSF        3, 0
	GOTO       L__exe_cond315
L__exe_cond314:
	BCF        3, 0
L__exe_cond315:
	BTFSS      3, 0
	GOTO       L__exe_cond316
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond316
	BSF        R1, 0
	GOTO       L__exe_cond317
L__exe_cond316:
	BCF        R1, 0
L__exe_cond317:
	BTFSS      R1, 0
	GOTO       L__exe_cond318
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond318
	BSF        R1, 0
	GOTO       L__exe_cond319
L__exe_cond318:
	BCF        R1, 0
L__exe_cond319:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond320
	BSF        3, 0
	GOTO       L__exe_cond321
L__exe_cond320:
	BCF        3, 0
L__exe_cond321:
	BTFSS      R1, 0
	GOTO       L__exe_cond322
	BTFSS      3, 0
	GOTO       L__exe_cond322
	BSF        R1, 0
	GOTO       L__exe_cond323
L__exe_cond322:
	BCF        R1, 0
L__exe_cond323:
	BTFSS      R1, 0
	GOTO       L__exe_cond116
	GOTO       L_exe_cond55
L__exe_cond116:
	GOTO       L_exe_cond52
L_exe_cond55:
;Tractor.c,130 :: 		}
	GOTO       L_exe_cond51
L_exe_cond52:
;Tractor.c,131 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,132 :: 		guc_sec=0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,133 :: 		while(guc_sec<5)
L_exe_cond56:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond324
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond324:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond57
;Tractor.c,135 :: 		if(COND2 || !COND4) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond325
	BSF        R1, 0
	GOTO       L__exe_cond326
L__exe_cond325:
	BCF        R1, 0
L__exe_cond326:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond327
	BSF        3, 0
	GOTO       L__exe_cond328
L__exe_cond327:
	BCF        3, 0
L__exe_cond328:
	BTFSS      R1, 0
	GOTO       L__exe_cond329
	BTFSS      3, 0
	GOTO       L__exe_cond329
	BSF        R1, 0
	GOTO       L__exe_cond330
L__exe_cond329:
	BCF        R1, 0
L__exe_cond330:
	BTFSS      R1, 0
	GOTO       L__exe_cond331
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond331
	BSF        R1, 0
	GOTO       L__exe_cond332
L__exe_cond331:
	BCF        R1, 0
L__exe_cond332:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond333
	BSF        3, 0
	GOTO       L__exe_cond334
L__exe_cond333:
	BCF        3, 0
L__exe_cond334:
	BTFSS      R1, 0
	GOTO       L__exe_cond335
	BTFSS      3, 0
	GOTO       L__exe_cond335
	BSF        R1, 0
	GOTO       L__exe_cond336
L__exe_cond335:
	BCF        R1, 0
L__exe_cond336:
	BTFSC      R1, 0
	GOTO       L__exe_cond115
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond337
	BSF        3, 0
	GOTO       L__exe_cond338
L__exe_cond337:
	BCF        3, 0
L__exe_cond338:
	BTFSS      3, 0
	GOTO       L__exe_cond339
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond339
	BSF        R1, 0
	GOTO       L__exe_cond340
L__exe_cond339:
	BCF        R1, 0
L__exe_cond340:
	BTFSS      R1, 0
	GOTO       L__exe_cond341
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond341
	BSF        R1, 0
	GOTO       L__exe_cond342
L__exe_cond341:
	BCF        R1, 0
L__exe_cond342:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond343
	BSF        3, 0
	GOTO       L__exe_cond344
L__exe_cond343:
	BCF        3, 0
L__exe_cond344:
	BTFSS      R1, 0
	GOTO       L__exe_cond345
	BTFSS      3, 0
	GOTO       L__exe_cond345
	BSF        R1, 0
	GOTO       L__exe_cond346
L__exe_cond345:
	BCF        R1, 0
L__exe_cond346:
	BTFSS      R1, 0
	GOTO       L__exe_cond115
	GOTO       L_exe_cond60
L__exe_cond115:
	GOTO       L_exe_cond57
L_exe_cond60:
;Tractor.c,136 :: 		}
	GOTO       L_exe_cond56
L_exe_cond57:
;Tractor.c,137 :: 		guc_buzz_state=0;guc_sec=0;
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,138 :: 		RELAY = 1;
	BSF        PORTC+0, 4
;Tractor.c,139 :: 		while(guc_sec<5)
L_exe_cond61:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond347
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond347:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond62
;Tractor.c,141 :: 		if(COND2 || !COND4) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond348
	BSF        R1, 0
	GOTO       L__exe_cond349
L__exe_cond348:
	BCF        R1, 0
L__exe_cond349:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond350
	BSF        3, 0
	GOTO       L__exe_cond351
L__exe_cond350:
	BCF        3, 0
L__exe_cond351:
	BTFSS      R1, 0
	GOTO       L__exe_cond352
	BTFSS      3, 0
	GOTO       L__exe_cond352
	BSF        R1, 0
	GOTO       L__exe_cond353
L__exe_cond352:
	BCF        R1, 0
L__exe_cond353:
	BTFSS      R1, 0
	GOTO       L__exe_cond354
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond354
	BSF        R1, 0
	GOTO       L__exe_cond355
L__exe_cond354:
	BCF        R1, 0
L__exe_cond355:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond356
	BSF        3, 0
	GOTO       L__exe_cond357
L__exe_cond356:
	BCF        3, 0
L__exe_cond357:
	BTFSS      R1, 0
	GOTO       L__exe_cond358
	BTFSS      3, 0
	GOTO       L__exe_cond358
	BSF        R1, 0
	GOTO       L__exe_cond359
L__exe_cond358:
	BCF        R1, 0
L__exe_cond359:
	BTFSC      R1, 0
	GOTO       L__exe_cond114
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond360
	BSF        3, 0
	GOTO       L__exe_cond361
L__exe_cond360:
	BCF        3, 0
L__exe_cond361:
	BTFSS      3, 0
	GOTO       L__exe_cond362
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond362
	BSF        R1, 0
	GOTO       L__exe_cond363
L__exe_cond362:
	BCF        R1, 0
L__exe_cond363:
	BTFSS      R1, 0
	GOTO       L__exe_cond364
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond364
	BSF        R1, 0
	GOTO       L__exe_cond365
L__exe_cond364:
	BCF        R1, 0
L__exe_cond365:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond366
	BSF        3, 0
	GOTO       L__exe_cond367
L__exe_cond366:
	BCF        3, 0
L__exe_cond367:
	BTFSS      R1, 0
	GOTO       L__exe_cond368
	BTFSS      3, 0
	GOTO       L__exe_cond368
	BSF        R1, 0
	GOTO       L__exe_cond369
L__exe_cond368:
	BCF        R1, 0
L__exe_cond369:
	BTFSS      R1, 0
	GOTO       L__exe_cond114
	GOTO       L_exe_cond65
L__exe_cond114:
	GOTO       L_exe_cond62
L_exe_cond65:
;Tractor.c,142 :: 		}
	GOTO       L_exe_cond61
L_exe_cond62:
;Tractor.c,143 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;Tractor.c,144 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,145 :: 		case 5: while(guc_sec<3)
L_exe_cond66:
L_exe_cond67:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond370
	MOVLW      3
	SUBWF      _guc_sec+0, 0
L__exe_cond370:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond68
;Tractor.c,147 :: 		if(COND2 || !COND5) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond371
	BSF        R1, 0
	GOTO       L__exe_cond372
L__exe_cond371:
	BCF        R1, 0
L__exe_cond372:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond373
	BSF        3, 0
	GOTO       L__exe_cond374
L__exe_cond373:
	BCF        3, 0
L__exe_cond374:
	BTFSS      R1, 0
	GOTO       L__exe_cond375
	BTFSS      3, 0
	GOTO       L__exe_cond375
	BSF        R1, 0
	GOTO       L__exe_cond376
L__exe_cond375:
	BCF        R1, 0
L__exe_cond376:
	BTFSS      R1, 0
	GOTO       L__exe_cond377
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond377
	BSF        R1, 0
	GOTO       L__exe_cond378
L__exe_cond377:
	BCF        R1, 0
L__exe_cond378:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond379
	BSF        3, 0
	GOTO       L__exe_cond380
L__exe_cond379:
	BCF        3, 0
L__exe_cond380:
	BTFSS      R1, 0
	GOTO       L__exe_cond381
	BTFSS      3, 0
	GOTO       L__exe_cond381
	BSF        R1, 0
	GOTO       L__exe_cond382
L__exe_cond381:
	BCF        R1, 0
L__exe_cond382:
	BTFSC      R1, 0
	GOTO       L__exe_cond113
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond383
	BSF        3, 0
	GOTO       L__exe_cond384
L__exe_cond383:
	BCF        3, 0
L__exe_cond384:
	BTFSS      3, 0
	GOTO       L__exe_cond385
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond385
	BSF        R1, 0
	GOTO       L__exe_cond386
L__exe_cond385:
	BCF        R1, 0
L__exe_cond386:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond387
	BSF        3, 0
	GOTO       L__exe_cond388
L__exe_cond387:
	BCF        3, 0
L__exe_cond388:
	BTFSS      R1, 0
	GOTO       L__exe_cond389
	BTFSS      3, 0
	GOTO       L__exe_cond389
	BSF        R1, 0
	GOTO       L__exe_cond390
L__exe_cond389:
	BCF        R1, 0
L__exe_cond390:
	BTFSS      R1, 0
	GOTO       L__exe_cond391
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond391
	BSF        3, 0
	GOTO       L__exe_cond392
L__exe_cond391:
	BCF        3, 0
L__exe_cond392:
	BTFSS      3, 0
	GOTO       L__exe_cond113
	GOTO       L_exe_cond71
L__exe_cond113:
	GOTO       L_exe_cond68
L_exe_cond71:
;Tractor.c,148 :: 		}
	GOTO       L_exe_cond67
L_exe_cond68:
;Tractor.c,149 :: 		guc_buzz_state=1;guc_sec=0;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,150 :: 		while(guc_sec<7)
L_exe_cond72:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond393
	MOVLW      7
	SUBWF      _guc_sec+0, 0
L__exe_cond393:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond73
;Tractor.c,152 :: 		if(COND2 || !COND5) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond394
	BSF        R1, 0
	GOTO       L__exe_cond395
L__exe_cond394:
	BCF        R1, 0
L__exe_cond395:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond396
	BSF        3, 0
	GOTO       L__exe_cond397
L__exe_cond396:
	BCF        3, 0
L__exe_cond397:
	BTFSS      R1, 0
	GOTO       L__exe_cond398
	BTFSS      3, 0
	GOTO       L__exe_cond398
	BSF        R1, 0
	GOTO       L__exe_cond399
L__exe_cond398:
	BCF        R1, 0
L__exe_cond399:
	BTFSS      R1, 0
	GOTO       L__exe_cond400
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond400
	BSF        R1, 0
	GOTO       L__exe_cond401
L__exe_cond400:
	BCF        R1, 0
L__exe_cond401:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond402
	BSF        3, 0
	GOTO       L__exe_cond403
L__exe_cond402:
	BCF        3, 0
L__exe_cond403:
	BTFSS      R1, 0
	GOTO       L__exe_cond404
	BTFSS      3, 0
	GOTO       L__exe_cond404
	BSF        R1, 0
	GOTO       L__exe_cond405
L__exe_cond404:
	BCF        R1, 0
L__exe_cond405:
	BTFSC      R1, 0
	GOTO       L__exe_cond112
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond406
	BSF        3, 0
	GOTO       L__exe_cond407
L__exe_cond406:
	BCF        3, 0
L__exe_cond407:
	BTFSS      3, 0
	GOTO       L__exe_cond408
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond408
	BSF        R1, 0
	GOTO       L__exe_cond409
L__exe_cond408:
	BCF        R1, 0
L__exe_cond409:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond410
	BSF        3, 0
	GOTO       L__exe_cond411
L__exe_cond410:
	BCF        3, 0
L__exe_cond411:
	BTFSS      R1, 0
	GOTO       L__exe_cond412
	BTFSS      3, 0
	GOTO       L__exe_cond412
	BSF        R1, 0
	GOTO       L__exe_cond413
L__exe_cond412:
	BCF        R1, 0
L__exe_cond413:
	BTFSS      R1, 0
	GOTO       L__exe_cond414
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond414
	BSF        3, 0
	GOTO       L__exe_cond415
L__exe_cond414:
	BCF        3, 0
L__exe_cond415:
	BTFSS      3, 0
	GOTO       L__exe_cond112
	GOTO       L_exe_cond76
L__exe_cond112:
	GOTO       L_exe_cond73
L_exe_cond76:
;Tractor.c,153 :: 		}
	GOTO       L_exe_cond72
L_exe_cond73:
;Tractor.c,154 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,155 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,156 :: 		case 6: while(guc_sec<3)
L_exe_cond77:
L_exe_cond78:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond416
	MOVLW      3
	SUBWF      _guc_sec+0, 0
L__exe_cond416:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond79
;Tractor.c,158 :: 		if(COND2 || !COND6) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond417
	BSF        R1, 0
	GOTO       L__exe_cond418
L__exe_cond417:
	BCF        R1, 0
L__exe_cond418:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond419
	BSF        3, 0
	GOTO       L__exe_cond420
L__exe_cond419:
	BCF        3, 0
L__exe_cond420:
	BTFSS      R1, 0
	GOTO       L__exe_cond421
	BTFSS      3, 0
	GOTO       L__exe_cond421
	BSF        R1, 0
	GOTO       L__exe_cond422
L__exe_cond421:
	BCF        R1, 0
L__exe_cond422:
	BTFSS      R1, 0
	GOTO       L__exe_cond423
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond423
	BSF        R1, 0
	GOTO       L__exe_cond424
L__exe_cond423:
	BCF        R1, 0
L__exe_cond424:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond425
	BSF        3, 0
	GOTO       L__exe_cond426
L__exe_cond425:
	BCF        3, 0
L__exe_cond426:
	BTFSS      R1, 0
	GOTO       L__exe_cond427
	BTFSS      3, 0
	GOTO       L__exe_cond427
	BSF        R1, 0
	GOTO       L__exe_cond428
L__exe_cond427:
	BCF        R1, 0
L__exe_cond428:
	BTFSC      R1, 0
	GOTO       L__exe_cond111
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond429
	BSF        3, 0
	GOTO       L__exe_cond430
L__exe_cond429:
	BCF        3, 0
L__exe_cond430:
	BTFSS      3, 0
	GOTO       L__exe_cond431
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond431
	BSF        R1, 0
	GOTO       L__exe_cond432
L__exe_cond431:
	BCF        R1, 0
L__exe_cond432:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond433
	BSF        3, 0
	GOTO       L__exe_cond434
L__exe_cond433:
	BCF        3, 0
L__exe_cond434:
	BTFSS      R1, 0
	GOTO       L__exe_cond435
	BTFSS      3, 0
	GOTO       L__exe_cond435
	BSF        R1, 0
	GOTO       L__exe_cond436
L__exe_cond435:
	BCF        R1, 0
L__exe_cond436:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond437
	BSF        3, 0
	GOTO       L__exe_cond438
L__exe_cond437:
	BCF        3, 0
L__exe_cond438:
	BTFSS      R1, 0
	GOTO       L__exe_cond439
	BTFSS      3, 0
	GOTO       L__exe_cond439
	BSF        R1, 0
	GOTO       L__exe_cond440
L__exe_cond439:
	BCF        R1, 0
L__exe_cond440:
	BTFSS      R1, 0
	GOTO       L__exe_cond111
	GOTO       L_exe_cond82
L__exe_cond111:
	GOTO       L_exe_cond79
L_exe_cond82:
;Tractor.c,159 :: 		}
	GOTO       L_exe_cond78
L_exe_cond79:
;Tractor.c,160 :: 		guc_buzz_state=1;guc_sec=0;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,161 :: 		while(guc_sec<7)
L_exe_cond83:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond441
	MOVLW      7
	SUBWF      _guc_sec+0, 0
L__exe_cond441:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond84
;Tractor.c,163 :: 		if(COND2 || !COND6) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond442
	BSF        R1, 0
	GOTO       L__exe_cond443
L__exe_cond442:
	BCF        R1, 0
L__exe_cond443:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond444
	BSF        3, 0
	GOTO       L__exe_cond445
L__exe_cond444:
	BCF        3, 0
L__exe_cond445:
	BTFSS      R1, 0
	GOTO       L__exe_cond446
	BTFSS      3, 0
	GOTO       L__exe_cond446
	BSF        R1, 0
	GOTO       L__exe_cond447
L__exe_cond446:
	BCF        R1, 0
L__exe_cond447:
	BTFSS      R1, 0
	GOTO       L__exe_cond448
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond448
	BSF        R1, 0
	GOTO       L__exe_cond449
L__exe_cond448:
	BCF        R1, 0
L__exe_cond449:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond450
	BSF        3, 0
	GOTO       L__exe_cond451
L__exe_cond450:
	BCF        3, 0
L__exe_cond451:
	BTFSS      R1, 0
	GOTO       L__exe_cond452
	BTFSS      3, 0
	GOTO       L__exe_cond452
	BSF        R1, 0
	GOTO       L__exe_cond453
L__exe_cond452:
	BCF        R1, 0
L__exe_cond453:
	BTFSC      R1, 0
	GOTO       L__exe_cond110
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond454
	BSF        3, 0
	GOTO       L__exe_cond455
L__exe_cond454:
	BCF        3, 0
L__exe_cond455:
	BTFSS      3, 0
	GOTO       L__exe_cond456
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond456
	BSF        R1, 0
	GOTO       L__exe_cond457
L__exe_cond456:
	BCF        R1, 0
L__exe_cond457:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond458
	BSF        3, 0
	GOTO       L__exe_cond459
L__exe_cond458:
	BCF        3, 0
L__exe_cond459:
	BTFSS      R1, 0
	GOTO       L__exe_cond460
	BTFSS      3, 0
	GOTO       L__exe_cond460
	BSF        R1, 0
	GOTO       L__exe_cond461
L__exe_cond460:
	BCF        R1, 0
L__exe_cond461:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond462
	BSF        3, 0
	GOTO       L__exe_cond463
L__exe_cond462:
	BCF        3, 0
L__exe_cond463:
	BTFSS      R1, 0
	GOTO       L__exe_cond464
	BTFSS      3, 0
	GOTO       L__exe_cond464
	BSF        R1, 0
	GOTO       L__exe_cond465
L__exe_cond464:
	BCF        R1, 0
L__exe_cond465:
	BTFSS      R1, 0
	GOTO       L__exe_cond110
	GOTO       L_exe_cond87
L__exe_cond110:
	GOTO       L_exe_cond84
L_exe_cond87:
;Tractor.c,164 :: 		}
	GOTO       L_exe_cond83
L_exe_cond84:
;Tractor.c,165 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,166 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,168 :: 		default: guc_choice=0;
L_exe_cond88:
	CLRF       _guc_choice+0
;Tractor.c,169 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,170 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,171 :: 		}
L_exe_cond21:
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond23
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond31
	MOVF       _guc_choice+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond34
	MOVF       _guc_choice+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond50
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond66
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond77
	GOTO       L_exe_cond88
L_exe_cond22:
;Tractor.c,172 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_Check_Demo:

;Tractor.c,174 :: 		void Check_Demo()
;Tractor.c,178 :: 		WDTCON = 0x16;   /*WDTPS 1:65536; SWDTEN OFF; */
	MOVLW      22
	MOVWF      WDTCON+0
;Tractor.c,179 :: 		if(PORTC.RC5==0)
	BTFSC      PORTC+0, 5
	GOTO       L_Check_Demo89
;Tractor.c,181 :: 		DATAEE_WriteByte(DEMO_ADDR,0xFF);
	MOVLW      64
	MOVWF      FARG_DATAEE_WriteByte_bAdd+0
	MOVLW      255
	MOVWF      FARG_DATAEE_WriteByte_bData+0
	CALL       _DATAEE_WriteByte+0
;Tractor.c,182 :: 		DATAEE_WriteByte(DEMO_ADDR+1,0xFF);
	MOVLW      65
	MOVWF      FARG_DATAEE_WriteByte_bAdd+0
	MOVLW      255
	MOVWF      FARG_DATAEE_WriteByte_bData+0
	CALL       _DATAEE_WriteByte+0
;Tractor.c,183 :: 		while(1);
L_Check_Demo90:
	GOTO       L_Check_Demo90
;Tractor.c,184 :: 		}
L_Check_Demo89:
;Tractor.c,185 :: 		udemo=DATAEE_ReadByte(DEMO_ADDR);
	MOVLW      64
	MOVWF      FARG_DATAEE_ReadByte_bAdd+0
	CALL       _DATAEE_ReadByte+0
	MOVF       R0, 0
	MOVWF      Check_Demo_udemo_L0+0
;Tractor.c,186 :: 		ldemo=DATAEE_ReadByte(DEMO_ADDR+1);
	MOVLW      65
	MOVWF      FARG_DATAEE_ReadByte_bAdd+0
	CALL       _DATAEE_ReadByte+0
	MOVF       R0, 0
	MOVWF      Check_Demo_ldemo_L0+0
;Tractor.c,187 :: 		Demo=(((udemo<<8)&0xFF00)|ldemo);
	MOVF       Check_Demo_udemo_L0+0, 0
	MOVWF      R2
	CLRF       R1
	MOVLW      0
	ANDWF      R1, 1
	MOVLW      255
	ANDWF      R2, 1
	MOVF       R0, 0
	IORWF       R1, 1
	MOVLW      0
	IORWF       R2, 1
	MOVF       R1, 0
	MOVWF      _Demo+0
	MOVF       R2, 0
	MOVWF      _Demo+1
;Tractor.c,189 :: 		if(Demo==0xFFFF)
	MOVF       R2, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Demo467
	MOVLW      255
	XORWF      R1, 0
L__Check_Demo467:
	BTFSS      STATUS+0, 2
	GOTO       L_Check_Demo92
;Tractor.c,191 :: 		Demo=0;
	CLRF       _Demo+0
	CLRF       _Demo+1
;Tractor.c,192 :: 		}
L_Check_Demo92:
;Tractor.c,193 :: 		if(Demo>800) { while(1); }
	MOVF       _Demo+1, 0
	SUBLW      3
	BTFSS      STATUS+0, 2
	GOTO       L__Check_Demo468
	MOVF       _Demo+0, 0
	SUBLW      32
L__Check_Demo468:
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Demo93
L_Check_Demo94:
	GOTO       L_Check_Demo94
L_Check_Demo93:
;Tractor.c,196 :: 		Demo++;
	INCF       _Demo+0, 1
	BTFSC      STATUS+0, 2
	INCF       _Demo+1, 1
;Tractor.c,197 :: 		ldemo = (uint8)(Demo & 0x00FF);
	MOVLW      255
	ANDWF      _Demo+0, 0
	MOVWF      Check_Demo_ldemo_L0+0
;Tractor.c,198 :: 		udemo = (uint8)(((Demo>>8)&0x00FF));
	MOVF       _Demo+1, 0
	MOVWF      R0
	CLRF       R1
	MOVLW      255
	ANDWF      R0, 1
	MOVF       R0, 0
	MOVWF      Check_Demo_udemo_L0+0
;Tractor.c,200 :: 		DATAEE_WriteByte(DEMO_ADDR,udemo);
	MOVLW      64
	MOVWF      FARG_DATAEE_WriteByte_bAdd+0
	MOVF       R0, 0
	MOVWF      FARG_DATAEE_WriteByte_bData+0
	CALL       _DATAEE_WriteByte+0
;Tractor.c,201 :: 		DATAEE_WriteByte((DEMO_ADDR+1),ldemo);
	MOVLW      65
	MOVWF      FARG_DATAEE_WriteByte_bAdd+0
	MOVF       Check_Demo_ldemo_L0+0, 0
	MOVWF      FARG_DATAEE_WriteByte_bData+0
	CALL       _DATAEE_WriteByte+0
;Tractor.c,203 :: 		}
L_end_Check_Demo:
	RETURN
; end of _Check_Demo

_my_delay:

;Tractor.c,205 :: 		void my_delay()
;Tractor.c,208 :: 		for(i=0;i<1;i++)
	CLRF       R1+0
	CLRF       R1+1
L_my_delay97:
	MOVLW      0
	SUBWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay470
	MOVLW      1
	SUBWF      R1+0, 0
L__my_delay470:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay98
;Tractor.c,209 :: 		for(j=0;j<400;j++)
	CLRF       R3+0
	CLRF       R3+1
L_my_delay100:
	MOVLW      1
	SUBWF      R3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay471
	MOVLW      144
	SUBWF      R3+0, 0
L__my_delay471:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay101
;Tractor.c,210 :: 		asm CLRWDT ;
	CLRWDT
;Tractor.c,209 :: 		for(j=0;j<400;j++)
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;Tractor.c,210 :: 		asm CLRWDT ;
	GOTO       L_my_delay100
L_my_delay101:
;Tractor.c,208 :: 		for(i=0;i<1;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;Tractor.c,210 :: 		asm CLRWDT ;
	GOTO       L_my_delay97
L_my_delay98:
;Tractor.c,211 :: 		}
L_end_my_delay:
	RETURN
; end of _my_delay

_sys_init:

;Tractor.c,214 :: 		void sys_init()
;Tractor.c,217 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;Tractor.c,218 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;Tractor.c,219 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;Tractor.c,220 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Tractor.c,221 :: 		TRISC=0x2F;
	MOVLW      47
	MOVWF      TRISC+0
;Tractor.c,222 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;Tractor.c,223 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;Tractor.c,224 :: 		my_delay();
	CALL       _my_delay+0
;Tractor.c,225 :: 		Check_Demo();
	CALL       _Check_Demo+0
;Tractor.c,226 :: 		WDTCON = 0x17;                    /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;Tractor.c,227 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;Tractor.c,229 :: 		TMR2_Initialize();
	CALL       _TMR2_Initialize+0
;Tractor.c,230 :: 		PWM3_Initialize();
	CALL       _PWM3_Initialize+0
;Tractor.c,232 :: 		for(i=0;i<6;i++) guc_cycle[i]=0;
	CLRF       sys_init_i_L0+0
L_sys_init103:
	MOVLW      6
	SUBWF      sys_init_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sys_init104
	MOVF       sys_init_i_L0+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	MOVLW      _guc_cycle+0
	ADDWF      R0, 0
	MOVWF      FSR1L
	MOVLW      hi_addr(_guc_cycle+0)
	ADDWFC     R1, 0
	MOVWF      FSR1H
	CLRF       INDF1+0
	ADDFSR     1, 1
	CLRF       INDF1+0
	INCF       sys_init_i_L0+0, 1
	GOTO       L_sys_init103
L_sys_init104:
;Tractor.c,233 :: 		GIE_bit = 1;                     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Tractor.c,234 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;Tractor.c,236 :: 		void main()
;Tractor.c,238 :: 		sys_init();
	CALL       _sys_init+0
;Tractor.c,239 :: 		while(1)
L_main106:
;Tractor.c,241 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;Tractor.c,242 :: 		if(guc_choice>0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main108
;Tractor.c,243 :: 		exe_cond();                  /*Execute the condtion*/
	CALL       _exe_cond+0
L_main108:
;Tractor.c,244 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;Tractor.c,245 :: 		}
	GOTO       L_main106
;Tractor.c,246 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
