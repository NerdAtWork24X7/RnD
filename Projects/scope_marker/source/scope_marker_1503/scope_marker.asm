
_interrupt:

;scope_marker.c,10 :: 		void interrupt()
;scope_marker.c,12 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt67:
;scope_marker.c,15 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;scope_marker.c,18 :: 		}
L_interrupt3:
;scope_marker.c,19 :: 		}
L_end_interrupt:
L__interrupt69:
	RETFIE     %s
; end of _interrupt

_check_cond:

;scope_marker.c,21 :: 		void check_cond()
;scope_marker.c,23 :: 		if(!DEC)
	BTFSC      PORTC+0, 0
	GOTO       L_check_cond4
;scope_marker.c,25 :: 		choice--;
	DECF       _choice+0, 1
;scope_marker.c,26 :: 		while(!DEC);
L_check_cond5:
	BTFSC      PORTC+0, 0
	GOTO       L_check_cond6
	GOTO       L_check_cond5
L_check_cond6:
;scope_marker.c,27 :: 		}
	GOTO       L_check_cond7
L_check_cond4:
;scope_marker.c,28 :: 		else if(!INC)
	BTFSC      PORTC+0, 1
	GOTO       L_check_cond8
;scope_marker.c,30 :: 		choice++;
	INCF       _choice+0, 1
;scope_marker.c,31 :: 		while(!INC);
L_check_cond9:
	BTFSC      PORTC+0, 1
	GOTO       L_check_cond10
	GOTO       L_check_cond9
L_check_cond10:
;scope_marker.c,32 :: 		}
	GOTO       L_check_cond11
L_check_cond8:
;scope_marker.c,33 :: 		else if(!SET_0)
	BTFSC      PORTC+0, 2
	GOTO       L_check_cond12
;scope_marker.c,35 :: 		choice = 5;
	MOVLW      5
	MOVWF      _choice+0
;scope_marker.c,36 :: 		while(!SET_0);
L_check_cond13:
	BTFSC      PORTC+0, 2
	GOTO       L_check_cond14
	GOTO       L_check_cond13
L_check_cond14:
;scope_marker.c,37 :: 		}
L_check_cond12:
L_check_cond11:
L_check_cond7:
;scope_marker.c,38 :: 		if(choice>17) choice=5;
	MOVF       _choice+0, 0
	SUBLW      17
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond15
	MOVLW      5
	MOVWF      _choice+0
L_check_cond15:
;scope_marker.c,40 :: 		if(choice>11)
	MOVF       _choice+0, 0
	SUBLW      11
	BTFSC      STATUS+0, 0
	GOTO       L_check_cond16
;scope_marker.c,42 :: 		if(OSCCON != 0x12)
	MOVF       OSCCON+0, 0
	XORLW      18
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond17
;scope_marker.c,45 :: 		OSCCON = 0x12;
	MOVLW      18
	MOVWF      OSCCON+0
;scope_marker.c,48 :: 		}
L_check_cond17:
;scope_marker.c,49 :: 		}
	GOTO       L_check_cond18
L_check_cond16:
;scope_marker.c,52 :: 		if(OSCCON != 0x7A)
	MOVF       OSCCON+0, 0
	XORLW      122
	BTFSC      STATUS+0, 2
	GOTO       L_check_cond19
;scope_marker.c,55 :: 		OSCCON = 0x7A;
	MOVLW      122
	MOVWF      OSCCON+0
;scope_marker.c,59 :: 		}
L_check_cond19:
;scope_marker.c,60 :: 		}
L_check_cond18:
;scope_marker.c,61 :: 		}
L_end_check_cond:
	RETURN
; end of _check_cond

_exe_cond:

;scope_marker.c,63 :: 		void exe_cond()
;scope_marker.c,65 :: 		switch (choice)
	GOTO       L_exe_cond20
;scope_marker.c,67 :: 		case 0: if(ch_flg != 0)   /* frequency = 2Mhz , time = 0.5us*/
L_exe_cond22:
	MOVF       _ch_flg+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond23
