
_interrupt:

;Tractor.c,51 :: 		void interrupt()
;Tractor.c,53 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt70:
;Tractor.c,55 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;Tractor.c,56 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;Tractor.c,59 :: 		}
L_interrupt3:
;Tractor.c,60 :: 		}
L_end_interrupt:
L__interrupt72:
	RETFIE     %s
; end of _interrupt

_deb_delay:

;Tractor.c,61 :: 		void deb_delay()
;Tractor.c,63 :: 		for(i=0;i<10;i++)
	CLRF       _i+0
	CLRF       _i+1
L_deb_delay4:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__deb_delay74
	MOVLW      10
	SUBWF      _i+0, 0
L__deb_delay74:
	BTFSC      STATUS+0, 0
	GOTO       L_deb_delay5
;Tractor.c,64 :: 		for(j=0;j<1000;j++)
	CLRF       _j+0
	CLRF       _j+1
L_deb_delay7:
	MOVLW      3
	SUBWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__deb_delay75
	MOVLW      232
	SUBWF      _j+0, 0
L__deb_delay75:
	BTFSC      STATUS+0, 0
	GOTO       L_deb_delay8
;Tractor.c,65 :: 		asm CLRWDT ;
	CLRWDT
;Tractor.c,64 :: 		for(j=0;j<1000;j++)
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
;Tractor.c,65 :: 		asm CLRWDT ;
	GOTO       L_deb_delay7
L_deb_delay8:
;Tractor.c,63 :: 		for(i=0;i<10;i++)
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
;Tractor.c,65 :: 		asm CLRWDT ;
	GOTO       L_deb_delay4
L_deb_delay5:
;Tractor.c,66 :: 		}
L_end_deb_delay:
	RETURN
; end of _deb_delay

_check_cond:

;Tractor.c,68 :: 		void check_cond()
;Tractor.c,70 :: 		uint8 cnt = 0;
	CLRF       check_cond_cnt_L0+0
;Tractor.c,71 :: 		guc_choice = 0;
	CLRF       _guc_choice+0
;Tractor.c,72 :: 		if(COND1) { guc_choice=1; deb_delay();}
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
	BSF        R2, 0
	GOTO       L__check_cond80
L__check_cond79:
	BCF        R2, 0
L__check_cond80:
	BTFSS      R2, 0
	GOTO       L__check_cond81
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond81
	BSF        3, 0
	GOTO       L__check_cond82
L__check_cond81:
	BCF        3, 0
L__check_cond82:
	BTFSS      3, 0
	GOTO       L_check_cond10
	MOVLW      1
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond10:
;Tractor.c,73 :: 		if(COND2)
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
	BSF        R2, 0
	GOTO       L__check_cond86
L__check_cond85:
	BCF        R2, 0
L__check_cond86:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond87
	BSF        3, 0
	GOTO       L__check_cond88
L__check_cond87:
	BCF        3, 0
L__check_cond88:
	BTFSS      R2, 0
	GOTO       L__check_cond89
	BTFSS      3, 0
	GOTO       L__check_cond89
	BSF        R2, 0
	GOTO       L__check_cond90
L__check_cond89:
	BCF        R2, 0
L__check_cond90:
	BTFSS      R2, 0
	GOTO       L_check_cond11
;Tractor.c,75 :: 		for(i=0;i<100;i++)
	CLRF       _i+0
	CLRF       _i+1
L_check_cond12:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond91
	MOVLW      100
	SUBWF      _i+0, 0
L__check_cond91:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond13
;Tractor.c,77 :: 		if(COND2) cnt++;
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond92
	BTFSS      PORTC+0, 2
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
	BSF        R2, 0
	GOTO       L__check_cond95
L__check_cond94:
	BCF        R2, 0
L__check_cond95:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond96
	BSF        3, 0
	GOTO       L__check_cond97
L__check_cond96:
	BCF        3, 0
L__check_cond97:
	BTFSS      R2, 0
	GOTO       L__check_cond98
	BTFSS      3, 0
	GOTO       L__check_cond98
	BSF        R2, 0
	GOTO       L__check_cond99
L__check_cond98:
	BCF        R2, 0
L__check_cond99:
	BTFSS      R2, 0
	GOTO       L_check_cond15
	INCF       check_cond_cnt_L0+0, 1
