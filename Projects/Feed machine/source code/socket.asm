
_set_socket:

;socket.c,39 :: 		void set_socket()
;socket.c,42 :: 		switch(cur_mode[0])
	GOTO       L_set_socket0
;socket.c,44 :: 		case 0 : SOC_1=0; break;
L_set_socket2:
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_set_socket1
;socket.c,45 :: 		case 1 : SOC_1=1; break;
L_set_socket3:
	BSF        RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_set_socket1
;socket.c,46 :: 		case 2 : if((sec%TIMER_SEC_2)==0){ SOC_1^=1; }
L_set_socket4:
	MOVLW      3
	MOVWF      R4+0
	MOVF       _sec+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_set_socket5
	MOVLW
	XORWF      RB5_bit+0, 1
L_set_socket5:
;socket.c,47 :: 		break;
	GOTO       L_set_socket1
;socket.c,48 :: 		case 3 : if((mins%TIMER_MIN_10)==0){ SOC_1^=1; }
L_set_socket6:
	MOVLW      10
	MOVWF      R4+0
	MOVF       _mins+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_set_socket7
	MOVLW
	XORWF      RB5_bit+0, 1
L_set_socket7:
;socket.c,49 :: 		break;
	GOTO       L_set_socket1
;socket.c,50 :: 		default : SOC_1=0; break;
L_set_socket8:
	BCF        RB5_bit+0, BitPos(RB5_bit+0)
	GOTO       L_set_socket1
;socket.c,51 :: 		}
L_set_socket0:
	MOVF       _cur_mode+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket2
	MOVF       _cur_mode+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket3
	MOVF       _cur_mode+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket4
	MOVF       _cur_mode+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket6
	GOTO       L_set_socket8
L_set_socket1:
;socket.c,54 :: 		switch(cur_mode[1])
	GOTO       L_set_socket9
;socket.c,56 :: 		case 0 : SOC_2=0; break;
L_set_socket11:
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_set_socket10
;socket.c,57 :: 		case 1 : SOC_2=1; break;
L_set_socket12:
	BSF        RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_set_socket10
;socket.c,58 :: 		case 2 : if((sec%TIMER_SEC_4)==0){ SOC_2^=1;}
L_set_socket13:
	MOVLW      5
	MOVWF      R4+0
	MOVF       _sec+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_set_socket14
	MOVLW
	XORWF      RB4_bit+0, 1
L_set_socket14:
;socket.c,59 :: 		break;
	GOTO       L_set_socket10
;socket.c,60 :: 		case 3 : if((mins%TIMER_MIN_30)==0){ SOC_2^=1;  }
L_set_socket15:
	MOVLW      30
	MOVWF      R4+0
	MOVF       _mins+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_set_socket16
	MOVLW
	XORWF      RB4_bit+0, 1
L_set_socket16:
;socket.c,61 :: 		break;
	GOTO       L_set_socket10
;socket.c,62 :: 		default :SOC_2=0; break;
L_set_socket17:
	BCF        RB4_bit+0, BitPos(RB4_bit+0)
	GOTO       L_set_socket10
;socket.c,63 :: 		}
L_set_socket9:
	MOVF       _cur_mode+1, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket11
	MOVF       _cur_mode+1, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket12
	MOVF       _cur_mode+1, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket13
	MOVF       _cur_mode+1, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket15
	GOTO       L_set_socket17
L_set_socket10:
;socket.c,66 :: 		switch(cur_mode[2])
	GOTO       L_set_socket18
;socket.c,68 :: 		case 0 : SOC_3=0; break;
L_set_socket20:
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_set_socket19
;socket.c,69 :: 		case 1 : SOC_3=1; break;
L_set_socket21:
	BSF        RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_set_socket19
;socket.c,70 :: 		case 2 : if((sec%TIMER_SEC_6)==0){ SOC_3^=1;}
L_set_socket22:
	MOVLW      7
	MOVWF      R4+0
	MOVF       _sec+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_set_socket23
	MOVLW
	XORWF      RC7_bit+0, 1
L_set_socket23:
;socket.c,71 :: 		break;
	GOTO       L_set_socket19
