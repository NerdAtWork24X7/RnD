
_interrupt:

;APP_OPSM.c,14 :: 		void interrupt()
;APP_OPSM.c,16 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt72:
;APP_OPSM.c,18 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,27 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;APP_OPSM.c,30 :: 		}
L_interrupt3:
;APP_OPSM.c,31 :: 		}
L_end_interrupt:
L__interrupt76:
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
	SUBLW      17
	BTFSS      STATUS+0, 0
	GOTO       L_CHCK_COND5
	MOVF       R4+0, 0
	XORWF      FARG_CHCK_COND_x+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CHCK_COND5
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
	SUBLW      78
	BTFSS      STATUS+0, 2
	GOTO       L__CHCK_COND78
	MOVF       R1, 0
	SUBLW      32
L__CHCK_COND78:
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
	GOTO       L__check_cond80
	BSF        3, 0
	GOTO       L__check_cond81
L__check_cond80:
	BCF        3, 0
L__check_cond81:
	BTFSS      3, 0
	GOTO       L__check_cond82
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond82
	BSF        R0, 0
	GOTO       L__check_cond83
L__check_cond82:
	BCF        R0, 0
L__check_cond83:
	BTFSS      R0, 0
	GOTO       L__check_cond84
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond84
	BSF        R0, 0
	GOTO       L__check_cond85
L__check_cond84:
	BCF        R0, 0
