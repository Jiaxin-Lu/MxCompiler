	.data

	.globl	__str_const_1
__str_const_1:
	.string	: 

	.globl	root
root:
	.zero	4

	.globl	MAX
MAX:
	.zero	4

	.globl	MaxRandInt
MaxRandInt:
	.zero	4

	.globl	seed
seed:
	.zero	4


	.text

	.globl	insertImpl
	.type	insertImpl, @function
insertImpl:
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
	mv		cur_13,a0
	mv		pnt_14,a1
	mv		childId_15,a2
	mv		key_16,a3
	beq		cur_13,zero,insertImpl_split_block
	j		insertImpl__if_merge

insertImpl_split_block:
	li		imm_17,16
	mv		a0,imm_17
	call	malloc
	mv		vReg_18,a0
	addi	vReg_19,vReg_18,4
	li		imm_20,12
	mv		a0,imm_20
	call	malloc
	mv		vReg_21,a0
	li		imm_22,2
	sw		imm_22,0(vReg_21)
	sw		vReg_21,0(vReg_19)
	addi	vReg_23,vReg_18,8
	sw		key_16,0(vReg_23)
	addi	vReg_24,vReg_18,12
	li		imm_25,1
	sw		imm_25,0(vReg_24)
	addi	vReg_26,vReg_18,0
	sw		pnt_14,0(vReg_26)
	lw		vReg_27,0(vReg_19)
	addi	vReg_28,vReg_27,4
	li		imm_29,0
	sw		imm_29,0(vReg_28)
	lw		vReg_30,0(vReg_19)
	addi	vReg_31,vReg_30,8
	li		imm_32,0
	sw		imm_32,0(vReg_31)
	addi	vReg_33,pnt_14,4
	lw		vReg_34,0(vReg_33)
	li		imm_36,4
	mul		vReg_35,childId_15,imm_36
	addi	vReg_37,vReg_35,4
	add		vReg_38,vReg_37,vReg_34
	sw		vReg_18,0(vReg_38)
	li		imm_40,0
	mv		returnVal_39,imm_40
	mv		returnVal_41,returnVal_39
	j		insertImpl_exit

insertImpl_exit:
	mv		a0,returnVal_41
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

insertImpl__if_merge:
	addi	vReg_42,cur_13,8
	lw		vReg_43,0(vReg_42)
	beq		vReg_43,key_16,insertImpl__if_then_2
	j		insertImpl__if_merge_2

insertImpl__if_merge_2:
	li		imm_45,0
	mv		id_44,imm_45
	lw		vReg_46,0(vReg_42)
	blt		vReg_46,key_16,insertImpl__if_then
	j		insertImpl__parallel_copy_

insertImpl__parallel_copy_:
	mv		id_47,id_44
	j		insertImpl__if_merge_3

insertImpl__if_merge_3:
	addi	vReg_48,cur_13,4
	lw		vReg_49,0(vReg_48)
	li		imm_51,4
	mul		vReg_50,id_47,imm_51
	addi	vReg_52,vReg_50,4
	add		vReg_53,vReg_52,vReg_49
	lw		vReg_54,0(vReg_53)
	beq		vReg_54,zero,insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	vReg_55,vReg_54,8
	lw		vReg_56,0(vReg_55)
	beq		vReg_56,key_16,insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		imm_58,0
	mv		id_57,imm_58
	lw		vReg_59,0(vReg_55)
	blt		vReg_59,key_16,insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl__parallel_copy__4

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		imm_61,1
	mv		id_60,imm_61
	mv		id_62,id_60
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	vReg_63,vReg_54,4
	lw		vReg_64,0(vReg_63)
	li		imm_66,4
	mul		vReg_65,id_62,imm_66
	addi	vReg_67,vReg_65,4
	add		vReg_68,vReg_67,vReg_64
	lw		vReg_69,0(vReg_68)
	beq		vReg_69,zero,insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		imm_70,16
	mv		a0,imm_70
	call	malloc
	mv		vReg_71,a0
	addi	vReg_72,vReg_71,4
	li		imm_73,12
	mv		a0,imm_73
	call	malloc
	mv		vReg_74,a0
	li		imm_75,2
	sw		imm_75,0(vReg_74)
	sw		vReg_74,0(vReg_72)
	addi	vReg_76,vReg_71,8
	sw		key_16,0(vReg_76)
	addi	vReg_77,vReg_71,12
	li		imm_78,1
	sw		imm_78,0(vReg_77)
	addi	vReg_79,vReg_71,0
	sw		vReg_54,0(vReg_79)
	lw		vReg_80,0(vReg_72)
	addi	vReg_81,vReg_80,4
	li		imm_82,0
	sw		imm_82,0(vReg_81)
	lw		vReg_83,0(vReg_72)
	addi	vReg_84,vReg_83,8
	li		imm_85,0
	sw		imm_85,0(vReg_84)
	lw		vReg_86,0(vReg_63)
	add		vReg_87,vReg_67,vReg_86
	sw		vReg_71,0(vReg_87)
	li		imm_89,0
	mv		returnVal_88,imm_89
	mv		returnVal_90,returnVal_88
	j		insertImpl_split_block_2

insertImpl_split_block_2:
	mv		returnVal_91,returnVal_90
	mv		returnVal_92,returnVal_91
	j		insertImpl_split_block_3

insertImpl_split_block_3:
	mv		returnVal_93,returnVal_92
	mv		returnVal_41,returnVal_93
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	vReg_94,vReg_69,8
	lw		vReg_95,0(vReg_94)
	beq		vReg_95,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	vReg_96,vReg_69,12
	lw		vReg_97,0(vReg_96)
	addi	vReg_98,vReg_97,1
	sw		vReg_98,0(vReg_96)
	li		imm_100,1
	mv		returnVal_99,imm_100
	mv		returnVal_90,returnVal_99
	j		insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		imm_102,0
	mv		id_101,imm_102
	lw		vReg_103,0(vReg_94)
	blt		vReg_103,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl__parallel_copy__2

insertImpl__parallel_copy__2:
	mv		id_104,id_101
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	vReg_105,vReg_69,4
	lw		vReg_106,0(vReg_105)
	li		imm_108,4
	mul		vReg_107,id_104,imm_108
	addi	vReg_109,vReg_107,4
	add		vReg_110,vReg_109,vReg_106
	lw		vReg_111,0(vReg_110)
	beq		vReg_111,zero,insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		imm_112,16
	mv		a0,imm_112
	call	malloc
	mv		vReg_113,a0
	addi	vReg_114,vReg_113,4
	li		imm_115,12
	mv		a0,imm_115
	call	malloc
	mv		vReg_116,a0
	li		imm_117,2
	sw		imm_117,0(vReg_116)
	sw		vReg_116,0(vReg_114)
	addi	vReg_118,vReg_113,8
	sw		key_16,0(vReg_118)
	addi	vReg_119,vReg_113,12
	li		imm_120,1
	sw		imm_120,0(vReg_119)
	addi	vReg_121,vReg_113,0
	sw		vReg_69,0(vReg_121)
	lw		vReg_122,0(vReg_114)
	addi	vReg_123,vReg_122,4
	li		imm_124,0
	sw		imm_124,0(vReg_123)
	lw		vReg_125,0(vReg_114)
	addi	vReg_126,vReg_125,8
	li		imm_127,0
	sw		imm_127,0(vReg_126)
	lw		vReg_128,0(vReg_105)
	add		vReg_129,vReg_109,vReg_128
	sw		vReg_113,0(vReg_129)
	li		imm_131,0
	mv		returnVal_130,imm_131
	mv		returnVal_132,returnVal_130
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2:
	mv		returnVal_133,returnVal_132
	mv		returnVal_90,returnVal_133
	j		insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	vReg_134,vReg_111,8
	lw		vReg_135,0(vReg_134)
	beq		vReg_135,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		imm_137,0
	mv		id_136,imm_137
	lw		vReg_138,0(vReg_134)
	blt		vReg_138,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl__parallel_copy__3

