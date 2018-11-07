
_init_uc:

;main.c,3 :: 		void init_uc()
;main.c,5 :: 		TRISA=0x00;
	CLRF       TRISA+0
;main.c,6 :: 		TRISB=0x00;
	CLRF       TRISB+0
;main.c,7 :: 		TRISC=0xF0;
	MOVLW      240
	MOVWF      TRISC+0
;main.c,8 :: 		ANSEL=0x00;
	CLRF       ANSEL+0
;main.c,9 :: 		ANSELH=0x00;
	CLRF       ANSELH+0
;main.c,10 :: 		}
L_end_init_uc:
	RETURN
; end of _init_uc

_main:

;main.c,12 :: 		main()
;main.c,14 :: 		init_uc();
	CALL       _init_uc+0
;main.c,16 :: 		while(1)
L_main0:
;main.c,18 :: 		keyscan();
	CALL       _keyscan+0
;main.c,21 :: 		PORTA=0x00;PORTB=0x00;
	CLRF       PORTA+0
	CLRF       PORTB+0
;main.c,22 :: 		}
	GOTO       L_main0
;main.c,23 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
