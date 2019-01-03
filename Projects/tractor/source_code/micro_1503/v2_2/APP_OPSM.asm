
_interrupt:

;APP_OPSM.c,14 :: 		void interrupt()
;APP_OPSM.c,16 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt57:
;APP_OPSM.c,18 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,27 :: 		}
L_interrupt2:
;APP_OPSM.c,29 :: 		}
L_end_interrupt:
L__interrupt62:
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
L__CHCK_COND58:
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
	SUBLW      46
	BTFSS      STATUS+0, 2
	GOTO       L__CHCK_COND64
	MOVF       R1, 0
	SUBLW      224
L__CHCK_COND64:
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
	GOTO       L__check_cond66
	BSF        R0, 0
	GOTO       L__check_cond67
L__check_cond66:
	BCF        R0, 0
L__check_cond67:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond68
	BSF        3, 0
	GOTO       L__check_cond69
L__check_cond68:
	BCF        3, 0
L__check_cond69:
	BTFSS      R0, 0
	GOTO       L__check_cond70
	BTFSS      3, 0
	GOTO       L__check_cond70
	BSF        R0, 0
	GOTO       L__check_cond71
L__check_cond70:
	BCF        R0, 0
L__check_cond71:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond72
	BSF        3, 0
	GOTO       L__check_cond73
L__check_cond72:
	BCF        3, 0
L__check_cond73:
	BTFSS      R0, 0
	GOTO       L__check_cond74
	BTFSS      3, 0
	GOTO       L__check_cond74
	BSF        R0, 0
	GOTO       L__check_cond75
L__check_cond74:
	BCF        R0, 0
L__check_cond75:
	BTFSS      R0, 0
	GOTO       L__check_cond76
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond76
	BSF        3, 0
	GOTO       L__check_cond77
L__check_cond76:
	BCF        3, 0