insertImpl__parallel_copy__3:
	mv		id_139,id_136
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	vReg_140,vReg_111,4
	lw		vReg_141,0(vReg_140)
	li		imm_143,4
	mul		vReg_142,id_139,imm_143
	addi	vReg_144,vReg_142,4
	add		vReg_145,vReg_144,vReg_141
	lw		vReg_146,0(vReg_145)
	mv		a0,vReg_146
	mv		a1,vReg_111
	mv		a2,id_139
	mv		a3,key_16
	call	insertImpl
	mv		vReg_147,a0
	mv		returnVal_148,vReg_147
	mv		returnVal_132,returnVal_148
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		imm_150,1
	mv		id_149,imm_150
	mv		id_139,id_149
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	vReg_151,vReg_111,12
	lw		vReg_152,0(vReg_151)
	addi	vReg_153,vReg_152,1
	sw		vReg_153,0(vReg_151)
	li		imm_155,1
	mv		returnVal_154,imm_155
	mv		returnVal_132,returnVal_154
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		imm_157,1
	mv		id_156,imm_157
	mv		id_104,id_156
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl__parallel_copy__4:
	mv		id_62,id_57
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	vReg_158,vReg_54,12
	lw		vReg_159,0(vReg_158)
	addi	vReg_160,vReg_159,1
	sw		vReg_160,0(vReg_158)
	li		imm_162,1
	mv		returnVal_161,imm_162
	mv		returnVal_92,returnVal_161
	j		insertImpl_split_block_3

insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		imm_163,16
	mv		a0,imm_163
	call	malloc
	mv		vReg_164,a0
	addi	vReg_165,vReg_164,4
	li		imm_166,12
	mv		a0,imm_166
	call	malloc
	mv		vReg_167,a0
	li		imm_168,2
	sw		imm_168,0(vReg_167)
	sw		vReg_167,0(vReg_165)
	addi	vReg_169,vReg_164,8
	sw		key_16,0(vReg_169)
	addi	vReg_170,vReg_164,12
	li		imm_171,1
	sw		imm_171,0(vReg_170)
	addi	vReg_172,vReg_164,0
	sw		cur_13,0(vReg_172)
	lw		vReg_173,0(vReg_165)
	addi	vReg_174,vReg_173,4
	li		imm_175,0
	sw		imm_175,0(vReg_174)
	lw		vReg_176,0(vReg_165)
	addi	vReg_177,vReg_176,8
	li		imm_178,0
	sw		imm_178,0(vReg_177)
	lw		vReg_179,0(vReg_48)
	add		vReg_180,vReg_52,vReg_179
	sw		vReg_164,0(vReg_180)
	li		imm_182,0
	mv		returnVal_181,imm_182
	mv		returnVal_92,returnVal_181
	j		insertImpl_split_block_3

insertImpl__if_then:
	li		imm_184,1
	mv		id_183,imm_184
	mv		id_47,id_183
	j		insertImpl__if_merge_3

insertImpl__if_then_2:
	addi	vReg_185,cur_13,12
	lw		vReg_186,0(vReg_185)
	addi	vReg_187,vReg_186,1
	sw		vReg_187,0(vReg_185)
	li		imm_189,1
	mv		returnVal_188,imm_189
	mv		returnVal_41,returnVal_188
	j		insertImpl_exit


	.globl	findLargest
	.type	findLargest, @function
findLargest:
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
	mv		cur_13,a0
	addi	vReg_14,cur_13,4
	lw		vReg_15,0(vReg_14)
	addi	vReg_16,vReg_15,8
	lw		vReg_17,0(vReg_16)
	beq		vReg_17,zero,findLargest__if_then
	j		findLargest__if_merge

findLargest__if_then:
	mv		returnVal_18,cur_13
	mv		returnVal_19,returnVal_18
	j		findLargest_exit

findLargest_exit:
	mv		a0,returnVal_19
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

findLargest__if_merge:
	lw		vReg_20,0(vReg_14)
	addi	vReg_21,vReg_20,8
	lw		vReg_22,0(vReg_21)
	addi	vReg_23,vReg_22,4
	lw		vReg_24,0(vReg_23)
	addi	vReg_25,vReg_24,8
	lw		vReg_26,0(vReg_25)
	beq		vReg_26,zero,findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_27,0(vReg_23)
	addi	vReg_28,vReg_27,8
	lw		vReg_29,0(vReg_28)
	addi	vReg_30,vReg_29,4
	lw		vReg_31,0(vReg_30)
	addi	vReg_32,vReg_31,8
	lw		vReg_33,0(vReg_32)
	beq		vReg_33,zero,findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_34,vReg_29
	mv		returnVal_35,returnVal_34
	j		findLargest_split_block

findLargest_split_block:
	mv		returnVal_36,returnVal_35
	mv		returnVal_37,returnVal_36
	j		findLargest_split_block_2

findLargest_split_block_2:
	mv		returnVal_38,returnVal_37
	mv		returnVal_19,returnVal_38
	j		findLargest_exit

findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_39,0(vReg_30)
	addi	vReg_40,vReg_39,8
	lw		vReg_41,0(vReg_40)
	addi	vReg_42,vReg_41,4
	lw		vReg_43,0(vReg_42)
	addi	vReg_44,vReg_43,8
	lw		vReg_45,0(vReg_44)
	beq		vReg_45,zero,findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_46,vReg_41
	mv		returnVal_47,returnVal_46
	j		findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_48,returnVal_47
	mv		returnVal_35,returnVal_48
	j		findLargest_split_block

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_49,0(vReg_42)
	addi	vReg_50,vReg_49,8
	lw		vReg_51,0(vReg_50)
	addi	vReg_52,vReg_51,4
	lw		vReg_53,0(vReg_52)
	addi	vReg_54,vReg_53,8
	lw		vReg_55,0(vReg_54)
	beq		vReg_55,zero,findLargest_fake_fake_findLargest_3_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest__if_then:
	mv		returnVal_56,vReg_51
	mv		returnVal_57,returnVal_56
	j		findLargest_split_block_3

findLargest_split_block_3:
	mv		returnVal_58,returnVal_57
	mv		returnVal_47,returnVal_58
	j		findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		vReg_59,0(vReg_52)
	addi	vReg_60,vReg_59,8
	lw		vReg_61,0(vReg_60)
	addi	vReg_62,vReg_61,4
	lw		vReg_63,0(vReg_62)
	addi	vReg_64,vReg_63,8
	lw		vReg_65,0(vReg_64)
	beq		vReg_65,zero,findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_66,0(vReg_62)
	addi	vReg_67,vReg_66,8
	lw		vReg_68,0(vReg_67)
	addi	vReg_69,vReg_68,4
	lw		vReg_70,0(vReg_69)
	addi	vReg_71,vReg_70,8
	lw		vReg_72,0(vReg_71)
	beq		vReg_72,zero,findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_73,vReg_68
	mv		returnVal_74,returnVal_73
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest_split_block:
	mv		returnVal_75,returnVal_74
	mv		returnVal_76,returnVal_75
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_3_findLargest_split_block_2:
	mv		returnVal_77,returnVal_76
	mv		returnVal_57,returnVal_77
	j		findLargest_split_block_3

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_78,0(vReg_69)
	addi	vReg_79,vReg_78,8
	lw		vReg_80,0(vReg_79)
	addi	vReg_81,vReg_80,4
	lw		vReg_82,0(vReg_81)
	addi	vReg_83,vReg_82,8
	lw		vReg_84,0(vReg_83)
	beq		vReg_84,zero,findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_85,0(vReg_81)
	addi	vReg_86,vReg_85,8
	lw		vReg_87,0(vReg_86)
	addi	vReg_88,vReg_87,4
	lw		vReg_89,0(vReg_88)
	addi	vReg_90,vReg_89,8
	lw		vReg_91,0(vReg_90)
	beq		vReg_91,zero,findLargest_fake_fake_findLargest_4_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest__if_then:
	mv		returnVal_92,vReg_87
	mv		returnVal_93,returnVal_92
	j		findLargest_split_block_4