L_check_cond15:
;Tractor.c,75 :: 		for(i=0;i<100;i++)
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
;Tractor.c,78 :: 		}
	GOTO       L_check_cond12
L_check_cond13:
;Tractor.c,79 :: 		if(cnt > 60) guc_choice = 2;
	MOVF       check_cond_cnt_L0+0, 0
	SUBLW      60
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond16
	MOVLW      2
	MOVWF      _guc_choice+0
L_check_cond16:
;Tractor.c,80 :: 		}
L_check_cond11:
;Tractor.c,81 :: 		if(COND6)
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond100
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond100
	BSF        R2, 0
	GOTO       L__check_cond101
L__check_cond100:
	BCF        R2, 0
L__check_cond101:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond102
	BSF        3, 0
	GOTO       L__check_cond103
L__check_cond102:
	BCF        3, 0
L__check_cond103:
	BTFSS      R2, 0
	GOTO       L__check_cond104
	BTFSS      3, 0
	GOTO       L__check_cond104
	BSF        R2, 0
	GOTO       L__check_cond105
L__check_cond104:
	BCF        R2, 0
L__check_cond105:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond106
	BSF        3, 0
	GOTO       L__check_cond107
L__check_cond106:
	BCF        3, 0
L__check_cond107:
	BTFSS      R2, 0
	GOTO       L__check_cond108
	BTFSS      3, 0
	GOTO       L__check_cond108
	BSF        R2, 0
	GOTO       L__check_cond109
L__check_cond108:
	BCF        R2, 0
L__check_cond109:
	BTFSS      R2, 0
	GOTO       L_check_cond17
;Tractor.c,83 :: 		for(i=0;i<100;i++)
	CLRF       _i+0
	CLRF       _i+1
L_check_cond18:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__check_cond110
	MOVLW      100
	SUBWF      _i+0, 0
L__check_cond110:
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond19
;Tractor.c,85 :: 		if(COND6) cnt++;
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond111
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond111
	BSF        R2, 0
	GOTO       L__check_cond112
L__check_cond111:
	BCF        R2, 0
L__check_cond112:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond113
	BSF        3, 0
	GOTO       L__check_cond114
L__check_cond113:
	BCF        3, 0
L__check_cond114:
	BTFSS      R2, 0
	GOTO       L__check_cond115
	BTFSS      3, 0
	GOTO       L__check_cond115
	BSF        R2, 0
	GOTO       L__check_cond116
L__check_cond115:
	BCF        R2, 0
L__check_cond116:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond117
	BSF        3, 0
	GOTO       L__check_cond118
L__check_cond117:
	BCF        3, 0
L__check_cond118:
	BTFSS      R2, 0
	GOTO       L__check_cond119
	BTFSS      3, 0
	GOTO       L__check_cond119
	BSF        R2, 0
	GOTO       L__check_cond120
L__check_cond119:
	BCF        R2, 0
L__check_cond120:
	BTFSS      R2, 0
	GOTO       L_check_cond21
	INCF       check_cond_cnt_L0+0, 1
L_check_cond21:
;Tractor.c,83 :: 		for(i=0;i<100;i++)
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
;Tractor.c,86 :: 		}
	GOTO       L_check_cond18
L_check_cond19:
;Tractor.c,87 :: 		if(cnt > 60) guc_choice = 6;
	MOVF       check_cond_cnt_L0+0, 0
	SUBLW      60
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond22
	MOVLW      6
	MOVWF      _guc_choice+0
L_check_cond22:
;Tractor.c,88 :: 		}
L_check_cond17:
;Tractor.c,89 :: 		if(COND3) { guc_choice=3;   deb_delay();}
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond121
	BSF        3, 0
	GOTO       L__check_cond122
L__check_cond121:
	BCF        3, 0
L__check_cond122:
	BTFSS      PORTC+0, 3
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
	GOTO       L_check_cond23
	MOVLW      3
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond23:
;Tractor.c,90 :: 		if(COND4) { guc_choice=4;   deb_delay();}
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond129
	BSF        3, 0
	GOTO       L__check_cond130
L__check_cond129:
	BCF        3, 0
L__check_cond130:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond131
	BTFSS      3, 0
	GOTO       L__check_cond131
	BSF        R2, 0
	GOTO       L__check_cond132
L__check_cond131:
	BCF        R2, 0
L__check_cond132:
	BTFSS      R2, 0
	GOTO       L__check_cond133
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond133
	BSF        R2, 0
	GOTO       L__check_cond134
