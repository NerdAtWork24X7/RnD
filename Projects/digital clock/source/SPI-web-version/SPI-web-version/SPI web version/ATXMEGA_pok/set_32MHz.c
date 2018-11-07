/*
 * set_32MHz.c
 *
 * Created: 18.12.2015 17:38:50
 *  Author: Ondrej Blazek
 */ 

#include <avr/io.h>



void set_32MHz_function()
{
	  // enable 32Mhz internal oscillator
	  OSC.CTRL|=OSC_RC32MEN_bm;
	  // wait for it to be stable
	  while (!(OSC.STATUS & OSC_RC32MRDY_bm));
	  // tell the processor we want to change a protected register
	  CCP=CCP_IOREG_gc;
	  // and start using the 32Mhz oscillator
	  CLK.CTRL=CLK_SCLKSEL_RC32M_gc;
	  // disable the default 2Mhz oscillator
	  OSC.CTRL&=(~OSC_RC2MEN_bm);
	  // enable 32kHz calibrated internal oscillator
	  OSC.CTRL|= OSC_RC32KEN_bm;
	  while (!(OSC.STATUS & OSC_RC32KRDY_bm));
	  // set bit to 0 to indicate we use the internal 32kHz
	  // callibrated oscillator as auto-calibration source
	  // for our 32Mhz oscillator
	  OSC.DFLLCTRL &= ~OSC_RC32MCREF_bm;
	  // enable auto-calibration for the 32Mhz oscillator
	  DFLLRC32M.CTRL |= DFLL_ENABLE_bm;
	  
}