//LED.c  LED with DIP switch control

void main()
{
  DSK6713_LED_init();			      //init LED from BSL
  DSK6713_DIP_init();			      //init DIP from BSL
  while(1) 				                                                                                                                                  //infinite loop
  {
    if(DSK6713_DIP_get(0)==0) 		  //=0 if DIP switch #0 pressed
    {
      DSK6713_LED_on(0);	   		  //turn LED #0 ON
    }
    else DSK6713_LED_off(0); 		  //turn LED off if not pressed
  }                                       //end of while(1) infinite loop
}	