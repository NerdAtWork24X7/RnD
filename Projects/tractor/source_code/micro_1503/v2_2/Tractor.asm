
_interrupt:

;Tractor.c,69 :: 		void interrupt()
;Tractor.c,71 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt49:
;Tractor.c,73 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;Tractor.c,74 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;Tractor.c,77 :: 		}
L_interrupt3:
;Tractor.c,78 :: 		}
L_end_interrupt:
L__interrupt54:
	RETFIE     %s
; end of _interrupt

_CHCK_COND:

;Tractor.c,80 :: 		void CHCK_COND(uint8 x)
;Tractor.c,83 :: 		guc_deb[x]++;
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
;Tractor.c,84 :: 		for(i=0;i<=13 && i!=x;i++){guc_deb[i] = 0;}
	CLRF       R4+0
L_CHCK_COND4:
	MOVF       R4+0, 0
	SUBLW      13
	BTFSS      STATUS+0, 0
	GOTO       L_CHCK_COND5
	MOVF       R4+0, 0
	XORWF      FARG_CHCK_COND_x+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CHCK_COND5
L__CHCK_COND50:
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
;Tractor.c,85 :: 		if(guc_deb[x] > 10){ guc_choice = x; guc_deb[x] = 0;}
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
	GOTO       L__CHCK_COND56
	MOVF       R1, 0
	SUBLW      10
L__CHCK_COND56:
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
;Tractor.c,86 :: 		}
L_end_CHCK_COND:
	RETURN
; end of _CHCK_COND

_check_cond:

;Tractor.c,89 :: 		void check_cond()
;Tractor.c,91 :: 		guc_choice = 0;
	CLRF       _guc_choice+0
