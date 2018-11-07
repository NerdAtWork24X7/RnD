
_interrupt:

;Tractor.c,37 :: 		void interrupt()
;Tractor.c,39 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt75:
;Tractor.c,41 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;Tractor.c,42 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;Tractor.c,45 :: 		}
L_interrupt3:
;Tractor.c,46 :: 		}
L_end_interrupt:
L__interrupt77:
	RETFIE     %s
; end of _interrupt

_check_cond:

;Tractor.c,48 :: 		void check_cond()
;Tractor.c,50 :: 		uint8 cnt = 0 ;
;Tractor.c,52 :: 		if(COND1) guc_choice=1;
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond79
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond79
	BSF        3, 0
	GOTO       L__check_cond80
L__check_cond79:
	BCF        3, 0
L__check_cond80:
	BTFSS      3, 0
	GOTO       L__check_cond81
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond81
	BSF        R2, 0
	GOTO       L__check_cond82
L__check_cond81:
	BCF        R2, 0
L__check_cond82:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond4
	MOVLW      1
	MOVWF      _guc_choice+0
	GOTO       L_check_cond5
L_check_cond4:
;Tractor.c,53 :: 		else if(COND2) guc_choice=2;
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
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       _Eng_On+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond6
	MOVLW      2
	MOVWF      _guc_choice+0
	GOTO       L_check_cond7
L_check_cond6:
;Tractor.c,54 :: 		else if(COND3) guc_choice=3;
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond87
	BSF        3, 0
	GOTO       L__check_cond88
L__check_cond87:
	BCF        3, 0
L__check_cond88:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond89
	BTFSS      3, 0
	GOTO       L__check_cond89
	BSF        R2, 0
	GOTO       L__check_cond90
L__check_cond89:
	BCF        R2, 0
L__check_cond90:
	BTFSS      R2, 0
	GOTO       L__check_cond91
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond91
	BSF        R2, 0
	GOTO       L__check_cond92
L__check_cond91:
	BCF        R2, 0
L__check_cond92:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond8
	MOVLW      3
	MOVWF      _guc_choice+0
	GOTO       L_check_cond9
L_check_cond8:
;Tractor.c,55 :: 		else if(COND4) guc_choice=4;
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond93
	BSF        3, 0
	GOTO       L__check_cond94
L__check_cond93:
	BCF        3, 0
L__check_cond94:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond95
	BTFSS      3, 0
	GOTO       L__check_cond95
	BSF        R2, 0
	GOTO       L__check_cond96
L__check_cond95:
	BCF        R2, 0
L__check_cond96:
	BTFSS      R2, 0
	GOTO       L__check_cond97
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond97
	BSF        3, 0
	GOTO       L__check_cond98
L__check_cond97:
	BCF        3, 0
L__check_cond98:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       _Eng_On+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond10
	MOVLW      4
	MOVWF      _guc_choice+0
	GOTO       L_check_cond11
L_check_cond10:
;Tractor.c,56 :: 		else if(COND5) guc_choice=5;
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond99
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond99
	BSF        R2, 0
	GOTO       L__check_cond100
L__check_cond99:
	BCF        R2, 0
L__check_cond100:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond101
	BSF        3, 0
	GOTO       L__check_cond102
L__check_cond101:
	BCF        3, 0
L__check_cond102:
	BTFSS      R2, 0
	GOTO       L__check_cond103
	BTFSS      3, 0
	GOTO       L__check_cond103
	BSF        R2, 0
	GOTO       L__check_cond104
L__check_cond103:
	BCF        R2, 0
L__check_cond104:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond12
	MOVLW      5
	MOVWF      _guc_choice+0
	GOTO       L_check_cond13
L_check_cond12:
;Tractor.c,57 :: 		else if(COND6) guc_choice=6;
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond105
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond105
	BSF        R2, 0
	GOTO       L__check_cond106
L__check_cond105:
	BCF        R2, 0
L__check_cond106:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond107
	BSF        3, 0
	GOTO       L__check_cond108
L__check_cond107:
	BCF        3, 0
L__check_cond108:
	BTFSS      R2, 0
	GOTO       L__check_cond109
	BTFSS      3, 0
	GOTO       L__check_cond109
	BSF        R2, 0
	GOTO       L__check_cond110
