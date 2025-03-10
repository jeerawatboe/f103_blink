#include <stdint.h>

#include "driver/base.h"
#include "driver/gpio.h"


void SystemInit(void)
{
	
}

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

  /* Loop forever */
	for(;;)
	{
	
		led_write(0);
		delay();
		led_write(1);
		delay();

	}
}
