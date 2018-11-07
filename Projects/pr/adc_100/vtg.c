
#include <16F886.h>
//=========ADC TYPE=============================================================

#device adc=10
//======================FUSES===================================================

#FUSES NOWDT                    //No Watch Dog Timer
//#FUSES INTRC_IO                 //Internal RC Osc, no CLKOUT
#FUSES HS                //Internal RC Osc, no CLKOUT

#FUSES NOBROWNOUT               //No brownout reset
#FUSES NOLVP                    //No low voltage prgming, B3(PIC16) or B5(PIC18) used for I/O
#FUSES MCLR                   //Master Clear pin used for I/O
#FUSES PROTECT                  //Code protected from reads          
//#use delay(int=8000000)
#use delay(clock=20000000)
//#use rs232(baud=115200,parity=N,xmit=PIN_C6,rcv=PIN_C7,bits=8)//RS232


#include <LCD_2.c> // benim_LCD.c dosyasý programa ekleniyor
#include <math.h>
#byte PORTC=0x07


#INCLUDE <math.h>

int8 digit_inc,newkey,oldkey,key;
float VTG=0,AMP=0;     
int16 reading_sum=0,reading_sum_I=0,value=0;
int16 r=0,r_I=0,count_500=0;

int8 VAR=0,COUNTER=5,FLAG=0,FLAG_1=0;
void readkeys(void);
int16 count_1sec;

//===============MAIN===========================================================
void main(void)
{
   count_1sec=0;
   FLAG=1;
   setup_timer_1(T1_INTERNAL|T1_DIV_BY_8);               //104 ms interrupt
   enable_interrupts(GLOBAL);
  
  
   setup_adc_ports(sAN0|sAN1);
   setup_adc(ADC_CLOCK_INTERNAL);
   set_adc_channel(0);
   
   delay_ms(1);
   reading_sum=read_adc()*3; //'preload' the sum.
   delay_ms(1);
   set_adc_channel(1);
   reading_sum_I=read_adc()*3; //'preload' the sum.
 
   lcd_hazirla(); // LCD baþlangýç ayarlarý yaptýrýlýyor
    
   imlec(1,1); // Ýmlec 1.satýr 1.sütunda
   printf(lcd_veri,"   A Product       "); // LCD'ye veri yazdýrýlýyor
      
   imlec(2,1); // Ýmlec 1.satýr 1.sütunda
   printf(lcd_veri," Made in India          "); // LCD'ye veri yazdýrýlýyor
   
   imlec(1,1);
   printf(lcd_veri,"           V           ");
   
   imlec(2,1);
   printf(lcd_veri,"           A        ");
   
   while(1)
     { 
      set_adc_channel(0);
      delay_ms(1);
      reading_sum+=read_adc(); //Sum the ADC readings
      r=reading_sum/3;
      reading_sum-=r;
      VTG = (reading_sum * 0.06944444444);     //720
      
      imlec(1,1);
      printf(lcd_veri,"     %f ",VTG);
   
  
      set_adc_channel(1);
      delay_ms(1);
      reading_sum_I+=read_adc(); //Sum the ADC readings
      r_I=reading_sum_I/3;
      reading_sum_I-=r_I;
      AMP = (reading_sum_I * 0.008012820512820);                           //624                    //0.003x
   
    
      imlec(2,1);
      printf(lcd_veri,"     %f ",AMP);
}
}