L__check_cond109:
	BCF        R2, 0
L__check_cond110:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       _Eng_On+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond14
	MOVLW      6
	MOVWF      _guc_choice+0
	GOTO       L_check_cond15
L_check_cond14:
;Tractor.c,58 :: 		else if(COND7) guc_choice=7;
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond111
	BSF        3, 0
	GOTO       L__check_cond112
L__check_cond111:
	BCF        3, 0
L__check_cond112:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond113
	BTFSS      3, 0
	GOTO       L__check_cond113
	BSF        R2, 0
	GOTO       L__check_cond114
L__check_cond113:
	BCF        R2, 0
L__check_cond114:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond115
	BSF        3, 0
	GOTO       L__check_cond116
L__check_cond115:
	BCF        3, 0
L__check_cond116:
	BTFSS      R2, 0
	GOTO       L__check_cond117
	BTFSS      3, 0
	GOTO       L__check_cond117
	BSF        R2, 0
	GOTO       L__check_cond118
L__check_cond117:
	BCF        R2, 0
L__check_cond118:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond16
	MOVLW      7
	MOVWF      _guc_choice+0
	GOTO       L_check_cond17
L_check_cond16:
;Tractor.c,59 :: 		else if(COND8) guc_choice=8;
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond119
	BSF        3, 0
	GOTO       L__check_cond120
L__check_cond119:
	BCF        3, 0
L__check_cond120:
	BTFSS      PORTC+0, 3
	GOTO       L__check_cond121
	BTFSS      3, 0
	GOTO       L__check_cond121
	BSF        R2, 0
	GOTO       L__check_cond122
L__check_cond121:
	BCF        R2, 0
L__check_cond122:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond123
	BSF        3, 0
	GOTO       L__check_cond124
L__check_cond123:
	BCF        3, 0
L__check_cond124:
	BTFSS      R2, 0
	GOTO       L__check_cond125
	BTFSS      3, 0
	GOTO       L__check_cond125
	BSF        R2, 0
	GOTO       L__check_cond126
L__check_cond125:
	BCF        R2, 0
L__check_cond126:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       _Eng_On+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond18
	MOVLW      8
	MOVWF      _guc_choice+0
	GOTO       L_check_cond19
L_check_cond18:
;Tractor.c,60 :: 		else if(COND9) guc_choice=9;
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond127
	BSF        3, 0
	GOTO       L__check_cond128
L__check_cond127:
	BCF        3, 0
L__check_cond128:
	BTFSS      3, 0
	GOTO       L__check_cond129
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond129
	BSF        R2, 0
	GOTO       L__check_cond130
L__check_cond129:
	BCF        R2, 0
L__check_cond130:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond131
	BSF        3, 0
	GOTO       L__check_cond132
L__check_cond131:
	BCF        3, 0
L__check_cond132:
	BTFSS      R2, 0
	GOTO       L__check_cond133
	BTFSS      3, 0
	GOTO       L__check_cond133
	BSF        R2, 0
	GOTO       L__check_cond134
L__check_cond133:
	BCF        R2, 0
L__check_cond134:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond20
	MOVLW      9
	MOVWF      _guc_choice+0
	GOTO       L_check_cond21
L_check_cond20:
;Tractor.c,61 :: 		else if(COND10) guc_choice=10;
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond135
	BSF        3, 0
	GOTO       L__check_cond136
L__check_cond135:
	BCF        3, 0
L__check_cond136:
	BTFSS      3, 0
	GOTO       L__check_cond137
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond137
	BSF        R2, 0
	GOTO       L__check_cond138
L__check_cond137:
	BCF        R2, 0
L__check_cond138:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond139
	BSF        3, 0
	GOTO       L__check_cond140
L__check_cond139:
	BCF        3, 0
L__check_cond140:
	BTFSS      R2, 0
	GOTO       L__check_cond141
	BTFSS      3, 0
	GOTO       L__check_cond141
	BSF        R2, 0
	GOTO       L__check_cond142
L__check_cond141:
	BCF        R2, 0
L__check_cond142:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       _Eng_On+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond22
	MOVLW      10
	MOVWF      _guc_choice+0
	GOTO       L_check_cond23
