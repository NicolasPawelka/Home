	THUMB ; Directive indicating the use of UAL
	AREA Code1, CODE, READONLY, ALIGN=4

	INCLUDE	LPC1768.inc

    IMPORT UART_init
	IMPORT UART_PutChar
	IMPORT UART_GetChar

	EXPORT __main
 	ENTRY
__main  PROC	; Beispiel-Befehle Datenverarbeitungsbefehle + Shifter Operand:

	LDR R0, =0
	LDR  R1, =0x09
	LDR  R2, =0x2103
	LDR  R3, =0x0007
	MOV R4, R0
	BL 	UART_init
	LDR R0, =0
	
Loop
	BL UART_GetChar
	CMP R1, #0xFFFFFFFF
	BEQ Loop
	BL UART_PutChar
	B Loop

	ENDP

	END