L__check_cond133:
	BCF        R2, 0
L__check_cond134:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond135
	BSF        3, 0
	GOTO       L__check_cond136
L__check_cond135:
	BCF        3, 0
L__check_cond136:
	BTFSS      R2, 0
	GOTO       L__check_cond137
	BTFSS      3, 0
	GOTO       L__check_cond137
	BSF        R2, 0
	GOTO       L__check_cond138
L__check_cond137:
	BCF        R2, 0
L__check_cond138:
	BTFSS      R2, 0
	GOTO       L_check_cond24
	MOVLW      4
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond24:
;Tractor.c,91 :: 		if(COND5) { guc_choice=5;   deb_delay();}
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond139
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond139
	BSF        R2, 0
	GOTO       L__check_cond140
L__check_cond139:
	BCF        R2, 0
L__check_cond140:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond141
	BSF        3, 0
	GOTO       L__check_cond142
L__check_cond141:
	BCF        3, 0
L__check_cond142:
	BTFSS      R2, 0
	GOTO       L__check_cond143
	BTFSS      3, 0
	GOTO       L__check_cond143
	BSF        R2, 0
	GOTO       L__check_cond144
L__check_cond143:
	BCF        R2, 0
L__check_cond144:
	BTFSS      R2, 0
	GOTO       L__check_cond145
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond145
	BSF        3, 0
	GOTO       L__check_cond146
L__check_cond145:
	BCF        3, 0
L__check_cond146:
	BTFSS      3, 0
	GOTO       L_check_cond25
	MOVLW      5
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond25:
;Tractor.c,92 :: 		if(COND7) { guc_choice=7;   deb_delay();}
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond147
	BSF        3, 0
	GOTO       L__check_cond148
L__check_cond147:
	BCF        3, 0
L__check_cond148:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond149
	BTFSS      3, 0
	GOTO       L__check_cond149
	BSF        R2, 0
	GOTO       L__check_cond150
L__check_cond149:
	BCF        R2, 0
L__check_cond150:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond151
	BSF        3, 0
	GOTO       L__check_cond152
L__check_cond151:
	BCF        3, 0
L__check_cond152:
	BTFSS      R2, 0
	GOTO       L__check_cond153
	BTFSS      3, 0
	GOTO       L__check_cond153
	BSF        R2, 0
	GOTO       L__check_cond154
L__check_cond153:
	BCF        R2, 0
L__check_cond154:
	BTFSS      R2, 0
	GOTO       L__check_cond155
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond155
	BSF        3, 0
	GOTO       L__check_cond156
L__check_cond155:
	BCF        3, 0
L__check_cond156:
	BTFSS      3, 0
	GOTO       L_check_cond26
	MOVLW      7
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond26:
;Tractor.c,93 :: 		if(COND8) { guc_choice=8;   deb_delay();}
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond157
	BSF        3, 0
	GOTO       L__check_cond158
L__check_cond157:
	BCF        3, 0
L__check_cond158:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond159
	BTFSS      3, 0
	GOTO       L__check_cond159
	BSF        R2, 0
	GOTO       L__check_cond160
L__check_cond159:
	BCF        R2, 0
L__check_cond160:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond161
	BSF        3, 0
	GOTO       L__check_cond162
L__check_cond161:
	BCF        3, 0
L__check_cond162:
	BTFSS      R2, 0
	GOTO       L__check_cond163
	BTFSS      3, 0
	GOTO       L__check_cond163
	BSF        R2, 0
	GOTO       L__check_cond164
L__check_cond163:
	BCF        R2, 0
L__check_cond164:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond165
	BSF        3, 0
	GOTO       L__check_cond166
L__check_cond165:
	BCF        3, 0
L__check_cond166:
	BTFSS      R2, 0
	GOTO       L__check_cond167
	BTFSS      3, 0
	GOTO       L__check_cond167
	BSF        R2, 0
	GOTO       L__check_cond168
L__check_cond167:
	BCF        R2, 0
L__check_cond168:
	BTFSS      R2, 0
	GOTO       L_check_cond27
	MOVLW      8
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond27:
;Tractor.c,94 :: 		if(COND9) { guc_choice=9;   deb_delay();}
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond169
	BSF        3, 0
	GOTO       L__check_cond170
L__check_cond169:
	BCF        3, 0
