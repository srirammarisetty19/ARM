	THUMB
    AREA    nestedlooptried ,CODE,READONLY
    EXPORT __main
	ENTRY
__main    FUNCTION
	
	; THE BELOW CODE IS THE EXAMPLE IMPLEMENTATION OF AN IF-THEN-ELSE BLOCK
	CMP R0, #10
	ITE Lo        ;if r0 is lower than 10 ...
	ADDLO R0, #1   ; then r0 = r0 + 1
	MOVHS R0, #0    ;else r0 = 0
	
	;Also any branches that exist in an it block must be the last instruction in the block.
	ITE     eq
	BLXEQ   some_label  ;@ UNPREDICTABLE during an IT block.
	MOVNE   rR, #0
	;The above code is unpredictable
	
	ITE     ne
	MOVNE   R0, #0
	BLXEQ   some_label  ;@ Ok at the end of an IT block.
	;The above code is the correct way of implementing
	
	; Hence if we wanted to put another nested loops for each of the  THEN  and ELSE statements then that gives an error
	
	; If we try to use nested loops for comparing 3-numbers as shown below
	MOV R1, #9 ; Number-1
	MOV R2, #9 ; Number-2
	CMP R1, R2 ; compare
	ITT LT		; start loop
	MOVLT R3, R1
	IT EQ			;start nested loop
	MOVEQ R4, R3	;It gives build error
	
stop    B stop
        ENDFUNC
        END