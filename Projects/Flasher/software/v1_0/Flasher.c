#include "types.h"
#include "Flasher.h"
#include "tmr0.h"
#include "adc.h"

void Check_ADC();
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
  WARN_IND = 0;
  TRAIL_1 = 0;
  TRAIL_2 = 0;
}

void sys_init()
{
  OSCCON = 0x7A; // SCS INTOSC; SPLLEN disabled; IRCF 16MHz_HF;
  LATA = 0x00;
  TRISA = 0x1C;
  ANSELA = 0x14;
  APFCON = 0x29;
  reset_all();
  WDTCON = 0x16;   /*WDTPS 1:65536; SWDTEN ON; */
  TMR0_Initialize();

  Soft_UART_Init(&PORTA, 1, 5, 9600, 0); // Initialize Soft UART at 14400 bps
  
  ADC_Initialize();
  
  GIE_bit = 1;     /* Enable INTs  */
}

void main()
{
  sys_init();
  while(1)
   {
      asm CLRWDT;
   }
}