L__check_cond170:
	BTFSS      3, 0
	GOTO       L__check_cond171
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond171
	BSF        R2, 0
	GOTO       L__check_cond172
L__check_cond171:
	BCF        R2, 0
L__check_cond172:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond173
	BSF        3, 0
	GOTO       L__check_cond174
L__check_cond173:
	BCF        3, 0
L__check_cond174:
	BTFSS      R2, 0
	GOTO       L__check_cond175
	BTFSS      3, 0
	GOTO       L__check_cond175
	BSF        R2, 0
	GOTO       L__check_cond176
L__check_cond175:
	BCF        R2, 0
L__check_cond176:
	BTFSS      R2, 0
	GOTO       L__check_cond177
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond177
	BSF        3, 0
	GOTO       L__check_cond178
L__check_cond177:
	BCF        3, 0
L__check_cond178:
	BTFSS      3, 0
	GOTO       L_check_cond28
	MOVLW      9
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond28:
;Tractor.c,95 :: 		if(COND10) { guc_choice=10; deb_delay();}
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
	GOTO       L_check_cond29
	MOVLW      10
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond29:
;Tractor.c,96 :: 		if(COND11) { guc_choice=11; deb_delay();}
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond191
	BSF        R2, 0
	GOTO       L__check_cond192
L__check_cond191:
	BCF        R2, 0
L__check_cond192:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond193
	BSF        3, 0
	GOTO       L__check_cond194
L__check_cond193:
	BCF        3, 0
L__check_cond194:
	BTFSS      R2, 0
	GOTO       L__check_cond195
	BTFSS      3, 0
	GOTO       L__check_cond195
	BSF        R2, 0
	GOTO       L__check_cond196
L__check_cond195:
	BCF        R2, 0
L__check_cond196:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond197
	BSF        3, 0
	GOTO       L__check_cond198
L__check_cond197:
	BCF        3, 0
L__check_cond198:
	BTFSS      R2, 0
	GOTO       L__check_cond199
	BTFSS      3, 0
	GOTO       L__check_cond199
	BSF        R2, 0
	GOTO       L__check_cond200
L__check_cond199:
	BCF        R2, 0
L__check_cond200:
	BTFSS      R2, 0
	GOTO       L__check_cond201
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond201
	BSF        3, 0
	GOTO       L__check_cond202
L__check_cond201:
	BCF        3, 0
L__check_cond202:
	BTFSS      3, 0
	GOTO       L_check_cond30
	MOVLW      11
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond30:
;Tractor.c,97 :: 		if(COND12) { guc_choice=12; deb_delay();}
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond203
	BSF        R2, 0
	GOTO       L__check_cond204
L__check_cond203:
	BCF        R2, 0
L__check_cond204:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond205
	BSF        3, 0
	GOTO       L__check_cond206
L__check_cond205:
	BCF        3, 0
L__check_cond206:
	BTFSS      R2, 0
	GOTO       L__check_cond207
	BTFSS      3, 0
	GOTO       L__check_cond207
	BSF        R2, 0
	GOTO       L__check_cond208
L__check_cond207:
	BCF        R2, 0
L__check_cond208:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond209
	BSF        3, 0
	GOTO       L__check_cond210
L__check_cond209:
	BCF        3, 0
L__check_cond210:
	BTFSS      R2, 0
	GOTO       L__check_cond211
	BTFSS      3, 0
	GOTO       L__check_cond211
	BSF        R2, 0
	GOTO       L__check_cond212
L__check_cond211:
	BCF        R2, 0
L__check_cond212:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond213
	BSF        3, 0
	GOTO       L__check_cond214
L__check_cond213:
	BCF        3, 0
L__check_cond214:
	BTFSS      R2, 0
	GOTO       L__check_cond215
	BTFSS      3, 0
	GOTO       L__check_cond215
	BSF        R2, 0
	GOTO       L__check_cond216
L__check_cond215:
	BCF        R2, 0
L__check_cond216:
	BTFSS      R2, 0
	GOTO       L_check_cond31
	MOVLW      12
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond31:
;Tractor.c,98 :: 		if(COND13) { guc_choice=13; deb_delay();}
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond217
	BSF        3, 0
	GOTO       L__check_cond218
L__check_cond217:
	BCF        3, 0