findLargest_split_block_4:
	mv		returnVal_94,returnVal_93
	mv		returnVal_95,returnVal_94
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_96,returnVal_95
	mv		returnVal_74,returnVal_96
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		vReg_97,0(vReg_88)
	addi	vReg_98,vReg_97,8
	lw		vReg_99,0(vReg_98)
	addi	vReg_100,vReg_99,4
	lw		vReg_101,0(vReg_100)
	addi	vReg_102,vReg_101,8
	lw		vReg_103,0(vReg_102)
	beq		vReg_103,zero,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_104,vReg_99
	mv		returnVal_105,returnVal_104
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_split_block:
	mv		returnVal_106,returnVal_105
	mv		returnVal_93,returnVal_106
	j		findLargest_split_block_4

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_107,0(vReg_100)
	addi	vReg_108,vReg_107,8
	lw		vReg_109,0(vReg_108)
	addi	vReg_110,vReg_109,4
	lw		vReg_111,0(vReg_110)
	addi	vReg_112,vReg_111,8
	lw		vReg_113,0(vReg_112)
	beq		vReg_113,zero,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_114,0(vReg_110)
	addi	vReg_115,vReg_114,8
	lw		vReg_116,0(vReg_115)
	addi	vReg_117,vReg_116,4
	lw		vReg_118,0(vReg_117)
	addi	vReg_119,vReg_118,8
	lw		vReg_120,0(vReg_119)
	beq		vReg_120,zero,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_121,0(vReg_117)
	addi	vReg_122,vReg_121,8
	lw		vReg_123,0(vReg_122)
	addi	vReg_124,vReg_123,4
	lw		vReg_125,0(vReg_124)
	addi	vReg_126,vReg_125,8
	lw		vReg_127,0(vReg_126)
	beq		vReg_127,zero,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		vReg_128,0(vReg_124)
	addi	vReg_129,vReg_128,8
	lw		vReg_130,0(vReg_129)
	addi	vReg_131,vReg_130,4
	lw		vReg_132,0(vReg_131)
	addi	vReg_133,vReg_132,8
	lw		vReg_134,0(vReg_133)
	beq		vReg_134,zero,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_135,0(vReg_131)
	addi	vReg_136,vReg_135,8
	lw		vReg_137,0(vReg_136)
	addi	vReg_138,vReg_137,4
	lw		vReg_139,0(vReg_138)
	addi	vReg_140,vReg_139,8
	lw		vReg_141,0(vReg_140)
	beq		vReg_141,zero,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_142,0(vReg_138)
	addi	vReg_143,vReg_142,8
	lw		vReg_144,0(vReg_143)
	addi	vReg_145,vReg_144,4
	lw		vReg_146,0(vReg_145)
	addi	vReg_147,vReg_146,8
	lw		vReg_148,0(vReg_147)
	beq		vReg_148,zero,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_149,vReg_144
	mv		returnVal_150,returnVal_149
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_151,returnVal_150
	mv		returnVal_152,returnVal_151
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block:
	mv		returnVal_153,returnVal_152
	mv		returnVal_154,returnVal_153
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block_2:
	mv		returnVal_155,returnVal_154
	mv		returnVal_156,returnVal_155
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_split_block_2:
	mv		returnVal_157,returnVal_156
	mv		returnVal_158,returnVal_157
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_159,returnVal_158
	mv		returnVal_160,returnVal_159
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_3

findLargest_fake_fake_findLargest_4_findLargest_split_block_3:
	mv		returnVal_161,returnVal_160
	mv		returnVal_105,returnVal_161
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_162,0(vReg_145)
	addi	vReg_163,vReg_162,8
	lw		vReg_164,0(vReg_163)
	mv		a0,vReg_164
	call	findLargest
	mv		vReg_165,a0
	mv		returnVal_166,vReg_165
	mv		returnVal_150,returnVal_166
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_167,vReg_137
	mv		returnVal_152,returnVal_167
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_168,vReg_130
	mv		returnVal_154,returnVal_168
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_then:
	mv		returnVal_169,vReg_123
	mv		returnVal_156,returnVal_169
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_170,vReg_116
	mv		returnVal_158,returnVal_170
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_171,vReg_109
	mv		returnVal_160,returnVal_171
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_3

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_172,vReg_80
	mv		returnVal_95,returnVal_172
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_173,vReg_61
	mv		returnVal_76,returnVal_173
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_174,vReg_22
	mv		returnVal_37,returnVal_174
	j		findLargest_split_block_2


	.globl	eraseImpl
	.type	eraseImpl, @function
eraseImpl:
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
	mv		cur_13,a0
	mv		pnt_14,a1
	mv		childId_15,a2
	mv		key_16,a3
	lui		global_tmp_17,0
	lw		root_18,0(global_tmp_17)
	beq		cur_13,zero,eraseImpl__if_then
	j		eraseImpl__if_merge

eraseImpl__if_then:
	li		imm_20,0
	mv		returnVal_19,imm_20
	mv		root_21,root_18
	mv		returnVal_22,returnVal_19
	j		eraseImpl_exit

eraseImpl_exit:
	lui		global_tmp_23,0
	sw		root_21,0(global_tmp_23)
	mv		a0,returnVal_22
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

eraseImpl__if_merge:
	addi	vReg_24,cur_13,8
	lw		vReg_25,0(vReg_24)
	bgt		vReg_25,key_16,eraseImpl__if_then_14
	j		eraseImpl__if_merge_2

eraseImpl__if_merge_2:
	lw		vReg_26,0(vReg_24)
	blt		vReg_26,key_16,eraseImpl__if_then_13
	j		eraseImpl__if_merge_3

eraseImpl__if_merge_3:
	addi	vReg_27,cur_13,12
	lw		vReg_28,0(vReg_27)
	addi	vReg_29,vReg_28,-1
	sw		vReg_29,0(vReg_27)
	lw		vReg_30,0(vReg_27)
	bgt		vReg_30,zero,eraseImpl__if_then_2
	j		eraseImpl__if_merge_4

eraseImpl__if_then_2:
	li		imm_32,1
	mv		returnVal_31,imm_32
	mv		root_21,root_18
	mv		returnVal_22,returnVal_31
	j		eraseImpl_exit

eraseImpl__if_merge_4:
	addi	vReg_33,cur_13,4
	lw		vReg_34,0(vReg_33)
	addi	vReg_35,vReg_34,4
	lw		vReg_36,0(vReg_35)
	beq		vReg_36,zero,eraseImpl__if_then_3
	j		eraseImpl__if_merge_8

eraseImpl__if_then_3:
	bne		pnt_14,zero,eraseImpl__if_then_4
	j		eraseImpl__if_merge_5

eraseImpl__if_then_4:
	addi	vReg_37,pnt_14,4
	lw		vReg_38,0(vReg_37)
	li		imm_40,4
	mul		vReg_39,childId_15,imm_40
	addi	vReg_41,vReg_39,4
	add		vReg_42,vReg_41,vReg_38
	lw		vReg_43,0(vReg_33)
	addi	vReg_44,vReg_43,8
	lw		vReg_45,0(vReg_44)
	sw		vReg_45,0(vReg_42)
	j		eraseImpl__if_merge_5

eraseImpl__if_merge_5:
	addi	vReg_46,cur_13,4
	lw		vReg_47,0(vReg_46)
	addi	vReg_48,vReg_47,8
	lw		vReg_49,0(vReg_48)
	bne		vReg_49,zero,eraseImpl__if_then_6
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_6:
	addi	vReg_50,root_18,8
	lw		vReg_51,0(vReg_50)
	beq		key_16,vReg_51,eraseImpl__if_then_5
	j		eraseImpl__parallel_copy_

eraseImpl__parallel_copy_:
	mv		root_52,root_18
	j		eraseImpl__if_merge_7

eraseImpl__if_merge_7:
	li		imm_54,1
	mv		returnVal_53,imm_54
	mv		root_21,root_52
	mv		returnVal_22,returnVal_53
	j		eraseImpl_exit

eraseImpl__if_then_5:
	addi	vReg_55,cur_13,4
	lw		vReg_56,0(vReg_55)
	addi	vReg_57,vReg_56,8
	lw		vReg_58,0(vReg_57)
	mv		root_59,vReg_58
	mv		root_52,root_59
	j		eraseImpl__if_merge_7

