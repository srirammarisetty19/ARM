; Sriram Marisetty C:\Users\Sriram M\Desktop\C-7\Arm\kei\Assignment-3\Q1	
 	 area     appcode, CODE, READONLY
	 IMPORT printMsg
	 IMPORT printNewLine
	 IMPORT printGate
	 EXPORT __sigmoid
__sigmoid function
	
	VLDR.F32 s0, =1.0 ; final Sum value ( here we are initializing with '1') 
	VLDR.F32 s1, =1.0 ; ; The series like X/1! , X^2/2!, X^3/3! etc.., are stored into this register
	VLDR.F32 s3, =1.0 ; Value of n is stored in s3 for getting values of (X/n , X/n+1 , X/n+2 , ....)
	VLDR.F32 s4, =1.0 ; Constant for incrementing a register
	
loop VMOV.F32 s6,s0
	 VDIV.F32 s5,s2,s3 ; calculating C = x/n
	 VADD.F32 s3,s3,s4 ; calculating n = n+1
	 VFMA.F32 s0,s1,s5 ; calculating A = A + BC
	 VMUL.F32 s1,s1,s5 ; ; Calculating B = B*C
	 VCMP.F32 s6,s0
	 VMRS APSR_nzcv, FPSCR
	 BNE loop
	 
	 ; I am calculating e^x and then calculating (e^x/1+e^x)
	 VADD.F32 s30,s4,s0
	 VDIV.F32 s6,s0,s30
	 
	 ;answer is stored in register S6
	 BX lr
	 LTORG
	
	 ENDFUNC
	 EXPORT __GateAnd	 
__GateAnd function
	   MOV r5,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
	   ;weights 
	   VLDR.F32 s11, =1.0
	   VLDR.F32 s12, =1.0
	   VLDR.F32 s13, =1.0
	   VLDR.F32 s14, =-2.0
	   VMUL.F32 s11,s11,s7 		; weight1*x1
	   VMUL.F32 s12,s12,s8 		; weight2*x2
	   VMUL.F32 s13,s13,s9 		; weight3*x3
	   VMUL.F32 s14,s14,s10	 	; weight4*bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid
	   VCVTR.S32.F32 s26,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s26
	   BL printMsg
	   BL printNewLine
	   MOV r14,r5
	   BX lr
	   LTORG

	   ENDFUNC
	   
	   EXPORT __GateOr	 
__GateOr function
	   MOV r5,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
	   ; weights
	   VLDR.F32 s11, =3.0
	   VLDR.F32 s12, =3.0
	   VLDR.F32 s13, =3.0
	   VLDR.F32 s14, =-2.0
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid
	   VCVTR.S32.F32 s27,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s27
	   BL printMsg
	   BL printNewLine 
	   MOV r14,r5
	   BX lr
	   LTORG
	   ENDFUNC
	   
	   EXPORT __GateNand	 
__GateNand function
	   MOV r5,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
		; weights
	   VLDR.F32 s11, =-3.0
	   VLDR.F32 s12, =-3.0
	   VLDR.F32 s13, =-3.0
	   VLDR.F32 s14, =7.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   BL __sigmoid
	   VCVTR.S32.F32 s28,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s28
	   BL printMsg
	   BL printNewLine
	   MOV r14,r5
	   BX lr
	   LTORG
	   ENDFUNC
	   
	   EXPORT __GateNor	 
__GateNor function
	   MOV r5,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
		;weights
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =1.0
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid
	   VCVTR.S32.F32 s29,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s29
	   BL printMsg
	   BL printNewLine
	   MOV r14,r5
	   BX lr
	   LTORG
	   ENDFUNC
	   
	   EXPORT __GateXor	 
__GateXor function
	   MOV r5,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
		;weights
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
       BL __sigmoid 	;The below is Hidden Layer-1 X1
	   VCVTR.S32.F32 s17,s6
	   VCVT.F32.S32 s17,s17
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X2
	   VCVTR.S32.F32 s18,s6
	   VCVT.F32.S32 s18,s18
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X3
	   VCVTR.S32.F32 s19,s6
	   VCVT.F32.S32 s19,s19
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =-5.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 ;
	   VADD.F32 s15,s15,s13 ;
	   VADD.F32 s15,s15,s14 ;
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X4
	   VCVTR.S32.F32 s20,s6
	   VCVT.F32.S32 s20,s20
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s16, =2.0
	   VLDR.F32 s14, =-1.0
	   
	   VMUL.F32 s11,s11,s17 ; weight1*x1
	   VMUL.F32 s12,s12,s18 ; weight2*x2
	   VMUL.F32 s13,s13,s19 ; weight3*x3
	   VMUL.F32 s16,s16,s20 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight5*bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s16 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-2 Y1 output
	   VCVTR.S32.F32 s30,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s30
	   BL printMsg
	   BL printNewLine
	   MOV r14,r5
	   BX lr
	   LTORG
	   ENDFUNC
	   
	   EXPORT __GateXnor	 