L__check_cond218:
	BTFSS      3, 0
	GOTO       L__check_cond219
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond219
	BSF        R2, 0
	GOTO       L__check_cond220
L__check_cond219:
	BCF        R2, 0
L__check_cond220:
	BTFSS      R2, 0
	GOTO       L__check_cond221
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond221
	BSF        3, 0
	GOTO       L__check_cond222
L__check_cond221:
	BCF        3, 0
L__check_cond222:
	BTFSS      3, 0
	GOTO       L__check_cond223
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond223
	BSF        R2, 0
	GOTO       L__check_cond224
L__check_cond223:
	BCF        R2, 0
L__check_cond224:
	BTFSS      R2, 0
	GOTO       L_check_cond32
	MOVLW      13
	MOVWF      _guc_choice+0
	CALL       _deb_delay+0
L_check_cond32:
;Tractor.c,111 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;Tractor.c,113 :: 		void exe_cond()
;Tractor.c,115 :: 		guc_sec=0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,116 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 4
;Tractor.c,117 :: 		switch(guc_choice)
	GOTO       L_exe_cond33
;Tractor.c,119 :: 		case 1: guc_buzz_state=1;
L_exe_cond35:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,121 :: 		while(COND1);
L_exe_cond36:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond226
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond226
	BSF        3, 0
	GOTO       L__exe_cond227
L__exe_cond226:
	BCF        3, 0
L__exe_cond227:
	BTFSS      3, 0
	GOTO       L__exe_cond228
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond228
	BSF        R1, 0
	GOTO       L__exe_cond229
L__exe_cond228:
	BCF        R1, 0
L__exe_cond229:
	BTFSS      R1, 0
	GOTO       L__exe_cond230
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond230
	BSF        3, 0
	GOTO       L__exe_cond231
L__exe_cond230:
	BCF        3, 0
L__exe_cond231:
	BTFSS      3, 0
	GOTO       L_exe_cond37
	GOTO       L_exe_cond36
L_exe_cond37:
;Tractor.c,123 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,124 :: 		break;
	GOTO       L_exe_cond34
;Tractor.c,126 :: 		case 2: guc_buzz_state=1;
L_exe_cond38:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,127 :: 		RELAY_SOL = 1;
	BSF        PORTC+0, 4
;Tractor.c,128 :: 		while(guc_sec<6);
L_exe_cond39:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond232
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond232:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond40
	GOTO       L_exe_cond39
L_exe_cond40:
;Tractor.c,129 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 4
;Tractor.c,130 :: 		while(COND2);
L_exe_cond41:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond233
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond233
	BSF        3, 0
	GOTO       L__exe_cond234
L__exe_cond233:
	BCF        3, 0
L__exe_cond234:
	BTFSS      3, 0
	GOTO       L__exe_cond235
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond235
	BSF        R1, 0
	GOTO       L__exe_cond236
L__exe_cond235:
	BCF        R1, 0
L__exe_cond236:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond237
	BSF        3, 0
	GOTO       L__exe_cond238
L__exe_cond237:
	BCF        3, 0
L__exe_cond238:
	BTFSS      R1, 0
	GOTO       L__exe_cond239
	BTFSS      3, 0
	GOTO       L__exe_cond239
	BSF        R1, 0
	GOTO       L__exe_cond240
L__exe_cond239:
	BCF        R1, 0
L__exe_cond240:
	BTFSS      R1, 0
	GOTO       L_exe_cond42
	GOTO       L_exe_cond41
L_exe_cond42:
;Tractor.c,131 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,132 :: 		break;
	GOTO       L_exe_cond34
;Tractor.c,134 :: 		case 3: RELAY_SOL = 0;
L_exe_cond43:
	BCF        PORTC+0, 4
;Tractor.c,135 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,136 :: 		while(COND3);
L_exe_cond44:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond241
	BSF        3, 0
	GOTO       L__exe_cond242
L__exe_cond241:
	BCF        3, 0
L__exe_cond242:
	BTFSS      PORTC+0, 3
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
	BSF        3, 0
	GOTO       L__exe_cond246
L__exe_cond245:
	BCF        3, 0
L__exe_cond246:
	BTFSS      3, 0
	GOTO       L__exe_cond247
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond247
	BSF        R1, 0
	GOTO       L__exe_cond248
L__exe_cond247:
	BCF        R1, 0