;scope_marker.c,69 :: 		Load_TMR2(0x01,0x04,0x00);
	MOVLW      1
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,70 :: 		Load_PWM3(0xC0,0x00,0x40);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	CLRF       FARG_Load_PWM3_HByte+0
	MOVLW      64
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,71 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,72 :: 		ch_flg=0;
	CLRF       _ch_flg+0
;scope_marker.c,73 :: 		}
L_exe_cond23:
;scope_marker.c,74 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,75 :: 		case 1: if(ch_flg != 1)  /* frequency = 1Mhz , time = 1us*/
L_exe_cond24:
	MOVF       _ch_flg+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond25
;scope_marker.c,77 :: 		Load_TMR2(0x03,0x04,0x00);
	MOVLW      3
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,78 :: 		Load_PWM3(0xC0,0x00,0x40);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	CLRF       FARG_Load_PWM3_HByte+0
	MOVLW      64
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,79 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,80 :: 		ch_flg=1;
	MOVLW      1
	MOVWF      _ch_flg+0
;scope_marker.c,81 :: 		}
L_exe_cond25:
;scope_marker.c,82 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,83 :: 		case 2: if(ch_flg != 2) /* frequency = 500Khz , time = 2us*/
L_exe_cond26:
	MOVF       _ch_flg+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond27
;scope_marker.c,85 :: 		Load_TMR2(0x07,0x04,0x00);
	MOVLW      7
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,86 :: 		Load_PWM3(0xC0,0x00,0x40);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	CLRF       FARG_Load_PWM3_HByte+0
	MOVLW      64
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,87 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,88 :: 		ch_flg = 2;
	MOVLW      2
	MOVWF      _ch_flg+0
;scope_marker.c,89 :: 		}
L_exe_cond27:
;scope_marker.c,90 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,91 :: 		case 3: if(ch_flg != 3) /* frequency = 200Khz , time = 5us*/
L_exe_cond28:
	MOVF       _ch_flg+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond29
;scope_marker.c,93 :: 		Load_TMR2(0x13,0x04,0x00);
	MOVLW      19
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,94 :: 		Load_PWM3(0xC0,0x04,0xC0);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      4
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      192
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,95 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,96 :: 		ch_flg = 3;
	MOVLW      3
	MOVWF      _ch_flg+0
;scope_marker.c,97 :: 		}
L_exe_cond29:
;scope_marker.c,98 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,99 :: 		case 4: if(ch_flg != 4)  /* frequency = 100Khz , time = 10us*/
L_exe_cond30:
	MOVF       _ch_flg+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond31
;scope_marker.c,101 :: 		Load_TMR2(0x27,0x04,0x00);
	MOVLW      39
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,102 :: 		Load_PWM3(0xC0,0x01,0xC0);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      1
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      192
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,103 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,104 :: 		ch_flg = 4;
	MOVLW      4
	MOVWF      _ch_flg+0
;scope_marker.c,105 :: 		}
L_exe_cond31:
;scope_marker.c,106 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,107 :: 		case 5: if(ch_flg != 5)  /* frequency = 50Khz , time = 20us*/
L_exe_cond32:
	MOVF       _ch_flg+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond33
;scope_marker.c,109 :: 		Load_TMR2(0x4F,0x04,0x00);
	MOVLW      79
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,110 :: 		Load_PWM3(0xC0,0x03,0xC0);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      3
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      192
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,111 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,112 :: 		ch_flg = 5;
	MOVLW      5
	MOVWF      _ch_flg+0
;scope_marker.c,113 :: 		}
L_exe_cond33:
;scope_marker.c,114 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,115 :: 		case 6: if(ch_flg != 6)  /* frequency = 20Khz , time = 50us*/
L_exe_cond34:
	MOVF       _ch_flg+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond35
;scope_marker.c,117 :: 		Load_TMR2(0xC7,0x04,0x00);
	MOVLW      199
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,118 :: 		Load_PWM3(0xC0,0x09,0xC0);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      9
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      192
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,119 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,120 :: 		ch_flg=6;
	MOVLW      6
	MOVWF      _ch_flg+0
