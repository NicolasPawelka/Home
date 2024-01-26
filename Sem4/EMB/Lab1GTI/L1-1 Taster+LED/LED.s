		THUMB
		AREA LED, CODE
MyData 	DCQ 0x12345678, 0xAABBCCDD,3,4,5,6,7,8,9,10,11,12,13,14,15,16
		INCLUDE LPC1768.inc

		EXPORT main
		ALIGN
		ENTRY
	
main PROC
	
		LDR R4, =FIO2DIR
		LDR R5, [R4]
		ORR R5, R5, #0xFF
		STR R5, [R4]
		
		LDR R4, =FIO2CLR
		MOV R5, #0xFF
		STR R5, [R4]
		
		LDR R6, =FIO2PIN1
		LDR R7, =FIO2SET0
		LDR R8, =FIO2CLR0
		
Loop
		LDR R0, [R6]
		LDR R1, [R7]
		LDR R2, [R8]
		MOV R0,#0x0
		CLZ R3,R0
		
		TST R0, #0x4
		ITTEE EQ
		MOVEQ R1, #0x4
		STREQ R1, [R7]
		MOVNE R2, #0x4
		STRNE R2, [R8]
		
		
		B Loop

		ENDP
		
		END
