/////////////////////////////////////////////////////////////////////////
////                          graphics.c                             ////
////                                                                 ////
////   This file contains functions to draw lines, rectangles, bars, ////
////   circles and text to a display. A function which draws a       ////
////   single pixel must be defined before calling the functions in  ////
////   this file. Call it glcd_pixel(x, y, color) where x is the     ////
////   horizontal coordinate, y is the vertical coordinate, and      ////
////   color is 1 bit to turn the pixel on or off.                   ////
////                                                                 ////
////   * Note: (0, 0) is treated as the upper left corner            ////
////                                                                 ////
/////////////////////////////////////////////////////////////////////////
////                                                                 ////
////  glcd_line(x1, y1, x2, y2, color)                               ////
////     * Draws a line from the first point to the second point     ////
////       with the given color                                      ////
////       - color can be ON or OFF                                  ////
////                                                                 ////
////  glcd_rect(x1, y1, x2, y2, fill, color)                         ////
////     * Draws a rectangle with one corner at point (x1,y1) and    ////
////       the other corner at point (x2,y2)                         ////
////       - fill can be YES or NO                                   ////
////       - color can be ON or OFF                                  ////
////                                                                 ////
////  glcd_bar(x1, y1, x2, y2, width, color)                         ////
////     * Draws a bar (wide line) from the first point to the       ////
////       second point                                              ////
////       - width is the number of pixels wide                      ////
////       - color is ON or OFF                                      ////
////                                                                 ////
////  glcd_circle(x, y, radius, fill, color)                         ////
////     * Draws a circle with center at (x,y)                       ////
////       - fill can be YES or NO                                   ////
////       - color can be ON or OFF                                  ////
////                                                                 ////
////  glcd_text57(x, y, textptr, size, color)                        ////
////     * Write the null terminated text pointed to by textptr with ////
////       the upper left coordinate of the first character at (x,y) ////
////       Characters are 5 pixels wide and 7 pixels tall            ////
////       - size is an integer that scales the size of the text     ////
////       - color is ON or OFF                                      ////
////     * Note - This function wraps characters to the next line    ////
////              use #define GLCD_WIDTH to specify a display width  ////
////                                                                 ////
/////////////////////////////////////////////////////////////////////////
////        (C) Copyright 1996, 2004 Custom Computer Services        ////
//// This source code may only be used by licensed users of the CCS  ////
//// C compiler.  This source code may only be distributed to other  ////
//// licensed users of the CCS C compiler.  No other use,            ////
//// reproduction or distribution is permitted without written       ////
//// permission.  Derivative programs created using this software    ////
//// in object code form are not restricted in any way.              ////
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
#ifndef GRAPHICS_DRAWING_FUNCTIONS
#define GRAPHICS_DRAWING_FUNCTIONS
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
#ifndef ON
#define ON  1
#endif

#ifndef OFF
#define OFF 0
#endif

#ifndef YES
#define YES 1
#endif

