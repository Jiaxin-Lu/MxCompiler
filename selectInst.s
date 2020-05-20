	.text

	.globl	main
	.type	main, @function
main:
	mv		ra_0,ra
	mv		s0_1,s0
	mv		s1_2,s1
	mv		s2_3,s2
	mv		s3_4,s3
	mv		s4_5,s4
	mv		s5_6,s5
	mv		s6_7,s6
	mv		s7_8,s7
	mv		s8_9,s8
	mv		s9_10,s9
	mv		s10_11,s10
	mv		s11_12,s11
	li		imm_13,4
	mv		a0,imm_13
	call	malloc
	mv		vReg_14,a0
	addi	vReg_15,vReg_14,0
	li		imm_16,10
	sw		imm_16,0(vReg_15)
	lw		vReg_17,0(vReg_15)
	li		imm_19,2
	mul		vReg_18,imm_19,vReg_17
	mv		a0,vReg_18
	mv		s11,s11_12
	mv		s10,s10_11
	mv		s9,s9_10
	mv		s8,s8_9
	mv		s7,s7_8
	mv		s6,s6_7
	mv		s5,s5_6
	mv		s4,s4_5
	mv		s3,s3_4
	mv		s2,s2_3
	mv		s1,s1_2
	mv		s0,s0_1
	mv		ra,ra_0
	jr		ra