__GateXnor function
	   MOV r5,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
		;weights
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X1
	   VCVTR.S32.F32 s17,s6
	   VCVT.F32.S32 s17,s17
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X2
	   VCVTR.S32.F32 s18,s6
	   VCVT.F32.S32 s18,s18
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X3
	   VCVTR.S32.F32 s19,s6
	   VCVT.F32.S32 s19,s19
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s12, =-2.0
	   VLDR.F32 s13, =-2.0
	   VLDR.F32 s14, =5.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s12,s12,s8 ; weight2*x2
	   VMUL.F32 s13,s13,s9 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s14 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-1 X4
	   VCVTR.S32.F32 s20,s6
	   VCVT.F32.S32 s20,s20
	   
	   VLDR.F32 s11, =2.0
	   VLDR.F32 s12, =2.0
	   VLDR.F32 s13, =2.0
	   VLDR.F32 s16, =2.0
	   VLDR.F32 s14, =-7.0
	   
	   VMUL.F32 s11,s11,s17 ; weight1*x1
	   VMUL.F32 s12,s12,s18 ; weight2*x2
	   VMUL.F32 s13,s13,s19 ; weight3*x3
	   VMUL.F32 s16,s16,s20 ; weight3*x3
	   VMUL.F32 s14,s14,s10 ; weight5*bias
	   
	   VLDR.F32 s15, =0.0
	   VADD.F32 s15,s15,s14
	   VADD.F32 s15,s15,s11 
	   VADD.F32 s15,s15,s12 
	   VADD.F32 s15,s15,s13 
	   VADD.F32 s15,s15,s16 
	   VMOV.F32 s2,s15
	   
       BL __sigmoid 	;The below is Hidden Layer-2 Y1 output
	   VCVTR.S32.F32 s31,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s22
	   BL printMsg
	   VMOV.F32 r0,s23
	   BL printMsg
	   VMOV.F32 r0,s31
	   BL printMsg
	   BL printNewLine
	   
	   MOV r14,r5
	   BX lr
	   LTORG

	   ENDFUNC
	   
	   EXPORT __GateNot	 
__GateNot function
	   ;NOT weight - s11,s14
	   MOV r5,r14
	   VCVTR.S32.F32 s21,s7
	   VCVTR.S32.F32 s22,s8
	   VCVTR.S32.F32 s23,s9
	   
	   VLDR.F32 s11, =-2.0
	   VLDR.F32 s14, =1.0
	   
	   VMUL.F32 s11,s11,s7 ; weight1*x1
	   VMUL.F32 s14,s14,s10 ; weight4*bias
	   
	   VADD.F32 s15,s11,s14 
	   VMOV.F32 s2,s15
	   
	   BL __sigmoid 	;This is Hidden Layer-2 Y1 output
	   VCVTR.S32.F32 s25,s6
	   VMOV.F32 r0,s21
	   BL printMsg
	   VMOV.F32 r0,s25
	   BL printMsg
	   BL printNewLine
       MOV r14,r5
	   BX lr
	   LTORG
	   ENDFUNC
	 
	 export __main	
	 ENTRY 
__main  function		 
	   ; Output is stored in here -- s25-NOT, s26-AND, s27-OR, s28-NAND, s29-NOR, s30-XOR, s31-XNOR
       ; The inputs are in s7,s8,s9
	   MOV r0,#0
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNot

	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNot
	   
	   
	   MOV r0,#1
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateAnd

	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateAnd
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateAnd
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateAnd
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateAnd
	   
	   
	   MOV r0,#2
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateOr
	   
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateOr
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateOr
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateOr
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateOr
	   
	   MOV r0,#3
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNand

	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNand
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNand
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNand
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNand
	   
	   MOV r0,#4
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNor


	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNor
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNor
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNor
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateNor
	   
	   MOV r0,#5
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXor


	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXor
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXor
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXor
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXor
	   
	   MOV r0,#6
	   BL printGate

	   VLDR.F32 s7, =0.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXnor

	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXnor
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =0.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXnor
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =0.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXnor
	   
	   VLDR.F32 s7, =1.0 ; input1
	   VLDR.F32 s8, =1.0 ; input2
	   VLDR.F32 s9, =1.0 ; input3
	   VLDR.F32 s10, =1.0 ; bias to the input
	   BL __GateXnor
	   
stop    B  stop ; stop program	   
     endfunc
     end 