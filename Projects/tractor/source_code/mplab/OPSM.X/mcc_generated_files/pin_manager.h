#ifndef PIN_MANAGER_H
#define PIN_MANAGER_H

#define INPUT   1
#define OUTPUT  0

#define HIGH    1
#define LOW     0

#define ANALOG      1
#define DIGITAL     0

#define PULL_UP_ENABLED      1
#define PULL_UP_DISABLED     0

// get/set BUZZER aliases
#define BUZZER_TRIS                 TRISAbits.TRISA2
#define BUZZER_LAT                  LATAbits.LATA2
#define BUZZER                      PORTAbits.RA2
#define BUZZER_WPU                  WPUAbits.WPUA2
#define BUZZER_ANS                  ANSELAbits.ANSA2
#define BUZZER_SetHigh()            do { LATAbits.LATA2 = 1; } while(0)
#define BUZZER_SetLow()             do { LATAbits.LATA2 = 0; } while(0)
#define BUZZER_Toggle()             do { LATAbits.LATA2 = ~LATAbits.LATA2; } while(0)
#define BUZZER_GetValue()           PORTAbits.RA2
#define BUZZER_SetDigitalInput()    do { TRISAbits.TRISA2 = 1; } while(0)
#define BUZZER_SetDigitalOutput()   do { TRISAbits.TRISA2 = 0; } while(0)
#define BUZZER_SetPullup()          do { WPUAbits.WPUA2 = 1; } while(0)
#define BUZZER_ResetPullup()        do { WPUAbits.WPUA2 = 0; } while(0)
#define BUZZER_SetAnalogMode()      do { ANSELAbits.ANSA2 = 1; } while(0)
#define BUZZER_SetDigitalMode()     do { ANSELAbits.ANSA2 = 0; } while(0)

// get/set RELAY_STR aliases
#define RELAY_STR_TRIS                 TRISAbits.TRISA4
#define RELAY_STR_LAT                  LATAbits.LATA4
#define RELAY_STR                      PORTAbits.RA4
#define RELAY_STR_WPU                  WPUAbits.WPUA4
#define RELAY_STR_ANS                  ANSELAbits.ANSA4
#define RELAY_STR_SetHigh()            do { LATAbits.LATA4 = 1; } while(0)
#define RELAY_STR_SetLow()             do { LATAbits.LATA4 = 0; } while(0)
#define RELAY_STR_Toggle()             do { LATAbits.LATA4 = ~LATAbits.LATA4; } while(0)
#define RELAY_STR_GetValue()           PORTAbits.RA4
#define RELAY_STR_SetDigitalInput()    do { TRISAbits.TRISA4 = 1; } while(0)
#define RELAY_STR_SetDigitalOutput()   do { TRISAbits.TRISA4 = 0; } while(0)
#define RELAY_STR_SetPullup()          do { WPUAbits.WPUA4 = 1; } while(0)
#define RELAY_STR_ResetPullup()        do { WPUAbits.WPUA4 = 0; } while(0)
#define RELAY_STR_SetAnalogMode()      do { ANSELAbits.ANSA4 = 1; } while(0)
#define RELAY_STR_SetDigitalMode()     do { ANSELAbits.ANSA4 = 0; } while(0)

// get/set ENGINE_SENSE aliases
#define ENGINE_SENSE_TRIS                 TRISCbits.TRISC0
#define ENGINE_SENSE_LAT                  LATCbits.LATC0
#define ENGINE_SENSE                      PORTCbits.RC0
#define ENGINE_SENSE_ANS                  ANSELCbits.ANSC0
#define ENGINE_SENSE_SetHigh()            do { LATCbits.LATC0 = 1; } while(0)
#define ENGINE_SENSE_SetLow()             do { LATCbits.LATC0 = 0; } while(0)
#define ENGINE_SENSE_Toggle()             do { LATCbits.LATC0 = ~LATCbits.LATC0; } while(0)
#define ENGINE_SENSE_GetValue()           PORTCbits.RC0
#define ENGINE_SENSE_SetDigitalInput()    do { TRISCbits.TRISC0 = 1; } while(0)
#define ENGINE_SENSE_SetDigitalOutput()   do { TRISCbits.TRISC0 = 0; } while(0)
#define ENGINE_SENSE_SetAnalogMode()      do { ANSELCbits.ANSC0 = 1; } while(0)
#define ENGINE_SENSE_SetDigitalMode()     do { ANSELCbits.ANSC0 = 0; } while(0)

