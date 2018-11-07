
_interrupt:

;Tractor.c,29 :: 		void interrupt()
;Tractor.c,31 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt104:
;Tractor.c,33 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;Tractor.c,34 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;Tractor.c,37 :: 		}
L_interrupt3:
;Tractor.c,38 :: 		}
L_end_interrupt:
L__interrupt117:
	RETFIE     %s
; end of _interrupt

_check_cond:

;Tractor.c,40 :: 		void check_cond()
;Tractor.c,50 :: 		if(COND1)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond119
	BSF        R2, 0
	GOTO       L__check_cond120
L__check_cond119:
	BCF        R2, 0
L__check_cond120:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond121
	BSF        3, 0
	GOTO       L__check_cond122
L__check_cond121:
	BCF        3, 0
L__check_cond122:
	BTFSS      R2, 0
	GOTO       L__check_cond123
	BTFSS      3, 0
	GOTO       L__check_cond123
	BSF        R2, 0
	GOTO       L__check_cond124
L__check_cond123:
	BCF        R2, 0
L__check_cond124:
	BTFSS      R2, 0
	GOTO       L__check_cond125
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond125
	BSF        3, 0
	GOTO       L__check_cond126
L__check_cond125:
	BCF        3, 0
L__check_cond126:
	BTFSS      3, 0
	GOTO       L__check_cond127
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond127
	BSF        R2, 0
	GOTO       L__check_cond128
L__check_cond127:
	BCF        R2, 0
L__check_cond128:
	BTFSS      R2, 0
	GOTO       L_check_cond4
;Tractor.c,52 :: 		if(guc_cycle[0]<NO_CYCLE_1)
	MOVLW      3
	SUBWF      _guc_cycle+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond129
	MOVLW      232
	SUBWF      _guc_cycle+0, 0
L__check_cond129:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond5
;Tractor.c,54 :: 		guc_choice=1; guc_cycle[0]++;guc_cycle[1]=0; guc_cycle[2]=0;
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
;Tractor.c,55 :: 		guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]=0;
	CLRF       _guc_cycle+6
	CLRF       _guc_cycle+7
	CLRF       _guc_cycle+8
	CLRF       _guc_cycle+9
	CLRF       _guc_cycle+10
	CLRF       _guc_cycle+11
;Tractor.c,56 :: 		}
L_check_cond5:
;Tractor.c,57 :: 		}
	GOTO       L_check_cond6
L_check_cond4:
;Tractor.c,58 :: 		else if(COND2)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond130
	BSF        R2, 0
	GOTO       L__check_cond131
L__check_cond130:
	BCF        R2, 0
L__check_cond131:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond132
	BSF        3, 0
	GOTO       L__check_cond133
L__check_cond132:
	BCF        3, 0
L__check_cond133:
	BTFSS      R2, 0
	GOTO       L__check_cond134
	BTFSS      3, 0
	GOTO       L__check_cond134
	BSF        R2, 0
	GOTO       L__check_cond135
L__check_cond134:
	BCF        R2, 0
L__check_cond135:
	BTFSS      R2, 0
	GOTO       L__check_cond136
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond136
	BSF        R2, 0
	GOTO       L__check_cond137
L__check_cond136:
	BCF        R2, 0
L__check_cond137:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond138
	BSF        3, 0
	GOTO       L__check_cond139
L__check_cond138:
	BCF        3, 0
L__check_cond139:
	BTFSS      R2, 0
	GOTO       L__check_cond140
	BTFSS      3, 0
	GOTO       L__check_cond140
	BSF        R2, 0
	GOTO       L__check_cond141
L__check_cond140:
	BCF        R2, 0
L__check_cond141:
	BTFSS      R2, 0
	GOTO       L_check_cond7
;Tractor.c,60 :: 		if(guc_cycle[1]<NO_CYCLE_2)
	MOVLW      3
	SUBWF      _guc_cycle+3, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond142
	MOVLW      232
	SUBWF      _guc_cycle+2, 0
L__check_cond142:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond8
;Tractor.c,62 :: 		guc_choice=2; guc_cycle[0]=0;guc_cycle[1]++; guc_cycle[2]=0;
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
;Tractor.c,63 :: 		guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]=0;
	CLRF       _guc_cycle+6
	CLRF       _guc_cycle+7
	CLRF       _guc_cycle+8
	CLRF       _guc_cycle+9
	CLRF       _guc_cycle+10
	CLRF       _guc_cycle+11
;Tractor.c,64 :: 		}
L_check_cond8:
;Tractor.c,65 :: 		}
	GOTO       L_check_cond9
L_check_cond7:
;Tractor.c,66 :: 		else if(COND3)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond143
	BSF        3, 0
	GOTO       L__check_cond144
L__check_cond143:
	BCF        3, 0
L__check_cond144:
	BTFSS      3, 0
	GOTO       L__check_cond145
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond145
	BSF        R2, 0
	GOTO       L__check_cond146
L__check_cond145:
	BCF        R2, 0
L__check_cond146:
	BTFSS      R2, 0
	GOTO       L__check_cond147
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond147
	BSF        3, 0
	GOTO       L__check_cond148
L__check_cond147:
	BCF        3, 0
L__check_cond148:
	BTFSS      3, 0
	GOTO       L__check_cond149
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond149
	BSF        R2, 0
	GOTO       L__check_cond150
L__check_cond149:
	BCF        R2, 0
L__check_cond150:
	BTFSS      R2, 0
	GOTO       L_check_cond10
;Tractor.c,68 :: 		if(guc_cycle[2]<NO_CYCLE_3)
	MOVLW      3
	SUBWF      _guc_cycle+5, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond151
	MOVLW      232
	SUBWF      _guc_cycle+4, 0
L__check_cond151:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond11
;Tractor.c,70 :: 		guc_choice=3; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]++;
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
;Tractor.c,71 :: 		guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]=0;
	CLRF       _guc_cycle+6
	CLRF       _guc_cycle+7
	CLRF       _guc_cycle+8
	CLRF       _guc_cycle+9
	CLRF       _guc_cycle+10
	CLRF       _guc_cycle+11
;Tractor.c,72 :: 		}
L_check_cond11:
;Tractor.c,73 :: 		}
	GOTO       L_check_cond12
L_check_cond10:
;Tractor.c,74 :: 		else if(COND4)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond152
	BSF        3, 0
	GOTO       L__check_cond153
L__check_cond152:
	BCF        3, 0
