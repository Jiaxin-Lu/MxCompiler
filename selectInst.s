	.data

	.globl	__str_const_1
__str_const_1:
	.string	Oops!

	.globl	__str_const_2
__str_const_2:
	.string	 

	.globl	__str_const_3
__str_const_3:
	.string	 

	.globl	__str_const_4
__str_const_4:
	.string	 

	.globl	__str_const_5
__str_const_5:
	.string	 

	.globl	__str_const_6
__str_const_6:
	.string	\n

	.globl	__str_const_7
__str_const_7:
	.string	>

	.globl	__str_const_8
__str_const_8:
	.string	<=

	.globl	__str_const_9
__str_const_9:
	.string	,

	.globl	__str_const_10
__str_const_10:
	.string	

	.globl	__str_const_11
__str_const_11:
	.string	0

	.globl	__str_const_12
__str_const_12:
	.string	0

	.globl	__str_const_13
__str_const_13:
	.string	0

	.globl	countA
countA:
	.zero	4

	.globl	countB
countB:
	.zero	4

	.globl	countC
countC:
	.zero	4

	.globl	something
something:
	.zero	4


	.text

	.globl	A_Constructor
	.type	A_Constructor, @function
A_Constructor:
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
	lw		countA_15,0(global_tmp_14)
	lui		global_tmp_16,0
	lw		countB_17,0(global_tmp_16)
	addi	vReg_18,this_13,12
	addi	countA_19,countA_15,1
	sw		countA_15,0(vReg_18)
	lw		vReg_20,0(vReg_18)
	li		imm_22,2
	rem		vReg_21,vReg_20,imm_22
	li		imm_23,0
	beq		vReg_21,imm_23,A_Constructor__if_then_2
	j		A_Constructor__if_else

A_Constructor__if_else:
	addi	vReg_24,this_13,0
	li		imm_25,0
	sw		imm_25,0(vReg_24)
	mv		countA_26,countA_19
	mv		_fresh_variable__27,countA_26
	j		A_Constructor__if_merge

A_Constructor__if_merge:
	addi	vReg_28,this_13,8
	li		imm_30,2
	li		imm_31,4
	mul		vReg_29,imm_30,imm_31
	addi	vReg_32,vReg_29,4
	mv		a0,vReg_32
	call	malloc
	mv		vReg_33,a0
	li		imm_34,2
	sw		imm_34,0(vReg_33)
	sw		vReg_33,0(vReg_28)
	lw		vReg_35,0(vReg_28)
	li		imm_37,0
	li		imm_38,4
	mul		vReg_36,imm_37,imm_38
	addi	vReg_39,vReg_36,4
	add		vReg_40,vReg_39,vReg_35
	li		imm_42,6
	li		imm_43,4
	mul		vReg_41,imm_42,imm_43
	addi	vReg_44,vReg_41,4
	mv		a0,vReg_44
	call	malloc
	mv		vReg_45,a0
	li		imm_46,6
	sw		imm_46,0(vReg_45)
	addi	vReg_47,vReg_45,4
	add		vReg_48,vReg_45,vReg_44
	mv		vReg_49,vReg_47
	mv		_fresh_variable__50,vReg_49
	j		A_Constructor__array_loop_cond

A_Constructor__array_loop_cond:
	blt		vReg_49,vReg_48,A_Constructor__array_loop_body
	j		A_Constructor__array_loop_merge

A_Constructor__array_loop_merge:
	li		imm_52,2
	li		imm_53,4
	mul		vReg_51,imm_52,imm_53
	addi	vReg_54,vReg_51,4
	add		vReg_55,vReg_54,vReg_45
	lw		vReg_56,0(vReg_55)
	li		imm_58,3
	li		imm_59,4
	mul		vReg_57,imm_58,imm_59
	addi	vReg_60,vReg_57,4
	add		vReg_61,vReg_60,vReg_56
	lw		vReg_62,0(vReg_61)
	add		vReg_63,vReg_60,vReg_62
	lw		vReg_64,0(vReg_63)
	sw		vReg_64,0(vReg_40)
	addi	vReg_65,this_13,8
	lw		vReg_66,0(vReg_65)
	li		imm_68,1
	li		imm_69,4
	mul		vReg_67,imm_68,imm_69
	addi	vReg_70,vReg_67,4
	add		vReg_71,vReg_70,vReg_66
	li		imm_72,0
	sw		imm_72,0(vReg_71)
	lw		vReg_73,0(vReg_65)
	lw		vReg_74,0(vReg_73)
	li		imm_75,2
	bne		vReg_74,imm_75,A_Constructor__if_then
	j		A_Constructor__if_merge_2

