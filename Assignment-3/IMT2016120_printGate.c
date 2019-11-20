#include "stm32f4xx.h"
#include <string.h>
#include <stdio.h>
void printGate(const int a)
{
	 char *ptr_n; 
	if(a==0){ ptr_n = "Logical value of NOT gate\n"; }
	 if(a==1){ ptr_n = "Logical value of AND gate\n"; }
	 if(a==2){ ptr_n = "Logical value of OR gate\n"; }
	 if(a==3){ ptr_n = "Logical value of NAND gate\n"; }
	 if(a==4){ ptr_n = "Logical value of NOR gate\n"; }
	 if(a==5){ ptr_n = "Logical value of XOR gate\n"; }
	 if(a==6){ ptr_n = "Logical value of XNOR gate\n"; }	
	 while(*ptr_n != '\0'){
      ITM_SendChar(*ptr_n);
      ++ptr_n;
   }
	 return;
}

