
_Init:

;Slave.c,13 :: 		void Init(){
;Slave.c,14 :: 		ADCON1 = 0;                          // All ports set to digital
	CLRF       ADCON1+0
;Slave.c,15 :: 		TRISA = 0;                           // Set PORTA as output
	CLRF       TRISA+0
;Slave.c,16 :: 		TRISC = 0x03;                        // Set PORTC as input
	MOVLW      3
	MOVWF      TRISC+0
;Slave.c,17 :: 		SSPADD =  Addy;                      // Get address (7bit). Lsb is read/write flag
	MOVLW      210
	MOVWF      SSPADD+0
;Slave.c,18 :: 		SSPCON = 0x36;                       // Set to I2C slave with 7-bit address
	MOVLW      54
	MOVWF      SSPCON+0
;Slave.c,19 :: 		INTCON = 0xC0;                       // enable INTCON.GIE
	MOVLW      192
	MOVWF      INTCON+0
;Slave.c,20 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;Slave.c,21 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;Slave.c,22 :: 		PIE1.SSP1IE = 1;                      // enable SSP interrupts
	BSF        PIE1+0, 3
;Slave.c,23 :: 		PIE1.TMR1IE = 1;
	BSF        PIE1+0, 0
;Slave.c,24 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;Slave.c,25 :: 		PIR1.SSP1IF = 0;
	BCF        PIR1+0, 3
;Slave.c,26 :: 		}
L_end_Init:
	RETURN
; end of _Init

_PWM_init:

;Slave.c,27 :: 		void PWM_init()
;Slave.c,29 :: 		PWM1_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;Slave.c,30 :: 		PWM2_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;Slave.c,31 :: 		PWM3_Init(500);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM3_Init+0
;Slave.c,32 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;Slave.c,33 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;Slave.c,34 :: 		PWM3_Start();
	CALL       _PWM3_Start+0
;Slave.c,35 :: 		}
L_end_PWM_init:
	RETURN
; end of _PWM_init

_interrupt:

;Slave.c,37 :: 		void interrupt(){                      // I2C slave interrupt handler
;Slave.c,39 :: 		if (PIR1.SSP1IF == 1){                // I2C Interrupt
	BTFSS      PIR1+0, 3
	GOTO       L_interrupt0
;Slave.c,41 :: 		PIR1.SSP1IF = 0;                    // reset SSP interrupt flag
	BCF        PIR1+0, 3
;Slave.c,44 :: 		if ((SSPSTAT>>2)&1 == 1){             // Read request from master
	MOVF       SSPSTAT+0, 0
	MOVWF      R1
	LSRF       R1, 1
	LSRF       R1, 1
	BTFSS      R1, 0
	GOTO       L_interrupt1
;Slave.c,45 :: 		SSPBUF = tx_data;                // Get data to send
	MOVF       _tx_data+0, 0
	MOVWF      SSPBUF+0
;Slave.c,46 :: 		SSPCON.CKP = 1;                  // Release SCL line
	BSF        SSPCON+0, 4
;Slave.c,47 :: 		j = SSPBUF;                      // That's it
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;Slave.c,48 :: 		return;
	GOTO       L__interrupt15
;Slave.c,49 :: 		}
L_interrupt1:
;Slave.c,50 :: 		if (SSPSTAT&1 == 0){              // all done,
	MOVLW      0
	ANDWF      SSPSTAT+0, 0
	MOVWF      R0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt2
;Slave.c,51 :: 		j = SSPBUF;                      // Nothing in buffer so exit
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;Slave.c,52 :: 		return;
	GOTO       L__interrupt15
;Slave.c,53 :: 		}
L_interrupt2:
;Slave.c,56 :: 		if ((SSPSTAT>>5)&1 == 1){             // Data [not address]
	MOVLW      5
	MOVWF      R0
	MOVF       SSPSTAT+0, 0
	MOVWF      R1
	MOVF       R0, 0
L__interrupt16:
	BTFSC      STATUS+0, 2
	GOTO       L__interrupt17
	LSRF       R1, 1
	ADDLW      255
	GOTO       L__interrupt16
L__interrupt17:
	BTFSS      R1, 0
	GOTO       L_interrupt3
;Slave.c,57 :: 		rxbuff[pos] = SSPBUF;                         // get addr
	MOVLW      _rxbuff+0
	MOVWF      FSR1L
	MOVLW      hi_addr(_rxbuff+0)
	MOVWF      FSR1H
	MOVF       _pos+0, 0
	ADDWF      FSR1L, 1
	BTFSC      STATUS+0, 0
	INCF       FSR1H, 1
	MOVF       SSPBUF+0, 0
	MOVWF      INDF1+0
;Slave.c,58 :: 		pos++;
	INCF       _pos+0, 1
;Slave.c,59 :: 		if(pos>1) pos=0;
	MOVF       _pos+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt4
	CLRF       _pos+0
L_interrupt4:
;Slave.c,60 :: 		j = SSPBUF;                 // read buffer to clear flag [address]
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;Slave.c,61 :: 		return;
	GOTO       L__interrupt15
;Slave.c,62 :: 		}
L_interrupt3:
;Slave.c,63 :: 		}
L_interrupt0:
;Slave.c,64 :: 		j = SSPBUF;                              // read buffer to clear flag [address]
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;Slave.c,65 :: 		}
L_end_interrupt:
L__interrupt15:
	RETFIE     %s
; end of _interrupt

_main:

;Slave.c,67 :: 		void main()
;Slave.c,70 :: 		Init();
	CALL       _Init+0
;Slave.c,71 :: 		PWM_init();
	CALL       _PWM_init+0
;Slave.c,73 :: 		while(1)
L_main5:
;Slave.c,75 :: 		if(rxbuff[0]==1){PWM1_Set_Duty(rxbuff[1]*100);}
	MOVF       _rxbuff+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main7
	MOVF       _rxbuff+1, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+1
	CALL       _PWM1_Set_Duty+0
	GOTO       L_main8
L_main7:
;Slave.c,76 :: 		else if(rxbuff[0]==2){ PWM2_Set_Duty(rxbuff[1]*100);}
	MOVF       _rxbuff+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main9
	MOVF       _rxbuff+1, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM2_Set_Duty_new_duty+1
	CALL       _PWM2_Set_Duty+0
	GOTO       L_main10
L_main9:
;Slave.c,77 :: 		else if(rxbuff[0]==3){ PWM3_Set_Duty(rxbuff[1]*100);}
	MOVF       _rxbuff+0, 0
	XORLW      3
	BTFSS      STATUS+0, 2
	GOTO       L_main11
	MOVF       _rxbuff+1, 0
	MOVWF      R0
	MOVLW      100
	MOVWF      R4
	CALL       _Mul_8x8_U+0
	MOVF       R0, 0
	MOVWF      FARG_PWM3_Set_Duty_new_duty+0
	MOVF       R1, 0
	MOVWF      FARG_PWM3_Set_Duty_new_duty+1
	CALL       _PWM3_Set_Duty+0
L_main11:
L_main10:
L_main8:
;Slave.c,79 :: 		}
	GOTO       L_main5
;Slave.c,80 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
