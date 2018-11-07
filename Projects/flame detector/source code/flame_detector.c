#include"types.h"

#define ADC_IN RA0_bit
#define LED RA4_bit
#define LM1 RC0_bit
#define LM2 RC1_bit
#define RM1 RC2_bit
#define RM2 RC3_bit
#define RELAY RC4_bit
#define BUZZER RC5_bit

#define FAR 950
#define CLOSE 200



u16 adc_value;
u8 cor_pos;
void Stop()
{
     LM1=0;LM2=0;
     RM1=0;RM2=0;
}
void Rotate()
{

     LM1=0;LM2=1;
     RM1=1;RM2=0;
}

void Forward()
{
  LED=0;
  BUZZER=1;
  LM1=1;LM2=0;
  RM1=1;RM2=0;
  delay_ms(200);
  BUZZER=0;
  LED=1;

}
void main() 
{
  u16 i;
 // u16 sen=FAR;
  TRISA  = 0x01;              // RA0 is ANI and RA4 is LED out
  TRISC=   0x00;              //PORTC is output
  ANSEL  = 0x01;              // Configure AN0 pin as analog
  CMCON=0;
  BUZZER=0;
  while(1)
   {

    adc_value = ADC_Read(0);   // Get 10-bit results of AD conversion
    
    if(adc_value>CLOSE && adc_value<FAR)
    {
      RELAY=0; Forward();  Rotate();delay_ms(5);
    }
    
    else if(adc_value<CLOSE)
    {
      Stop(); RELAY=1; delay_ms(5000);
      for(i=0;i<20;i++){BUZZER=1; LED=1; delay_ms(1000); BUZZER=0; LED=0; delay_ms(500);}
      for(i=0;i<1024;i++){LED=1; delay_ms(1000); LED=0; delay_ms(500);}
    }
    
    else
      {
         RELAY=0;
         Rotate();
      }
   }
}