eraseImpl__if_then_6:
	lw		vReg_60,0(vReg_46)
	addi	vReg_61,vReg_60,8
	lw		vReg_62,0(vReg_61)
	addi	vReg_63,vReg_62,0
	sw		pnt_14,0(vReg_63)
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_8:
	lw		vReg_64,0(vReg_33)
	addi	vReg_65,vReg_64,4
	lw		vReg_66,0(vReg_65)
	addi	vReg_67,vReg_66,4
	lw		vReg_68,0(vReg_67)
	addi	vReg_69,vReg_68,8
	lw		vReg_70,0(vReg_69)
	beq		vReg_70,zero,eraseImpl_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_71,0(vReg_67)
	addi	vReg_72,vReg_71,8
	lw		vReg_73,0(vReg_72)
	addi	vReg_74,vReg_73,4
	lw		vReg_75,0(vReg_74)
	addi	vReg_76,vReg_75,8
	lw		vReg_77,0(vReg_76)
	beq		vReg_77,zero,eraseImpl_fake_fake_findLargest_2_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_78,0(vReg_74)
	addi	vReg_79,vReg_78,8
	lw		vReg_80,0(vReg_79)
	addi	vReg_81,vReg_80,4
	lw		vReg_82,0(vReg_81)
	addi	vReg_83,vReg_82,8
	lw		vReg_84,0(vReg_83)
	beq		vReg_84,zero,eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_85,vReg_80
	mv		returnVal_86,returnVal_85
	j		eraseImpl_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_87,returnVal_86
	mv		returnVal_88,returnVal_87
	j		eraseImpl_split_block

eraseImpl_split_block:
	mv		returnVal_89,returnVal_88
	mv		returnVal_90,returnVal_89
	j		eraseImpl_split_block_2

eraseImpl_split_block_2:
	addi	vReg_91,root_18,8
	lw		vReg_92,0(vReg_91)
	beq		key_16,vReg_92,eraseImpl__if_then_12
	j		eraseImpl__parallel_copy__2

eraseImpl__parallel_copy__2:
	mv		root_93,root_18
	j		eraseImpl__if_merge_9

eraseImpl__if_merge_9:
	addi	vReg_94,returnVal_90,8
	addi	vReg_95,cur_13,4
	lw		vReg_96,0(vReg_95)
	addi	vReg_97,vReg_96,4
	lw		vReg_98,0(vReg_97)
	addi	vReg_99,vReg_98,8
	lw		vReg_100,0(vReg_94)
	lw		vReg_101,0(vReg_99)
	bne		vReg_100,vReg_101,eraseImpl__if_then_10
	j		eraseImpl__if_merge_10

eraseImpl__if_merge_10:
	bne		pnt_14,zero,eraseImpl__if_then_9
	j		eraseImpl__if_merge_11

eraseImpl__if_merge_11:
	addi	vReg_102,returnVal_90,0
	sw		pnt_14,0(vReg_102)
	addi	vReg_103,returnVal_90,4
	lw		vReg_104,0(vReg_103)
	addi	vReg_105,vReg_104,8
	addi	vReg_106,cur_13,4
	lw		vReg_107,0(vReg_106)
	addi	vReg_108,vReg_107,8
	lw		vReg_109,0(vReg_108)
	sw		vReg_109,0(vReg_105)
	lw		vReg_110,0(vReg_106)
	addi	vReg_111,vReg_110,8
	lw		vReg_112,0(vReg_111)
	bne		vReg_112,zero,eraseImpl__if_then_8
	j		eraseImpl__if_merge_12

eraseImpl__if_merge_12:
	addi	vReg_113,returnVal_90,8
	addi	vReg_114,cur_13,4
	lw		vReg_115,0(vReg_114)
	addi	vReg_116,vReg_115,4
	lw		vReg_117,0(vReg_116)
	addi	vReg_118,vReg_117,8
	lw		vReg_119,0(vReg_113)
	lw		vReg_120,0(vReg_118)
	bne		vReg_119,vReg_120,eraseImpl__if_then_7
	j		eraseImpl__if_merge_13

eraseImpl__if_merge_13:
	li		imm_122,1
	mv		returnVal_121,imm_122
	mv		root_21,root_93
	mv		returnVal_22,returnVal_121
	j		eraseImpl_exit

eraseImpl__if_then_7:
	addi	vReg_123,returnVal_90,4
	lw		vReg_124,0(vReg_123)
	addi	vReg_125,vReg_124,4
	lw		vReg_126,0(vReg_114)
	addi	vReg_127,vReg_126,4
	lw		vReg_128,0(vReg_127)
	sw		vReg_128,0(vReg_125)
	lw		vReg_129,0(vReg_114)
	addi	vReg_130,vReg_129,4
	lw		vReg_131,0(vReg_130)
	addi	vReg_132,vReg_131,0
	sw		returnVal_90,0(vReg_132)
	j		eraseImpl__if_merge_13

eraseImpl__if_then_8:
	lw		vReg_133,0(vReg_106)
	addi	vReg_134,vReg_133,8
	lw		vReg_135,0(vReg_134)
	addi	vReg_136,vReg_135,0
	sw		returnVal_90,0(vReg_136)
	j		eraseImpl__if_merge_12

eraseImpl__if_then_9:
	addi	vReg_137,pnt_14,4
	lw		vReg_138,0(vReg_137)
	li		imm_140,4
	mul		vReg_139,childId_15,imm_140
	addi	vReg_141,vReg_139,4
	add		vReg_142,vReg_141,vReg_138
	sw		returnVal_90,0(vReg_142)
	j		eraseImpl__if_merge_11

eraseImpl__if_then_10:
	addi	vReg_143,returnVal_90,0
	lw		vReg_144,0(vReg_143)
	addi	vReg_145,vReg_144,4
	lw		vReg_146,0(vReg_145)
	addi	vReg_147,vReg_146,8
	addi	vReg_148,returnVal_90,4
	lw		vReg_149,0(vReg_148)
	addi	vReg_150,vReg_149,4
	lw		vReg_151,0(vReg_150)
	sw		vReg_151,0(vReg_147)
	lw		vReg_152,0(vReg_148)
	addi	vReg_153,vReg_152,4
	lw		vReg_154,0(vReg_153)
	bne		vReg_154,zero,eraseImpl__if_then_11
	j		eraseImpl__if_merge_10

eraseImpl__if_then_11:
	lw		vReg_155,0(vReg_148)
	addi	vReg_156,vReg_155,4
	lw		vReg_157,0(vReg_156)
	addi	vReg_158,vReg_157,0
	lw		vReg_159,0(vReg_143)
	sw		vReg_159,0(vReg_158)
	j		eraseImpl__if_merge_10

eraseImpl__if_then_12:
	mv		root_160,returnVal_90
	mv		root_93,root_160
	j		eraseImpl__if_merge_9

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_161,0(vReg_81)
	addi	vReg_162,vReg_161,8
	lw		vReg_163,0(vReg_162)
	addi	vReg_164,vReg_163,4
	lw		vReg_165,0(vReg_164)
	addi	vReg_166,vReg_165,8
	lw		vReg_167,0(vReg_166)
	beq		vReg_167,zero,eraseImpl_fake_fake_findLargest_3_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest__if_then:
	mv		returnVal_168,vReg_163
	mv		returnVal_169,returnVal_168
	j		eraseImpl_split_block_3

eraseImpl_split_block_3:
	mv		returnVal_170,returnVal_169
	mv		returnVal_86,returnVal_170
	j		eraseImpl_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge:
	lw		vReg_171,0(vReg_164)
	addi	vReg_172,vReg_171,8
	lw		vReg_173,0(vReg_172)
	addi	vReg_174,vReg_173,4
	lw		vReg_175,0(vReg_174)
	addi	vReg_176,vReg_175,8
	lw		vReg_177,0(vReg_176)
	beq		vReg_177,zero,eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_178,0(vReg_174)
	addi	vReg_179,vReg_178,8
	lw		vReg_180,0(vReg_179)
	addi	vReg_181,vReg_180,4
	lw		vReg_182,0(vReg_181)
	addi	vReg_183,vReg_182,8
	lw		vReg_184,0(vReg_183)
	beq		vReg_184,zero,eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_185,vReg_180
	mv		returnVal_186,returnVal_185
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_split_block:
	mv		returnVal_187,returnVal_186
	mv		returnVal_188,returnVal_187
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block_2

