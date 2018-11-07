
_main:

;flash.c,7 :: 		void main() {
;flash.c,8 :: 		ANSELA  = 0;                         // Configure AN pins as digital
	CLRF       ANSELA+0
;flash.c,9 :: 		ANSELB = 0;
	CLRF       ANSELB+0
;flash.c,10 :: 		ANSELC=0;
	CLRF       ANSELC+0
;flash.c,11 :: 		C1ON_bit = 0;                       // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;flash.c,12 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;flash.c,13 :: 		PORTB = 0;                          // Initial PORTB value
	CLRF       PORTB+0
;flash.c,14 :: 		TRISB = 0;                          // Set PORTB as output
	CLRF       TRISB+0
;flash.c,15 :: 		PORTC = 0;                          // Initial PORTC value
	CLRF       PORTC+0
;flash.c,16 :: 		TRISC = 0;                          // Set PORTC as output
	CLRF       TRISC+0
;flash.c,17 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_main0:
	DECFSZ     R13, 1
	GOTO       L_main0
	DECFSZ     R12, 1
	GOTO       L_main0
	DECFSZ     R11, 1
	GOTO       L_main0
	NOP
	NOP
;flash.c,27 :: 		addr = 0x0430;                      // starting Flash address, valid for P16F887
	MOVLW      48
	MOVWF      _addr+0
	MOVLW      4
	MOVWF      _addr+1
;flash.c,28 :: 		for (i = 0; i < 4; i++){            // Write some data to Flash
	CLRF       _i+0
L_main1:
	MOVLW      4
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;flash.c,29 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_main4:
	DECFSZ     R13, 1
	GOTO       L_main4
	DECFSZ     R12, 1
	GOTO       L_main4
	DECFSZ     R11, 1
	GOTO       L_main4
	NOP
;flash.c,30 :: 		FLASH_Write(addr+i*4, dataAR[i]);
	MOVF       _i+0, 0
	MOVWF      R0
	CLRF       R1
	LSLF       R0, 1
	RLF        R1, 1
	LSLF       R0, 1
	RLF        R1, 1
	MOVF       R0, 0
	ADDWF      _addr+0, 0
	MOVWF      FARG_FLASH_Write_address+0
	MOVF       R1, 0
	ADDWFC     _addr+1, 0
	MOVWF      FARG_FLASH_Write_address+1
	MOVLW      3
	MOVWF      R2
	MOVF       _i+0, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R2, 0
L__main12:
	BTFSC      STATUS+0, 2
	GOTO       L__main13
	LSLF       R0, 1
	RLF        R1, 1
	ADDLW      255
	GOTO       L__main12
L__main13:
	MOVLW      _dataAR+0
	ADDWF      R0, 0
	MOVWF      FARG_FLASH_Write_data_+0
	MOVLW      hi_addr(_dataAR+0)
	ADDWFC     R1, 0
	MOVWF      FARG_FLASH_Write_data_+1
	CALL       _FLASH_Write+0
;flash.c,28 :: 		for (i = 0; i < 4; i++){            // Write some data to Flash
	INCF       _i+0, 1
;flash.c,31 :: 		}
	GOTO       L_main1
L_main2:
;flash.c,32 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_main5:
	DECFSZ     R13, 1
	GOTO       L_main5
	DECFSZ     R12, 1
	GOTO       L_main5
	DECFSZ     R11, 1
	GOTO       L_main5
	NOP
	NOP
;flash.c,34 :: 		addr = 0x0430;
	MOVLW      48
	MOVWF      _addr+0
	MOVLW      4
	MOVWF      _addr+1
;flash.c,35 :: 		for (i = 0; i < 16; i++){
	CLRF       _i+0
L_main6:
	MOVLW      16
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;flash.c,36 :: 		data_ = FLASH_Read(addr++);       // P16's FLASH is 14-bit wide, so
	MOVF       _addr+0, 0
	MOVWF      FARG_FLASH_Read_address+0
	MOVF       _addr+1, 0
	MOVWF      FARG_FLASH_Read_address+1
	CALL       _FLASH_Read+0
	MOVF       R0, 0
	MOVWF      _data_+0
	MOVF       R1, 0
	MOVWF      _data_+1
	INCF       _addr+0, 1
	BTFSC      STATUS+0, 2
	INCF       _addr+1, 1
;flash.c,37 :: 		Delay_us(10);                     //   two MSB's will always be '00'
	MOVLW      6
	MOVWF      R13
L_main9:
	DECFSZ     R13, 1
	GOTO       L_main9
	NOP
;flash.c,38 :: 		PORTB = data_;                    // Display data on PORTB (LS Byte)
	MOVF       _data_+0, 0
	MOVWF      PORTB+0
;flash.c,39 :: 		PORTC = data_ >> 8;               // and PORTC (MS Byte)
	MOVF       _data_+1, 0
	MOVWF      R0
	CLRF       R1
	MOVF       R0, 0
	MOVWF      PORTC+0
;flash.c,40 :: 		Delay_ms(500);
	MOVLW      6
	MOVWF      R11
	MOVLW      19
	MOVWF      R12
	MOVLW      173
	MOVWF      R13
L_main10:
	DECFSZ     R13, 1
	GOTO       L_main10
	DECFSZ     R12, 1
	GOTO       L_main10
	DECFSZ     R11, 1
	GOTO       L_main10
	NOP
	NOP
;flash.c,35 :: 		for (i = 0; i < 16; i++){
	INCF       _i+0, 1
;flash.c,41 :: 		}
	GOTO       L_main6
L_main7:
;flash.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
