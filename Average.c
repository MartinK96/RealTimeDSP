	#define CHIP_6713 1
	#include "dsk6713.h"
	#include "dsk6713_aic23.h"
	#include "stdlib.h"
	#include "math.h" 
	
	//Average
	#define N 5
	#define BUFFLENGTH 2048 
	Int16 x[N];
	float outbuffer[BUFFLENGTH];
	int bufferIndex=0; 
	float h[N]={0.2,0.2,0.2,0.2,0.2};
	short i=0;
	float yn; 
	
	/* Configure Codec */ DSK6713_AIC23_Config config = {
	0x0017, /* 0 - DSK6713_AIC23_LEFTINVOL Left line input channel volume */
	0x0017, /* 1 - DSK6713_AIC23_RIGHTINVOL Right line input channel volume */
	0x01f9, /* 2 - DSK6713_AIC23_LEFTHPVOL Left channel headphone volume */
	0x01f9, /* 3 - DSK6713_AIC23_RIGHTHPVOL Right channel headphone volume */
	0x019d, /* 4 - DSK6713_AIC23_ANAPATH Analog audio path control */
	0x0000, /* 5 - DSK6713_AIC23_DIGPATH Digital audio path control */
	0x0000, /* 6 - DSK6713_AIC23_POWERDOWN Power down control */
	0x0043, /* 7 - DSK6713_AIC23_DIGIF Digital audio interface format */
	0x0000, /* 8 - DSK6713_AIC23_SAMPLERATE Sample rate control */
	0x0001, /* 9 - DSK6713_AIC23_DIGACT Digital interface activation */ };
	
	void main () 
	{
	DSK6713_AIC23_CodecHandle hCodec;
	Int16 OUT_L,OUT_R;
	Uint32 IN_L;
	
	DSK6713_init();
	/* Start the codec */
	hCodec = DSK6713_AIC23_openCodec(0, &config);
	
	/* Set codec frequency to 48KHz */
	DSK6713_AIC23_setFreq(hCodec, DSK6713_AIC23_FREQ_8KHZ );
	
	while (1) {
		/* Read sample from the left channel */
		while (!DSK6713_AIC23_read(hCodec, &IN_L));
		
		//Update the buffer shift
		outbuffer[bufferIndex++]=OUT_R;
		if(bufferIndex >= BUFFLENGTH)bufferIndex=0;
	
		/* moving average */
		x[0]=(IN_L);
		yn=0.0;
		for (i=0; i<N; i++)
 		yn = yn + x[i]*h[i];
		for (i=(N-1);i>0; i--)
		 x[i]=x[i-1];
		OUT_R = yn;
		OUT_L = yn; 
	
		/* Send the sample to the left channel */
		while (!DSK6713_AIC23_write(hCodec, OUT_L));
	
		/* Send the sample to the right channel */
		while (!DSK6713_AIC23_write(hCodec, OUT_R));
	}
	/* Close the codec */
	
	DSK6713_AIC23_closeCodec(hCodec);
	}
