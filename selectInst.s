	.data

	.globl	__str_const_1
__str_const_1:
	.string	toInt: 

	.globl	__str_const_2
__str_const_2:
	.string	substr: 

	.globl	__str_const_3
__str_const_3:
	.string	 

	.globl	__str_const_4
__str_const_4:
	.string	

	.globl	__str_const_5
__str_const_5:
	.string	BY Kipsora

	.globl	reed
reed:
	.zero	4

	.globl	n
n:
	.zero	4


	.text

	.globl	rand
	.type	rand, @function
rand:
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
	lui		global_tmp_13,0
	lw		reed_14,0(global_tmp_13)
	slli	vReg_15,reed_14,5
	add		vReg_16,reed_14,vReg_15
	li		imm_18,1727317
	add		vReg_17,vReg_16,imm_18
	mv		reed_19,vReg_17
	li		imm_21,1772371
	rem		vReg_20,vReg_17,imm_21
	li		imm_22,1000
	blt		vReg_20,imm_22,rand__if_then
	j		rand__parallel_copy_

rand__if_then:
	li		imm_24,818277
	add		vReg_23,vReg_17,imm_24
	xor		vReg_25,vReg_17,vReg_23
	li		imm_27,18217
	sub		vReg_26,vReg_17,imm_27
	or		vReg_28,vReg_25,vReg_26
	mv		reed_29,vReg_28
	mv		reed_30,reed_29
	mv		_fresh_variable__31,reed_30
	j		rand__if_merge

rand__if_merge:
	li		imm_33,-268435457
	and		vReg_32,reed_30,imm_33
	lui		global_tmp_34,0
	sw		reed_30,0(global_tmp_34)
	mv		a0,vReg_32
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

rand__parallel_copy_:
	mv		reed_30,reed_19
	mv		_fresh_variable__35,reed_30
	j		rand__if_merge


	.globl	Test_Constructor
	.type	Test_Constructor, @function
Test_Constructor:
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
	mv		this_13,a0
	lui		global_tmp_14,0
	lw		n_15,0(global_tmp_14)
	li		imm_17,0
	mv		j_16,imm_17
	addi	vReg_18,this_13,0
	li		imm_20,4
	mul		vReg_19,n_15,imm_20
	addi	vReg_21,vReg_19,4
	mv		a0,vReg_21
	call	malloc
	mv		vReg_22,a0
	sw		n_15,0(vReg_22)
	sw		vReg_22,0(vReg_18)
	li		imm_24,0
	mv		i_23,imm_24
	mv		j_25,j_16
	mv		i_26,i_23
	mv		_fresh_variable__27,j_25
	mv		j_25,j_25
	mv		_fresh_variable__27,i_26
	j		Test_Constructor__for_cond

Test_Constructor__for_cond:
	blt		i_26,n_15,Test_Constructor__for_body
	j		Test_Constructor__for_merge

Test_Constructor__for_body:
	addi	vReg_28,this_13,0
	lw		vReg_29,0(vReg_28)
	li		imm_31,4
	mul		vReg_30,j_25,imm_31
	addi	vReg_32,vReg_30,4
	add		vReg_33,vReg_32,vReg_29
	mul		vReg_34,i_26,i_26
	add		vReg_35,i_26,vReg_34
	addi	vReg_36,vReg_35,3
	ori	vReg_37,vReg_36,13
	li		imm_39,4
	mul		vReg_38,vReg_37,imm_39
	addi	vReg_40,vReg_38,4
	mv		a0,vReg_40
	call	malloc
	mv		vReg_41,a0
	sw		vReg_37,0(vReg_41)
	sw		vReg_41,0(vReg_33)
	li		imm_43,0
	mv		j_42,imm_43
	mv		j_44,j_42
	mv		_fresh_variable__45,j_44
	j		Test_Constructor__for_cond_2

Test_Constructor__for_cond_2:
	mul		vReg_46,i_26,i_26
	add		vReg_47,i_26,vReg_46
	addi	vReg_48,vReg_47,2
	ori	vReg_49,vReg_48,13
	blt		j_44,vReg_49,Test_Constructor__for_body_2
	j		Test_Constructor__for_step

Test_Constructor__for_step:
	addi	i_50,i_26,1
	mv		j_25,j_44
	mv		i_26,i_50
	mv		_fresh_variable__51,j_25
	mv		j_25,j_25
	mv		_fresh_variable__51,i_26
	j		Test_Constructor__for_cond

Test_Constructor__for_body_2:
	addi	vReg_52,this_13,0
	lw		vReg_53,0(vReg_52)
	li		imm_55,4
	mul		vReg_54,i_26,imm_55
	addi	vReg_56,vReg_54,4
	add		vReg_57,vReg_56,vReg_53
	lw		vReg_58,0(vReg_57)
	li		imm_60,4
	mul		vReg_59,j_44,imm_60
	addi	vReg_61,vReg_59,4
	add		vReg_62,vReg_61,vReg_58
	call	rand
	mv		vReg_63,a0
	mv		a0,vReg_63
	call	__builtin_toString
	mv		vReg_64,a0
	sw		vReg_64,0(vReg_62)
	j		Test_Constructor__for_step_2