#ifndef NO
#define NO  0
#endif
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
//// Defines a 8x8 font
/////////////////////////////////////////////////////////////////////////
/*const int8 FONT[88][8] ={
0,   0,   0,   0,   0,   0,   0,   0,
126, 129, 149, 177, 177, 149, 129, 126,
126, 255, 235, 207, 207, 235, 255, 126,
 14,  31,  63, 126,  63,  31,  14,   0,
  8,  28,  62, 127,  62,  28,   8,   0,
 24, 186, 255, 255, 255, 186,  24,   0,
 16, 184, 252, 255, 252, 184,  16,   0,
  0,   0,  24,  60,  60,  24,   0,   0,
255, 255, 231, 195, 195, 231, 255, 255,
  0,  60, 102,  66,  66, 102,  60,   0,
255, 195, 153, 189, 189, 153, 195, 255,
112, 248, 136, 136, 253, 127,   7,  15,
  0,  78,  95, 241, 241,  95,  78,   0,
192, 224, 255, 127,   5,   5,   7,   7,
192, 255, 127,   5,   5, 101, 127,  63,
153,  90,  60, 231, 231,  60,  90, 153,
127,  62,  62,  28,  28,   8,   8,   0,
  8,   8,  28,  28,  62,  62, 127,   0,
  0,  36, 102, 255, 255, 102,  36,   0,
  0,  95,  95,   0,   0,  95,  95,   0,
  6,  15,   9, 127, 127,   1, 127, 127,
 64, 218, 191, 165, 253,  89,   3,   2,
  0, 112, 112, 112, 112, 112, 112,   0,
128, 148, 182, 255, 255, 182, 148, 128,
  0,   4,   6, 127, 127,   6,   4,   0,
  0,  16,  48, 127, 127,  48,  16,   0,
  8,   8,   8,  42,  62,  28,   8,   0,
  8,  28,  62,  42,   8,   8,   8,   0,
 60,  60,  32,  32,  32,  32,  32,   0,
  8,  28,  62,   8,   8,  62,  28,   8,
 48,  56,  60,  62,  62,  60,  56,  48,
  6,  14,  30,  62,  62,  30,  14,   6,
  0,   0,   0,   0,   0,   0,   0,   0,
  0,   6,  95,  95,   6,   0,   0,   0,
  0,   7,   7,   0,   7,   7,   0,   0,
 20, 127, 127,  20, 127, 127,  20,   0,
 36,  46, 107, 107,  58,  18,   0,   0,
 70, 102,  48,  24,  12, 102,  98,   0,
 48, 122,  79,  93,  55, 122,  72,   0,
  4,   7,   3,   0,   0,   0,   0,   0,
  0,  28,  62,  99,  65,   0,   0,   0,
  0,  65,  99,  62,  28,   0,   0,   0,
  8,  42,  62,  28,  28,  62,  42,   8,
  8,   8,  62,  62,   8,   8,   0,   0,
  0, 128, 224,  96,   0,   0,   0,   0,
  8,   8,   8,   8,   8,   8,   0,   0,
  0,   0,  96,  96,   0,   0,   0,   0,
 96,  48,  24,  12,   6,   3,   1,   0,
 62, 127, 113,  89,  77, 127,  62,   0,
 64,  66, 127, 127,  64,  64,   0,   0,
 98, 115,  89,  73, 111, 102,   0,   0,
 34,  99,  73,  73, 127,  54,   0,   0,
 24,  28,  22,  83, 127, 127,  80,   0,
 39, 103,  69,  69, 125,  57,   0,   0,
 60, 126,  75,  73, 121,  48,   0,   0,
  3,   3, 113, 121,  15,   7,   0,   0,
 54, 127,  73,  73, 127,  54,   0,   0,
  6,  79,  73, 105,  63,  30,   0,   0,
  0,   0, 102, 102,   0,   0,   0,   0,
  0, 128, 230, 102,   0,   0,   0,   0,
  8,  28,  54,  99,  65,   0,   0,   0,
 36,  36,  36,  36,  36,  36,   0,   0,
  0,  65,  99,  54,  28,   8,   0,   0,
  2,   3,  81,  89,  15,   6,   0,   0,
 62, 127,  65,  93,  93,  31,  30,   0,
124, 126,  19,  19, 126, 124,   0,   0,
 65, 127, 127,  73,  73, 127,  54,   0,
 28,  62,  99,  65,  65,  99,  34,   0,
 65, 127, 127,  65,  99,  62,  28,   0,
 65, 127, 127,  73,  93,  65,  99,   0,
 65, 127, 127,  73,  29,   1,   3,   0,
 28,  62,  99,  65,  81, 115, 114,   0,
127, 127,   8,   8, 127, 127,   0,   0,
  0,  65, 127, 127,  65,   0,   0,   0,
 48, 112,  64,  65, 127,  63,   1,   0,
 65, 127, 127,   8,  28, 119,  99,   0,
 65, 127, 127,  65,  64,  96, 112,   0,
127, 127,  14,  28,  14, 127, 127,   0,
127, 127,   6,  12,  24, 127, 127,   0,
 28,  62,  99,  65,  99,  62,  28,   0,
 65, 127, 127,  73,   9,  15,   6,   0,
 30,  63,  33, 113, 127,  94,   0,   0,
 65, 127, 127,   9,  25, 127, 102,   0,
 38, 111,  77,  89, 115,  50,   0,   0,
  3,  65, 127, 127,  65,   3,   0,   0,
127, 127,  64,  64, 127, 127,   0,   0,
 31,  63,  96,  96,  63,  31,   0,   0,
127, 127,  48,  24,  48, 127, 127,   0,
 67, 103,  60,  24,  60, 103,  67,   0,
  7,  79, 120, 120,  79,   7,   0,   0,
 71,  99, 113,  89,  77, 103, 115,   0,
  0, 127, 127,  65,  65,   0,   0,   0,
  1,   3,   6,  12,  24,  48,  96,   0,
  0,  65,  65, 127, 127,   0,   0,   0,
  8,  12,   6,   3,   6,  12,   8,   0,
128, 128, 128, 128, 128, 128, 128, 128,
  0,   0,   3,   7,   4,   0,   0,   0,
 32, 116,  84,  84,  60, 120,  64,   0,
 65, 127,  63,  72,  72, 120,  48,   0,
 56, 124,  68,  68, 108,  40,   0,   0,
 48, 120,  72,  73,  63, 127,  64,   0,
 56, 124,  84,  84,  92,  24,   0,   0,
 72, 126, 127,  73,   3,   2,   0,   0,
152, 188, 164, 164, 248, 124,   4,   0,
 65, 127, 127,   8,   4, 124, 120,   0,
  0,  68, 125, 125,  64,   0,   0,   0,
 96, 224, 128, 128, 253, 125,   0,   0,
 65, 127, 127,  16,  56, 108,  68,   0,
  0,  65, 127, 127,  64,   0,   0,   0,
124, 124,  24,  56,  28, 124, 120,   0,
124, 124,   4,   4, 124, 120,   0,   0,
 56, 124,  68,  68, 124,  56,   0,   0,
132, 252, 248, 164,  36,  60,  24,   0,
 24,  60,  36, 164, 248, 252, 132,   0,
 68, 124, 120,  76,   4,  28,  24,   0,
 72,  92,  84,  84, 116,  36,   0,   0,
  0,   4,  62, 127,  68,  36,   0,   0,
 60, 124,  64,  64,  60, 124,  64,   0,
 28,  60,  96,  96,  60,  28,   0,   0,
 60, 124, 112,  56, 112, 124,  60,   0,
 68, 108,  56,  16,  56, 108,  68,   0,
156, 188, 160, 160, 252, 124,   0,   0,
 76, 100, 116,  92,  76, 100,   0,   0,
  8,   8,  62, 119,  65,  65,   0,   0,
  0,   0,   0, 119, 119,   0,   0,   0,
 65,  65, 119,  62,   8,   8,   0,   0,
  2,   3,   1,   3,   2,   3,   1,   0,
112, 120,  76,  70,  76, 120, 112,   0,
 14, 159, 145, 177, 251,  74,   0,   0,
 58, 122,  64,  64, 122, 122,  64,   0,
 56, 124,  84,  85,  93,  25,   0,   0,
  2,  35, 117,  85,  85, 125, 123,  66,
 33, 117,  84,  84, 125, 121,  64,   0,
 33, 117,  85,  84, 124, 120,  64,   0,
 32, 116,  87,  87, 124, 120,  64,   0,
 24,  60, 164, 164, 228,  64,   0,   0,
  2,  59, 125,  85,  85,  93,  27,   2,
 57, 125,  84,  84,  93,  25,   0,   0,
 57, 125,  85,  84,  92,  24,   0,   0,
  1,  69, 124, 124,  65,   1,   0,   0,
  2,   3,  69, 125, 125,  67,   2,   0,
  1,  69, 125, 124,  64,   0,   0,   0,
121, 125,  22,  18,  22, 125, 121,   0,
112, 120,  43,  43, 120, 112,   0,   0,
 68, 124, 124,  85,  85,  69,   0,   0,
 32, 116,  84,  84, 124, 124,  84,  84,
124, 126,  11,   9, 127, 127,  73,   0,
 50, 123,  73,  73, 123,  50,   0,   0,
 50, 122,  72,  72, 122,  50,   0,   0,
 50, 122,  74,  72, 120,  48,   0,   0,
 58, 123,  65,  65, 123, 122,  64,   0,
 58, 122,  66,  64, 120, 120,  64,   0,
154, 186, 160, 160, 250, 122,   0,   0,
  1,  25,  60, 102, 102,  60,  25,   1,
 61, 125,  64,  64, 125,  61,   0,   0,
 24,  60,  36, 231, 231,  36,  36,   0,
104, 126, 127,  73,  67, 102,  32,   0,
 43,  47, 252, 252,  47,  43,   0,   0,
255, 255,   9,   9,  47, 246, 248, 160,
 64, 192, 136, 254, 127,   9,   3,   2,
 32, 116,  84,  85, 125, 121,  64,   0,
  0,  68, 125, 125,  65,   0,   0,   0,
 48, 120,  72,  74, 122,  50,   0,   0,
 56, 120,  64,  66, 122, 122,  64,   0,
122, 122,  10,  10, 122, 112,   0,   0,
125, 125,  25,  49, 125, 125,   0,   0,
  0,  38,  47,  41,  47,  47,  40,   0,
  0,  38,  47,  41,  47,  38,   0,   0,
 48, 120,  77,  69,  96,  32,   0,   0,
 56,  56,   8,   8,   8,   8,   0,   0,
  8,   8,   8,   8,  56,  56,   0,   0,
 79, 111,  48,  24, 204, 238, 187, 145,
 79, 111,  48,  24, 108, 118, 251, 249,
  0,   0,   0, 123, 123,   0,   0,   0,
  8,  28,  54,  34,   8,  28,  54,  34,
 34,  54,  28,   8,  34,  54,  28,   8,
170,   0,  85,   0, 170,   0,  85,   0,
170,  85, 170,  85, 170,  85, 170,  85,
221, 255, 170, 119, 221, 170, 255, 119,
  0,   0,   0, 255, 255,   0,   0,   0,
 16,  16,  16, 255, 255,   0,   0,   0,
 20,  20,  20, 255, 255,   0,   0,   0,
 16,  16, 255, 255,   0, 255, 255,   0,
 16,  16, 240, 240,  16, 240, 240,   0,
 20,  20,  20, 252, 252,   0,   0,   0,
 20,  20, 247, 247,   0, 255, 255,   0,
  0,   0, 255, 255,   0, 255, 255,   0,
 20,  20, 244, 244,   4, 252, 252,   0,
 20,  20,  23,  23,  16,  31,  31,   0,
 16,  16,  31,  31,  16,  31,  31,   0,
 20,  20,  20,  31,  31,   0,   0,   0,
 16,  16,  16, 240, 240,   0,   0,   0,
  0,   0,   0,  31,  31,  16,  16,  16,
 16,  16,  16,  31,  31,  16,  16,  16,
 16,  16,  16, 240, 240,  16,  16,  16,
  0,   0,   0, 255, 255,  16,  16,  16,
 16,  16,  16,  16,  16,  16,  16,  16,
 16,  16,  16, 255, 255,  16,  16,  16,
  0,   0,   0, 255, 255,  20,  20,  20,
  0,   0, 255, 255,   0, 255, 255,  16,
  0,   0,  31,  31,  16,  23,  23,  20,
  0,   0, 252, 252,   4, 244, 244,  20,
 20,  20,  23,  23,  16,  23,  23,  20,
 20,  20, 244, 244,   4, 244, 244,  20,
  0,   0, 255, 255,   0, 247, 247,  20,
 20,  20,  20,  20,  20,  20,  20,  20,
 20,  20, 247, 247,   0, 247, 247,  20,
 20,  20,  20,  23,  23,  20,  20,  20,
 16,  16,  31,  31,  16,  31,  31,  16,
 20,  20,  20, 244, 244,  20,  20,  20,
 16,  16, 240, 240,  16, 240, 240,  16,
  0,   0,  31,  31,  16,  31,  31,  16,
  0,   0,   0,  31,  31,  20,  20,  20,
  0,   0,   0, 252, 252,  20,  20,  20,
  0,   0, 240, 240,  16, 240, 240,  16,
 16,  16, 255, 255,  16, 255, 255,  16,
 20,  20,  20, 255, 255,  20,  20,  20,
 16,  16,  16,  31,  31,   0,   0,   0,
  0,   0,   0, 240, 240,  16,  16,  16,
255, 255, 255, 255, 255, 255, 255, 255,
240, 240, 240, 240, 240, 240, 240, 240,
255, 255, 255, 255,   0,   0,   0,   0,
  0,   0,   0,   0, 255, 255, 255, 255,
 15,  15,  15,  15,  15,  15,  15,  15,
 56, 124,  68, 108,  56, 108,  68,   0,
252, 254,  42,  42,  62,  20,   0,   0,
126, 126,   2,   2,   6,   6,   0,   0,
  2, 126, 126,   2, 126, 126,   2,   0,
 99, 119,  93,  73,  99,  99,   0,   0,
 56, 124,  68, 124,  60,   4,   4,   0,
128, 254, 126,  32,  32,  62,  30,   0,
  4,   6,   2, 126, 124,   6,   2,   0,
153, 189, 231, 231, 189, 153,   0,   0,
 28,  62, 107,  73, 107,  62,  28,   0,
 76, 126, 115,   1, 115, 126,  76,   0,
 48, 120,  74,  79, 125,  57,   0,   0,
 24,  60,  36,  60,  60,  36,  60,  24,
152, 252, 100,  60,  62,  39,  61,  24,
 28,  62, 107,  73,  73,   0,   0,   0,
126, 127,   1,   1, 127, 126,   0,   0,
 42,  42,  42,  42,  42,  42,   0,   0,
 68,  68,  95,  95,  68,  68,   0,   0,
 64,  81,  91,  78,  68,  64,   0,   0,
 64,  68,  78,  91,  81,  64,   0,   0,
  0,   0,   0, 254, 255,   1,   7,   6,
 96, 224, 128, 255, 127,   0,   0,   0,
  8,   8, 107, 107,   8,   8,   0,   0,
 36,  54,  18,  54,  36,  54,  18,   0,
  0,   6,  15,   9,  15,   6,   0,   0,
  0,   0,   0,  24,  24,   0,   0,   0,
  0,   0,   0,  16,  16,   0,   0,   0,
 16,  48, 112, 192, 255, 255,   1,   1,
  0,  31,  31,   1,  31,  30,   0,   0,
  0,  25,  29,  23,  18,   0,   0,   0,
  0,   0,  60,  60,  60,  60,   0,   0,
  0,   0,   0,   0,   0,   0,   0,   0
                         
                         
                         

const int8 FONT2[44][5]={
                        0x60,0x4E,0x49,0x4B,0x33         //S
                    0x43,0x71,0x4F,0x1,0x3
                         0x3F, 0x40, 0x40, 0x40, 0x3F, // U
                         0x1F, 0x20, 0x40, 0x20, 0x1F, // V
                         0x7F, 0x20, 0x10, 0x20, 0x7F, // W
                         0x41, 0x22, 0x1C, 0x22, 0x41, // X
                        0x41,0x77,0x48,0x7,0x1     //Y
                         0x61, 0x51, 0x49, 0x45, 0x43, // Z
                         0x00, 0x7F, 0x41, 0x00, 0x00, // [
                         0x02, 0x04, 0x08, 0x10, 0x20, // \
                         0x00, 0x00, 0x41, 0x7F, 0x00, // ]
                         0x04, 0x02, 0x01, 0x02, 0x04, // ^
                         0x40, 0x40, 0x40, 0x40, 0x40, // _
                         0x00, 0x01, 0x02, 0x04, 0x00, // `
                         0x20, 0x54, 0x54, 0x54, 0x78, // a
                         0x7F, 0x44, 0x44, 0x44, 0x38, // b
                         0x38, 0x44, 0x44, 0x44, 0x44, // c
                         0x38, 0x44, 0x44, 0x44, 0x7F, // d
                         0x38, 0x54, 0x54, 0x54, 0x18, // e
                         0x04, 0x04, 0x7E, 0x05, 0x05, // f
                         0x08, 0x54, 0x54, 0x54, 0x3C, // g
                         0x7F, 0x08, 0x04, 0x04, 0x78, // h
                         0x00, 0x44, 0x7D, 0x40, 0x00, // i
                         0x20, 0x40, 0x44, 0x3D, 0x00, // j
                         0x7F, 0x10, 0x28, 0x44, 0x00, // k
                         0x00, 0x41, 0x7F, 0x40, 0x00, // l
                         0x7C, 0x04, 0x78, 0x04, 0x78, // m
                         0x7C, 0x08, 0x04, 0x04, 0x78, // n
                         0x38, 0x44, 0x44, 0x44, 0x38, // o
                         0x7C, 0x14, 0x14, 0x14, 0x08, // p
                         0x08, 0x14, 0x14, 0x14, 0x7C, // q
                         0x00, 0x7C, 0x08, 0x04, 0x04, // r
                         0x48, 0x54, 0x54, 0x54, 0x20, // s
                         0x04, 0x04, 0x3F, 0x44, 0x44, // t
                         0x3C, 0x40, 0x40, 0x20, 0x7C, // u
                         0x1C, 0x20, 0x40, 0x20, 0x1C, // v
                         0x3C, 0x40, 0x30, 0x40, 0x3C, // w
                         0x44, 0x28, 0x10, 0x28, 0x44, // x
                         0x0C, 0x50, 0x50, 0x50, 0x3C, // y
                         0x44, 0x64, 0x54, 0x4C, 0x44, // z
                         0x00, 0x08, 0x36, 0x41, 0x41, // {
                         0x00, 0x00, 0x7F, 0x00, 0x00, // |
                         0x41, 0x41, 0x36, 0x08, 0x00, // }
                         0x02, 0x01, 0x02, 0x04, 0x02};// ~         */