L_check_cond22:
;Tractor.c,62 :: 		else if(COND11) guc_choice=11;
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond143
	BSF        R2, 0
	GOTO       L__check_cond144
L__check_cond143:
	BCF        R2, 0
L__check_cond144:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond145
	BSF        3, 0
	GOTO       L__check_cond146
L__check_cond145:
	BCF        3, 0
L__check_cond146:
	BTFSS      R2, 0
	GOTO       L__check_cond147
	BTFSS      3, 0
	GOTO       L__check_cond147
	BSF        R2, 0
	GOTO       L__check_cond148
L__check_cond147:
	BCF        R2, 0
L__check_cond148:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond149
	BSF        3, 0
	GOTO       L__check_cond150
L__check_cond149:
	BCF        3, 0
L__check_cond150:
	BTFSS      R2, 0
	GOTO       L__check_cond151
	BTFSS      3, 0
	GOTO       L__check_cond151
	BSF        R2, 0
	GOTO       L__check_cond152
L__check_cond151:
	BCF        R2, 0
L__check_cond152:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond24
	MOVLW      11
	MOVWF      _guc_choice+0
	GOTO       L_check_cond25
L_check_cond24:
;Tractor.c,63 :: 		else if(COND12) guc_choice=12;
	BTFSC      PORTC+0, 3
	GOTO       L__check_cond153
	BSF        R2, 0
	GOTO       L__check_cond154
L__check_cond153:
	BCF        R2, 0
L__check_cond154:
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond155
	BSF        3, 0
	GOTO       L__check_cond156
L__check_cond155:
	BCF        3, 0
L__check_cond156:
	BTFSS      R2, 0
	GOTO       L__check_cond157
	BTFSS      3, 0
	GOTO       L__check_cond157
	BSF        R2, 0
	GOTO       L__check_cond158
L__check_cond157:
	BCF        R2, 0
L__check_cond158:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond159
	BSF        3, 0
	GOTO       L__check_cond160
L__check_cond159:
	BCF        3, 0
L__check_cond160:
	BTFSS      R2, 0
	GOTO       L__check_cond161
	BTFSS      3, 0
	GOTO       L__check_cond161
	BSF        R2, 0
	GOTO       L__check_cond162
L__check_cond161:
	BCF        R2, 0
L__check_cond162:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       _Eng_On+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond26
	MOVLW      12
	MOVWF      _guc_choice+0
	GOTO       L_check_cond27
L_check_cond26:
;Tractor.c,64 :: 		else if(COND13) guc_choice=13;
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
	BTFSS      R2, 0
	GOTO       L__check_cond167
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond167
	BSF        R2, 0
	GOTO       L__check_cond168
L__check_cond167:
	BCF        R2, 0
L__check_cond168:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond28
	MOVLW      13
	MOVWF      _guc_choice+0
L_check_cond28:
L_check_cond27:
L_check_cond25:
L_check_cond23:
L_check_cond21:
L_check_cond19:
L_check_cond17:
L_check_cond15:
L_check_cond13:
L_check_cond11:
L_check_cond9:
L_check_cond7:
L_check_cond5:
;Tractor.c,79 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;Tractor.c,81 :: 		void exe_cond()
;Tractor.c,83 :: 		guc_sec=0;
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
;Tractor.c,84 :: 		switch(guc_choice)
	GOTO       L_exe_cond29
;Tractor.c,86 :: 		case 1: guc_buzz_state=1;
L_exe_cond31:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,87 :: 		RELAY_STR = 0;
	BCF        PORTC+0, 5
;Tractor.c,88 :: 		while(COND1);
L_exe_cond32:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond170
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond170
	BSF        3, 0
	GOTO       L__exe_cond171
L__exe_cond170:
	BCF        3, 0
L__exe_cond171:
	BTFSS      3, 0
	GOTO       L__exe_cond172
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond172
	BSF        R2, 0
	GOTO       L__exe_cond173
L__exe_cond172:
	BCF        R2, 0
L__exe_cond173:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond33
	GOTO       L_exe_cond32
L_exe_cond33:
;Tractor.c,89 :: 		RELAY_STR = 1;
	BSF        PORTC+0, 5
