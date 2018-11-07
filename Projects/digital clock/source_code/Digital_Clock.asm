
_display_time:

;Digital_Clock.c,24 :: 		void display_time()
;Digital_Clock.c,26 :: 		for(j=0;j<10;j++)     //delay
	CLRF       _j+0
L_display_time0:
	MOVLW      10
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_time1
;Digital_Clock.c,28 :: 		SEG1=1;SEG2=0;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
	BCF        RA1_bit+0, BitPos(RA1_bit+0)
;Digital_Clock.c,29 :: 		for(k=0;k<7;k++)   //row data
	CLRF       _k+0
L_display_time3:
	MOVLW      7
	SUBWF      _k+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_time4
;Digital_Clock.c,31 :: 		dat=0x01;
	MOVLW      1
	MOVWF      _dat+0
;Digital_Clock.c,32 :: 		dat=dat<<k;
	MOVF       _k+0, 0
	MOVWF      R1+0
	MOVF       _dat+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__display_time35:
	BTFSC      STATUS+0, 2
	GOTO       L__display_time36
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__display_time35
L__display_time36:
	MOVF       R0+0, 0
	MOVWF      _dat+0
;Digital_Clock.c,33 :: 		PortB=~dat;
	COMF       R0+0, 0
	MOVWF      PORTB+0
;Digital_Clock.c,34 :: 		PortD=~num_dat[(sec>>4)&0x0F][k]; delay_ms(1);
	MOVF       _sec+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      0
	MOVWF      R0+1
	MOVLW      7
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _num_dat+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_num_dat+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _k+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	COMF       R0+0, 0
	MOVWF      PORTD+0
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_display_time6:
	DECFSZ     R13+0, 1
	GOTO       L_display_time6
	DECFSZ     R12+0, 1
	GOTO       L_display_time6
	NOP
	NOP
;Digital_Clock.c,29 :: 		for(k=0;k<7;k++)   //row data
	INCF       _k+0, 1
;Digital_Clock.c,35 :: 		}
	GOTO       L_display_time3
L_display_time4:
;Digital_Clock.c,37 :: 		SEG1=0;SEG2=1;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
;Digital_Clock.c,38 :: 		for(k=0;k<7;k++)   //row data
	CLRF       _k+0
L_display_time7:
	MOVLW      7
	SUBWF      _k+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_display_time8
;Digital_Clock.c,40 :: 		dat=0x01;
	MOVLW      1
	MOVWF      _dat+0
;Digital_Clock.c,41 :: 		dat=dat<<k;
	MOVF       _k+0, 0
	MOVWF      R1+0
	MOVF       _dat+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__display_time37:
	BTFSC      STATUS+0, 2
	GOTO       L__display_time38
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__display_time37
L__display_time38:
	MOVF       R0+0, 0
	MOVWF      _dat+0
;Digital_Clock.c,42 :: 		PortB=~dat;
	COMF       R0+0, 0
	MOVWF      PORTB+0
;Digital_Clock.c,43 :: 		PortD=~num_dat[sec&0x0F][k];delay_ms(1);
	MOVLW      15
	ANDWF      _sec+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      7
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _num_dat+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_num_dat+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _k+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	COMF       R0+0, 0
	MOVWF      PORTD+0
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_display_time10:
	DECFSZ     R13+0, 1
	GOTO       L_display_time10
	DECFSZ     R12+0, 1
	GOTO       L_display_time10
	NOP
	NOP
;Digital_Clock.c,38 :: 		for(k=0;k<7;k++)   //row data
	INCF       _k+0, 1
;Digital_Clock.c,44 :: 		}
	GOTO       L_display_time7
L_display_time8:
;Digital_Clock.c,26 :: 		for(j=0;j<10;j++)     //delay
	INCF       _j+0, 1
;Digital_Clock.c,45 :: 		}
	GOTO       L_display_time0
L_display_time1:
;Digital_Clock.c,48 :: 		}
L_end_display_time:
	RETURN
; end of _display_time

