#include "mcc.h"
#include "OPSM_APP.h"

void SYSTEM_Initialize(void)
{

    PIN_MANAGER_Initialize();
    OSCILLATOR_Initialize();
    WDT_Initialize();
    TMR0_Initialize();
}
    
void OSCILLATOR_Initialize(void)
{
    // SCS INTOSC; IRCF 16MHz_HF; 
    OSCCON = 0x7A;
    // SBOREN disabled; BORFS disabled; 
    BORCON = 0x00;
}

void WDT_Initialize(void)
{
    // WDTPS 1:65536; SWDTEN ON; 
    WDTCON = 0x17;
}

/**
 End of File
*/