/////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////
// Purpose:       Draw a line on a graphic LCD using Bresenham's
//                line drawing algorithm
// Inputs:        (x1, y1) - the start coordinate
//                (x2, y2) - the end coordinate
//                color - ON or OFF
// Dependencies:  glcd_pixel()
/////////////////////////////////////////////////////////////////////////
#ifdef LARGE_LCD
void glcd_line(int16 x1, int16 y1, int16 x2, int16 y2, int1 color)
#else
void glcd_line(int8 x1, int8 y1, int8 x2, int8 y2, int1 color)
#endif
{
   int16        dy, dx;
   signed int8  addx=1, addy=1;
   signed int16 P, diff;

   #ifdef LARGE_LCD
   int16 i=0;
   dx = abs((signed int16)(x2 - x1));
   dy = abs((signed int16)(y2 - y1));
   #else
   int8 i=0;
   dx = abs((signed int8)(x2 - x1));
   dy = abs((signed int8)(y2 - y1));
   #endif

   if(x1 > x2)
      addx = -1;
   if(y1 > y2)
      addy = -1;

   if(dx >= dy)
   {
      dy *= 2;
      P = dy - dx;
      diff = P - dx;

      for(; i<=dx; ++i)
      {
         glcd_pixel(x1, y1, color);

         if(P < 0)
         {
            P  += dy;
            x1 += addx;
         }
         else
         {
            P  += diff;
            x1 += addx;
            y1 += addy;
         }
      }
   }
   else
   {
      dx *= 2;
      P = dx - dy;
      diff = P - dy;

      for(; i<=dy; ++i)
      {
         glcd_pixel(x1, y1, color);

         if(P < 0)
         {
            P  += dx;
            y1 += addy;
         }
         else
         {
            P  += diff;
            x1 += addx;
            y1 += addy;
         }
      }
   }
}