_change_time:

;Digital_Clock.c,50 :: 		void change_time()
;Digital_Clock.c,53 :: 		for(m=0;m<7;m++)         //rotating variable
	CLRF       _m+0
L_change_time11:
	MOVLW      7
	SUBWF      _m+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_change_time12
;Digital_Clock.c,55 :: 		Check_time();
	CALL       _Check_time+0
;Digital_Clock.c,56 :: 		for(j=0;j<10;j++)     //delay
	CLRF       _j+0
L_change_time14:
	MOVLW      10
	SUBWF      _j+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_change_time15
;Digital_Clock.c,58 :: 		SEG1=1;SEG2=0;
	BSF        RA0_bit+0, BitPos(RA0_bit+0)
	BCF        RA1_bit+0, BitPos(RA1_bit+0)
;Digital_Clock.c,59 :: 		for(k=0;k<7;k++)   //row data
	CLRF       _k+0
L_change_time17:
	MOVLW      7
	SUBWF      _k+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_change_time18
;Digital_Clock.c,61 :: 		dat=0x01;
	MOVLW      1
	MOVWF      _dat+0
;Digital_Clock.c,62 :: 		dat=dat<<k;
	MOVF       _k+0, 0
	MOVWF      R1+0
	MOVF       _dat+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__change_time40:
	BTFSC      STATUS+0, 2
	GOTO       L__change_time41
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__change_time40
L__change_time41:
	MOVF       R0+0, 0
	MOVWF      _dat+0
;Digital_Clock.c,63 :: 		PortB=~dat;
	COMF       R0+0, 0
	MOVWF      PORTB+0
;Digital_Clock.c,64 :: 		if(((p_sec>>4)&0x0F==5)||p_sec<10){PortD=~c5_c0[0][k+m]; delay_ms(1);}
	MOVF       _p_sec+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      0
	ANDWF      R0+0, 1
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__change_time33
	MOVLW      10
	SUBWF      _p_sec+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L__change_time33
	GOTO       L_change_time22
L__change_time33:
	MOVF       _m+0, 0
	ADDWF      _k+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVLW      _c5_c0+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_c5_c0+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	COMF       R0+0, 0
	MOVWF      PORTD+0
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_change_time23:
	DECFSZ     R13+0, 1
	GOTO       L_change_time23
	DECFSZ     R12+0, 1
	GOTO       L_change_time23
	NOP
	NOP
	GOTO       L_change_time24
L_change_time22:
;Digital_Clock.c,65 :: 		else{PortD=~num_dat[((p_sec>>4)&0x0F)-1][k+m]; delay_ms(1);}
	MOVF       _p_sec+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 1
	MOVLW      1
	SUBWF      R0+0, 1
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVLW      7
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	ADDLW      _num_dat+0
	MOVWF      R2+0
	MOVLW      hi_addr(_num_dat+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 0
	MOVWF      R2+1
	MOVF       _m+0, 0
	ADDWF      _k+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R2+0, 0
	ADDWF      R0+0, 1
	MOVF       R2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	COMF       R0+0, 0
	MOVWF      PORTD+0
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_change_time25:
	DECFSZ     R13+0, 1
	GOTO       L_change_time25
	DECFSZ     R12+0, 1
	GOTO       L_change_time25
	NOP
	NOP
L_change_time24:
;Digital_Clock.c,59 :: 		for(k=0;k<7;k++)   //row data
	INCF       _k+0, 1
;Digital_Clock.c,67 :: 		}
	GOTO       L_change_time17
L_change_time18:
;Digital_Clock.c,69 :: 		SEG1=0;SEG2=1;
	BCF        RA0_bit+0, BitPos(RA0_bit+0)
	BSF        RA1_bit+0, BitPos(RA1_bit+0)
;Digital_Clock.c,70 :: 		for(k=0;k<7;k++)   //row data
	CLRF       _k+0
L_change_time26:
	MOVLW      7
	SUBWF      _k+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_change_time27
