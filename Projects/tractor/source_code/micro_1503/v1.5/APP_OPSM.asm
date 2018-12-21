
_interrupt:

;APP_OPSM.c,14 :: 		void interrupt()
;APP_OPSM.c,16 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt69:
;APP_OPSM.c,18 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;APP_OPSM.c,20 :: 		if(UART_counter >= 20)
	MOVLW      20
	SUBWF      _UART_counter+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt3
;APP_OPSM.c,22 :: 		Soft_UART_Break();
	CALL       _Soft_UART_Break+0
;APP_OPSM.c,23 :: 		UART_counter = 0;
	CLRF       _UART_counter+0
;APP_OPSM.c,24 :: 		}
L_interrupt3:
;APP_OPSM.c,25 :: 		UART_counter++;
	INCF       _UART_counter+0, 0
	MOVWF      R0
	MOVF       R0, 0
	MOVWF      _UART_counter+0
;APP_OPSM.c,27 :: 		}
	GOTO       L_interrupt4
L_interrupt2:
;APP_OPSM.c,30 :: 		}
L_interrupt4:
;APP_OPSM.c,31 :: 		}
L_end_interrupt:
L__interrupt74:
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
L_CHCK_COND5:
	MOVF       R3+0, 0
	SUBLW      14
	BTFSS      STATUS+0, 0
	GOTO       L_CHCK_COND6
	MOVF       R3+0, 0
	XORWF      FARG_CHCK_COND_x+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CHCK_COND6
L__CHCK_COND70:
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
	GOTO       L_CHCK_COND5
L_CHCK_COND6:
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
	GOTO       L_CHCK_COND10
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
L_CHCK_COND10:
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
	GOTO       L__check_cond77
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond77
	BSF        3, 0
	GOTO       L__check_cond78
L__check_cond77:
	BCF        3, 0
L__check_cond78:
	BTFSS      3, 0
	GOTO       L__check_cond79
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond79
	BSF        R0, 0
	GOTO       L__check_cond80
L__check_cond79:
	BCF        R0, 0
L__check_cond80:
	BTFSS      R0, 0
	GOTO       L__check_cond81
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond81
	BSF        3, 0
	GOTO       L__check_cond82
L__check_cond81:
	BCF        3, 0
L__check_cond82:
	BTFSS      3, 0
	GOTO       L_check_cond11
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond12
L_check_cond11:
;APP_OPSM.c,46 :: 		else if(COND2){ CHCK_COND(2); }
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond83
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond83
	BSF        3, 0
	GOTO       L__check_cond84
L__check_cond83:
	BCF        3, 0
L__check_cond84:
	BTFSS      3, 0
	GOTO       L__check_cond85
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond85
	BSF        R0, 0
	GOTO       L__check_cond86
L__check_cond85:
	BCF        R0, 0
L__check_cond86:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond87
	BSF        3, 0
	GOTO       L__check_cond88
L__check_cond87:
	BCF        3, 0
L__check_cond88:
	BTFSS      R0, 0
	GOTO       L__check_cond89
	BTFSS      3, 0
	GOTO       L__check_cond89
	BSF        R0, 0
	GOTO       L__check_cond90
L__check_cond89:
	BCF        R0, 0