eraseImpl_fake_fake_findLargest_3_findLargest_split_block_2:
	mv		returnVal_189,returnVal_188
	mv		returnVal_169,returnVal_189
	j		eraseImpl_split_block_3

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_190,0(vReg_181)
	addi	vReg_191,vReg_190,8
	lw		vReg_192,0(vReg_191)
	addi	vReg_193,vReg_192,4
	lw		vReg_194,0(vReg_193)
	addi	vReg_195,vReg_194,8
	lw		vReg_196,0(vReg_195)
	beq		vReg_196,zero,eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_197,vReg_192
	mv		returnVal_198,returnVal_197
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_199,returnVal_198
	mv		returnVal_186,returnVal_199
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_200,0(vReg_193)
	addi	vReg_201,vReg_200,8
	lw		vReg_202,0(vReg_201)
	mv		a0,vReg_202
	call	findLargest
	mv		vReg_203,a0
	mv		returnVal_204,vReg_203
	mv		returnVal_198,returnVal_204
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_205,vReg_173
	mv		returnVal_188,returnVal_205
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block_2

eraseImpl_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_206,vReg_73
	mv		returnVal_88,returnVal_206
	j		eraseImpl_split_block

eraseImpl_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_207,vReg_66
	mv		returnVal_90,returnVal_207
	j		eraseImpl_split_block_2

eraseImpl__if_then_13:
	addi	vReg_208,cur_13,4
	lw		vReg_209,0(vReg_208)
	addi	vReg_210,vReg_209,8
	lw		vReg_211,0(vReg_210)
	lui		global_tmp_212,0
	sw		root_18,0(global_tmp_212)
	mv		a0,vReg_211
	mv		a1,cur_13
	li		imm_213,1
	mv		a2,imm_213
	mv		a3,key_16
	call	eraseImpl
	mv		vReg_214,a0
	lui		global_tmp_215,0
	lw		root_216,0(global_tmp_215)
	mv		returnVal_217,vReg_214
	mv		root_21,root_216
	mv		returnVal_22,returnVal_217
	j		eraseImpl_exit

eraseImpl__if_then_14:
	addi	vReg_218,cur_13,4
	lw		vReg_219,0(vReg_218)
	addi	vReg_220,vReg_219,4
	lw		vReg_221,0(vReg_220)
	lui		global_tmp_222,0
	sw		root_18,0(global_tmp_222)
	mv		a0,vReg_221
	mv		a1,cur_13
	li		imm_223,0
	mv		a2,imm_223
	mv		a3,key_16
	call	eraseImpl
	mv		vReg_224,a0
	lui		global_tmp_225,0
	lw		root_226,0(global_tmp_225)
	mv		returnVal_227,vReg_224
	mv		root_21,root_226
	mv		returnVal_22,returnVal_227
	j		eraseImpl_exit


	.globl	printTree
	.type	printTree, @function
printTree:
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
	mv		cur_13,a0
	beq		cur_13,zero,printTree_exit
	j		printTree__if_merge

printTree__if_merge:
	addi	vReg_14,cur_13,4
	lw		vReg_15,0(vReg_14)
	addi	vReg_16,vReg_15,4
	lw		vReg_17,0(vReg_16)
	beq		vReg_17,zero,printTree_split_block_2
	j		printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	vReg_18,vReg_17,4
	lw		vReg_19,0(vReg_18)
	addi	vReg_20,vReg_19,4
	lw		vReg_21,0(vReg_20)
	beq		vReg_21,zero,printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree__if_merge

printTree_fake_fake_printTree_2_printTree__if_merge:
	addi	vReg_22,vReg_21,4
	lw		vReg_23,0(vReg_22)
	addi	vReg_24,vReg_23,4
	lw		vReg_25,0(vReg_24)
	beq		vReg_25,zero,printTree_fake_fake_printTree_2_printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	vReg_26,vReg_25,4
	lw		vReg_27,0(vReg_26)
	addi	vReg_28,vReg_27,4
	lw		vReg_29,0(vReg_28)
	mv		a0,vReg_29
	call	printTree
	addi	vReg_30,vReg_25,8
	lw		vReg_31,0(vReg_30)
	mv		a0,vReg_31
	call	__builtin_printInt
	la		str_const_32,__str_const_1
	mv		a0,str_const_32
	call	__builtin_print
	addi	vReg_33,vReg_25,12
	lw		vReg_34,0(vReg_33)
	mv		a0,vReg_34
	call	__builtin_printlnInt
	lw		vReg_35,0(vReg_26)
	addi	vReg_36,vReg_35,8
	lw		vReg_37,0(vReg_36)
	mv		a0,vReg_37
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block

printTree_fake_fake_printTree_2_printTree_split_block:
	addi	vReg_38,vReg_21,8
	lw		vReg_39,0(vReg_38)
	mv		a0,vReg_39
	call	__builtin_printInt
	la		str_const_40,__str_const_1
	mv		a0,str_const_40
	call	__builtin_print
	addi	vReg_41,vReg_21,12
	lw		vReg_42,0(vReg_41)
	mv		a0,vReg_42
	call	__builtin_printlnInt
	addi	vReg_43,vReg_21,4
	lw		vReg_44,0(vReg_43)
	addi	vReg_45,vReg_44,8
	lw		vReg_46,0(vReg_45)
	beq		vReg_46,zero,printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	vReg_47,vReg_46,4
	lw		vReg_48,0(vReg_47)
	addi	vReg_49,vReg_48,4
	lw		vReg_50,0(vReg_49)
	mv		a0,vReg_50
	call	printTree
	addi	vReg_51,vReg_46,8
	lw		vReg_52,0(vReg_51)
	mv		a0,vReg_52
	call	__builtin_printInt
	la		str_const_53,__str_const_1
	mv		a0,str_const_53
	call	__builtin_print
	addi	vReg_54,vReg_46,12
	lw		vReg_55,0(vReg_54)
	mv		a0,vReg_55
	call	__builtin_printlnInt
	lw		vReg_56,0(vReg_47)
	addi	vReg_57,vReg_56,8
	lw		vReg_58,0(vReg_57)
	mv		a0,vReg_58
	call	printTree
	j		printTree_split_block

printTree_split_block:
	addi	vReg_59,vReg_17,8
	lw		vReg_60,0(vReg_59)
	mv		a0,vReg_60
	call	__builtin_printInt
	la		str_const_61,__str_const_1
	mv		a0,str_const_61
	call	__builtin_print
	addi	vReg_62,vReg_17,12
	lw		vReg_63,0(vReg_62)
	mv		a0,vReg_63
	call	__builtin_printlnInt
	addi	vReg_64,vReg_17,4
	lw		vReg_65,0(vReg_64)
	addi	vReg_66,vReg_65,8
	lw		vReg_67,0(vReg_66)
	mv		a0,vReg_67
	call	printTree
	j		printTree_split_block_2

printTree_split_block_2:
	addi	vReg_68,cur_13,8
	lw		vReg_69,0(vReg_68)
	mv		a0,vReg_69
	call	__builtin_printInt
	la		str_const_70,__str_const_1
	mv		a0,str_const_70
	call	__builtin_print
	addi	vReg_71,cur_13,12
	lw		vReg_72,0(vReg_71)
	mv		a0,vReg_72
	call	__builtin_printlnInt
	addi	vReg_73,cur_13,4
	lw		vReg_74,0(vReg_73)
	addi	vReg_75,vReg_74,8
	lw		vReg_76,0(vReg_75)
	beq		vReg_76,zero,printTree_exit
	j		printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	vReg_77,vReg_76,4
	lw		vReg_78,0(vReg_77)
	addi	vReg_79,vReg_78,4
	lw		vReg_80,0(vReg_79)
	mv		a0,vReg_80
	call	printTree
	addi	vReg_81,vReg_76,8
	lw		vReg_82,0(vReg_81)
	mv		a0,vReg_82
	call	__builtin_printInt
	la		str_const_83,__str_const_1
	mv		a0,str_const_83
	call	__builtin_print
	addi	vReg_84,vReg_76,12
	lw		vReg_85,0(vReg_84)
	mv		a0,vReg_85
	call	__builtin_printlnInt
	lw		vReg_86,0(vReg_77)
	addi	vReg_87,vReg_86,8
	lw		vReg_88,0(vReg_87)
	mv		a0,vReg_88
	call	printTree
	j		printTree_exit