// get/set HAND_BRAKE aliases
#define HAND_BRAKE_TRIS                 TRISCbits.TRISC1
#define HAND_BRAKE_LAT                  LATCbits.LATC1
#define HAND_BRAKE                      PORTCbits.RC1
#define HAND_BRAKE_ANS                  ANSELCbits.ANSC1
#define HAND_BRAKE_SetHigh()            do { LATCbits.LATC1 = 1; } while(0)
#define HAND_BRAKE_SetLow()             do { LATCbits.LATC1 = 0; } while(0)
#define HAND_BRAKE_Toggle()             do { LATCbits.LATC1 = ~LATCbits.LATC1; } while(0)
#define HAND_BRAKE_GetValue()           PORTCbits.RC1
#define HAND_BRAKE_SetDigitalInput()    do { TRISCbits.TRISC1 = 1; } while(0)
#define HAND_BRAKE_SetDigitalOutput()   do { TRISCbits.TRISC1 = 0; } while(0)
#define HAND_BRAKE_SetAnalogMode()      do { ANSELCbits.ANSC1 = 1; } while(0)
#define HAND_BRAKE_SetDigitalMode()     do { ANSELCbits.ANSC1 = 0; } while(0)

// get/set PTO aliases
#define PTO_TRIS                 TRISCbits.TRISC2
#define PTO_LAT                  LATCbits.LATC2
#define PTO                      PORTCbits.RC2
#define PTO_ANS                  ANSELCbits.ANSC2
#define PTO_SetHigh()            do { LATCbits.LATC2 = 1; } while(0)
#define PTO_SetLow()             do { LATCbits.LATC2 = 0; } while(0)
#define PTO_Toggle()             do { LATCbits.LATC2 = ~LATCbits.LATC2; } while(0)
#define PTO_GetValue()           PORTCbits.RC2
#define PTO_SetDigitalInput()    do { TRISCbits.TRISC2 = 1; } while(0)
#define PTO_SetDigitalOutput()   do { TRISCbits.TRISC2 = 0; } while(0)
#define PTO_SetAnalogMode()      do { ANSELCbits.ANSC2 = 1; } while(0)
#define PTO_SetDigitalMode()     do { ANSELCbits.ANSC2 = 0; } while(0)

// get/set SEAT_SWITCH aliases
#define SEAT_SWITCH_TRIS                 TRISCbits.TRISC3
#define SEAT_SWITCH_LAT                  LATCbits.LATC3
#define SEAT_SWITCH                      PORTCbits.RC3
#define SEAT_SWITCH_ANS                  ANSELCbits.ANSC3
#define SEAT_SWITCH_SetHigh()            do { LATCbits.LATC3 = 1; } while(0)
#define SEAT_SWITCH_SetLow()             do { LATCbits.LATC3 = 0; } while(0)
#define SEAT_SWITCH_Toggle()             do { LATCbits.LATC3 = ~LATCbits.LATC3; } while(0)
#define SEAT_SWITCH_GetValue()           PORTCbits.RC3
#define SEAT_SWITCH_SetDigitalInput()    do { TRISCbits.TRISC3 = 1; } while(0)
#define SEAT_SWITCH_SetDigitalOutput()   do { TRISCbits.TRISC3 = 0; } while(0)
#define SEAT_SWITCH_SetAnalogMode()      do { ANSELCbits.ANSC3 = 1; } while(0)
#define SEAT_SWITCH_SetDigitalMode()     do { ANSELCbits.ANSC3 = 0; } while(0)

// get/set P_IND aliases
#define P_IND_TRIS                 TRISCbits.TRISC4
#define P_IND_LAT                  LATCbits.LATC4
#define P_IND                      PORTCbits.RC4
#define P_IND_SetHigh()            do { LATCbits.LATC4 = 1; } while(0)
#define P_IND_SetLow()             do { LATCbits.LATC4 = 0; } while(0)
#define P_IND_Toggle()             do { LATCbits.LATC4 = ~LATCbits.LATC4; } while(0)
#define P_IND_GetValue()           PORTCbits.RC4
#define P_IND_SetDigitalInput()    do { TRISCbits.TRISC4 = 1; } while(0)
#define P_IND_SetDigitalOutput()   do { TRISCbits.TRISC4 = 0; } while(0)

// get/set RELAY_SOL aliases
#define RELAY_SOL_TRIS                 TRISCbits.TRISC5
#define RELAY_SOL_LAT                  LATCbits.LATC5
#define RELAY_SOL                      PORTCbits.RC5
#define RELAY_SOL_SetHigh()            do { LATCbits.LATC5 = 1; } while(0)
#define RELAY_SOL_SetLow()             do { LATCbits.LATC5 = 0; } while(0)
#define RELAY_SOL_Toggle()             do { LATCbits.LATC5 = ~LATCbits.LATC5; } while(0)
#define RELAY_SOL_GetValue()           PORTCbits.RC5
#define RELAY_SOL_SetDigitalInput()    do { TRISCbits.TRISC5 = 1; } while(0)
#define RELAY_SOL_SetDigitalOutput()   do { TRISCbits.TRISC5 = 0; } while(0)

/**
   @Param
    none
   @Returns
    none
   @Description
    GPIO and peripheral I/O initialization
   @Example
    PIN_MANAGER_Initialize();
 */
void PIN_MANAGER_Initialize (void);

/**
 * @Param
    none
 * @Returns
    none
 * @Description
    Interrupt on Change Handling routine
 * @Example
    PIN_MANAGER_IOC();
 */
void PIN_MANAGER_IOC(void);



#endif // PIN_MANAGER_H
/**
 End of File
*/