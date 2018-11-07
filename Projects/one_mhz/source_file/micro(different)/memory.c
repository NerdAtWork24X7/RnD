#include"types.h"
#include "memory.h"

/**
  Section: Flash Module APIs
*/

void DATAEE_WriteByte(uint8 bAdd, uint8 bData)
{
    uint8 GIEBitValue = 0;

    EEADRL = (bAdd & 0x0ff);    // Data Memory Address to write
    EEDATL = bData;             // Data Memory Value to write
    EEPGD_bit = 0;              // Point to DATA memory
    CFGS_bit = 0;               // Deselect Configuration space
    WREN_bit = 1;                   // Enable writes

    GIEBitValue = GIE_bit;
    GIE_bit = 0;     // Disable INTs
    EECON2 = 0x55;
    EECON2 = 0xAA;
    WR_bit = 1;      // Set WR bit to begin write
    // Wait for write to complete
    while (WR_bit)
    {
    }

    WREN_bit = 0;    // Disable writes
    GIE_bit = GIEBitValue;
}

uint8 DATAEE_ReadByte(uint8 bAdd)
{
    EEADRL = (bAdd & 0x0ff);    // Data Memory Address to read
    CFGS_bit = 0;    // Deselect Configuration space
    EEPGD_bit = 0;   // Point to DATA memory
    RD_bit = 1;      // EE Read
    NOP();           // NOPs may be required for latency at high frequencies
    NOP();

    return (EEDATL);
}
/**
 End of File
*/