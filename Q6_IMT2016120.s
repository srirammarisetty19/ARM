	THUMB 
	AREA appcode,CODE,READONLY
	EXPORT __main
		ENTRY
__main FUNCTION 
	MOV R1,#0x6	;storing value-a
	MOV R2,#0x9	;storing value-b
	
whileloop CMP R1, R2		
	BEQ loop1		;checking for a==b
	BLT loop2		;checking if a<b
	SUB R1,R2		;a=a-b, if b>a
	B whileloop		;go to start of while loop
	
loop2 SUB R2,R1		; b=b-a, if b>a
	B whileloop		;go to start of while loop

loop1 MOV R0,R1		;stop, if a==b. Also I am storing the result GCD in R0 
	B stop			;exit while loop and stop

stop B stop; stop program 
	ENDFUNC
	END