
_stopTimer:

;Timer.c,48 :: 		void stopTimer() {
;Timer.c,50 :: 		PORTB = (0<<outTimer | 1<<outHbLed); // turn off outputs
	MOVLW      16
	MOVWF      PORTB+0
;Timer.c,51 :: 		T1CON.TMR1ON = 0;                    // stop timer 1
	BCF        T1CON+0, 0
;Timer.c,52 :: 		PIR1.CCP1IF = 0;                     // clear timer interrupt flag
	BCF        PIR1+0, 2
;Timer.c,53 :: 		timerRun = 0;                        // clear timer running flag bit
	BCF        _timerRun+0, BitPos(_timerRun+0)
;Timer.c,54 :: 		}
L_end_stopTimer:
	RETURN
; end of _stopTimer

_readDSwitch:

;Timer.c,59 :: 		unsigned int readDSwitch (void){
;Timer.c,61 :: 		unsigned char  swdelay = 0;
	CLRF       readDSwitch_swdelay_L0+0
	CLRF       readDSwitch_swmode_L0+0
;Timer.c,67 :: 		if (dsw6) { swdelay += 32; }
	BTFSS      PORTA+0, 4
	GOTO       L_readDSwitch0
	MOVLW      32
	ADDWF      readDSwitch_swdelay_L0+0, 1
L_readDSwitch0:
;Timer.c,68 :: 		if (dsw5) { swdelay += 16; }
	BTFSS      PORTA+0, 7
	GOTO       L_readDSwitch1
	MOVLW      16
	ADDWF      readDSwitch_swdelay_L0+0, 1
L_readDSwitch1:
;Timer.c,69 :: 		if (dsw4) { swdelay += 8; }
	BTFSS      PORTA+0, 3
	GOTO       L_readDSwitch2
	MOVLW      8
	ADDWF      readDSwitch_swdelay_L0+0, 1
L_readDSwitch2:
;Timer.c,70 :: 		if (dsw3) { swdelay += 4; }
	BTFSS      PORTA+0, 0
	GOTO       L_readDSwitch3
	MOVLW      4
	ADDWF      readDSwitch_swdelay_L0+0, 1
L_readDSwitch3:
;Timer.c,71 :: 		if (dsw2) { swdelay += 2; }
	BTFSS      PORTA+0, 2
	GOTO       L_readDSwitch4
	MOVLW      2
	ADDWF      readDSwitch_swdelay_L0+0, 1
L_readDSwitch4:
;Timer.c,72 :: 		if (dsw1) { swdelay += 1; }
	BTFSS      PORTA+0, 1
	GOTO       L_readDSwitch5
	INCF       readDSwitch_swdelay_L0+0, 1
L_readDSwitch5:
;Timer.c,74 :: 		if (dsw9) { swmode = 4;}
	BTFSS      PORTB+0, 2
	GOTO       L_readDSwitch6
	MOVLW      4
	MOVWF      readDSwitch_swmode_L0+0
L_readDSwitch6:
;Timer.c,75 :: 		if (dsw8) { swmode += 2;}
	BTFSS      PORTB+0, 1
	GOTO       L_readDSwitch7
	MOVLW      2
	ADDWF      readDSwitch_swmode_L0+0, 1
L_readDSwitch7:
;Timer.c,76 :: 		if (dsw7) { swmode += 1;}
	BTFSS      PORTA+0, 6
	GOTO       L_readDSwitch8
	INCF       readDSwitch_swmode_L0+0, 1
L_readDSwitch8:
;Timer.c,79 :: 		switch (swmode) {
	GOTO       L_readDSwitch9
;Timer.c,81 :: 		case 0: {delaytime = swdelay;} break;          //000  1s-63s,      1 sec int
L_readDSwitch11:
	MOVF       readDSwitch_swdelay_L0+0, 0
	MOVWF      readDSwitch_delaytime_L0+0
	CLRF       readDSwitch_delaytime_L0+1
	GOTO       L_readDSwitch10
;Timer.c,82 :: 		case 1: {delaytime = swdelay *  5;}  break;    //001  5s-5m15s,    5 sec int
L_readDSwitch12:
	MOVF       readDSwitch_swdelay_L0+0, 0
	MOVWF      R0+0
	MOVLW      5
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      readDSwitch_delaytime_L0+0
	MOVF       R0+1, 0
	MOVWF      readDSwitch_delaytime_L0+1
	GOTO       L_readDSwitch10
;Timer.c,83 :: 		case 2: {delaytime = swdelay * 15;}  break;    //010  15s-15m45s, 15 sec int
L_readDSwitch13:
	MOVF       readDSwitch_swdelay_L0+0, 0
	MOVWF      R0+0
	MOVLW      15
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      readDSwitch_delaytime_L0+0
	MOVF       R0+1, 0
	MOVWF      readDSwitch_delaytime_L0+1
	GOTO       L_readDSwitch10
;Timer.c,84 :: 		case 3: {delaytime = swdelay * 60;}  break;    //011  1m-63m,      1 min int
L_readDSwitch14:
	MOVF       readDSwitch_swdelay_L0+0, 0
	MOVWF      R0+0
	MOVLW      60
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      readDSwitch_delaytime_L0+0
	MOVF       R0+1, 0
	MOVWF      readDSwitch_delaytime_L0+1
	GOTO       L_readDSwitch10
;Timer.c,85 :: 		case 4: {delaytime = swdelay * 120;} break;    //100  2m-2h6m,     2 min int
L_readDSwitch15:
	MOVF       readDSwitch_swdelay_L0+0, 0
	MOVWF      R0+0
	MOVLW      120
	MOVWF      R4+0
	CALL       _Mul_8X8_U+0
	MOVF       R0+0, 0
	MOVWF      readDSwitch_delaytime_L0+0
	MOVF       R0+1, 0
	MOVWF      readDSwitch_delaytime_L0+1
	GOTO       L_readDSwitch10
;Timer.c,86 :: 		case 5: {delaytime = swdelay * 300;} break;    //101  5m-5h15m,    5 min int
L_readDSwitch16:
	MOVF       readDSwitch_swdelay_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      44
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      readDSwitch_delaytime_L0+0
	MOVF       R0+1, 0
	MOVWF      readDSwitch_delaytime_L0+1
	GOTO       L_readDSwitch10
;Timer.c,87 :: 		case 6: {delaytime = swdelay * 600;} break;    //110  10m-10h30m,  10 min int
L_readDSwitch17:
	MOVF       readDSwitch_swdelay_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      88
	MOVWF      R4+0
	MOVLW      2
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      readDSwitch_delaytime_L0+0
	MOVF       R0+1, 0
	MOVWF      readDSwitch_delaytime_L0+1
	GOTO       L_readDSwitch10
;Timer.c,88 :: 		case 7: {delaytime = swdelay * 900;} break;    //111  15m-15h45m,  15 min int
L_readDSwitch18:
	MOVF       readDSwitch_swdelay_L0+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	MOVLW      132
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      readDSwitch_delaytime_L0+0
	MOVF       R0+1, 0
	MOVWF      readDSwitch_delaytime_L0+1
	GOTO       L_readDSwitch10
;Timer.c,90 :: 		}
L_readDSwitch9:
	MOVF       readDSwitch_swmode_L0+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_readDSwitch11
	MOVF       readDSwitch_swmode_L0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_readDSwitch12
	MOVF       readDSwitch_swmode_L0+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_readDSwitch13
	MOVF       readDSwitch_swmode_L0+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_readDSwitch14
	MOVF       readDSwitch_swmode_L0+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_readDSwitch15
	MOVF       readDSwitch_swmode_L0+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_readDSwitch16
	MOVF       readDSwitch_swmode_L0+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_readDSwitch17
	MOVF       readDSwitch_swmode_L0+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_readDSwitch18
L_readDSwitch10:
;Timer.c,91 :: 		return delaytime;
	MOVF       readDSwitch_delaytime_L0+0, 0
	MOVWF      R0+0
	MOVF       readDSwitch_delaytime_L0+1, 0
	MOVWF      R0+1
;Timer.c,92 :: 		}
L_end_readDSwitch:
	RETURN
