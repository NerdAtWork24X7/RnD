/****************************************************************************
* NAME:        APP_OPSM.c
* DESCRIPTION: Conatins OPSM code
* AUTHOR:      Sahil Vartak
* COMPANY:     VS-CORP
* EMAIL-ID:    vs.corp.in@gmail.com
***************************************************************************/
#include "../inc/APP_OPSM.h"

volatile uint8 guc_choice=0,rel_lock=0;
volatile uint16 guc_sec=0;
volatile uint8 guc_buzz_state=0;

/****************************************************************************
* NAME:        interrupt
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void interrupt()
{
   asm CLRWDT ;
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
    guc_choice = 0;
    if(COND1){ guc_choice = 1;}
    else if(COND2){ guc_choice = 2; }
    else if(COND3){ guc_choice = 3; }
    else if(COND4){ guc_choice = 4; }
    else if(COND5){ guc_choice = 5; }
    else if(COND6){ guc_choice = 6; }
    else if(COND7){ guc_choice = 7; }
    else if(COND8){ guc_choice = 8; }
    else if(COND9){ guc_choice = 9; }
    else if(COND10){ guc_choice = 10; }
    else if(COND11){ guc_choice = 11; }
    else if(COND12){ guc_choice = 12; }
    else if(COND13){ guc_choice = 13; }
    else {guc_choice = 14;}

    asm CLRWDT ;

}

/****************************************************************************
* NAME:        exe_cond
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void exe_cond()
{
  if(guc_choice == 1 || guc_choice == 2 || guc_choice == 3
    || guc_choice == 4 || guc_choice == 5 ){guc_buzz_state=1;}
  else { guc_buzz_state=0;}

  if( guc_choice == 6 || guc_choice == 7 || guc_choice == 8
    || guc_choice == 9 || guc_choice == 10 || guc_choice == 11
    || guc_choice == 12 )
    {P_IND = 1;}
  else { P_IND = 0;}

  if(guc_choice == 2)
   {
       guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
       RELAY_SOL = 0;rel_lock = 1;
       while(COND2)asm CLRWDT ;
       guc_buzz_state=0;
   }
  else if(guc_choice == 6)
   {

       guc_sec=0; RELAY_SOL = 1;while(guc_sec<6);
       RELAY_SOL = 0;rel_lock = 1;
       while(COND6)asm CLRWDT ;
       guc_buzz_state=0;
   }
  else { RELAY_SOL = 0;}

  if (guc_choice == 14)
  {
    guc_buzz_state=0;
    P_IND = 0;
    RELAY_SOL = 0;
    BUZZER = 0;
  }
}

/****************************************************************************
* NAME:        sys_init
* DESCRIPTION: text
* ARGUMENTS:   void
* RETURNS:     void
***************************************************************************/
void sys_init()
{
  OSCCON = 0x72;

  PORTA = 0x00;
  LATA = 0x00;
  ANSELA = 0x00;
  TRISA = 0x20;

  PORTC = 0x00;
  ANSELC = 0x00;
  LATC = 0x00;
  TRISC = 0x0F;

  BUZZER = 0;
  RELAY_SOL = 0;

  WDTCON = 0x17;
  TMR0_Initialize();

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
      if(guc_choice > 0)
      {
        exe_cond();
      }
      guc_choice=0;
      asm CLRWDT ;
   }
}