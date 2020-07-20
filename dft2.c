//dft2.c  

#include <stdio.h>
#include <math.h> 

#define PI 3.14159265358979
#define N 100
#define TESTFREQ 800.0
#define SAMPLING_FREQ 8000.0

void main(void)
{

	float samplesR[N];
	float samplesI[N];
	float resultR[N];
	float resultI[N];
	float outR[N];
	float outI[N];
	int k,n;

	{

	  for(n=0 ; n<N ; n++)
	  {
	      samplesR[n] = cos(2*PI*TESTFREQ*n/SAMPLING_FREQ);
	      samplesI[n] = 0.0;
	  }
	  
	   for (k=0 ; k<N ; k++)
	  {
	    resultR[k]=0.0;
	    resultI[k]=0.0;
	
	    for (n=0 ; n<N ; n++)
	    {
	      resultR[k] += samplesR[n]*cos(2*PI*k*n/N) + samplesI[n]*sin(2*PI*k*n/N);
	      resultI[k] += samplesI[n]*cos(2*PI*k*n/N) - samplesR[n]*sin(2*PI*k*n/N);
	    }
	  }
	  for (k=0 ; k<N ; k++)
	  {
	    outI[k] = resultI[k];
	    outR[k] = resultR[k];
	  }
	  
	}
	while(1);                                 //end of while(1) infinite loop
}