L__check_cond153:
	BTFSS      3, 0
	GOTO       L__check_cond154
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond154
	BSF        R2, 0
	GOTO       L__check_cond155
L__check_cond154:
	BCF        R2, 0
L__check_cond155:
	BTFSS      R2, 0
	GOTO       L__check_cond156
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond156
	BSF        R2, 0
	GOTO       L__check_cond157
L__check_cond156:
	BCF        R2, 0
L__check_cond157:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond158
	BSF        3, 0
	GOTO       L__check_cond159
L__check_cond158:
	BCF        3, 0
L__check_cond159:
	BTFSS      R2, 0
	GOTO       L__check_cond160
	BTFSS      3, 0
	GOTO       L__check_cond160
	BSF        R2, 0
	GOTO       L__check_cond161
L__check_cond160:
	BCF        R2, 0
L__check_cond161:
	BTFSS      R2, 0
	GOTO       L_check_cond13
;Tractor.c,76 :: 		if(guc_cycle[3]<NO_CYCLE_4)
	MOVLW      3
	SUBWF      _guc_cycle+7, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond162
	MOVLW      232
	SUBWF      _guc_cycle+6, 0
L__check_cond162:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond14
;Tractor.c,78 :: 		guc_choice=4; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]=0;
	MOVLW      4
	MOVWF      _guc_choice+0
	CLRF       _guc_cycle+0
	CLRF       _guc_cycle+1
	CLRF       _guc_cycle+2
	CLRF       _guc_cycle+3
	CLRF       _guc_cycle+4
	CLRF       _guc_cycle+5
;Tractor.c,79 :: 		guc_cycle[3]++; guc_cycle[4]=0; guc_cycle[5]=0;
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
;Tractor.c,80 :: 		}
L_check_cond14:
;Tractor.c,81 :: 		}
	GOTO       L_check_cond15
L_check_cond13:
;Tractor.c,82 :: 		else if(COND5)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond163
	BSF        3, 0
	GOTO       L__check_cond164
L__check_cond163:
	BCF        3, 0
L__check_cond164:
	BTFSS      3, 0
	GOTO       L__check_cond165
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond165
	BSF        R2, 0
	GOTO       L__check_cond166
L__check_cond165:
	BCF        R2, 0
L__check_cond166:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond167
	BSF        3, 0
	GOTO       L__check_cond168
L__check_cond167:
	BCF        3, 0
L__check_cond168:
	BTFSS      R2, 0
	GOTO       L__check_cond169
	BTFSS      3, 0
	GOTO       L__check_cond169
	BSF        R2, 0
	GOTO       L__check_cond170
L__check_cond169:
	BCF        R2, 0
L__check_cond170:
	BTFSS      R2, 0
	GOTO       L__check_cond171
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond171
	BSF        3, 0
	GOTO       L__check_cond172
L__check_cond171:
	BCF        3, 0
L__check_cond172:
	BTFSS      3, 0
	GOTO       L_check_cond16
;Tractor.c,84 :: 		if(guc_cycle[4]<NO_CYCLE_5)
	MOVLW      3
	SUBWF      _guc_cycle+9, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond173
	MOVLW      232
	SUBWF      _guc_cycle+8, 0
L__check_cond173:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond17
;Tractor.c,86 :: 		guc_choice=5; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]=0;
	MOVLW      5
	MOVWF      _guc_choice+0
	CLRF       _guc_cycle+0
	CLRF       _guc_cycle+1
	CLRF       _guc_cycle+2
	CLRF       _guc_cycle+3
	CLRF       _guc_cycle+4
	CLRF       _guc_cycle+5
;Tractor.c,87 :: 		guc_cycle[3]=0; guc_cycle[4]++; guc_cycle[5]=0;
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
;Tractor.c,88 :: 		}
L_check_cond17:
;Tractor.c,89 :: 		}
	GOTO       L_check_cond18
L_check_cond16:
;Tractor.c,90 :: 		else if(COND6)
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond174
	BSF        3, 0
	GOTO       L__check_cond175
L__check_cond174:
	BCF        3, 0
L__check_cond175:
	BTFSS      3, 0
	GOTO       L__check_cond176
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond176
	BSF        R2, 0
	GOTO       L__check_cond177
L__check_cond176:
	BCF        R2, 0
L__check_cond177:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond178
	BSF        3, 0
	GOTO       L__check_cond179
L__check_cond178:
	BCF        3, 0
L__check_cond179:
	BTFSS      R2, 0
	GOTO       L__check_cond180
	BTFSS      3, 0
	GOTO       L__check_cond180
	BSF        R2, 0
	GOTO       L__check_cond181
L__check_cond180:
	BCF        R2, 0
L__check_cond181:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond182
	BSF        3, 0
	GOTO       L__check_cond183
L__check_cond182:
	BCF        3, 0
L__check_cond183:
	BTFSS      R2, 0
	GOTO       L__check_cond184
	BTFSS      3, 0
	GOTO       L__check_cond184
	BSF        R2, 0
	GOTO       L__check_cond185
L__check_cond184:
	BCF        R2, 0
L__check_cond185:
	BTFSS      R2, 0
	GOTO       L_check_cond19
;Tractor.c,92 :: 		if(guc_cycle[5]<NO_CYCLE_6)
	MOVLW      3
	SUBWF      _guc_cycle+11, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond186
	MOVLW      232
	SUBWF      _guc_cycle+10, 0
L__check_cond186:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond20
;Tractor.c,94 :: 		guc_choice=6; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]=0;
	MOVLW      6
	MOVWF      _guc_choice+0
	CLRF       _guc_cycle+0
	CLRF       _guc_cycle+1
	CLRF       _guc_cycle+2
	CLRF       _guc_cycle+3
	CLRF       _guc_cycle+4
	CLRF       _guc_cycle+5
;Tractor.c,95 :: 		guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]++;
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
;Tractor.c,96 :: 		}
L_check_cond20:
;Tractor.c,97 :: 		}
L_check_cond19:
L_check_cond18:
L_check_cond15:
L_check_cond12:
L_check_cond9:
L_check_cond6:
;Tractor.c,98 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;Tractor.c,100 :: 		void exe_cond()
;Tractor.c,102 :: 		guc_sec=0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,103 :: 		switch(guc_choice)
	GOTO       L_exe_cond21
