#include<types.h>
#include<lcd.h>

#define OFFSET 0.6

uint16_t  avg_adc=0,adc_dat[150]={0};
uint32_t sum_adc=0;
uint8_t real_no=0,whole_no=0;
uint8_t temp[15] ;
double volt_value=0;


void cpu_init()
{
  TRISA=0x04;
  ANSELA  = 0x04;              // Configure AN2 pin as analog
  ANSELB = 0x00;                 // Configure other AN pins as digital I/O
  C1ON_bit = 0;               // Disable comparators
  C2ON_bit = 0;
  
  TRISB=0x00;
  TRISC=0x00;
  WPUB=0xff;
  init_lcd();
  ADC_Init();
}

void main() 
{ 
  uint8_t cnt=0;
  cpu_init();

  while(1)

   {
     sum_adc=0;
       for(cnt=0;cnt<15;cnt++){ temp[cnt]=0; }
       for(cnt=0;cnt<150;cnt++){ adc_dat[cnt]=0; }
       for(cnt=0;cnt<150;cnt++){ adc_dat[cnt]=ADC_Read(2); adc_dat[cnt]&=0x0fff;}
      for(cnt=0;cnt<150;cnt++){ sum_adc+=adc_dat[cnt]; }
       avg_adc=sum_adc/150;

       volt_value=(avg_adc*0.00732422);
       volt_value-=OFFSET;
    if(volt_value<1) volt_value=0;
      whole_no=volt_value;
       floatToStr(volt_value,temp);
      if(whole_no&(0x0f) < 10) temp[4]='\0';
       else temp[5]='\0';
       Lcd_Out(2,2,temp);
       

  /*   reading_sum+=ADC_Read(1); //Sum the ADC readings
      r=reading_sum/3;
      reading_sum-=r;
      VTG = (reading_sum * 0.06944444444);     //720
       FloatToStr(VTG,temp);
        Lcd_Out(2,2,temp);   */

   }
   


}