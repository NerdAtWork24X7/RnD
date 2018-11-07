/*
 * Project name:
     Slave
 * Description:
     Slave code for PIC 2 PIC I2C Communication
     Write data from Master to PORTB
     Send PORTC data to Master
 * Configuration:
     MCU:             PIC16F876A
     SW:              mikroC v6.0
 * NOTES:
*/

//------------------------------------------------------------------------------
const Addy = 0xD2;                    // set I2C device address
const Delay_Time = 250;               // port check delay
//------------------------------------------------------------------------------
//                      Global Processing Variables
//------------------------------------------------------------------------------
unsigned short j;                      // just dummy for buffer read
unsigned short rxbuffer;               //
unsigned short tx_data;                //
//------------------------------------------------------------------------------
void Init(){
  ADCON1 = 0;                          // All ports set to digital
  TRISA = 0;                           // Set PORTA as output
  TRISB = 0;                           // Set PORTB as output
  TRISC = 0xFF;                        // Set PORTC as input
  SSPADD =  Addy;                      // Get address (7bit). Lsb is read/write flag
  SSPCON = 0x36;                       // Set to I2C slave with 7-bit address
  PIE1.SSPIF = 1;                      // enable SSP interrupts
  INTCON = 0xC0;                       // enable INTCON.GIE

    //* Interrupts erlauben *//
    INTCON.GIE = 1;
    INTCON.PEIE = 1;
    PIE1.SSPIE = 1;                      // enable SSP interrupts
    PIE1.TMR1IE = 1;
    PIR1.TMR1IF = 0;
    PIR1.SSPIF = 0;
}
//------------------------------------------------------------------------------
void interrupt(){                      // I2C slave interrupt handler

  if (PIR1.SSPIF == 1){                // I2C Interrupt
    PIR1.SSPIF = 0;                    // reset SSP interrupt flag

    //transmit data to master
    if (SSPSTAT.R_W == 1){             // Read request from master
      SSPBUF = tx_data;                // Get data to send
      SSPCON.CKP = 1;                  // Release SCL line
      j = SSPBUF;                      // That's it
      return;
    }
    if (SSPSTAT.BF == 0){              // all done,
      j = SSPBUF;                      // Nothing in buffer so exit
      return;
    }

    //recieve data from master
    if (SSPSTAT.D_A == 1){             // Data [not address]
      rxbuffer = SSPBUF;               // get data
      j = SSPBUF;                      // read buffer to clear flag [address]
      return;
    }
  }
  j = SSPBUF;                              // read buffer to clear flag [address]
}
//------------------------------------------------------------------------------
void main(){
  Init();
  while(1){

    PORTB   = rxbuffer;
    tx_data = PORTC;
    Delay_ms(Delay_Time);
  }
}