;Tractor.c,105 :: 		case 1: while(guc_sec<2)
L_exe_cond23:
L_exe_cond24:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond188
	MOVLW      2
	SUBWF      _guc_sec+0, 0
L__exe_cond188:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond25
;Tractor.c,107 :: 		if(COND2 || !COND1) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond189
	BSF        R1, 0
	GOTO       L__exe_cond190
L__exe_cond189:
	BCF        R1, 0
L__exe_cond190:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond191
	BSF        3, 0
	GOTO       L__exe_cond192
L__exe_cond191:
	BCF        3, 0
L__exe_cond192:
	BTFSS      R1, 0
	GOTO       L__exe_cond193
	BTFSS      3, 0
	GOTO       L__exe_cond193
	BSF        R1, 0
	GOTO       L__exe_cond194
L__exe_cond193:
	BCF        R1, 0
L__exe_cond194:
	BTFSS      R1, 0
	GOTO       L__exe_cond195
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond195
	BSF        R1, 0
	GOTO       L__exe_cond196
L__exe_cond195:
	BCF        R1, 0
L__exe_cond196:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond197
	BSF        3, 0
	GOTO       L__exe_cond198
L__exe_cond197:
	BCF        3, 0
L__exe_cond198:
	BTFSS      R1, 0
	GOTO       L__exe_cond199
	BTFSS      3, 0
	GOTO       L__exe_cond199
	BSF        R1, 0
	GOTO       L__exe_cond200
L__exe_cond199:
	BCF        R1, 0
L__exe_cond200:
	BTFSC      R1, 0
	GOTO       L__exe_cond115
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond201
	BSF        R1, 0
	GOTO       L__exe_cond202
L__exe_cond201:
	BCF        R1, 0
L__exe_cond202:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond203
	BSF        3, 0
	GOTO       L__exe_cond204
L__exe_cond203:
	BCF        3, 0
L__exe_cond204:
	BTFSS      R1, 0
	GOTO       L__exe_cond205
	BTFSS      3, 0
	GOTO       L__exe_cond205
	BSF        R1, 0
	GOTO       L__exe_cond206
L__exe_cond205:
	BCF        R1, 0
L__exe_cond206:
	BTFSS      R1, 0
	GOTO       L__exe_cond207
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond207
	BSF        3, 0
	GOTO       L__exe_cond208
L__exe_cond207:
	BCF        3, 0
L__exe_cond208:
	BTFSS      3, 0
	GOTO       L__exe_cond209
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond209
	BSF        R1, 0
	GOTO       L__exe_cond210
L__exe_cond209:
	BCF        R1, 0
L__exe_cond210:
	BTFSS      R1, 0
	GOTO       L__exe_cond115
	GOTO       L_exe_cond28
L__exe_cond115:
	GOTO       L_exe_cond25
L_exe_cond28:
;Tractor.c,108 :: 		}
	GOTO       L_exe_cond24
L_exe_cond25:
;Tractor.c,109 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,110 :: 		while(COND1);
L_exe_cond29:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond211
	BSF        R1, 0
	GOTO       L__exe_cond212
L__exe_cond211:
	BCF        R1, 0
L__exe_cond212:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond213
	BSF        3, 0
	GOTO       L__exe_cond214
L__exe_cond213:
	BCF        3, 0
L__exe_cond214:
	BTFSS      R1, 0
	GOTO       L__exe_cond215
	BTFSS      3, 0
	GOTO       L__exe_cond215
	BSF        R1, 0
	GOTO       L__exe_cond216
L__exe_cond215:
	BCF        R1, 0
L__exe_cond216:
	BTFSS      R1, 0
	GOTO       L__exe_cond217
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond217
	BSF        3, 0
	GOTO       L__exe_cond218
L__exe_cond217:
	BCF        3, 0
L__exe_cond218:
	BTFSS      3, 0
	GOTO       L__exe_cond219
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond219
	BSF        R1, 0
	GOTO       L__exe_cond220
L__exe_cond219:
	BCF        R1, 0
L__exe_cond220:
	BTFSS      R1, 0
	GOTO       L_exe_cond30
	GOTO       L_exe_cond29
L_exe_cond30:
;Tractor.c,111 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,112 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,113 :: 		case 2: guc_buzz_state=1;
L_exe_cond31:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,114 :: 		while(COND2);
L_exe_cond32:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond221
	BSF        R1, 0
	GOTO       L__exe_cond222
L__exe_cond221:
	BCF        R1, 0
L__exe_cond222:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond223
	BSF        3, 0
	GOTO       L__exe_cond224
L__exe_cond223:
	BCF        3, 0
L__exe_cond224:
	BTFSS      R1, 0
	GOTO       L__exe_cond225
	BTFSS      3, 0
	GOTO       L__exe_cond225
	BSF        R1, 0
	GOTO       L__exe_cond226
L__exe_cond225:
	BCF        R1, 0
L__exe_cond226:
	BTFSS      R1, 0
	GOTO       L__exe_cond227
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond227
	BSF        R1, 0
	GOTO       L__exe_cond228
L__exe_cond227:
	BCF        R1, 0
L__exe_cond228:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond229
	BSF        3, 0
	GOTO       L__exe_cond230
L__exe_cond229:
	BCF        3, 0
L__exe_cond230:
	BTFSS      R1, 0
	GOTO       L__exe_cond231
	BTFSS      3, 0
	GOTO       L__exe_cond231
	BSF        R1, 0
	GOTO       L__exe_cond232
L__exe_cond231:
	BCF        R1, 0
L__exe_cond232:
	BTFSS      R1, 0
	GOTO       L_exe_cond33
	GOTO       L_exe_cond32
L_exe_cond33:
;Tractor.c,115 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,116 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,117 :: 		case 3: while(guc_sec<3)
L_exe_cond34:
L_exe_cond35:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond233
	MOVLW      3
	SUBWF      _guc_sec+0, 0
L__exe_cond233:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond36
;Tractor.c,119 :: 		if(COND2 || !COND3) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond234
	BSF        R1, 0
	GOTO       L__exe_cond235
L__exe_cond234:
	BCF        R1, 0
L__exe_cond235:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond236
	BSF        3, 0
	GOTO       L__exe_cond237
L__exe_cond236:
	BCF        3, 0
L__exe_cond237:
	BTFSS      R1, 0
	GOTO       L__exe_cond238
	BTFSS      3, 0
	GOTO       L__exe_cond238
	BSF        R1, 0
	GOTO       L__exe_cond239