/////////////////////////////////////////////////////////////////////////
// Purpose:       Draw a rectangle on a graphic LCD
// Inputs:        (x1, y1) - the start coordinate
//                (x2, y2) - the end coordinate
//                fill  - YES or NO
//                color - ON or OFF
// Dependencies:  glcd_pixel(), glcd_line()
/////////////////////////////////////////////////////////////////////////
#ifdef LARGE_LCD
void glcd_rect(int16 x1, int16 y1, int16 x2, int16 y2, int1 fill, int1 color)
#else
void glcd_rect(int8 x1, int8 y1, int8 x2, int8 y2, int1 fill, int1 color)
#endif
{
   if(fill)
   {
      #ifdef LARGE_LCD
      int16 i, xmin, xmax, ymin, ymax;
      #else
      int8  i, xmin, xmax, ymin, ymax;
      #endif

      if(x1 < x2)                            //  Find x min and max
      {
         xmin = x1;
         xmax = x2;
      }
      else
      {
         xmin = x2;
         xmax = x1;
      }

      if(y1 < y2)                            // Find the y min and max
      {
         ymin = y1;
         ymax = y2;
      }
      else
      {
         ymin = y2;
         ymax = y1;
      }

      for(; xmin <= xmax; ++xmin)
      {
         for(i=ymin; i<=ymax; ++i)
         {
            glcd_pixel(xmin, i, color);
         }
      }
   }
   else
   {
      glcd_line(x1, y1, x2, y1, color);      // Draw the 4 sides
      glcd_line(x1, y2, x2, y2, color);
      glcd_line(x1, y1, x1, y2, color);
      glcd_line(x2, y1, x2, y2, color);
   }
}

