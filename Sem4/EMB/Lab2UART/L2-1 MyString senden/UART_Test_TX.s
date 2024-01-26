	THUMB ; Directive indicating the use of UAL
	AREA Code1, CODE, READONLY, ALIGN=4

	INCLUDE	LPC1768.inc
    IMPORT UART_init
	IMPORT UART_PutChar

	EXPORT __main
 	ENTRY
__main  PROC
    ; Configure UART
	LDR  R0, =0		 ; UART_PortNum  0 or 2
	LDR  R1, =0x09	; UxDL  = (UxDLM << 8) | (UxDLL)

	
	LDR  R2, =0x2107	 ; (UxFDR (7:4 MULVAL  3:0 DIVADDVAL) <<8) | UxLCR (UART_Mode):
                         ; DLAB 0  Set Break 0  Stick Parity 0  Even Parity Select 0  
	                 ; Parity Enable 0  Number of Stop Bits 0  Word Length Select 11
	LDR  R3, =0x0007	; Int Enable (IIR)+FIFO_Mode (FCR) ;TX FIFO Reset 1;RX FIFO Reset 1;FIFO Enable 1

	;R0 = UART_PortNum, R1 = U_DL , R2 = UART_Mode, R3 = (INT_ENABLE << 8) | FIFO_Mode
	; 8 Nutzdatenbits pro Sendung, keine Parität, 1 Stopp Bit ; Interrupts ausgeschaltet
	; FIFO aktiv, Trigger level = 1

	MOV R4, R0			; Copy of PortNum (weil R0..R3 Scratch-Register sind, d.h. in einer gerufenen Funtion verändert werden können!)
	BL 	UART_init
	LDR R5, =MyString	;
	LDR R0, =0;

Read_String				; MainLoop
	LDRB R1, [R5], #1
	CMP R1, #0x0
	BLNE UART_PutChar
	BNE Read_String
	
FinishLoop	
	B	.	; End Of Program (Sprung auf sich selbst)

	ENDP

	AREA    String_Block, DATA, READONLY
MyString  DCB  "Life is good.",10,0		; 10 = LF (Line Feed) for new line, 0 = End of String

	END
	