L__exe_cond238:
	BCF        R1, 0
L__exe_cond239:
	BTFSS      R1, 0
	GOTO       L__exe_cond240
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond240
	BSF        R1, 0
	GOTO       L__exe_cond241
L__exe_cond240:
	BCF        R1, 0
L__exe_cond241:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond242
	BSF        3, 0
	GOTO       L__exe_cond243
L__exe_cond242:
	BCF        3, 0
L__exe_cond243:
	BTFSS      R1, 0
	GOTO       L__exe_cond244
	BTFSS      3, 0
	GOTO       L__exe_cond244
	BSF        R1, 0
	GOTO       L__exe_cond245
L__exe_cond244:
	BCF        R1, 0
L__exe_cond245:
	BTFSC      R1, 0
	GOTO       L__exe_cond114
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond246
	BSF        3, 0
	GOTO       L__exe_cond247
L__exe_cond246:
	BCF        3, 0
L__exe_cond247:
	BTFSS      3, 0
	GOTO       L__exe_cond248
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond248
	BSF        R1, 0
	GOTO       L__exe_cond249
L__exe_cond248:
	BCF        R1, 0
L__exe_cond249:
	BTFSS      R1, 0
	GOTO       L__exe_cond250
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond250
	BSF        3, 0
	GOTO       L__exe_cond251
L__exe_cond250:
	BCF        3, 0
L__exe_cond251:
	BTFSS      3, 0
	GOTO       L__exe_cond252
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond252
	BSF        R1, 0
	GOTO       L__exe_cond253
L__exe_cond252:
	BCF        R1, 0
L__exe_cond253:
	BTFSS      R1, 0
	GOTO       L__exe_cond114
	GOTO       L_exe_cond39
L__exe_cond114:
	GOTO       L_exe_cond36
L_exe_cond39:
;Tractor.c,120 :: 		}
	GOTO       L_exe_cond35
L_exe_cond36:
;Tractor.c,121 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,122 :: 		guc_sec=0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,123 :: 		while(guc_sec<5)
L_exe_cond40:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond254
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond254:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond41
;Tractor.c,125 :: 		if(COND2 || !COND3) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond255
	BSF        R1, 0
	GOTO       L__exe_cond256
L__exe_cond255:
	BCF        R1, 0
L__exe_cond256:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond257
	BSF        3, 0
	GOTO       L__exe_cond258
L__exe_cond257:
	BCF        3, 0
L__exe_cond258:
	BTFSS      R1, 0
	GOTO       L__exe_cond259
	BTFSS      3, 0
	GOTO       L__exe_cond259
	BSF        R1, 0
	GOTO       L__exe_cond260
L__exe_cond259:
	BCF        R1, 0
L__exe_cond260:
	BTFSS      R1, 0
	GOTO       L__exe_cond261
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond261
	BSF        R1, 0
	GOTO       L__exe_cond262
L__exe_cond261:
	BCF        R1, 0
L__exe_cond262:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond263
	BSF        3, 0
	GOTO       L__exe_cond264
L__exe_cond263:
	BCF        3, 0
L__exe_cond264:
	BTFSS      R1, 0
	GOTO       L__exe_cond265
	BTFSS      3, 0
	GOTO       L__exe_cond265
	BSF        R1, 0
	GOTO       L__exe_cond266
L__exe_cond265:
	BCF        R1, 0
L__exe_cond266:
	BTFSC      R1, 0
	GOTO       L__exe_cond113
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond267
	BSF        3, 0
	GOTO       L__exe_cond268
L__exe_cond267:
	BCF        3, 0
L__exe_cond268:
	BTFSS      3, 0
	GOTO       L__exe_cond269
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond269
	BSF        R1, 0
	GOTO       L__exe_cond270
L__exe_cond269:
	BCF        R1, 0
L__exe_cond270:
	BTFSS      R1, 0
	GOTO       L__exe_cond271
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond271
	BSF        3, 0
	GOTO       L__exe_cond272
L__exe_cond271:
	BCF        3, 0
L__exe_cond272:
	BTFSS      3, 0
	GOTO       L__exe_cond273
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond273
	BSF        R1, 0
	GOTO       L__exe_cond274
L__exe_cond273:
	BCF        R1, 0
L__exe_cond274:
	BTFSS      R1, 0
	GOTO       L__exe_cond113
	GOTO       L_exe_cond44
L__exe_cond113:
	GOTO       L_exe_cond41
L_exe_cond44:
;Tractor.c,126 :: 		}
	GOTO       L_exe_cond40
L_exe_cond41:
;Tractor.c,127 :: 		guc_buzz_state=0;guc_sec=0;
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,128 :: 		RELAY = 1;
	BSF        PORTC+0, 4
;Tractor.c,129 :: 		while(guc_sec<10)
L_exe_cond45:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond275
	MOVLW      10
	SUBWF      _guc_sec+0, 0
L__exe_cond275:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond46
;Tractor.c,131 :: 		if(COND2 || !COND3) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond276
	BSF        R1, 0
	GOTO       L__exe_cond277
L__exe_cond276:
	BCF        R1, 0
L__exe_cond277:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond278
	BSF        3, 0
	GOTO       L__exe_cond279
L__exe_cond278:
	BCF        3, 0
L__exe_cond279:
	BTFSS      R1, 0
	GOTO       L__exe_cond280
	BTFSS      3, 0
	GOTO       L__exe_cond280
	BSF        R1, 0
	GOTO       L__exe_cond281
L__exe_cond280:
	BCF        R1, 0
L__exe_cond281:
	BTFSS      R1, 0
	GOTO       L__exe_cond282
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond282
	BSF        R1, 0
	GOTO       L__exe_cond283
L__exe_cond282:
	BCF        R1, 0
L__exe_cond283:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond284
	BSF        3, 0
	GOTO       L__exe_cond285
L__exe_cond284:
	BCF        3, 0
L__exe_cond285:
	BTFSS      R1, 0
	GOTO       L__exe_cond286
	BTFSS      3, 0
	GOTO       L__exe_cond286
	BSF        R1, 0
	GOTO       L__exe_cond287
L__exe_cond286:
	BCF        R1, 0
L__exe_cond287:
	BTFSC      R1, 0
	GOTO       L__exe_cond112
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond288
	BSF        3, 0
	GOTO       L__exe_cond289
L__exe_cond288:
	BCF        3, 0
