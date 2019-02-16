/****************************************************************************
* NAME:        Tractor.c
* DESCRIPTION: Conatins OPSM code
* AUTHOR:      Sahil Vartak
* COMPANY:     VS-CORP
* EMAIL-ID:    vs.corp.in@gmail.com
***************************************************************************/
#include "../inc/types.h"
#include "../inc/tmr0.h"

uint16 Demo=0;
uint8 test;
uint8 guc_choice=1;
volatile uint16 guc_cycle[6],guc_sec=0;
volatile uint8 cnt,critcal_cond=0,guc_buzz_state=0;
volatile uint16  i,j,demo_time=0;

/****************************************************************************
* NAME:        interrupt
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void interrupt()
{
   if(TMR0IE_bit == 1 && TMR0IF_bit == 1)
    {
        TMR0_ISR();
    }
    else
    {
    }
}

/****************************************************************************
* NAME:        check_cond
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
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

/****************************************************************************
* NAME:        exe_cond
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
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
              while(guc_sec<10)
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
              while(guc_sec < 10)
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

/****************************************************************************
* NAME:        my_delay
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void my_delay()
{
   for(i=0;i<1;i++)
    for(j=0;j<400;j++)
      asm CLRWDT ;
}

/****************************************************************************
* NAME:        sys_init
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void sys_init()
{
  uint8 i;
  OSCCON = 0x72;
  ANSELA=0x00;
  ANSELC=0x00;
  TRISA=0x00;
  TRISC=0x0F;
  BUZZER = 0;
  RELAY = 0;
  WDTCON = 0x17;
  TMR0_Initialize();
  for(i=0;i<6;i++) guc_cycle[i]=0;
  GIE_bit = 1;
}

/****************************************************************************
* NAME:        main
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void main()
{
  sys_init();
  while(1)
   {
      check_cond();
      if(guc_choice>0)
        exe_cond();
      guc_choice=0;
   }
}