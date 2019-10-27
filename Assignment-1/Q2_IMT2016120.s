	THUMB 
	AREA appcode,CODE,READONLY
	EXPORT __main
		ENTRY
__main FUNCTION 
	MOV R1,#0x50	;storing value-1
	MOV R2,#0x50	;storing value-2
	MOV R3,#0x45	;storing value-3
	
	CMP R1, R2		;comparing R1 and R2
	BLT loop1		
	CMP R1,R3		;comparing R1 and R3 if R1>R2
	BLT loop11
	MOV R0,R1		; Storing maximum value(R1) in R0
	B stop
	
loop1 CMP R2,R3		;comparing R2 and R3 if R1<R2
	BLT loop11
	MOV R0,R2		; Storing maximum value(R2) in R0
	B stop
loop11 MOV R0,R3	; Storing maximum value(R3) in R0

stop B stop; stop program 
	ENDFUNC
	END