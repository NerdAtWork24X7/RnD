/* 
 * File:   OPSM_APP.c
 * Author: Your Name <Sahil Vartak at Vs.Corp.in@gmail.com>
 *
 * Created on December 15, 2018, 8:22 PM
 */

/****************************Header Files**************************************/
#include "OPSM_APP.h"
/******************************************************************************/

/****************************Global Variables**********************************/
volatile uint8_t guc_choice=0;
volatile uint16_t guc_cycle[13];
volatile uint16_t guc_deb[15]={0};
volatile uint8_t guc_buzz_state=0;
/******************************************************************************/

/********************************C Source**************************************/

void CHCK_COND(uint8_t x)
{
   uint8_t i;
   guc_deb[x]++;
   for(i=0;i<=14 && i!=x;i++){guc_deb[i] = 0;}
   if(guc_deb[x] > 10){ guc_choice = x; guc_deb[x] = 0;}
}


void check_cond()
{
    guc_choice = 0;
    if(COND1){ CHCK_COND(1); }
    else if(COND2){ CHCK_COND(2); }
    else if(COND3){ CHCK_COND(3); }
    else if(COND4){ CHCK_COND(4); }
    else if(COND5){ CHCK_COND(5); }
    else if(COND6){ CHCK_COND(6); }
    else if(COND7){ CHCK_COND(7); }
    else if(COND8){ CHCK_COND(8); }
    else if(COND9){ CHCK_COND(9); }
    else if(COND10){ CHCK_COND(10);}
    else if(COND11){ CHCK_COND(11); }
    else if(COND12){ CHCK_COND(12); }
    else if(COND13){ CHCK_COND(13); }
    else {CHCK_COND(14);}
  
    CLRWDT();
}

void exe_cond()
{
  if(guc_choice == 1 || guc_choice == 2 || guc_choice == 3
    || guc_choice == 4 ){guc_buzz_state=1;}
  else { guc_buzz_state=0;}

  if(guc_choice == 5 || guc_choice == 6 || guc_choice == 7 || guc_choice == 8
    || guc_choice == 9 || guc_choice == 10 || guc_choice == 11
    || guc_choice == 12 )
    {P_IND = 1;}
  else { P_IND = 0;}

 #if START_REL == 1
  if(guc_choice == 1 || guc_choice == 5 || guc_choice == 9
    || guc_choice == 13){ rel_lock = 0; RELAY_STR = 0;}
  else {RELAY_STR = 1;}
 #endif
  
  if(guc_choice == 2)
   {
       guc_sec=0; RELAY_SOL = 1;
       while(guc_sec<6) CLRWDT();
       RELAY_SOL = 0;
       while(COND2) CLRWDT();
       guc_buzz_state=0;
   }
  else if(guc_choice == 6)
   {
       guc_sec=0; RELAY_SOL = 1;
       while(guc_sec<6) CLRWDT();
       RELAY_SOL = 0;
       while(COND6) CLRWDT();
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

/******************************************************************************/