;Tractor.c,90 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,91 :: 		break;
	GOTO       L_exe_cond30
;Tractor.c,93 :: 		case 2: guc_buzz_state=1;
L_exe_cond34:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,94 :: 		RELAY_SOL = 1;
	BSF        PORTC+0, 4
;Tractor.c,95 :: 		while(guc_sec<6);
L_exe_cond35:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond174
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond174:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond36
	GOTO       L_exe_cond35
L_exe_cond36:
;Tractor.c,96 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 4
;Tractor.c,97 :: 		while(COND2);
L_exe_cond37:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond175
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond175
	BSF        3, 0
	GOTO       L__exe_cond176
L__exe_cond175:
	BCF        3, 0
L__exe_cond176:
	BTFSS      3, 0
	GOTO       L__exe_cond177
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond177
	BSF        R2, 0
	GOTO       L__exe_cond178
L__exe_cond177:
	BCF        R2, 0
L__exe_cond178:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       _Eng_On+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond38
	GOTO       L_exe_cond37
L_exe_cond38:
;Tractor.c,98 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,99 :: 		break;
	GOTO       L_exe_cond30
;Tractor.c,101 :: 		case 3: guc_buzz_state=1;
L_exe_cond39:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,102 :: 		while(COND3);
L_exe_cond40:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond179
	BSF        3, 0
	GOTO       L__exe_cond180
L__exe_cond179:
	BCF        3, 0
L__exe_cond180:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond181
	BTFSS      3, 0
	GOTO       L__exe_cond181
	BSF        R2, 0
	GOTO       L__exe_cond182
L__exe_cond181:
	BCF        R2, 0
L__exe_cond182:
	BTFSS      R2, 0
	GOTO       L__exe_cond183
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond183
	BSF        R2, 0
	GOTO       L__exe_cond184
L__exe_cond183:
	BCF        R2, 0
L__exe_cond184:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond41
	GOTO       L_exe_cond40
L_exe_cond41:
;Tractor.c,103 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,104 :: 		break;
	GOTO       L_exe_cond30
;Tractor.c,106 :: 		case 4: guc_buzz_state=1;
L_exe_cond42:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,107 :: 		while(COND4);
L_exe_cond43:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond185
	BSF        3, 0
	GOTO       L__exe_cond186
L__exe_cond185:
	BCF        3, 0
L__exe_cond186:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond187
	BTFSS      3, 0
	GOTO       L__exe_cond187
	BSF        R2, 0
	GOTO       L__exe_cond188
L__exe_cond187:
	BCF        R2, 0
L__exe_cond188:
	BTFSS      R2, 0
	GOTO       L__exe_cond189
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond189
	BSF        3, 0
	GOTO       L__exe_cond190
L__exe_cond189:
	BCF        3, 0
L__exe_cond190:
	CLRF       R0
	BTFSC      3, 0
	INCF       R0, 1
	MOVF       _Eng_On+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond44
	GOTO       L_exe_cond43
L_exe_cond44:
;Tractor.c,108 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,109 :: 		break;
	GOTO       L_exe_cond30
;Tractor.c,111 :: 		case 5: guc_buzz_state=1;
L_exe_cond45:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
;Tractor.c,112 :: 		RELAY_STR = 0;
	BCF        PORTC+0, 5
;Tractor.c,113 :: 		while(COND5);
L_exe_cond46:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond191
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond191
	BSF        R2, 0
	GOTO       L__exe_cond192
L__exe_cond191:
	BCF        R2, 0
L__exe_cond192:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond193
	BSF        3, 0
	GOTO       L__exe_cond194
L__exe_cond193:
	BCF        3, 0
L__exe_cond194:
	BTFSS      R2, 0
	GOTO       L__exe_cond195
	BTFSS      3, 0
	GOTO       L__exe_cond195
	BSF        R2, 0
	GOTO       L__exe_cond196
L__exe_cond195:
	BCF        R2, 0
L__exe_cond196:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond47
	GOTO       L_exe_cond46
L_exe_cond47:
;Tractor.c,114 :: 		RELAY_STR = 1;
	BSF        PORTC+0, 5
;Tractor.c,115 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,116 :: 		break;
	GOTO       L_exe_cond30