L__exe_cond289:
	BTFSS      3, 0
	GOTO       L__exe_cond290
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond290
	BSF        R1, 0
	GOTO       L__exe_cond291
L__exe_cond290:
	BCF        R1, 0
L__exe_cond291:
	BTFSS      R1, 0
	GOTO       L__exe_cond292
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond292
	BSF        3, 0
	GOTO       L__exe_cond293
L__exe_cond292:
	BCF        3, 0
L__exe_cond293:
	BTFSS      3, 0
	GOTO       L__exe_cond294
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond294
	BSF        R1, 0
	GOTO       L__exe_cond295
L__exe_cond294:
	BCF        R1, 0
L__exe_cond295:
	BTFSS      R1, 0
	GOTO       L__exe_cond112
	GOTO       L_exe_cond49
L__exe_cond112:
	GOTO       L_exe_cond46
L_exe_cond49:
;Tractor.c,132 :: 		}
	GOTO       L_exe_cond45
L_exe_cond46:
;Tractor.c,133 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;Tractor.c,134 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,135 :: 		case 4: while(guc_sec<3)
L_exe_cond50:
L_exe_cond51:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond296
	MOVLW      3
	SUBWF      _guc_sec+0, 0
L__exe_cond296:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond52
;Tractor.c,137 :: 		if(COND2 || !COND4) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond297
	BSF        R1, 0
	GOTO       L__exe_cond298
L__exe_cond297:
	BCF        R1, 0
L__exe_cond298:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond299
	BSF        3, 0
	GOTO       L__exe_cond300
L__exe_cond299:
	BCF        3, 0
L__exe_cond300:
	BTFSS      R1, 0
	GOTO       L__exe_cond301
	BTFSS      3, 0
	GOTO       L__exe_cond301
	BSF        R1, 0
	GOTO       L__exe_cond302
L__exe_cond301:
	BCF        R1, 0
L__exe_cond302:
	BTFSS      R1, 0
	GOTO       L__exe_cond303
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond303
	BSF        R1, 0
	GOTO       L__exe_cond304
L__exe_cond303:
	BCF        R1, 0
L__exe_cond304:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond305
	BSF        3, 0
	GOTO       L__exe_cond306
L__exe_cond305:
	BCF        3, 0
L__exe_cond306:
	BTFSS      R1, 0
	GOTO       L__exe_cond307
	BTFSS      3, 0
	GOTO       L__exe_cond307
	BSF        R1, 0
	GOTO       L__exe_cond308
L__exe_cond307:
	BCF        R1, 0
L__exe_cond308:
	BTFSC      R1, 0
	GOTO       L__exe_cond111
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond309
	BSF        3, 0
	GOTO       L__exe_cond310
L__exe_cond309:
	BCF        3, 0
L__exe_cond310:
	BTFSS      3, 0
	GOTO       L__exe_cond311
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond311
	BSF        R1, 0
	GOTO       L__exe_cond312
L__exe_cond311:
	BCF        R1, 0
L__exe_cond312:
	BTFSS      R1, 0
	GOTO       L__exe_cond313
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond313
	BSF        R1, 0
	GOTO       L__exe_cond314
L__exe_cond313:
	BCF        R1, 0
L__exe_cond314:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond315
	BSF        3, 0
	GOTO       L__exe_cond316
L__exe_cond315:
	BCF        3, 0
L__exe_cond316:
	BTFSS      R1, 0
	GOTO       L__exe_cond317
	BTFSS      3, 0
	GOTO       L__exe_cond317
	BSF        R1, 0
	GOTO       L__exe_cond318
L__exe_cond317:
	BCF        R1, 0
L__exe_cond318:
	BTFSS      R1, 0
	GOTO       L__exe_cond111
	GOTO       L_exe_cond55
L__exe_cond111:
	GOTO       L_exe_cond52
L_exe_cond55:
;Tractor.c,138 :: 		}
	GOTO       L_exe_cond51
L_exe_cond52:
;Tractor.c,139 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,140 :: 		guc_sec=0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,141 :: 		while(guc_sec<5)
L_exe_cond56:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond319
	MOVLW      5
	SUBWF      _guc_sec+0, 0
L__exe_cond319:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond57
;Tractor.c,143 :: 		if(COND2 || !COND4) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond320
	BSF        R1, 0
	GOTO       L__exe_cond321
L__exe_cond320:
	BCF        R1, 0
L__exe_cond321:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond322
	BSF        3, 0
	GOTO       L__exe_cond323
L__exe_cond322:
	BCF        3, 0
L__exe_cond323:
	BTFSS      R1, 0
	GOTO       L__exe_cond324
	BTFSS      3, 0
	GOTO       L__exe_cond324
	BSF        R1, 0
	GOTO       L__exe_cond325
L__exe_cond324:
	BCF        R1, 0
L__exe_cond325:
	BTFSS      R1, 0
	GOTO       L__exe_cond326
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond326
	BSF        R1, 0
	GOTO       L__exe_cond327
L__exe_cond326:
	BCF        R1, 0
L__exe_cond327:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond328
	BSF        3, 0
	GOTO       L__exe_cond329
L__exe_cond328:
	BCF        3, 0
L__exe_cond329:
	BTFSS      R1, 0
	GOTO       L__exe_cond330
	BTFSS      3, 0
	GOTO       L__exe_cond330
	BSF        R1, 0
	GOTO       L__exe_cond331
L__exe_cond330:
	BCF        R1, 0
L__exe_cond331:
	BTFSC      R1, 0
	GOTO       L__exe_cond110
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond332
	BSF        3, 0
	GOTO       L__exe_cond333
L__exe_cond332:
	BCF        3, 0
L__exe_cond333:
	BTFSS      3, 0
	GOTO       L__exe_cond334
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond334
	BSF        R1, 0
	GOTO       L__exe_cond335
L__exe_cond334:
	BCF        R1, 0
L__exe_cond335:
	BTFSS      R1, 0
	GOTO       L__exe_cond336
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond336
	BSF        R1, 0
	GOTO       L__exe_cond337
L__exe_cond336:
	BCF        R1, 0
L__exe_cond337:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond338
	BSF        3, 0
	GOTO       L__exe_cond339
L__exe_cond338:
	BCF        3, 0
L__exe_cond339:
	BTFSS      R1, 0
	GOTO       L__exe_cond340
	BTFSS      3, 0
	GOTO       L__exe_cond340
	BSF        R1, 0
	GOTO       L__exe_cond341
