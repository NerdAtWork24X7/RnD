#include "memory.h"
#include"types.h"

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


/*
void Check_Demo()
{
    uint8 udemo,ldemo;
    
    WDTCON = 0x16;
    if(PORTC.RC5==0)
     {
       DATAEE_WriteByte(DEMO_ADDR,0xFF);
       DATAEE_WriteByte(DEMO_ADDR+1,0xFF);
       while(1);
     }
    udemo=DATAEE_ReadByte(DEMO_ADDR);
    ldemo=DATAEE_ReadByte(DEMO_ADDR+1);
    Demo=(((udemo<<8)&0xFF00)|ldemo);

    if(Demo==0xFFFF)
    {
        Demo=0;
    }
    if(Demo>800) { while(1); }
    else 
    {
        Demo++;
        ldemo = (uint8)(Demo & 0x00FF);
        udemo = (uint8)(((Demo>>8)&0x00FF));
        
        DATAEE_WriteByte(DEMO_ADDR,udemo);
        DATAEE_WriteByte((DEMO_ADDR+1),ldemo);
    }   
}      */
/**
 End of File
*/