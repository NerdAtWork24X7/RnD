#include "APP.h"

extern volatile uint8 one_min;
volatile uint8 ML_Status = 0,u_ip_r = 0,u_ip_g = 0,u_ip_b = 0;


void interrupt()
{
   asm CLRWDT ;
   if(TMR0IE_bit == 1 && TMR0IF_bit == 1)   /* interrupt handler*/
    {
        TMR0_ISR();
    }

}

void reset_all()
{
    OP_R = 0;
    OP_G = 0;
    OP_B = 0;
}

void Input_SW()
{
    if(IP_R) 
    {
      u_ip_r++;
      if(u_ip_r > DEBO_TIME)
      {
         ML_Status |= 0x01;
         u_ip_r = DEBO_TIME;
      }
      
    }
    else 
    {
      u_ip_r = 0;
      ML_Status &= 0xFE;
    }
    
    
    if(IP_G)
    {
      u_ip_g++;
      if(u_ip_g > DEBO_TIME)
      {
         ML_Status |= 0x02;
         u_ip_g = DEBO_TIME;
      }

    }
    else
    {
      u_ip_g = 0;
      ML_Status &= 0xFD;
    }
    
    
    if(IP_B)
    {
      u_ip_b++;
      if(u_ip_b > DEBO_TIME)
      {
         ML_Status |= 0x04;
         u_ip_b = DEBO_TIME;
      }

    }
    else
    {
      u_ip_b = 0;
      ML_Status &= 0xFB;
    }

    
}

void Uart_Send(char* msg)
{
  while(*msg)
    Soft_UART_Write(*msg++);
  Soft_UART_Write(0x0D);
}


char* recv_mess()
{

}

void Send_mess()
{

}


void Check_cond()
{

}



void sys_init()
{
  OSCCON = 0x72;   /* SCS INTOSC; SPLLEN disabled; IRCF 8MHz_HF; */

  PORTA = 0x00;
  LATA = 0x00;
  ANSELA = 0x00;
  TRISA = 0x00;

  PORTC = 0x00;
  ANSELC = 0x00;
  LATC = 0x00;
  TRISC = 0x07;

  reset_all();
  
  WDTCON = 0x17;   /*WDTPS 1:65536; SWDTEN ON; */
  TMR0_Initialize();
  
  Soft_UART_Init(&PORTA, 5, 4, 9600, 0); // Initialize Soft UART at 14400 bps
  
  GIE_bit = 1;     /* Enable INTs  */
}

void main()
{
  sys_init();

  while(1)
  {
        if(one_min % 2 == 0)
        {
          Input_SW();
        }
        if(one_min % 30 == 0)
        {
          Check_Cond();
        }
  }
}