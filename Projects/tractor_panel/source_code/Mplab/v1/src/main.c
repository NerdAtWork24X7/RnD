/*
Example 1

This example shows a very simple J1939 implementation.  It uses polling
to check for a message to light an LED and to send a message if a
button is pressed.

Both Node 0 and Node 1 should be programmed with the same code, except
that OTHER_NODE should be defined as the other node’s J1939 Address.

Application Maestro should be run with the following options changed
from their default values (in addition to NAME, Address, and bit rate
values):

Interrupts or Polling - Polling
*/

#include <p18cxxx.h>
//#include <xc.h>
#include <htc.h>
#include "J1939.H"
#include "mcc.h"

// more configs:
#if 0						// 
#pragma config WDT = OFF
#pragma config PBADEN = OFF	//PORTB<4> and PORTB<1:0> Configured as Digital
//I/O Pins on Reset
#pragma config MCLRE = OFF
#pragma config LVP = OFF

#if 0
#pragma config OSC = IRCIO7	//Internal RC with OSC1 as RA7 and OSC2 as divide
//by 4 clock out
#else
#pragma config OSC = HS		//XTAL 20MHz
#endif
#endif
//
J1939_MESSAGE Msg;

// Define some arbitrary values.  They must agree with the other node's
// values.
#define J1939_STARTING_ADDRESS 128
#define OTHER_NODE		129
#define USART_NODE		130	// this is another (future) node,
// 
#define TURN_ON_LED		92	
#define TURN_OFF_LED	94	

extern void Lcd_Initialize(void);
extern void delay_ms(unsigned int ms);
extern void Data(char Value);
extern void Send2Lcd( char Adr, const char *Lcd);

void Task_Schm();

unsigned int Gl_tick = 0;

void TMR0_DefaultInterruptHandler(void){
    // add your TMR0 interrupt custom code
    // or set custom function using TMR0_SetInterruptHandler()
    Gl_tick++;
    if(Gl_tick >= 60000)
        Gl_tick = 0;
}

volatile uint8_t Adc_index = 0;
volatile uint8_t Adc_Buf_Full = 0;

volatile uint16_t Adc_Value_R1 = 0;
volatile uint16_t Adc_Value_R2 = 0;
volatile uint16_t Adc_Value_R3 = 0;
volatile uint16_t Adc_Value_L1 = 0;
volatile uint16_t Adc_Value_L2 = 0;

volatile uint16_t Adc_Queue_R1[20] = {0};
volatile uint16_t Adc_Queue_R2[20] = {0};
volatile uint16_t Adc_Queue_R3[20] = {0};
volatile uint16_t Adc_Queue_L1[20] = {0};
volatile uint16_t Adc_Queue_L2[20] = {0};

#define ADC_MAX_INDEX 20

void Adc_MainFunction()
{
    uint8_t ctr;
     
    if(Adc_index >= ADC_MAX_INDEX)
    {
        Adc_Buf_Full = 1;
        Adc_index = 0;
    }
    
    Adc_Queue_R1[Adc_index] = ADC_GetConversion(0);
    Adc_Queue_R2[Adc_index] = ADC_GetConversion(1);
    Adc_Queue_R3[Adc_index] = ADC_GetConversion(2);
    Adc_Queue_L1[Adc_index] = ADC_GetConversion(3);
    Adc_Queue_L2[Adc_index] = ADC_GetConversion(4);
    
    if(Adc_Buf_Full)
    {
        for(ctr=0;ctr<ADC_MAX_INDEX;ctr++)
        {
            Adc_Value_R1 += Adc_Queue_R1[ctr];
            Adc_Value_R2 += Adc_Queue_R2[ctr];
            Adc_Value_R3 += Adc_Queue_R3[ctr];
            Adc_Value_L1 += Adc_Queue_L1[ctr];
            Adc_Value_L2 += Adc_Queue_L2[ctr];
        }
        
        Adc_Value_R1 /= ADC_MAX_INDEX;
        Adc_Value_R2 /= ADC_MAX_INDEX; 
        Adc_Value_R3 /= ADC_MAX_INDEX; 
        Adc_Value_L1 /= ADC_MAX_INDEX; 
        Adc_Value_L2 /= ADC_MAX_INDEX;
        
        Adc_Value_R1 = (Adc_Value_R1 * 255) / 4095;
        Adc_Value_R2 = (Adc_Value_R2 * 255) / 4095;
        Adc_Value_R3 = (Adc_Value_R3 * 255) / 4095;
        Adc_Value_L1 = (Adc_Value_L1 * 255) / 4095;
        Adc_Value_L2 = (Adc_Value_L2 * 255) / 4095;             
    }
    Adc_index++;
}
    
void J1939_MainFunction()
{
	Msg.DataPage = 0;
	Msg.Priority = J1939_CONTROL_PRIORITY;
	Msg.DestinationAddress = OTHER_NODE;
	Msg.DataLength = 0;
	Msg.PDUFormat = TURN_ON_LED;
	
    /* Transmit Messages*/
    while (J1939_EnqueueMessage( &Msg ) != RC_SUCCESS)
	J1939_Poll(5);                                          //Data Send
	
    /* Receive Messages*/    
	while (RXQueueCount > 0)
	{
		J1939_DequeueMessage( &Msg );
        // data_received = Msg.PDUFormat; 
	}
	// Since we donot accept the Commanded Address message,
	// the value passed here doesnot matter.
	J1939_Poll(20);
    
}

void Task_Schm()
{
    Adc_MainFunction();
    J1939_MainFunction();
}


void main( void )
{

    SYSTEM_Initialize();
    Lcd_Initialize();
    delay_ms(5);
	Send2Lcd(0xC0,"                ");
    
	J1939_Initialization( TRUE );
	while (J1939_Flags.WaitingForAddressClaimContention)// Wait for address contention to time out
	J1939_Poll(5);
	                                   // Now we know our address should be good, so start checking for
	                                   // messages and switches.
	while(1)
	{
        if((Gl_tick % 10) == 0)
        {
           Task_Schm();
        }
	}	
}

void delay_ms(unsigned int ms)
{
	int i,count;
	for(i=1;i<=ms;i++)
	{
		count=249;
		while(count!=1)
		{
			count--;
		}
	}
}
