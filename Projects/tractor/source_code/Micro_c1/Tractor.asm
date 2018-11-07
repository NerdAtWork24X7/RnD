
_interrupt:

;Tractor.c,22 :: 		void interrupt()
;Tractor.c,25 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)  /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt58:
;Tractor.c,27 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;Tractor.c,28 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;Tractor.c,31 :: 		}
L_interrupt3:
;Tractor.c,32 :: 		}
L_end_interrupt:
L__interrupt60:
	RETFIE     %s
; end of _interrupt

_check_cond:

;Tractor.c,34 :: 		void check_cond()
;Tractor.c,36 :: 		if(COND1) guc_choice=1;
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond62
	BSF        R0, 0
	GOTO       L__check_cond63
L__check_cond62:
	BCF        R0, 0
L__check_cond63:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond64
	BSF        3, 0
	GOTO       L__check_cond65
L__check_cond64:
	BCF        3, 0
L__check_cond65:
	BTFSS      R0, 0
	GOTO       L__check_cond66
	BTFSS      3, 0
	GOTO       L__check_cond66
	BSF        R0, 0
	GOTO       L__check_cond67
L__check_cond66:
	BCF        R0, 0
L__check_cond67:
	BTFSS      R0, 0
	GOTO       L__check_cond68
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond68
	BSF        3, 0
	GOTO       L__check_cond69
L__check_cond68:
	BCF        3, 0
L__check_cond69:
	BTFSS      3, 0
	GOTO       L__check_cond70
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond70
	BSF        R0, 0
	GOTO       L__check_cond71
L__check_cond70:
	BCF        R0, 0
L__check_cond71:
	BTFSS      R0, 0
	GOTO       L_check_cond4
	MOVLW      1
	MOVWF      _guc_choice+0
	GOTO       L_check_cond5
L_check_cond4:
;Tractor.c,37 :: 		else if(COND2) guc_choice=2;
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond72
	BSF        R0, 0
	GOTO       L__check_cond73
L__check_cond72:
	BCF        R0, 0
L__check_cond73:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond74
	BSF        3, 0
	GOTO       L__check_cond75
L__check_cond74:
	BCF        3, 0
L__check_cond75:
	BTFSS      R0, 0
	GOTO       L__check_cond76
	BTFSS      3, 0
	GOTO       L__check_cond76
	BSF        R0, 0
	GOTO       L__check_cond77
L__check_cond76:
	BCF        R0, 0
L__check_cond77:
	BTFSS      R0, 0
	GOTO       L__check_cond78
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond78
	BSF        R0, 0
	GOTO       L__check_cond79
L__check_cond78:
	BCF        R0, 0
L__check_cond79:
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond80
	BSF        3, 0
	GOTO       L__check_cond81
L__check_cond80:
	BCF        3, 0
L__check_cond81:
	BTFSS      R0, 0
	GOTO       L__check_cond82
	BTFSS      3, 0
	GOTO       L__check_cond82
	BSF        R0, 0
	GOTO       L__check_cond83
L__check_cond82:
	BCF        R0, 0
L__check_cond83:
	BTFSS      R0, 0
	GOTO       L_check_cond6
	MOVLW      2
	MOVWF      _guc_choice+0
	GOTO       L_check_cond7
L_check_cond6:
;Tractor.c,38 :: 		else if(COND3) guc_choice=3;
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond84
	BSF        3, 0
	GOTO       L__check_cond85
L__check_cond84:
	BCF        3, 0
L__check_cond85:
	BTFSS      3, 0
	GOTO       L__check_cond86
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond86
	BSF        R0, 0
	GOTO       L__check_cond87
L__check_cond86:
	BCF        R0, 0
L__check_cond87:
	BTFSS      R0, 0
	GOTO       L__check_cond88
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond88
	BSF        3, 0
	GOTO       L__check_cond89
L__check_cond88:
	BCF        3, 0
L__check_cond89:
	BTFSS      3, 0
	GOTO       L__check_cond90
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond90
	BSF        R0, 0
	GOTO       L__check_cond91
L__check_cond90:
	BCF        R0, 0
L__check_cond91:
	BTFSS      R0, 0
	GOTO       L_check_cond8
	MOVLW      3
	MOVWF      _guc_choice+0
	GOTO       L_check_cond9
L_check_cond8:
;Tractor.c,39 :: 		else if(COND4) guc_choice=3;
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond92
	BSF        3, 0
	GOTO       L__check_cond93
