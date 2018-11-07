
_Init:

;i2c_slave.c,11 :: 		void Init()
;i2c_slave.c,13 :: 		TRISA=0x00;                        // Set PORTA as output
	CLRF       TRISA+0
;i2c_slave.c,14 :: 		TRISB=0x00;                        // Set PORTB as output
	CLRF       TRISB+0
;i2c_slave.c,15 :: 		TRISC=0x18;                        // Set PORTC as output and input for i2c
	MOVLW      24
	MOVWF      TRISC+0
;i2c_slave.c,16 :: 		ANSEL = 0;                           // Configure AN pins as digital I/O
	CLRF       ANSEL+0
;i2c_slave.c,17 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;i2c_slave.c,18 :: 		ADCON1 = 0;                          // All ports set to digital
	CLRF       ADCON1+0
;i2c_slave.c,19 :: 		SSPADD =  Addy;                      // Get address (7bit). Lsb is read/write flag
	MOVLW      210
	MOVWF      SSPADD+0
;i2c_slave.c,20 :: 		SSPCON = 0x36;                       // Set to I2C slave with 7-bit address
	MOVLW      54
	MOVWF      SSPCON+0
;i2c_slave.c,21 :: 		INTCON = 0xC0;                       // enable INTCON.GIE
	MOVLW      192
	MOVWF      INTCON+0
;i2c_slave.c,22 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;i2c_slave.c,23 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;i2c_slave.c,24 :: 		PIE1.SSPIE = 1;                      // enable SSP interrupts
	BSF        PIE1+0, 3
;i2c_slave.c,25 :: 		PIE1.TMR1IE = 1;
	BSF        PIE1+0, 0
;i2c_slave.c,26 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;i2c_slave.c,27 :: 		PIR1.SSPIF = 0;
	BCF        PIR1+0, 3
;i2c_slave.c,28 :: 		}
L_end_Init:
	RETURN
; end of _Init

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;i2c_slave.c,31 :: 		void interrupt()                      // I2C slave interrupt handler
;i2c_slave.c,33 :: 		if (PIR1.SSPIF == 1){                // I2C Interrupt
	BTFSS      PIR1+0, 3
	GOTO       L_interrupt0
;i2c_slave.c,35 :: 		PIR1.SSPIF = 0;                    // reset SSP interrupt flag
	BCF        PIR1+0, 3
;i2c_slave.c,38 :: 		if ((SSPSTAT>>2)&1 == 1){             // Read request from master
	MOVF       SSPSTAT+0, 0
	MOVWF      R1+0
	RRF        R1+0, 1
	BCF        R1+0, 7
	RRF        R1+0, 1
	BCF        R1+0, 7
	BTFSS      R1+0, 0
	GOTO       L_interrupt1
;i2c_slave.c,39 :: 		SSPBUF = tx_data;                // Get data to send
	MOVF       _tx_data+0, 0
	MOVWF      SSPBUF+0
;i2c_slave.c,40 :: 		SSPCON.CKP = 1;                  // Release SCL line
	BSF        SSPCON+0, 4
;i2c_slave.c,41 :: 		j = SSPBUF;                      // That's it
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;i2c_slave.c,42 :: 		return;
	GOTO       L__interrupt7
;i2c_slave.c,43 :: 		}
L_interrupt1:
;i2c_slave.c,44 :: 		if (SSPSTAT&1 == 0){              // all done,
	MOVLW      0
	ANDWF      SSPSTAT+0, 0
	MOVWF      R0+0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt2
;i2c_slave.c,45 :: 		j = SSPBUF;                      // Nothing in buffer so exit
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;i2c_slave.c,46 :: 		return;
	GOTO       L__interrupt7
;i2c_slave.c,47 :: 		}
L_interrupt2:
;i2c_slave.c,50 :: 		if ((SSPSTAT>>5)&1 == 1){             // Data [not address]
	MOVLW      5
	MOVWF      R0+0
	MOVF       SSPSTAT+0, 0
	MOVWF      R1+0
	MOVF       R0+0, 0
L__interrupt8:
	BTFSC      STATUS+0, 2
	GOTO       L__interrupt9
	RRF        R1+0, 1
	BCF        R1+0, 7
	ADDLW      255
	GOTO       L__interrupt8
L__interrupt9:
	BTFSS      R1+0, 0
	GOTO       L_interrupt3
;i2c_slave.c,51 :: 		rxbuff[pos] = SSPBUF;                         // get addr
	MOVF       _pos+0, 0
	ADDLW      _rxbuff+0
	MOVWF      FSR
	MOVF       SSPBUF+0, 0
	MOVWF      INDF+0
;i2c_slave.c,52 :: 		pos++;
	INCF       _pos+0, 1
;i2c_slave.c,53 :: 		if(pos>1) pos=0;
	MOVF       _pos+0, 0
	SUBLW      1
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt4
	CLRF       _pos+0
L_interrupt4:
;i2c_slave.c,54 :: 		j = SSPBUF;                 // read buffer to clear flag [address]
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;i2c_slave.c,55 :: 		return;
	GOTO       L__interrupt7
;i2c_slave.c,56 :: 		}
L_interrupt3:
;i2c_slave.c,57 :: 		}
L_interrupt0:
;i2c_slave.c,58 :: 		j = SSPBUF;                              // read buffer to clear flag [address]
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;i2c_slave.c,59 :: 		}
L_end_interrupt:
L__interrupt7:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

i2c_slave____?ag:

L_end_i2c_slave___?ag:
	RETURN
; end of i2c_slave____?ag