L__check_cond90:
	BTFSS      R0, 0
	GOTO       L_check_cond13
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond14
L_check_cond13:
;APP_OPSM.c,47 :: 		else if(COND3){ CHCK_COND(3); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond91
	BSF        3, 0
	GOTO       L__check_cond92
L__check_cond91:
	BCF        3, 0
L__check_cond92:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond93
	BTFSS      3, 0
	GOTO       L__check_cond93
	BSF        R0, 0
	GOTO       L__check_cond94
L__check_cond93:
	BCF        R0, 0
L__check_cond94:
	BTFSS      R0, 0
	GOTO       L__check_cond95
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond95
	BSF        3, 0
	GOTO       L__check_cond96
L__check_cond95:
	BCF        3, 0
L__check_cond96:
	BTFSS      3, 0
	GOTO       L__check_cond97
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond97
	BSF        R0, 0
	GOTO       L__check_cond98
L__check_cond97:
	BCF        R0, 0
L__check_cond98:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond16
L_check_cond15:
;APP_OPSM.c,48 :: 		else if(COND4){ CHCK_COND(4); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond99
	BSF        3, 0
	GOTO       L__check_cond100
L__check_cond99:
	BCF        3, 0
L__check_cond100:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond101
	BTFSS      3, 0
	GOTO       L__check_cond101
	BSF        R0, 0
	GOTO       L__check_cond102
L__check_cond101:
	BCF        R0, 0
L__check_cond102:
	BTFSS      R0, 0
	GOTO       L__check_cond103
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond103
	BSF        R0, 0
	GOTO       L__check_cond104
L__check_cond103:
	BCF        R0, 0
L__check_cond104:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond105
	BSF        3, 0
	GOTO       L__check_cond106
L__check_cond105:
	BCF        3, 0
L__check_cond106:
	BTFSS      R0, 0
	GOTO       L__check_cond107
	BTFSS      3, 0
	GOTO       L__check_cond107
	BSF        R0, 0
	GOTO       L__check_cond108
L__check_cond107:
	BCF        R0, 0
L__check_cond108:
	BTFSS      R0, 0
	GOTO       L_check_cond17
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond18
L_check_cond17:
;APP_OPSM.c,49 :: 		else if(COND5){ CHCK_COND(5); }
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond109
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond109
	BSF        R0, 0
	GOTO       L__check_cond110
L__check_cond109:
	BCF        R0, 0
L__check_cond110:
	BTFSC      PORTC+0, 1
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
	BTFSS      R0, 0
	GOTO       L__check_cond115
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond115
	BSF        3, 0
	GOTO       L__check_cond116
L__check_cond115:
	BCF        3, 0
L__check_cond116:
	BTFSS      3, 0
	GOTO       L_check_cond19
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond20
L_check_cond19:
;APP_OPSM.c,50 :: 		else if(COND6){ CHCK_COND(6); }
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond117
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond117
	BSF        R0, 0
	GOTO       L__check_cond118
L__check_cond117:
	BCF        R0, 0
L__check_cond118:
	BTFSC      PORTC+0, 1
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
	GOTO       L_check_cond21
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond22
L_check_cond21:
;APP_OPSM.c,51 :: 		else if(COND7){ CHCK_COND(7); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond127
	BSF        3, 0
	GOTO       L__check_cond128
L__check_cond127:
	BCF        3, 0
L__check_cond128:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond129
	BTFSS      3, 0
	GOTO       L__check_cond129
	BSF        R0, 0
	GOTO       L__check_cond130
L__check_cond129:
	BCF        R0, 0
L__check_cond130:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond131
	BSF        3, 0
	GOTO       L__check_cond132
L__check_cond131:
	BCF        3, 0
L__check_cond132:
	BTFSS      R0, 0
	GOTO       L__check_cond133
	BTFSS      3, 0
	GOTO       L__check_cond133
	BSF        R0, 0
	GOTO       L__check_cond134
L__check_cond133:
	BCF        R0, 0
L__check_cond134:
	BTFSS      R0, 0
	GOTO       L__check_cond135
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond135
	BSF        3, 0
	GOTO       L__check_cond136
L__check_cond135:
	BCF        3, 0
L__check_cond136:
	BTFSS      3, 0
	GOTO       L_check_cond23
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond24
L_check_cond23:
;APP_OPSM.c,52 :: 		else if(COND8){ CHCK_COND(8); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond137
	BSF        3, 0
	GOTO       L__check_cond138
L__check_cond137:
	BCF        3, 0
L__check_cond138:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond139
	BTFSS      3, 0
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
	BTFSC      PORTC+0, 0
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
	GOTO       L_check_cond25
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond26
L_check_cond25:
;APP_OPSM.c,53 :: 		else if(COND9){ CHCK_COND(9); }
	BTFSC      PORTC+0, 3
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
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond157
	BSF        3, 0
	GOTO       L__check_cond158
L__check_cond157:
	BCF        3, 0
L__check_cond158:
	BTFSS      3, 0
	GOTO       L_check_cond27
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond28
L_check_cond27:
;APP_OPSM.c,54 :: 		else if(COND10){ CHCK_COND(10); }
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond159
	BSF        3, 0
	GOTO       L__check_cond160
L__check_cond159:
	BCF        3, 0
L__check_cond160:
	BTFSS      3, 0
	GOTO       L__check_cond161
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond161
	BSF        R0, 0
	GOTO       L__check_cond162
L__check_cond161:
	BCF        R0, 0
L__check_cond162:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond163
	BSF        3, 0
	GOTO       L__check_cond164
L__check_cond163:
	BCF        3, 0
L__check_cond164:
	BTFSS      R0, 0
	GOTO       L__check_cond165
	BTFSS      3, 0
	GOTO       L__check_cond165
	BSF        R0, 0
	GOTO       L__check_cond166
L__check_cond165:
	BCF        R0, 0
L__check_cond166:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond167
	BSF        3, 0
	GOTO       L__check_cond168
L__check_cond167:
	BCF        3, 0
L__check_cond168:
	BTFSS      R0, 0
	GOTO       L__check_cond169
	BTFSS      3, 0
	GOTO       L__check_cond169
	BSF        R0, 0
	GOTO       L__check_cond170
L__check_cond169:
	BCF        R0, 0
L__check_cond170:
	BTFSS      R0, 0
	GOTO       L_check_cond29
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond30
L_check_cond29:
;APP_OPSM.c,55 :: 		else if(COND11){ CHCK_COND(11); }
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond171
	BSF        R0, 0
	GOTO       L__check_cond172
L__check_cond171:
	BCF        R0, 0
L__check_cond172:
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 1
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
	GOTO       L_check_cond31
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond32
L_check_cond31:
;APP_OPSM.c,56 :: 		else if(COND12){ CHCK_COND(12); }
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond183
	BSF        R0, 0
	GOTO       L__check_cond184
L__check_cond183:
	BCF        R0, 0
L__check_cond184:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond185
	BSF        3, 0
	GOTO       L__check_cond186
L__check_cond185:
	BCF        3, 0
L__check_cond186:
	BTFSS      R0, 0
	GOTO       L__check_cond187
	BTFSS      3, 0
	GOTO       L__check_cond187
	BSF        R0, 0
	GOTO       L__check_cond188
L__check_cond187:
	BCF        R0, 0
L__check_cond188:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond193
	BSF        3, 0
	GOTO       L__check_cond194
L__check_cond193:
	BCF        3, 0
L__check_cond194:
	BTFSS      R0, 0
	GOTO       L__check_cond195
	BTFSS      3, 0
	GOTO       L__check_cond195
	BSF        R0, 0
	GOTO       L__check_cond196
L__check_cond195:
	BCF        R0, 0
L__check_cond196:
	BTFSS      R0, 0
	GOTO       L_check_cond33
	MOVLW      12
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond34
L_check_cond33:
;APP_OPSM.c,57 :: 		else if(COND13){ CHCK_COND(13); }
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond197
	BSF        3, 0
	GOTO       L__check_cond198
L__check_cond197:
	BCF        3, 0
L__check_cond198:
	BTFSS      3, 0
	GOTO       L__check_cond199
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond199
	BSF        R0, 0
	GOTO       L__check_cond200
L__check_cond199:
	BCF        R0, 0
L__check_cond200:
	BTFSS      R0, 0
	GOTO       L__check_cond201
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond201
	BSF        3, 0
	GOTO       L__check_cond202
L__check_cond201:
	BCF        3, 0
L__check_cond202:
	BTFSS      3, 0
	GOTO       L__check_cond203
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond203
	BSF        R0, 0
	GOTO       L__check_cond204
L__check_cond203:
	BCF        R0, 0
L__check_cond204:
	BTFSS      R0, 0
	GOTO       L_check_cond35
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
	GOTO       L_check_cond36
L_check_cond35:
;APP_OPSM.c,58 :: 		else {CHCK_COND(14);}
	MOVLW      14
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
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
	GOTO       L__exe_cond72
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond72
	MOVF       _guc_choice+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond72
;APP_OPSM.c,67 :: 		|| guc_choice == 4 || guc_choice == 5 ){guc_buzz_state=1;}
	MOVF       _guc_choice+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond72
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond72
	GOTO       L_exe_cond39
L__exe_cond72:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond40
L_exe_cond39:
;APP_OPSM.c,68 :: 		else { guc_buzz_state=0;}
	CLRF       _guc_buzz_state+0
L_exe_cond40:
;APP_OPSM.c,70 :: 		if( guc_choice == 6 || guc_choice == 7 || guc_choice == 8
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
	MOVF       _guc_choice+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
	MOVF       _guc_choice+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
;APP_OPSM.c,71 :: 		|| guc_choice == 9 || guc_choice == 10 || guc_choice == 11
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
	MOVF       _guc_choice+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
;APP_OPSM.c,72 :: 		|| guc_choice == 12 )
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond71
	GOTO       L_exe_cond43
L__exe_cond71:
;APP_OPSM.c,73 :: 		{P_IND = 1;}
	BSF        PORTC+0, 4
	GOTO       L_exe_cond44
L_exe_cond43:
;APP_OPSM.c,74 :: 		else { P_IND = 0;}
	BCF        PORTC+0, 4
L_exe_cond44:
;APP_OPSM.c,82 :: 		if(guc_choice == 2)
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond45
;APP_OPSM.c,84 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond46:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond206
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond206:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond47
	GOTO       L_exe_cond46
L_exe_cond47:
;APP_OPSM.c,85 :: 		RELAY_SOL = 0;rel_lock = 1;
	BCF        PORTC+0, 5
	MOVLW      1
	MOVWF      _rel_lock+0
;APP_OPSM.c,86 :: 		while(COND2)asm CLRWDT ;
L_exe_cond48:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond207
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond207
	BSF        3, 0
	GOTO       L__exe_cond208
L__exe_cond207:
	BCF        3, 0
L__exe_cond208:
	BTFSS      3, 0
	GOTO       L__exe_cond209
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond209
	BSF        R1, 0
	GOTO       L__exe_cond210
L__exe_cond209:
	BCF        R1, 0
L__exe_cond210:
	BTFSC      PORTC+0, 0
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
	GOTO       L_exe_cond49
	CLRWDT
	GOTO       L_exe_cond48
L_exe_cond49:
;APP_OPSM.c,87 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,88 :: 		}
	GOTO       L_exe_cond50
L_exe_cond45:
;APP_OPSM.c,89 :: 		else if(guc_choice == 6)
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond51
;APP_OPSM.c,92 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond52:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond215
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond215:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond53
	GOTO       L_exe_cond52
L_exe_cond53:
;APP_OPSM.c,93 :: 		RELAY_SOL = 0;rel_lock = 1;
	BCF        PORTC+0, 5
	MOVLW      1
	MOVWF      _rel_lock+0
;APP_OPSM.c,94 :: 		while(COND6)asm CLRWDT ;
L_exe_cond54:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond216
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond216
	BSF        R1, 0
	GOTO       L__exe_cond217
L__exe_cond216:
	BCF        R1, 0
L__exe_cond217:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond222
	BSF        3, 0
	GOTO       L__exe_cond223
L__exe_cond222:
	BCF        3, 0
L__exe_cond223:
	BTFSS      R1, 0
	GOTO       L__exe_cond224
	BTFSS      3, 0
	GOTO       L__exe_cond224
	BSF        R1, 0
	GOTO       L__exe_cond225
L__exe_cond224:
	BCF        R1, 0
L__exe_cond225:
	BTFSS      R1, 0
	GOTO       L_exe_cond55
	CLRWDT
	GOTO       L_exe_cond54
L_exe_cond55:
;APP_OPSM.c,95 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,96 :: 		}
	GOTO       L_exe_cond56
L_exe_cond51:
;APP_OPSM.c,97 :: 		else { RELAY_SOL = 0;}
	BCF        PORTC+0, 5
L_exe_cond56:
L_exe_cond50:
;APP_OPSM.c,99 :: 		if (guc_choice == 14)
	MOVF       _guc_choice+0, 0
	XORLW      14
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond57
;APP_OPSM.c,101 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;APP_OPSM.c,102 :: 		P_IND = 0;
	BCF        PORTC+0, 4
;APP_OPSM.c,103 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;APP_OPSM.c,104 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;APP_OPSM.c,105 :: 		}
L_exe_cond57:
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
;APP_OPSM.c,137 :: 		Soft_UART_Init(&PORTA, 1, 0, 9600, 0);
	MOVLW      PORTA+0
	MOVWF      FARG_Soft_UART_Init_port+0
	MOVLW      hi_addr(PORTA+0)
	MOVWF      FARG_Soft_UART_Init_port+1
	MOVLW      1
	MOVWF      FARG_Soft_UART_Init_rx_pin+0
	CLRF       FARG_Soft_UART_Init_tx_pin+0
	MOVLW      128
	MOVWF      FARG_Soft_UART_Init_baud_rate+0
	MOVLW      37
	MOVWF      FARG_Soft_UART_Init_baud_rate+1
	CLRF       FARG_Soft_UART_Init_baud_rate+2
	CLRF       FARG_Soft_UART_Init_baud_rate+3
	CLRF       FARG_Soft_UART_Init_inverted+0
	CALL       _Soft_UART_Init+0
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
	GOTO       L_process_uart58
	BSF        _Diag_data_var+0, 0