A_Constructor__if_merge_2:
	lui		global_tmp_76,0
	sw		countA_26,0(global_tmp_76)
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

A_Constructor__if_then:
	la		str_const_77,__str_const_1
	mv		a0,str_const_77
	call	__builtin_println
	j		A_Constructor__if_merge_2

A_Constructor__array_loop_body:
	li		imm_79,6
	li		imm_80,4
	mul		vReg_78,imm_79,imm_80
	addi	vReg_81,vReg_78,4
	mv		a0,vReg_81
	call	malloc
	mv		vReg_82,a0
	li		imm_83,6
	sw		imm_83,0(vReg_82)
	sw		vReg_82,0(vReg_49)
	addi	vReg_84,vReg_82,4
	add		vReg_85,vReg_82,vReg_81
	mv		vReg_86,vReg_84
	mv		_fresh_variable__87,vReg_86
	j		A_Constructor__array_loop_cond_2

A_Constructor__array_loop_cond_2:
	blt		vReg_86,vReg_85,A_Constructor__array_loop_body_2
	j		A_Constructor__array_loop_step_3

A_Constructor__array_loop_body_2:
	li		imm_89,6
	li		imm_90,4
	mul		vReg_88,imm_89,imm_90
	addi	vReg_91,vReg_88,4
	mv		a0,vReg_91
	call	malloc
	mv		vReg_92,a0
	li		imm_93,6
	sw		imm_93,0(vReg_92)
	sw		vReg_92,0(vReg_86)
	addi	vReg_94,vReg_92,4
	add		vReg_95,vReg_92,vReg_91
	mv		vReg_96,vReg_94
	mv		_fresh_variable__97,vReg_96
	j		A_Constructor__array_loop_cond_3

A_Constructor__array_loop_cond_3:
	blt		vReg_96,vReg_95,A_Constructor__array_loop_body_3
	j		A_Constructor__array_loop_step_2

A_Constructor__array_loop_body_3:
	li		imm_99,6
	li		imm_100,4
	mul		vReg_98,imm_99,imm_100
	addi	vReg_101,vReg_98,4
	mv		a0,vReg_101
	call	malloc
	mv		vReg_102,a0
	li		imm_103,6
	sw		imm_103,0(vReg_102)
	sw		vReg_102,0(vReg_96)
	j		A_Constructor__array_loop_step

A_Constructor__array_loop_step:
	addi	vReg_104,vReg_96,4
	mv		vReg_105,vReg_104
	mv		vReg_96,vReg_105
	mv		_fresh_variable__106,vReg_96
	j		A_Constructor__array_loop_cond_3

A_Constructor__array_loop_step_2:
	addi	vReg_107,vReg_86,4
	mv		vReg_108,vReg_107
	mv		vReg_86,vReg_108
	mv		_fresh_variable__109,vReg_86
	j		A_Constructor__array_loop_cond_2

A_Constructor__array_loop_step_3:
	addi	vReg_110,vReg_49,4
	mv		vReg_111,vReg_110
	mv		vReg_49,vReg_111
	mv		_fresh_variable__112,vReg_49
	j		A_Constructor__array_loop_cond

A_Constructor__if_then_2:
	addi	vReg_113,this_13,0
	li		imm_114,16
	mv		a0,imm_114
	call	malloc
	mv		vReg_115,a0
	lui		global_tmp_116,0
	sw		countA_19,0(global_tmp_116)
	mv		a0,vReg_115
	call	A_Constructor
	lui		global_tmp_117,0
	lw		countA_118,0(global_tmp_117)
	lui		global_tmp_119,0
	lw		countB_120,0(global_tmp_119)
	sw		vReg_115,0(vReg_113)
	li		imm_122,2
	rem		vReg_121,countB_120,imm_122
	li		imm_123,0
	beq		vReg_121,imm_123,A_Constructor__if_then_3
	j		A_Constructor__if_else_2

A_Constructor__if_else_2:
	addi	vReg_124,this_13,4
	li		imm_125,0
	sw		imm_125,0(vReg_124)
	mv		countA_26,countA_118
	mv		_fresh_variable__126,countA_26
	j		A_Constructor__if_merge

A_Constructor__if_then_3:
	addi	vReg_127,this_13,4
	li		imm_128,8
	mv		a0,imm_128
	call	malloc
	mv		vReg_129,a0
	lui		global_tmp_130,0
	sw		countA_118,0(global_tmp_130)
	mv		a0,vReg_129
	call	B_Constructor
	lui		global_tmp_131,0
	lw		countA_132,0(global_tmp_131)
	lui		global_tmp_133,0
	lw		countB_134,0(global_tmp_133)
	sw		vReg_129,0(vReg_127)
	mv		countA_26,countA_132
	mv		_fresh_variable__135,countA_26
	j		A_Constructor__if_merge


	.globl	A_getc0
	.type	A_getc0, @function