/////////////////////////////////////////////////////////////////////////
// Purpose:       Draw a bar (wide line) on a graphic LCD
// Inputs:        (x1, y1) - the start coordinate
//                (x2, y2) - the end coordinate
//                width  - The number of pixels wide
//                color - ON or OFF
/////////////////////////////////////////////////////////////////////////
#ifdef LARGE_LCD
void glcd_bar(int16 x1, int16 y1, int16 x2, int16 y2, int8 width, int1 color)
#else
void glcd_bar(int8 x1, int8 y1, int8 x2, int8 y2, int8 width, int1 color)
#endif
{
   int8         half_width;
   signed int16 dy, dx;
   signed int8  addx=1, addy=1, j;
   signed int16 P, diff, c1, c2;

   #ifdef LARGE_LCD
   int16 i=0;
   dx = abs((signed int16)(x2 - x1));
   dy = abs((signed int16)(y2 - y1));
   #else
   int8 i=0;
   dx = abs((signed int8)(x2 - x1));
   dy = abs((signed int8)(y2 - y1));
   #endif

   half_width = width/2;
   c1 = -(dx*x1 + dy*y1);
   c2 = -(dx*x2 + dy*y2);

   if(x1 > x2)
   {
      signed int16 temp;
      temp = c1;
      c1 = c2;
      c2 = temp;
      addx = -1;
   }
   if(y1 > y2)
   {
      signed int16 temp;
      temp = c1;
      c1 = c2;
      c2 = temp;
      addy = -1;
   }

   if(dx >= dy)
   {
      P = 2*dy - dx;
      diff = P - dx;

      for(i=0; i<=dx; ++i)
      {
         for(j=-half_width; j<half_width+width%2; ++j)
         {
            #ifdef LARGE_LCD
            int16 temp;
            #else
            int8 temp;
            #endif

            temp = dx*x1+dy*(y1+j);    // Use more RAM to increase speed
            if(temp+c1 >= 0 && temp+c2 <=0)
               glcd_pixel(x1, y1+j, color);
         }
         if(P < 0)
         {
            P  += 2*dy;
            x1 += addx;
         }
         else
         {
            P  += diff;
            x1 += addx;
            y1 += addy;
         }
      }
   }
   else
   {
      P = 2*dx - dy;
      diff = P - dy;

      for(i=0; i<=dy; ++i)
      {
         if(P < 0)
         {
            P  += 2*dx;
            y1 += addy;
         }
         else
         {
            P  += diff;
            x1 += addx;
            y1 += addy;
         }
         for(j=-half_width; j<half_width+width%2; ++j)
         {
            #ifdef LARGE_LCD
            int16 temp;
            #else
            int8 temp;
            #endif

            temp = dx*x1+dy*(y1+j);    // Use more RAM to increase speed
            if(temp+c1 >= 0 && temp+c2 <=0)
               glcd_pixel(x1+j, y1, color);
         }
      }
   }
}


