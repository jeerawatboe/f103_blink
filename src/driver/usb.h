#ifndef __USB_H
#define __USB_H

#include "base.h"

#define USB_CNTR_OFFSET			(0x40UL)
#define USB_CNTR  					(*(volatile unsigned int*)(USB_PERIPHERAL + USB_CNTR_OFFSET))

#define USB_ISTR_OFFSET     (0x44UL)
#define USB_ISTR            (*(volatile unsigned int*)(USB_PERIPHERAL + USB_ISTR_OFFSET))

#define USB_FNR_OFFSET      (0x48UL)
#define USB_FNR  						(*(volatile unsigned int*)(USB_PERIPHERAL + USB_FNR_OFFSET))

#define USB_DADDR_OFFSET    (0x4CUL)
#define USB_DADDR 					(*(volatile unsigned int*)(USB_PERIPHERAL + USB_DADDR_OFFSET))

#define USB_BTABLE_OFFSET  	(0x50UL)
#define USB_BTABLE 					(*(volatile unsigned int*)(USB_PERIPHERAL + USB_BTABLE))

#define USB_EP0R_OFFSET   	(0x00UL)
#define USB_EP0R         		(*(volatile unsigned int*)(USB_PERIPHERAL + USB_EP0R_OFFSET))

#define USB_EP1R_OFFSET   	(0x04UL)
#define USB_EP1R         		(*(volatile unsigned int*)(USB_PERIPHERAL + USB_EP0R_OFFSET))

#define USB_EP2R_OFFSET   	(0x08UL)
#define USB_EP2R         		(*(volatile unsigned int*)(USB_PERIPHERAL + USB_EP0R_OFFSET))

#define USB_EP3_OFFSET    	(0x0CUL)
#define USB_EP3R         		(*(volatile unsigned int*)(USB_PERIPHERAL + USB_EP0R_OFFSET))

#define USB_EP4R_OFFSET   	(0x10UL)
#define USB_EP4R         		(*(volatile unsigned int*)(USB_PERIPHERAL + USB_EP0R_OFFSET))

#define USB_EP5R_OFFSET   	(0x14UL)
#define USB_EP5R         		(*(volatile unsigned int*)(USB_PERIPHERAL + USB_EP0R_OFFSET))

#define USB_EP6R_OFFSET   	(0x18UL)
#define USB_EP6R         		(*(volatile unsigned int*)(USB_PERIPHERAL + USB_EP0R_OFFSET))

#define USB_EP7R_OFFSET   	(0x1CUL)
#define USB_EP7R         		(*(volatile unsigned int*)(USB_PERIPHERAL + USB_EP0R_OFFSET))


#endif /* __USB_H */
