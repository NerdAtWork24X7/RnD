#include"types.h"

//------------------------------------------------------------------------------
const Addy = 0xE0;                    // set I2C device address
const Delay_Time = 250;               // port check delay
//------------------------------------------------------------------------------
//                      Global Processing Variables
//------------------------------------------------------------------------------
unsigned short j,pos=0;                      // just dummy for buffer read
unsigned short rxbuff[2];               //
unsigned short tx_data;                //
//------------------------------------------------------------------------------
void Init(){
  OSCCON = 0b01110000;   // INT clock used, set for 8 MHz.
  ANSELA =  0;
  PORTA = 0;
  TRISC = 0x03;                        // Set PORTC as input
  TRISA =  0b00000000;
  OPTION_REG = 0b11000000;
  INTCON = 0b11010000;

  OPTION_REG = 0b11000100;
 // TMR0  = 96;              // Timer0 initial value
//  INTCON = 0b11110000;          // Enable TMRO interrupt


  ////
  ADCON1 = 0x0F;                          // All ports set to digital
  SSPADD =  Addy;                      // Get address (7bit). Lsb is read/write flag
  SSPCON = 0x36;                       // Set to I2C slave with 7-bit address
  PIE1.SSP1IF = 1;                      // enable SSP interrupts

  PIE1.SSP1IE = 1;                      // enable SSP interrupts

  ////
  
  
  
  
  /*ADCON1 = 0;                          // All ports set to digital
  TRISA = 0;                           // Set PORTA as output
  TRISC = 0x03;                        // Set PORTC as input
  SSPADD =  Addy;                      // Get address (7bit). Lsb is read/write flag
  SSPCON = 0x36;                       // Set to I2C slave with 7-bit address
  INTCON = 0xC0;                       // enable INTCON.GIE
  INTCON.GIE = 1;
  INTCON.PEIE = 1;
  PIE1.SSP1IE = 1;                      // enable SSP interrupts
  PIE1.TMR1IE = 1;
  PIR1.TMR1IF = 0;
  PIR1.SSP1IF = 0;   */
}
void PWM_init()
{
   PWM1_Init(4500);
   PWM2_Init(4500);
   PWM3_Init(4500);
   
   PWM1_Start();
   PWM2_Start();
   PWM3_Start();
}
//------------------------------------------------------------------------------
void interrupt(){                      // I2C slave interrupt handler

 /*   u8 state;
     if (PIR1.SSP1IF == 1)
     {                // I2C Interrupt
    state=0;                           //reset state
    PIR1.SSP1IF = 0;                    // reset SSP interrupt flag
    if (SSPCON.SSPOV==1)
    {
      SSPCON.SSPOV=0;
      j=SSPBUF; // Read address to clear buffer
    }
    else {
      if (SSPSTAT.S==1 && SSPSTAT.WR==0 && SSPSTAT&0x20==0 && SSPSTAT.BF==1){state=1;} // State 1: MASTER WRITE, LAST BYTE WAS AN ADDRESS
      if (SSPSTAT.S==1 && SSPSTAT.WR==0 && SSPSTAT&0x20==1 && SSPSTAT.BF==1){state=2;} // State 2: MASTER WRITE, LAST BYTE WAS DATA
      if (SSPSTAT.S==1 && SSPSTAT.WR==1 && SSPSTAT&0x20==0 && SSPSTAT.BF==0){state=3;} // State 3: MASTER READ, LAST BYTE WAS AN ADDRESS
      if (SSPSTAT.S==1 && SSPSTAT.WR==1 && SSPSTAT&0x20==1 && SSPSTAT.BF==0){state=4;} // State 4: MASTER READ, LAST BYTE WAS DATA
      if (SSPSTAT.S==1 && SSPSTAT.WR==0 && SSPSTAT&0x20==1 && SSPSTAT.BF==0 &&  SSPCON.CKP==1){state=5;} // State 5: MASTER NACK

      switch ( state ) 
       {
        case 0:
          rxbuff[pos] = SSPBUF;                         // get addr
          pos++;
          if(pos>1) pos=0;
          j = SSPBUF;
          break;

        case 1:
          rxbuff[0]=SSPBUF; // Read address to clear buffer
          RA1_bit=1;
          break;

        case 2:
          rxbuff[1]=SSPBUF; // Read DATA from master.
          RA4_bit=1;
          break;

        case 3:
          SSPCON.CKP =0; // Hold the SCL line low
//        SSPBUF = tx_data; // load buffer with data to be sent to master
          SSPCON.CKP =1; // Release the SCL line
          j=SSPBUF; // read to empty buffer
          RA5_bit=1;
          break;

        case 4:
          SSPCON.CKP =0; // Hold the SCL line low
          SSPBUF = tx_data; // load buffer with data to be sent to master
          SSPCON.CKP =1; // Release the SCL line
          j=SSPBUF; // read to empty buffer
          break;

        case 5:
          j=SSPBUF; // read to empty buffer
          
          break;

        default :
          j=SSPBUF; // read to empty buffer
          
          break;
      }
    }
    if (SSPCON.SSPOV==1)                //receive over
    {
      SSPCON.SSPOV=0;
      j=SSPBUF; // Read address to clear buffer
    }
  } //I2C interrupt end     */
  if (PIR1.SSP1IF == 1){                // I2C Interrupt

    PIR1.SSP1IF = 0;                    // reset SSP interrupt flag

    //transmit data to master
    if ((SSPSTAT>>2)&1 == 1){             // Read request from master
      SSPBUF = tx_data;                // Get data to send
      SSPCON.CKP = 1;                  // Release SCL line
      j = SSPBUF;                      // That's it
      return;
    }
    if (SSPSTAT&1 == 0){              // all done,
      j = SSPBUF;                      // Nothing in buffer so exit
      return;
    }

    //recieve data from master
    if ((SSPSTAT>>5)&1 == 1){             // Data [not address]
      rxbuff[pos] = SSPBUF;                         // get addr
      pos++;
      if(pos>1) pos=0;
      j = SSPBUF;                 // read buffer to clear flag [address]
      return;
    }
  }
  j = SSPBUF;                              // read buffer to clear flag [address]
}
//------------------------------------------------------------------------------
void main()
{

  Init();
  PWM_init();
  
  while(1)
  {
     if(rxbuff[0]==1){PWM1_Set_Duty(rxbuff[1]*45);}
     else if(rxbuff[0]==2){ PWM2_Set_Duty(rxbuff[1]*45);}
      else if(rxbuff[0]==3){ PWM3_Set_Duty(rxbuff[1]*45);}

  }
}