/////////////////////////////////////////////////////////////////////////
// Purpose:       Draw a circle on a graphic LCD
// Inputs:        (x,y) - the center of the circle
//                radius - the radius of the circle
//                fill - YES or NO
//                color - ON or OFF
/////////////////////////////////////////////////////////////////////////
#ifdef LARGE_LCD
void glcd_circle(int16 x, int16 y, int16 radius, int1 fill, int1 color)
#else
void glcd_circle(int8 x, int8 y, int8 radius, int1 fill, int1 color)
#endif
{
   #ifdef LARGE_LCD
   signed int16 a, b, P;
   #else
   signed int8  a, b, P;
   #endif

   a = 0;
   b = radius;
   P = 1 - radius;

   do
   {
      if(fill)
      {
         glcd_line(x-a, y+b, x+a, y+b, color);
         glcd_line(x-a, y-b, x+a, y-b, color);
         glcd_line(x-b, y+a, x+b, y+a, color);
         glcd_line(x-b, y-a, x+b, y-a, color);
      }
      else
      {
         glcd_pixel(a+x, b+y, color);
         glcd_pixel(b+x, a+y, color);
         glcd_pixel(x-a, b+y, color);
         glcd_pixel(x-b, a+y, color);
         glcd_pixel(b+x, y-a, color);
         glcd_pixel(a+x, y-b, color);
         glcd_pixel(x-a, y-b, color);
         glcd_pixel(x-b, y-a, color);
      }

      if(P < 0)
         P += 3 + 2 * a++;
      else
         P += 5 + 2 * (a++ - b--);
    } while(a <= b);
}


