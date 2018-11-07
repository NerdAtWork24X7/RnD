#include"types.h"
#include"tmr0.h"
#include"tmr2.h"
#include"pwm3.h"
#include"memory.h"

#define COND1 ((!SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(GEAR))
#define COND2 ((!SEAT_SWITCH)&(!PTO)&(HAND_BRAKE)&(!GEAR))
#define COND3 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(GEAR))
#define COND4 ((!SEAT_SWITCH)&(PTO)&(HAND_BRAKE)&(!GEAR))
#define COND5 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(GEAR))
#define COND6 ((!SEAT_SWITCH)&(PTO)&(!HAND_BRAKE)&(!GEAR))

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
volatile uint16 guc_cycle[6],guc_sec=0;
volatile uint8 cnt,critcal_cond=0,guc_buzz_state=0;

void interrupt()
{
  if(TMR0IE_bit == 1 && TMR0IF_bit == 1)  /* interrupt handler*/
   {
     TMR0_ISR();
   }
  else         /*Unhandled Interrupt*/
   {
   }
}

void check_cond()
{
  if(COND1) 
   {
     if(guc_cycle[0]<NO_CYCLE_1)
     {
       guc_choice=1; guc_cycle[0]++;guc_cycle[1]=0; guc_cycle[2]=0;
       guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]=0;
     }
   }
  else if(COND2)
   {
     if(guc_cycle[1]<NO_CYCLE_2)
     {
       guc_choice=2; guc_cycle[0]=0;guc_cycle[1]++; guc_cycle[2]=0;
       guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]=0;
     }
   }
  else if(COND3)
   {
     if(guc_cycle[2]<NO_CYCLE_3)
     {
       guc_choice=3; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]++;
       guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]=0;
     }
   }
  else if(COND4) 
   {
     if(guc_cycle[3]<NO_CYCLE_4)
     {
       guc_choice=4; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]=0;
       guc_cycle[3]++; guc_cycle[4]=0; guc_cycle[5]=0;
     }
   }
  else if(COND5)
   {
     if(guc_cycle[4]<NO_CYCLE_5)
     {
       guc_choice=5; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]=0;
       guc_cycle[3]=0; guc_cycle[4]++; guc_cycle[5]=0;
     }
   }
  else if(COND6) 
   {
     if(guc_cycle[5]<NO_CYCLE_6)
     {
       guc_choice=6; guc_cycle[0]=0;guc_cycle[1]=0; guc_cycle[2]=0;
       guc_cycle[3]=0; guc_cycle[4]=0; guc_cycle[5]++;
     }
   }
}

void exe_cond()
{
  guc_sec=0;
  switch(guc_choice)
    {
      case 1: while(guc_sec<2)
              {
                if(COND2 || !COND1) break;
              }
              guc_buzz_state=1;
              while(COND1);
              guc_buzz_state=0;
              break;
      case 2: guc_buzz_state=1;
              while(COND2);
              guc_buzz_state=0;
              break;
      case 3: while(guc_sec<3)
              {
                if(COND2 || !COND3) break;
              }
              guc_buzz_state=1;
              guc_sec=0;
              while(guc_sec<5)
              {
                if(COND2 || !COND3) break;
              }
              guc_buzz_state=0;guc_sec=0;
              RELAY = 1; 
              while(guc_sec<5)
              {
                if(COND2 || !COND3) break;
              }  
              RELAY = 0;
              break;
      case 4: while(guc_sec<3)
              {
                if(COND2 || !COND4) break;
              }
              guc_buzz_state=1;
              guc_sec=0;
              while(guc_sec<5)
              {
                if(COND2 || !COND4) break;
              }
              guc_buzz_state=0;guc_sec=0;
              RELAY = 1;
              while(guc_sec<5)
              {
                if(COND2 || !COND4) break;
              }
              RELAY = 0;
              break;
      case 5: while(guc_sec<3)
              {
                if(COND2 || !COND5) break;
              }
              guc_buzz_state=1;guc_sec=0;
              while(guc_sec<7)
              {
                if(COND2 || !COND5) break;
              }  
              guc_buzz_state=0;
              break;
       case 6: while(guc_sec<3)
              {
                if(COND2 || !COND6) break;
              }
              guc_buzz_state=1;guc_sec=0;
              while(guc_sec<7)
              {
                if(COND2 || !COND6) break;
              }
              guc_buzz_state=0;
              break;

      default: guc_choice=0;
               guc_buzz_state=0;
               break;
    }
}

void Check_Demo()
{
    uint8 udemo,ldemo;
    
    WDTCON = 0x16;   /*WDTPS 1:65536; SWDTEN OFF; */
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
}

void my_delay()
{
  uint16 i,j;
  for(i=0;i<1;i++)
   for(j=0;j<400;j++)
    asm CLRWDT ;
}


void sys_init()
{
  uint8 i;
  OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */
  ANSELA=0x00;
  ANSELC=0x00;
  TRISA=0x00;
  TRISC=0x2F;
  BUZZER = 0;
  RELAY = 0;
  my_delay();
  Check_Demo();
  WDTCON = 0x17;                    /*WDTPS 1:65536; SWDTEN ON; */
  TMR0_Initialize();
  #if PWM_ON == 1
  TMR2_Initialize();
  PWM3_Initialize();
  #endif
  for(i=0;i<6;i++) guc_cycle[i]=0;
  GIE_bit = 1;                     /* Enable INTs  */
}

void main()
{
  sys_init();
  while(1)
   {
     check_cond();                 /*Check the condition*/
     if(guc_choice>0)
      exe_cond();                  /*Execute the condtion*/
     guc_choice=0;                 /*Clear the condition*/
   }
}