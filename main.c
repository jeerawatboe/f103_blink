#include <stdint.h>

#include "Driver/base.h"
#include "Driver/gpio.h"

void delay(void){

	for(int i = 0 ; i < 150000 ; i++);

}

int main(void)
{
	/* Initialize GPIO pin */
	gpio_init();

	/* toggle led 2 time */ 
	led_toggle();
	delay();
	led_toggle();
	delay();
	led_toggle();
	delay();
	led_toggle();
	delay();
	led_toggle();
	delay();
	led_toggle();
	delay();
	led_toggle();
	delay();
	led_toggle();
	delay();
	led_toggle();
	delay();



  /* Loop forever */
	for(;;)
	{

	

	}
}
