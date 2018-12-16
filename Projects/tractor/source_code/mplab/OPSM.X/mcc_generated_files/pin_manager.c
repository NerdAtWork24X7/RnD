#include <xc.h>
#include "pin_manager.h"
#include "stdbool.h"





void PIN_MANAGER_Initialize(void)
{
    /**
    LATx registers
    */
    LATA = 0x00;
    LATC = 0x00;

    /**
    TRISx registers
    */
    TRISA = 0x20;
    TRISC = 0x0F;

    /**
    ANSELx registers
    */
    ANSELC = 0x00;
    ANSELA = 0x00;

    /**
    WPUx registers
    */
    WPUA = 0x00;
    OPTION_REGbits.nWPUEN = 1;



    /**
    APFCONx registers
    */
    APFCON = 0x00;




   
    
}
  
/*void PIN_MANAGER_IOC(void)
{   
}
*/
/**
 End of File
*/