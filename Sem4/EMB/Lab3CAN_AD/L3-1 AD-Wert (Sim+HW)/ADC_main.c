
#include "LPC17xx.h"
#include "adc.h"

void Timer1_Config(void);
uint16_t AD_value;
uint8_t check;

int main(void)
{
	//SystemInit();
	Timer1_Config();
	ADC_Config();
	ADC_StartConversion();
  while (1);
}

void Timer1_Config(void)
{
	LPC_SC->PCONP |= (1<<2);						//enable Timer1
	
	LPC_TIM1->TCR |= (1<<1)|(1<<0);			// and let Timer1 generate an Interrupt every 100 ms
	LPC_TIM1->MR0 = 250000;
	LPC_TIM1->MCR |= (1<<1)|(1<<0);
	LPC_TIM1->TCR &= ~(1<<1);
	
	NVIC_EnableIRQ(TIMER1_IRQn);				//Put some code in order to enable Timer1 interrupt with priority level 1
	NVIC_SetPriority(TIMER1_IRQn, 1); 	
	
}

void TIMER1_IRQHandler (void) 
{  
	LPC_TIM1->IR |= (1<<5);							//Clear timer1 interrupt
	
	while(!(LPC_ADC->ADSTAT & (1<<5)));
	AD_value = LPC_ADC->ADDR5 >> 4;			//Read and store AD value
	ADC_StartConversion();							//Start new AD conversion
}

/************************************ EOF ***********************************/