L_process_uart58:
;APP_OPSM.c,150 :: 		if(!HAND_BRAKE)  Diag_data_var.diag_hand_brake = 1;
	BTFSC      PORTC+0, 1
	GOTO       L_process_uart59
	BSF        _Diag_data_var+0, 1
L_process_uart59:
;APP_OPSM.c,151 :: 		if(!PTO)         Diag_data_var.diag_pto = 1;
	BTFSC      PORTC+0, 2
	GOTO       L_process_uart60
	BSF        _Diag_data_var+0, 2
L_process_uart60:
;APP_OPSM.c,152 :: 		if(!SEAT_SWITCH) Diag_data_var.diag_seat_switch = 1;
	BTFSC      PORTC+0, 3
	GOTO       L_process_uart61
	BSF        _Diag_data_var+0, 3
L_process_uart61:
;APP_OPSM.c,153 :: 		if(P_IND)       Diag_data_var.diag_p_ind = 1;
	BTFSS      PORTC+0, 4
	GOTO       L_process_uart62
	BSF        _Diag_data_var+0, 4
L_process_uart62:
;APP_OPSM.c,154 :: 		if(RELAY_SOL)   Diag_data_var.diag_Relay_Sol = 1;
	BTFSS      PORTC+0, 5
	GOTO       L_process_uart63
	BSF        _Diag_data_var+0, 5
L_process_uart63:
;APP_OPSM.c,155 :: 		if(BUZZER)      Diag_data_var.diag_buzzer = 1;
	BTFSS      PORTA+0, 2
	GOTO       L_process_uart64
	BSF        _Diag_data_var+0, 6
L_process_uart64:
;APP_OPSM.c,156 :: 		if(RELAY_STR)   Diag_data_var.diag_relay_str = 1;
	BTFSS      PORTA+0, 4
	GOTO       L_process_uart65
	BSF        _Diag_data_var+0, 7
L_process_uart65:
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
L_main66:
;APP_OPSM.c,166 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;APP_OPSM.c,167 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main68
;APP_OPSM.c,169 :: 		diag_choice = guc_choice;
	MOVF       _guc_choice+0, 0
	MOVWF      _diag_choice+0
;APP_OPSM.c,170 :: 		exe_cond();
	CALL       _exe_cond+0
;APP_OPSM.c,171 :: 		}
L_main68:
;APP_OPSM.c,172 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;APP_OPSM.c,180 :: 		asm CLRWDT ;
	CLRWDT
;APP_OPSM.c,181 :: 		}
	GOTO       L_main66
;APP_OPSM.c,182 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
