		THUMB
		AREA LED, CODE
		INCLUDE LPC1768.inc
	
		EXPORT __main
		ALIGN
		ENTRY
	
__main PROC
	
		LDR R4, =FIO2DIR
		LDR R5, [R4]
		ORR R5, R5, #0xFF
		STR R5, [R4]
		
		LDR R4, =FIO2CLR
		MOV R5, #0xFF
		STR R5, [R4]
		
		LDR R4, =FIO2PIN0
		LDR R6, =FIO2PIN1
		LDR R7, =FIO2SET0
		LDR R8, =FIO2CLR0
		LDR R2, =2500000
		
Loop
		LDR R0, [R6]
		TST R0, #0x4
		BNE Loop
		
		B delay	
back	

		LDR R2, =2500000
		LDR R0, [R6]
		TST R0, #0x4
		BNE Loop

wait
		LDR R0, [R6]
		TST R0, #0x4
		BEQ wait
		
		LDR R0, [R4]
		EOR R0, R0, #0xF8
		STR R0, [R4]
		B Loop
delay
		SUBS R2, R2, #1
		BNE delay
		B back
		
		ENDP
		
		END