printTree_exit:
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
	lw		MAX_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		root_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		MaxRandInt_18,0(global_tmp_17)
	call	__builtin_getInt
	mv		vReg_19,a0
	li		imm_21,10
	div		vReg_20,MaxRandInt_18,imm_21
	li		imm_23,8
	mul		vReg_22,imm_23,vReg_20
	mv		seed_licm_phi_24,vReg_19
	mv		root_licm_phi_25,root_16
	li		imm_27,0
	mv		i_licm_phi_26,imm_27
	li		imm_29,1
	mv		returnVal_28,imm_29
	li		imm_31,2
	mv		returnVal_30,imm_31
	li		imm_33,0
	mv		id_32,imm_33
	li		imm_35,1
	mv		id_34,imm_35
	mv		seed_36,seed_licm_phi_24
	mv		root_37,root_licm_phi_25
	mv		i_38,i_licm_phi_26
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations__for_cond:
	li		imm_39,50000
	blt		i_38,imm_39,main_fake_generateOperations_split_block_9
	j		main_split_block

main_split_block:
	li		imm_41,10
	div		vReg_40,MaxRandInt_18,imm_41
	li		imm_43,2
	mul		vReg_42,imm_43,vReg_40
	li		imm_45,0
	mv		i_licm_phi_44,imm_45
	mv		seed_licm_phi_46,seed_36
	mv		root_licm_phi_47,root_37
	li		imm_49,1
	mv		id_48,imm_49
	li		imm_51,0
	mv		id_50,imm_51
	li		imm_53,2
	mv		returnVal_52,imm_53
	li		imm_55,1
	mv		returnVal_54,imm_55
	mv		i_56,i_licm_phi_44
	mv		seed_57,seed_licm_phi_46
	mv		root_58,root_licm_phi_47
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations__for_cond_2:
	li		imm_59,100000
	blt		i_56,imm_59,main_fake_generateOperations_split_block
	j		main_split_block_3

main_fake_generateOperations_split_block:
	slli	vReg_60,seed_57,13
	xor		vReg_61,seed_57,vReg_60
	li		imm_63,2147483647
	and		vReg_62,vReg_61,imm_63
	srai	vReg_64,vReg_62,17
	xor		vReg_65,vReg_62,vReg_64
	slli	vReg_66,vReg_65,5
	xor		vReg_67,vReg_65,vReg_66
	li		imm_69,2147483647
	and		vReg_68,vReg_67,imm_69
	rem		vReg_70,vReg_68,MAX_14
	slli	vReg_71,vReg_68,13
	xor		vReg_72,vReg_68,vReg_71
	li		imm_74,2147483647
	and		vReg_73,vReg_72,imm_74
	srai	vReg_75,vReg_73,17
	xor		vReg_76,vReg_73,vReg_75
	slli	vReg_77,vReg_76,5
	xor		vReg_78,vReg_76,vReg_77
	li		imm_80,2147483647
	and		vReg_79,vReg_78,imm_80
	mv		seed_81,vReg_79
	blt		vReg_79,vReg_42,main_fake_generateOperations_fake_randOp__if_then
	j		main_fake_generateOperations_fake_randOp__if_merge

main_fake_generateOperations_fake_randOp__if_merge:
	mv		returnVal_82,returnVal_52
	j		main_fake_generateOperations_split_block_2

main_fake_generateOperations_split_block_2:
	li		imm_83,1
	beq		returnVal_82,imm_83,main_fake_generateOperations__if_then
	j		main_fake_generateOperations__if_else

main_fake_generateOperations__if_then:
	bne		root_58,zero,main_fake_generateOperations_fake_insert__if_then
	j		main_fake_generateOperations_fake_insert_split_block

main_fake_generateOperations_fake_insert__if_then:
	beq		root_58,zero,main_fake_fake_insertImpl_1_insertImpl_split_block
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge

main_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	vReg_84,root_58,8
	lw		vReg_85,0(vReg_84)
	beq		vReg_85,vReg_70,main_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_2

main_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		vReg_86,0(vReg_84)
	blt		vReg_86,vReg_70,main_fake_fake_insertImpl_1_insertImpl__if_then
	j		main__parallel_copy_

main__parallel_copy_:
	mv		id_87,id_50
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	vReg_88,root_58,4
	lw		vReg_89,0(vReg_88)
	li		imm_91,4
	mul		vReg_90,id_87,imm_91
	addi	vReg_92,vReg_90,4
	add		vReg_93,vReg_92,vReg_89
	lw		vReg_94,0(vReg_93)
	mv		a0,vReg_94
	mv		a1,root_58
	mv		a2,id_87
	mv		a3,vReg_70
	call	insertImpl
	mv		vReg_95,a0
	j		main_split_block_2

main_split_block_2:
	mv		root_96,root_58
	j		main_fake_generateOperations_split_block_3

main_fake_generateOperations_split_block_3:
	mv		root_97,root_96
	j		main_fake_generateOperations__for_step

main_fake_generateOperations__for_step:
	addi	i_98,i_56,1
	mv		i_56,i_98
	mv		seed_57,seed_81
	mv		root_58,root_97
	j		main_fake_generateOperations__for_cond_2

main_fake_fake_insertImpl_1_insertImpl__if_then:
	mv		id_87,id_48
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	vReg_99,root_58,12
	lw		vReg_100,0(vReg_99)
	addi	vReg_101,vReg_100,1
	sw		vReg_101,0(vReg_99)
	j		main_split_block_2

main_fake_fake_insertImpl_1_insertImpl_split_block:
	li		imm_102,16
	mv		a0,imm_102
	call	malloc
	mv		vReg_103,a0
	addi	vReg_104,vReg_103,4
	li		imm_105,12
	mv		a0,imm_105
	call	malloc
	mv		vReg_106,a0
	li		imm_107,2
	sw		imm_107,0(vReg_106)
	sw		vReg_106,0(vReg_104)
	addi	vReg_108,vReg_103,8
	sw		vReg_70,0(vReg_108)
	addi	vReg_109,vReg_103,12
	li		imm_110,1
	sw		imm_110,0(vReg_109)
	addi	vReg_111,vReg_103,0
	li		imm_112,0
	sw		imm_112,0(vReg_111)
	lw		vReg_113,0(vReg_104)
	addi	vReg_114,vReg_113,4
	li		imm_115,0
	sw		imm_115,0(vReg_114)
	lw		vReg_116,0(vReg_104)
	addi	vReg_117,vReg_116,8
	li		imm_118,0
	sw		imm_118,0(vReg_117)
	li		imm_120,4
	lw		vReg_119,0(imm_120)
	addi	vReg_121,vReg_119,0
	sw		vReg_103,0(vReg_121)
	j		main_split_block_2

main_fake_generateOperations_fake_insert_split_block:
	li		imm_122,16
	mv		a0,imm_122
	call	malloc
	mv		vReg_123,a0
	addi	vReg_124,vReg_123,4
	li		imm_125,12
	mv		a0,imm_125
	call	malloc
	mv		vReg_126,a0
	li		imm_127,2
	sw		imm_127,0(vReg_126)
	sw		vReg_126,0(vReg_124)
	addi	vReg_128,vReg_123,8
	sw		vReg_70,0(vReg_128)
	addi	vReg_129,vReg_123,12
	li		imm_130,1
	sw		imm_130,0(vReg_129)
	addi	vReg_131,vReg_123,0
	li		imm_132,0
	sw		imm_132,0(vReg_131)
	lw		vReg_133,0(vReg_124)
	addi	vReg_134,vReg_133,4
	li		imm_135,0
	sw		imm_135,0(vReg_134)
	lw		vReg_136,0(vReg_124)
	addi	vReg_137,vReg_136,8
	li		imm_138,0
	sw		imm_138,0(vReg_137)
	mv		root_139,vReg_123
	mv		root_96,root_139
	j		main_fake_generateOperations_split_block_3

main_fake_generateOperations__if_else:
	beq		root_58,zero,main_fake_generateOperations_fake_erase__if_then
	j		main_fake_generateOperations_fake_erase__if_merge

main_fake_generateOperations_fake_erase__if_then:
	mv		root_140,root_58
	j		main_fake_generateOperations_split_block_4

main_fake_generateOperations_split_block_4:
	mv		root_97,root_140
	j		main_fake_generateOperations__for_step

