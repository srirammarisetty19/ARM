	THUMB 
     AREA     test_1, CODE, READONLY
     EXPORT __main
     ENTRY
__main function
	VLDR.F32 s0, =1.0    ; final Sum value ( here we are initializing with '1') 
	VLDR.F32 s1, =3.5    ; X value is stored in here 
	VLDR.F32 s2, =1.0    ; The series like X/1! , X^2/2!, X^3/3! etc.., are stored into this register
	VLDR.F32 s3, =1.0    ; Value of n is stored in s3 for getting values of (X/n , X/n+1 , X/n+2 , ....)
	VLDR.F32 s6, =1.0    ; Constant for incrementing a register
loop VMOV.F32 s4,s0			; here i am storing the value of answer in s4 so that at the end we will check if answer is changing or not
	 VDIV.F32 s5,s1,s3 		; calculating C=x/n
	 VADD.F32 s3,s3,s6 		; calculating n = n+1
	 VFMA.F32 s0,s2,s5 		; calculating A = A + BC
	 VMUL.F32 s2,s2,s5 		; Calculating B = B*C
	 VCMP.F32 s4,s0		; checking if the answer with previous answer
	 VMRS APSR_nzcv, FPSCR	
	 BNE loop			; if the previous and the current answers are different, then we can get still precise answer. 
											; if the values are same, that means we have reached the maximum precision
	 
						;final answer is stored in s0
stop B stop 			; stop
	 ENDFUNC
     END