;Digital_Clock.c,72 :: 		dat=0x01;
	MOVLW      1
	MOVWF      _dat+0
;Digital_Clock.c,73 :: 		dat=dat<<k;
	MOVF       _k+0, 0
	MOVWF      R1+0
	MOVF       _dat+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__change_time42:
	BTFSC      STATUS+0, 2
	GOTO       L__change_time43
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__change_time42
L__change_time43:
	MOVF       R0+0, 0
	MOVWF      _dat+0
;Digital_Clock.c,74 :: 		PortB=~dat;
	COMF       R0+0, 0
	MOVWF      PORTB+0
;Digital_Clock.c,75 :: 		PortD=~num_dat[sec&0x0F][k];delay_ms(1);
	MOVLW      15
	ANDWF      _sec+0, 0
	MOVWF      R0+0
	MOVLW      0
	MOVWF      R0+1
	MOVLW      7
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      _num_dat+0
	ADDWF      R0+0, 1
	MOVLW      hi_addr(_num_dat+0)
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R0+1, 1
	MOVF       _k+0, 0
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	MOVWF      ___DoICPAddr+0
	MOVF       R0+1, 0
	MOVWF      ___DoICPAddr+1
	CALL       _____DoICP+0
	MOVWF      R0+0
	COMF       R0+0, 0
	MOVWF      PORTD+0
	MOVLW      3
	MOVWF      R12+0
	MOVLW      151
	MOVWF      R13+0
L_change_time29:
	DECFSZ     R13+0, 1
	GOTO       L_change_time29
	DECFSZ     R12+0, 1
	GOTO       L_change_time29
	NOP
	NOP
;Digital_Clock.c,70 :: 		for(k=0;k<7;k++)   //row data
	INCF       _k+0, 1
;Digital_Clock.c,76 :: 		}
	GOTO       L_change_time26
L_change_time27:
;Digital_Clock.c,56 :: 		for(j=0;j<10;j++)     //delay
	INCF       _j+0, 1
;Digital_Clock.c,77 :: 		}
	GOTO       L_change_time14
L_change_time15:
;Digital_Clock.c,53 :: 		for(m=0;m<7;m++)         //rotating variable
	INCF       _m+0, 1
;Digital_Clock.c,78 :: 		}
	GOTO       L_change_time11
L_change_time12:
;Digital_Clock.c,79 :: 		}
L_end_change_time:
	RETURN
; end of _change_time

_init_uc:

;Digital_Clock.c,80 :: 		void init_uc()
;Digital_Clock.c,82 :: 		ADCON1=0x06;
	MOVLW      6
	MOVWF      ADCON1+0
;Digital_Clock.c,83 :: 		TRISB=0x00;
	CLRF       TRISB+0
;Digital_Clock.c,84 :: 		TRISD=0x00;
	CLRF       TRISD+0
;Digital_Clock.c,85 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Digital_Clock.c,89 :: 		}
L_end_init_uc:
	RETURN
; end of _init_uc

_main:

;Digital_Clock.c,91 :: 		void main()
;Digital_Clock.c,93 :: 		init_uc();
	CALL       _init_uc+0
;Digital_Clock.c,94 :: 		Check_time();
	CALL       _Check_time+0
;Digital_Clock.c,95 :: 		while(1)
L_main30:
;Digital_Clock.c,97 :: 		display_time();
	CALL       _display_time+0
;Digital_Clock.c,98 :: 		Check_time();
	CALL       _Check_time+0
;Digital_Clock.c,99 :: 		if(((p_sec>>4)&0x0f)!=((sec>>4)&0x0f))
	MOVF       _p_sec+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      R2+0
	MOVF       _sec+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVLW      15
	ANDWF      R0+0, 0
	MOVWF      R1+0
	MOVF       R2+0, 0
	XORWF      R1+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main32
;Digital_Clock.c,100 :: 		change_time();
	CALL       _change_time+0
L_main32:
;Digital_Clock.c,101 :: 		}
	GOTO       L_main30
;Digital_Clock.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