Test_Constructor__for_step_2:
	addi	j_65,j_44,1
	mv		j_44,j_65
	mv		_fresh_variable__66,j_44
	j		Test_Constructor__for_cond_2

Test_Constructor__for_merge:
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


	.globl	Test_printme
	.type	Test_printme, @function
Test_printme:
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
	mv		this_13,a0
	lui		global_tmp_14,0
	lw		n_15,0(global_tmp_14)
	li		imm_17,0
	mv		i_16,imm_17
	mv		i_18,i_16
	mv		_fresh_variable__19,i_18
	j		Test_printme__for_cond

Test_printme__for_cond:
	blt		i_18,n_15,Test_printme__for_body
	j		Test_printme__for_merge_2

Test_printme__for_body:
	li		imm_21,0
	mv		j_20,imm_21
	mv		j_22,j_20
	mv		_fresh_variable__23,j_22
	j		Test_printme__for_cond_2

Test_printme__for_cond_2:
	mul		vReg_24,i_18,i_18
	sub		vReg_25,j_22,vReg_24
	addi	vReg_26,i_18,3
	blt		vReg_25,vReg_26,Test_printme__for_body_2
	j		Test_printme__for_step_3

Test_printme__for_body_2:
	addi	vReg_27,this_13,0
	lw		vReg_28,0(vReg_27)
	li		imm_30,4
	mul		vReg_29,i_18,imm_30
	addi	vReg_31,vReg_29,4
	add		vReg_32,vReg_31,vReg_28
	lw		vReg_33,0(vReg_32)
	li		imm_35,4
	mul		vReg_34,j_22,imm_35
	addi	vReg_36,vReg_34,4
	add		vReg_37,vReg_36,vReg_33
	lw		vReg_38,0(vReg_37)
	mv		a0,vReg_38
	call	__builtin_println
	lw		vReg_39,0(vReg_27)
	add		vReg_40,vReg_31,vReg_39
	lw		vReg_41,0(vReg_40)
	add		vReg_42,vReg_36,vReg_41
	lw		vReg_43,0(vReg_42)
	mv		a0,vReg_43
	call	__builtin_string_parseInt
	mv		vReg_44,a0
	mv		a0,vReg_44
	call	__builtin_toString
	mv		vReg_45,a0
	la		str_const_46,__str_const_1
	mv		a0,str_const_46
	mv		a1,vReg_45
	call	__builtin_string_add
	mv		vReg_47,a0
	mv		a0,vReg_47
	call	__builtin_println
	call	rand
	mv		vReg_48,a0
	lw		vReg_49,0(vReg_27)
	add		vReg_50,vReg_31,vReg_49
	lw		vReg_51,0(vReg_50)
	add		vReg_52,vReg_36,vReg_51
	lw		vReg_53,0(vReg_52)
	mv		a0,vReg_53
	call	__builtin_string_length
	mv		vReg_54,a0
	rem		vReg_55,vReg_48,vReg_54
	mv		l_56,vReg_55
	call	rand
	mv		vReg_57,a0
	lw		vReg_58,0(vReg_27)
	add		vReg_59,vReg_31,vReg_58
	lw		vReg_60,0(vReg_59)
	add		vReg_61,vReg_36,vReg_60
	lw		vReg_62,0(vReg_61)
	mv		a0,vReg_62
	call	__builtin_string_length
	mv		vReg_63,a0
	rem		vReg_64,vReg_57,vReg_63
	mv		r_65,vReg_64
	bgt		vReg_55,vReg_64,Test_printme__if_then
	j		Test_printme__parallel_copy_

Test_printme__parallel_copy_:
	mv		l_66,l_56
	mv		r_67,r_65
	mv		_fresh_variable__68,l_66
	mv		l_66,l_66
	mv		_fresh_variable__68,r_67
	j		Test_printme__if_merge

Test_printme__if_merge:
	addi	vReg_69,this_13,0
	lw		vReg_70,0(vReg_69)
	li		imm_72,4
	mul		vReg_71,i_18,imm_72
	addi	vReg_73,vReg_71,4
	add		vReg_74,vReg_73,vReg_70
	lw		vReg_75,0(vReg_74)
	li		imm_77,4
	mul		vReg_76,j_22,imm_77
	addi	vReg_78,vReg_76,4
	add		vReg_79,vReg_78,vReg_75
	lw		vReg_80,0(vReg_79)
	mv		a0,vReg_80
	mv		a1,l_66
	mv		a2,r_67
	call	__builtin_string_substring
	mv		vReg_81,a0
	la		str_const_82,__str_const_2
	mv		a0,str_const_82
	mv		a1,vReg_81
	call	__builtin_string_add
	mv		vReg_83,a0
	mv		a0,vReg_83
	call	__builtin_println
	li		imm_85,0
	mv		k_84,imm_85
	mv		k_86,k_84
	mv		_fresh_variable__87,k_86
	j		Test_printme__for_cond_3