L__check_cond92:
	BCF        3, 0
L__check_cond93:
	BTFSS      3, 0
	GOTO       L__check_cond94
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond94
	BSF        R0, 0
	GOTO       L__check_cond95
L__check_cond94:
	BCF        R0, 0
L__check_cond95:
	BTFSS      R0, 0
	GOTO       L__check_cond96
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond96
	BSF        R0, 0
	GOTO       L__check_cond97
L__check_cond96:
	BCF        R0, 0
L__check_cond97:
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond98
	BSF        3, 0
	GOTO       L__check_cond99
L__check_cond98:
	BCF        3, 0
L__check_cond99:
	BTFSS      R0, 0
	GOTO       L__check_cond100
	BTFSS      3, 0
	GOTO       L__check_cond100
	BSF        R0, 0
	GOTO       L__check_cond101
L__check_cond100:
	BCF        R0, 0
L__check_cond101:
	BTFSS      R0, 0
	GOTO       L_check_cond10
	MOVLW      3
	MOVWF      _guc_choice+0
	GOTO       L_check_cond11
L_check_cond10:
;Tractor.c,40 :: 		else if(COND5) guc_choice=5;
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond102
	BSF        3, 0
	GOTO       L__check_cond103
L__check_cond102:
	BCF        3, 0
L__check_cond103:
	BTFSS      3, 0
	GOTO       L__check_cond104
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond104
	BSF        R0, 0
	GOTO       L__check_cond105
L__check_cond104:
	BCF        R0, 0
L__check_cond105:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond106
	BSF        3, 0
	GOTO       L__check_cond107
L__check_cond106:
	BCF        3, 0
L__check_cond107:
	BTFSS      R0, 0
	GOTO       L__check_cond108
	BTFSS      3, 0
	GOTO       L__check_cond108
	BSF        R0, 0
	GOTO       L__check_cond109
L__check_cond108:
	BCF        R0, 0
L__check_cond109:
	BTFSS      R0, 0
	GOTO       L__check_cond110
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond110
	BSF        3, 0
	GOTO       L__check_cond111
L__check_cond110:
	BCF        3, 0
L__check_cond111:
	BTFSS      3, 0
	GOTO       L_check_cond12
	MOVLW      5
	MOVWF      _guc_choice+0
	GOTO       L_check_cond13
L_check_cond12:
;Tractor.c,41 :: 		else if(COND6) guc_choice=5;
	BTFSC      PORTC+0, 0
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
	BTFSC      PORTC+0, 3
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
	GOTO       L_check_cond14
	MOVLW      5
	MOVWF      _guc_choice+0
L_check_cond14:
L_check_cond13:
L_check_cond11:
L_check_cond9:
L_check_cond7:
L_check_cond5:
;Tractor.c,42 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;Tractor.c,44 :: 		void exe_cond()
;Tractor.c,46 :: 		guc_sec=0;
	CLRF       _guc_sec+0
;Tractor.c,47 :: 		switch(guc_choice)
	GOTO       L_exe_cond15
;Tractor.c,49 :: 		case 1: while(guc_sec<2)
L_exe_cond17:
L_exe_cond18:
	MOVLW      2
	SUBWF      _guc_sec+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond19
;Tractor.c,51 :: 		if(COND2)
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond125
	BSF        R1, 0
	GOTO       L__exe_cond126
L__exe_cond125:
	BCF        R1, 0
L__exe_cond126:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond127
	BSF        3, 0
	GOTO       L__exe_cond128
L__exe_cond127:
	BCF        3, 0
L__exe_cond128:
	BTFSS      R1, 0
	GOTO       L__exe_cond129
	BTFSS      3, 0
	GOTO       L__exe_cond129
	BSF        R1, 0
	GOTO       L__exe_cond130
L__exe_cond129:
	BCF        R1, 0
L__exe_cond130:
	BTFSS      R1, 0
	GOTO       L__exe_cond131
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond131
	BSF        R1, 0
	GOTO       L__exe_cond132
L__exe_cond131:
	BCF        R1, 0
L__exe_cond132:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond133
	BSF        3, 0
	GOTO       L__exe_cond134
L__exe_cond133:
	BCF        3, 0
L__exe_cond134:
	BTFSS      R1, 0
	GOTO       L__exe_cond135
	BTFSS      3, 0
	GOTO       L__exe_cond135
	BSF        R1, 0
	GOTO       L__exe_cond136
L__exe_cond135:
	BCF        R1, 0
