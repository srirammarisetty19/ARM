	THUMB 
	AREA appcode,CODE,READONLY
	EXPORT __main
		ENTRY
__main FUNCTION 
	MOV R0,#0	;initial value
	MOV R1,#1	;Initial value
	MOV R3,#10	;get answers till f(10)
	MOV R5,#0x20000000	;store all the sequence starting from address 0x20000000
	STR R0,[R5]			;store R0 initial value
	STR R1,[R5,#0x1]!	;store R1 initial value
	
LOOP CMP R3,#0x00000002	;R3 run loop till R3 is >= 2
	SUB R3,R3,#1 		;R3=R3-1
	ADD R2,R0,R1		;R2=R0+R1
	STR R2,[R5,#0x1]!	;Store R2 in the address
	MOV R0,R1			;R0=R1
	MOV R1,R2			;R1=R2
	BGT LOOP			;Repeat LOOP again!!!
	
		;The answers are stored starting from address 0x20000000 and starting from the value of f(0) to f(n)
		;f(0)->0,f(1)->1,f(2)->1,f(3)->2,f(4)->3,f(5)->5 etc..,
	
stop B stop; stop program 
	ENDFUNC
	END