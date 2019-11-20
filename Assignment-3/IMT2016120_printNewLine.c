#include "stm32f4xx.h"
#include <string.h>
#include <stdio.h>
void printNewLine()
{
	 char ptr_n[5] = "\n";
	 ITM_SendChar(*ptr_n);
	 return;
}