L__exe_cond136:
	BTFSS      R1, 0
	GOTO       L_exe_cond20
;Tractor.c,52 :: 		break;
	GOTO       L_exe_cond19
L_exe_cond20:
;Tractor.c,53 :: 		}
	GOTO       L_exe_cond18
L_exe_cond19:
;Tractor.c,54 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,55 :: 		while(COND1);
L_exe_cond21:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond137
	BSF        R1, 0
	GOTO       L__exe_cond138
L__exe_cond137:
	BCF        R1, 0
L__exe_cond138:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond139
	BSF        3, 0
	GOTO       L__exe_cond140
L__exe_cond139:
	BCF        3, 0
L__exe_cond140:
	BTFSS      R1, 0
	GOTO       L__exe_cond141
	BTFSS      3, 0
	GOTO       L__exe_cond141
	BSF        R1, 0
	GOTO       L__exe_cond142
L__exe_cond141:
	BCF        R1, 0
L__exe_cond142:
	BTFSS      R1, 0
	GOTO       L__exe_cond143
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond143
	BSF        3, 0
	GOTO       L__exe_cond144
L__exe_cond143:
	BCF        3, 0
L__exe_cond144:
	BTFSS      3, 0
	GOTO       L__exe_cond145
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond145
	BSF        R1, 0
	GOTO       L__exe_cond146
L__exe_cond145:
	BCF        R1, 0
L__exe_cond146:
	BTFSS      R1, 0
	GOTO       L_exe_cond22
	GOTO       L_exe_cond21
L_exe_cond22:
;Tractor.c,56 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,57 :: 		break;
	GOTO       L_exe_cond16
;Tractor.c,58 :: 		case 2: guc_buzz_state=1;
L_exe_cond23:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,59 :: 		while(COND2);
L_exe_cond24:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond147
	BSF        R1, 0
	GOTO       L__exe_cond148
L__exe_cond147:
	BCF        R1, 0
L__exe_cond148:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond149
	BSF        3, 0
	GOTO       L__exe_cond150
L__exe_cond149:
	BCF        3, 0
L__exe_cond150:
	BTFSS      R1, 0
	GOTO       L__exe_cond151
	BTFSS      3, 0
	GOTO       L__exe_cond151
	BSF        R1, 0
	GOTO       L__exe_cond152
L__exe_cond151:
	BCF        R1, 0
L__exe_cond152:
	BTFSS      R1, 0
	GOTO       L__exe_cond153
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond153
	BSF        R1, 0
	GOTO       L__exe_cond154
L__exe_cond153:
	BCF        R1, 0
L__exe_cond154:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond155
	BSF        3, 0
	GOTO       L__exe_cond156
L__exe_cond155:
	BCF        3, 0
L__exe_cond156:
	BTFSS      R1, 0
	GOTO       L__exe_cond157
	BTFSS      3, 0
	GOTO       L__exe_cond157
	BSF        R1, 0
	GOTO       L__exe_cond158
L__exe_cond157:
	BCF        R1, 0
L__exe_cond158:
	BTFSS      R1, 0
	GOTO       L_exe_cond25
	GOTO       L_exe_cond24
L_exe_cond25:
;Tractor.c,60 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,61 :: 		break;
	GOTO       L_exe_cond16
;Tractor.c,62 :: 		case 3: while(guc_sec<3)
L_exe_cond26:
L_exe_cond27:
	MOVLW      3
	SUBWF      _guc_sec+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond28
;Tractor.c,64 :: 		if(COND2)
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond159
	BSF        R1, 0
	GOTO       L__exe_cond160
L__exe_cond159:
	BCF        R1, 0
L__exe_cond160:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond161
	BSF        3, 0
	GOTO       L__exe_cond162
L__exe_cond161:
	BCF        3, 0
L__exe_cond162:
	BTFSS      R1, 0
	GOTO       L__exe_cond163
	BTFSS      3, 0
	GOTO       L__exe_cond163
	BSF        R1, 0
	GOTO       L__exe_cond164
L__exe_cond163:
	BCF        R1, 0
L__exe_cond164:
	BTFSS      R1, 0
	GOTO       L__exe_cond165
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond165
	BSF        R1, 0
	GOTO       L__exe_cond166
L__exe_cond165:
	BCF        R1, 0
L__exe_cond166:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond167
	BSF        3, 0
	GOTO       L__exe_cond168
L__exe_cond167:
	BCF        3, 0
