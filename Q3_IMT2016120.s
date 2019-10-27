	THUMB 
	AREA appcode,CODE,READONLY
	EXPORT __main
		ENTRY
__main FUNCTION 
	MOV R1,#0x1010	;storing value of the number
	MOV R2,#0x2	;storing number 2
	
	UDIV R0,R1,R2		;findind the quotient when divided by 2
	MLS R0,R0,R2,R1		; finding the remainder value
	
	;If the value in R0 is '1' then the number is an ODD-Number. else, its EVEN-Number.


stop B stop; stop program 
	ENDFUNC
	END