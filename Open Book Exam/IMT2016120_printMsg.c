#include "stm32f4xx.h"
#include <string.h>
#include <stdio.h>

void printMsg(int x,int y)
{
	 float X=*((float*) &x);
	 float Y=*((float*) &y);
	
	 char Msg1[10];
	 char Msg2[10];
	
	 char *ptr;
	 sprintf(Msg1, "%f , ", X);
	 
	 ptr = Msg1 ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   
	 }
	 ITM_SendChar(',')	 ;
	 sprintf(Msg2, "%f,", Y);
	 ptr = Msg2 ;
   while(*ptr != '\0'){
      ITM_SendChar(*ptr);
      ++ptr;
   }
	 ITM_SendChar('\n')	 ;
}
