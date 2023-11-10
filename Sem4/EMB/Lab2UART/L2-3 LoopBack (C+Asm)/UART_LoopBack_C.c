
#include <stdio.h>
#include <LPC17xx.H>  

extern void UART_init(int UART_PortNum,int U_DL,int UART_Mode,int INT_EN_FIFO_Mode);
extern void UART_PutChar(int UART_PortNum, int CharToBeSent);
extern int UART_GetChar(int UART_PortNum);

unsigned int MyChar;
unsigned int PortNum, UDL, UART_mode, FIFO_mode, IntEnableValue, Temp;
// PortNum = Port Number excepted to be 0 or 2 for the the LandTiger EVB
// UDL = U_DLM*256 + U_DLL to set the data rate
//UART_mode = Content of the register UxLCR without the DLAB bit
//FIFO_mode = Content of the register UxFCR
//IntEnableValue = Content of the register UxIER


	

int main(void){
	
	UART_init(0, 0x09, 0x2103, 0x7);
	while(1) {
		MyChar = UART_GetChar(0);
		if (MyChar != -1)
			UART_PutChar(0, MyChar);
	}

}

