/ ************************************************* ************************
// Function name: fn_Init_CAN (void)
// Operation: Initialization of CAN communication
// Argument:
// Creation: NAKA 16.02.08
// Remarks:
// **************************************** ******************************* /
void fn_Init_CAN (void)
{
 // CAN port setting
 PIOR4 = 0x40; // Peripheral I / O
 communication register setting P7 | = 0x04; // P72 (CTXD)
 PM7 & = 0xFB; // CTXD0 (P72pin) is "0":
 PMC7 & = 0xFB for output ; // PMC setting When using CAN "0"
 PM7 | = 0x08; // Set CRXD0 (P73pin) to "1": Input
 PMC7 & = 0xF7; // PMC setting "0" when CAN is used

 // When using an external crystal oscillator 8MHz ----------
 CAN0EN = 1; // Supply clock to CAN module
 CAN0MCKE = 1; // Supply X1 clock to CAN
    module__nop ();
 while ((GSTS & 0x0008)! = 0) {} // Wait for RAM clear for CAN GRAMINIT flag is "0": RAM clear?
 GCTRL & = 0xFFFB; // GSLPR = 0 Transition to global mode (GMDC = 01)
 while ((GSTS & 0x0004)! = 0) {} // Check CAN global mode transition
 C0CTRL & = 0xFFFB; // CSLPR = 0 Change from
 unload mode to unload mode while ((C0STSL & 0x0004)! = 0) {} // Confirm the change to CAN
 unload mode GCFGL = 0x0010; // DCS = 1: fCAN = X1 = 8MHz Set DLC What is
 C0CFGH = 0x0049; // Set SJW = 1 TSEG2 = 5 TSEG1 = 10 Baud rate presser (1) Without frequency division
 C0CFGL = 0x0000;
 

 GAFLCFG = 0x0006; // Setting the number of received mails 0: No mailing? or 1: Use receive buffer?
 GRWCR = 0x0000; // Received
 message change preparation GAFLIDL0 = 0x0000; // Received message ID setting Do not compare?
 GAFLIDH0 = 0x0000; // Received
 message standard ID / data frame GAFLML0 = 0x0000; // Received message ③ Corresponding ID No masking Since "0000" is not checked, all bits are received.
 GAFLMH0 = 0xE000; // Reception tool Standard ID? And data form? Is another CAN mode transmitting? Compare.
 GAFLPL0 = 0x0001; // Receive tool Selects receive FIFO buffer 0 (GAFLFDP0) only
 GAFLPH0 = 0x0000; // Receive
 tool does not check DLC GRWCR = 0x0001; // Receive tool change complete
 
 // Receive buffer setting
 RFCC0 = 0xF302 ; //
 C0CTRL | = 0x0008; // RTBO = 1: Forcibly recover buffer?
 
 GCTRL & = 0xFFFC; // GSLPR = 0 Transition from global mode to global operation mode (GMDC = 00)
 while ((GSTS & 0x0001)! = 0) {} // Check transition of CAN global operation mode
 RFCC0 | = 0x0001; // RFE (1: Enable use of FIFO buffer) Note) Change to high-
 level operation mode
 while ((C0STSL & 0x0001)! = 0) {} /// Confirm transition to CAN channel communication
 
    mode__nop ();
}


// ************************************************ ********************
// ************* Main routine ************* ****************************
// ******************** ************************************************
unsigned char CAN_RX_DATA [8];
unsigned char CAN_RX_DLC;
unsigned short CAN_RX_ID;
unsigned short i;

while (1)
{
 if (f_TRD0! = 0) // event every 1ms (TRD0-computer)
 {
  f_TRD0 = 0;
   i ++;
   if (i> = 1000) // timing every 1s
   {
    i = 0;
          
    / / ★★★ CAN transmission (periodical transmission every second)
    ★★★★★★★★★★★★★★★ TMSTS0 & = 0xF9; // Transmission result flag
    while ((TMSTS0 & 0x06)! = 0) {} // Confirm
    TMIDH0 = 0x0000; // Do not buffer the standard ID data frame history
    // ID set
    TMIDL0 = 0x0123; // Set ID to transmission ID buffer 0!
    // Data length set
    TMPTR0 = 0x8000; / /
    Set DLC in transmit DLC buffer 0! // Data set
    TMDF00L = CAN_RX_ID >> 8; // Transmit receive ID
    TMDF00H = (unsigned char) (CAN_RX_ID & 0x00FF);
    TMDF10L = CAN_RX_DLC; // Send received DLC
    TMDF10H = CAN_RX_DATA [0]; // Send received DATA0
    TMDF20L = CAN_RX_DATA [1]; // Send received DATA1
    TMDF20H = CAN_RX_DATA [2]; // Send received DATA2
    TMDF30L = CAN_RX_DATA [3]; // Transmit receive DATA3
    TMDF30H = 0x12; // Transmit fixed data
    TMC0 | = 0x01; // Transmit request TMTR to "1"


    // ★★★ Reception of CAN   
    ★★★★★★★★★★★★★★★★★★★★★★★★★ CAN_RX_ID = RFIDL0; // Store ID
    CAN_RX_DLC = RFPTR0 >> 12; / / Store
    DCL CAN_RX_DATA [0] = RFDF00L; // Store
    Data0 CAN_RX_DATA [1] = RFDF00H; // Store
    Data1 CAN_RX_DATA [2] = RFDF10L; // Store Data2
    CAN_RX_DATA [3] = RFDF10H; // Data3 storing
    CAN_RX_DATA [4] = RFDF20L; // Data4 stored
    CAN_RX_DATA [5] = RFDF20H; // Data5 store
    CAN_RX_DATA [6] = RFDF30L; // Data6 store
    CAN_RX_DATA [7] = RFDF30H; // store Data7
    RFPCTR0 = 0x00FF; // Buffer point increment
   
   }
  }
 }