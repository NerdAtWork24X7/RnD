/* 
 * File:   main.c
 * Author: Vs-Corp
 *
 * Created on December 15, 2018, 12:35 AM
 */

#include <stdio.h>
#include <stdlib.h>
#include "mcc.h"

/*
 * 
 */
int main(int argc, char** argv) {

    SYSTEM_Initialize();
    INTERRUPT_GlobalInterruptEnable();
    while(1);
    return (EXIT_SUCCESS);
}