L__exe_cond168:
	BTFSS      R1, 0
	GOTO       L__exe_cond169
	BTFSS      3, 0
	GOTO       L__exe_cond169
	BSF        R1, 0
	GOTO       L__exe_cond170
L__exe_cond169:
	BCF        R1, 0
L__exe_cond170:
	BTFSS      R1, 0
	GOTO       L_exe_cond29
;Tractor.c,65 :: 		break;
	GOTO       L_exe_cond28
L_exe_cond29:
;Tractor.c,66 :: 		}
	GOTO       L_exe_cond27
L_exe_cond28:
;Tractor.c,67 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,68 :: 		guc_sec=0;
	CLRF       _guc_sec+0
;Tractor.c,69 :: 		while(guc_sec<5)
L_exe_cond30:
	MOVLW      5
	SUBWF      _guc_sec+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond31
;Tractor.c,71 :: 		if(COND2)
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond171
	BSF        R1, 0
	GOTO       L__exe_cond172
L__exe_cond171:
	BCF        R1, 0
L__exe_cond172:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond173
	BSF        3, 0
	GOTO       L__exe_cond174
L__exe_cond173:
	BCF        3, 0
L__exe_cond174:
	BTFSS      R1, 0
	GOTO       L__exe_cond175
	BTFSS      3, 0
	GOTO       L__exe_cond175
	BSF        R1, 0
	GOTO       L__exe_cond176
L__exe_cond175:
	BCF        R1, 0
L__exe_cond176:
	BTFSS      R1, 0
	GOTO       L__exe_cond177
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond177
	BSF        R1, 0
	GOTO       L__exe_cond178
L__exe_cond177:
	BCF        R1, 0
L__exe_cond178:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond179
	BSF        3, 0
	GOTO       L__exe_cond180
L__exe_cond179:
	BCF        3, 0
L__exe_cond180:
	BTFSS      R1, 0
	GOTO       L__exe_cond181
	BTFSS      3, 0
	GOTO       L__exe_cond181
	BSF        R1, 0
	GOTO       L__exe_cond182
L__exe_cond181:
	BCF        R1, 0
L__exe_cond182:
	BTFSS      R1, 0
	GOTO       L_exe_cond32
;Tractor.c,72 :: 		break;
	GOTO       L_exe_cond31
L_exe_cond32:
;Tractor.c,73 :: 		}
	GOTO       L_exe_cond30
L_exe_cond31:
;Tractor.c,74 :: 		guc_buzz_state=0;guc_sec=0;
	CLRF       _guc_buzz_state+0
	CLRF       _guc_sec+0
;Tractor.c,75 :: 		RELAY = 1;
	BSF        PORTC+0, 4
;Tractor.c,76 :: 		while(guc_sec<5)
L_exe_cond33:
	MOVLW      5
	SUBWF      _guc_sec+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond34
;Tractor.c,78 :: 		if(COND2)
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond183
	BSF        R1, 0
	GOTO       L__exe_cond184
L__exe_cond183:
	BCF        R1, 0
L__exe_cond184:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond185
	BSF        3, 0
	GOTO       L__exe_cond186
L__exe_cond185:
	BCF        3, 0
L__exe_cond186:
	BTFSS      R1, 0
	GOTO       L__exe_cond187
	BTFSS      3, 0
	GOTO       L__exe_cond187
	BSF        R1, 0
	GOTO       L__exe_cond188
L__exe_cond187:
	BCF        R1, 0
L__exe_cond188:
	BTFSS      R1, 0
	GOTO       L__exe_cond189
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond189
	BSF        R1, 0
	GOTO       L__exe_cond190
L__exe_cond189:
	BCF        R1, 0
L__exe_cond190:
	BTFSC      PORTC+0, 3
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
	GOTO       L_exe_cond35
;Tractor.c,79 :: 		break;
	GOTO       L_exe_cond34
L_exe_cond35:
;Tractor.c,80 :: 		}
	GOTO       L_exe_cond33
L_exe_cond34:
;Tractor.c,81 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;Tractor.c,82 :: 		break;
	GOTO       L_exe_cond16
;Tractor.c,83 :: 		case 5: while(guc_sec<3)
L_exe_cond36:
L_exe_cond37:
	MOVLW      3
	SUBWF      _guc_sec+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond38
;Tractor.c,85 :: 		if(COND2)
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond195
	BSF        R1, 0
	GOTO       L__exe_cond196
L__exe_cond195:
	BCF        R1, 0