main_fake_generateOperations_fake_erase__if_merge:
	lui		global_tmp_141,0
	sw		root_58,0(global_tmp_141)
	mv		a0,root_58
	li		imm_142,0
	mv		a1,imm_142
	li		imm_143,-1
	mv		a2,imm_143
	mv		a3,vReg_70
	call	eraseImpl
	mv		vReg_144,a0
	lui		global_tmp_145,0
	lw		root_146,0(global_tmp_145)
	mv		root_140,root_146
	j		main_fake_generateOperations_split_block_4

main_fake_generateOperations_fake_randOp__if_then:
	mv		returnVal_82,returnVal_54
	j		main_fake_generateOperations_split_block_2

main_split_block_3:
	li		imm_148,10
	div		vReg_147,MaxRandInt_18,imm_148
	li		imm_150,4
	mul		vReg_149,imm_150,vReg_147
	mv		seed_licm_phi_151,seed_57
	li		imm_153,0
	mv		i_licm_phi_152,imm_153
	mv		root_licm_phi_154,root_58
	li		imm_156,1
	mv		id_155,imm_156
	li		imm_158,0
	mv		id_157,imm_158
	li		imm_160,1
	mv		returnVal_159,imm_160
	li		imm_162,2
	mv		returnVal_161,imm_162
	mv		seed_163,seed_licm_phi_151
	mv		i_164,i_licm_phi_152
	mv		root_165,root_licm_phi_154
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations__for_cond_3:
	li		imm_166,50000
	blt		i_164,imm_166,main_fake_generateOperations_split_block_5
	j		main_split_block_5

main_fake_generateOperations_split_block_5:
	slli	vReg_167,seed_163,13
	xor		vReg_168,seed_163,vReg_167
	li		imm_170,2147483647
	and		vReg_169,vReg_168,imm_170
	srai	vReg_171,vReg_169,17
	xor		vReg_172,vReg_169,vReg_171
	slli	vReg_173,vReg_172,5
	xor		vReg_174,vReg_172,vReg_173
	li		imm_176,2147483647
	and		vReg_175,vReg_174,imm_176
	rem		vReg_177,vReg_175,MAX_14
	slli	vReg_178,vReg_175,13
	xor		vReg_179,vReg_175,vReg_178
	li		imm_181,2147483647
	and		vReg_180,vReg_179,imm_181
	srai	vReg_182,vReg_180,17
	xor		vReg_183,vReg_180,vReg_182
	slli	vReg_184,vReg_183,5
	xor		vReg_185,vReg_183,vReg_184
	li		imm_187,2147483647
	and		vReg_186,vReg_185,imm_187
	mv		seed_188,vReg_186
	blt		vReg_186,vReg_149,main_fake_generateOperations_fake_randOp__if_then_2
	j		main_fake_generateOperations_fake_randOp__if_merge_2

main_fake_generateOperations_fake_randOp__if_then_2:
	mv		returnVal_189,returnVal_159
	j		main_fake_generateOperations_split_block_6

main_fake_generateOperations_split_block_6:
	li		imm_190,1
	beq		returnVal_189,imm_190,main_fake_generateOperations__if_then_2
	j		main_fake_generateOperations__if_else_2

main_fake_generateOperations__if_then_2:
	bne		root_165,zero,main_fake_generateOperations_fake_insert__if_then_2
	j		main_fake_generateOperations_fake_insert_split_block_2

main_fake_generateOperations_fake_insert_split_block_2:
	li		imm_191,16
	mv		a0,imm_191
	call	malloc
	mv		vReg_192,a0
	addi	vReg_193,vReg_192,4
	li		imm_194,12
	mv		a0,imm_194
	call	malloc
	mv		vReg_195,a0
	li		imm_196,2
	sw		imm_196,0(vReg_195)
	sw		vReg_195,0(vReg_193)
	addi	vReg_197,vReg_192,8
	sw		vReg_177,0(vReg_197)
	addi	vReg_198,vReg_192,12
	li		imm_199,1
	sw		imm_199,0(vReg_198)
	addi	vReg_200,vReg_192,0
	li		imm_201,0
	sw		imm_201,0(vReg_200)
	lw		vReg_202,0(vReg_193)
	addi	vReg_203,vReg_202,4
	li		imm_204,0
	sw		imm_204,0(vReg_203)
	lw		vReg_205,0(vReg_193)
	addi	vReg_206,vReg_205,8
	li		imm_207,0
	sw		imm_207,0(vReg_206)
	mv		root_208,vReg_192
	mv		root_209,root_208
	j		main_fake_generateOperations_split_block_7

main_fake_generateOperations_split_block_7:
	mv		root_210,root_209
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations__for_step_2:
	addi	i_211,i_164,1
	mv		seed_163,seed_188
	mv		i_164,i_211
	mv		root_165,root_210
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations_fake_insert__if_then_2:
	beq		root_165,zero,main_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_4

main_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		imm_212,16
	mv		a0,imm_212
	call	malloc
	mv		vReg_213,a0
	addi	vReg_214,vReg_213,4
	li		imm_215,12
	mv		a0,imm_215
	call	malloc
	mv		vReg_216,a0
	li		imm_217,2
	sw		imm_217,0(vReg_216)
	sw		vReg_216,0(vReg_214)
	addi	vReg_218,vReg_213,8
	sw		vReg_177,0(vReg_218)
	addi	vReg_219,vReg_213,12
	li		imm_220,1
	sw		imm_220,0(vReg_219)
	addi	vReg_221,vReg_213,0
	li		imm_222,0
	sw		imm_222,0(vReg_221)
	lw		vReg_223,0(vReg_214)
	addi	vReg_224,vReg_223,4
	li		imm_225,0
	sw		imm_225,0(vReg_224)
	lw		vReg_226,0(vReg_214)
	addi	vReg_227,vReg_226,8
	li		imm_228,0
	sw		imm_228,0(vReg_227)
	li		imm_230,4
	lw		vReg_229,0(imm_230)
	addi	vReg_231,vReg_229,0
	sw		vReg_213,0(vReg_231)
	j		main_split_block_4

main_split_block_4:
	mv		root_209,root_165
	j		main_fake_generateOperations_split_block_7

main_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	vReg_232,root_165,8
	lw		vReg_233,0(vReg_232)
	beq		vReg_233,vReg_177,main_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_5

main_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		vReg_234,0(vReg_232)
	blt		vReg_234,vReg_177,main_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		main__parallel_copy__2

main_fake_fake_insertImpl_1_insertImpl__if_then_3:
	mv		id_235,id_155
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	vReg_236,root_165,4
	lw		vReg_237,0(vReg_236)
	li		imm_239,4
	mul		vReg_238,id_235,imm_239
	addi	vReg_240,vReg_238,4
	add		vReg_241,vReg_240,vReg_237
	lw		vReg_242,0(vReg_241)
	mv		a0,vReg_242
	mv		a1,root_165
	mv		a2,id_235
	mv		a3,vReg_177
	call	insertImpl
	mv		vReg_243,a0
	j		main_split_block_4

main__parallel_copy__2:
	mv		id_235,id_157
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_then_4:
	addi	vReg_244,root_165,12
	lw		vReg_245,0(vReg_244)
	addi	vReg_246,vReg_245,1
	sw		vReg_246,0(vReg_244)
	j		main_split_block_4

main_fake_generateOperations__if_else_2:
	beq		root_165,zero,main_fake_generateOperations_fake_erase__if_then_2
	j		main_fake_generateOperations_fake_erase__if_merge_2

main_fake_generateOperations_fake_erase__if_then_2:
	mv		root_247,root_165
	j		main_fake_generateOperations_split_block_8

main_fake_generateOperations_split_block_8:
	mv		root_210,root_247
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations_fake_erase__if_merge_2:
	lui		global_tmp_248,0
	sw		root_165,0(global_tmp_248)
	mv		a0,root_165
	li		imm_249,0
	mv		a1,imm_249
	li		imm_250,-1
	mv		a2,imm_250
	mv		a3,vReg_177
	call	eraseImpl
	mv		vReg_251,a0
	lui		global_tmp_252,0
	lw		root_253,0(global_tmp_252)
	mv		root_247,root_253
	j		main_fake_generateOperations_split_block_8

main_fake_generateOperations_fake_randOp__if_merge_2:
	mv		returnVal_189,returnVal_161
	j		main_fake_generateOperations_split_block_6

main_split_block_5:
	beq		root_165,zero,main_split_block_6
	j		main_fake_fake_printTree_1_printTree__if_merge