A_getc0:
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
	addi	vReg_14,this_13,8
	lw		vReg_15,0(vReg_14)
	addi	vReg_16,vReg_15,4
	lw		vReg_17,0(vReg_16)
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


	.globl	B_Constructor
	.type	B_Constructor, @function
B_Constructor:
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
	lw		countB_15,0(global_tmp_14)
	addi	vReg_16,this_13,0
	addi	countB_17,countB_15,1
	sw		countB_15,0(vReg_16)
	addi	vReg_18,this_13,4
	li		imm_19,16
	mv		a0,imm_19
	call	malloc
	mv		vReg_20,a0
	lui		global_tmp_21,0
	sw		countB_17,0(global_tmp_21)
	mv		a0,vReg_20
	call	A_Constructor
	lui		global_tmp_22,0
	lw		countB_23,0(global_tmp_22)
	mv		a0,vReg_20
	call	A_getc0
	mv		vReg_24,a0
	addi	vReg_25,vReg_24,4
	lw		vReg_26,0(vReg_25)
	mv		a0,vReg_26
	call	C_Me
	mv		vReg_27,a0
	mv		a0,vReg_27
	call	C_Me
	mv		vReg_28,a0
	sw		vReg_28,0(vReg_18)
	lui		global_tmp_29,0
	sw		countB_23,0(global_tmp_29)
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


	.globl	C_Me
	.type	C_Me, @function
C_Me:
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
	mv		a0,this_13
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


	.globl	count
	.type	count, @function
count:
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
	lw		countA_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		something_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		countC_18,0(global_tmp_17)
	lui		global_tmp_19,0
	lw		countB_20,0(global_tmp_19)
	li		imm_21,8
	mv		a0,imm_21
	call	malloc
	mv		vReg_22,a0
	lui		global_tmp_23,0
	li		imm_24,0
	sw		imm_24,0(global_tmp_23)
	lui		global_tmp_25,0
	li		imm_26,0
	sw		imm_26,0(global_tmp_25)
	mv		a0,vReg_22
	call	B_Constructor
	lui		global_tmp_27,0
	lw		countA_28,0(global_tmp_27)
	lui		global_tmp_29,0
	lw		countB_30,0(global_tmp_29)
	mv		a0,countA_28
	call	__builtin_toString
	mv		vReg_31,a0
	mv		a0,vReg_31
	la		str_const_32,__str_const_2
	mv		a1,str_const_32
	call	__builtin_string_add
	mv		vReg_33,a0
	mv		a0,countB_30
	call	__builtin_toString
	mv		vReg_34,a0
	mv		a0,vReg_33
	mv		a1,vReg_34
	call	__builtin_string_add
	mv		vReg_35,a0
	mv		a0,vReg_35
	la		str_const_36,__str_const_3
	mv		a1,str_const_36
	call	__builtin_string_add
	mv		vReg_37,a0
	mv		a0,vReg_37
	la		str_const_38,__str_const_11
	mv		a1,str_const_38
	call	__builtin_string_add
	mv		vReg_39,a0
	mv		a0,vReg_39
	call	__builtin_println
	li		imm_40,8
	mv		a0,imm_40
	call	malloc
	mv		vReg_41,a0
	lui		global_tmp_42,0
	li		imm_43,1
	sw		imm_43,0(global_tmp_42)
	lui		global_tmp_44,0
	li		imm_45,1
	sw		imm_45,0(global_tmp_44)
	mv		a0,vReg_41
	call	B_Constructor
	lui		global_tmp_46,0
	lw		countA_47,0(global_tmp_46)
	lui		global_tmp_48,0
	lw		countB_49,0(global_tmp_48)
	addi	vReg_50,countA_47,-1
	mv		a0,vReg_50
	call	__builtin_toString
	mv		vReg_51,a0
	mv		a0,vReg_51
	la		str_const_52,__str_const_4
	mv		a1,str_const_52
	call	__builtin_string_add
	mv		vReg_53,a0
	addi	vReg_54,countB_49,-1
	mv		a0,vReg_54
	call	__builtin_toString
	mv		vReg_55,a0
	mv		a0,vReg_53
	mv		a1,vReg_55
	call	__builtin_string_add
	mv		vReg_56,a0
	mv		a0,vReg_56
	la		str_const_57,__str_const_5
	mv		a1,str_const_57
	call	__builtin_string_add
	mv		vReg_58,a0
	mv		a0,vReg_58
	la		str_const_59,__str_const_12
	mv		a1,str_const_59
	call	__builtin_string_add
	mv		vReg_60,a0
	mv		a0,vReg_60
	call	__builtin_print
	la		str_const_61,__str_const_6
	mv		a0,str_const_61
	call	__builtin_print
	mv		a0,something_16
	call	C_Me
	mv		vReg_62,a0
	addi	vReg_63,vReg_62,4
	lw		vReg_64,0(vReg_63)
	addi	vReg_65,something_16,4
	lw		vReg_66,0(vReg_65)
	mv		a0,vReg_66
	call	__builtin_string_length
	mv		vReg_67,a0
	addi	vReg_68,vReg_67,-1
	mv		a0,vReg_64
	li		imm_69,1
	mv		a1,imm_69
	mv		a2,vReg_68
	call	__builtin_string_substring
	mv		vReg_70,a0
	mv		a0,vReg_70
	call	__builtin_string_parseInt
	mv		vReg_71,a0
	mv		a0,vReg_71
	call	__builtin_toString
	mv		vReg_72,a0
	mv		a0,vReg_72
	call	__builtin_println
	lw		vReg_73,0(vReg_65)
	mv		a0,vReg_73
	li		imm_74,0
	mv		a1,imm_74
	call	__builtin_string_ord
	mv		vReg_75,a0
	mv		a0,vReg_75
	call	__builtin_toString
	mv		vReg_76,a0
	lw		vReg_77,0(vReg_65)
	mv		a0,vReg_77
	mv		a1,vReg_76
	call	__builtin_string_rt
	mv		vReg_78,a0
	bne		vReg_78,zero,count__if_then
	j		count__if_else

