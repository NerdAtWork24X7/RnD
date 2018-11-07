
_DATAEE_WriteByte:

;memory.c,8 :: 		void DATAEE_WriteByte(uint8 bAdd, uint8 bData)
;memory.c,10 :: 		uint8 GIEBitValue = 0;
	CLRF       DATAEE_WriteByte_GIEBitValue_L0+0
;memory.c,12 :: 		EEADRL = (bAdd & 0x0ff);    // Data Memory Address to write
	MOVLW      255
	ANDWF      FARG_DATAEE_WriteByte_bAdd+0, 0
	MOVWF      EEADRL+0
;memory.c,13 :: 		EEDATL = bData;             // Data Memory Value to write
	MOVF       FARG_DATAEE_WriteByte_bData+0, 0
	MOVWF      EEDATL+0
;memory.c,14 :: 		EEPGD_bit = 0;              // Point to DATA memory
	BCF        EEPGD_bit+0, BitPos(EEPGD_bit+0)
;memory.c,15 :: 		CFGS_bit = 0;               // Deselect Configuration space
	BCF        CFGS_bit+0, BitPos(CFGS_bit+0)
;memory.c,16 :: 		WREN_bit = 1;                   // Enable writes
	BSF        WREN_bit+0, BitPos(WREN_bit+0)
;memory.c,18 :: 		GIEBitValue = GIE_bit;
	MOVLW      0
	BTFSC      GIE_bit+0, BitPos(GIE_bit+0)
	MOVLW      1
	MOVWF      DATAEE_WriteByte_GIEBitValue_L0+0
;memory.c,19 :: 		GIE_bit = 0;     // Disable INTs
	BCF        GIE_bit+0, BitPos(GIE_bit+0)
;memory.c,20 :: 		EECON2 = 0x55;
	MOVLW      85
	MOVWF      EECON2+0
;memory.c,21 :: 		EECON2 = 0xAA;
	MOVLW      170
	MOVWF      EECON2+0
;memory.c,22 :: 		WR_bit = 1;      // Set WR bit to begin write
	BSF        WR_bit+0, BitPos(WR_bit+0)
;memory.c,24 :: 		while (WR_bit)
L_DATAEE_WriteByte0:
	BTFSS      WR_bit+0, BitPos(WR_bit+0)
	GOTO       L_DATAEE_WriteByte1
;memory.c,26 :: 		}
	GOTO       L_DATAEE_WriteByte0
L_DATAEE_WriteByte1:
;memory.c,28 :: 		WREN_bit = 0;    // Disable writes
	BCF        WREN_bit+0, BitPos(WREN_bit+0)
;memory.c,29 :: 		GIE_bit = GIEBitValue;
	BTFSC      DATAEE_WriteByte_GIEBitValue_L0+0, 0
	GOTO       L__DATAEE_WriteByte3
	BCF        GIE_bit+0, BitPos(GIE_bit+0)
	GOTO       L__DATAEE_WriteByte4
L__DATAEE_WriteByte3:
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
L__DATAEE_WriteByte4:
;memory.c,30 :: 		}
L_end_DATAEE_WriteByte:
	RETURN
; end of _DATAEE_WriteByte

_DATAEE_ReadByte:

;memory.c,32 :: 		uint8 DATAEE_ReadByte(uint8 bAdd)
;memory.c,34 :: 		EEADRL = (bAdd & 0x0ff);    // Data Memory Address to read
	MOVLW      255
	ANDWF      FARG_DATAEE_ReadByte_bAdd+0, 0
	MOVWF      EEADRL+0
;memory.c,35 :: 		CFGS_bit = 0;    // Deselect Configuration space
	BCF        CFGS_bit+0, BitPos(CFGS_bit+0)
;memory.c,36 :: 		EEPGD_bit = 0;   // Point to DATA memory
	BCF        EEPGD_bit+0, BitPos(EEPGD_bit+0)
;memory.c,37 :: 		RD_bit = 1;      // EE Read
	BSF        RD_bit+0, BitPos(RD_bit+0)
;memory.c,38 :: 		NOP();           // NOPs may be required for latency at high frequencies
	NOP
;memory.c,39 :: 		NOP();
	NOP
;memory.c,41 :: 		return (EEDATL);
	MOVF       EEDATL+0, 0
	MOVWF      R0
;memory.c,42 :: 		}
L_end_DATAEE_ReadByte:
	RETURN
; end of _DATAEE_ReadByte
