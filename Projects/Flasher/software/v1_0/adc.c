#include "types.h"
#include "adc.h"

#define ACQ_US_DELAY 5



void ADC_Initialize(void)
{
    // set the ADC to the options selected in the User Interface
    ADCON0 = 0x0B; // GO_nDONE start; ADON enabled; CHS AN2;
    ADCON1 = 0x80; // ADFM Right; ADPREF VDD; ADCS FOSC/2;
    ADRESL = 0x00;  // ADRESL 0;
    ADRESH = 0x00;  // ADRESH 0;

}

uint16 ADC_GetConversion(uint8 channel)
{
    CHS0_bit = channel;  // select the A/D channel
    CHS1_bit = channel>>1;  // select the A/D channel
    ADON_bit = 1;             // Turn on the ADC module
    Delay_us(ACQ_US_DELAY) ;  // Acquisition time delay
    GO_NOT_DONE_bit = 1;      // Start the conversion
    while (GO_NOT_DONE_bit) asm CLRWDT ; // Wait for the conversion to finish
    return ((uint16)((ADRESH << 8) + ADRESL));  // Conversion finished, return the result
}