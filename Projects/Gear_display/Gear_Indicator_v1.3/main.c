#include <types.h>


#define RESET_BIT 0
#define CLOCK_BIT 1
#define NEUTRAL_BIT RC2_bit
#define UP_BIT RC3_bit
#define DOWN_BIT RC4_bit
#define DEBOUNCE_TIME 50
#define LOCK_TIME 250
#define TOP_GEAR 5

uint8_t Gear;

void ShowDigit(uint8_t Digit)
{
    uint8_t i;
    
    PORTC |= (1 << RESET_BIT);       // RESET pin high
    PORTC &= ~(1 << RESET_BIT);      // RESET pin low
        
    for (i = 0; i < Digit; i++) 
    {
        PORTC |= (1 << CLOCK_BIT);   // CLOCK pin high
        PORTC &= ~(1 << CLOCK_BIT);  // CLOCK pin low
    }
}

void Init()
{
    uint8_t i;
    ANSEL=0x00;
    TRISC = 0xFC;
    
    PORTC &= ~(1 << RESET_BIT);  // RESET pin low
        
        // Self test effect
        
        ShowDigit(0);
        delay_ms(500);
        
        for (i = 1; i < 10; i++)
        {
            ShowDigit(i);
                delay_ms(100);
        }
        
        ShowDigit(0);
        delay_ms(500);

    Gear = EEPROM_Read(0);  // Read initial value from EEPROM
        ShowDigit(Gear);                       // Show initial value
}

int Released(uint8_t Bit)
{
    if (Bit==1)
        {
            delay_ms(DEBOUNCE_TIME);
            return 1;
        }
        
        return 0;
}

int main(void)
{
    Init();
        
    while(1)
     {
       if (Released(NEUTRAL_BIT)) Gear = 0;
       if (Released(UP_BIT))
         {
            if ((Gear > 0) && (Gear < TOP_GEAR)) Gear++;
              if (Gear == 0) Gear = 2;
                if (NEUTRAL_BIT==1) Gear = 0;
         }
                
        if (Released(DOWN_BIT))
          {
            if (Gear > 1) Gear--;
            if (Gear == 0) Gear = 1;
            if (NEUTRAL_BIT==1) Gear = 0;
          }

        ShowDigit(Gear);
        EEPROM_Write(0,Gear);
        delay_ms(LOCK_TIME);
    }
} 