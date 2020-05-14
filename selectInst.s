	.text

	.globl	qpow
	.type	qpow, @function
qpow:
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
	mv		a_13,a0
	mv		p_14,a1
	mv		mod_15,a2
	li		imm_17,1
	mv		t_16,imm_17
	mv		y_18,a_13
	mv		p_19,p_14
	mv		t_20,t_16
	mv		y_21,y_18
	mv		_fresh_variable__22,p_19
	mv		p_19,p_19
	mv		_fresh_variable__22,t_20
	mv		t_20,t_20
	mv		_fresh_variable__22,y_21
	j		qpow__while_cond

qpow__while_cond:
	li		imm_23,0
	bgt		p_19,imm_23,qpow__while_body
	j		qpow__while_merge

qpow__while_body:
	andi	vReg_24,p_19,1
	li		imm_25,1
	beq		vReg_24,imm_25,qpow__if_then
	j		qpow__parallel_copy_

qpow__if_then:
	mul		vReg_26,t_20,y_21
	rem		vReg_27,vReg_26,mod_15
	mv		t_28,vReg_27
	mv		t_29,t_28
	mv		_fresh_variable__30,t_29
	j		qpow__if_merge

qpow__if_merge:
	mul		vReg_31,y_21,y_21
	rem		vReg_32,vReg_31,mod_15
	mv		y_33,vReg_32
	li		imm_35,2
	div		vReg_34,p_19,imm_35
	mv		p_36,vReg_34
	mv		p_19,p_36
	mv		t_20,t_29
	mv		y_21,y_33
	mv		_fresh_variable__37,p_19
	mv		p_19,p_19
	mv		_fresh_variable__37,t_20
	mv		t_20,t_20
	mv		_fresh_variable__37,y_21
	j		qpow__while_cond

qpow__parallel_copy_:
	mv		t_29,t_20
	mv		_fresh_variable__38,t_29
	j		qpow__if_merge

qpow__while_merge:
	mv		a0,t_20
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
	li		imm_13,2
	mv		a0,imm_13
	li		imm_14,10
	mv		a1,imm_14
	li		imm_15,10000
	mv		a2,imm_15
	call	qpow
	mv		vReg_16,a0
	mv		a0,vReg_16
	call	__builtin_toString
	mv		vReg_17,a0
	mv		a0,vReg_17
	call	__builtin_println
	li		imm_18,0
	mv		a0,imm_18
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
	call	_main
	mv		vReg_13,a0
	mv		a0,vReg_13
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


