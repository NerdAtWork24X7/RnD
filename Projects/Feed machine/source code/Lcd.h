#ifndef LCD_H
#define LCD_H
   #include"types.h"
   extern void Init_disp();
   extern void Display_Time();
   extern void Transform_Time();
   extern void init_lcd();
   extern void menu_fnc();
   extern void config_Time(u8,u8);
   extern void Constant_to_temp(const u8* source);
#endif