L__exe_cond196:
	BTFSC      PORTC+0, 1
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
	BTFSS      R1, 0
	GOTO       L__exe_cond201
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond201
	BSF        R1, 0
	GOTO       L__exe_cond202
L__exe_cond201:
	BCF        R1, 0
L__exe_cond202:
	BTFSC      PORTC+0, 3
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
	GOTO       L_exe_cond39
;Tractor.c,86 :: 		break;
	GOTO       L_exe_cond38
L_exe_cond39:
;Tractor.c,87 :: 		}
	GOTO       L_exe_cond37
L_exe_cond38:
;Tractor.c,88 :: 		guc_buzz_state=1;guc_sec=0;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	CLRF       _guc_sec+0
;Tractor.c,89 :: 		while(guc_sec<7)
L_exe_cond40:
	MOVLW      7
	SUBWF      _guc_sec+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond41
;Tractor.c,91 :: 		if(COND2)
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond207
	BSF        R1, 0
	GOTO       L__exe_cond208
L__exe_cond207:
	BCF        R1, 0
L__exe_cond208:
	BTFSC      PORTC+0, 1
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
	GOTO       L__exe_cond213
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond213
	BSF        R1, 0
	GOTO       L__exe_cond214
L__exe_cond213:
	BCF        R1, 0
L__exe_cond214:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond215
	BSF        3, 0
	GOTO       L__exe_cond216
L__exe_cond215:
	BCF        3, 0
L__exe_cond216:
	BTFSS      R1, 0
	GOTO       L__exe_cond217
	BTFSS      3, 0
	GOTO       L__exe_cond217
	BSF        R1, 0
	GOTO       L__exe_cond218
L__exe_cond217:
	BCF        R1, 0
L__exe_cond218:
	BTFSS      R1, 0
	GOTO       L_exe_cond42
;Tractor.c,92 :: 		break;
	GOTO       L_exe_cond41
L_exe_cond42:
;Tractor.c,93 :: 		}
	GOTO       L_exe_cond40
L_exe_cond41:
;Tractor.c,94 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,95 :: 		break;
	GOTO       L_exe_cond16
;Tractor.c,97 :: 		default: guc_choice=0;
L_exe_cond43:
	CLRF       _guc_choice+0
;Tractor.c,98 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,99 :: 		break;
	GOTO       L_exe_cond16
;Tractor.c,100 :: 		}
L_exe_cond15:
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond17
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond23
	MOVF       _guc_choice+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond26
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond36
	GOTO       L_exe_cond43
L_exe_cond16:
;Tractor.c,101 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_init_PWM:

;Tractor.c,103 :: 		void init_PWM()
;Tractor.c,105 :: 		uint16 dutyValue=57;
	MOVLW      57
	MOVWF      init_PWM_dutyValue_L0+0
	MOVLW      0
	MOVWF      init_PWM_dutyValue_L0+1
;Tractor.c,106 :: 		CCPR3L = 0x0E;
	MOVLW      14
	MOVWF      CCPR3L+0
;Tractor.c,107 :: 		CCPR3H = 0x00;
	CLRF       CCPR3H+0
;Tractor.c,108 :: 		C3TSEL0_bit = 0x00;
	BCF        C3TSEL0_bit+0, BitPos(C3TSEL0_bit+0)
;Tractor.c,109 :: 		CCPR3L = (uint8)((dutyValue & 0x03FC)>>2) ;
	MOVLW      252
	ANDWF      init_PWM_dutyValue_L0+0, 0
	MOVWF      R3
	MOVF       init_PWM_dutyValue_L0+1, 0
	ANDLW      3
	MOVWF      R4
	MOVF       R3, 0
	MOVWF      R0
	MOVF       R4, 0
	MOVWF      R1
	LSRF       R1, 1
	RRF        R0, 1
	LSRF       R1, 1
	RRF        R0, 1
	MOVF       R0, 0
	MOVWF      CCPR3L+0
;Tractor.c,111 :: 		}
L_end_init_PWM:
	RETURN
; end of _init_PWM

_Check_Demo:

;Tractor.c,114 :: 		void Check_Demo()
;Tractor.c,117 :: 		WDTCON = 0x16;   /*WDTPS 1:65536; SWDTEN OFF; */
	MOVLW      22
	MOVWF      WDTCON+0