;socket.c,72 :: 		case 3 : if((hrs%TIMER_HRS_1)==0){ SOC_3^=1; }
L_set_socket24:
	MOVLW
	XORWF      RC7_bit+0, 1
;socket.c,73 :: 		break;
	GOTO       L_set_socket19
;socket.c,74 :: 		default :SOC_3=0; break;
L_set_socket26:
	BCF        RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_set_socket19
;socket.c,75 :: 		}
L_set_socket18:
	MOVF       _cur_mode+2, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket20
	MOVF       _cur_mode+2, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket21
	MOVF       _cur_mode+2, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket22
	MOVF       _cur_mode+2, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket24
	GOTO       L_set_socket26
L_set_socket19:
;socket.c,78 :: 		switch(cur_mode[3])
	GOTO       L_set_socket27
;socket.c,80 :: 		case 0 : SOC_4=0; break;
L_set_socket29:
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_set_socket28
;socket.c,81 :: 		case 1 : SOC_4=1; break;
L_set_socket30:
	BSF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_set_socket28
;socket.c,82 :: 		case 2 : if((sec%TIMER_SEC_8)==0){ SOC_4^=1; }
L_set_socket31:
	MOVLW      9
	MOVWF      R4+0
	MOVF       _sec+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_set_socket32
	MOVLW
	XORWF      RC6_bit+0, 1
L_set_socket32:
;socket.c,83 :: 		break;
	GOTO       L_set_socket28
;socket.c,84 :: 		case 3 : if((hrs%TIMER_HRS_6)==0){ SOC_4^=1;}
L_set_socket33:
	MOVLW      6
	MOVWF      R4+0
	MOVF       _hrs+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_set_socket34
	MOVLW
	XORWF      RC6_bit+0, 1
L_set_socket34:
;socket.c,85 :: 		break;
	GOTO       L_set_socket28
;socket.c,86 :: 		default :SOC_4=0; break;
L_set_socket35:
	BCF        RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_set_socket28
;socket.c,87 :: 		}
L_set_socket27:
	MOVF       _cur_mode+3, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket29
	MOVF       _cur_mode+3, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket30
	MOVF       _cur_mode+3, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket31
	MOVF       _cur_mode+3, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket33
	GOTO       L_set_socket35
L_set_socket28:
;socket.c,90 :: 		switch(cur_mode[4])
	GOTO       L_set_socket36
;socket.c,92 :: 		case 0 : SOC_5=0; break;
L_set_socket38:
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_set_socket37
;socket.c,93 :: 		case 1 : SOC_5=1; break;
L_set_socket39:
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_set_socket37
;socket.c,94 :: 		case 2 : if((sec%TIMER_SEC_10)==0){ SOC_5^=1;}
L_set_socket40:
	MOVLW      11
	MOVWF      R4+0
	MOVF       _sec+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_set_socket41
	MOVLW
	XORWF      RC5_bit+0, 1
L_set_socket41:
;socket.c,95 :: 		break;
	GOTO       L_set_socket37
;socket.c,96 :: 		case 3 : if((hrs%TIMER_HRS_12)==0){ SOC_5^=1;}
L_set_socket42:
	MOVLW      12
	MOVWF      R4+0
	MOVF       _hrs+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_set_socket43
	MOVLW
	XORWF      RC5_bit+0, 1
L_set_socket43:
;socket.c,97 :: 		break;
	GOTO       L_set_socket37
;socket.c,98 :: 		default :SOC_5=0; break;
L_set_socket44:
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L_set_socket37
;socket.c,99 :: 		}
L_set_socket36:
	MOVF       _cur_mode+4, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket38
	MOVF       _cur_mode+4, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket39
	MOVF       _cur_mode+4, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket40
	MOVF       _cur_mode+4, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_set_socket42
	GOTO       L_set_socket44
L_set_socket37:
;socket.c,101 :: 		}
L_end_set_socket:
	RETURN
; end of _set_socket

_Set_Intensity:

;socket.c,104 :: 		void Set_Intensity()
;socket.c,108 :: 		if(pattern==1) addr=0x0000;
	MOVF       _pattern+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity45
	CLRF       Set_Intensity_addr_L0+0
	CLRF       Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity46
L_Set_Intensity45:
;socket.c,109 :: 		else if(pattern==2) addr=0x00A9;
	MOVF       _pattern+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity47
	MOVLW      169
	MOVWF      Set_Intensity_addr_L0+0
	CLRF       Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity48
L_Set_Intensity47:
;socket.c,110 :: 		else if(pattern==3) addr=0x0152;
	MOVF       _pattern+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity49
	MOVLW      82
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      1
	MOVWF      Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity50
L_Set_Intensity49:
;socket.c,111 :: 		else if(pattern==4) addr=0x01FB;
	MOVF       _pattern+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity51
	MOVLW      251
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      1
	MOVWF      Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity52
L_Set_Intensity51:
;socket.c,112 :: 		else if(pattern==5) addr=0x0202;
	MOVF       _pattern+0, 0
	XORLW      5
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity53
	MOVLW      2
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      2
	MOVWF      Set_Intensity_addr_L0+1
	GOTO       L_Set_Intensity54
L_Set_Intensity53:
;socket.c,113 :: 		else if(pattern==6) addr=0x0209;
	MOVF       _pattern+0, 0
	XORLW      6
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity55
	MOVLW      9
	MOVWF      Set_Intensity_addr_L0+0
	MOVLW      2
	MOVWF      Set_Intensity_addr_L0+1
L_Set_Intensity55:
L_Set_Intensity54:
L_Set_Intensity52:
L_Set_Intensity50:
L_Set_Intensity48:
L_Set_Intensity46:
;socket.c,115 :: 		if(hrs>=0 && hrs<1)        offset=0;
	MOVLW      0
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity58
	MOVLW      1
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity58
L__Set_Intensity181:
	CLRF       Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity59