L__check_cond85:
	BTFSC      PORTA+0, 5
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
	GOTO       L_check_cond10
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond11
L_check_cond10:
;APP_OPSM.c,46 :: 		else if(COND2){ CHCK_COND(2); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond90
	BSF        3, 0
	GOTO       L__check_cond91
L__check_cond90:
	BCF        3, 0
L__check_cond91:
	BTFSS      3, 0
	GOTO       L__check_cond92
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond92
	BSF        R0, 0
	GOTO       L__check_cond93
L__check_cond92:
	BCF        R0, 0
L__check_cond93:
	BTFSS      R0, 0
	GOTO       L__check_cond94
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond94
	BSF        3, 0
	GOTO       L__check_cond95
L__check_cond94:
	BCF        3, 0
L__check_cond95:
	BTFSS      3, 0
	GOTO       L__check_cond96
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond96
	BSF        R0, 0
	GOTO       L__check_cond97
L__check_cond96:
	BCF        R0, 0
L__check_cond97:
	BTFSS      R0, 0
	GOTO       L_check_cond12
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond13
L_check_cond12:
;APP_OPSM.c,47 :: 		else if(COND3){ CHCK_COND(3); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond98
	BSF        3, 0
	GOTO       L__check_cond99
L__check_cond98:
	BCF        3, 0
L__check_cond99:
	BTFSS      3, 0
	GOTO       L__check_cond100
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond100
	BSF        R0, 0
	GOTO       L__check_cond101
L__check_cond100:
	BCF        R0, 0
L__check_cond101:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond102
	BSF        3, 0
	GOTO       L__check_cond103
L__check_cond102:
	BCF        3, 0
L__check_cond103:
	BTFSS      R0, 0
	GOTO       L__check_cond104
	BTFSS      3, 0
	GOTO       L__check_cond104
	BSF        R0, 0
	GOTO       L__check_cond105
L__check_cond104:
	BCF        R0, 0
L__check_cond105:
	BTFSC      PORTA+0, 5
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
	GOTO       L_check_cond14
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond15
L_check_cond14:
;APP_OPSM.c,48 :: 		else if(COND4){ CHCK_COND(4); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond110
	BSF        3, 0
	GOTO       L__check_cond111
L__check_cond110:
	BCF        3, 0
L__check_cond111:
	BTFSS      3, 0
	GOTO       L__check_cond112
	BTFSS      PORTC+0, 1
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
	GOTO       L_check_cond16
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond17
L_check_cond16:
;APP_OPSM.c,49 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond120
	BSF        R0, 0
	GOTO       L__check_cond121
L__check_cond120:
	BCF        R0, 0
L__check_cond121:
	BTFSC      PORTC+0, 1
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
	GOTO       L__check_cond126
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond126
	BSF        R0, 0
	GOTO       L__check_cond127
L__check_cond126:
	BCF        R0, 0
L__check_cond127:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond128
	BSF        3, 0
	GOTO       L__check_cond129
L__check_cond128:
	BCF        3, 0
L__check_cond129:
	BTFSS      R0, 0
	GOTO       L__check_cond130
	BTFSS      3, 0
	GOTO       L__check_cond130
	BSF        R0, 0
	GOTO       L__check_cond131
L__check_cond130:
	BCF        R0, 0
L__check_cond131:
	BTFSS      R0, 0
	GOTO       L_check_cond18
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond19
L_check_cond18:
;APP_OPSM.c,50 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond132
	BSF        R0, 0
	GOTO       L__check_cond133
L__check_cond132:
	BCF        R0, 0
L__check_cond133:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond134
	BSF        3, 0
	GOTO       L__check_cond135
L__check_cond134:
	BCF        3, 0
L__check_cond135:
	BTFSS      R0, 0
	GOTO       L__check_cond136
	BTFSS      3, 0
	GOTO       L__check_cond136
	BSF        R0, 0
	GOTO       L__check_cond137
L__check_cond136:
	BCF        R0, 0
L__check_cond137:
	BTFSS      R0, 0
	GOTO       L__check_cond138
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond138
	BSF        3, 0
	GOTO       L__check_cond139
L__check_cond138:
	BCF        3, 0
L__check_cond139:
	BTFSS      3, 0
	GOTO       L__check_cond140
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond140
	BSF        R0, 0
	GOTO       L__check_cond141
L__check_cond140:
	BCF        R0, 0
L__check_cond141:
	BTFSS      R0, 0
	GOTO       L_check_cond20
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond21
L_check_cond20:
;APP_OPSM.c,51 :: 		else if(COND7){ CHCK_COND(7); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond142
	BSF        R0, 0
	GOTO       L__check_cond143
L__check_cond142:
	BCF        R0, 0
L__check_cond143:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond148
	BSF        3, 0
	GOTO       L__check_cond149
L__check_cond148:
	BCF        3, 0
L__check_cond149:
	BTFSS      R0, 0
	GOTO       L__check_cond150
	BTFSS      3, 0
	GOTO       L__check_cond150
	BSF        R0, 0
	GOTO       L__check_cond151
L__check_cond150:
	BCF        R0, 0
L__check_cond151:
	BTFSC      PORTA+0, 5
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
	GOTO       L_check_cond22
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond23
L_check_cond22:
;APP_OPSM.c,52 :: 		else if(COND8){ CHCK_COND(8); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond156
	BSF        R0, 0
	GOTO       L__check_cond157
L__check_cond156:
	BCF        R0, 0
L__check_cond157:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 0
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
	BTFSS      R0, 0
	GOTO       L__check_cond166
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond166
	BSF        3, 0
	GOTO       L__check_cond167
L__check_cond166:
	BCF        3, 0
L__check_cond167:
	BTFSS      3, 0
	GOTO       L_check_cond24
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond25
L_check_cond24:
;APP_OPSM.c,53 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond168
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond168
	BSF        3, 0
	GOTO       L__check_cond169
L__check_cond168:
	BCF        3, 0
L__check_cond169:
	BTFSS      3, 0
	GOTO       L__check_cond170
	BTFSS      PORTC+0, 0
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
	GOTO       L_check_cond26
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond27
L_check_cond26:
;APP_OPSM.c,54 :: 		else if(COND10){ CHCK_COND(10); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond176
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond176
	BSF        3, 0
	GOTO       L__check_cond177
L__check_cond176:
	BCF        3, 0
L__check_cond177:
	BTFSS      3, 0
	GOTO       L__check_cond178
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond178
	BSF        R0, 0
	GOTO       L__check_cond179
L__check_cond178:
	BCF        R0, 0
L__check_cond179:
	BTFSS      R0, 0
	GOTO       L__check_cond180
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond180
	BSF        3, 0
	GOTO       L__check_cond181
L__check_cond180:
	BCF        3, 0
L__check_cond181:
	BTFSS      3, 0
	GOTO       L_check_cond28
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond29
L_check_cond28:
;APP_OPSM.c,55 :: 		else if(COND11){ CHCK_COND(11); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond182
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond182
	BSF        R0, 0
	GOTO       L__check_cond183
L__check_cond182:
	BCF        R0, 0
L__check_cond183:
	BTFSC      PORTC+0, 0
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
	BTFSC      PORTA+0, 5
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
	BTFSS      R0, 0
	GOTO       L_check_cond30
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond31
L_check_cond30:
;APP_OPSM.c,56 :: 		else if(COND12){ CHCK_COND(12); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond192
	BTFSS      PORTC+0, 1
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
	BTFSS      R0, 0
	GOTO       L__check_cond198
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond198
	BSF        3, 0
	GOTO       L__check_cond199
L__check_cond198:
	BCF        3, 0
L__check_cond199:
	BTFSS      3, 0
	GOTO       L_check_cond32
	MOVLW      12
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond33
L_check_cond32:
;APP_OPSM.c,57 :: 		else if(COND13){ CHCK_COND(13); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond200
	BSF        3, 0
	GOTO       L__check_cond201
L__check_cond200:
	BCF        3, 0
L__check_cond201:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond202
	BTFSS      3, 0
	GOTO       L__check_cond202
	BSF        R0, 0
	GOTO       L__check_cond203
L__check_cond202:
	BCF        R0, 0
L__check_cond203:
	BTFSS      R0, 0
	GOTO       L__check_cond204
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond204
	BSF        R0, 0
	GOTO       L__check_cond205
L__check_cond204:
	BCF        R0, 0
L__check_cond205:
	BTFSC      PORTA+0, 5
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
	BTFSS      R0, 0
	GOTO       L_check_cond34
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond35
L_check_cond34:
;APP_OPSM.c,58 :: 		else if(COND14){ CHCK_COND(14); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond210
	BSF        3, 0
	GOTO       L__check_cond211
L__check_cond210:
	BCF        3, 0
L__check_cond211:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond212
	BTFSS      3, 0
	GOTO       L__check_cond212
	BSF        R0, 0
	GOTO       L__check_cond213
L__check_cond212:
	BCF        R0, 0
L__check_cond213:
	BTFSS      R0, 0
	GOTO       L__check_cond214
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond214
	BSF        3, 0
	GOTO       L__check_cond215
L__check_cond214:
	BCF        3, 0
L__check_cond215:
	BTFSS      3, 0
	GOTO       L__check_cond216
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond216
	BSF        R0, 0
	GOTO       L__check_cond217
L__check_cond216:
	BCF        R0, 0
L__check_cond217:
	BTFSS      R0, 0
	GOTO       L_check_cond36
	MOVLW      14
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond37
L_check_cond36:
;APP_OPSM.c,59 :: 		else if(COND15){ CHCK_COND(15); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond218
	BSF        3, 0
	GOTO       L__check_cond219
L__check_cond218:
	BCF        3, 0
L__check_cond219:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond220
	BTFSS      3, 0
	GOTO       L__check_cond220
	BSF        R0, 0
	GOTO       L__check_cond221
L__check_cond220:
	BCF        R0, 0
L__check_cond221:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond222
	BSF        3, 0
	GOTO       L__check_cond223
L__check_cond222:
	BCF        3, 0
L__check_cond223:
	BTFSS      R0, 0
	GOTO       L__check_cond224
	BTFSS      3, 0
	GOTO       L__check_cond224
	BSF        R0, 0
	GOTO       L__check_cond225
L__check_cond224:
	BCF        R0, 0
L__check_cond225:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond226
	BSF        3, 0
	GOTO       L__check_cond227
L__check_cond226:
	BCF        3, 0
L__check_cond227:
	BTFSS      R0, 0
	GOTO       L__check_cond228
	BTFSS      3, 0
	GOTO       L__check_cond228
	BSF        R0, 0
	GOTO       L__check_cond229
L__check_cond228:
	BCF        R0, 0
L__check_cond229:
	BTFSS      R0, 0
	GOTO       L_check_cond38
	MOVLW      15
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond39
L_check_cond38:
;APP_OPSM.c,60 :: 		else if(COND15){ CHCK_COND(16); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond230
	BSF        3, 0
	GOTO       L__check_cond231
L__check_cond230:
	BCF        3, 0
L__check_cond231:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond232
	BTFSS      3, 0
	GOTO       L__check_cond232
	BSF        R0, 0
	GOTO       L__check_cond233
L__check_cond232:
	BCF        R0, 0
L__check_cond233:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond234
	BSF        3, 0
	GOTO       L__check_cond235
L__check_cond234:
	BCF        3, 0
L__check_cond235:
	BTFSS      R0, 0
	GOTO       L__check_cond236
	BTFSS      3, 0
	GOTO       L__check_cond236
	BSF        R0, 0
	GOTO       L__check_cond237
L__check_cond236:
	BCF        R0, 0
L__check_cond237:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond238
	BSF        3, 0
	GOTO       L__check_cond239
L__check_cond238:
	BCF        3, 0
L__check_cond239:
	BTFSS      R0, 0
	GOTO       L__check_cond240
	BTFSS      3, 0
	GOTO       L__check_cond240
	BSF        R0, 0
	GOTO       L__check_cond241
L__check_cond240:
	BCF        R0, 0
L__check_cond241:
	BTFSS      R0, 0
	GOTO       L_check_cond40
	MOVLW      16
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond41
L_check_cond40:
;APP_OPSM.c,61 :: 		else {CHCK_COND(17);}
	MOVLW      17
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond41:
L_check_cond39:
L_check_cond37:
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
;APP_OPSM.c,63 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,65 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;APP_OPSM.c,67 :: 		void exe_cond()
;APP_OPSM.c,69 :: 		if(guc_choice == 1 || guc_choice == 2 || guc_choice == 9
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond74
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond74
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond74
;APP_OPSM.c,70 :: 		|| guc_choice == 10){guc_buzz_state=1;}
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond74
	GOTO       L_exe_cond44
L__exe_cond74:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond45
L_exe_cond44:
;APP_OPSM.c,71 :: 		else { guc_buzz_state=0;}
	CLRF       _guc_buzz_state+0
L_exe_cond45:
;APP_OPSM.c,73 :: 		if(guc_choice == 17)
	MOVF       _guc_choice+0, 0
	XORLW      17
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond46
;APP_OPSM.c,74 :: 		{P_IND = 1;}
	BSF        PORTC+0, 3
	GOTO       L_exe_cond47
L_exe_cond46:
;APP_OPSM.c,75 :: 		else { P_IND = 0;}
	BCF        PORTC+0, 3
L_exe_cond47:
;APP_OPSM.c,83 :: 		if(guc_choice == 9)
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond48
;APP_OPSM.c,85 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond49:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond243
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond243:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond50
	GOTO       L_exe_cond49
L_exe_cond50:
;APP_OPSM.c,86 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,87 :: 		while(COND9)asm CLRWDT ;
L_exe_cond51:
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond244
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond244
	BSF        3, 0
	GOTO       L__exe_cond245
L__exe_cond244:
	BCF        3, 0
L__exe_cond245:
	BTFSS      3, 0
	GOTO       L__exe_cond246
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond246
	BSF        R1, 0
	GOTO       L__exe_cond247
L__exe_cond246:
	BCF        R1, 0
L__exe_cond247:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond248
	BSF        3, 0
	GOTO       L__exe_cond249
L__exe_cond248:
	BCF        3, 0
L__exe_cond249:
	BTFSS      R1, 0
	GOTO       L__exe_cond250
	BTFSS      3, 0
	GOTO       L__exe_cond250
	BSF        R1, 0
	GOTO       L__exe_cond251
L__exe_cond250:
	BCF        R1, 0
L__exe_cond251:
	BTFSS      R1, 0
	GOTO       L_exe_cond52
	CLRWDT
	GOTO       L_exe_cond51
L_exe_cond52:
;APP_OPSM.c,88 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,89 :: 		}
	GOTO       L_exe_cond53
L_exe_cond48:
;APP_OPSM.c,90 :: 		else if(guc_choice == 10)
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond54
;APP_OPSM.c,93 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond55:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond252
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond252:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond56
	GOTO       L_exe_cond55
L_exe_cond56:
;APP_OPSM.c,94 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,95 :: 		while(COND10)asm CLRWDT ;
L_exe_cond57:
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond253
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond253
	BSF        3, 0
	GOTO       L__exe_cond254
L__exe_cond253:
	BCF        3, 0
L__exe_cond254:
	BTFSS      3, 0
	GOTO       L__exe_cond255
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond255
	BSF        R1, 0
	GOTO       L__exe_cond256
L__exe_cond255:
	BCF        R1, 0
L__exe_cond256:
	BTFSS      R1, 0
	GOTO       L__exe_cond257
	BTFSS      PORTA+0, 5
	GOTO       L__exe_cond257
	BSF        3, 0
	GOTO       L__exe_cond258
L__exe_cond257:
	BCF        3, 0
L__exe_cond258:
	BTFSS      3, 0
	GOTO       L_exe_cond58
	CLRWDT
	GOTO       L_exe_cond57
L_exe_cond58:
;APP_OPSM.c,96 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,97 :: 		}
	GOTO       L_exe_cond59
L_exe_cond54:
;APP_OPSM.c,98 :: 		else { RELAY_SOL = 0;}
	BCF        PORTC+0, 5
L_exe_cond59:
L_exe_cond53:
;APP_OPSM.c,100 :: 		if (guc_choice == 17)
	MOVF       _guc_choice+0, 0
	XORLW      17
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond60
;APP_OPSM.c,102 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,103 :: 		P_IND = 0;
	BCF        PORTC+0, 3
;APP_OPSM.c,104 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,105 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,106 :: 		}
L_exe_cond60:
;APP_OPSM.c,107 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,110 :: 		void sys_init()
;APP_OPSM.c,113 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,115 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,116 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,117 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,118 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,120 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,121 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,122 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,123 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,125 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,126 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,129 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,130 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,141 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,146 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_process_uart:

;APP_OPSM.c,148 :: 		void process_uart()
;APP_OPSM.c,150 :: 		if(ENGINE_SENSE) Diag_data_var.diag_engine_sense = 1;
	BTFSS      PORTA+0, 5
	GOTO       L_process_uart61
	BSF        _Diag_data_var+0, 0
L_process_uart61:
;APP_OPSM.c,151 :: 		if(HAND_BRAKE)  Diag_data_var.diag_hand_brake = 1;
	BTFSS      PORTC+0, 0
	GOTO       L_process_uart62
	BSF        _Diag_data_var+0, 1
L_process_uart62:
;APP_OPSM.c,152 :: 		if(PTO)         Diag_data_var.diag_pto = 1;
	BTFSS      PORTC+0, 1
	GOTO       L_process_uart63
	BSF        _Diag_data_var+0, 2
L_process_uart63:
;APP_OPSM.c,153 :: 		if(SEAT_SWITCH) Diag_data_var.diag_seat_switch = 1;
	BTFSS      PORTC+0, 2
	GOTO       L_process_uart64
	BSF        _Diag_data_var+0, 3
L_process_uart64:
;APP_OPSM.c,154 :: 		if(P_IND)       Diag_data_var.diag_p_ind = 1;
	BTFSS      PORTC+0, 3
	GOTO       L_process_uart65
	BSF        _Diag_data_var+0, 4
L_process_uart65:
;APP_OPSM.c,155 :: 		if(RELAY_SOL)   Diag_data_var.diag_Relay_Sol = 1;
	BTFSS      PORTC+0, 5
	GOTO       L_process_uart66
	BSF        _Diag_data_var+0, 5
L_process_uart66:
;APP_OPSM.c,156 :: 		if(BUZZER)      Diag_data_var.diag_buzzer = 1;
	BTFSS      PORTA+0, 2
	GOTO       L_process_uart67
	BSF        _Diag_data_var+0, 6
L_process_uart67:
;APP_OPSM.c,157 :: 		if(RELAY_STR)   Diag_data_var.diag_relay_str = 1;
	BTFSS      PORTC+0, 4
	GOTO       L_process_uart68
	BSF        _Diag_data_var+0, 7
L_process_uart68:
;APP_OPSM.c,158 :: 		}
L_end_process_uart:
	RETURN
; end of _process_uart

_main:

;APP_OPSM.c,160 :: 		void main()
;APP_OPSM.c,162 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,163 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;APP_OPSM.c,165 :: 		while(1)
L_main69:
;APP_OPSM.c,167 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,168 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main71
;APP_OPSM.c,170 :: 		diag_choice = guc_choice;
	MOVF       _guc_choice+0, 0
	MOVWF      _diag_choice+0
;APP_OPSM.c,171 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,172 :: 		}
L_main71:
;APP_OPSM.c,173 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,181 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,182 :: 		}
	GOTO       L_main69
;APP_OPSM.c,183 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