;scope_marker.c,121 :: 		}
L_exe_cond35:
;scope_marker.c,122 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,123 :: 		case 7: if(ch_flg != 7) /* frequency = 10Khz , time = 0.1ms*/
L_exe_cond36:
	MOVF       _ch_flg+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond37
;scope_marker.c,125 :: 		Load_TMR2(0x63,0x05,0x00);
	MOVLW      99
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      5
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,126 :: 		Load_PWM3(0xC0,0x04,0xC0);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      4
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      192
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,127 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,128 :: 		ch_flg = 7;
	MOVLW      7
	MOVWF      _ch_flg+0
;scope_marker.c,129 :: 		}
L_exe_cond37:
;scope_marker.c,130 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,131 :: 		case 8: if(ch_flg != 8) /* frequency = 5Khz , time = 0.2ms*/
L_exe_cond38:
	MOVF       _ch_flg+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond39
;scope_marker.c,133 :: 		Load_TMR2(0xC7,0x05,0x00);
	MOVLW      199
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      5
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,134 :: 		Load_PWM3(0xC0,0x09,0xC0);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      9
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      192
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,135 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,136 :: 		ch_flg = 8;
	MOVLW      8
	MOVWF      _ch_flg+0
;scope_marker.c,137 :: 		}
L_exe_cond39:
;scope_marker.c,138 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,139 :: 		case 9: if(ch_flg != 9)  /* frequency = 2Khz , time = 0.5ms*/
L_exe_cond40:
	MOVF       _ch_flg+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond41
;scope_marker.c,141 :: 		Load_TMR2(0x7C,0x06,0x00);
	MOVLW      124
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      6
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,142 :: 		Load_PWM3(0xC0,0x06,0x00);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      6
	MOVWF      FARG_Load_PWM3_HByte+0
	CLRF       FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,143 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,144 :: 		ch_flg = 9;
	MOVLW      9
	MOVWF      _ch_flg+0
;scope_marker.c,145 :: 		}
L_exe_cond41:
;scope_marker.c,146 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,147 :: 		case 10: if(ch_flg != 10)  /* frequency = 1Khz , time = 1ms*/
L_exe_cond42:
	MOVF       _ch_flg+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond43
;scope_marker.c,149 :: 		Load_TMR2(0xF9,0x06,0x00);
	MOVLW      249
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      6
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,150 :: 		Load_PWM3(0xC0,0x0C,0x01);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      12
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      1
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,151 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,152 :: 		ch_flg=10;
	MOVLW      10
	MOVWF      _ch_flg+0
;scope_marker.c,153 :: 		}
L_exe_cond43:
;scope_marker.c,154 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,155 :: 		case 11: if(ch_flg != 11)  /* frequency = 500hz , time = 2ms*/
L_exe_cond44:
	MOVF       _ch_flg+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond45
;scope_marker.c,157 :: 		Load_TMR2(0x7C,0x07,0x00);
	MOVLW      124
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      7
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,158 :: 		Load_PWM3(0xC0,0x06,0x00);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      6
	MOVWF      FARG_Load_PWM3_HByte+0
	CLRF       FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,159 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,160 :: 		ch_flg=11;
	MOVLW      11
	MOVWF      _ch_flg+0
;scope_marker.c,161 :: 		}
L_exe_cond45:
;scope_marker.c,162 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,163 :: 		case 12: if(ch_flg != 12)  /* frequency = 200hz , time = 5ms*/
L_exe_cond46:
	MOVF       _ch_flg+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond47
;scope_marker.c,165 :: 		Load_TMR2(0x26,0x04,0x00);
	MOVLW      38
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,166 :: 		Load_PWM3(0xC0,0x01,0xC0);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      1
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      192
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,167 :: 		TMR2IE_bit = 0;
	BCF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,168 :: 		ch_flg=12;
	MOVLW      12
	MOVWF      _ch_flg+0
;scope_marker.c,169 :: 		}
L_exe_cond47:
;scope_marker.c,170 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,171 :: 		case 13: if(ch_flg != 13) /* frequency = 100hz , time = 10ms*/
L_exe_cond48:
	MOVF       _ch_flg+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond49