L_Set_Intensity58:
;socket.c,116 :: 		else if(hrs>=1 && hrs<2)   offset=1;
	MOVLW      1
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity62
	MOVLW      2
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity62
L__Set_Intensity180:
	MOVLW      1
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity63
L_Set_Intensity62:
;socket.c,117 :: 		else if(hrs>=2 && hrs<3)   offset=2;
	MOVLW      2
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity66
	MOVLW      3
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity66
L__Set_Intensity179:
	MOVLW      2
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity67
L_Set_Intensity66:
;socket.c,118 :: 		else if(hrs>=3 && hrs<4)   offset=3;
	MOVLW      3
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity70
	MOVLW      4
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity70
L__Set_Intensity178:
	MOVLW      3
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity71
L_Set_Intensity70:
;socket.c,119 :: 		else if(hrs>=4 && hrs<5)   offset=4;
	MOVLW      4
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity74
	MOVLW      5
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity74
L__Set_Intensity177:
	MOVLW      4
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity75
L_Set_Intensity74:
;socket.c,120 :: 		else if(hrs>=5 && hrs<6)   offset=5;
	MOVLW      5
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity78
	MOVLW      6
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity78
L__Set_Intensity176:
	MOVLW      5
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity79
L_Set_Intensity78:
;socket.c,121 :: 		else if(hrs>=6 && hrs<7)   offset=6;
	MOVLW      6
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity82
	MOVLW      7
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity82
L__Set_Intensity175:
	MOVLW      6
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity83
L_Set_Intensity82:
;socket.c,122 :: 		else if(hrs>=7 && hrs<8)   offset=7;
	MOVLW      7
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity86
	MOVLW      8
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity86
L__Set_Intensity174:
	MOVLW      7
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity87
L_Set_Intensity86:
;socket.c,123 :: 		else if(hrs>=8 && hrs<9)   offset=8;
	MOVLW      8
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity90
	MOVLW      9
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity90
L__Set_Intensity173:
	MOVLW      8
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity91
L_Set_Intensity90:
;socket.c,124 :: 		else if(hrs>=9 && hrs<10)  offset=9;
	MOVLW      9
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity94
	MOVLW      10
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity94
L__Set_Intensity172:
	MOVLW      9
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity95
L_Set_Intensity94:
;socket.c,125 :: 		else if(hrs>=10 && hrs<11) offset=10;
	MOVLW      10
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity98
	MOVLW      11
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity98
L__Set_Intensity171:
	MOVLW      10
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity99
L_Set_Intensity98:
;socket.c,126 :: 		else if(hrs>=11 && hrs<12) offset=11;
	MOVLW      11
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity102
	MOVLW      12
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity102
L__Set_Intensity170:
	MOVLW      11
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity103
L_Set_Intensity102:
;socket.c,127 :: 		else if(hrs>=12 && hrs<13) offset=12;
	MOVLW      12
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity106
	MOVLW      13
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity106
L__Set_Intensity169:
	MOVLW      12
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity107
L_Set_Intensity106:
;socket.c,128 :: 		else if(hrs>=13 && hrs<14) offset=13;
	MOVLW      13
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity110
	MOVLW      14
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity110
L__Set_Intensity168:
	MOVLW      13
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity111
L_Set_Intensity110:
;socket.c,129 :: 		else if(hrs>=14 && hrs<15) offset=14;
	MOVLW      14
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity114
	MOVLW      15
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity114
L__Set_Intensity167:
	MOVLW      14
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity115
L_Set_Intensity114:
;socket.c,130 :: 		else if(hrs>=15 && hrs<16) offset=15;
	MOVLW      15
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity118
	MOVLW      16
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity118
L__Set_Intensity166:
	MOVLW      15
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity119
L_Set_Intensity118:
;socket.c,131 :: 		else if(hrs>=16 && hrs<17) offset=16;
	MOVLW      16
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity122
	MOVLW      17
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity122
L__Set_Intensity165:
	MOVLW      16
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity123
L_Set_Intensity122:
;socket.c,132 :: 		else if(hrs>=17 && hrs<18) offset=17;
	MOVLW      17
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity126
	MOVLW      18
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity126
L__Set_Intensity164:
	MOVLW      17
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity127
L_Set_Intensity126:
;socket.c,133 :: 		else if(hrs>=18 && hrs<19) offset=18;
	MOVLW      18
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity130
	MOVLW      19
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity130
L__Set_Intensity163:
	MOVLW      18
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity131
L_Set_Intensity130:
;socket.c,134 :: 		else if(hrs>=19 && hrs<20) offset=19;
	MOVLW      19
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity134
	MOVLW      20
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity134
L__Set_Intensity162:
	MOVLW      19
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity135
L_Set_Intensity134:
;socket.c,135 :: 		else if(hrs>=20 && hrs<21) offset=20;
	MOVLW      20
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity138
	MOVLW      21
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity138
L__Set_Intensity161:
	MOVLW      20
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity139
L_Set_Intensity138:
;socket.c,136 :: 		else if(hrs>=21 && hrs<22) offset=21;
	MOVLW      21
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity142
	MOVLW      22
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity142
L__Set_Intensity160:
	MOVLW      21
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity143
L_Set_Intensity142:
;socket.c,137 :: 		else if(hrs>=22 && hrs<23) offset=22;
	MOVLW      22
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity146
	MOVLW      23
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity146
L__Set_Intensity159:
	MOVLW      22
	MOVWF      Set_Intensity_offset_L0+0
	GOTO       L_Set_Intensity147
L_Set_Intensity146:
;socket.c,138 :: 		else if(hrs>=23 && hrs<24) offset=23;
	MOVLW      23
	SUBWF      _hrs+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity150
	MOVLW      24
	SUBWF      _hrs+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity150
L__Set_Intensity158:
	MOVLW      23
	MOVWF      Set_Intensity_offset_L0+0