L__exe_cond340:
	BCF        R1, 0
L__exe_cond341:
	BTFSS      R1, 0
	GOTO       L__exe_cond110
	GOTO       L_exe_cond60
L__exe_cond110:
	GOTO       L_exe_cond57
L_exe_cond60:
;Tractor.c,144 :: 		}
	GOTO       L_exe_cond56
L_exe_cond57:
;Tractor.c,145 :: 		guc_buzz_state=0;guc_sec=0;
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,146 :: 		RELAY = 1;
	BSF        PORTC+0, 4
;Tractor.c,147 :: 		while(guc_sec < 10)
L_exe_cond61:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond342
	MOVLW      10
	SUBWF      _guc_sec+0, 0
L__exe_cond342:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond62
;Tractor.c,149 :: 		if(COND2 || !COND4) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond343
	BSF        R1, 0
	GOTO       L__exe_cond344
L__exe_cond343:
	BCF        R1, 0
L__exe_cond344:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond345
	BSF        3, 0
	GOTO       L__exe_cond346
L__exe_cond345:
	BCF        3, 0
L__exe_cond346:
	BTFSS      R1, 0
	GOTO       L__exe_cond347
	BTFSS      3, 0
	GOTO       L__exe_cond347
	BSF        R1, 0
	GOTO       L__exe_cond348
L__exe_cond347:
	BCF        R1, 0
L__exe_cond348:
	BTFSS      R1, 0
	GOTO       L__exe_cond349
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond349
	BSF        R1, 0
	GOTO       L__exe_cond350
L__exe_cond349:
	BCF        R1, 0
L__exe_cond350:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond351
	BSF        3, 0
	GOTO       L__exe_cond352
L__exe_cond351:
	BCF        3, 0
L__exe_cond352:
	BTFSS      R1, 0
	GOTO       L__exe_cond353
	BTFSS      3, 0
	GOTO       L__exe_cond353
	BSF        R1, 0
	GOTO       L__exe_cond354
L__exe_cond353:
	BCF        R1, 0
L__exe_cond354:
	BTFSC      R1, 0
	GOTO       L__exe_cond109
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond355
	BSF        3, 0
	GOTO       L__exe_cond356
L__exe_cond355:
	BCF        3, 0
L__exe_cond356:
	BTFSS      3, 0
	GOTO       L__exe_cond357
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond357
	BSF        R1, 0
	GOTO       L__exe_cond358
L__exe_cond357:
	BCF        R1, 0
L__exe_cond358:
	BTFSS      R1, 0
	GOTO       L__exe_cond359
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond359
	BSF        R1, 0
	GOTO       L__exe_cond360
L__exe_cond359:
	BCF        R1, 0
L__exe_cond360:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond361
	BSF        3, 0
	GOTO       L__exe_cond362
L__exe_cond361:
	BCF        3, 0
L__exe_cond362:
	BTFSS      R1, 0
	GOTO       L__exe_cond363
	BTFSS      3, 0
	GOTO       L__exe_cond363
	BSF        R1, 0
	GOTO       L__exe_cond364
L__exe_cond363:
	BCF        R1, 0
L__exe_cond364:
	BTFSS      R1, 0
	GOTO       L__exe_cond109
	GOTO       L_exe_cond65
L__exe_cond109:
	GOTO       L_exe_cond62
L_exe_cond65:
;Tractor.c,150 :: 		}
	GOTO       L_exe_cond61
L_exe_cond62:
;Tractor.c,151 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;Tractor.c,152 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,153 :: 		case 5: while(guc_sec<3)
L_exe_cond66:
L_exe_cond67:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond365
	MOVLW      3
	SUBWF      _guc_sec+0, 0
L__exe_cond365:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond68
;Tractor.c,155 :: 		if(COND2 || !COND5) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond366
	BSF        R1, 0
	GOTO       L__exe_cond367
L__exe_cond366:
	BCF        R1, 0
L__exe_cond367:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond368
	BSF        3, 0
	GOTO       L__exe_cond369
L__exe_cond368:
	BCF        3, 0
L__exe_cond369:
	BTFSS      R1, 0
	GOTO       L__exe_cond370
	BTFSS      3, 0
	GOTO       L__exe_cond370
	BSF        R1, 0
	GOTO       L__exe_cond371
L__exe_cond370:
	BCF        R1, 0
L__exe_cond371:
	BTFSS      R1, 0
	GOTO       L__exe_cond372
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond372
	BSF        R1, 0
	GOTO       L__exe_cond373
L__exe_cond372:
	BCF        R1, 0
L__exe_cond373:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond374
	BSF        3, 0
	GOTO       L__exe_cond375
L__exe_cond374:
	BCF        3, 0
L__exe_cond375:
	BTFSS      R1, 0
	GOTO       L__exe_cond376
	BTFSS      3, 0
	GOTO       L__exe_cond376
	BSF        R1, 0
	GOTO       L__exe_cond377
L__exe_cond376:
	BCF        R1, 0
L__exe_cond377:
	BTFSC      R1, 0
	GOTO       L__exe_cond108
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond378
	BSF        3, 0
	GOTO       L__exe_cond379
L__exe_cond378:
	BCF        3, 0
L__exe_cond379:
	BTFSS      3, 0
	GOTO       L__exe_cond380
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond380
	BSF        R1, 0
	GOTO       L__exe_cond381
L__exe_cond380:
	BCF        R1, 0
L__exe_cond381:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond382
	BSF        3, 0
	GOTO       L__exe_cond383
L__exe_cond382:
	BCF        3, 0
L__exe_cond383:
	BTFSS      R1, 0
	GOTO       L__exe_cond384
	BTFSS      3, 0
	GOTO       L__exe_cond384
	BSF        R1, 0
	GOTO       L__exe_cond385
L__exe_cond384:
	BCF        R1, 0
L__exe_cond385:
	BTFSS      R1, 0
	GOTO       L__exe_cond386
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond386
	BSF        3, 0
	GOTO       L__exe_cond387
L__exe_cond386:
	BCF        3, 0
L__exe_cond387:
	BTFSS      3, 0
	GOTO       L__exe_cond108
	GOTO       L_exe_cond71
L__exe_cond108:
	GOTO       L_exe_cond68
L_exe_cond71:
;Tractor.c,156 :: 		}
	GOTO       L_exe_cond67
