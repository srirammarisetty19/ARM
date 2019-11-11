#include <stdio.h> 
double exponential( double x) 
{ 
    double b=1.0;
    double sum = 1.00; // initialize sum of series 
    double n=1.0;
    double a=1.0;
    double i=1.0;
    double zero =0.0;
      double temp;
     double c=1.0;
    while (temp!=a){
	  
	    temp=a;
	    c=x/i;
	    i=i+1.0;
	    a=a+(b*c);
	    b=b*c;
	    if(b==zero){
	        break;
	    }
    }
    return a;
} 

int main() 
{ 
	double i=0.0;
	for (i=0.0 ;i<6.0;i++)
	{
	double x1 = 4.5f + i;
	printf("e^x = %.22f", exponential(x1)); 
	}
	return 0; 
}
