#include "gpio.h"

#define GPIOC_ENR        (1U << 4)

#define GPIOC13          (1U << 13)

#define LED              GPIOC13

/* #TODO initialize GPIO pin */
void gpio_init(void){
	/* Enable clock access to GPIOC  */
	RCC_APB2ENR |= GPIOC_ENR;

	/* Config register MODE13 to 10: Output mode, max speed 2 MHz */
	GPIOC_CRH &= ~(1U << 20);
	GPIOC_CRH |=  (1U << 21);

}


/* #TODO toogle led pin */
void led_toggle(void){

	GPIOC_ODR ^= LED;

}


/*#TODO write led pin */
void led_write(bool state){

	if (state == 1){
		GPIOC_ODR |= GPIOC13;

	}
	else if (state == 0){
		GPIOC_ODR &= ~GPIOC13;	

	}
}
