#include"types.h"


#define Relay1 RA0_bit
#define Relay2 RA1_bit
#define Relay3 RA2_bit
#define Relay4 RA3_bit
#define Relay5 RA4_bit
#define Relay6 RA5_bit
#define Relay7 RA6_bit
#define Relay8 RA7_bit
#define Relay9 RB0_bit
#define Relay10 RB1_bit
#define Relay11 RB2_bit
#define Relay12 RB3_bit
#define Relay13 RB4_bit
#define Relay14 RB5_bit
#define Relay15 RB6_bit
#define Relay16 RB7_bit

#define R0 RC0_bit
#define R1 RC1_bit
#define R2 RC2_bit
#define R3 RC3_bit
#define C0 RC4_bit
#define C1 RC5_bit
#define C2 RC6_bit
#define C3 RC7_bit



char colscan(void)
{
        return(C0|C1|C2|C3);
}

void init_rows(void)
{
        R0=R1=R2=R3=1;
}

void init_cols(void)
{
        C0=C1=C2=C3=0;
}

void keyscan()
{
       init_cols();
       init_rows();
       PortB=0xFF;PortA=0xFF;
       if(colscan())
        {

         R0=1;R1=R2=R3=0;
         if(colscan())
         {
           if(C0==1) { Relay1=1;}  delay_ms(100);
           if(C1==1) { Relay2=1;}  delay_ms(100);
           if(C2==1) { Relay3=1;}  delay_ms(100);
           if(C3==1) { Relay4=1;}  delay_ms(100);
         }

        R1=1;R0=R2=R3=0;
        if(colscan())
         {
           if(C0==1) {Relay5=1;}   delay_ms(100);
           if(C1==1) {Relay6=1;}   delay_ms(100);
           if(C2==1) {Relay7=1;}   delay_ms(100);
           if(C3==1) {Relay8=1;}   delay_ms(100);
         }
        R2=1;R0=R1=R3=0;
        if(colscan())
         {
           if(C0==1) {Relay9=1;}  delay_ms(100);
           if(C1==1) {Relay10=1;} delay_ms(100);
           if(C2==1) {Relay11=1;} delay_ms(100);
           if(C3==1) {Relay12=1;} delay_ms(100);
          }
        R3=1;R0=R2=R1=0;
        if(colscan())
         {
           if(C0==1) {Relay13=1;}   delay_ms(100);
           if(C1==1) {Relay14=1;}   delay_ms(100);
           if(C2==1) {Relay15=1;}   delay_ms(100);
           if(C3==1) {Relay16=1;}   delay_ms(100);
          }
}

}