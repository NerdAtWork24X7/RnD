#include "types.h"
#include "I2C.h"

#define SEG1 RA0_bit
#define SEG2 RA1_bit
#define SEG3 RA2_bit
#define SEG4 RA3_bit
#define SEG5 RA4_bit
#define SEG6 RA5_bit



uint8_t sec,p_sec,mins,p_mins,hrs,p_hrs,day,date,p_date,month,p_month,year,p_year;
const uint8_t num_dat[][7]=       {{0x70,0x88,0xC8,0xA8,0x98,0x88,0x70}, {0x20,0x30,0x20,0x20,0x20,0x20,0xF8},      //0 1
                                  {0x70,0x88,0x80,0x40,0x20,0x10,0xF8}, {0xF8,0x40,0x20,0x40,0x80,0x88,0x70},      //2 3
                                  {0x40,0x60,0x50,0x48,0xF8,0x40,0x40}, {0xF8,0x08,0x78,0x80,0x80,0x88,0x70},      //4 5
                                  {0x60,0x10,0x08,0x78,0x88,0x88,0x70}, {0xF8,0x80,0x40,0x20,0x10,0x10,0x10},      //6 7
                                  {0x70,0x88,0x88,0x70,0x88,0x88,0x70}, {0x70,0x88,0x88,0xF0,0x80,0x40,0x30}};     //8 9
const uint8_t c5_c0[][7]={{0xF8,0x08,0x78,0x80,0x80,0x88,0x70},{0x70,0x88,0xC8,0xA8,0x98,0x88,0x70}};              //5 0
uint8_t dat,i,j,m;
uint8_t k;


void display_time()
{
      for(j=0;j<10;j++)     //delay
        {
          SEG1=1;SEG2=0;
          for(k=0;k<7;k++)   //row data
            {
              dat=0x01;
              dat=dat<<k;
              PortB=~dat;
              PortD=~num_dat[(sec>>4)&0x0F][k]; delay_ms(1);
            }
              
           SEG1=0;SEG2=1;
           for(k=0;k<7;k++)   //row data
            {
              dat=0x01;
              dat=dat<<k;
              PortB=~dat;
              PortD=~num_dat[sec&0x0F][k];delay_ms(1);
            }
        }


}

void change_time()
{

   for(m=0;m<7;m++)         //rotating variable
     {
       Check_time();
        for(j=0;j<10;j++)     //delay
          {
            SEG1=1;SEG2=0;
            for(k=0;k<7;k++)   //row data
             {
               dat=0x01;
               dat=dat<<k;
               PortB=~dat;
               if(((p_sec>>4)&0x0F==5)||p_sec<10){PortD=~c5_c0[0][k+m]; delay_ms(1);}
               else{PortD=~num_dat[((p_sec>>4)&0x0F)-1][k+m]; delay_ms(1);}
               
             }

             SEG1=0;SEG2=1;
             for(k=0;k<7;k++)   //row data
              {
                dat=0x01;
                dat=dat<<k;
                PortB=~dat;
                PortD=~num_dat[sec&0x0F][k];delay_ms(1);
              }
           }
      }
}
void init_uc()
{
    ADCON1=0x06;
    TRISB=0x00;
    TRISD=0x00;
    TRISA=0x00;

    

}

void main()
{
   init_uc();
   Check_time();
   while(1)
   {
     display_time();
     Check_time();
     if(((p_sec>>4)&0x0f)!=((sec>>4)&0x0f))
         change_time();
   }
}















/* for(i=0;i<10;i++)           //count no
       {

        for(m=0;m<7;m++)         //rotating variable
        {
          for(j=0;j<10;j++)     //delay
           {
             SEG1=1;SEG2=0;
             for(k=0;k<7;k++)   //row data
              {
                dat=0x01;
                dat=dat<<k;
                PortB=~dat;
                PortD=~num_dat[(sec>>4)&0x0F][k]; delay_ms(1);
              }

              SEG1=0;SEG2=1;
               for(k=0;k<7;k++)   //row data
              {
                dat=0x01;
                dat=dat<<k;
                PortB=~dat;
                PortD=~num_dat[sec&0x0F][k];delay_ms(1);

              }
           }
         }
       }*/