;Tractor.c,118 :: 		case 6: RELAY_SOL = 1;
L_exe_cond48:
	BSF        PORTC+0, 4
;Tractor.c,119 :: 		while(guc_sec<6);
L_exe_cond49:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond197
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond197:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond50
	GOTO       L_exe_cond49
L_exe_cond50:
;Tractor.c,120 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 4
;Tractor.c,121 :: 		while(COND6);
L_exe_cond51:
	BTFSS      PORTC+0, 3
	GOTO       L__exe_cond198
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond198
	BSF        R2, 0
	GOTO       L__exe_cond199
L__exe_cond198:
	BCF        R2, 0
L__exe_cond199:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond200
	BSF        3, 0
	GOTO       L__exe_cond201
L__exe_cond200:
	BCF        3, 0
L__exe_cond201:
	BTFSS      R2, 0
	GOTO       L__exe_cond202
	BTFSS      3, 0
	GOTO       L__exe_cond202
	BSF        R2, 0
	GOTO       L__exe_cond203
L__exe_cond202:
	BCF        R2, 0
L__exe_cond203:
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       _Eng_On+0, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond52
	GOTO       L_exe_cond51
L_exe_cond52:
;Tractor.c,122 :: 		break;
	GOTO       L_exe_cond30
;Tractor.c,124 :: 		case 9: RELAY_STR = 0;
L_exe_cond53:
	BCF        PORTC+0, 5
;Tractor.c,125 :: 		while(COND9);
L_exe_cond54:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond204
	BSF        3, 0
	GOTO       L__exe_cond205
L__exe_cond204:
	BCF        3, 0
L__exe_cond205:
	BTFSS      3, 0
	GOTO       L__exe_cond206
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond206
	BSF        R2, 0
	GOTO       L__exe_cond207
L__exe_cond206:
	BCF        R2, 0
L__exe_cond207:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond208
	BSF        3, 0
	GOTO       L__exe_cond209
L__exe_cond208:
	BCF        3, 0
L__exe_cond209:
	BTFSS      R2, 0
	GOTO       L__exe_cond210
	BTFSS      3, 0
	GOTO       L__exe_cond210
	BSF        R2, 0
	GOTO       L__exe_cond211
L__exe_cond210:
	BCF        R2, 0
L__exe_cond211:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond55
	GOTO       L_exe_cond54
L_exe_cond55:
;Tractor.c,126 :: 		RELAY_STR = 1;
	BSF        PORTC+0, 5
;Tractor.c,127 :: 		break;
	GOTO       L_exe_cond30
;Tractor.c,129 :: 		case 13: RELAY_STR = 0;
L_exe_cond56:
	BCF        PORTC+0, 5
;Tractor.c,130 :: 		while(COND13);
L_exe_cond57:
	BTFSC      PORTC+0, 3
	GOTO       L__exe_cond212
	BSF        3, 0
	GOTO       L__exe_cond213
L__exe_cond212:
	BCF        3, 0
L__exe_cond213:
	BTFSS      3, 0
	GOTO       L__exe_cond214
	BTFSS      PORTC+0, 2
	GOTO       L__exe_cond214
	BSF        R2, 0
	GOTO       L__exe_cond215
L__exe_cond214:
	BCF        R2, 0
L__exe_cond215:
	BTFSS      R2, 0
	GOTO       L__exe_cond216
	BTFSS      PORTC+0, 1
	GOTO       L__exe_cond216
	BSF        R2, 0
	GOTO       L__exe_cond217
L__exe_cond216:
	BCF        R2, 0
L__exe_cond217:
	MOVF       _Eng_On+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      R1
	CLRF       R0
	BTFSC      R2, 0
	INCF       R0, 1
	MOVF       R1, 0
	ANDWF      R0, 1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond58
	GOTO       L_exe_cond57
L_exe_cond58:
;Tractor.c,131 :: 		RELAY_STR = 1;
	BSF        PORTC+0, 5
;Tractor.c,132 :: 		break;
	GOTO       L_exe_cond30
;Tractor.c,134 :: 		default: guc_choice=0;
L_exe_cond59:
	CLRF       _guc_choice+0
;Tractor.c,135 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,136 :: 		RELAY_STR = 1;
	BSF        PORTC+0, 5