main_split_block_6:
	lui		global_tmp_254,0
	sw		root_165,0(global_tmp_254)
	lui		global_tmp_255,0
	sw		seed_163,0(global_tmp_255)
	li		imm_256,0
	mv		a0,imm_256
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

main_fake_fake_printTree_1_printTree__if_merge:
	addi	vReg_257,root_165,4
	lw		vReg_258,0(vReg_257)
	addi	vReg_259,vReg_258,4
	lw		vReg_260,0(vReg_259)
	mv		a0,vReg_260
	call	printTree
	addi	vReg_261,root_165,8
	lw		vReg_262,0(vReg_261)
	mv		a0,vReg_262
	call	__builtin_printInt
	la		str_const_263,__str_const_1
	mv		a0,str_const_263
	call	__builtin_print
	addi	vReg_264,root_165,12
	lw		vReg_265,0(vReg_264)
	mv		a0,vReg_265
	call	__builtin_printlnInt
	lw		vReg_266,0(vReg_257)
	addi	vReg_267,vReg_266,8
	lw		vReg_268,0(vReg_267)
	mv		a0,vReg_268
	call	printTree
	j		main_split_block_6

main_fake_generateOperations_split_block_9:
	slli	vReg_269,seed_36,13
	xor		vReg_270,seed_36,vReg_269
	li		imm_272,2147483647
	and		vReg_271,vReg_270,imm_272
	srai	vReg_273,vReg_271,17
	xor		vReg_274,vReg_271,vReg_273
	slli	vReg_275,vReg_274,5
	xor		vReg_276,vReg_274,vReg_275
	li		imm_278,2147483647
	and		vReg_277,vReg_276,imm_278
	rem		vReg_279,vReg_277,MAX_14
	slli	vReg_280,vReg_277,13
	xor		vReg_281,vReg_277,vReg_280
	li		imm_283,2147483647
	and		vReg_282,vReg_281,imm_283
	srai	vReg_284,vReg_282,17
	xor		vReg_285,vReg_282,vReg_284
	slli	vReg_286,vReg_285,5
	xor		vReg_287,vReg_285,vReg_286
	li		imm_289,2147483647
	and		vReg_288,vReg_287,imm_289
	mv		seed_290,vReg_288
	blt		vReg_288,vReg_22,main_fake_generateOperations_fake_randOp__if_then_3
	j		main_fake_generateOperations_fake_randOp__if_merge_3

main_fake_generateOperations_fake_randOp__if_then_3:
	mv		returnVal_291,returnVal_28
	j		main_fake_generateOperations_split_block_10

main_fake_generateOperations_split_block_10:
	li		imm_292,1
	beq		returnVal_291,imm_292,main_fake_generateOperations__if_then_3
	j		main_fake_generateOperations__if_else_3

main_fake_generateOperations__if_then_3:
	bne		root_37,zero,main_fake_generateOperations_fake_insert__if_then_3
	j		main_fake_generateOperations_fake_insert_split_block_3

main_fake_generateOperations_fake_insert_split_block_3:
	li		imm_293,16
	mv		a0,imm_293
	call	malloc
	mv		vReg_294,a0
	addi	vReg_295,vReg_294,4
	li		imm_296,12
	mv		a0,imm_296
	call	malloc
	mv		vReg_297,a0
	li		imm_298,2
	sw		imm_298,0(vReg_297)
	sw		vReg_297,0(vReg_295)
	addi	vReg_299,vReg_294,8
	sw		vReg_279,0(vReg_299)
	addi	vReg_300,vReg_294,12
	li		imm_301,1
	sw		imm_301,0(vReg_300)
	addi	vReg_302,vReg_294,0
	li		imm_303,0
	sw		imm_303,0(vReg_302)
	lw		vReg_304,0(vReg_295)
	addi	vReg_305,vReg_304,4
	li		imm_306,0
	sw		imm_306,0(vReg_305)
	lw		vReg_307,0(vReg_295)
	addi	vReg_308,vReg_307,8
	li		imm_309,0
	sw		imm_309,0(vReg_308)
	mv		root_310,vReg_294
	mv		root_311,root_310
	j		main_fake_generateOperations_split_block_11

main_fake_generateOperations_split_block_11:
	mv		root_312,root_311
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations__for_step_3:
	addi	i_313,i_38,1
	mv		seed_36,seed_290
	mv		root_37,root_312
	mv		i_38,i_313
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations_fake_insert__if_then_3:
	beq		root_37,zero,main_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_7

main_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	vReg_314,root_37,8
	lw		vReg_315,0(vReg_314)
	beq		vReg_315,vReg_279,main_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_8

main_fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	vReg_316,root_37,12
	lw		vReg_317,0(vReg_316)
	addi	vReg_318,vReg_317,1
	sw		vReg_318,0(vReg_316)
	j		main_split_block_7

main_split_block_7:
	mv		root_311,root_37
	j		main_fake_generateOperations_split_block_11

main_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		vReg_319,0(vReg_314)
	blt		vReg_319,vReg_279,main_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		main__parallel_copy__3

main__parallel_copy__3:
	mv		id_320,id_32
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	vReg_321,root_37,4
	lw		vReg_322,0(vReg_321)
	li		imm_324,4
	mul		vReg_323,id_320,imm_324
	addi	vReg_325,vReg_323,4
	add		vReg_326,vReg_325,vReg_322
	lw		vReg_327,0(vReg_326)
	mv		a0,vReg_327
	mv		a1,root_37
	mv		a2,id_320
	mv		a3,vReg_279
	call	insertImpl
	mv		vReg_328,a0
	j		main_split_block_7

main_fake_fake_insertImpl_1_insertImpl__if_then_6:
	mv		id_320,id_34
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		imm_329,16
	mv		a0,imm_329
	call	malloc
	mv		vReg_330,a0
	addi	vReg_331,vReg_330,4
	li		imm_332,12
	mv		a0,imm_332
	call	malloc
	mv		vReg_333,a0
	li		imm_334,2
	sw		imm_334,0(vReg_333)
	sw		vReg_333,0(vReg_331)
	addi	vReg_335,vReg_330,8
	sw		vReg_279,0(vReg_335)
	addi	vReg_336,vReg_330,12
	li		imm_337,1
	sw		imm_337,0(vReg_336)
	addi	vReg_338,vReg_330,0
	li		imm_339,0
	sw		imm_339,0(vReg_338)
	lw		vReg_340,0(vReg_331)
	addi	vReg_341,vReg_340,4
	li		imm_342,0
	sw		imm_342,0(vReg_341)
	lw		vReg_343,0(vReg_331)
	addi	vReg_344,vReg_343,8
	li		imm_345,0
	sw		imm_345,0(vReg_344)
	li		imm_347,4
	lw		vReg_346,0(imm_347)
	addi	vReg_348,vReg_346,0
	sw		vReg_330,0(vReg_348)
	j		main_split_block_7

main_fake_generateOperations__if_else_3:
	beq		root_37,zero,main_fake_generateOperations_fake_erase__if_then_3
	j		main_fake_generateOperations_fake_erase__if_merge_3

main_fake_generateOperations_fake_erase__if_then_3:
	mv		root_349,root_37
	j		main_fake_generateOperations_split_block_12

main_fake_generateOperations_split_block_12:
	mv		root_312,root_349
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations_fake_erase__if_merge_3:
	lui		global_tmp_350,0
	sw		root_37,0(global_tmp_350)
	mv		a0,root_37
	li		imm_351,0
	mv		a1,imm_351
	li		imm_352,-1
	mv		a2,imm_352
	mv		a3,vReg_279
	call	eraseImpl
	mv		vReg_353,a0
	lui		global_tmp_354,0
	lw		root_355,0(global_tmp_354)
	mv		root_349,root_355
	j		main_fake_generateOperations_split_block_12

main_fake_generateOperations_fake_randOp__if_merge_3:
	mv		returnVal_291,returnVal_30
	j		main_fake_generateOperations_split_block_10


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
	li		imm_14,2147483647
	sw		imm_14,0(global_tmp_13)
	lui		global_tmp_15,0
	li		imm_16,0
	sw		imm_16,0(global_tmp_15)
	lui		global_tmp_17,0
	li		imm_18,128
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


