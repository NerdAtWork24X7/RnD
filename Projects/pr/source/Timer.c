/*  
Compiled with MikroC PRO for PIC v.5.8.0  
*/

// I/O port bit function definitions
#define outHbLed 4     //   PortB,4    (active low)
sbit pb_outHbLed at PORTB.B4;

#define outTimer 5     //   PortB,5    (active high)
sbit pb_outTimer at PORTB.B5;

#define inStart 0      //   PortB,0
sbit pb_inStart at PORTA.B0;

#define inClr          //   PortA,5 (MCLR as I/O)
sbit pb_inClr at PORTA.B5;

// Map switch to port bits.
sbit dsw1  at PORTA.B1;
sbit dsw2  at PORTA.B2;
sbit dsw3  at PORTA.B0;
sbit dsw4  at PORTA.B3;
sbit dsw5  at PORTA.B7;
sbit dsw6  at PORTA.B4;
sbit dsw7  at PORTA.B6;
sbit dsw8  at PORTB.B1;
sbit dsw9  at PORTB.B2;
sbit dsw10 at PORTB.B3;

const char EEPROMdata[] = {0x51,0x65,0x88} absolute 0x2100;


//volatile char timerRun;
bit timerRun;               // timer running flag bit
//bit tout_pulse;
bit tick;                   // timer tick flag bit, toggles at 1Hz
volatile unsigned int counter;       // timer countdown
volatile unsigned int timerPeriod;   // timer period from switch settings




   

// Stop timer is called if either the timed period ends
// or the Clr input goes low.
// Timer is stopped, outputs cleared and flags reset.
void stopTimer() {

          PORTB = (0<<outTimer | 1<<outHbLed); // turn off outputs
          T1CON.TMR1ON = 0;                    // stop timer 1
          PIR1.CCP1IF = 0;                     // clear timer interrupt flag
          timerRun = 0;                        // clear timer running flag bit
}




unsigned int readDSwitch (void){

     unsigned char  swdelay = 0;
     unsigned char  swmode = 0;
     unsigned int   delaytime;

     //if (dsw8) { swdelay = 128; }
     //if (dsw7) { swdelay += 64; }
     if (dsw6) { swdelay += 32; }
     if (dsw5) { swdelay += 16; }
     if (dsw4) { swdelay += 8; }
     if (dsw3) { swdelay += 4; }
     if (dsw2) { swdelay += 2; }
     if (dsw1) { swdelay += 1; }

     if (dsw9) { swmode = 4;}
     if (dsw8) { swmode += 2;}
     if (dsw7) { swmode += 1;}
     
     
     switch (swmode) {
     
            case 0: {delaytime = swdelay;} break;          //000  1s-63s,      1 sec int
            case 1: {delaytime = swdelay *  5;}  break;    //001  5s-5m15s,    5 sec int
            case 2: {delaytime = swdelay * 15;}  break;    //010  15s-15m45s, 15 sec int
            case 3: {delaytime = swdelay * 60;}  break;    //011  1m-63m,      1 min int
            case 4: {delaytime = swdelay * 120;} break;    //100  2m-2h6m,     2 min int
            case 5: {delaytime = swdelay * 300;} break;    //101  5m-5h15m,    5 min int
            case 6: {delaytime = swdelay * 600;} break;    //110  10m-10h30m,  10 min int
            case 7: {delaytime = swdelay * 900;} break;    //111  15m-15h45m,  15 min int
            
     }
        return delaytime;
}


void main() {

          CMCON = 0x07;
          PORTB = 1<<outHbLed;
          PORTA = 0;

          TRISB = ~(1<<outHbLed | 1<< outTimer );
          TRISA = 0xFF;
          
          OPTION_REG.INTEDG = 0;    // Set INT RB0 input to falling edge
          
          TMR1L = 0;
          TMR1H = 0;
          T1CON.T1CKPS0 = 0;        // Set Timer 1 prescaler
          T1CON.T1CKPS1 = 0;
          T1CON.TMR1CS  = 1;
          T1CON.T1OSCEN = 1;

          CCP1CON = 0b00001011;            // Timer 1 compare mode, Special Event mode
          CCPR1L = (16383 & 0x00FF);       // Preset compare register low/high bytes
          CCPR1H = (16383 & 0xFF00)>>8;

          
          PIR1.CCP1IF = 0;        // Clear timer1 compare interrupt
          INTCON.INTF = 0;        // Clear INT flag

          

          timerRun = 0;
          tick = 0;
          timerPeriod = readDSwitch();

          while(1){
      
                   // Timer1 compare interrupt set at 0.5 second intervals
                   if ( PIR1.CCP1IF ){

                   
                      PIR1.CCP1IF = 0;              // clear interrupt flag

                      pb_outHbLed = !pb_outHbLed;   // toggle hearbeat LED

                      if (tick){ counter--; }        // if tick flag true, decrement counter
                      if (!counter){ stopTimer();}   // if counter == 0 then stop timer.
                      
                      tick = !tick;                // toggle tick flag bit

                   }
      
                   // If Clr input low, stop timer, clear out.
                   if (!pb_inClr){
                      stopTimer();

                      }

                   
                   // if falling edge detected on INT.RB0 input start timer
                   if (INTCON.INTF){
                   
                      INTCON.INTF = 0;         // clear INT flag
                      
                      //  Check Clear' inClr input.  If it's low timer start is inhibited
                      // If it's high we can start the timer
                      if (pb_inClr){
                      
                      // if timerRun false (0) - that is not already running
                          if (!timerRun){

                             TMR1L = TMR1H = 0;      // reset timer 0
                             T1CON.TMR1ON = 1;       // enable Timer1
                             PIR1.CCP1IF = 0;        // clear interrupt flag

                             PORTB = (1<<outTimer | 0<<outHbLed); // Enable output

                             timerRun = 1;           // Set Timer running flag bit
                             tick = 0;               // Clear tick flag bit
                             // Load counter with time period in seconds
                             timerPeriod = readDSwitch();
                             counter = timerPeriod;

                          // if timer is running check switch 10 
                          }else if (dsw10){
                             TMR1L = TMR1H = 0;      // reset timer 0
                             T1CON.TMR1ON = 1;       // enable Timer1
                             PIR1.CCP1IF = 0;        // clear interrupt flag
                             tick = 0;               // Clear tick flag bit
                             timerPeriod = readDSwitch();
                             counter = timerPeriod;

                          }
                      }

                   }

          }

}