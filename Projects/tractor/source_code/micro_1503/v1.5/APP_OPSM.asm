
_interrupt:

;APP_OPSM.c,14 :: 		void interrupt()
;APP_OPSM.c,16 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt68:
;APP_OPSM.c,18 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,27 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;APP_OPSM.c,30 :: 		}
L_interrupt3:
;APP_OPSM.c,31 :: 		}
L_end_interrupt:
L__interrupt73:
	RETFIE     %s
; end of _interrupt

_CHCK_COND:

;APP_OPSM.c,33 :: 		void CHCK_COND(uint8 x)
;APP_OPSM.c,36 :: 		guc_deb[x]++;
	MOVLW      _guc_deb+0
	MOVWF      R1
	MOVLW      hi_addr(_guc_deb+0)
	MOVWF      R2
	MOVF       FARG_CHCK_COND_x+0, 0
	ADDWF      R1, 1
	BTFSC      STATUS+0, 0
	INCF       R2, 1
	MOVF       R1, 0
	MOVWF      FSR0L
	MOVF       R2, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      R0
	INCF       R0, 1
	MOVF       R1, 0
	MOVWF      FSR1L
	MOVF       R2, 0
	MOVWF      FSR1H
	MOVF       R0, 0
	MOVWF      INDF1+0
;APP_OPSM.c,37 :: 		for(i=0;i<=TOTAL_COND && i!=x;i++){guc_deb[i] = 0;}
	CLRF       R3+0
L_CHCK_COND4:
	MOVF       R3+0, 0
	SUBLW      16
	BTFSS      STATUS+0, 0
	GOTO       L_CHCK_COND5
	MOVF       R3+0, 0
	XORWF      FARG_CHCK_COND_x+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CHCK_COND5
L__CHCK_COND69:
	MOVLW      _guc_deb+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_guc_deb+0)
	MOVWF      FSR1H
	MOVF       R3+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	CLRF       INDF1+0
	INCF       R3+0, 1
	GOTO       L_CHCK_COND4
L_CHCK_COND5:
;APP_OPSM.c,38 :: 		if(guc_deb[x] > DEBO_TIME){ guc_choice = x; guc_deb[x] = 0;}
	MOVLW      _guc_deb+0
	MOVWF      FSR0L
	MOVLW      hi_addr(_guc_deb+0)
	MOVWF      FSR0H
	MOVF       FARG_CHCK_COND_x+0, 0
	ADDWF      FSR0L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR0H, 1
	MOVF       INDF0+0, 0
	MOVWF      R1
	MOVF       R1, 0
	SUBLW      10
	BTFSC      STATUS+0, 0
	GOTO       L_CHCK_COND9
	MOVF       FARG_CHCK_COND_x+0, 0
	MOVWF      _guc_choice+0
	MOVLW      _guc_deb+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_guc_deb+0)
	MOVWF      FSR1H
	MOVF       FARG_CHCK_COND_x+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
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
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond76
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond76
	BSF        3, 0
	GOTO       L__check_cond77
L__check_cond76:
	BCF        3, 0
L__check_cond77:
	BTFSS      3, 0
	GOTO       L__check_cond78
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond78
	BSF        R0, 0
	GOTO       L__check_cond79
L__check_cond78:
	BCF        R0, 0
L__check_cond79:
	BTFSS      R0, 0
	GOTO       L__check_cond80
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond80
	BSF        3, 0
	GOTO       L__check_cond81
L__check_cond80:
	BCF        3, 0
L__check_cond81:
	BTFSS      3, 0
	GOTO       L_check_cond10
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond11
L_check_cond10:
;APP_OPSM.c,46 :: 		else if(COND2){ CHCK_COND(2); }
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond82
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond82
	BSF        3, 0
	GOTO       L__check_cond83
L__check_cond82:
	BCF        3, 0
