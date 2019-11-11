	THUMB 
     AREA     test_1, CODE, READONLY
     EXPORT __main
     ENTRY
__main function
	
	VLDR.F32 s9, =1.0 			; cos initial value as '1'
	VLDR.F32 s2, =-0.52359877559	; X input value is given here
	VMOV.F32 s10,s2 			; sine initial value as 'X'
	VMOV.F32 s1,s2 				; take some variable B = X 
	VLDR.F32 s3, =2.0 			; Initialize value of n = 2
	VLDR.F32 s4, =1.0 			; constant for adding 1 to registers
	
	MOV r0,#0x1					; if r0 == 1: then go and add to cos series; else go and add to sine series 	
	MOV r1,#0x1					; if r1 == 1: decrement in the series else increment in the series
	MOV r2,#0x1					; if r2 == 1: decrement in the series else increment in the series
	
loop VMOV.F32 s6,s0				; copy the result into s6

	 VDIV.F32 s5,s2,s3 			; Calculate C = x/n
	 
cosloop		cmp r0, #1				; Checking ro and deciding to go to cos or sine
			bne sineloop
			cmp r1, #1			; Checking r1 amd deciding to do cos=cos-BC or cos=cos+BC
			bne branch11
branch10	VFMS.F32 s9,s1,s5 					; cos = cos - BC
						VMUL.F32 s1,s1,s5 		; B = B*C
						MOV r1,#0x0				; Do cos = cos + BC next time
						MOV r0,#0x0				; Go to sine series next time
						b loop1					
branch11	VFMA.F32 s9,s1,s5 					; cos = cos + BC	
						VMUL.F32 s1,s1,s5 ; B = B*C
						MOV r1,#0x1				; Do cos = cos - BC next time	
						MOV r0,#0x0				; Go to sine series next time
						b loop1		
sineloop
		 cmp r2, #1				; Checking r2 amd deciding to do sine = sine - BC or sine = sine + BC
		 bne branch21
branch20	VFMS.F32 s10,s1,s5 					; sine = sine - BC
					VMUL.F32 s1,s1,s5 			; B = B*C
					MOV r2,#0x0					; Do sine = sine + BC next time
					MOV r0,#0x1					; Go to cos series next time
					b loop1
branch21
					VFMA.F32 s10,s1,s5 			; sine = sine + BC
					VMUL.F32 s1,s1,s5 			; B = B*C
					MOV r2,#0x1					; Do sine = sine - BC next time
					MOV r0,#0x1					; Go to cos series next time
					b loop1
		
loop1	 VADD.F32 s3,s3,s4 			; n = n+1 

	 VDIV.F32 s0,s10,s9 			; tan=sin/cos
	 VCMP.F32 s6,s0
	 VMRS APSR_nzcv, FPSCR
	 BNE loop
	 
								; Final  answer is stored  in S0
stop B stop ; stop program
	 ENDFUNC
     END