#ifndef KEYPAD_H
#define KEYPAD_H

#include "types.h"
extern bit colscan(void);
extern void init_rows(void);
extern void init_cols(void);
extern u8 keyscan(void);
extern u8* get_value();
extern u8 get_disp();
extern u8* get_time();

#endif
