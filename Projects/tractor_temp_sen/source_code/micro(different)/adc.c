#include "adc.h"
#include "types.h"
#include "tmr0.h"


void ADC_Initialize(void)
{
  ADCON0 = 0x08;                      /*GO_nDONE stop; ADON enabled; CHS AN2; */
  ADCON1 = 0xC0;                      /*ADFM Right; ADPREF VDD; ADCS FOSC/4; */
  ADCON2 = 0x00;                      /* TRIGSEL no_auto_trigger */
  ADRESL = 0x00;                      /* ADRESL 0*/
  ADRESH = 0x00;                      /* ADRESH 0*/
  ADIE_bit = 1;                       /* Enabling ADC interrupt. */
}

uint32 ADC_GetConversion()
{
  ADCON0 = 0x08;                     /* select the A/D channel2 */
  ADON_bit = 1;                      /*Turn on the ADC module*/
  delay_us(50);                      /*Acquisition time delay */
  GO_NOT_DONE_bit = 1;               /*Start the conversion*/
  while (GO_NOT_DONE_bit);           /*Wait for the conversion to finish*/
  return ((ADRESH << 8) + ADRESL);   /*Conversion finished, return the result*/

}

void ADC_ISR(void)
{
   ADIF_bit = 0;                     /*Clear the ADC interrupt flag*/
}

void check_adc()
{
  uint8 i;
  uint32 res = 0;
  if(wt_flag == 1)                   /*wait time flag*/
  {
    res = 0;
    for(i=0;i<50;i++)
    {
      res+=ADC_GetConversion();     /*Take 50 sample from adc conversion*/
    }
    res/=50;                        /*Take average of ADC conversion*/
    if(res > THRESHOLD_VAL)
    {
      LED = 0;
      guc_buzz_state = 1;
    }
    else
    {
      LED = 1;
      guc_buzz_state = 0;
    }
  }
  else
  {
    ADON_bit = 0;                   /*Turn off the ADC module*/
    LED = 1;
    guc_buzz_state = 0;
  }
}