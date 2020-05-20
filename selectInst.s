	.data

	.globl	__str_const_1
__str_const_1:
	.string	 

	.globl	__str_const_2
__str_const_2:
	.string	 

	.globl	A
A:
	.zero	4

	.globl	B
B:
	.zero	4

	.globl	C
C:
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
	lui		global_tmp_13,0
	lw		C_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		B_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		A_18,0(global_tmp_17)
	mv		B_19,B_16
	mv		C_20,C_14
	mv		A_21,A_18
	j		main__while_cond

main__while_cond:
	li		imm_22,536870912
	blt		C_20,imm_22,main__lhs_and_then
	j		main__while_merge

main__while_merge:
	mv		a0,A_21
	call	__builtin_toString
	mv		vReg_23,a0
	mv		a0,vReg_23
	la		str_const_24,__str_const_1
	mv		a1,str_const_24
	call	__builtin_string_add
	mv		vReg_25,a0
	mv		a0,B_19
	call	__builtin_toString
	mv		vReg_26,a0
	mv		a0,vReg_25
	mv		a1,vReg_26
	call	__builtin_string_add
	mv		vReg_27,a0
	mv		a0,vReg_27
	la		str_const_28,__str_const_2
	mv		a1,str_const_28
	call	__builtin_string_add
	mv		vReg_29,a0
	mv		a0,C_20
	call	__builtin_toString
	mv		vReg_30,a0
	mv		a0,vReg_29
	mv		a1,vReg_30
	call	__builtin_string_add
	mv		vReg_31,a0
	mv		a0,vReg_31
	call	__builtin_println
	lui		global_tmp_32,0
	sw		A_21,0(global_tmp_32)
	lui		global_tmp_33,0
	sw		B_19,0(global_tmp_33)
	lui		global_tmp_34,0
	sw		C_20,0(global_tmp_34)
	li		imm_35,0
	mv		a0,imm_35
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

main__lhs_and_then:
	li		imm_36,-536870912
	bgt		C_20,imm_36,main__while_body
	j		main__while_merge

main__while_body:
	sub		vReg_37,C_20,A_21
	add		vReg_38,vReg_37,B_19
	add		vReg_39,A_21,B_19
	sub		vReg_40,vReg_38,vReg_39
	add		vReg_41,vReg_40,vReg_40
	add		vReg_42,vReg_40,vReg_38
	add		vReg_43,vReg_41,vReg_42
	add		vReg_44,vReg_39,vReg_38
	sub		vReg_45,vReg_44,vReg_39
	add		vReg_46,vReg_45,vReg_42
	sub		vReg_47,vReg_43,vReg_46
	sub		vReg_48,vReg_44,vReg_44
	sub		vReg_49,vReg_48,vReg_45
	sub		vReg_50,vReg_42,vReg_45
	add		vReg_51,vReg_49,vReg_50
	sub		vReg_52,vReg_47,vReg_51
	sub		vReg_53,vReg_46,vReg_46
	sub		vReg_54,vReg_47,vReg_53
	add		vReg_55,vReg_52,vReg_54
	add		vReg_56,vReg_50,vReg_50
	add		vReg_57,vReg_51,vReg_56
	add		vReg_58,vReg_57,vReg_54
	sub		vReg_59,vReg_55,vReg_58
	mv		A_60,vReg_59
	sub		vReg_61,C_20,vReg_59
	add		vReg_62,vReg_61,B_19
	add		vReg_63,vReg_59,B_19
	sub		vReg_64,vReg_62,vReg_63
	add		vReg_65,vReg_64,vReg_64
	add		vReg_66,vReg_64,vReg_62
	add		vReg_67,vReg_65,vReg_66
	add		vReg_68,vReg_63,vReg_62
	sub		vReg_69,vReg_68,vReg_63
	add		vReg_70,vReg_69,vReg_66
	sub		vReg_71,vReg_67,vReg_70
	sub		vReg_72,vReg_68,vReg_68
	sub		vReg_73,vReg_72,vReg_69
	sub		vReg_74,vReg_66,vReg_69
	add		vReg_75,vReg_73,vReg_74
	sub		vReg_76,vReg_71,vReg_75
	sub		vReg_77,vReg_70,vReg_70
	sub		vReg_78,vReg_71,vReg_77
	add		vReg_79,vReg_76,vReg_78
	add		vReg_80,vReg_74,vReg_74
	add		vReg_81,vReg_75,vReg_80
	add		vReg_82,vReg_81,vReg_78
	sub		vReg_83,vReg_79,vReg_82
	mv		B_84,vReg_83
	add		vReg_85,vReg_61,vReg_83
	add		vReg_86,vReg_59,vReg_83
	sub		vReg_87,vReg_85,vReg_86
	add		vReg_88,vReg_87,vReg_87
	add		vReg_89,vReg_87,vReg_85
	add		vReg_90,vReg_88,vReg_89
	add		vReg_91,vReg_86,vReg_85
	sub		vReg_92,vReg_91,vReg_86
	add		vReg_93,vReg_92,vReg_89
	sub		vReg_94,vReg_90,vReg_93
	sub		vReg_95,vReg_91,vReg_91
	sub		vReg_96,vReg_95,vReg_92
	sub		vReg_97,vReg_89,vReg_92
	add		vReg_98,vReg_96,vReg_97
	sub		vReg_99,vReg_94,vReg_98
	sub		vReg_100,vReg_93,vReg_93
	sub		vReg_101,vReg_94,vReg_100
	add		vReg_102,vReg_99,vReg_101
	add		vReg_103,vReg_97,vReg_97
	add		vReg_104,vReg_98,vReg_103
	add		vReg_105,vReg_104,vReg_101
	sub		vReg_106,vReg_102,vReg_105
	mv		C_107,vReg_106
	mv		B_19,B_84
	mv		C_20,C_107
	mv		A_21,A_60
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
	lui		global_tmp_13,0
	li		imm_14,1
	sw		imm_14,0(global_tmp_13)
	lui		global_tmp_15,0
	li		imm_16,1
	sw		imm_16,0(global_tmp_15)
	lui		global_tmp_17,0
	li		imm_18,1
	sw		imm_18,0(global_tmp_17)
	call	_main
	mv		vReg_19,a0
	mv		a0,vReg_19
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


