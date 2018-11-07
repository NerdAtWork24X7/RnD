#include "types.h"

#define CAL RB0_bit
#define INC RB1_bit
#define DEC RB2_bit
#define ENTER RB3_bit


sbit LCD_RS at RA0_bit;
sbit LCD_EN at RA2_bit;
sbit LCD_WR at RA1_bit;
sbit LCD_D4 at RA4_bit;
sbit LCD_D5 at RA5_bit;
sbit LCD_D6 at RA7_bit;
sbit LCD_D7 at RA6_bit;

sbit LCD_RS_Direction at TRISA0_bit;
sbit LCD_EN_Direction at TRISA2_bit;
sbit LCD_D4_Direction at TRISA4_bit;
sbit LCD_D5_Direction at TRISA5_bit;
sbit LCD_D6_Direction at TRISA7_bit;
sbit LCD_D7_Direction at TRISA6_bit;


float offset=0;


/*char look(int a)
{
  switch(a)
  {
    case 0:
      return '0';
    case 1:
      return '1';
    case 2:
      return '2';
    case 3:
      return '3';
    case 4:
      return '4';
    case 5:
      return '5';
    case 6:
      return '6';
    case 7:
      return '7';
    case 8:
      return '8';
    case 9:
      return '9';
    default:
      return '.';
  }
}

void main()
{
  unsigned int v,vp,ip,i;
  char *volt = "00.0";
  char *current = "0.00";
   ADCON1=0x04;
  ANSELH = 0;
  TRISA=0x01;
  TRISB=0xFF;
  TRISC=0x00;
  Lcd_Init();
  Lcd_Cmd(_LCD_CLEAR);
  Lcd_Cmd(_LCD_CURSOR_OFF);

  do
  {
    v = ADC_Read(0);
    i = ADC_Read(3);
    i = (i*4.89)/0.47;
    v = ((v*4.89)/20)*120;
    if(v!=vp || i!=ip )
      Lcd_Cmd(_LCD_CLEAR);
    vp = v;
    ip = i;
    volt[0] = look(v/10000);
    volt[1] = look((v/1000)%10);
    volt[3] = look((v/100)%10);
    Lcd_Out(1,1,"Voltage = ");
    Lcd_Out(1,11,volt);
    Lcd_Out(1,16,"V");

    current[0] = look(i/1000);
    current[2] = look((i/100)%10);
    current[3] = look((i/10)%10);
    Lcd_Out(2,1,"Current = ");
    Lcd_Out(2,11,current);
    Lcd_Out(2,16,"A");
    Delay_ms(250);
  } while(1);
}  */



































void init_uc()
{
  ADCON1=0x00;
  ANSEL=0x00;
  ANSELH = 0x08;
  TRISA=0x00;
  TRISB=0xFF;
  TRISC=0x00;
  LCD_WR=0;
  lcd_init();
  lcd_cmd(_LCD_CURSOR_OFF);
  lcd_Out(1,1,"ADC=");
}

void error_cor(float temp)
{

    if(temp<1 || (temp>=1.95&&temp<=4) || (temp>=12.95&&temp<=15) || (temp>=24.95&&temp<25.99) ){offset=0.01;}
    if((temp>=16&&temp<=19.99) || (temp>=28&&temp<=30) ||  (temp>=5.95 && temp<=7.99)){offset=-0.01;}
    if(temp>=4.95&&temp<=5.99 ) {offset=0.02;}
    if(temp>=25.95 && temp<=27.99) {offset=-0.02;}
    if(temp>29.95){offset=-0.01;}
}

void Read_voltage()
{
     uint16_t v_sum=0,avg_adc=0,temp[40];
     float vol=0;
     uint8_t i=0,real_temp=0,dec_temp=0,v_temp[7]={0};
     
     for(i=0;i<40;i++){temp[i]=0;}
     for(i=0;i<40;i++){temp[i]=ADC_Read(11); delay_ms(10);}
     for(i=0;i<40;i++){v_sum+=temp[i];}
     avg_adc=v_sum/40;
     vol = ((avg_adc*4.89)/20)*120;//     vol = avg_adc*293;
     vol/=1000;
     error_cor(vol);
     vol+=offset;
     if(vol<0.9){vol=0;}
     floatToStr(vol,v_temp);
     v_temp[5]='\0';
     lcd_Out(2,1,v_temp);
     
}

void calibrate_vol()
{
  uint8_t temp[6];
  lcd_out(1,1,"Cal");
   do
    {
      lcd_Out(1,6,temp);
      if(!INC){offset+=0.01; while(!INC);}
      if(!DEC){offset-=0.01; while(!DEC);}
      Read_voltage();
    }while(ENTER);


}




void main()
{
     uint32_t v_sum=0,offset=0;
     uint8_t i;
     init_uc();
     while(1)
      {
        if(CAL==0) {while(CAL==0); calibrate_vol(); lcd_out(1,1,"ADC=");}
        Read_voltage();
         delay_ms(2000);
      }
}