opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F877
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 11 "C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\Main.c"
	psect config,class=CONFIG,delta=2 ;#
# 11 "C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\Main.c"
	dw 0xFFFE & 0xFFFB & 0xFFF7 & 0xFFFF & 0xFFFF & 0xFF7F & 0xFFFF & 0xFFFF & 0xFFFF ;#
	FNCALL	_main,_InitI2C
	FNCALL	_main,_I2C_Start
	FNCALL	_main,_I2C_Write_Byte
	FNCALL	_main,_I2C_Read_Byte
	FNCALL	_main,_I2C_Send_ACK
	FNCALL	_main,_I2C_Stop
	FNROOT	_main
	global	_SSPBUF
psect	text75,local,class=CODE,delta=2
global __ptext75
__ptext75:
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_SSPIF
_SSPIF	set	99
	global	_SSPADD
_SSPADD	set	147
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
	global	_ACKSTAT
_ACKSTAT	set	1166
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_SEN
_SEN	set	1160
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	file	"I2C.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_InitI2C
?_InitI2C:	; 0 bytes @ 0x0
	global	??_InitI2C
??_InitI2C:	; 0 bytes @ 0x0
	global	?_I2C_Start
?_I2C_Start:	; 0 bytes @ 0x0
	global	??_I2C_Start
??_I2C_Start:	; 0 bytes @ 0x0
	global	?_I2C_Stop
?_I2C_Stop:	; 0 bytes @ 0x0
	global	??_I2C_Stop
??_I2C_Stop:	; 0 bytes @ 0x0
	global	?_I2C_Send_ACK
?_I2C_Send_ACK:	; 0 bytes @ 0x0
	global	??_I2C_Send_ACK
??_I2C_Send_ACK:	; 0 bytes @ 0x0
	global	?_I2C_Write_Byte
?_I2C_Write_Byte:	; 1 bit 
	global	??_I2C_Write_Byte
??_I2C_Write_Byte:	; 0 bytes @ 0x0
	global	??_I2C_Read_Byte
??_I2C_Read_Byte:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_I2C_Read_Byte
?_I2C_Read_Byte:	; 1 bytes @ 0x0
	global	I2C_Write_Byte@Byte
I2C_Write_Byte@Byte:	; 1 bytes @ 0x0
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      1       1
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_I2C_Write_Byte
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0      15
;;                            _InitI2C
;;                          _I2C_Start
;;                     _I2C_Write_Byte
;;                      _I2C_Read_Byte
;;                       _I2C_Send_ACK
;;                           _I2C_Stop
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Read_Byte                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Write_Byte                                       1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Send_ACK                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Stop                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _InitI2C                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _InitI2C
;;   _I2C_Start
;;   _I2C_Write_Byte
;;   _I2C_Read_Byte
;;   _I2C_Send_ACK
;;   _I2C_Stop
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      1       1       1        7.1%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 16 in file "C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\Main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  RxByte          1    0        unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_InitI2C
;;		_I2C_Start
;;		_I2C_Write_Byte
;;		_I2C_Read_Byte
;;		_I2C_Send_ACK
;;		_I2C_Stop
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\Main.c"
	line	16
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	19
	
l2380:	
;Main.c: 19: InitI2C();
	fcall	_InitI2C
	line	21
	
l2382:	
;Main.c: 21: I2C_Start();
	fcall	_I2C_Start
	line	22
	
l2384:	
;Main.c: 22: I2C_Write_Byte(0xA0);
	movlw	(0A0h)
	fcall	_I2C_Write_Byte
	line	23
	
l2386:	
;Main.c: 23: RxByte = I2C_Read_Byte();
	fcall	_I2C_Read_Byte
	line	24
	
l2388:	
;Main.c: 24: I2C_Send_ACK();
	fcall	_I2C_Send_ACK
	line	25
	
l2390:	
;Main.c: 25: I2C_Stop();
	fcall	_I2C_Stop
	line	29
;Main.c: 28: {
	
l1337:	
	line	27
	goto	l1337
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	30
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_I2C_Read_Byte
psect	text76,local,class=CODE,delta=2
global __ptext76
__ptext76:

;; *************** function _I2C_Read_Byte *****************
;; Defined at:
;;		line 78 in file "C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text76
	file	"C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
	line	78
	global	__size_of_I2C_Read_Byte
	__size_of_I2C_Read_Byte	equ	__end_of_I2C_Read_Byte-_I2C_Read_Byte
	
_I2C_Read_Byte:	
	opt	stack 7
; Regs used in _I2C_Read_Byte: [wreg]
	line	79
	
l2374:	
;I2C.c: 79: RCEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1163/8)^080h,(1163)&7
	line	80
;I2C.c: 80: while(!SSPIF);
	
l680:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u51
	goto	u50
u51:
	goto	l680
u50:
	
l682:	
	line	81
;I2C.c: 81: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	83
	
l2376:	
;I2C.c: 83: return SSPBUF;
	movf	(19),w	;volatile
	line	84
	
l683:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Read_Byte
	__end_of_I2C_Read_Byte:
;; =============== function _I2C_Read_Byte ends ============

	signat	_I2C_Read_Byte,89
	global	_I2C_Write_Byte
psect	text77,local,class=CODE,delta=2
global __ptext77
__ptext77:

;; *************** function _I2C_Write_Byte *****************
;; Defined at:
;;		line 67 in file "C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
;; Parameters:    Size  Location     Type
;;  Byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  Byte            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text77
	file	"C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
	line	67
	global	__size_of_I2C_Write_Byte
	__size_of_I2C_Write_Byte	equ	__end_of_I2C_Write_Byte-_I2C_Write_Byte
	
