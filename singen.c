	#define CHIP_6713 1
	#include "dsk6713.h"
	#include "dsk6713_aic23.h"
	#include "stdlib.h"
	#include "math.h" 
	
	//SINE PARAMETERS
	#define bufferlength 2048 // define a buffer length //
	#define LOOPLENGTH 8 // define a loop length //
	float outbuffer[bufferlength]; // define a buffer array //
	int bufferindex=0; // define a buffer index //
	short loopindex = 0; //define a table index
	short sinegain = 10; // define a gain factor
	short sine_table[LOOPLENGTH]={0,707,1000,707,0,-707,-1000,-707}; //sine values 
	
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
	DSK6713_AIC23_setFreq(hCodec, DSK6713_AIC23_FREQ_16KHZ ); // Sample Rate
	
	// Buffer Code
	OUT_L = IN_L;
	OUT_R = IN_L;
	
	
	while (1) 
	{
		/* Read sample from the left channel */
		//while (!DSK6713_AIC23_read(hCodec, &IN_L));
		IN_L = (sine_table[loopindex++]*sinegain);
		if (loopindex >= LOOPLENGTH) loopindex = 0; //reset
		
		/* Feeding the input directly to output */
		OUT_L = IN_L;
		OUT_R = IN_L;
		
		outbuffer[bufferindex++]=OUT_R;
		if(bufferindex >= bufferlength)bufferindex=0; 
	
		/* Delay effect will be added here */
	
		/* Echo effect will be added here */
	
		/* Reverberation effect will be added here */
	
		/* Send the sample to the left channel */
		while (!DSK6713_AIC23_write(hCodec, OUT_L));
	
		/* Send the sample to the right channel */
		while (!DSK6713_AIC23_write(hCodec, OUT_R));
	}
	/* Close the codec */
	
	DSK6713_AIC23_closeCodec(hCodec);
	}