Test_printme__for_cond_3:
	addi	vReg_88,k_86,1
	addi	vReg_89,this_13,0
	lw		vReg_90,0(vReg_89)
	li		imm_92,4
	mul		vReg_91,i_18,imm_92
	addi	vReg_93,vReg_91,4
	add		vReg_94,vReg_93,vReg_90
	lw		vReg_95,0(vReg_94)
	li		imm_97,4
	mul		vReg_96,j_22,imm_97
	addi	vReg_98,vReg_96,4
	add		vReg_99,vReg_98,vReg_95
	lw		vReg_100,0(vReg_99)
	mv		a0,vReg_100
	call	__builtin_string_length
	mv		vReg_101,a0
	addi	vReg_102,vReg_101,1
	blt		vReg_88,vReg_102,Test_printme__for_body_3
	j		Test_printme__for_merge

Test_printme__for_body_3:
	lw		vReg_103,0(vReg_89)
	add		vReg_104,vReg_93,vReg_103
	lw		vReg_105,0(vReg_104)
	add		vReg_106,vReg_98,vReg_105
	lw		vReg_107,0(vReg_106)
	mv		a0,vReg_107
	mv		a1,k_86
	call	__builtin_string_ord
	mv		vReg_108,a0
	mv		a0,vReg_108
	call	__builtin_toString
	mv		vReg_109,a0
	mv		a0,vReg_109
	la		str_const_110,__str_const_3
	mv		a1,str_const_110
	call	__builtin_string_add
	mv		vReg_111,a0
	mv		a0,vReg_111
	call	__builtin_print
	j		Test_printme__for_step

Test_printme__for_step:
	addi	vReg_112,k_86,2
	mv		k_113,vReg_112
	mv		k_86,k_113
	mv		_fresh_variable__114,k_86
	j		Test_printme__for_cond_3

Test_printme__for_merge:
	la		str_const_115,__str_const_4
	mv		a0,str_const_115
	call	__builtin_println
	j		Test_printme__for_step_2

Test_printme__for_step_2:
	addi	j_116,j_22,1
	mv		j_22,j_116
	mv		_fresh_variable__117,j_22
	j		Test_printme__for_cond_2

Test_printme__if_then:
	mv		l_118,vReg_64
	mv		r_119,vReg_55
	mv		l_66,l_118
	mv		r_67,r_119
	mv		_fresh_variable__120,l_66
	mv		l_66,l_66
	mv		_fresh_variable__120,r_67
	j		Test_printme__if_merge

Test_printme__for_step_3:
	addi	i_121,i_18,1
	mv		i_18,i_121
	mv		_fresh_variable__122,i_18
	j		Test_printme__for_cond

Test_printme__for_merge_2:
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
	lui		global_tmp_13,0
	lw		n_14,0(global_tmp_13)
	call	__builtin_getInt
	mv		vReg_15,a0
	la		str_const_16,__str_const_5
	mv		a0,str_const_16
	call	__builtin_println
	li		imm_17,4
	mv		a0,imm_17
	call	malloc
	mv		vReg_18,a0
	lui		global_tmp_19,0
	sw		vReg_15,0(global_tmp_19)
	mv		a0,vReg_18
	call	Test_Constructor
	lui		global_tmp_20,0
	sw		vReg_15,0(global_tmp_20)
	mv		a0,vReg_18
	call	Test_printme
	addi	vReg_21,vReg_18,0
	li		imm_22,16
	mv		a0,imm_22
	call	malloc
	mv		vReg_23,a0
	li		imm_24,3
	sw		imm_24,0(vReg_23)
	addi	vReg_25,vReg_23,4
	addi	vReg_26,vReg_23,16
	mv		vReg_27,vReg_25
	mv		_fresh_variable__28,vReg_27
	j		main__array_loop_cond

main__array_loop_cond:
	blt		vReg_27,vReg_26,main__array_loop_body
	j		main__array_loop_merge

main__array_loop_merge:
	sw		vReg_23,0(vReg_21)
	j		main__for_body

main__for_body:
	j		main__for_body

main__array_loop_body:
	li		imm_29,16
	mv		a0,imm_29
	call	malloc
	mv		vReg_30,a0
	li		imm_31,3
	sw		imm_31,0(vReg_30)
	sw		vReg_30,0(vReg_27)
	j		main__array_loop_step

main__array_loop_step:
	addi	vReg_32,vReg_27,4
	mv		vReg_33,vReg_32
	mv		vReg_27,vReg_33
	mv		_fresh_variable__34,vReg_27
	j		main__array_loop_cond


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
	lui		global_tmp_13,0
	lw		reed_14,0(global_tmp_13)
	lui		global_tmp_15,0
	li		imm_16,12883127
	sw		imm_16,0(global_tmp_15)
	call	_main
	mv		vReg_17,a0
	lui		global_tmp_18,0
	lw		reed_19,0(global_tmp_18)
	mv		a0,vReg_17
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


