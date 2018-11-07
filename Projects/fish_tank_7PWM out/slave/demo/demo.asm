
_Init:

;demo.c,24 :: 		void Init(){
;demo.c,25 :: 		ADCON1 = 0;                          // All ports set to digital
	CLRF       ADCON1+0
;demo.c,26 :: 		TRISA = 0;                           // Set PORTA as output
	CLRF       TRISA+0
;demo.c,27 :: 		TRISB = 0;                           // Set PORTB as output
	CLRF       TRISB+0
;demo.c,28 :: 		TRISC = 0xFF;                        // Set PORTC as input
	MOVLW      255
	MOVWF      TRISC+0
;demo.c,29 :: 		SSPADD =  Addy;                      // Get address (7bit). Lsb is read/write flag
	MOVLW      210
	MOVWF      SSPADD+0
;demo.c,30 :: 		SSPCON = 0x36;                       // Set to I2C slave with 7-bit address
	MOVLW      54
	MOVWF      SSPCON+0
;demo.c,31 :: 		PIE1.SSPIF = 1;                      // enable SSP interrupts
	BSF        PIE1+0, 3
;demo.c,32 :: 		INTCON = 0xC0;                       // enable INTCON.GIE
	MOVLW      192
	MOVWF      INTCON+0
;demo.c,35 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;demo.c,36 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;demo.c,37 :: 		PIE1.SSPIE = 1;                      // enable SSP interrupts
	BSF        PIE1+0, 3
;demo.c,38 :: 		PIE1.TMR1IE = 1;
	BSF        PIE1+0, 0
;demo.c,39 :: 		PIR1.TMR1IF = 0;
	BCF        PIR1+0, 0
;demo.c,40 :: 		PIR1.SSPIF = 0;
	BCF        PIR1+0, 3
;demo.c,41 :: 		}
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

;demo.c,43 :: 		void interrupt(){                      // I2C slave interrupt handler
;demo.c,45 :: 		if (PIR1.SSPIF == 1){                // I2C Interrupt
	BTFSS      PIR1+0, 3
	GOTO       L_interrupt0
;demo.c,46 :: 		PIR1.SSPIF = 0;                    // reset SSP interrupt flag
	BCF        PIR1+0, 3
;demo.c,49 :: 		if (SSPSTAT.R_W == 1){             // Read request from master
	BTFSS      SSPSTAT+0, 2
	GOTO       L_interrupt1
;demo.c,50 :: 		SSPBUF = tx_data;                // Get data to send
	MOVF       _tx_data+0, 0
	MOVWF      SSPBUF+0
;demo.c,51 :: 		SSPCON.CKP = 1;                  // Release SCL line
	BSF        SSPCON+0, 4
;demo.c,52 :: 		j = SSPBUF;                      // That's it
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;demo.c,53 :: 		return;
	GOTO       L__interrupt9
;demo.c,54 :: 		}
L_interrupt1:
;demo.c,55 :: 		if (SSPSTAT.BF == 0){              // all done,
	BTFSC      SSPSTAT+0, 0
	GOTO       L_interrupt2
;demo.c,56 :: 		j = SSPBUF;                      // Nothing in buffer so exit
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;demo.c,57 :: 		return;
	GOTO       L__interrupt9
;demo.c,58 :: 		}
L_interrupt2:
;demo.c,61 :: 		if (SSPSTAT.D_A == 1){             // Data [not address]
	BTFSS      SSPSTAT+0, 5
	GOTO       L_interrupt3
;demo.c,62 :: 		rxbuffer = SSPBUF;               // get data
	MOVF       SSPBUF+0, 0
	MOVWF      _rxbuffer+0
;demo.c,63 :: 		j = SSPBUF;                      // read buffer to clear flag [address]
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;demo.c,64 :: 		return;
	GOTO       L__interrupt9
;demo.c,65 :: 		}
L_interrupt3:
;demo.c,66 :: 		}
L_interrupt0:
;demo.c,67 :: 		j = SSPBUF;                              // read buffer to clear flag [address]
	MOVF       SSPBUF+0, 0
	MOVWF      _j+0
;demo.c,68 :: 		}
L_end_interrupt:
L__interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;demo.c,70 :: 		void main(){
;demo.c,71 :: 		Init();
	CALL       _Init+0
;demo.c,72 :: 		while(1){
L_main4:
;demo.c,74 :: 		PORTB   = rxbuffer;
	MOVF       _rxbuffer+0, 0
	MOVWF      PORTB+0
;demo.c,75 :: 		tx_data = PORTC;
	MOVF       PORTC+0, 0
	MOVWF      _tx_data+0
;demo.c,76 :: 		Delay_ms(Delay_Time);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;demo.c,77 :: 		}
	GOTO       L_main4
;demo.c,78 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
