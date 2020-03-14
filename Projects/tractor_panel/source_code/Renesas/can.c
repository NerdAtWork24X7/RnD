
/*1) Transition and confirmation from global stop to global reset
2) Transition and confirmation from channel stop to channel reset
3) Communication rule setting and RPAGE bit set of GWCRL
4) Transition and confirmation to global operation mode
5) Transition to channel communication mode and check
allow 6) CAN0 the transmit interrupt (Can_start)
7) to the transmission buffer write (can_tx_engue)
preparing data to 8) slot (can_tx_deque)
transmission request (can_tx_req) from 9) slot
　confirmation and clear here in TMSTS TMTRF Is it necessary? (Question Q1)
　(It is not the original source, but the result was the same even if it was inserted.)
　Finally, set the TMTR bit of TMC.

At this point, "Channel error interrupt has occurred!" Also, can_tx_isr () should be called for the INTCAN0TRM interrupt, but it was never called. Why did an error interrupt occur before a transmission interrupt occurred? (Question Q2)

By the way, the situation is the same with or without a bank.
#pragma interrupt intcan0trm_isr (vect = INTCAN0TRM) //, bank = RB1) // can_tx_isr ()

In the original source, the TMRTF bit of TMSTS was dropped in the can_tx_isr () interrupt routine, and the transmission request should have been made by calling can_tx_deque () and can_tx_req ().
　
So, one more question, is the transmission interrupt occurring when the TMTR bit in the TMC is set, or when the TMTR bit in the TMC is set? (Question Q3)

Note *) The hardware configuration is
[PC] = [e2 Lit] = [RL78 / F13 + CAN (without termination)] = [CAN monitor (with termination)] = [CAN-Receiver (with termination) + RX65N]
(Communication without CANApi interrupt with the same configuration has been confirmed. Log at 500KBPS, UART1) Many

questions, but thank you.

// --- The following is arranged so that it is easy to understand
*/

void main () {
can_portinit (); // CAN port setting (P10, P11)

can_init () {
while (0! = (GSTSL & 0x08 )); // GRAMINIT (0x08) Wait until CAN RAM is cleared
GCTRLL & = 0xF8; // & = ~ GSLPR (0x04); & = ~ GMDC (0x03);
GCTRLL from global stop mode 0x01; // GRST (0x01) Transition to global reset mode
while (0 == (GSTSL & 0x01)); // GRSTSTS (0x01) Wait for transition to global reset mode

C0CTRLL & = 0xF8; // & = ~ CSLPR (0x04); & = ~ CHMDC (0x03) ; Transition from channel stop mode to channel reset mode
C0CTRLL | = 0x01; // CRST (0x01)
while (0 == (C0STSLL & 0x01)); // Transition to CRSTSTS (0x01) channel reset mode wait until
// ... (another communication speed setting)

Can_init_rule () {
GRWCRL = 0x00; // rULE (0x01) switches the CAN global RAM window 0 (rule)
GAFLIDL0 = 0x0000; // ZERO (0x0000) Specify comparison data
GAFLIDH0 = 0x0000; // ZERO (0x0000)
GAFLML0 = 0x0000; // NOCOMP (0x0000) Not compare ID bits
GAFLMH0 = 0x0000; // NOCOMP (0x0000)
GAFLPL0 = 0x0001; // GAFLFDP0 (0x0001) receive Store in FIFO0
GAFLPH0 = 0x0000; // GAFLPTR (0x0000) Do not check DLC, add 12-bit label
GWCRL = 0x01; // RPAGE (0x01);
} //...(Other
buffer settings)
GCTRLH = 0x02; // MEIE ( 0x02) Global error interrupts only allow FIFO message lost
C0CTRLH = 0xEE; // EWIE (0x02) | EPIE (0x04) | BOEIE (0x08) | BORIE (0x10) | OLIE (0x20) | BEIE (0x40 | ALIE (0x80);
// Enable all channel error interrupts except channel bus error
TMIECL = 0x0F; // ENABLE (0x0F) Enable all transmit buffer interrupts
C0CTRHL | = 0x01; // TAIE (0x01) Setting (abort allowed)
}

can_start () {
GCTRLL & = 0xFC; // ~ GMDC (0x03) Transition from global reset mode or global test mode to global operation mode
while ((GSTS & 0x07)! = 0); // GRSTSTS (0x01) | GHLTSTS (0x02) | GSLPSTS (0x04)
timer_getinfo (& can_time_start); // Wait for the timestamp to start here , Store the current time of the timer
C0CTRLL & = 0xFC; // ~ CHMDC (0x03) Transition from channel reset mode or channel standby mode to channel communication mode
while ((C0STSLL & 0x07)! = 0); // CRSTSTS (0x01 ) | CHLTSTS (0x02) | CSLPSTS (0x04) Wait for transition to channel communication mode
MK2H & = 0xFE; // ~ CAN0TRMMK (0x01) Enable CAN0 transmission interrupt
MK2L & = 0xDF; // ~ CAN0ERRMK (0x20) CAN0 error Enable interrupt
MK2H & = 0xF9; // ~ (CANGRFRMK (0x02) | CANGERRMK (0x04)) Enable CAN global receive FIFO interrupt and CAN global error interrupt
RFCC0 | = 0x0001; // RFE (0x01) Receive FIFO buffer enable
}

