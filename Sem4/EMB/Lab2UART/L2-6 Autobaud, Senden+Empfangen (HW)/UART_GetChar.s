	THUMB ; Directive indicating the use of UAL
	AREA Code1, CODE, READONLY, ALIGN=4

	INCLUDE	LPC1768.inc
	EXPORT 	UART_GetChar
	;Assumption R0 = UART_PortNum (0 or 2 for LandTiger EVB)
	
UART_GetChar
	STMFD   SP!,{R4-R11 , LR}

	CBZ 	R0, UART_Port0	; Check if UART Port 0 or Port 2 selected
	BEQ 	UART_Port0
	
UART_Port2
	LDR R10, =U2LSR
	LDR R4, =U2RBR
	B LOAD
	
UART_Port0
	LDR R10, =U0LSR
	LDR R4, =U0RBR

LOAD
	LDR R0, =0xFFFFFFFF
	
	LDR R9, [R10]
	TST R9, #0x1			;LSR: RDR lesen
	BEQ UART_Rx_Done
	
    LDR R0, [R4]

UART_Rx_Done
	LDMFD   SP!,{R4-R11, PC}
 	
	END  
    