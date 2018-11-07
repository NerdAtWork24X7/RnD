
_interrupt:

;Tractor.c,10 :: 		void interrupt()
;Tractor.c,12 :: 		if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
	BTFSS      TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
	GOTO       L_interrupt2
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt2
L__interrupt14:
;Tractor.c,14 :: 		TMR0_ISR();
	CALL       _TMR0_ISR+0
;Tractor.c,15 :: 		}
	GOTO       L_interrupt3
L_interrupt2:
;Tractor.c,16 :: 		else if (ADIF_bit == 1)                 /*ADC Interrupt*/
	BTFSS      ADIF_bit+0, BitPos(ADIF_bit+0)
	GOTO       L_interrupt4
;Tractor.c,18 :: 		ADC_ISR();
	CALL       _ADC_ISR+0
;Tractor.c,19 :: 		}
	GOTO       L_interrupt5
L_interrupt4:
;Tractor.c,22 :: 		}
L_interrupt5:
L_interrupt3:
;Tractor.c,23 :: 		}
L_end_interrupt:
L__interrupt16:
	RETFIE     %s
; end of _interrupt

_my_delay:

;Tractor.c,58 :: 		void my_delay()
;Tractor.c,61 :: 		for(i=0;i<1;i++)
	CLRF       R1+0
L_my_delay6:
	MOVLW      1
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay7
;Tractor.c,62 :: 		for(j=0;j<400;j++)
	CLRF       R2+0
L_my_delay9:
	MOVLW      128
	MOVWF      R0
	MOVLW      128
	XORLW      1
	SUBWF      R0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__my_delay18
	MOVLW      144
	SUBWF      R2+0, 0
L__my_delay18:
	BTFSC      STATUS+0, 0
	GOTO       L_my_delay10
;Tractor.c,63 :: 		asm CLRWDT;
	CLRWDT
;Tractor.c,62 :: 		for(j=0;j<400;j++)
	INCF       R2+0, 1
;Tractor.c,63 :: 		asm CLRWDT;
	GOTO       L_my_delay9
L_my_delay10:
;Tractor.c,61 :: 		for(i=0;i<1;i++)
	INCF       R1+0, 1
;Tractor.c,63 :: 		asm CLRWDT;
	GOTO       L_my_delay6
L_my_delay7:
;Tractor.c,64 :: 		}
L_end_my_delay:
	RETURN
; end of _my_delay

_port_init:

;Tractor.c,66 :: 		void port_init()
;Tractor.c,68 :: 		ANSELA=0x04;
	MOVLW      4
	MOVWF      ANSELA+0
;Tractor.c,69 :: 		ANSELC=0x00;
	CLRF       ANSELC+0
;Tractor.c,70 :: 		TRISA=0x3F;
	MOVLW      63
	MOVWF      TRISA+0
;Tractor.c,71 :: 		TRISC=0x0F;
	MOVLW      15
	MOVWF      TRISC+0
;Tractor.c,72 :: 		WPUA = 0x00;
	CLRF       WPUA+0
;Tractor.c,73 :: 		BUZZER = 0;
	BCF        PORTC+0, 5
;Tractor.c,74 :: 		LED = 1;
	BSF        PORTC+0, 4
;Tractor.c,75 :: 		}
L_end_port_init:
	RETURN
; end of _port_init

_sys_init:

;Tractor.c,77 :: 		void sys_init()
;Tractor.c,79 :: 		OSCCON = 0x72;              /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
	MOVLW      114
	MOVWF      OSCCON+0
;Tractor.c,80 :: 		port_init();
	CALL       _port_init+0
;Tractor.c,83 :: 		WDTCON = 0x17;             /*WDTPS 1:65536; SWDTEN ON; */
	MOVLW      23
	MOVWF      WDTCON+0
;Tractor.c,84 :: 		ADC_Initialize();
	CALL       _ADC_Initialize+0
;Tractor.c,85 :: 		TMR0_Initialize();
	CALL       _TMR0_Initialize+0
;Tractor.c,90 :: 		GIE_bit = 1;               /* Enable INTs  */
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Tractor.c,91 :: 		}
L_end_sys_init:
	RETURN
; end of _sys_init

_main:

;Tractor.c,93 :: 		void main()
;Tractor.c,95 :: 		sys_init();
	CALL       _sys_init+0
;Tractor.c,96 :: 		check_adc();
	CALL       _check_adc+0
;Tractor.c,97 :: 		while(1)
L_main12:
;Tractor.c,99 :: 		check_adc();                   /*Check the condition*/
	CALL       _check_adc+0
;Tractor.c,100 :: 		chk_wait_time(1);
	MOVLW      1
	MOVWF      FARG_chk_wait_time_t_mins+0
	MOVLW      0
	MOVWF      FARG_chk_wait_time_t_mins+1
	CALL       _chk_wait_time+0
;Tractor.c,101 :: 		}
	GOTO       L_main12
;Tractor.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
