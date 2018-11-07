#include"types.h"

#define MAX_CHANNEL 6


#define R0 RC0_bit
#define R1 RC1_bit
#define R2 RC2_bit
#define R3 RC3_bit
#define C0 RC4_bit
#define C1 RC5_bit
#define C2 RC6_bit
#define C3 RC7_bit

extern uint8_t channel[2];

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
       uint8_t i;
       
       init_cols();
       init_rows();
       for(i=0;i<MAX_CHANNEL;i++) {channel[i]=0xFF;}       //Clear Channel
       
       if(colscan())
        {

         R0=1;R1=R2=R3=0;
         if(colscan())
         {
           if(C0==1) {channel[0]&=~(1<<0);}
           if(C1==1) { channel[0]&=~(1<<1);}
           if(C2==1) { channel[0]&=~(1<<2);}
           if(C3==1) { channel[0]&=~(1<<3);}
         }

        R1=1;R0=R2=R3=0;
        if(colscan())
         {
           if(C0==1) {channel[0]&=~(1<<4);}
           if(C1==1) {channel[0]&=~(1<<5);}
           if(C2==1) {channel[0]&=~(1<<6);}
           if(C3==1) {channel[0]&=~(1<<7);}
         }
        R2=1;R0=R1=R3=0;
        if(colscan())
         {
           if(C0==1) {channel[1]&=~(1<<0);}
           if(C1==1) {channel[1]&=~(1<<1);}
           if(C2==1) {channel[1]&=~(1<<2);}
           if(C3==1) {channel[1]&=~(1<<3);}
          }
        R3=1;R0=R2=R1=0;
        if(colscan())
         {
           if(C0==1) {channel[1]&=~(1<<4);}
           if(C1==1) {channel[1]&=~(1<<5);}
           if(C2==1) {channel[1]&=~(1<<6);}
           if(C3==1) {channel[1]&=~(1<<7);}
          }
}

}