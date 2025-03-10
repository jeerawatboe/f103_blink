#ifndef __GPIO_H
#define __GPIO_H 

#include "base.h"
#include "stdbool.h"

#define GPIOC_CRL_OFFSET         (0x00UL)
#define GPIOC_CRL                (*(volatile unsigned int*)(GPIOC_PERIPHERAL + GPIOC_CRL_OFFSET))

#define GPIOC_CRH_OFFSET         (0x04UL)
#define GPIOC_CRH                (*(volatile unsigned int*)(GPIOC_PERIPHERAL + GPIOC_CRH_OFFSET))

#define GPIOC_ODR_OFFSET         (0x0CUL)
#define GPIOC_ODR                (*(volatile unsigned int*)(GPIOC_PERIPHERAL + GPIOC_ODR_OFFSET))

#define RCC_APB2ENR_OFFSET       (0x18UL)
#define RCC_APB2ENR              (*(volatile unsigned int*)(RCC_PERIPHERAL + RCC_APB2ENR_OFFSET))


void gpio_init(void);
void led_toggle(void);
void led_write(bool state);

#endif /* __GPIO_H */
