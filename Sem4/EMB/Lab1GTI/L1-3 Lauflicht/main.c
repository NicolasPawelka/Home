#include"LPC17xx.h"

unsigned counter = 0;
unsigned state = 0;
unsigned direction = 0;

void init(){
	LPC_SC->PCONP |= (1<<1);
	
	LPC_PINCON->PINSEL4 |= (1<<20);
	LPC_SC->EXTMODE |= (1<<0);
	LPC_SC->EXTPOLAR = 0;
	
	LPC_GPIO2->FIODIR0 |= 0xFF;
	LPC_GPIO2->FIOCLR0 |= 0xFF;
	
	LPC_TIM0->TCR |= (1<<1) | (1<<0);
	LPC_TIM0->CTCR = 0;
	LPC_TIM0->MCR |= (1<<1) | (1<<0);
	LPC_TIM0->MR0 = 1;
	LPC_TIM0->PR = 3125000;
	
	
	NVIC_EnableIRQ(TIMER0_IRQn);
	NVIC_EnableIRQ(EINT0_IRQn);
}

void TIMER0_IRQHandler(void){
	LPC_TIM0->IR = 1;
	LPC_TIM0->TC = 0;
	
	if (state == 1) {
		if (direction == 0) {
			if (LPC_GPIO2->FIOPIN0 == (1<<7))
				LPC_GPIO2->FIOPIN0 = (1<<0);
			else
				LPC_GPIO2->FIOPIN0 <<= 1;
		}
		else {
			if (LPC_GPIO2->FIOPIN0 == (1<<0))
				LPC_GPIO2->FIOPIN0 = (1<<7);
			else
				LPC_GPIO2->FIOPIN0 >>= 1;
		}
	}
	++counter;
}

void EINT0_IRQHandler(void) {
	LPC_TIM0->PC = 0;
	LPC_SC->EXTINT |= (1<<0);
	
	if (!LPC_SC->EXTPOLAR) {
		LPC_SC->EXTPOLAR |= (1<<0);
		counter = 0;
	}
	else {
		LPC_SC->EXTPOLAR = 0;		
		if (state == 0) {
			if (counter > 15) {
				state = 1;
				LPC_GPIO2->FIOPIN0 = (1<<0);
			}
		}
		else {
			if (counter > 15) {
				state = 0;
				direction = 0;
				LPC_GPIO2->FIOPIN0 = 0;
			}
			else if (counter > 0)
				direction ^= 1;
		}
	}
}

int main(void){
	init();
	LPC_TIM0->TCR &= ~(1<<1);
	while(1);
}