/////////////////////////////////////////////////////////////////////////
// Purpose:       Write text on a graphic LCD
// Inputs:        (x,y) - The upper left coordinate of the first letter
//                textptr - A pointer to an array of text to display
//                size - The size of the text: 1 = 5x7, 2 = 10x14, ...
//                color - ON or OFF
/////////////////////////////////////////////////////////////////////////
#ifdef LARGE_LCD
void glcd_text57(int16 x, int16 y, char* textptr, int8 size, int1 color)
#else
void glcd_text57(int8 x, int8 y, char* textptr, int8 size, int1 color)
#endif
{
   int8 j, k, l, m;                       // Loop counters
   int8 pixelData[9]={0};                     // Stores character data

   for(; *textptr != '\0'; ++textptr, ++x)// Loop through the passed string
   {
      if(*textptr < 'S') // Checks if the letter is in the first font array
         memcpy(pixelData, FONT[*textptr - ' '], 8);
      else if(*textptr <= '~') // Check if the letter is in the second font array
         memcpy(pixelData, FONT2[*textptr - 'S'], 8);
      else
         memcpy(pixelData, FONT[0], 8);   // Default to space

      // Handles newline and carriage returns
      switch(*textptr)
      {
         case '\n':
            y += 8*size + 1;
            continue;
         case '\r':
            x = 0;
            continue;
      }

      if(x+5*size >= GLCD_WIDTH)          // Performs character wrapping
      {
         x = 0;                           // Set x at far left position
         y += 8*size + 1;                 // Set y at next position down
      }
      for(j=0; j<8; ++j, x+=size)         // Loop through character byte data
      {
         for(k=0; k < 8; ++k)             // Loop through the vertical pixels
         {
            if(bit_test(pixelData[j], k)) // Check if the pixel should be set
            {
               for(l=0; l < size; ++l)    // These two loops change the
               {                          // character's size
                  for(m=0; m < size; ++m)
                  {
                     glcd_pixel(x+m, y+k*size+l, color); // Draws the pixel
                  }
               }
            }
         }
      }
   }
}

#endif