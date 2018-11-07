#include "types.h"
#include "tmr0.h"
#include "tmr1.h"
#include "tmr2.h"
#include "pwm3.h"

#define COND1 ((SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(!Eng_On))
#define COND2 ((SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(Eng_On))
#define COND3 ((SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(!Eng_On))
#define COND4 ((SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(Eng_On))
#define COND5 ((SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(!Eng_On))
#define COND6 ((SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(Eng_On))
#define COND7 ((SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(!Eng_On))
#define COND8 ((SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(Eng_On))
#define COND9 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(!Eng_On))
#define COND10 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(Eng_On))
#define COND11 ((!SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(!Eng_On))
#define COND12 ((!SEAT_SWITCH)&(!PTO)&(!HAND_BRAKE)&(Eng_On))
#define COND13 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(!Eng_On))

#define NO_CYCLE_1  1000
#define NO_CYCLE_2  1000
#define NO_CYCLE_3  1000
#define NO_CYCLE_4  1000
#define NO_CYCLE_5  1000
#define NO_CYCLE_6  1000

#define DEMO_ADDR    0x40u

uint16 Demo=0;
uint8 test;
uint8 guc_choice=1;
volatile uint16 guc_cycle[13],guc_sec=0;
volatile uint8 Eng_On = 0,cnt,critcal_cond=0,guc_buzz_state=0;
volatile uint16  i,j,demo_time=0;

void interrupt()
{
   if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
    {
        TMR0_ISR();
    }
    else                                   /*Unhandled Interrupt*/
    {
    }
}

void check_cond()
{
  uint8 cnt = 0 ;

  if(COND1) guc_choice=1;
  else if(COND2) guc_choice=2;
  else if(COND3) guc_choice=3;
  else if(COND4) guc_choice=4;
  else if(COND5) guc_choice=5;
  else if(COND6) guc_choice=6;
  else if(COND7) guc_choice=7;
  else if(COND8) guc_choice=8;
  else if(COND9) guc_choice=9;
  else if(COND10) guc_choice=10;
  else if(COND11) guc_choice=11;
  else if(COND12) guc_choice=12;
  else if(COND13) guc_choice=13;


 /* if(COND1)
   {
     if(guc_cycle[0]<NO_CYCLE_1)
     {
       guc_choice=1;
       for(cnt = 0;cnt < 13 ; cnt ++)
        {
           if(cnt == 0) { guc_cycle[cnt]++; }
           else { guc_cycle[cnt] = 0;}
        }
     }
   } */
}

void exe_cond()
{
  guc_sec=0;
  switch(guc_choice)
    {
      case 1: guc_buzz_state=1;
              RELAY_STR = 0;
              while(COND1);
              RELAY_STR = 1;
              guc_buzz_state=0;
              break;
      
      case 2: guc_buzz_state=1;
              RELAY_SOL = 1;
              while(guc_sec<6);
              RELAY_SOL = 0;
              while(COND2);
              guc_buzz_state=0;
              break;
      
      case 3: guc_buzz_state=1;
              while(COND3);
              guc_buzz_state=0;
              break;
              
      case 4: guc_buzz_state=1;
              while(COND4);
              guc_buzz_state=0;
              break;
              
      case 5: guc_buzz_state=1;
              RELAY_STR = 0;
              while(COND5);
              RELAY_STR = 1;
              guc_buzz_state=0;
              break;
              
      case 6: RELAY_SOL = 1;
              while(guc_sec<6);
              RELAY_SOL = 0;
              while(COND6);
              break;
      
      case 9: RELAY_STR = 0;
              while(COND9);
              RELAY_STR = 1;
              break;

      case 13: RELAY_STR = 0;
              while(COND13);
              RELAY_STR = 1;
              break;
              
      default: guc_choice=0;
               guc_buzz_state=0;
               RELAY_STR = 1;
               break;
    }
}

/*
void Check_Demo()
{
    uint8 udemo,ldemo;
    
    WDTCON = 0x16;
    if(PORTC.RC5==0)
     {
       DATAEE_WriteByte(DEMO_ADDR,0xFF);
       DATAEE_WriteByte(DEMO_ADDR+1,0xFF);
       while(1);
     }
    udemo=DATAEE_ReadByte(DEMO_ADDR);
    ldemo=DATAEE_ReadByte(DEMO_ADDR+1);
    Demo=(((udemo<<8)&0xFF00)|ldemo);

    if(Demo==0xFFFF)
    {
        Demo=0;
    }
    if(Demo>800) { while(1); }
    else 
    {
        Demo++;
        ldemo = (uint8)(Demo & 0x00FF);
        udemo = (uint8)(((Demo>>8)&0x00FF));
        
        DATAEE_WriteByte(DEMO_ADDR,udemo);
        DATAEE_WriteByte((DEMO_ADDR+1),ldemo);
    }   
}      */

void my_delay()
{
   for(i=0;i<1;i++)
    for(j=0;j<400;j++)
      asm CLRWDT ;
}


void sys_init()
{
  uint8 i;
  OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
  LATA = 0x00;
  LATC = 0x00;
  
  TRISA=0x20;
  TRISC=0x2F;
  
  ANSELA=0x00;
  ANSELC=0x00;


  BUZZER = 0;
  RELAY_SOL = 0;
  RELAY_STR = 0;
//  my_delay();
//  Check_Demo();
  WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
  TMR0_Initialize();
  TMR1_Initialize();
  #if PWM_EN == 1
  TMR2_Initialize();
  PWM3_Initialize();
  #endif
  for(i=0;i<6;i++) guc_cycle[i]=0;
  GIE_bit = 1;     /* Enable INTs  */
  RELAY_STR = 1;
}

void main()
{
  uint16 flag;
  sys_init();
  demo_time = 0;

  while(1)
   {
      check_cond();                 /*Check the condition*/
      if(guc_choice>0)
        exe_cond();               /*Execute the condtion*/
      guc_choice=0;                 /*Clear the condition*/
      #if(DEMO == 1)
      if(demo_time>360)
       {
         while(1);
       }
      #endif
   }
}