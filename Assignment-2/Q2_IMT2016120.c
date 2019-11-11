#include <stdio.h> 
float tane( float x) 
{ 
    float b=x;
    float a=1.0f;
    float n=2.0f;
    int  r0=1;
    int  r1=1;
    int  r2=1;
    float cos=1.0f;
    float sin =x;
    float tan=0;
    float zero =0.0000f;
    float temp;
     float c=1.0f;
    while (temp!=tan){
	    temp=tan;
	    c=x/n;
	    if(r0==1){
	        if(r1==1){
	            cos =cos-(b*c);
	            r0=0;
	            r1=0;
	            n=n+1;
	            tan=sin/cos;
	            break;
	        }
	       if(r1==0){
	            cos =cos+(b*c);
	            b=b*c;r1=1;r0=0;
	            r0=0;
	            r1=0;
	             n=n+1;
	            tan=sin/cos;
	            break;
	       } 
	  
	    }
	    if(r0==0){
	        if(r2==1){
	            sin =sin-(b*c);
	            b=b*c;
	            r2=0;
	            r0=1;
	            n=n+1;
	            tan=sin/cos;
	            break;
	        }
	       if(r2==0){
	            sin =sin+(b*c);
	            b=b*c;r1=1;r0=0;
	            r0=0;
	            r1=0;
	             n=n+1;
	            tan=sin/cos;
	            break;
	       } 
	  
	    }
	    if(b==zero){
	        break;
	    }
    }
    return tan;
} 
int main() 
{ 
	float x = 0.78539816339f; 
	printf("tan(x) = %16f", tane(x)); 
	return 0; 
}
