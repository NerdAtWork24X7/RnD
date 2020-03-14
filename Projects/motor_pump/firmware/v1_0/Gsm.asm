
_send_to_modem:

;Gsm.c,13 :: 		void send_to_modem(char *s)   //function to write anything serially
;Gsm.c,15 :: 		while(*s)
L_send_to_modem0:
	MOVF       FARG_send_to_modem_s+0, 0
	MOVWF      FSR0L
	MOVF       FARG_send_to_modem_s+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_send_to_modem1
;Gsm.c,16 :: 		Soft_UART_Write(*s++);
	MOVF       FARG_send_to_modem_s+0, 0
	MOVWF      FSR0L
	MOVF       FARG_send_to_modem_s+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
	INCF       FARG_send_to_modem_s+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_send_to_modem_s+1, 1
	GOTO       L_send_to_modem0
L_send_to_modem1:
;Gsm.c,17 :: 		Soft_UART_Write(0X0D);
	MOVLW      13
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;Gsm.c,18 :: 		}
L_end_send_to_modem:
	RETURN
; end of _send_to_modem

_send_to_modem1:

;Gsm.c,19 :: 		void send_to_modem1(char *s)
;Gsm.c,21 :: 		while(*s)
L_send_to_modem12:
	MOVF       FARG_send_to_modem1_s+0, 0
	MOVWF      FSR0L
	MOVF       FARG_send_to_modem1_s+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_send_to_modem13
;Gsm.c,22 :: 		Soft_UART_Write(*s++);
	MOVF       FARG_send_to_modem1_s+0, 0
	MOVWF      FSR0L
	MOVF       FARG_send_to_modem1_s+1, 0
	MOVWF      FSR0H
	MOVF       INDF0+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
	INCF       FARG_send_to_modem1_s+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_send_to_modem1_s+1, 1
	GOTO       L_send_to_modem12
L_send_to_modem13:
;Gsm.c,23 :: 		}
L_end_send_to_modem1:
	RETURN
; end of _send_to_modem1

_send_sms:

;Gsm.c,24 :: 		void send_sms()
;Gsm.c,27 :: 		send_to_modem1(mesg);
	MOVLW      _mesg+0
	MOVWF      FARG_send_to_modem1_s+0
	MOVLW      hi_addr(_mesg+0)
	MOVWF      FARG_send_to_modem1_s+1
	CALL       _send_to_modem1+0
;Gsm.c,28 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11
	MOVLW      4
	MOVWF      R12
	MOVLW      186
	MOVWF      R13
L_send_sms4:
	DECFSZ     R13, 1
	GOTO       L_send_sms4
	DECFSZ     R12, 1
	GOTO       L_send_sms4
	DECFSZ     R11, 1
	GOTO       L_send_sms4
	NOP
;Gsm.c,29 :: 		Soft_UART_Write(terminator);
	MOVF       _terminator+0, 0
	MOVWF      FARG_Soft_UART_Write_udata+0
	CALL       _Soft_UART_Write+0
;Gsm.c,30 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11
	MOVLW      38
	MOVWF      R12
	MOVLW      93
	MOVWF      R13
L_send_sms5:
	DECFSZ     R13, 1
	GOTO       L_send_sms5
	DECFSZ     R12, 1
	GOTO       L_send_sms5
	DECFSZ     R11, 1
	GOTO       L_send_sms5
	NOP
	NOP
;Gsm.c,31 :: 		}
L_end_send_sms:
	RETURN
; end of _send_sms

_gsm_init:

;Gsm.c,34 :: 		void gsm_init()
;Gsm.c,36 :: 		send_to_modem(AT);
	MOVLW      _AT+0
	MOVWF      FARG_send_to_modem_s+0
	MOVLW      hi_addr(_AT+0)
	MOVWF      FARG_send_to_modem_s+1
	CALL       _send_to_modem+0
;Gsm.c,37 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11
	MOVLW      75
	MOVWF      R12
	MOVLW      190
	MOVWF      R13
L_gsm_init6:
	DECFSZ     R13, 1
	GOTO       L_gsm_init6
	DECFSZ     R12, 1
	GOTO       L_gsm_init6
	DECFSZ     R11, 1
	GOTO       L_gsm_init6
	NOP
;Gsm.c,38 :: 		send_to_modem(noecho);
	MOVLW      _noecho+0
	MOVWF      FARG_send_to_modem_s+0
	MOVLW      hi_addr(_noecho+0)
	MOVWF      FARG_send_to_modem_s+1
	CALL       _send_to_modem+0
;Gsm.c,39 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11
	MOVLW      75
	MOVWF      R12
	MOVLW      190
	MOVWF      R13
L_gsm_init7:
	DECFSZ     R13, 1
	GOTO       L_gsm_init7
	DECFSZ     R12, 1
	GOTO       L_gsm_init7
	DECFSZ     R11, 1
	GOTO       L_gsm_init7
	NOP
;Gsm.c,40 :: 		send_to_modem(mode_text);
	MOVLW      _mode_text+0
	MOVWF      FARG_send_to_modem_s+0
	MOVLW      hi_addr(_mode_text+0)
	MOVWF      FARG_send_to_modem_s+1
	CALL       _send_to_modem+0
;Gsm.c,41 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11
	MOVLW      75
	MOVWF      R12
	MOVLW      190
	MOVWF      R13
L_gsm_init8:
	DECFSZ     R13, 1
	GOTO       L_gsm_init8
	DECFSZ     R12, 1
	GOTO       L_gsm_init8
	DECFSZ     R11, 1
	GOTO       L_gsm_init8
	NOP
;Gsm.c,42 :: 		send_to_modem(mobile_no);
	MOVLW      _mobile_no+0
	MOVWF      FARG_send_to_modem_s+0
	MOVLW      hi_addr(_mobile_no+0)
	MOVWF      FARG_send_to_modem_s+1
	CALL       _send_to_modem+0
;Gsm.c,43 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11
	MOVLW      75
	MOVWF      R12
	MOVLW      190
	MOVWF      R13
L_gsm_init9:
	DECFSZ     R13, 1
	GOTO       L_gsm_init9
	DECFSZ     R12, 1
	GOTO       L_gsm_init9
	DECFSZ     R11, 1
	GOTO       L_gsm_init9
	NOP
;Gsm.c,45 :: 		}
L_end_gsm_init:
	RETURN
; end of _gsm_init
