#ifndef _MEMORY_H
#define _MEMORY_H

#include "types.h"
#define WRITE_FLASH_BLOCKSIZE    32
#define ERASE_FLASH_BLOCKSIZE    32
#define END_FLASH                4096


uint16 FLASH_ReadWord(uint16 flashAddr);

/**
  @Summary
    Writes a word into Flash

  @Description
    This routine writes the given word into mentioned Flash address

  @Preconditions
    None

  @Param
    flashAddr - Flash program memory location to which data has to be written
    *ramBuf   - Pointer to an array of size 'ERASE_FLASH_BLOCKSIZE' at least
    word      - Word to be written in Flash

  @Returns
    None

  @Example
    <code>
    uint16    writeData = 0x55AA;
    uint16    flashAddr = 0x01C0;
    uint16    Buf[ERASE_FLASH_BLOCKSIZE];

    FLASH_WriteWord(flashAddr, Buf, writeData);
    </code>
*/
void FLASH_WriteWord(uint16 flashAddr, uint16 *ramBuf, uint16 word);

/**
  @Summary
    Writes data to complete block of Flash

  @Description
    This routine writes data words to complete block in Flash program memory

  @Preconditions
    None

  @Param
    writeAddr         - A valid block starting address in Flash
    *flashWordArray   - Pointer to an array of size 'WRITE_FLASH_BLOCKSIZE' at least

  @Returns
    -1 if the given address is not a valid block starting address of Flash
    0  in case of valid block starting address

  @Example
    <code>
    #define FLASH_ROW_ADDRESS     0x01C0

    uint16 wrBlockData[] =
    {
        0x0000, 0x0001, 0x0002, 0x0003, 0x0004, 0x0005, 0x0006, 0x0007,
        0x0008, 0x0009, 0x000A, 0x000B, 0x000C, 0x000D, 0x000D, 0x000F,
        0x0010, 0x0011, 0x0012, 0x0013, 0x0014, 0x0015, 0x0016, 0x0017,
        0x0018, 0x0019, 0x001A, 0x001B, 0x001C, 0x001D, 0x001E, 0x001F
    }

    // write to Flash memory block
    FLASH_WriteBlock((uint16)FLASH_ROW_ADDRESS, (uint16*)wrBlockData);
    </code>
*/
int8 FLASH_WriteBlock(uint16 writeAddr, uint16 *flashWordArray);

/**
  @Summary
    Erases complete Flash program memory block

  @Description
    This routine erases complete Flash program memory block

  @Preconditions
    None

  @Param
    startAddr - A valid block starting address in Flash program memory

  @Returns
    None

  @Example
    <code>
    uint16    flashBlockStartAddr = 0x01C0;

    FLASH_EraseBlock(flashBlockStartAddr);
    </code>
*/
void FLASH_EraseBlock(uint16 startAddr);

/**
  Section: Data EEPROM Module APIs
*/

/**
  @Summary
    Writes a data byte to Data EEPROM

  @Description
    This routine writes a data byte to given Data EEPROM location

  @Preconditions
    None

  @Param
    bAdd  - Data EEPROM location to which data to be written
    bData - Data to be written to Data EEPROM location

  @Returns
    None

  @Example
    <code>
    uint8_t dataeeAddr = 0x10;
    uint8_t dataeeData = 0x55;

    DATAEE_WriteByte(dataeeAddr, dataeeData);
    </code>
*/
void DATAEE_WriteByte(uint8 bAdd, uint8 bData);

/**
  @Summary
    Reads a data byte from Data EEPROM

  @Description
    This routine reads a data byte from given Data EEPROM location

  @Preconditions
    None

  @Param
    bAdd  - Data EEPROM location from which data has to be read

  @Returns
    Data byte read from given Data EEPROM location

  @Example
    <code>
    uint8 dataeeAddr = 0x10;
    uint8 readData;

    readData = DATAEE_ReadByte(dataeeAddr);
    </code>
*/
uint8 DATAEE_ReadByte(uint8 bAdd);


#endif // _MEMORY_H
/**
 End of File
*/