;scope_marker.c,173 :: 		Load_TMR2(0x4D,0x04,0x00);
	MOVLW      77
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,174 :: 		Load_PWM3(0xC0,0x03,0xC0);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      3
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      192
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,175 :: 		ch_flg=13;
	MOVLW      13
	MOVWF      _ch_flg+0
;scope_marker.c,176 :: 		TMR2IE_bit = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,177 :: 		}
L_exe_cond49:
;scope_marker.c,178 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,179 :: 		case 14: if(ch_flg != 14) /* frequency = 50hz , time = 20ms*/
L_exe_cond50:
	MOVF       _ch_flg+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond51
;scope_marker.c,181 :: 		Load_TMR2(0x9A,0x04,0x00);
	MOVLW      154
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      4
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,182 :: 		Load_PWM3(0xC0,0x07,0x02);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      7
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      2
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,183 :: 		ch_flg=14;
	MOVLW      14
	MOVWF      _ch_flg+0
;scope_marker.c,184 :: 		TMR2IE_bit = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,185 :: 		}
L_exe_cond51:
;scope_marker.c,186 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,187 :: 		case 15: if(ch_flg!=15) /* frequency = 20hz , time = 50ms*/
L_exe_cond52:
	MOVF       _ch_flg+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond53
;scope_marker.c,189 :: 		Load_TMR2(0x60,0x05,0x00);
	MOVLW      96
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      5
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,190 :: 		Load_PWM3(0xC0,0x04,0x80);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      4
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      128
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,191 :: 		ch_flg=15;
	MOVLW      15
	MOVWF      _ch_flg+0
;scope_marker.c,192 :: 		TMR2IE_bit = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,193 :: 		}
L_exe_cond53:
;scope_marker.c,194 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,195 :: 		case 16: if(ch_flg!=16) /* frequency = 10hz , time = 0.1s*/
L_exe_cond54:
	MOVF       _ch_flg+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond55
;scope_marker.c,197 :: 		Load_TMR2(0x2F,0x06,0x00);
	MOVLW      47
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      6
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,198 :: 		Load_PWM3(0xC0,0x02,0x40);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      2
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      64
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,199 :: 		ch_flg=16;
	MOVLW      16
	MOVWF      _ch_flg+0
;scope_marker.c,200 :: 		TMR2IE_bit = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,201 :: 		}
L_exe_cond55:
;scope_marker.c,202 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,203 :: 		case 17: if(ch_flg!=17)  /* frequency = 5hz , time = 0.2s*/
L_exe_cond56:
	MOVF       _ch_flg+0, 0
	XORLW      17
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond57
;scope_marker.c,205 :: 		Load_TMR2(0x60,0x06,0x00);
	MOVLW      96
	MOVWF      FARG_Load_TMR2_Prescalar+0
	MOVLW      6
	MOVWF      FARG_Load_TMR2_T2Control+0
	CLRF       FARG_Load_TMR2_Timer2+0
	CALL       _Load_TMR2+0
;scope_marker.c,206 :: 		Load_PWM3(0xC0,0x04,0x02);
	MOVLW      192
	MOVWF      FARG_Load_PWM3_Control+0
	MOVLW      4
	MOVWF      FARG_Load_PWM3_HByte+0
	MOVLW      2
	MOVWF      FARG_Load_PWM3_LByte+0
	CALL       _Load_PWM3+0
;scope_marker.c,207 :: 		ch_flg=17;
	MOVLW      17
	MOVWF      _ch_flg+0
;scope_marker.c,208 :: 		TMR2IE_bit = 1;
	BSF        TMR2IE_bit+0, BitPos(TMR2IE_bit+0)
;scope_marker.c,209 :: 		}
L_exe_cond57:
;scope_marker.c,210 :: 		break;
	GOTO       L_exe_cond21
;scope_marker.c,211 :: 		default: break;
L_exe_cond58:
	GOTO       L_exe_cond21
