	.data

	.globl	a
a:
	.zero	4

	.globl	b
b:
	.zero	4


	.text

	.globl	_main
	.type	_main, @function
_main:
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
	lw		b_13,0(b_14)
	lw		a_15,0(a_16)
	add		null_17,a_15,b_13
	mv		a0,null_17
	call	__builtin_printInt
	mv		a0,zero
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
	mv		imm_13,a0
	call	malloc
	mv		a0,b_14
	li		imm_14,4
	mv		imm_14,a0
	call	malloc
	mv		a0,a_16
	lw		b_15,0(b_14)
	lw		a_16,0(a_16)
	li		imm_17,1
	sw		imm_17,0(a_16)
	li		imm_18,2
	sw		imm_18,0(b_14)
	call	_main
	mv		null_19,a0
	mv		a0,null_19
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


