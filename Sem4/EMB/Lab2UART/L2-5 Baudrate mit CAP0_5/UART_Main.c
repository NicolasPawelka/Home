#include <LPC17xx.h>

unsigned firstValue;
unsigned secondValue;
unsigned difference = 0xFFFFFFFF;
unsigned min = 0xFFFFFFFF;
unsigned baud;
int counter;

void init_Timer2(){
	LPC_SC->PCONP |= (1<<22);
	LPC_PINCON->PINSEL0 |= (1<<11)|(1<<10);
	LPC_TIM2->TCR |= (1<<1)|(1<<0);
	LPC_TIM2->CCR |= (1<<5)|(1<<4)|(1<<3);

	LPC_TIM2->TCR &= ~(1<<1);
}

void init_NVIC(){
	NVIC_EnableIRQ(TIMER2_IRQn);
	NVIC_SetPriority(TIMER2_IRQn,2);
}

/*void TIMER2_IRQHandler(){
	if (LPC_TIM2->CCR == 0x28) {
		firstValue = LPC_TIM2->CR1;
		LPC_TIM2->CCR &= ~(1<<3);
		LPC_TIM2->CCR |= (1<<4);
	} else {
		secondValue = LPC_TIM2->CR1;
		LPC_TIM2->CCR &= ~(1<<4);
		LPC_TIM2->CCR |= (1<<3);
		difference = secondValue - firstValue;
	}
	
	LPC_TIM2->IR |= (1<<5);
}*/
void TIMER2_IRQHandler(){
	if(counter == 0){
		firstValue = LPC_TIM2 ->CR1;
		counter++;
	}else{
		secondValue = LPC_TIM2 ->CR1;
		difference = secondValue - firstValue;
		firstValue = secondValue;		
	}
	LPC_TIM2 ->IR |= (1<<5);
	
}

int main(void){
	init_NVIC();
	init_Timer2();
	while(1){
		if (difference < min) {
			min = difference;
			baud = 25000000 / min;
		}
	}
}