;Tractor.c,118 :: 		Demo=DATAEE_ReadByte(DEMO_ADDR);
	MOVLW      64
	MOVWF      FARG_DATAEE_ReadByte_bAdd+0
	CALL       _DATAEE_ReadByte+0
	MOVF       R0, 0
	MOVWF      _Demo+0
;Tractor.c,119 :: 		if(Demo==0xFF)
	MOVF       R0, 0
	XORLW      255
	BTFSS      STATUS+0, 2
	GOTO       L_Check_Demo44
;Tractor.c,121 :: 		Demo=0;
	CLRF       _Demo+0
;Tractor.c,122 :: 		}
L_Check_Demo44:
;Tractor.c,123 :: 		if(Demo>250) { while(1); }
	MOVF       _Demo+0, 0
	SUBLW      250
	BTFSC      STATUS+0, 0
	GOTO       L_Check_Demo45
L_Check_Demo46:
	GOTO       L_Check_Demo46
L_Check_Demo45:
;Tractor.c,126 :: 		Demo++;
	INCF       _Demo+0, 1
;Tractor.c,127 :: 		DATAEE_WriteByte(DEMO_ADDR,Demo);
	MOVLW      64
	MOVWF      FARG_DATAEE_WriteByte_bAdd+0
	MOVF       _Demo+0, 0
	MOVWF      FARG_DATAEE_WriteByte_bData+0
	CALL       _DATAEE_WriteByte+0
;Tractor.c,129 :: 		}
L_end_Check_Demo:
	RETURN
; end of _Check_Demo

_my_delay:

;Tractor.c,131 :: 		void my_delay()
;Tractor.c,134 :: 		for(i=0;i<10;i++)
	CLRF       R2+0
	CLRF       R2+1
L_my_delay49:
	MOVLW      0
	SUBWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay222
	MOVLW      10
	SUBWF      R2+0, 0
L__my_delay222:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay50
;Tractor.c,135 :: 		for(j=0;j<4000;j++)
	CLRF       R4+0
	CLRF       R4+1
L_my_delay52:
	MOVLW      15
	SUBWF      R4+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay223
	MOVLW      160
	SUBWF      R4+0, 0
L__my_delay223:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay53
;Tractor.c,136 :: 		asm CLRWDT ;
	CLRWDT
;Tractor.c,135 :: 		for(j=0;j<4000;j++)
	MOVLW      1
	ADDWF      R4+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     R4+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      R4+0
	MOVF       R1, 0
	MOVWF      R4+1
;Tractor.c,136 :: 		asm CLRWDT ;
	GOTO       L_my_delay52
L_my_delay53:
;Tractor.c,134 :: 		for(i=0;i<10;i++)
	MOVLW      1
	ADDWF      R2+0, 0
	MOVWF      R0
	MOVLW      0
	ADDWFC     R2+1, 0
	MOVWF      R1
	MOVF       R0, 0
	MOVWF      R2+0
	MOVF       R1, 0
	MOVWF      R2+1
;Tractor.c,136 :: 		asm CLRWDT ;
	GOTO       L_my_delay49
L_my_delay50:
;Tractor.c,137 :: 		}
L_end_my_delay:
	RETURN
; end of _my_delay

_sys_init:

;Tractor.c,140 :: 		void sys_init()
;Tractor.c,142 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;Tractor.c,144 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;Tractor.c,145 :: 		RELAY = 0;
	BCF        PORTC+0, 4
;Tractor.c,146 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;Tractor.c,147 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;Tractor.c,148 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Tractor.c,149 :: 		TRISC=0x0F;
	MOVLW      15
	MOVWF      TRISC+0
;Tractor.c,150 :: 		Check_Demo();
	CALL       _Check_Demo+0
;Tractor.c,151 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;Tractor.c,152 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;Tractor.c,154 :: 		TMR2_Initialize();
	CALL       _TMR2_Initialize+0
;Tractor.c,155 :: 		PWM3_Initialize();
	CALL       _PWM3_Initialize+0
;Tractor.c,157 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Tractor.c,158 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;Tractor.c,160 :: 		void main()
;Tractor.c,162 :: 		sys_init();
	CALL       _sys_init+0
;Tractor.c,163 :: 		while(1)
L_main55:
;Tractor.c,166 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;Tractor.c,167 :: 		if(guc_choice>0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main57
;Tractor.c,168 :: 		exe_cond();               /*Execute the condtion*/
	CALL       _exe_cond+0
L_main57:
;Tractor.c,169 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;Tractor.c,170 :: 		}
	GOTO       L_main55
;Tractor.c,172 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