L_Set_Intensity150:
L_Set_Intensity147:
L_Set_Intensity143:
L_Set_Intensity139:
L_Set_Intensity135:
L_Set_Intensity131:
L_Set_Intensity127:
L_Set_Intensity123:
L_Set_Intensity119:
L_Set_Intensity115:
L_Set_Intensity111:
L_Set_Intensity107:
L_Set_Intensity103:
L_Set_Intensity99:
L_Set_Intensity95:
L_Set_Intensity91:
L_Set_Intensity87:
L_Set_Intensity83:
L_Set_Intensity79:
L_Set_Intensity75:
L_Set_Intensity71:
L_Set_Intensity67:
L_Set_Intensity63:
L_Set_Intensity59:
;socket.c,141 :: 		for(i=0;i<6;i++)
	CLRF       Set_Intensity_i_L0+0
L_Set_Intensity151:
	MOVLW      6
	SUBWF      Set_Intensity_i_L0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_Set_Intensity152
;socket.c,143 :: 		if(pattern==0)  cur_mode[i]=def_pat[offset][i];
	MOVF       _pattern+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_Set_Intensity154
	MOVF       Set_Intensity_i_L0+0, 0
	ADDLW      _cur_mode+0
	MOVWF      FLOC__Set_Intensity+0
	MOVLW      7
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVF       Set_Intensity_offset_L0+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _def_pat+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_def_pat+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       Set_Intensity_i_L0+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	MOVF       FLOC__Set_Intensity+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	GOTO       L_Set_Intensity155
L_Set_Intensity154:
;socket.c,144 :: 		else if(pattern<=3)  cur_mode[i]=read_I2C(0xA0,addr+(offset*7)+i);
	MOVLW      128
	XORLW      3
	MOVWF      R0+0
	MOVLW      128
	XORWF      _pattern+0, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_Set_Intensity156
	MOVF       Set_Intensity_i_L0+0, 0
	ADDLW      _cur_mode+0
	MOVWF      FLOC__Set_Intensity+0
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVF       Set_Intensity_offset_L0+0, 0
	MOVWF      R0+0
	MOVLW      7
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	ADDWF      Set_Intensity_addr_L0+0, 0
	MOVWF      FARG_read_I2C_buff_add+0
	MOVF       Set_Intensity_addr_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      FARG_read_I2C_buff_add+1
	MOVF       Set_Intensity_i_L0+0, 0
	ADDWF      FARG_read_I2C_buff_add+0, 1
	BTFSC      STATUS+0, 0
	INCF       FARG_read_I2C_buff_add+1, 1
	CALL       _read_I2C+0
	MOVF       FLOC__Set_Intensity+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
	GOTO       L_Set_Intensity157
L_Set_Intensity156:
;socket.c,145 :: 		else cur_mode[i]=read_I2C(0xA0,addr+i);
	MOVF       Set_Intensity_i_L0+0, 0
	ADDLW      _cur_mode+0
	MOVWF      FLOC__Set_Intensity+0
	MOVLW      160
	MOVWF      FARG_read_I2C_sa_addr+0
	MOVF       Set_Intensity_i_L0+0, 0
	ADDWF      Set_Intensity_addr_L0+0, 0
	MOVWF      FARG_read_I2C_buff_add+0
	MOVF       Set_Intensity_addr_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      FARG_read_I2C_buff_add+1
	CALL       _read_I2C+0
	MOVF       FLOC__Set_Intensity+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
L_Set_Intensity157:
L_Set_Intensity155:
;socket.c,141 :: 		for(i=0;i<6;i++)
	INCF       Set_Intensity_i_L0+0, 1
;socket.c,146 :: 		}
	GOTO       L_Set_Intensity151
L_Set_Intensity152:
;socket.c,148 :: 		set_socket();
	CALL       _set_socket+0
;socket.c,150 :: 		memmove(pre_mode,cur_mode,sizeof(pre_mode));
	MOVLW      _pre_mode+0
	MOVWF      FARG_memmove_to+0
	MOVLW      _cur_mode+0
	MOVWF      FARG_memmove_from+0
	MOVLW      7
	MOVWF      FARG_memmove_n+0
	MOVLW      0
	MOVWF      FARG_memmove_n+1
	CALL       _memmove+0
;socket.c,151 :: 		}
L_end_Set_Intensity:
	RETURN
; end of _Set_Intensity