_I2C_Write_Byte:	
	opt	stack 7
; Regs used in _I2C_Write_Byte: [wreg]
;I2C_Write_Byte@Byte stored from wreg
	movwf	(I2C_Write_Byte@Byte)
	line	68
	
l2372:	
;I2C.c: 68: SSPBUF = Byte;
	movf	(I2C_Write_Byte@Byte),w
	movwf	(19)	;volatile
	line	69
;I2C.c: 69: while(!SSPIF);
	
l674:	
	btfss	(99/8),(99)&7
	goto	u41
	goto	u40
u41:
	goto	l674
u40:
	
l676:	
	line	70
;I2C.c: 70: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	72
;I2C.c: 72: return ACKSTAT;
;	Return value of _I2C_Write_Byte is never used
	line	73
	
l677:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Write_Byte
	__end_of_I2C_Write_Byte:
;; =============== function _I2C_Write_Byte ends ============

	signat	_I2C_Write_Byte,4216
	global	_I2C_Send_ACK
psect	text78,local,class=CODE,delta=2
global __ptext78
__ptext78:

;; *************** function _I2C_Send_ACK *****************
;; Defined at:
;;		line 47 in file "C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text78
	file	"C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
	line	47
	global	__size_of_I2C_Send_ACK
	__size_of_I2C_Send_ACK	equ	__end_of_I2C_Send_ACK-_I2C_Send_ACK
	
_I2C_Send_ACK:	
	opt	stack 7
; Regs used in _I2C_Send_ACK: []
	line	48
	
l2370:	
;I2C.c: 48: ACKDT = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1165/8)^080h,(1165)&7
	line	49
;I2C.c: 49: ACKEN = 1;
	bsf	(1164/8)^080h,(1164)&7
	line	50
;I2C.c: 50: while(!SSPIF);
	
l662:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u31
	goto	u30
u31:
	goto	l662
u30:
	
l664:	
	line	51
;I2C.c: 51: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	52
	
l665:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Send_ACK
	__end_of_I2C_Send_ACK:
;; =============== function _I2C_Send_ACK ends ============

	signat	_I2C_Send_ACK,88
	global	_I2C_Stop
psect	text79,local,class=CODE,delta=2
global __ptext79
__ptext79:

;; *************** function _I2C_Stop *****************
;; Defined at:
;;		line 37 in file "C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text79
	file	"C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
	line	37
	global	__size_of_I2C_Stop
	__size_of_I2C_Stop	equ	__end_of_I2C_Stop-_I2C_Stop
	
_I2C_Stop:	
	opt	stack 7
; Regs used in _I2C_Stop: []
	line	38
	
l2368:	
;I2C.c: 38: PEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	39
;I2C.c: 39: while(!SSPIF);
	
l656:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u21
	goto	u20
u21:
	goto	l656
u20:
	
l658:	
	line	40
;I2C.c: 40: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	41
	
l659:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Stop
	__end_of_I2C_Stop:
;; =============== function _I2C_Stop ends ============

	signat	_I2C_Stop,88
	global	_I2C_Start
psect	text80,local,class=CODE,delta=2
global __ptext80
__ptext80:

;; *************** function _I2C_Start *****************
;; Defined at:
;;		line 19 in file "C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text80
	file	"C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
	line	19
	global	__size_of_I2C_Start
	__size_of_I2C_Start	equ	__end_of_I2C_Start-_I2C_Start
	
_I2C_Start:	
	opt	stack 7
; Regs used in _I2C_Start: []
	line	20
	
l2366:	
;I2C.c: 20: SEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	21
;I2C.c: 21: while(!SSPIF);
	
l644:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u11
	goto	u10
u11:
	goto	l644
u10:
	
l646:	
	line	22
;I2C.c: 22: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	23
	
l647:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Start
	__end_of_I2C_Start:
;; =============== function _I2C_Start ends ============

	signat	_I2C_Start,88
	global	_InitI2C
psect	text81,local,class=CODE,delta=2
global __ptext81
__ptext81:

;; *************** function _InitI2C *****************
;; Defined at:
;;		line 7 in file "C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text81
	file	"C:\Users\Saeed\Desktop\PIC16F877 I2C Code\Code\I2C.c"
	line	7
	global	__size_of_InitI2C
	__size_of_InitI2C	equ	__end_of_InitI2C-_InitI2C
	
_InitI2C:	
	opt	stack 7
; Regs used in _InitI2C: [wreg]
	line	8
	
l2362:	
;I2C.c: 8: TRISC4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1084/8)^080h,(1084)&7
	line	9
;I2C.c: 9: TRISC3 = 1;
	bsf	(1083/8)^080h,(1083)&7
	line	11
	
l2364:	
;I2C.c: 11: SSPADD = ((20000000/4000)/100) - 1;
	movlw	(031h)
	movwf	(147)^080h	;volatile
	line	12
;I2C.c: 12: SSPSTAT = 0x80;
	movlw	(080h)
	movwf	(148)^080h	;volatile
	line	13
;I2C.c: 13: SSPCON = 0x28;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(20)	;volatile
	line	14
	
l641:	
	return
	opt stack 0
GLOBAL	__end_of_InitI2C
	__end_of_InitI2C:
;; =============== function _InitI2C ends ============

	signat	_InitI2C,88
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
