	PRESERVE8 
    THUMB 
    AREA    |.text|,CODE,READONLY 
	IMPORT printMsg
    EXPORT __main 
    ENTRY 
	
	EXPORT __sinefunction	 
__sinefunction function	

	VLDR.F32 S3,=3.14592 	;Storing Pi value
	VLDR.F32 S4,=180 		; Storing 180 degress
	VMOV.F32 S20,R4; 		
    VCVT.F32.U32 S20, S20	;
	VMUL.F32 S20,S20, S3
	VDIV.F32 S20,S20, S4 	; Converted angle into radians
	VMOV.F32 s12,s20 		; C = x
	VLDR.F32 s13, =2.0 		; increment (i) 
	VMOV.F32 s14,s12		; temp
	VLDR.F32 s19, =2.0 		; add i=i+2 2 factor 
	VLDR.F32 s18, =1.0
	VMOV.F32 s23,s12		;temp =x 
	VMUL.F32 s11,s12,s12 	; B = x*x
	
loop VMOV.F32 s21,s23
	
	VMUL.F32 s14,s14,s11	;temp =temp*x*x 
	VADD.F32 s16,s13,s18	;i+1
	VMUL.F32 s10,s16,s13	;i*i+1
	VDIV.F32 s14,s14,s10	;temp / (i*i+1) ;
	VNMUL.F32 s14,s14,s18	;temp = - temp
	VADD.F32 s23,s23,s14	;t1 = t1 + temp
	VADD.F32 s13,s13,s19	;  
	VCMP.F32 s21,s23
	VMRS APSR_nzcv, FPSCR
	BNE loop
	B __cosinefunction
	LTORG
	ENDFUNC

	EXPORT __cosinefunction
__cosinefunction function	
	
	VLDR.F32 S3,=3.14592 	; Storing Pi value
	VLDR.F32 S4,=180 		; Storing 180 degress
	VMOV.F32 S20,R4; 
    VCVT.F32.U32 S20, S20;
	VMUL.F32 S20,S20, S3
	VDIV.F32 S20,S20, S4 	; Converted angle into radians
	
	VMOV.F32 s2,s20 		; C = x;
	VLDR.F32 s3, =2.0 		; increment (i) 
	VLDR.F32 s4, =1.0		;temp
	VLDR.F32 s7, =1.0
	VLDR.F32 s9, =2.0 		; add i=i+2 2 factor 
	VLDR.F32 s8, =1.0		;temp = x 
	VMUL.F32 s1,s2,s2 		;B = x*x
	
loop1 VMOV.F32 s15,s8
	VMUL.F32 s4,s4,s1		;temp =temp*x
	VSUB.F32 s6,s3,s7		; i + 1
	VMUL.F32 s0,s3,s6;
	VDIV.F32 s4,s4,s0		;temp/ (i-1) ;
	VNMUL.F32 s4,s4,s7		;temp = - temp
	VADD.F32 s8,s8,s4		;t1 = t1 + temp
	VADD.F32 s3,s3,s9 
	VCMP.F32 s15,s8
	VMRS APSR_nzcv, FPSCR
	BNE loop1
		
	B loo1
	LTORG
	ENDFUNC
		

__main    FUNCTION 
	VLDR.F32 S30,=100	; Value of the radius
	VLDR.F32 S0,=0		
	MOV R11,#5			; Increment angle each time by this value
	MOV R10,#360		; Do the incrementing till 360 degress
	MOV R4,#0
	
loop4
		B __sinefunction
		
loo1	
		VMUL.F32 S21,S30	;Multiplying radius with sine
		VMUL.F32 S15,S30	;Multiplying radius with cos
		VLDR.F32 S16,=319	;offset to centre_x
		VADD.F32 S21,S16	
		VLDR.F32 S16,=239	;offset to centre_y
		VADD.F32 S15,S16
		VMOV.F32 R0,S21
		VMOV.F32 R1,S15
		BL printMsg
		ADD R4,R11			; Increment Angle
		CMP R4,R10			; Comparing if angle == 360 degrees
		BLT loop4
		BGT Stop
				 
		
Stop B Stop
     ENDFUNC
	 END