Can_tx_enque () {
// ... // prepare CAN transmission message
can_tx_deque ();
}

can_tx_deque () {
MK2H | = 0x01; // Mask CAN0TRMMK (0x01) CAN0 transmission interrupt

full = 0;
while ((0! = can_tx_num) && (4! = full)) {// Transmission buffer If
full = 0; // initialize full counter

for (slot = 0; slot <4; slot ++) {// check transmission slots in order
if (NULL == can_tx_ptr [slot]) {// NULL If so, the transmission slot is empty
can_tx_req (slot); // Transmission request
can_tx_next (); // Move the transmission buffer to the next
slot = 4; // This frame could be transmitted, so the for loop ends
} else {
full ++; // increment full counter because it is in use
}
}
}
MK2H & = 0xFE; // ~ CAN0TRMMK (0x01) Enable CAN0 transmission interrupt
}

can_tx_req (u1 slot) // Transmission request from transmission buffer
{// * Channel
U1 loop called in transmission interrupt mask state ; can_frame * ptr; u1 * dat;
volatile u2 * tmidl; volatile u1 * tmdf; volatile u1 * tmc;

//
volatile u1 * that does not work with or without the following 5 lines tmsts;
tmsts = & TMSTS0;
tmsts + = slot;
* tmsts & = 0xF9u; // ~ TMTRF transmission result flag clear
while (((* tmsts) & 0x06u)! = 0x00) {} // Check TMTRF (0x06) transmission status

ptr = can_tx_buffer [can_tx_readp]; // Get pointer to frame data from transmit buffer
can_tx_ptr [slot] = ptr; // Set link destination of transmit slot

tmidl = & TMIDL0; // Point to
TMIDL tmidl + = (slot * 8);
tmidl [0] = ptr-> id_l; // Set lower ID data
tmidl [1] = ptr-> id_h; // Set upper ID data
tmidl [3] = (u2) (ptr- > dlc << 12); // Set DLC (note that tmidl [3])
tmdf = (volatile u1 *) & tmidl [4]; // Point to TMDF

dat = & (ptr-> buf [0]); // Set transmit data (always set 8 bytes regardless of DLC)
for (loop = 0; loop <8; loop ++) {* tmdf ++ = * dat ++;}

tmc = & TMC0; // Point
tmc to TMC + = slot;
* tmc | = 0x01; // Set TMTR (0x01) bit
}
}

// vector.c // Whether bank is used or not, both seem to be OK
#pragma interrupt intcan0err_isr (vect = INTCAN0ERR) //, bank = RB1 )
#pragma interrupt intcan0trm_isr (vect = INTCAN0TRM) //, bank = RB1) // can_tx_isr ()
#pragma interrupt intcangrfr_isr (vect = INTCANGRFR) //, bank = RB1)
#pragma interrupt intcangerr_isr (vect, INTCANGERR // bank = RB1)

void can_tx_isr () {
u1 slot; u1 tmtrf; volatile u1 * tmsts;
tmsts = & TMSTS0; // Point to TMSTS0 register
for (slot = 0; slot <TX_SLOT_MAX; slot ++) {// TX_SLOT_MAX = 4;
Go around buffer tmtrf = (u1) (* tmsts & 0x06); // Get TMTRF (0x06) bit (transmitting or no transmission request bit)
if (0x00! = tmtrf) {// Check if there is completion information
* tmsts & = (u1) (~ TMTRF); // TMTRF (0x06) Drop the bit because there is completion information
can_tx_ptr [slot]-> sts = (u1) (tmtrf | TMTSTS);
// TMTSTS (0x01) Set sts of pointer linked to transmission slot
can_tx_ptr [slot] = NULL; // Release pointer linked to transmission slot

if (ABORTED == tmtrf) {// TMSTS_ABORTED (0x02)
can_count.abt_cnt ++; // count up
}
if (SENT == tmtrf) {// TMSTS_SENT (0x04)
can_count.tx_cnt [0] ++; // count up
if (0 == can_count.tx_cnt [0]) {can_count.tx_cnt [1] ++;}
}
if (SENTABORT == tmtrf) {// TMSTS_SENTABORT (0x06)
can_count.txabt_cnt ++; // Count up
}
}
tmsts ++; // Advance to next TMSTS register
}
can_tx_deque (); // Send next from transmission buffer
}