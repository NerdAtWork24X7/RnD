#include "types.h"

void ADC_Initialize(void)
{
  ADCON0 = 0x09;                      /*GO_nDONE stop; ADON enabled; CHS AN2; */
  ADCON1 = 0x40;                      /*ADFM left; ADPREF VDD; ADCS FOSC/4; */
  ADCON2 = 0x00;                      /* TRIGSEL no_auto_trigger */
  ADRESL = 0x00;                      /* ADRESL 0*/
  ADRESH = 0x00;                      /* ADRESH 0*/
  CHS2 = 1;                           /* select the A/D channel*/
  PIE1.ADIE_bit = 1;                  /* Enabling ADC interrupt. */


}

uint32 ADC_GetConversion()
{ 
  ADCON0 = 0x08;                     /* select the A/D channel2 */
  ADCON0.ADON_bit = 1;               /*Turn on the ADC module*/
  delay_us(50);                      /*Acquisition time delay */
  ADCON0.GO_NOT_DONE_bit = 1;        /*Start the conversion*/
  while (ADCON0bits.GO_NOT_DONE_bit); /*Wait for the conversion to finish*/
  return ((ADRESH << 8) + ADRESL);   /*Conversion finished, return the result*/

}

void ADC_ISR(void)
{
   PIR1.ADIF_bit = 0;  /*Clear the ADC interrupt flag*/
}
/**
 End of File
*/