;Tractor.c,92 :: 		if(COND1){ CHCK_COND(1); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond58
	BSF        R0, 0
	GOTO       L__check_cond59
L__check_cond58:
	BCF        R0, 0
L__check_cond59:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond60
	BSF        3, 0
	GOTO       L__check_cond61
L__check_cond60:
	BCF        3, 0
L__check_cond61:
	BTFSS      R0, 0
	GOTO       L__check_cond62
	BTFSS      3, 0
	GOTO       L__check_cond62
	BSF        R0, 0
	GOTO       L__check_cond63
L__check_cond62:
	BCF        R0, 0
L__check_cond63:
	BTFSC      PORTC+0, 0
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
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond68
	BSF        3, 0
	GOTO       L__check_cond69
L__check_cond68:
	BCF        3, 0
L__check_cond69:
	BTFSS      3, 0
	GOTO       L_check_cond10
	MOVLW      1
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond10:
;Tractor.c,93 :: 		if(COND2){ CHCK_COND(2); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond70
	BSF        R0, 0
	GOTO       L__check_cond71
L__check_cond70:
	BCF        R0, 0
L__check_cond71:
	BTFSC      PORTC+0, 1
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
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond76
	BSF        3, 0
	GOTO       L__check_cond77
L__check_cond76:
	BCF        3, 0
L__check_cond77:
	BTFSS      R0, 0
	GOTO       L__check_cond78
	BTFSS      3, 0
	GOTO       L__check_cond78
	BSF        R0, 0
	GOTO       L__check_cond79
L__check_cond78:
	BCF        R0, 0
L__check_cond79:
	BTFSC      PORTA+0, 5
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
	GOTO       L_check_cond11
	MOVLW      2
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond11:
;Tractor.c,94 :: 		if(COND3){ CHCK_COND(3); }
	BTFSC      PORTC+0, 2
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
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond88
	BSF        3, 0
	GOTO       L__check_cond89
L__check_cond88:
	BCF        3, 0
L__check_cond89:
	BTFSS      R0, 0
	GOTO       L__check_cond90
	BTFSS      3, 0
	GOTO       L__check_cond90
	BSF        R0, 0
	GOTO       L__check_cond91
L__check_cond90:
	BCF        R0, 0
L__check_cond91:
	BTFSS      R0, 0
	GOTO       L__check_cond92
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond92
	BSF        3, 0
	GOTO       L__check_cond93
L__check_cond92:
	BCF        3, 0
L__check_cond93:
	BTFSS      3, 0
	GOTO       L_check_cond12
	MOVLW      3
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond12:
;Tractor.c,95 :: 		if(COND4){ CHCK_COND(4); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond94
	BSF        3, 0
	GOTO       L__check_cond95
L__check_cond94:
	BCF        3, 0
L__check_cond95:
	BTFSS      3, 0
	GOTO       L__check_cond96
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond96
	BSF        R0, 0
	GOTO       L__check_cond97
L__check_cond96:
	BCF        R0, 0
L__check_cond97:
	BTFSC      PORTC+0, 0
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
	BTFSC      PORTA+0, 5
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
	BTFSS      R0, 0
	GOTO       L_check_cond13
	MOVLW      4
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond13:
;Tractor.c,96 :: 		if(COND5){ CHCK_COND(5); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond106
	BSF        R0, 0
	GOTO       L__check_cond107
L__check_cond106:
	BCF        R0, 0
L__check_cond107:
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond108
	BSF        3, 0
	GOTO       L__check_cond109
L__check_cond108:
	BCF        3, 0
L__check_cond109:
	BTFSS      R0, 0
	GOTO       L__check_cond110
	BTFSS      3, 0
	GOTO       L__check_cond110
	BSF        R0, 0
	GOTO       L__check_cond111
L__check_cond110:
	BCF        R0, 0
L__check_cond111:
	BTFSS      R0, 0
	GOTO       L__check_cond112
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond112
	BSF        3, 0
	GOTO       L__check_cond113
L__check_cond112:
	BCF        3, 0
L__check_cond113:
	BTFSS      3, 0
	GOTO       L__check_cond114
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond114
	BSF        R0, 0
	GOTO       L__check_cond115
L__check_cond114:
	BCF        R0, 0
L__check_cond115:
	BTFSS      R0, 0
	GOTO       L_check_cond14
	MOVLW      5
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond14:
;Tractor.c,97 :: 		if(COND6){ CHCK_COND(6); }
	BTFSC      PORTC+0, 2
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
	BTFSS      R0, 0
	GOTO       L__check_cond122
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond122
	BSF        R0, 0
	GOTO       L__check_cond123
L__check_cond122:
	BCF        R0, 0
L__check_cond123:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond124
	BSF        3, 0
	GOTO       L__check_cond125
L__check_cond124:
	BCF        3, 0
L__check_cond125:
	BTFSS      R0, 0
	GOTO       L__check_cond126
	BTFSS      3, 0
	GOTO       L__check_cond126
	BSF        R0, 0
	GOTO       L__check_cond127
L__check_cond126:
	BCF        R0, 0
L__check_cond127:
	BTFSS      R0, 0
	GOTO       L_check_cond15
	MOVLW      6
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond15:
;Tractor.c,98 :: 		if(COND7){ CHCK_COND(7); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond128
	BSF        3, 0
	GOTO       L__check_cond129
L__check_cond128:
	BCF        3, 0
L__check_cond129:
	BTFSS      3, 0
	GOTO       L__check_cond130
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond130
	BSF        R0, 0
	GOTO       L__check_cond131
L__check_cond130:
	BCF        R0, 0
L__check_cond131:
	BTFSS      R0, 0
	GOTO       L__check_cond132
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond132
	BSF        3, 0
	GOTO       L__check_cond133
L__check_cond132:
	BCF        3, 0
L__check_cond133:
	BTFSS      3, 0
	GOTO       L__check_cond134
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond134
	BSF        R0, 0
	GOTO       L__check_cond135
L__check_cond134:
	BCF        R0, 0
L__check_cond135:
	BTFSS      R0, 0
	GOTO       L_check_cond16
	MOVLW      7
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond16:
;Tractor.c,99 :: 		if(COND8){ CHCK_COND(8); }
	BTFSC      PORTC+0, 2
	GOTO       L__check_cond136
	BSF        3, 0
	GOTO       L__check_cond137
L__check_cond136:
	BCF        3, 0
L__check_cond137:
	BTFSS      3, 0
	GOTO       L__check_cond138
	BTFSS      PORTC+0, 1
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
	GOTO       L_check_cond17
	MOVLW      8
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond17:
;Tractor.c,100 :: 		if(COND9){ CHCK_COND(9); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond146
	BSF        3, 0
	GOTO       L__check_cond147
L__check_cond146:
	BCF        3, 0
L__check_cond147:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond148
	BTFSS      3, 0
	GOTO       L__check_cond148
	BSF        R0, 0
	GOTO       L__check_cond149
L__check_cond148:
	BCF        R0, 0
L__check_cond149:
	BTFSS      R0, 0
	GOTO       L__check_cond150
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond150
	BSF        3, 0
	GOTO       L__check_cond151
L__check_cond150:
	BCF        3, 0
L__check_cond151:
	BTFSS      3, 0
	GOTO       L__check_cond152
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond152
	BSF        R0, 0
	GOTO       L__check_cond153
L__check_cond152:
	BCF        R0, 0
L__check_cond153:
	BTFSS      R0, 0
	GOTO       L_check_cond18
	MOVLW      9
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond18:
;Tractor.c,101 :: 		if(COND10){ CHCK_COND(10); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond154
	BSF        3, 0
	GOTO       L__check_cond155
L__check_cond154:
	BCF        3, 0
L__check_cond155:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond156
	BTFSS      3, 0
	GOTO       L__check_cond156
	BSF        R0, 0
	GOTO       L__check_cond157
L__check_cond156:
	BCF        R0, 0
L__check_cond157:
	BTFSS      R0, 0
	GOTO       L__check_cond158
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond158
	BSF        R0, 0
	GOTO       L__check_cond159
L__check_cond158:
	BCF        R0, 0
L__check_cond159:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond160
	BSF        3, 0
	GOTO       L__check_cond161
L__check_cond160:
	BCF        3, 0
L__check_cond161:
	BTFSS      R0, 0
	GOTO       L__check_cond162
	BTFSS      3, 0
	GOTO       L__check_cond162
	BSF        R0, 0
	GOTO       L__check_cond163
L__check_cond162:
	BCF        R0, 0
L__check_cond163:
	BTFSS      R0, 0
	GOTO       L_check_cond19
	MOVLW      10
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond19:
;Tractor.c,102 :: 		if(COND11){ CHCK_COND(11); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond164
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond164
	BSF        3, 0
	GOTO       L__check_cond165
L__check_cond164:
	BCF        3, 0
L__check_cond165:
	BTFSS      3, 0
	GOTO       L__check_cond166
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond166
	BSF        R0, 0
	GOTO       L__check_cond167
L__check_cond166:
	BCF        R0, 0
L__check_cond167:
	BTFSS      R0, 0
	GOTO       L__check_cond168
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond168
	BSF        3, 0
	GOTO       L__check_cond169
L__check_cond168:
	BCF        3, 0
L__check_cond169:
	BTFSS      3, 0
	GOTO       L_check_cond20
	MOVLW      11
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond20:
;Tractor.c,103 :: 		if(COND12){ CHCK_COND(12); }
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond170
	BTFSS      PORTC+0, 1
	GOTO       L__check_cond170
	BSF        3, 0
	GOTO       L__check_cond171
L__check_cond170:
	BCF        3, 0
L__check_cond171:
	BTFSS      3, 0
	GOTO       L__check_cond172
	BTFSS      PORTC+0, 0
	GOTO       L__check_cond172
	BSF        R0, 0
	GOTO       L__check_cond173
L__check_cond172:
	BCF        R0, 0
L__check_cond173:
	BTFSC      PORTA+0, 5
	GOTO       L__check_cond174
	BSF        3, 0
	GOTO       L__check_cond175
L__check_cond174:
	BCF        3, 0
L__check_cond175:
	BTFSS      R0, 0
	GOTO       L__check_cond176
	BTFSS      3, 0
	GOTO       L__check_cond176
	BSF        R0, 0
	GOTO       L__check_cond177
L__check_cond176:
	BCF        R0, 0
L__check_cond177:
	BTFSS      R0, 0
	GOTO       L_check_cond21
	MOVLW      12
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond21:
;Tractor.c,104 :: 		if(COND13){ CHCK_COND(13); }
	BTFSC      PORTC+0, 1
	GOTO       L__check_cond178
	BSF        3, 0
	GOTO       L__check_cond179
L__check_cond178:
	BCF        3, 0
L__check_cond179:
	BTFSS      PORTC+0, 2
	GOTO       L__check_cond180
	BTFSS      3, 0
	GOTO       L__check_cond180
	BSF        R0, 0
	GOTO       L__check_cond181
L__check_cond180:
	BCF        R0, 0
L__check_cond181:
	BTFSC      PORTC+0, 0
	GOTO       L__check_cond182
	BSF        3, 0
	GOTO       L__check_cond183
L__check_cond182:
	BCF        3, 0
L__check_cond183:
	BTFSS      R0, 0
	GOTO       L__check_cond184
	BTFSS      3, 0
	GOTO       L__check_cond184
	BSF        R0, 0
	GOTO       L__check_cond185
L__check_cond184:
	BCF        R0, 0
L__check_cond185:
	BTFSS      R0, 0
	GOTO       L__check_cond186
	BTFSS      PORTA+0, 5
	GOTO       L__check_cond186
	BSF        3, 0
	GOTO       L__check_cond187
L__check_cond186:
	BCF        3, 0
L__check_cond187:
	BTFSS      3, 0
	GOTO       L_check_cond22
	MOVLW      13
	MOVWF      FARG_CHCK_COND_x+0
	CALL       _CHCK_COND+0
L_check_cond22:
;Tractor.c,105 :: 		asm CLRWDT ;
	CLRWDT
;Tractor.c,107 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;Tractor.c,109 :: 		void exe_cond()
;Tractor.c,111 :: 		if(guc_choice == 1 || guc_choice == 2 || guc_choice == 3
	MOVF       _guc_choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond52
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond52
	MOVF       _guc_choice+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond52
;Tractor.c,112 :: 		|| guc_choice == 4 || guc_choice == 5){guc_buzz_state=1;}
	MOVF       _guc_choice+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond52
	MOVF       _guc_choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond52
	GOTO       L_exe_cond25
L__exe_cond52:
	MOVLW      1
	MOVWF      _guc_buzz_state+0
	GOTO       L_exe_cond26
L_exe_cond25:
;Tractor.c,113 :: 		else { guc_buzz_state=0;}
	CLRF       _guc_buzz_state+0
L_exe_cond26:
;Tractor.c,115 :: 		if(guc_choice == 6 || guc_choice == 7 || guc_choice == 8
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond51
	MOVF       _guc_choice+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond51
	MOVF       _guc_choice+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond51
;Tractor.c,116 :: 		|| guc_choice == 9 || guc_choice == 10 || guc_choice == 11
	MOVF       _guc_choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond51
	MOVF       _guc_choice+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond51
	MOVF       _guc_choice+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond51
;Tractor.c,117 :: 		|| guc_choice == 12)
	MOVF       _guc_choice+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L__exe_cond51
	GOTO       L_exe_cond29
L__exe_cond51:
;Tractor.c,118 :: 		{P_IND = 1;}
	BSF        PORTC+0, 4
	GOTO       L_exe_cond30
L_exe_cond29:
;Tractor.c,119 :: 		else { P_IND = 0;}
	BCF        PORTC+0, 4
L_exe_cond30:
;Tractor.c,127 :: 		if(guc_choice == 2)
	MOVF       _guc_choice+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond31
;Tractor.c,131 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond32:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond189
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond189:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond33
	GOTO       L_exe_cond32
L_exe_cond33:
;Tractor.c,132 :: 		RELAY_SOL = 0;rel_lock = 1;
	BCF        PORTC+0, 5
	MOVLW      1
	MOVWF      _rel_lock+0
;Tractor.c,133 :: 		while(COND2)asm CLRWDT ;
L_exe_cond34:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond190
	BSF        R1, 0
	GOTO       L__exe_cond191
L__exe_cond190:
	BCF        R1, 0
L__exe_cond191:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond192
	BSF        3, 0
	GOTO       L__exe_cond193
L__exe_cond192:
	BCF        3, 0
L__exe_cond193:
	BTFSS      R1, 0
	GOTO       L__exe_cond194
	BTFSS      3, 0
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
	GOTO       L_exe_cond35
	CLRWDT
	GOTO       L_exe_cond34
L_exe_cond35:
;Tractor.c,134 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,136 :: 		}
	GOTO       L_exe_cond36
L_exe_cond31:
;Tractor.c,137 :: 		else if(guc_choice == 6)
	MOVF       _guc_choice+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_exe_cond37
;Tractor.c,141 :: 		guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
	CLRF       _guc_sec+0
	CLRF       _guc_sec+1
	BSF        PORTC+0, 5
L_exe_cond38:
	MOVLW      0
	SUBWF      _guc_sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__exe_cond204
	MOVLW      6
	SUBWF      _guc_sec+0, 0
L__exe_cond204:
	BTFSC      STATUS+0, 0
	GOTO       L_exe_cond39
	GOTO       L_exe_cond38
L_exe_cond39:
;Tractor.c,142 :: 		RELAY_SOL = 0;rel_lock = 1;
	BCF        PORTC+0, 5
	MOVLW      1
	MOVWF      _rel_lock+0
;Tractor.c,143 :: 		while(COND6)asm CLRWDT ;
L_exe_cond40:
	BTFSC      PORTC+0, 2
	GOTO       L__exe_cond205
	BSF        R1, 0
	GOTO       L__exe_cond206
L__exe_cond205:
	BCF        R1, 0
L__exe_cond206:
	BTFSC      PORTC+0, 1
	GOTO       L__exe_cond207
	BSF        3, 0
	GOTO       L__exe_cond208
L__exe_cond207:
	BCF        3, 0
L__exe_cond208:
	BTFSS      R1, 0
	GOTO       L__exe_cond209
	BTFSS      3, 0
	GOTO       L__exe_cond209
	BSF        R1, 0
	GOTO       L__exe_cond210
L__exe_cond209:
	BCF        R1, 0
L__exe_cond210:
	BTFSS      R1, 0
	GOTO       L__exe_cond211
	BTFSS      PORTC+0, 0
	GOTO       L__exe_cond211
	BSF        R1, 0
	GOTO       L__exe_cond212
L__exe_cond211:
	BCF        R1, 0
L__exe_cond212:
	BTFSC      PORTA+0, 5
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
	GOTO       L_exe_cond41
	CLRWDT
	GOTO       L_exe_cond40
L_exe_cond41:
;Tractor.c,144 :: 		guc_buzz_state=0;
	CLRF       _guc_buzz_state+0
;Tractor.c,146 :: 		}
	GOTO       L_exe_cond42
L_exe_cond37:
;Tractor.c,147 :: 		else { RELAY_SOL = 0;}
	BCF        PORTC+0, 5
L_exe_cond42:
L_exe_cond36:
;Tractor.c,252 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_sys_init:

;Tractor.c,287 :: 		void sys_init()
;Tractor.c,290 :: 		OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;Tractor.c,292 :: 		PORTA = 0x00;
	CLRF       PORTA+0
;Tractor.c,293 :: 		LATA = 0x00;
	CLRF       LATA+0
;Tractor.c,294 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;Tractor.c,295 :: 		TRISA=0x20;
	MOVLW      32
	MOVWF      TRISA+0
;Tractor.c,297 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;Tractor.c,298 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;Tractor.c,299 :: 		LATC = 0x00;
	CLRF       LATC+0
;Tractor.c,300 :: 		TRISC=0x07;
	MOVLW      7
	MOVWF      TRISC+0
;Tractor.c,302 :: 		BUZZER = 0;
	BCF        PORTA+0, 2
;Tractor.c,303 :: 		RELAY_SOL = 0;
	BCF        PORTC+0, 5
;Tractor.c,306 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;Tractor.c,307 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;Tractor.c,313 :: 		for(i=0;i<6;i++) guc_cycle[i]=0;
	CLRF       sys_init_i_L0+0
L_sys_init43:
	MOVLW      6
	SUBWF      sys_init_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_sys_init44
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
	GOTO       L_sys_init43
L_sys_init44:
;Tractor.c,314 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Tractor.c,319 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;Tractor.c,321 :: 		void main()
;Tractor.c,324 :: 		sys_init();
	CALL       _sys_init+0
;Tractor.c,325 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;Tractor.c,327 :: 		while(1)
L_main46:
;Tractor.c,329 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;Tractor.c,330 :: 		if(guc_choice > 0)
	MOVF       _guc_choice+0, 0
	SUBLW      0
	BTFSC      STATUS+0, 0
	GOTO       L_main48
;Tractor.c,331 :: 		exe_cond();
	CALL       _exe_cond+0
L_main48:
;Tractor.c,332 :: 		guc_choice=0;                 /*Clear the condition*/
	CLRF       _guc_choice+0
;Tractor.c,339 :: 		asm CLRWDT ;
	CLRWDT
;Tractor.c,340 :: 		}
	GOTO       L_main46
;Tractor.c,341 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