L__exe_cond248:
	BTFSS      R1, 0
	GOTO       L_exe_cond45
	GOTO       L_exe_cond44
L_exe_cond45:
;Tractor.c,137 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,138 :: 		break;
	GOTO       L_exe_cond34
;Tractor.c,140 :: 		case 4: RELAY_SOL = 0;
L_exe_cond46:
	BCF        PORTC+0, 4
;Tractor.c,141 :: 		guc_buzz_state=1;
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,142 :: 		while(COND4);
L_exe_cond47:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond249
	BSF        3, 0
	GOTO       L__exe_cond250
L__exe_cond249:
	BCF        3, 0
L__exe_cond250:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond251
	BTFSS      3, 0
	GOTO       L__exe_cond251
	BSF        R1, 0
	GOTO       L__exe_cond252
L__exe_cond251:
	BCF        R1, 0
L__exe_cond252:
	BTFSS      R1, 0
	GOTO       L__exe_cond253
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond253
	BSF        R1, 0
	GOTO       L__exe_cond254
L__exe_cond253:
	BCF        R1, 0
L__exe_cond254:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond255
	BSF        3, 0
	GOTO       L__exe_cond256
L__exe_cond255:
	BCF        3, 0
L__exe_cond256:
	BTFSS      R1, 0
	GOTO       L__exe_cond257
	BTFSS      3, 0
	GOTO       L__exe_cond257
	BSF        R1, 0
	GOTO       L__exe_cond258
L__exe_cond257:
	BCF        R1, 0
L__exe_cond258:
	BTFSS      R1, 0
	GOTO       L_exe_cond48
	GOTO       L_exe_cond47
L_exe_cond48:
;Tractor.c,143 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,144 :: 		break;
	GOTO       L_exe_cond34
;Tractor.c,146 :: 		case 5: RELAY_SOL = 0;
L_exe_cond49:
	BCF        PORTC+0, 4
;Tractor.c,148 :: 		while(COND5);
L_exe_cond50:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond259
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond259
	BSF        R1, 0
	GOTO       L__exe_cond260
L__exe_cond259:
	BCF        R1, 0
L__exe_cond260:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond261
	BSF        3, 0
	GOTO       L__exe_cond262
L__exe_cond261:
	BCF        3, 0
L__exe_cond262:
	BTFSS      R1, 0
	GOTO       L__exe_cond263
	BTFSS      3, 0
	GOTO       L__exe_cond263
	BSF        R1, 0
	GOTO       L__exe_cond264
L__exe_cond263:
	BCF        R1, 0
L__exe_cond264:
	BTFSS      R1, 0
	GOTO       L__exe_cond265
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond265
	BSF        3, 0
	GOTO       L__exe_cond266
L__exe_cond265:
	BCF        3, 0
L__exe_cond266:
	BTFSS      3, 0
	GOTO       L_exe_cond51
	GOTO       L_exe_cond50
L_exe_cond51:
;Tractor.c,150 :: 		break;
	GOTO       L_exe_cond34
;Tractor.c,152 :: 		case 6: RELAY_SOL = 1;
L_exe_cond52:
	BSF        PORTC+0, 4
;Tractor.c,153 :: 		while(guc_sec<6);
L_exe_cond53:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond267
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond267:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond54
	GOTO       L_exe_cond53
L_exe_cond54:
;Tractor.c,154 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 4
;Tractor.c,155 :: 		while(COND6);
L_exe_cond55:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond268
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond268
	BSF        R1, 0
	GOTO       L__exe_cond269
L__exe_cond268:
	BCF        R1, 0
L__exe_cond269:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond270
	BSF        3, 0
	GOTO       L__exe_cond271
L__exe_cond270:
	BCF        3, 0
L__exe_cond271:
	BTFSS      R1, 0
	GOTO       L__exe_cond272
	BTFSS      3, 0
	GOTO       L__exe_cond272
	BSF        R1, 0
	GOTO       L__exe_cond273
L__exe_cond272:
	BCF        R1, 0
L__exe_cond273:
	BTFSC      PORTC+0, 0
	GOTO       L__exe_cond274
	BSF        3, 0
	GOTO       L__exe_cond275
L__exe_cond274:
	BCF        3, 0
L__exe_cond275:
	BTFSS      R1, 0
	GOTO       L__exe_cond276
	BTFSS      3, 0
	GOTO       L__exe_cond276
	BSF        R1, 0
	GOTO       L__exe_cond277