L__check_cond83:
	BTFSS      3, 0
	GOTO       L__check_cond84
	BTFSS      PORTC+0, 1
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
	GOTO       L_check_cond12
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond13
L_check_cond12:
;APP_OPSM.c,47 :: 		else if(COND3){ CHCK_COND(3); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond90
	BSF        3, 0
	GOTO       L__check_cond91
L__check_cond90:
	BCF        3, 0
L__check_cond91:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond92
	BTFSS      3, 0
	GOTO       L__check_cond92
	BSF        R0, 0
	GOTO       L__check_cond93
L__check_cond92:
	BCF        R0, 0
L__check_cond93:
	BTFSS      R0, 0
	GOTO       L__check_cond94
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond94
	BSF        3, 0
	GOTO       L__check_cond95
L__check_cond94:
	BCF        3, 0
L__check_cond95:
	BTFSS      3, 0
	GOTO       L__check_cond96
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond96
	BSF        R0, 0
	GOTO       L__check_cond97
L__check_cond96:
	BCF        R0, 0
L__check_cond97:
	BTFSS      R0, 0
	GOTO       L_check_cond14
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond15
L_check_cond14:
;APP_OPSM.c,48 :: 		else if(COND4){ CHCK_COND(4); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond98
	BSF        3, 0
	GOTO       L__check_cond99
L__check_cond98:
	BCF        3, 0
L__check_cond99:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond100
	BTFSS      3, 0
	GOTO       L__check_cond100
	BSF        R0, 0
	GOTO       L__check_cond101
L__check_cond100:
	BCF        R0, 0
L__check_cond101:
	BTFSS      R0, 0
	GOTO       L__check_cond102
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond102
	BSF        R0, 0
	GOTO       L__check_cond103
L__check_cond102:
	BCF        R0, 0
L__check_cond103:
	BTFSC      PORTC+0, 0
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
	BTFSS      R0, 0
	GOTO       L_check_cond16
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond17
L_check_cond16:
;APP_OPSM.c,49 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond108
	BTFSS      PORTC+0, 2
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
	BTFSS      R0, 0
	GOTO       L__check_cond114
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond114
	BSF        3, 0
	GOTO       L__check_cond115
L__check_cond114:
	BCF        3, 0
L__check_cond115:
	BTFSS      3, 0
	GOTO       L_check_cond18
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond19
L_check_cond18:
;APP_OPSM.c,50 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond116
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond116
	BSF        R0, 0
	GOTO       L__check_cond117
L__check_cond116:
	BCF        R0, 0
L__check_cond117:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond118
	BSF        3, 0
	GOTO       L__check_cond119
L__check_cond118:
	BCF        3, 0
L__check_cond119:
	BTFSS      R0, 0
	GOTO       L__check_cond120
	BTFSS      3, 0
	GOTO       L__check_cond120
	BSF        R0, 0
	GOTO       L__check_cond121
L__check_cond120:
	BCF        R0, 0
L__check_cond121:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond122
	BSF        3, 0
	GOTO       L__check_cond123
L__check_cond122:
	BCF        3, 0
L__check_cond123:
	BTFSS      R0, 0
	GOTO       L__check_cond124
	BTFSS      3, 0
	GOTO       L__check_cond124
	BSF        R0, 0
	GOTO       L__check_cond125
L__check_cond124:
	BCF        R0, 0
L__check_cond125:
	BTFSS      R0, 0
	GOTO       L_check_cond20
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond21
L_check_cond20:
;APP_OPSM.c,51 :: 		else if(COND7){ CHCK_COND(7); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond126
	BSF        3, 0
	GOTO       L__check_cond127
L__check_cond126:
	BCF        3, 0
L__check_cond127:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond128
	BTFSS      3, 0
	GOTO       L__check_cond128
	BSF        R0, 0
	GOTO       L__check_cond129
L__check_cond128:
	BCF        R0, 0
L__check_cond129:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond130
	BSF        3, 0
	GOTO       L__check_cond131
L__check_cond130:
	BCF        3, 0
L__check_cond131:
	BTFSS      R0, 0
	GOTO       L__check_cond132
	BTFSS      3, 0
	GOTO       L__check_cond132
	BSF        R0, 0
	GOTO       L__check_cond133
L__check_cond132:
	BCF        R0, 0
L__check_cond133:
	BTFSS      R0, 0
	GOTO       L__check_cond134
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond134
	BSF        3, 0
	GOTO       L__check_cond135
L__check_cond134:
	BCF        3, 0
L__check_cond135:
	BTFSS      3, 0
	GOTO       L_check_cond22
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond23
L_check_cond22:
;APP_OPSM.c,52 :: 		else if(COND8){ CHCK_COND(8); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond136
	BSF        3, 0
	GOTO       L__check_cond137
L__check_cond136:
	BCF        3, 0
L__check_cond137:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond138
	BTFSS      3, 0
	GOTO       L__check_cond138
	BSF        R0, 0
	GOTO       L__check_cond139
L__check_cond138:
	BCF        R0, 0
L__check_cond139:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond140
	BSF        3, 0
	GOTO       L__check_cond141
L__check_cond140:
	BCF        3, 0
L__check_cond141:
	BTFSS      R0, 0
	GOTO       L__check_cond142
	BTFSS      3, 0
	GOTO       L__check_cond142
	BSF        R0, 0
	GOTO       L__check_cond143
L__check_cond142:
	BCF        R0, 0
L__check_cond143:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond144
	BSF        3, 0
	GOTO       L__check_cond145
L__check_cond144:
	BCF        3, 0
L__check_cond145:
	BTFSS      R0, 0
	GOTO       L__check_cond146
	BTFSS      3, 0
	GOTO       L__check_cond146
	BSF        R0, 0
	GOTO       L__check_cond147
L__check_cond146:
	BCF        R0, 0
L__check_cond147:
	BTFSS      R0, 0
	GOTO       L_check_cond24
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond25
L_check_cond24:
;APP_OPSM.c,53 :: 		else if(COND9){ CHCK_COND(9); }
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
	BSF        R0, 0
	GOTO       L__check_cond151
L__check_cond150:
	BCF        R0, 0
L__check_cond151:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond152
	BSF        3, 0
	GOTO       L__check_cond153
L__check_cond152:
	BCF        3, 0
L__check_cond153:
	BTFSS      R0, 0
	GOTO       L__check_cond154
	BTFSS      3, 0
	GOTO       L__check_cond154
	BSF        R0, 0
	GOTO       L__check_cond155
L__check_cond154:
	BCF        R0, 0
L__check_cond155:
	BTFSS      R0, 0
	GOTO       L__check_cond156
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond156
	BSF        3, 0
	GOTO       L__check_cond157
L__check_cond156:
	BCF        3, 0
L__check_cond157:
	BTFSS      3, 0
	GOTO       L_check_cond26
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond27
L_check_cond26:
;APP_OPSM.c,54 :: 		else if(COND10){ CHCK_COND(10); }
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond158
	BSF        3, 0
	GOTO       L__check_cond159
L__check_cond158:
	BCF        3, 0
L__check_cond159:
	BTFSS      3, 0
	GOTO       L__check_cond160
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond160
	BSF        R0, 0
	GOTO       L__check_cond161
L__check_cond160:
	BCF        R0, 0
L__check_cond161:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond162
	BSF        3, 0
	GOTO       L__check_cond163
L__check_cond162:
	BCF        3, 0
L__check_cond163:
	BTFSS      R0, 0
	GOTO       L__check_cond164
	BTFSS      3, 0
	GOTO       L__check_cond164
	BSF        R0, 0
	GOTO       L__check_cond165
L__check_cond164:
	BCF        R0, 0
L__check_cond165:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond166
	BSF        3, 0
	GOTO       L__check_cond167
L__check_cond166:
	BCF        3, 0
L__check_cond167:
	BTFSS      R0, 0
	GOTO       L__check_cond168
	BTFSS      3, 0
	GOTO       L__check_cond168
	BSF        R0, 0
	GOTO       L__check_cond169
L__check_cond168:
	BCF        R0, 0
L__check_cond169:
	BTFSS      R0, 0
	GOTO       L_check_cond28
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond29
L_check_cond28:
;APP_OPSM.c,55 :: 		else if(COND11){ CHCK_COND(11); }
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond170
	BSF        R0, 0
	GOTO       L__check_cond171
L__check_cond170:
	BCF        R0, 0
L__check_cond171:
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond176
	BSF        3, 0
	GOTO       L__check_cond177
L__check_cond176:
	BCF        3, 0
L__check_cond177:
	BTFSS      R0, 0
	GOTO       L__check_cond178
	BTFSS      3, 0
	GOTO       L__check_cond178
	BSF        R0, 0
	GOTO       L__check_cond179
L__check_cond178:
	BCF        R0, 0
L__check_cond179:
	BTFSS      R0, 0
	GOTO       L__check_cond180
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond180
	BSF        3, 0
	GOTO       L__check_cond181
L__check_cond180:
	BCF        3, 0
L__check_cond181:
	BTFSS      3, 0
	GOTO       L_check_cond30
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond31
L_check_cond30:
;APP_OPSM.c,56 :: 		else if(COND12){ CHCK_COND(12); }
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond182
	BSF        R0, 0
	GOTO       L__check_cond183
L__check_cond182:
	BCF        R0, 0
L__check_cond183:
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond188
	BSF        3, 0
	GOTO       L__check_cond189
L__check_cond188:
	BCF        3, 0
L__check_cond189:
	BTFSS      R0, 0
	GOTO       L__check_cond190
	BTFSS      3, 0
	GOTO       L__check_cond190
	BSF        R0, 0
	GOTO       L__check_cond191
L__check_cond190:
	BCF        R0, 0
L__check_cond191:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond192
	BSF        3, 0
	GOTO       L__check_cond193
L__check_cond192:
	BCF        3, 0
L__check_cond193:
	BTFSS      R0, 0
	GOTO       L__check_cond194
	BTFSS      3, 0
	GOTO       L__check_cond194
	BSF        R0, 0
	GOTO       L__check_cond195
L__check_cond194:
	BCF        R0, 0
L__check_cond195:
	BTFSS      R0, 0
	GOTO       L_check_cond32
	MOVLW      12
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond33
L_check_cond32:
;APP_OPSM.c,57 :: 		else if(COND13){ CHCK_COND(13); }
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond196
	BSF        3, 0
	GOTO       L__check_cond197
L__check_cond196:
	BCF        3, 0
L__check_cond197:
	BTFSS      3, 0
	GOTO       L__check_cond198
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond198
	BSF        R0, 0
	GOTO       L__check_cond199
L__check_cond198:
	BCF        R0, 0
L__check_cond199:
	BTFSS      R0, 0
	GOTO       L__check_cond200
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond200
	BSF        3, 0
	GOTO       L__check_cond201
L__check_cond200:
	BCF        3, 0
L__check_cond201:
	BTFSS      3, 0
	GOTO       L__check_cond202
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond202
	BSF        R0, 0
	GOTO       L__check_cond203
L__check_cond202:
	BCF        R0, 0
L__check_cond203:
	BTFSS      R0, 0
	GOTO       L_check_cond34
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond35
L_check_cond34:
;APP_OPSM.c,58 :: 		else {guc_choice = 14;}
	MOVLW      14
	MOVWF      _guc_choice+0
L_check_cond35:
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
;APP_OPSM.c,60 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,62 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;APP_OPSM.c,64 :: 		void exe_cond()
;APP_OPSM.c,66 :: 		if(guc_choice == 1 || guc_choice == 2 || guc_choice == 3
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
	MOVF       _guc_choice+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
;APP_OPSM.c,67 :: 		|| guc_choice == 4 || guc_choice == 5 ){guc_buzz_state=1;}
	MOVF       _guc_choice+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
	GOTO       L_exe_cond38
L__exe_cond71:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond39
L_exe_cond38:
;APP_OPSM.c,68 :: 		else { guc_buzz_state=0;}
	CLRF       _guc_buzz_state+0
L_exe_cond39:
;APP_OPSM.c,70 :: 		if( guc_choice == 6 || guc_choice == 7 || guc_choice == 8
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond70
	MOVF       _guc_choice+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond70
	MOVF       _guc_choice+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond70
;APP_OPSM.c,71 :: 		|| guc_choice == 9 || guc_choice == 10 || guc_choice == 11
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond70
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond70
	MOVF       _guc_choice+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond70
;APP_OPSM.c,72 :: 		|| guc_choice == 12 )
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond70
	GOTO       L_exe_cond42
L__exe_cond70:
;APP_OPSM.c,73 :: 		{P_IND = 1;}
	BSF        PORTC+0, 4
	GOTO       L_exe_cond43
L_exe_cond42:
;APP_OPSM.c,74 :: 		else { P_IND = 0;}
	BCF        PORTC+0, 4
L_exe_cond43:
;APP_OPSM.c,82 :: 		if(guc_choice == 2)
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond44
;APP_OPSM.c,84 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond45:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond205
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond205:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond46
	GOTO       L_exe_cond45
L_exe_cond46:
;APP_OPSM.c,85 :: 		RELAY_SOL = 0;rel_lock = 1;
	BCF        PORTC+0, 5
	MOVLW      1
	MOVWF      _rel_lock+0
;APP_OPSM.c,86 :: 		while(COND2)asm CLRWDT ;
L_exe_cond47:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond206
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond206
	BSF        3, 0
	GOTO       L__exe_cond207
L__exe_cond206:
	BCF        3, 0
L__exe_cond207:
	BTFSS      3, 0
	GOTO       L__exe_cond208
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond208
	BSF        R1, 0
	GOTO       L__exe_cond209
L__exe_cond208:
	BCF        R1, 0
L__exe_cond209:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond210
	BSF        3, 0
	GOTO       L__exe_cond211
L__exe_cond210:
	BCF        3, 0
L__exe_cond211:
	BTFSS      R1, 0
	GOTO       L__exe_cond212
	BTFSS      3, 0
	GOTO       L__exe_cond212
	BSF        R1, 0
	GOTO       L__exe_cond213
L__exe_cond212:
	BCF        R1, 0
L__exe_cond213:
	BTFSS      R1, 0
	GOTO       L_exe_cond48
	CLRWDT
	GOTO       L_exe_cond47
L_exe_cond48:
;APP_OPSM.c,87 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,88 :: 		}
	GOTO       L_exe_cond49
L_exe_cond44:
;APP_OPSM.c,89 :: 		else if(guc_choice == 6)
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond50
;APP_OPSM.c,92 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond51:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond214
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond214:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond52
	GOTO       L_exe_cond51
L_exe_cond52:
;APP_OPSM.c,93 :: 		RELAY_SOL = 0;rel_lock = 1;
	BCF        PORTC+0, 5
	MOVLW      1
	MOVWF      _rel_lock+0
;APP_OPSM.c,94 :: 		while(COND6)asm CLRWDT ;
L_exe_cond53:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond215
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond215
	BSF        R1, 0
	GOTO       L__exe_cond216
L__exe_cond215:
	BCF        R1, 0
L__exe_cond216:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond217
	BSF        3, 0
	GOTO       L__exe_cond218
L__exe_cond217:
	BCF        3, 0
L__exe_cond218:
	BTFSS      R1, 0
	GOTO       L__exe_cond219
	BTFSS      3, 0
	GOTO       L__exe_cond219
	BSF        R1, 0
	GOTO       L__exe_cond220
L__exe_cond219:
	BCF        R1, 0
L__exe_cond220:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond221
	BSF        3, 0
	GOTO       L__exe_cond222
L__exe_cond221:
	BCF        3, 0
L__exe_cond222:
	BTFSS      R1, 0
	GOTO       L__exe_cond223
	BTFSS      3, 0
	GOTO       L__exe_cond223
	BSF        R1, 0
	GOTO       L__exe_cond224
L__exe_cond223:
	BCF        R1, 0
L__exe_cond224:
	BTFSS      R1, 0
	GOTO       L_exe_cond54
	CLRWDT
	GOTO       L_exe_cond53
L_exe_cond54:
;APP_OPSM.c,95 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,96 :: 		}
	GOTO       L_exe_cond55
L_exe_cond50:
;APP_OPSM.c,97 :: 		else { RELAY_SOL = 0;}
	BCF        PORTC+0, 5
L_exe_cond55:
L_exe_cond49:
;APP_OPSM.c,99 :: 		if (guc_choice == 14)
	MOVF       _guc_choice+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond56
;APP_OPSM.c,101 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,102 :: 		P_IND = 0;
	BCF        PORTC+0, 4
;APP_OPSM.c,103 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,104 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,105 :: 		}
L_exe_cond56:
;APP_OPSM.c,106 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,109 :: 		void sys_init()
;APP_OPSM.c,112 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,114 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,115 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,116 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,117 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,119 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,120 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,121 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,122 :: 		TRISC = 0x0F;
	MOVLW      15
	MOVWF      TRISC+0
;APP_OPSM.c,124 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,125 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,128 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,129 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,140 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,145 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_process_uart:

;APP_OPSM.c,147 :: 		void process_uart()
;APP_OPSM.c,149 :: 		if(!ENGINE_SENSE) Diag_data_var.diag_engine_sense = 1;
	BTFSC      PORTC+0, 0
	GOTO       L_process_uart57
	BSF        _Diag_data_var+0, 0
L_process_uart57:
;APP_OPSM.c,150 :: 		if(!HAND_BRAKE)  Diag_data_var.diag_hand_brake = 1;
	BTFSC      PORTC+0, 1
	GOTO       L_process_uart58
	BSF        _Diag_data_var+0, 1
L_process_uart58:
;APP_OPSM.c,151 :: 		if(!PTO)         Diag_data_var.diag_pto = 1;
	BTFSC      PORTC+0, 2
	GOTO       L_process_uart59
	BSF        _Diag_data_var+0, 2
L_process_uart59:
;APP_OPSM.c,152 :: 		if(!SEAT_SWITCH) Diag_data_var.diag_seat_switch = 1;
	BTFSC      PORTC+0, 3
	GOTO       L_process_uart60
	BSF        _Diag_data_var+0, 3
L_process_uart60:
;APP_OPSM.c,153 :: 		if(P_IND)       Diag_data_var.diag_p_ind = 1;
	BTFSS      PORTC+0, 4
	GOTO       L_process_uart61
	BSF        _Diag_data_var+0, 4
L_process_uart61:
;APP_OPSM.c,154 :: 		if(RELAY_SOL)   Diag_data_var.diag_Relay_Sol = 1;
	BTFSS      PORTC+0, 5
	GOTO       L_process_uart62
	BSF        _Diag_data_var+0, 5
L_process_uart62:
;APP_OPSM.c,155 :: 		if(BUZZER)      Diag_data_var.diag_buzzer = 1;
	BTFSS      PORTA+0, 2
	GOTO       L_process_uart63
	BSF        _Diag_data_var+0, 6
L_process_uart63:
;APP_OPSM.c,156 :: 		if(RELAY_STR)   Diag_data_var.diag_relay_str = 1;
	BTFSS      PORTA+0, 4
	GOTO       L_process_uart64
	BSF        _Diag_data_var+0, 7
L_process_uart64:
;APP_OPSM.c,157 :: 		}
L_end_process_uart:
	RETURN
; end of _process_uart

_main:

;APP_OPSM.c,159 :: 		void main()
;APP_OPSM.c,161 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,162 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;APP_OPSM.c,164 :: 		while(1)
L_main65:
;APP_OPSM.c,166 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,167 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main67
;APP_OPSM.c,169 :: 		diag_choice = guc_choice;
	MOVF       _guc_choice+0, 0
	MOVWF      _diag_choice+0
;APP_OPSM.c,170 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,171 :: 		}
L_main67:
;APP_OPSM.c,172 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,180 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,181 :: 		}
	GOTO       L_main65
;APP_OPSM.c,182 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