L_exe_cond68:
;Tractor.c,157 :: 		guc_buzz_state=1;guc_sec=0;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,158 :: 		while(guc_sec<7)
L_exe_cond72:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond388
	MOVLW      7
	SUBWF      _guc_sec+0, 0
L__exe_cond388:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond73
;Tractor.c,160 :: 		if(COND2 || !COND5) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond389
	BSF        R1, 0
	GOTO       L__exe_cond390
L__exe_cond389:
	BCF        R1, 0
L__exe_cond390:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond391
	BSF        3, 0
	GOTO       L__exe_cond392
L__exe_cond391:
	BCF        3, 0
L__exe_cond392:
	BTFSS      R1, 0
	GOTO       L__exe_cond393
	BTFSS      3, 0
	GOTO       L__exe_cond393
	BSF        R1, 0
	GOTO       L__exe_cond394
L__exe_cond393:
	BCF        R1, 0
L__exe_cond394:
	BTFSS      R1, 0
	GOTO       L__exe_cond395
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond395
	BSF        R1, 0
	GOTO       L__exe_cond396
L__exe_cond395:
	BCF        R1, 0
L__exe_cond396:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond397
	BSF        3, 0
	GOTO       L__exe_cond398
L__exe_cond397:
	BCF        3, 0
L__exe_cond398:
	BTFSS      R1, 0
	GOTO       L__exe_cond399
	BTFSS      3, 0
	GOTO       L__exe_cond399
	BSF        R1, 0
	GOTO       L__exe_cond400
L__exe_cond399:
	BCF        R1, 0
L__exe_cond400:
	BTFSC      R1, 0
	GOTO       L__exe_cond107
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond401
	BSF        3, 0
	GOTO       L__exe_cond402
L__exe_cond401:
	BCF        3, 0
L__exe_cond402:
	BTFSS      3, 0
	GOTO       L__exe_cond403
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond403
	BSF        R1, 0
	GOTO       L__exe_cond404
L__exe_cond403:
	BCF        R1, 0
L__exe_cond404:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond405
	BSF        3, 0
	GOTO       L__exe_cond406
L__exe_cond405:
	BCF        3, 0
L__exe_cond406:
	BTFSS      R1, 0
	GOTO       L__exe_cond407
	BTFSS      3, 0
	GOTO       L__exe_cond407
	BSF        R1, 0
	GOTO       L__exe_cond408
L__exe_cond407:
	BCF        R1, 0
L__exe_cond408:
	BTFSS      R1, 0
	GOTO       L__exe_cond409
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond409
	BSF        3, 0
	GOTO       L__exe_cond410
L__exe_cond409:
	BCF        3, 0
L__exe_cond410:
	BTFSS      3, 0
	GOTO       L__exe_cond107
	GOTO       L_exe_cond76
L__exe_cond107:
	GOTO       L_exe_cond73
L_exe_cond76:
;Tractor.c,161 :: 		}
	GOTO       L_exe_cond72
L_exe_cond73:
;Tractor.c,162 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,163 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,164 :: 		case 6: while(guc_sec<3)
L_exe_cond77:
L_exe_cond78:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond411
	MOVLW      3
	SUBWF      _guc_sec+0, 0
L__exe_cond411:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond79
;Tractor.c,166 :: 		if(COND2 || !COND6) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond412
	BSF        R1, 0
	GOTO       L__exe_cond413
L__exe_cond412:
	BCF        R1, 0
L__exe_cond413:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond414
	BSF        3, 0
	GOTO       L__exe_cond415
L__exe_cond414:
	BCF        3, 0
L__exe_cond415:
	BTFSS      R1, 0
	GOTO       L__exe_cond416
	BTFSS      3, 0
	GOTO       L__exe_cond416
	BSF        R1, 0
	GOTO       L__exe_cond417
L__exe_cond416:
	BCF        R1, 0
L__exe_cond417:
	BTFSS      R1, 0
	GOTO       L__exe_cond418
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond418
	BSF        R1, 0
	GOTO       L__exe_cond419
L__exe_cond418:
	BCF        R1, 0
L__exe_cond419:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond420
	BSF        3, 0
	GOTO       L__exe_cond421
L__exe_cond420:
	BCF        3, 0
L__exe_cond421:
	BTFSS      R1, 0
	GOTO       L__exe_cond422
	BTFSS      3, 0
	GOTO       L__exe_cond422
	BSF        R1, 0
	GOTO       L__exe_cond423
L__exe_cond422:
	BCF        R1, 0
L__exe_cond423:
	BTFSC      R1, 0
	GOTO       L__exe_cond106
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond424
	BSF        3, 0
	GOTO       L__exe_cond425
L__exe_cond424:
	BCF        3, 0
L__exe_cond425:
	BTFSS      3, 0
	GOTO       L__exe_cond426
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond426
	BSF        R1, 0
	GOTO       L__exe_cond427
L__exe_cond426:
	BCF        R1, 0
L__exe_cond427:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond428
	BSF        3, 0
	GOTO       L__exe_cond429
L__exe_cond428:
	BCF        3, 0
L__exe_cond429:
	BTFSS      R1, 0
	GOTO       L__exe_cond430
	BTFSS      3, 0
	GOTO       L__exe_cond430
	BSF        R1, 0
	GOTO       L__exe_cond431
L__exe_cond430:
	BCF        R1, 0
L__exe_cond431:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond432
	BSF        3, 0
	GOTO       L__exe_cond433
L__exe_cond432:
	BCF        3, 0
L__exe_cond433:
	BTFSS      R1, 0
	GOTO       L__exe_cond434
	BTFSS      3, 0
	GOTO       L__exe_cond434
	BSF        R1, 0
	GOTO       L__exe_cond435
L__exe_cond434:
	BCF        R1, 0
L__exe_cond435:
	BTFSS      R1, 0
	GOTO       L__exe_cond106
	GOTO       L_exe_cond82
L__exe_cond106:
	GOTO       L_exe_cond79
L_exe_cond82:
;Tractor.c,167 :: 		}
	GOTO       L_exe_cond78
L_exe_cond79:
;Tractor.c,168 :: 		guc_buzz_state=1;guc_sec=0;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,169 :: 		while(guc_sec<7)
L_exe_cond83:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond436
	MOVLW      7
	SUBWF      _guc_sec+0, 0
L__exe_cond436:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond84
;Tractor.c,171 :: 		if(COND2 || !COND6) break;
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond437
	BSF        R1, 0
	GOTO       L__exe_cond438