L__exe_cond276:
	BCF        R1, 0
L__exe_cond277:
	BTFSS      R1, 0
	GOTO       L_exe_cond56
	GOTO       L_exe_cond55
L_exe_cond56:
;Tractor.c,156 :: 		break;
	GOTO       L_exe_cond34
;Tractor.c,158 :: 		case 9: RELAY_SOL = 0;
L_exe_cond57:
	BCF        PORTC+0, 4
;Tractor.c,160 :: 		while(COND9);
L_exe_cond58:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond278
	BSF        3, 0
	GOTO       L__exe_cond279
L__exe_cond278:
	BCF        3, 0
L__exe_cond279:
	BTFSS      3, 0
	GOTO       L__exe_cond280
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond280
	BSF        R1, 0
	GOTO       L__exe_cond281
L__exe_cond280:
	BCF        R1, 0
L__exe_cond281:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond282
	BSF        3, 0
	GOTO       L__exe_cond283
L__exe_cond282:
	BCF        3, 0
L__exe_cond283:
	BTFSS      R1, 0
	GOTO       L__exe_cond284
	BTFSS      3, 0
	GOTO       L__exe_cond284
	BSF        R1, 0
	GOTO       L__exe_cond285
L__exe_cond284:
	BCF        R1, 0
L__exe_cond285:
	BTFSS      R1, 0
	GOTO       L__exe_cond286
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond286
	BSF        3, 0
	GOTO       L__exe_cond287
L__exe_cond286:
	BCF        3, 0
L__exe_cond287:
	BTFSS      3, 0
	GOTO       L_exe_cond59
	GOTO       L_exe_cond58
L_exe_cond59:
;Tractor.c,162 :: 		break;
	GOTO       L_exe_cond34
;Tractor.c,164 :: 		case 13:RELAY_SOL = 0;
L_exe_cond60:
	BCF        PORTC+0, 4
;Tractor.c,166 :: 		while(COND13);
L_exe_cond61:
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
	GOTO       L_exe_cond62
	GOTO       L_exe_cond61
L_exe_cond62:
;Tractor.c,168 :: 		break;
	GOTO       L_exe_cond34
;Tractor.c,170 :: 		default: RELAY_SOL = 0;
L_exe_cond63:
	BCF        PORTC+0, 4
;Tractor.c,172 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,173 :: 		break;
	GOTO       L_exe_cond34
;Tractor.c,174 :: 		}
L_exe_cond33:
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond35
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond38
	MOVF       _guc_choice+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond43
	MOVF       _guc_choice+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond46
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond49
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond52
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond57
	MOVF       _guc_choice+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond60
	GOTO       L_exe_cond63
L_exe_cond34:
;Tractor.c,175 :: 		guc_choice=0;
	CLRF       _guc_choice+0
;Tractor.c,176 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;Tractor.c,211 :: 		void sys_init()
;Tractor.c,214 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;Tractor.c,215 :: 		LATA = 0x00;
	CLRF       LATA+0
;Tractor.c,216 :: 		LATC = 0x00;
	CLRF       LATC+0
;Tractor.c,218 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Tractor.c,219 :: 		TRISC=0x2F;
	MOVLW      47
	MOVWF      TRISC+0
;Tractor.c,221 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;Tractor.c,222 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;Tractor.c,225 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;Tractor.c,226 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 4
;Tractor.c,230 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;Tractor.c,231 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;Tractor.c,237 :: 		for(i=0;i<6;i++) guc_cycle[i]=0;
	CLRF       sys_init_i_L0+0
L_sys_init64:
	MOVLW      6
	SUBWF      sys_init_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sys_init65
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
	GOTO       L_sys_init64
L_sys_init65:
;Tractor.c,238 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Tractor.c,240 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;Tractor.c,242 :: 		void main()
;Tractor.c,245 :: 		sys_init();
	CALL       _sys_init+0
;Tractor.c,246 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;Tractor.c,248 :: 		while(1)
L_main67:
;Tractor.c,250 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;Tractor.c,251 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main69
;Tractor.c,252 :: 		exe_cond();
	CALL       _exe_cond+0
L_main69:
;Tractor.c,253 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;Tractor.c,260 :: 		asm CLRWDT ;
	CLRWDT
;Tractor.c,261 :: 		}
	GOTO       L_main67
;Tractor.c,262 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