; end of _readDSwitch

_main:

;Timer.c,95 :: 		void main() {
;Timer.c,97 :: 		CMCON = 0x07;
	MOVLW      7
	MOVWF      CMCON+0
;Timer.c,98 :: 		PORTB = 1<<outHbLed;
	MOVLW      16
	MOVWF      PORTB+0
;Timer.c,99 :: 		PORTA = 0;
	CLRF       PORTA+0
;Timer.c,101 :: 		TRISB = ~(1<<outHbLed | 1<< outTimer );
	MOVLW      207
	MOVWF      TRISB+0
;Timer.c,102 :: 		TRISA = 0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;Timer.c,104 :: 		OPTION_REG.INTEDG = 0;    // Set INT RB0 input to falling edge
	BCF        OPTION_REG+0, 6
;Timer.c,106 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;Timer.c,107 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;Timer.c,108 :: 		T1CON.T1CKPS0 = 0;        // Set Timer 1 prescaler
	BCF        T1CON+0, 4
;Timer.c,109 :: 		T1CON.T1CKPS1 = 0;
	BCF        T1CON+0, 5
;Timer.c,110 :: 		T1CON.TMR1CS  = 1;
	BSF        T1CON+0, 1
;Timer.c,111 :: 		T1CON.T1OSCEN = 1;
	BSF        T1CON+0, 3
;Timer.c,113 :: 		CCP1CON = 0b00001011;            // Timer 1 compare mode, Special Event mode
	MOVLW      11
	MOVWF      CCP1CON+0
;Timer.c,114 :: 		CCPR1L = (16383 & 0x00FF);       // Preset compare register low/high bytes
	MOVLW      255
	MOVWF      CCPR1L+0
;Timer.c,115 :: 		CCPR1H = (16383 & 0xFF00)>>8;
	MOVLW      63
	MOVWF      CCPR1H+0
;Timer.c,118 :: 		PIR1.CCP1IF = 0;        // Clear timer1 compare interrupt
	BCF        PIR1+0, 2
;Timer.c,119 :: 		INTCON.INTF = 0;        // Clear INT flag
	BCF        INTCON+0, 1
;Timer.c,123 :: 		timerRun = 0;
	BCF        _timerRun+0, BitPos(_timerRun+0)
;Timer.c,124 :: 		tick = 0;
	BCF        _tick+0, BitPos(_tick+0)
;Timer.c,125 :: 		timerPeriod = readDSwitch();
	CALL       _readDSwitch+0
	MOVF       R0+0, 0
	MOVWF      _timerPeriod+0
	MOVF       R0+1, 0
	MOVWF      _timerPeriod+1
;Timer.c,127 :: 		while(1){
L_main19:
;Timer.c,130 :: 		if ( PIR1.CCP1IF ){
	BTFSS      PIR1+0, 2
	GOTO       L_main21
;Timer.c,133 :: 		PIR1.CCP1IF = 0;              // clear interrupt flag
	BCF        PIR1+0, 2
;Timer.c,135 :: 		pb_outHbLed = !pb_outHbLed;   // toggle hearbeat LED
	MOVLW      16
	XORWF      PORTB+0, 1
;Timer.c,137 :: 		if (tick){ counter--; }        // if tick flag true, decrement counter
	BTFSS      _tick+0, BitPos(_tick+0)
	GOTO       L_main22
	MOVLW      1
	SUBWF      _counter+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      _counter+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _counter+0
	MOVF       R0+1, 0
	MOVWF      _counter+1
L_main22:
;Timer.c,138 :: 		if (!counter){ stopTimer();}   // if counter == 0 then stop timer.
	MOVF       _counter+0, 0
	IORWF      _counter+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main23
	CALL       _stopTimer+0
L_main23:
;Timer.c,140 :: 		tick = !tick;                // toggle tick flag bit
	MOVLW
	XORWF      _tick+0, 1
;Timer.c,142 :: 		}
L_main21:
;Timer.c,145 :: 		if (!pb_inClr){
	BTFSC      PORTA+0, 5
	GOTO       L_main24
;Timer.c,146 :: 		stopTimer();
	CALL       _stopTimer+0
;Timer.c,148 :: 		}
L_main24:
;Timer.c,152 :: 		if (INTCON.INTF){
	BTFSS      INTCON+0, 1
	GOTO       L_main25
;Timer.c,154 :: 		INTCON.INTF = 0;         // clear INT flag
	BCF        INTCON+0, 1
;Timer.c,158 :: 		if (pb_inClr){
	BTFSS      PORTA+0, 5
	GOTO       L_main26
;Timer.c,161 :: 		if (!timerRun){
	BTFSC      _timerRun+0, BitPos(_timerRun+0)
	GOTO       L_main27
;Timer.c,163 :: 		TMR1L = TMR1H = 0;      // reset timer 0
	CLRF       TMR1H+0
	MOVF       TMR1H+0, 0
	MOVWF      TMR1L+0
;Timer.c,164 :: 		T1CON.TMR1ON = 1;       // enable Timer1
	BSF        T1CON+0, 0
;Timer.c,165 :: 		PIR1.CCP1IF = 0;        // clear interrupt flag
	BCF        PIR1+0, 2
;Timer.c,167 :: 		PORTB = (1<<outTimer | 0<<outHbLed); // Enable output
	MOVLW      32
	MOVWF      PORTB+0
;Timer.c,169 :: 		timerRun = 1;           // Set Timer running flag bit
	BSF        _timerRun+0, BitPos(_timerRun+0)
;Timer.c,170 :: 		tick = 0;               // Clear tick flag bit
	BCF        _tick+0, BitPos(_tick+0)
;Timer.c,172 :: 		timerPeriod = readDSwitch();
	CALL       _readDSwitch+0
	MOVF       R0+0, 0
	MOVWF      _timerPeriod+0
	MOVF       R0+1, 0
	MOVWF      _timerPeriod+1
;Timer.c,173 :: 		counter = timerPeriod;
	MOVF       _timerPeriod+0, 0
	MOVWF      _counter+0
	MOVF       _timerPeriod+1, 0
	MOVWF      _counter+1
;Timer.c,176 :: 		}else if (dsw10){
	GOTO       L_main28
L_main27:
	BTFSS      PORTB+0, 3
	GOTO       L_main29
;Timer.c,177 :: 		TMR1L = TMR1H = 0;      // reset timer 0
	CLRF       TMR1H+0
	MOVF       TMR1H+0, 0
	MOVWF      TMR1L+0
;Timer.c,178 :: 		T1CON.TMR1ON = 1;       // enable Timer1
	BSF        T1CON+0, 0
;Timer.c,179 :: 		PIR1.CCP1IF = 0;        // clear interrupt flag
	BCF        PIR1+0, 2
;Timer.c,180 :: 		tick = 0;               // Clear tick flag bit
	BCF        _tick+0, BitPos(_tick+0)
;Timer.c,181 :: 		timerPeriod = readDSwitch();
	CALL       _readDSwitch+0
	MOVF       R0+0, 0
	MOVWF      _timerPeriod+0
	MOVF       R0+1, 0
	MOVWF      _timerPeriod+1
;Timer.c,182 :: 		counter = timerPeriod;
	MOVF       _timerPeriod+0, 0
	MOVWF      _counter+0
	MOVF       _timerPeriod+1, 0
	MOVWF      _counter+1
;Timer.c,184 :: 		}
L_main29:
L_main28:
;Timer.c,185 :: 		}
L_main26:
;Timer.c,187 :: 		}
L_main25:
;Timer.c,189 :: 		}
	GOTO       L_main19
;Timer.c,191 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