;Tractor.c,137 :: 		break;
	GOTO       L_exe_cond30
;Tractor.c,138 :: 		}
L_exe_cond29:
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond31
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond34
	MOVF       _guc_choice+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond39
	MOVF       _guc_choice+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond42
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond45
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond48
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond53
	MOVF       _guc_choice+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond56
	GOTO       L_exe_cond59
L_exe_cond30:
;Tractor.c,139 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_my_delay:

;Tractor.c,173 :: 		void my_delay()
;Tractor.c,175 :: 		for(i=0;i<1;i++)
	CLRF       _i+0
	CLRF       _i+1
L_my_delay60:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay219
	MOVLW      1
	SUBWF      _i+0, 0
L__my_delay219:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay61
;Tractor.c,176 :: 		for(j=0;j<400;j++)
	CLRF       _j+0
	CLRF       _j+1
L_my_delay63:
	MOVLW      1
	SUBWF      _j+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay220
	MOVLW      144
	SUBWF      _j+0, 0
L__my_delay220:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay64
;Tractor.c,177 :: 		asm CLRWDT ;
	CLRWDT
;Tractor.c,176 :: 		for(j=0;j<400;j++)
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
;Tractor.c,177 :: 		asm CLRWDT ;
	GOTO       L_my_delay63
L_my_delay64:
;Tractor.c,175 :: 		for(i=0;i<1;i++)
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
;Tractor.c,177 :: 		asm CLRWDT ;
	GOTO       L_my_delay60
L_my_delay61:
;Tractor.c,178 :: 		}
L_end_my_delay:
	RETURN
; end of _my_delay

_sys_init:

;Tractor.c,181 :: 		void sys_init()
;Tractor.c,184 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;Tractor.c,185 :: 		LATA = 0x00;
	CLRF       LATA+0
;Tractor.c,186 :: 		LATC = 0x00;
	CLRF       LATC+0
;Tractor.c,188 :: 		TRISA=0x20;
	MOVLW      32
	MOVWF      TRISA+0
;Tractor.c,189 :: 		TRISC=0x2F;
	MOVLW      47
	MOVWF      TRISC+0
;Tractor.c,191 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;Tractor.c,192 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;Tractor.c,195 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;Tractor.c,196 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 4
;Tractor.c,197 :: 		RELAY_STR = 0;
	BCF        PORTC+0, 5
;Tractor.c,200 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;Tractor.c,201 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;Tractor.c,202 :: 		TMR1_Initialize();
	CALL       _TMR1_Initialize+0
;Tractor.c,204 :: 		TMR2_Initialize();
	CALL       _TMR2_Initialize+0
;Tractor.c,205 :: 		PWM3_Initialize();
	CALL       _PWM3_Initialize+0
;Tractor.c,207 :: 		for(i=0;i<6;i++) guc_cycle[i]=0;
	CLRF       sys_init_i_L0+0
L_sys_init66:
	MOVLW      6
	SUBWF      sys_init_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sys_init67
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
	GOTO       L_sys_init66
L_sys_init67:
;Tractor.c,208 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Tractor.c,209 :: 		RELAY_STR = 1;
	BSF        PORTC+0, 5
;Tractor.c,210 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;Tractor.c,212 :: 		void main()
;Tractor.c,215 :: 		sys_init();
	CALL       _sys_init+0
;Tractor.c,216 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;Tractor.c,218 :: 		while(1)
L_main69:
;Tractor.c,220 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;Tractor.c,221 :: 		if(guc_choice>0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main71
;Tractor.c,222 :: 		exe_cond();               /*Execute the condtion*/
	CALL       _exe_cond+0
L_main71:
;Tractor.c,223 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;Tractor.c,225 :: 		if(demo_time>360)
	MOVF       _demo_time+1, 0
	SUBLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__main223
	MOVF       _demo_time+0, 0
	SUBLW      104
L__main223:
	BTFSC      STATUS+0, 0
	GOTO       L_main72
;Tractor.c,227 :: 		while(1);
L_main73:
	GOTO       L_main73
;Tractor.c,228 :: 		}
L_main72:
;Tractor.c,230 :: 		}
	GOTO       L_main69
;Tractor.c,231 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