L__check_cond77:
	BTFSS      3, 0
	GOTO       L_check_cond9
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond10
L_check_cond9:
;APP_OPSM.c,44 :: 		else if(COND2){ CHCK_COND(2); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond78
	BSF        3, 0
	GOTO       L__check_cond79
L__check_cond78:
	BCF        3, 0
L__check_cond79:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond80
	BTFSS      3, 0
	GOTO       L__check_cond80
	BSF        R0, 0
	GOTO       L__check_cond81
L__check_cond80:
	BCF        R0, 0
L__check_cond81:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond82
	BSF        3, 0
	GOTO       L__check_cond83
L__check_cond82:
	BCF        3, 0
L__check_cond83:
	BTFSS      R0, 0
	GOTO       L__check_cond84
	BTFSS      3, 0
	GOTO       L__check_cond84
	BSF        R0, 0
	GOTO       L__check_cond85
L__check_cond84:
	BCF        R0, 0
L__check_cond85:
	BTFSS      R0, 0
	GOTO       L__check_cond86
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond86
	BSF        3, 0
	GOTO       L__check_cond87
L__check_cond86:
	BCF        3, 0
L__check_cond87:
	BTFSS      3, 0
	GOTO       L_check_cond11
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond12
L_check_cond11:
;APP_OPSM.c,45 :: 		else if(COND3){ CHCK_COND(3); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond88
	BSF        R0, 0
	GOTO       L__check_cond89
L__check_cond88:
	BCF        R0, 0
L__check_cond89:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond90
	BSF        3, 0
	GOTO       L__check_cond91
L__check_cond90:
	BCF        3, 0
L__check_cond91:
	BTFSS      R0, 0
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
	GOTO       L_check_cond13
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond14
L_check_cond13:
;APP_OPSM.c,46 :: 		else if(COND4){ CHCK_COND(4); }
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
	BTFSS      R0, 0
	GOTO       L__check_cond102
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond102
	BSF        3, 0
	GOTO       L__check_cond103
L__check_cond102:
	BCF        3, 0
L__check_cond103:
	BTFSS      3, 0
	GOTO       L__check_cond104
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond104
	BSF        R0, 0
	GOTO       L__check_cond105
L__check_cond104:
	BCF        R0, 0
L__check_cond105:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond16
L_check_cond15:
;APP_OPSM.c,47 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond106
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond106
	BSF        3, 0
	GOTO       L__check_cond107
L__check_cond106:
	BCF        3, 0
L__check_cond107:
	BTFSS      3, 0
	GOTO       L__check_cond108
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond108
	BSF        R0, 0
	GOTO       L__check_cond109
L__check_cond108:
	BCF        R0, 0
L__check_cond109:
	BTFSS      R0, 0
	GOTO       L__check_cond110
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond110
	BSF        3, 0
	GOTO       L__check_cond111
L__check_cond110:
	BCF        3, 0
L__check_cond111:
	BTFSS      3, 0
	GOTO       L_check_cond17
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond18
L_check_cond17:
;APP_OPSM.c,48 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
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
	BTFSS      R0, 0
	GOTO       L__check_cond120
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond120
	BSF        3, 0
	GOTO       L__check_cond121
L__check_cond120:
	BCF        3, 0
L__check_cond121:
	BTFSS      3, 0
	GOTO       L_check_cond19
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond20
L_check_cond19:
;APP_OPSM.c,49 :: 		else if(COND7){ CHCK_COND(7); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond122
	BSF        3, 0
	GOTO       L__check_cond123
L__check_cond122:
	BCF        3, 0
L__check_cond123:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond124
	BTFSS      3, 0
	GOTO       L__check_cond124
	BSF        R0, 0
	GOTO       L__check_cond125
L__check_cond124:
	BCF        R0, 0
L__check_cond125:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond126
	BSF        3, 0
	GOTO       L__check_cond127
L__check_cond126:
	BCF        3, 0
L__check_cond127:
	BTFSS      R0, 0
	GOTO       L__check_cond128
	BTFSS      3, 0
	GOTO       L__check_cond128
	BSF        R0, 0
	GOTO       L__check_cond129
L__check_cond128:
	BCF        R0, 0
L__check_cond129:
	BTFSC      PORTA+0, 5
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
	GOTO       L_check_cond21
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond22
L_check_cond21:
;APP_OPSM.c,50 :: 		else if(COND8){ CHCK_COND(8); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond134
	BSF        R0, 0
	GOTO       L__check_cond135
L__check_cond134:
	BCF        R0, 0
L__check_cond135:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond136
	BSF        3, 0
	GOTO       L__check_cond137
L__check_cond136:
	BCF        3, 0
L__check_cond137:
	BTFSS      R0, 0
	GOTO       L__check_cond138
	BTFSS      3, 0
	GOTO       L__check_cond138
	BSF        R0, 0
	GOTO       L__check_cond139
L__check_cond138:
	BCF        R0, 0
L__check_cond139:
	BTFSS      R0, 0
	GOTO       L__check_cond140
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond140
	BSF        R0, 0
	GOTO       L__check_cond141
L__check_cond140:
	BCF        R0, 0
L__check_cond141:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond142
	BSF        3, 0
	GOTO       L__check_cond143
L__check_cond142:
	BCF        3, 0
L__check_cond143:
	BTFSS      R0, 0
	GOTO       L__check_cond144
	BTFSS      3, 0
	GOTO       L__check_cond144
	BSF        R0, 0
	GOTO       L__check_cond145
L__check_cond144:
	BCF        R0, 0
L__check_cond145:
	BTFSS      R0, 0
	GOTO       L_check_cond23
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond24
L_check_cond23:
;APP_OPSM.c,51 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond146
	BSF        R0, 0
	GOTO       L__check_cond147
L__check_cond146:
	BCF        R0, 0
L__check_cond147:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 0
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
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond156
	BSF        3, 0
	GOTO       L__check_cond157
L__check_cond156:
	BCF        3, 0
L__check_cond157:
	BTFSS      R0, 0
	GOTO       L__check_cond158
	BTFSS      3, 0
	GOTO       L__check_cond158
	BSF        R0, 0
	GOTO       L__check_cond159
L__check_cond158:
	BCF        R0, 0
L__check_cond159:
	BTFSS      R0, 0
	GOTO       L_check_cond25
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond26
L_check_cond25:
;APP_OPSM.c,52 :: 		else if(COND10){ CHCK_COND(10); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond160
	BSF        3, 0
	GOTO       L__check_cond161
L__check_cond160:
	BCF        3, 0
L__check_cond161:
	BTFSS      3, 0
	GOTO       L__check_cond162
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond162
	BSF        R0, 0
	GOTO       L__check_cond163
L__check_cond162:
	BCF        R0, 0
L__check_cond163:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond164
	BSF        3, 0
	GOTO       L__check_cond165
L__check_cond164:
	BCF        3, 0
L__check_cond165:
	BTFSS      R0, 0
	GOTO       L__check_cond166
	BTFSS      3, 0
	GOTO       L__check_cond166
	BSF        R0, 0
	GOTO       L__check_cond167
L__check_cond166:
	BCF        R0, 0
L__check_cond167:
	BTFSC      PORTA+0, 5
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
	BTFSS      R0, 0
	GOTO       L_check_cond27
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond28
L_check_cond27:
;APP_OPSM.c,53 :: 		else if(COND11){ CHCK_COND(11); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond172
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond172
	BSF        3, 0
	GOTO       L__check_cond173
L__check_cond172:
	BCF        3, 0
L__check_cond173:
	BTFSS      3, 0
	GOTO       L__check_cond174
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond174
	BSF        R0, 0
	GOTO       L__check_cond175
L__check_cond174:
	BCF        R0, 0
L__check_cond175:
	BTFSC      PORTA+0, 5
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
	GOTO       L_check_cond29
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond30
L_check_cond29:
;APP_OPSM.c,54 :: 		else if(COND12){ CHCK_COND(12); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond180
	BSF        3, 0
	GOTO       L__check_cond181
L__check_cond180:
	BCF        3, 0
L__check_cond181:
	BTFSS      3, 0
	GOTO       L__check_cond182
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond182
	BSF        R0, 0
	GOTO       L__check_cond183
L__check_cond182:
	BCF        R0, 0
L__check_cond183:
	BTFSS      R0, 0
	GOTO       L__check_cond184
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond184
	BSF        R0, 0
	GOTO       L__check_cond185
L__check_cond184:
	BCF        R0, 0
L__check_cond185:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond186
	BSF        3, 0
	GOTO       L__check_cond187
L__check_cond186:
	BCF        3, 0
L__check_cond187:
	BTFSS      R0, 0
	GOTO       L__check_cond188
	BTFSS      3, 0
	GOTO       L__check_cond188
	BSF        R0, 0
	GOTO       L__check_cond189
L__check_cond188:
	BCF        R0, 0
L__check_cond189:
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
;APP_OPSM.c,57 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,59 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;APP_OPSM.c,61 :: 		void exe_cond()
;APP_OPSM.c,63 :: 		if(guc_choice == 1 || guc_choice == 6 || guc_choice == 9
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond60
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond60
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond60
;APP_OPSM.c,64 :: 		|| guc_choice == 10){guc_buzz_state=1;}
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond60
	GOTO       L_exe_cond35
L__exe_cond60:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond36
L_exe_cond35:
;APP_OPSM.c,65 :: 		else { guc_buzz_state=0;}
	CLRF       _guc_buzz_state+0
L_exe_cond36:
;APP_OPSM.c,67 :: 		if(guc_choice == 8 || guc_choice == 11 || guc_choice == 12)
	MOVF       _guc_choice+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond59
	MOVF       _guc_choice+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond59
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond59
	GOTO       L_exe_cond39
L__exe_cond59:
;APP_OPSM.c,68 :: 		{P_IND = 1;}
	BSF        PORTC+0, 3
	GOTO       L_exe_cond40
L_exe_cond39:
;APP_OPSM.c,69 :: 		else { P_IND = 0;}
	BCF        PORTC+0, 3
L_exe_cond40:
;APP_OPSM.c,77 :: 		if(guc_choice == 10)
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond41
;APP_OPSM.c,79 :: 		guc_sec=0; RELAY_SOL = 0;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BCF        PORTC+0, 5
L_exe_cond42:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond191
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond191:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond43
	GOTO       L_exe_cond42
L_exe_cond43:
;APP_OPSM.c,80 :: 		RELAY_SOL = 1;
	BSF        PORTC+0, 5
;APP_OPSM.c,81 :: 		while(COND10)asm CLRWDT ;
L_exe_cond44:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond192
	BSF        3, 0
	GOTO       L__exe_cond193
L__exe_cond192:
	BCF        3, 0
L__exe_cond193:
	BTFSS      3, 0
	GOTO       L__exe_cond194
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond194
	BSF        R1, 0
	GOTO       L__exe_cond195
L__exe_cond194:
	BCF        R1, 0
L__exe_cond195:
	BTFSC      PORTC+0, 0
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
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond200
	BSF        3, 0
	GOTO       L__exe_cond201
L__exe_cond200:
	BCF        3, 0
L__exe_cond201:
	BTFSS      R1, 0
	GOTO       L__exe_cond202
	BTFSS      3, 0
	GOTO       L__exe_cond202
	BSF        R1, 0
	GOTO       L__exe_cond203
L__exe_cond202:
	BCF        R1, 0
L__exe_cond203:
	BTFSS      R1, 0
	GOTO       L_exe_cond45
	CLRWDT
	GOTO       L_exe_cond44
L_exe_cond45:
;APP_OPSM.c,82 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,83 :: 		}
	GOTO       L_exe_cond46
L_exe_cond41:
;APP_OPSM.c,84 :: 		else if(guc_choice == 12)
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond47
;APP_OPSM.c,87 :: 		guc_sec=0; RELAY_SOL = 0;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BCF        PORTC+0, 5
L_exe_cond48:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond204
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond204:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond49
	GOTO       L_exe_cond48
L_exe_cond49:
;APP_OPSM.c,88 :: 		RELAY_SOL = 1;
	BSF        PORTC+0, 5
;APP_OPSM.c,89 :: 		while(COND12)asm CLRWDT ;
L_exe_cond50:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond205
	BSF        3, 0
	GOTO       L__exe_cond206
L__exe_cond205:
	BCF        3, 0
L__exe_cond206:
	BTFSS      3, 0
	GOTO       L__exe_cond207
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond207
	BSF        R1, 0
	GOTO       L__exe_cond208
L__exe_cond207:
	BCF        R1, 0
L__exe_cond208:
	BTFSS      R1, 0
	GOTO       L__exe_cond209
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond209
	BSF        R1, 0
	GOTO       L__exe_cond210
L__exe_cond209:
	BCF        R1, 0
L__exe_cond210:
	BTFSC      PORTA+0, 5
	GOTO       L__exe_cond211
	BSF        3, 0
	GOTO       L__exe_cond212
L__exe_cond211:
	BCF        3, 0
L__exe_cond212:
	BTFSS      R1, 0
	GOTO       L__exe_cond213
	BTFSS      3, 0
	GOTO       L__exe_cond213
	BSF        R1, 0
	GOTO       L__exe_cond214
L__exe_cond213:
	BCF        R1, 0
L__exe_cond214:
	BTFSS      R1, 0
	GOTO       L_exe_cond51
	CLRWDT
	GOTO       L_exe_cond50
L_exe_cond51:
;APP_OPSM.c,90 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,91 :: 		}
	GOTO       L_exe_cond52
L_exe_cond47:
;APP_OPSM.c,92 :: 		else { RELAY_SOL = 1;}
	BSF        PORTC+0, 5
L_exe_cond52:
L_exe_cond46:
;APP_OPSM.c,94 :: 		if (guc_choice == 14)
	MOVF       _guc_choice+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond53
;APP_OPSM.c,96 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,97 :: 		P_IND = 0;
	BCF        PORTC+0, 3
;APP_OPSM.c,98 :: 		RELAY_SOL = 1;
	BSF        PORTC+0, 5
;APP_OPSM.c,99 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,100 :: 		}
L_exe_cond53:
;APP_OPSM.c,101 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;APP_OPSM.c,104 :: 		void sys_init()
;APP_OPSM.c,107 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;APP_OPSM.c,109 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;APP_OPSM.c,110 :: 		LATA = 0x00;
	CLRF       LATA+0
;APP_OPSM.c,111 :: 		ANSELA = 0x00;
	CLRF       ANSELA+0
;APP_OPSM.c,112 :: 		TRISA = 0x20;
	MOVLW      32
	MOVWF      TRISA+0
;APP_OPSM.c,114 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;APP_OPSM.c,115 :: 		ANSELC = 0x00;
	CLRF       ANSELC+0
;APP_OPSM.c,116 :: 		LATC = 0x00;
	CLRF       LATC+0
;APP_OPSM.c,117 :: 		TRISC = 0x07;
	MOVLW      7
	MOVWF      TRISC+0
;APP_OPSM.c,119 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,120 :: 		RELAY_SOL = 1;
	BSF        PORTC+0, 5
;APP_OPSM.c,123 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;APP_OPSM.c,124 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;APP_OPSM.c,135 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;APP_OPSM.c,140 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;APP_OPSM.c,157 :: 		void main()
;APP_OPSM.c,159 :: 		sys_init();
	CALL       _sys_init+0
;APP_OPSM.c,160 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;APP_OPSM.c,162 :: 		while(1)
L_main54:
;APP_OPSM.c,164 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,165 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main56
;APP_OPSM.c,167 :: 		diag_choice = guc_choice;
	MOVF       _guc_choice+0, 0
	MOVWF      _diag_choice+0
;APP_OPSM.c,168 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,169 :: 		}
L_main56:
;APP_OPSM.c,170 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,178 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,179 :: 		}
	GOTO       L_main54
;APP_OPSM.c,180 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
