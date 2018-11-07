#include "matrix_disp_driving.h"
#include "display_demo.h"
#include "types.h"
#include "I2C.h"

uint8_t sec,p_sec,mins,p_mins,hrs,p_hrs,day,date,p_date,month,p_month,year,p_year;


void main(void)
{
      uint8_t i;
      TRISB=0x02;
      TRISC=0x00;
      ADCON0=0X00;
      ADCON1=0x00;
      Soft_I2C_Init();
      SPI1_Init(); 
      UART1_Init(9600);
      init_LED_display();


      print_string(1,4,0,"VS-CORP");
      Check_time(); Check_date();
      delay_ms(1000);

    while(1)
     {
      //     display_test();
      //     demo_disp();

        for(i=0;i<5;i++){  Roll_time(); }
        display_date();

     }



}