//------------------------------------------------------------------------------
const Addy = 0xD2;                    // set I2C device address
const Delay_Time = 250;              // port check delay
//------------------------------------------------------------------------------
//                      Global Processing Variables
//------------------------------------------------------------------------------
unsigned short j,pos=0;                      // just dummy for buffer read
unsigned short rxbuff[2];
unsigned short tx_data;
//------------------------------------------------------------------------------
void Init()
{
  TRISA=0x00;                        // Set PORTA as output
  TRISB=0x00;                        // Set PORTB as output
  TRISC=0x18;                        // Set PORTC as output and input for i2c
  ANSEL = 0;                           // Configure AN pins as digital I/O
  ANSELH = 0;
  ADCON1 = 0;                          // All ports set to digital
  SSPADD =  Addy;                      // Get address (7bit). Lsb is read/write flag
  SSPCON = 0x36;                       // Set to I2C slave with 7-bit address
  INTCON = 0xC0;                       // enable INTCON.GIE
  INTCON.GIE = 1;
  INTCON.PEIE = 1;
  PIE1.SSPIE = 1;                      // enable SSP interrupts
  PIE1.TMR1IE = 1;
  PIR1.TMR1IF = 0;
  PIR1.SSPIF = 0;
}

//------------------------------------------------------------------------------
void interrupt()                      // I2C slave interrupt handler
{
  if (PIR1.SSPIF == 1){                // I2C Interrupt

    PIR1.SSPIF = 0;                    // reset SSP interrupt flag

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