;scope_marker.c,213 :: 		}
L_exe_cond20:
	MOVF       _choice+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond22
	MOVF       _choice+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond24
	MOVF       _choice+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond26
	MOVF       _choice+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond28
	MOVF       _choice+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond30
	MOVF       _choice+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond32
	MOVF       _choice+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond34
	MOVF       _choice+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond36
	MOVF       _choice+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond38
	MOVF       _choice+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond40
	MOVF       _choice+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond42
	MOVF       _choice+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond44
	MOVF       _choice+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond46
	MOVF       _choice+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond48
	MOVF       _choice+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond50
	MOVF       _choice+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond52
	MOVF       _choice+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond54
	MOVF       _choice+0, 0
	XORLW      17
	BTFSC      STATUS+0, 2
	GOTO       L_exe_cond56
	GOTO       L_exe_cond58
L_exe_cond21:
;scope_marker.c,214 :: 		}
L_end_exe_cond:
	RETURN
; end of _exe_cond

_my_delay:

;scope_marker.c,248 :: 		void my_delay()
;scope_marker.c,251 :: 		for(i=0;i<1;i++)
	CLRF       R1+0
	CLRF       R1+1
L_my_delay59:
	MOVLW      128
	XORWF      R1+1, 0
	MOVWF      R0
	MOVLW      128
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay73
	MOVLW      1
	SUBWF      R1+0, 0
L__my_delay73:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay60
;scope_marker.c,252 :: 		for(j=0;j<400;j++)
	CLRF       R3+0
	CLRF       R3+1
L_my_delay62:
	MOVLW      128
	XORWF      R3+1, 0
	MOVWF      R0
	MOVLW      128
	XORLW      1
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay74
	MOVLW      144
	SUBWF      R3+0, 0
L__my_delay74:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay63
;scope_marker.c,253 :: 		asm CLRWDT ;
	CLRWDT
;scope_marker.c,252 :: 		for(j=0;j<400;j++)
	INCF       R3+0, 1
	BTFSC      STATUS+0, 2
	INCF       R3+1, 1
;scope_marker.c,253 :: 		asm CLRWDT ;
	GOTO       L_my_delay62
L_my_delay63:
;scope_marker.c,251 :: 		for(i=0;i<1;i++)
	INCF       R1+0, 1
	BTFSC      STATUS+0, 2
	INCF       R1+1, 1
;scope_marker.c,253 :: 		asm CLRWDT ;
	GOTO       L_my_delay59
L_my_delay60:
;scope_marker.c,254 :: 		}
L_end_my_delay:
	RETURN
; end of _my_delay

_sys_init:

;scope_marker.c,257 :: 		void sys_init()
;scope_marker.c,259 :: 		OSCCON = 0x7A;   /* SCS INTOSC; SPLLEN disabled; IRCF 16MHz_HF; */
	MOVLW      122
	MOVWF      OSCCON+0
;scope_marker.c,260 :: 		ANSELA=0x00;
	CLRF       ANSELA+0
;scope_marker.c,261 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;scope_marker.c,262 :: 		TRISA=0x00;
	CLRF       TRISA+0
;scope_marker.c,263 :: 		TRISC=0x0F;
	MOVLW      15
	MOVWF      TRISC+0
;scope_marker.c,264 :: 		WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;scope_marker.c,265 :: 		GIE_bit = 1;     /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;scope_marker.c,266 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;scope_marker.c,268 :: 		void main()
;scope_marker.c,270 :: 		sys_init();
	CALL       _sys_init+0
;scope_marker.c,271 :: 		demo_time = 0;
	CLRF       _demo_time+0
	CLRF       _demo_time+1
;scope_marker.c,272 :: 		while(1)
L_main65:
;scope_marker.c,274 :: 		check_cond();                 /*Check the condition*/
	CALL       _check_cond+0
;scope_marker.c,275 :: 		exe_cond();
	CALL       _exe_cond+0
;scope_marker.c,282 :: 		}
	GOTO       L_main65
;scope_marker.c,283 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