L__exe_cond437:
	BCF        R1, 0
L__exe_cond438:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond439
	BSF        3, 0
	GOTO       L__exe_cond440
L__exe_cond439:
	BCF        3, 0
L__exe_cond440:
	BTFSS      R1, 0
	GOTO       L__exe_cond441
	BTFSS      3, 0
	GOTO       L__exe_cond441
	BSF        R1, 0
	GOTO       L__exe_cond442
L__exe_cond441:
	BCF        R1, 0
L__exe_cond442:
	BTFSS      R1, 0
	GOTO       L__exe_cond443
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond443
	BSF        R1, 0
	GOTO       L__exe_cond444
L__exe_cond443:
	BCF        R1, 0
L__exe_cond444:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond445
	BSF        3, 0
	GOTO       L__exe_cond446
L__exe_cond445:
	BCF        3, 0
L__exe_cond446:
	BTFSS      R1, 0
	GOTO       L__exe_cond447
	BTFSS      3, 0
	GOTO       L__exe_cond447
	BSF        R1, 0
	GOTO       L__exe_cond448
L__exe_cond447:
	BCF        R1, 0
L__exe_cond448:
	BTFSC      R1, 0
	GOTO       L__exe_cond105
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond449
	BSF        3, 0
	GOTO       L__exe_cond450
L__exe_cond449:
	BCF        3, 0
L__exe_cond450:
	BTFSS      3, 0
	GOTO       L__exe_cond451
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond451
	BSF        R1, 0
	GOTO       L__exe_cond452
L__exe_cond451:
	BCF        R1, 0
L__exe_cond452:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond453
	BSF        3, 0
	GOTO       L__exe_cond454
L__exe_cond453:
	BCF        3, 0
L__exe_cond454:
	BTFSS      R1, 0
	GOTO       L__exe_cond455
	BTFSS      3, 0
	GOTO       L__exe_cond455
	BSF        R1, 0
	GOTO       L__exe_cond456
L__exe_cond455:
	BCF        R1, 0
L__exe_cond456:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond457
	BSF        3, 0
	GOTO       L__exe_cond458
L__exe_cond457:
	BCF        3, 0
L__exe_cond458:
	BTFSS      R1, 0
	GOTO       L__exe_cond459
	BTFSS      3, 0
	GOTO       L__exe_cond459
	BSF        R1, 0
	GOTO       L__exe_cond460
L__exe_cond459:
	BCF        R1, 0
L__exe_cond460:
	BTFSS      R1, 0
	GOTO       L__exe_cond105
	GOTO       L_exe_cond87
L__exe_cond105:
	GOTO       L_exe_cond84
L_exe_cond87:
;Tractor.c,172 :: 		}
	GOTO       L_exe_cond83
L_exe_cond84:
;Tractor.c,173 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,174 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,175 :: 		default: guc_choice=0;
L_exe_cond88:
	CLRF       _guc_choice+0
;Tractor.c,176 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,177 :: 		break;
	GOTO       L_exe_cond22
;Tractor.c,178 :: 		}
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
;Tractor.c,179 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_my_delay:

;Tractor.c,213 :: 		void my_delay()
;Tractor.c,215 :: 		for(i=0;i<1;i++)
	CLRF       _i+0
	CLRF       _i+1
L_my_delay89:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay462
	MOVLW      1
	SUBWF      _i+0, 0
L__my_delay462:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay90
;Tractor.c,216 :: 		for(j=0;j<400;j++)
	CLRF       _j+0
	CLRF       _j+1
L_my_delay92:
	MOVLW      1
	SUBWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay463
	MOVLW      144
	SUBWF      _j+0, 0
L__my_delay463:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay93
;Tractor.c,217 :: 		asm CLRWDT ;
	CLRWDT
;Tractor.c,216 :: 		for(j=0;j<400;j++)
	MOVLW      1
	ADDWF      _j+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _j+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _j+0
	MOVF       R1, 0
	MOVWF      _j+1
;Tractor.c,217 :: 		asm CLRWDT ;
	GOTO       L_my_delay92
L_my_delay93:
;Tractor.c,215 :: 		for(i=0;i<1;i++)
	MOVLW      1
	ADDWF      _i+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     _i+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      _i+0
	MOVF       R1, 0
	MOVWF      _i+1
;Tractor.c,217 :: 		asm CLRWDT ;
	GOTO       L_my_delay89
L_my_delay90:
;Tractor.c,218 :: 		}
L_end_my_delay:
	RETURN
; end of _my_delay

_sys_init:

;Tractor.c,221 :: 		void sys_init()
;Tractor.c,224 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;Tractor.c,225 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;Tractor.c,226 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;Tractor.c,227 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Tractor.c,228 :: 		TRISC=0x0F;
	MOVLW      15
	MOVWF      TRISC+0
;Tractor.c,229 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;Tractor.c,230 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;Tractor.c,233 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;Tractor.c,234 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;Tractor.c,236 :: 		TMR2_Initialize();
	CALL       _TMR2_Initialize+0
;Tractor.c,237 :: 		PWM3_Initialize();
	CALL       _PWM3_Initialize+0
;Tractor.c,239 :: 		for(i=0;i<6;i++) guc_cycle[i]=0;
	CLRF       sys_init_i_L0+0
L_sys_init95:
	MOVLW      6
	SUBWF      sys_init_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sys_init96
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
	GOTO       L_sys_init95
L_sys_init96:
;Tractor.c,240 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Tractor.c,241 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;Tractor.c,243 :: 		void main()
;Tractor.c,245 :: 		sys_init();
	CALL       _sys_init+0
;Tractor.c,246 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;Tractor.c,247 :: 		while(1)
L_main98:
;Tractor.c,249 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;Tractor.c,250 :: 		if(guc_choice>0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main100
;Tractor.c,251 :: 		exe_cond();               /*Execute the condtion*/
	CALL       _exe_cond+0
L_main100:
;Tractor.c,252 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;Tractor.c,254 :: 		if(demo_time>360)
	MOVF       _demo_time+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main466
	MOVF       _demo_time+0, 0
	SUBLW      104
L__main466:
	BTFSC      STATUS+0, 0
	GOTO       L_main101
;Tractor.c,256 :: 		while(1);
L_main102:
	GOTO       L_main102
;Tractor.c,257 :: 		}
L_main101:
;Tractor.c,259 :: 		}
	GOTO       L_main98
;Tractor.c,260 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
