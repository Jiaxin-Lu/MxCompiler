	.data

	.globl	__str_const_1
__str_const_1:
	.string	

	.globl	__str_const_2
__str_const_2:
	.string	\n

	.globl	__str_const_3
__str_const_3:
	.string	

	.globl	__str_const_4
__str_const_4:
	.string	-1

	.globl	__str_const_5
__str_const_5:
	.string	0

	.globl	__str_const_6
__str_const_6:
	.string	11h


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
	li		imm_14,0
	mv		i_13,imm_14
	mv		i_15,i_13
	mv		_fresh_variable__16,i_15
	j		main__for_cond

main__for_cond:
	li		imm_17,10
	blt		i_15,imm_17,main__for_body
	j		main__for_merge

main__for_body:
	la		str_const_18,__str_const_1
	mv		a0,str_const_18
	la		str_const_19,__str_const_2
	mv		a1,str_const_19
	call	__builtin_string_add
	mv		vReg_20,a0
	mv		a0,vReg_20
	call	__builtin_print
	j		main__for_step

main__for_step:
	addi	i_21,i_15,1
	mv		i_15,i_21
	mv		_fresh_variable__22,i_15
	j		main__for_cond

main__for_merge:
	li		imm_24,0
	mv		i_23,imm_24
	mv		i_25,i_23
	mv		_fresh_variable__26,i_25
	j		main__for_cond_2

main__for_cond_2:
	li		imm_27,10
	blt		i_25,imm_27,main__for_body_2
	j		main__for_merge_2

main__for_body_2:
	li		imm_29,0
	mv		i_28,imm_29
	mv		i_30,i_28
	mv		_fresh_variable__31,i_30
	j		main__for_cond_3

main__for_cond_3:
	li		imm_32,10
	blt		i_30,imm_32,main__for_step_2
	j		main__for_step_3

main__for_step_2:
	addi	i_33,i_30,1
	mv		i_30,i_33
	mv		_fresh_variable__34,i_30
	j		main__for_cond_3

main__for_step_3:
	addi	i_35,i_30,1
	mv		i_25,i_35
	mv		_fresh_variable__36,i_25
	j		main__for_cond_2

main__for_merge_2:
	li		imm_37,0
	beq		i_25,imm_37,main__if_then
	j		main__if_else

main__if_else:
	la		str_const_38,__str_const_4
	mv		a0,str_const_38
	la		str_const_39,__str_const_4
	mv		a1,str_const_39
	call	__builtin_string_add
	mv		vReg_40,a0
	call	__builtin_getString
	mv		vReg_41,a0
	mv		a0,vReg_40
	mv		a1,vReg_41
	call	__builtin_string_add
	mv		vReg_42,a0
	mv		a0,vReg_42
	call	__builtin_println
	j		main__while_cond

main__while_cond:
	mv		a0,i_25
	call	__builtin_toString
	mv		vReg_43,a0
	mv		a0,vReg_43
	la		str_const_44,__str_const_5
	mv		a1,str_const_44
	call	__builtin_string_eq
	mv		vReg_45,a0
	bne		vReg_45,zero,main__while_body
	j		main__while_merge

main__while_merge:
	li		imm_46,0
	mv		a0,imm_46
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

main__while_body:
	la		str_const_47,__str_const_6
	mv		a0,str_const_47
	call	__builtin_string_parseInt
	mv		vReg_48,a0
	j		main__while_cond

main__if_then:
	la		str_const_49,__str_const_3
	mv		a0,str_const_49
	la		str_const_50,__str_const_3
	mv		a1,str_const_50
	call	__builtin_string_add
	mv		vReg_51,a0
	mv		a0,vReg_51
	call	__builtin_println
	j		main__while_cond


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