count__if_then:
	lw		vReg_79,0(vReg_65)
	mv		a0,vReg_79
	la		str_const_80,__str_const_7
	mv		a1,str_const_80
	call	__builtin_string_add
	mv		vReg_81,a0
	mv		a0,vReg_81
	mv		a1,vReg_76
	call	__builtin_string_add
	mv		vReg_82,a0
	mv		a0,vReg_82
	call	__builtin_println
	j		count__if_merge

count__if_merge:
	lui		global_tmp_83,0
	sw		countB_49,0(global_tmp_83)
	lui		global_tmp_84,0
	li		imm_85,1
	sw		imm_85,0(global_tmp_84)
	lui		global_tmp_86,0
	sw		countA_47,0(global_tmp_86)
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

count__if_else:
	lw		vReg_87,0(vReg_65)
	mv		a0,vReg_87
	la		str_const_88,__str_const_8
	mv		a1,str_const_88
	call	__builtin_string_add
	mv		vReg_89,a0
	mv		a0,vReg_89
	mv		a1,vReg_76
	call	__builtin_string_add
	mv		vReg_90,a0
	mv		a0,vReg_90
	call	__builtin_println
	j		count__if_merge


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
	j		main__for_body

main__for_body:
	li		imm_18,891
	andi	vReg_17,imm_18,759
	xor		vReg_19,i_15,vReg_17
	xori	vReg_20,vReg_19,666
	seqz	vReg_20,vReg_20
	j		main__bool_merge

main__bool_merge:
	li		imm_21,1
	beq		vReg_20,imm_21,main__if_then
	j		main__for_step

main__for_step:
	addi	i_22,i_15,1
	mv		i_15,i_22
	mv		_fresh_variable__23,i_15
	j		main__for_body

main__if_then:
	mv		a0,i_15
	call	__builtin_toString
	mv		vReg_24,a0
	mv		a0,vReg_24
	call	__builtin_println
	li		imm_25,0
	mv		a0,imm_25
	call	__builtin_toString
	mv		vReg_26,a0
	mv		a0,vReg_26
	call	__builtin_println
	li		imm_27,1
	mv		a0,imm_27
	call	__builtin_toString
	mv		vReg_28,a0
	mv		a0,vReg_28
	call	__builtin_println
	call	count
	j		main__while_body

main__while_body:
	li		imm_30,2
	rem		vReg_29,i_15,imm_30
	li		imm_31,0
	beq		vReg_29,imm_31,main__while_body
	j		main__if_merge

main__if_merge:
	mv		a0,i_15
	call	__builtin_toString
	mv		vReg_32,a0
	mv		a0,vReg_32
	la		str_const_33,__str_const_9
	mv		a1,str_const_33
	call	__builtin_string_add
	mv		vReg_34,a0
	mv		a0,vReg_34
	call	__builtin_print
	j		main__while_body


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


