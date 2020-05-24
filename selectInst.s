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
	li		imm_17,0
	beq		cur_13,imm_17,insertImpl_split_block
	j		insertImpl__if_merge

insertImpl_split_block:
	li		imm_18,16
	mv		a0,imm_18
	call	malloc
	mv		vReg_19,a0
	addi	vReg_20,vReg_19,4
	li		imm_21,12
	mv		a0,imm_21
	call	malloc
	mv		vReg_22,a0
	li		imm_23,2
	sw		imm_23,0(vReg_22)
	sw		vReg_22,0(vReg_20)
	addi	vReg_24,vReg_19,8
	sw		key_16,0(vReg_24)
	addi	vReg_25,vReg_19,12
	li		imm_26,1
	sw		imm_26,0(vReg_25)
	addi	vReg_27,vReg_19,0
	sw		pnt_14,0(vReg_27)
	lw		vReg_28,0(vReg_20)
	addi	vReg_29,vReg_28,4
	li		imm_30,0
	sw		imm_30,0(vReg_29)
	lw		vReg_31,0(vReg_20)
	addi	vReg_32,vReg_31,8
	li		imm_33,0
	sw		imm_33,0(vReg_32)
	addi	vReg_34,pnt_14,4
	lw		vReg_35,0(vReg_34)
	li		imm_37,4
	mul		vReg_36,childId_15,imm_37
	addi	vReg_38,vReg_36,4
	add		vReg_39,vReg_38,vReg_35
	sw		vReg_19,0(vReg_39)
	li		imm_41,0
	mv		returnVal_40,imm_41
	mv		returnVal_42,returnVal_40
	j		insertImpl_exit

insertImpl_exit:
	mv		a0,returnVal_42
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
	addi	vReg_43,cur_13,8
	lw		vReg_44,0(vReg_43)
	beq		vReg_44,key_16,insertImpl__if_then_2
	j		insertImpl__if_merge_2

insertImpl__if_merge_2:
	li		imm_46,0
	mv		id_45,imm_46
	lw		vReg_47,0(vReg_43)
	blt		vReg_47,key_16,insertImpl__if_then
	j		insertImpl__parallel_copy_

insertImpl__parallel_copy_:
	mv		id_48,id_45
	j		insertImpl__if_merge_3

insertImpl__if_merge_3:
	addi	vReg_49,cur_13,4
	lw		vReg_50,0(vReg_49)
	li		imm_52,4
	mul		vReg_51,id_48,imm_52
	addi	vReg_53,vReg_51,4
	add		vReg_54,vReg_53,vReg_50
	lw		vReg_55,0(vReg_54)
	li		imm_56,0
	beq		vReg_55,imm_56,insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		imm_57,16
	mv		a0,imm_57
	call	malloc
	mv		vReg_58,a0
	addi	vReg_59,vReg_58,4
	li		imm_60,12
	mv		a0,imm_60
	call	malloc
	mv		vReg_61,a0
	li		imm_62,2
	sw		imm_62,0(vReg_61)
	sw		vReg_61,0(vReg_59)
	addi	vReg_63,vReg_58,8
	sw		key_16,0(vReg_63)
	addi	vReg_64,vReg_58,12
	li		imm_65,1
	sw		imm_65,0(vReg_64)
	addi	vReg_66,vReg_58,0
	sw		cur_13,0(vReg_66)
	lw		vReg_67,0(vReg_59)
	addi	vReg_68,vReg_67,4
	li		imm_69,0
	sw		imm_69,0(vReg_68)
	lw		vReg_70,0(vReg_59)
	addi	vReg_71,vReg_70,8
	li		imm_72,0
	sw		imm_72,0(vReg_71)
	lw		vReg_73,0(vReg_49)
	add		vReg_74,vReg_53,vReg_73
	sw		vReg_58,0(vReg_74)
	li		imm_76,0
	mv		returnVal_75,imm_76
	mv		returnVal_77,returnVal_75
	j		insertImpl_split_block_2

insertImpl_split_block_2:
	mv		returnVal_78,returnVal_77
	mv		returnVal_42,returnVal_78
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	vReg_79,vReg_55,8
	lw		vReg_80,0(vReg_79)
	beq		vReg_80,key_16,insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	vReg_81,vReg_55,12
	lw		vReg_82,0(vReg_81)
	addi	vReg_83,vReg_82,1
	sw		vReg_83,0(vReg_81)
	li		imm_85,1
	mv		returnVal_84,imm_85
	mv		returnVal_77,returnVal_84
	j		insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		imm_87,0
	mv		id_86,imm_87
	lw		vReg_88,0(vReg_79)
	blt		vReg_88,key_16,insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl__parallel_copy__4

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		imm_90,1
	mv		id_89,imm_90
	mv		id_91,id_89
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	vReg_92,vReg_55,4
	lw		vReg_93,0(vReg_92)
	li		imm_95,4
	mul		vReg_94,id_91,imm_95
	addi	vReg_96,vReg_94,4
	add		vReg_97,vReg_96,vReg_93
	lw		vReg_98,0(vReg_97)
	li		imm_99,0
	beq		vReg_98,imm_99,insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		imm_100,16
	mv		a0,imm_100
	call	malloc
	mv		vReg_101,a0
	addi	vReg_102,vReg_101,4
	li		imm_103,12
	mv		a0,imm_103
	call	malloc
	mv		vReg_104,a0
	li		imm_105,2
	sw		imm_105,0(vReg_104)
	sw		vReg_104,0(vReg_102)
	addi	vReg_106,vReg_101,8
	sw		key_16,0(vReg_106)
	addi	vReg_107,vReg_101,12
	li		imm_108,1
	sw		imm_108,0(vReg_107)
	addi	vReg_109,vReg_101,0
	sw		vReg_55,0(vReg_109)
	lw		vReg_110,0(vReg_102)
	addi	vReg_111,vReg_110,4
	li		imm_112,0
	sw		imm_112,0(vReg_111)
	lw		vReg_113,0(vReg_102)
	addi	vReg_114,vReg_113,8
	li		imm_115,0
	sw		imm_115,0(vReg_114)
	lw		vReg_116,0(vReg_92)
	add		vReg_117,vReg_96,vReg_116
	sw		vReg_101,0(vReg_117)
	li		imm_119,0
	mv		returnVal_118,imm_119
	mv		returnVal_120,returnVal_118
	j		insertImpl_split_block_3

insertImpl_split_block_3:
	mv		returnVal_121,returnVal_120
	mv		returnVal_77,returnVal_121
	j		insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	vReg_122,vReg_98,8
	lw		vReg_123,0(vReg_122)
	beq		vReg_123,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	vReg_124,vReg_98,12
	lw		vReg_125,0(vReg_124)
	addi	vReg_126,vReg_125,1
	sw		vReg_126,0(vReg_124)
	li		imm_128,1
	mv		returnVal_127,imm_128
	mv		returnVal_120,returnVal_127
	j		insertImpl_split_block_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		imm_130,0
	mv		id_129,imm_130
	lw		vReg_131,0(vReg_122)
	blt		vReg_131,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl__parallel_copy__3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		imm_133,1
	mv		id_132,imm_133
	mv		id_134,id_132
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	vReg_135,vReg_98,4
	lw		vReg_136,0(vReg_135)
	li		imm_138,4
	mul		vReg_137,id_134,imm_138
	addi	vReg_139,vReg_137,4
	add		vReg_140,vReg_139,vReg_136
	lw		vReg_141,0(vReg_140)
	li		imm_142,0
	beq		vReg_141,imm_142,insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		imm_143,16
	mv		a0,imm_143
	call	malloc
	mv		vReg_144,a0
	addi	vReg_145,vReg_144,4
	li		imm_146,12
	mv		a0,imm_146
	call	malloc
	mv		vReg_147,a0
	li		imm_148,2
	sw		imm_148,0(vReg_147)
	sw		vReg_147,0(vReg_145)
	addi	vReg_149,vReg_144,8
	sw		key_16,0(vReg_149)
	addi	vReg_150,vReg_144,12
	li		imm_151,1
	sw		imm_151,0(vReg_150)
	addi	vReg_152,vReg_144,0
	sw		vReg_98,0(vReg_152)
	lw		vReg_153,0(vReg_145)
	addi	vReg_154,vReg_153,4
	li		imm_155,0
	sw		imm_155,0(vReg_154)
	lw		vReg_156,0(vReg_145)
	addi	vReg_157,vReg_156,8
	li		imm_158,0
	sw		imm_158,0(vReg_157)
	lw		vReg_159,0(vReg_135)
	add		vReg_160,vReg_139,vReg_159
	sw		vReg_144,0(vReg_160)
	li		imm_162,0
	mv		returnVal_161,imm_162
	mv		returnVal_163,returnVal_161
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2:
	mv		returnVal_164,returnVal_163
	mv		returnVal_120,returnVal_164
	j		insertImpl_split_block_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	vReg_165,vReg_141,8
	lw		vReg_166,0(vReg_165)
	beq		vReg_166,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		imm_168,0
	mv		id_167,imm_168
	lw		vReg_169,0(vReg_165)
	blt		vReg_169,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl__parallel_copy__2

insertImpl__parallel_copy__2:
	mv		id_170,id_167
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	vReg_171,vReg_141,4
	lw		vReg_172,0(vReg_171)
	li		imm_174,4
	mul		vReg_173,id_170,imm_174
	addi	vReg_175,vReg_173,4
	add		vReg_176,vReg_175,vReg_172
	lw		vReg_177,0(vReg_176)
	mv		a0,vReg_177
	mv		a1,vReg_141
	mv		a2,id_170
	mv		a3,key_16
	call	insertImpl
	mv		vReg_178,a0
	mv		returnVal_179,vReg_178
	mv		returnVal_163,returnVal_179
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		imm_181,1
	mv		id_180,imm_181
	mv		id_170,id_180
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	vReg_182,vReg_141,12
	lw		vReg_183,0(vReg_182)
	addi	vReg_184,vReg_183,1
	sw		vReg_184,0(vReg_182)
	li		imm_186,1
	mv		returnVal_185,imm_186
	mv		returnVal_163,returnVal_185
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2

insertImpl__parallel_copy__3:
	mv		id_134,id_129
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl__parallel_copy__4:
	mv		id_91,id_86
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl__if_then:
	li		imm_188,1
	mv		id_187,imm_188
	mv		id_48,id_187
	j		insertImpl__if_merge_3

insertImpl__if_then_2:
	addi	vReg_189,cur_13,12
	lw		vReg_190,0(vReg_189)
	addi	vReg_191,vReg_190,1
	sw		vReg_191,0(vReg_189)
	li		imm_193,1
	mv		returnVal_192,imm_193
	mv		returnVal_42,returnVal_192
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
	li		imm_18,0
	beq		vReg_17,imm_18,findLargest__if_then
	j		findLargest__if_merge

findLargest__if_then:
	mv		returnVal_19,cur_13
	mv		returnVal_20,returnVal_19
	j		findLargest_exit

findLargest_exit:
	mv		a0,returnVal_20
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
	lw		vReg_21,0(vReg_14)
	addi	vReg_22,vReg_21,8
	lw		vReg_23,0(vReg_22)
	addi	vReg_24,vReg_23,4
	lw		vReg_25,0(vReg_24)
	addi	vReg_26,vReg_25,8
	lw		vReg_27,0(vReg_26)
	li		imm_28,0
	beq		vReg_27,imm_28,findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_29,0(vReg_24)
	addi	vReg_30,vReg_29,8
	lw		vReg_31,0(vReg_30)
	addi	vReg_32,vReg_31,4
	lw		vReg_33,0(vReg_32)
	addi	vReg_34,vReg_33,8
	lw		vReg_35,0(vReg_34)
	li		imm_36,0
	beq		vReg_35,imm_36,findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_37,vReg_31
	mv		returnVal_38,returnVal_37
	j		findLargest_split_block

findLargest_split_block:
	mv		returnVal_39,returnVal_38
	mv		returnVal_40,returnVal_39
	j		findLargest_split_block_2

findLargest_split_block_2:
	mv		returnVal_41,returnVal_40
	mv		returnVal_20,returnVal_41
	j		findLargest_exit

findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_42,0(vReg_32)
	addi	vReg_43,vReg_42,8
	lw		vReg_44,0(vReg_43)
	addi	vReg_45,vReg_44,4
	lw		vReg_46,0(vReg_45)
	addi	vReg_47,vReg_46,8
	lw		vReg_48,0(vReg_47)
	li		imm_49,0
	beq		vReg_48,imm_49,findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_50,vReg_44
	mv		returnVal_51,returnVal_50
	j		findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_52,returnVal_51
	mv		returnVal_38,returnVal_52
	j		findLargest_split_block

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_53,0(vReg_45)
	addi	vReg_54,vReg_53,8
	lw		vReg_55,0(vReg_54)
	addi	vReg_56,vReg_55,4
	lw		vReg_57,0(vReg_56)
	addi	vReg_58,vReg_57,8
	lw		vReg_59,0(vReg_58)
	li		imm_60,0
	beq		vReg_59,imm_60,findLargest_fake_fake_findLargest_3_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest__if_then:
	mv		returnVal_61,vReg_55
	mv		returnVal_62,returnVal_61
	j		findLargest_split_block_3

findLargest_split_block_3:
	mv		returnVal_63,returnVal_62
	mv		returnVal_51,returnVal_63
	j		findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		vReg_64,0(vReg_56)
	addi	vReg_65,vReg_64,8
	lw		vReg_66,0(vReg_65)
	addi	vReg_67,vReg_66,4
	lw		vReg_68,0(vReg_67)
	addi	vReg_69,vReg_68,8
	lw		vReg_70,0(vReg_69)
	li		imm_71,0
	beq		vReg_70,imm_71,findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_72,0(vReg_67)
	addi	vReg_73,vReg_72,8
	lw		vReg_74,0(vReg_73)
	addi	vReg_75,vReg_74,4
	lw		vReg_76,0(vReg_75)
	addi	vReg_77,vReg_76,8
	lw		vReg_78,0(vReg_77)
	li		imm_79,0
	beq		vReg_78,imm_79,findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_80,vReg_74
	mv		returnVal_81,returnVal_80
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest_split_block:
	mv		returnVal_82,returnVal_81
	mv		returnVal_83,returnVal_82
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_3_findLargest_split_block_2:
	mv		returnVal_84,returnVal_83
	mv		returnVal_62,returnVal_84
	j		findLargest_split_block_3

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_85,0(vReg_75)
	addi	vReg_86,vReg_85,8
	lw		vReg_87,0(vReg_86)
	addi	vReg_88,vReg_87,4
	lw		vReg_89,0(vReg_88)
	addi	vReg_90,vReg_89,8
	lw		vReg_91,0(vReg_90)
	li		imm_92,0
	beq		vReg_91,imm_92,findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_93,0(vReg_88)
	addi	vReg_94,vReg_93,8
	lw		vReg_95,0(vReg_94)
	addi	vReg_96,vReg_95,4
	lw		vReg_97,0(vReg_96)
	addi	vReg_98,vReg_97,8
	lw		vReg_99,0(vReg_98)
	li		imm_100,0
	beq		vReg_99,imm_100,findLargest_fake_fake_findLargest_4_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest__if_then:
	mv		returnVal_101,vReg_95
	mv		returnVal_102,returnVal_101
	j		findLargest_split_block_4

findLargest_split_block_4:
	mv		returnVal_103,returnVal_102
	mv		returnVal_104,returnVal_103
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_105,returnVal_104
	mv		returnVal_81,returnVal_105
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		vReg_106,0(vReg_96)
	addi	vReg_107,vReg_106,8
	lw		vReg_108,0(vReg_107)
	addi	vReg_109,vReg_108,4
	lw		vReg_110,0(vReg_109)
	addi	vReg_111,vReg_110,8
	lw		vReg_112,0(vReg_111)
	li		imm_113,0
	beq		vReg_112,imm_113,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_114,vReg_108
	mv		returnVal_115,returnVal_114
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_split_block:
	mv		returnVal_116,returnVal_115
	mv		returnVal_102,returnVal_116
	j		findLargest_split_block_4

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_117,0(vReg_109)
	addi	vReg_118,vReg_117,8
	lw		vReg_119,0(vReg_118)
	addi	vReg_120,vReg_119,4
	lw		vReg_121,0(vReg_120)
	addi	vReg_122,vReg_121,8
	lw		vReg_123,0(vReg_122)
	li		imm_124,0
	beq		vReg_123,imm_124,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_125,0(vReg_120)
	addi	vReg_126,vReg_125,8
	lw		vReg_127,0(vReg_126)
	addi	vReg_128,vReg_127,4
	lw		vReg_129,0(vReg_128)
	addi	vReg_130,vReg_129,8
	lw		vReg_131,0(vReg_130)
	li		imm_132,0
	beq		vReg_131,imm_132,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_133,0(vReg_128)
	addi	vReg_134,vReg_133,8
	lw		vReg_135,0(vReg_134)
	addi	vReg_136,vReg_135,4
	lw		vReg_137,0(vReg_136)
	addi	vReg_138,vReg_137,8
	lw		vReg_139,0(vReg_138)
	li		imm_140,0
	beq		vReg_139,imm_140,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		vReg_141,0(vReg_136)
	addi	vReg_142,vReg_141,8
	lw		vReg_143,0(vReg_142)
	addi	vReg_144,vReg_143,4
	lw		vReg_145,0(vReg_144)
	addi	vReg_146,vReg_145,8
	lw		vReg_147,0(vReg_146)
	li		imm_148,0
	beq		vReg_147,imm_148,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_149,0(vReg_144)
	addi	vReg_150,vReg_149,8
	lw		vReg_151,0(vReg_150)
	addi	vReg_152,vReg_151,4
	lw		vReg_153,0(vReg_152)
	addi	vReg_154,vReg_153,8
	lw		vReg_155,0(vReg_154)
	li		imm_156,0
	beq		vReg_155,imm_156,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_157,0(vReg_152)
	addi	vReg_158,vReg_157,8
	lw		vReg_159,0(vReg_158)
	addi	vReg_160,vReg_159,4
	lw		vReg_161,0(vReg_160)
	addi	vReg_162,vReg_161,8
	lw		vReg_163,0(vReg_162)
	li		imm_164,0
	beq		vReg_163,imm_164,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_165,vReg_159
	mv		returnVal_166,returnVal_165
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_167,returnVal_166
	mv		returnVal_168,returnVal_167
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block:
	mv		returnVal_169,returnVal_168
	mv		returnVal_170,returnVal_169
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block_2:
	mv		returnVal_171,returnVal_170
	mv		returnVal_172,returnVal_171
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_split_block_2:
	mv		returnVal_173,returnVal_172
	mv		returnVal_174,returnVal_173
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_175,returnVal_174
	mv		returnVal_176,returnVal_175
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_3

findLargest_fake_fake_findLargest_4_findLargest_split_block_3:
	mv		returnVal_177,returnVal_176
	mv		returnVal_115,returnVal_177
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_178,0(vReg_160)
	addi	vReg_179,vReg_178,8
	lw		vReg_180,0(vReg_179)
	mv		a0,vReg_180
	call	findLargest
	mv		vReg_181,a0
	mv		returnVal_182,vReg_181
	mv		returnVal_166,returnVal_182
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_183,vReg_151
	mv		returnVal_168,returnVal_183
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_184,vReg_143
	mv		returnVal_170,returnVal_184
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_then:
	mv		returnVal_185,vReg_135
	mv		returnVal_172,returnVal_185
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_186,vReg_127
	mv		returnVal_174,returnVal_186
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_187,vReg_119
	mv		returnVal_176,returnVal_187
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_3

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_188,vReg_87
	mv		returnVal_104,returnVal_188
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_189,vReg_66
	mv		returnVal_83,returnVal_189
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_190,vReg_23
	mv		returnVal_40,returnVal_190
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
	li		imm_19,0
	beq		cur_13,imm_19,eraseImpl__if_then
	j		eraseImpl__if_merge

eraseImpl__if_then:
	li		imm_21,0
	mv		returnVal_20,imm_21
	mv		root_22,root_18
	mv		returnVal_23,returnVal_20
	j		eraseImpl_exit

eraseImpl_exit:
	lui		global_tmp_24,0
	sw		root_22,0(global_tmp_24)
	mv		a0,returnVal_23
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
	addi	vReg_25,cur_13,8
	lw		vReg_26,0(vReg_25)
	bgt		vReg_26,key_16,eraseImpl__if_then_14
	j		eraseImpl__if_merge_2

eraseImpl__if_merge_2:
	lw		vReg_27,0(vReg_25)
	blt		vReg_27,key_16,eraseImpl__if_then_2
	j		eraseImpl__if_merge_3

eraseImpl__if_then_2:
	addi	vReg_28,cur_13,4
	lw		vReg_29,0(vReg_28)
	addi	vReg_30,vReg_29,8
	lw		vReg_31,0(vReg_30)
	lui		global_tmp_32,0
	sw		root_18,0(global_tmp_32)
	mv		a0,vReg_31
	mv		a1,cur_13
	li		imm_33,1
	mv		a2,imm_33
	mv		a3,key_16
	call	eraseImpl
	mv		vReg_34,a0
	lui		global_tmp_35,0
	lw		root_36,0(global_tmp_35)
	mv		returnVal_37,vReg_34
	mv		root_22,root_36
	mv		returnVal_23,returnVal_37
	j		eraseImpl_exit

eraseImpl__if_merge_3:
	addi	vReg_38,cur_13,12
	lw		vReg_39,0(vReg_38)
	addi	vReg_40,vReg_39,-1
	sw		vReg_40,0(vReg_38)
	lw		vReg_41,0(vReg_38)
	li		imm_42,0
	bgt		vReg_41,imm_42,eraseImpl__if_then_3
	j		eraseImpl__if_merge_4

eraseImpl__if_then_3:
	li		imm_44,1
	mv		returnVal_43,imm_44
	mv		root_22,root_18
	mv		returnVal_23,returnVal_43
	j		eraseImpl_exit

eraseImpl__if_merge_4:
	addi	vReg_45,cur_13,4
	lw		vReg_46,0(vReg_45)
	addi	vReg_47,vReg_46,4
	lw		vReg_48,0(vReg_47)
	li		imm_49,0
	beq		vReg_48,imm_49,eraseImpl__if_then_4
	j		eraseImpl__if_merge_8

eraseImpl__if_then_4:
	li		imm_50,0
	bne		pnt_14,imm_50,eraseImpl__if_then_5
	j		eraseImpl__if_merge_5

eraseImpl__if_then_5:
	addi	vReg_51,pnt_14,4
	lw		vReg_52,0(vReg_51)
	li		imm_54,4
	mul		vReg_53,childId_15,imm_54
	addi	vReg_55,vReg_53,4
	add		vReg_56,vReg_55,vReg_52
	lw		vReg_57,0(vReg_45)
	addi	vReg_58,vReg_57,8
	lw		vReg_59,0(vReg_58)
	sw		vReg_59,0(vReg_56)
	j		eraseImpl__if_merge_5

eraseImpl__if_merge_5:
	addi	vReg_60,cur_13,4
	lw		vReg_61,0(vReg_60)
	addi	vReg_62,vReg_61,8
	lw		vReg_63,0(vReg_62)
	li		imm_64,0
	bne		vReg_63,imm_64,eraseImpl__if_then_7
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_6:
	addi	vReg_65,root_18,8
	lw		vReg_66,0(vReg_65)
	beq		key_16,vReg_66,eraseImpl__if_then_6
	j		eraseImpl__parallel_copy_

eraseImpl__parallel_copy_:
	mv		root_67,root_18
	j		eraseImpl__if_merge_7

eraseImpl__if_merge_7:
	li		imm_69,1
	mv		returnVal_68,imm_69
	mv		root_22,root_67
	mv		returnVal_23,returnVal_68
	j		eraseImpl_exit

eraseImpl__if_then_6:
	addi	vReg_70,cur_13,4
	lw		vReg_71,0(vReg_70)
	addi	vReg_72,vReg_71,8
	lw		vReg_73,0(vReg_72)
	mv		root_74,vReg_73
	mv		root_67,root_74
	j		eraseImpl__if_merge_7

eraseImpl__if_then_7:
	lw		vReg_75,0(vReg_60)
	addi	vReg_76,vReg_75,8
	lw		vReg_77,0(vReg_76)
	addi	vReg_78,vReg_77,0
	sw		pnt_14,0(vReg_78)
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_8:
	lw		vReg_79,0(vReg_45)
	addi	vReg_80,vReg_79,4
	lw		vReg_81,0(vReg_80)
	addi	vReg_82,vReg_81,4
	lw		vReg_83,0(vReg_82)
	addi	vReg_84,vReg_83,8
	lw		vReg_85,0(vReg_84)
	li		imm_86,0
	beq		vReg_85,imm_86,eraseImpl_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_87,0(vReg_82)
	addi	vReg_88,vReg_87,8
	lw		vReg_89,0(vReg_88)
	addi	vReg_90,vReg_89,4
	lw		vReg_91,0(vReg_90)
	addi	vReg_92,vReg_91,8
	lw		vReg_93,0(vReg_92)
	li		imm_94,0
	beq		vReg_93,imm_94,eraseImpl_fake_fake_findLargest_2_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_95,0(vReg_90)
	addi	vReg_96,vReg_95,8
	lw		vReg_97,0(vReg_96)
	addi	vReg_98,vReg_97,4
	lw		vReg_99,0(vReg_98)
	addi	vReg_100,vReg_99,8
	lw		vReg_101,0(vReg_100)
	li		imm_102,0
	beq		vReg_101,imm_102,eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_103,vReg_97
	mv		returnVal_104,returnVal_103
	j		eraseImpl_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_105,returnVal_104
	mv		returnVal_106,returnVal_105
	j		eraseImpl_split_block

eraseImpl_split_block:
	mv		returnVal_107,returnVal_106
	mv		returnVal_108,returnVal_107
	j		eraseImpl_split_block_2

eraseImpl_split_block_2:
	addi	vReg_109,root_18,8
	lw		vReg_110,0(vReg_109)
	beq		key_16,vReg_110,eraseImpl__if_then_13
	j		eraseImpl__parallel_copy__2

eraseImpl__parallel_copy__2:
	mv		root_111,root_18
	j		eraseImpl__if_merge_9

eraseImpl__if_merge_9:
	addi	vReg_112,returnVal_108,8
	addi	vReg_113,cur_13,4
	lw		vReg_114,0(vReg_113)
	addi	vReg_115,vReg_114,4
	lw		vReg_116,0(vReg_115)
	addi	vReg_117,vReg_116,8
	lw		vReg_118,0(vReg_112)
	lw		vReg_119,0(vReg_117)
	bne		vReg_118,vReg_119,eraseImpl__if_then_11
	j		eraseImpl__if_merge_10

eraseImpl__if_merge_10:
	li		imm_120,0
	bne		pnt_14,imm_120,eraseImpl__if_then_10
	j		eraseImpl__if_merge_11

eraseImpl__if_merge_11:
	addi	vReg_121,returnVal_108,0
	sw		pnt_14,0(vReg_121)
	addi	vReg_122,returnVal_108,4
	lw		vReg_123,0(vReg_122)
	addi	vReg_124,vReg_123,8
	addi	vReg_125,cur_13,4
	lw		vReg_126,0(vReg_125)
	addi	vReg_127,vReg_126,8
	lw		vReg_128,0(vReg_127)
	sw		vReg_128,0(vReg_124)
	lw		vReg_129,0(vReg_125)
	addi	vReg_130,vReg_129,8
	lw		vReg_131,0(vReg_130)
	li		imm_132,0
	bne		vReg_131,imm_132,eraseImpl__if_then_9
	j		eraseImpl__if_merge_12

eraseImpl__if_merge_12:
	addi	vReg_133,returnVal_108,8
	addi	vReg_134,cur_13,4
	lw		vReg_135,0(vReg_134)
	addi	vReg_136,vReg_135,4
	lw		vReg_137,0(vReg_136)
	addi	vReg_138,vReg_137,8
	lw		vReg_139,0(vReg_133)
	lw		vReg_140,0(vReg_138)
	bne		vReg_139,vReg_140,eraseImpl__if_then_8
	j		eraseImpl__if_merge_13

eraseImpl__if_merge_13:
	li		imm_142,1
	mv		returnVal_141,imm_142
	mv		root_22,root_111
	mv		returnVal_23,returnVal_141
	j		eraseImpl_exit

eraseImpl__if_then_8:
	addi	vReg_143,returnVal_108,4
	lw		vReg_144,0(vReg_143)
	addi	vReg_145,vReg_144,4
	lw		vReg_146,0(vReg_134)
	addi	vReg_147,vReg_146,4
	lw		vReg_148,0(vReg_147)
	sw		vReg_148,0(vReg_145)
	lw		vReg_149,0(vReg_134)
	addi	vReg_150,vReg_149,4
	lw		vReg_151,0(vReg_150)
	addi	vReg_152,vReg_151,0
	sw		returnVal_108,0(vReg_152)
	j		eraseImpl__if_merge_13

eraseImpl__if_then_9:
	lw		vReg_153,0(vReg_125)
	addi	vReg_154,vReg_153,8
	lw		vReg_155,0(vReg_154)
	addi	vReg_156,vReg_155,0
	sw		returnVal_108,0(vReg_156)
	j		eraseImpl__if_merge_12

eraseImpl__if_then_10:
	addi	vReg_157,pnt_14,4
	lw		vReg_158,0(vReg_157)
	li		imm_160,4
	mul		vReg_159,childId_15,imm_160
	addi	vReg_161,vReg_159,4
	add		vReg_162,vReg_161,vReg_158
	sw		returnVal_108,0(vReg_162)
	j		eraseImpl__if_merge_11

eraseImpl__if_then_11:
	addi	vReg_163,returnVal_108,0
	lw		vReg_164,0(vReg_163)
	addi	vReg_165,vReg_164,4
	lw		vReg_166,0(vReg_165)
	addi	vReg_167,vReg_166,8
	addi	vReg_168,returnVal_108,4
	lw		vReg_169,0(vReg_168)
	addi	vReg_170,vReg_169,4
	lw		vReg_171,0(vReg_170)
	sw		vReg_171,0(vReg_167)
	lw		vReg_172,0(vReg_168)
	addi	vReg_173,vReg_172,4
	lw		vReg_174,0(vReg_173)
	li		imm_175,0
	bne		vReg_174,imm_175,eraseImpl__if_then_12
	j		eraseImpl__if_merge_10

eraseImpl__if_then_12:
	lw		vReg_176,0(vReg_168)
	addi	vReg_177,vReg_176,4
	lw		vReg_178,0(vReg_177)
	addi	vReg_179,vReg_178,0
	lw		vReg_180,0(vReg_163)
	sw		vReg_180,0(vReg_179)
	j		eraseImpl__if_merge_10

eraseImpl__if_then_13:
	mv		root_181,returnVal_108
	mv		root_111,root_181
	j		eraseImpl__if_merge_9

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_182,0(vReg_98)
	addi	vReg_183,vReg_182,8
	lw		vReg_184,0(vReg_183)
	addi	vReg_185,vReg_184,4
	lw		vReg_186,0(vReg_185)
	addi	vReg_187,vReg_186,8
	lw		vReg_188,0(vReg_187)
	li		imm_189,0
	beq		vReg_188,imm_189,eraseImpl_fake_fake_findLargest_3_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest__if_then:
	mv		returnVal_190,vReg_184
	mv		returnVal_191,returnVal_190
	j		eraseImpl_split_block_3

eraseImpl_split_block_3:
	mv		returnVal_192,returnVal_191
	mv		returnVal_104,returnVal_192
	j		eraseImpl_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge:
	lw		vReg_193,0(vReg_185)
	addi	vReg_194,vReg_193,8
	lw		vReg_195,0(vReg_194)
	addi	vReg_196,vReg_195,4
	lw		vReg_197,0(vReg_196)
	addi	vReg_198,vReg_197,8
	lw		vReg_199,0(vReg_198)
	li		imm_200,0
	beq		vReg_199,imm_200,eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_201,0(vReg_196)
	addi	vReg_202,vReg_201,8
	lw		vReg_203,0(vReg_202)
	addi	vReg_204,vReg_203,4
	lw		vReg_205,0(vReg_204)
	addi	vReg_206,vReg_205,8
	lw		vReg_207,0(vReg_206)
	li		imm_208,0
	beq		vReg_207,imm_208,eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_209,vReg_203
	mv		returnVal_210,returnVal_209
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_split_block:
	mv		returnVal_211,returnVal_210
	mv		returnVal_212,returnVal_211
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block_2

eraseImpl_fake_fake_findLargest_3_findLargest_split_block_2:
	mv		returnVal_213,returnVal_212
	mv		returnVal_191,returnVal_213
	j		eraseImpl_split_block_3

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_214,0(vReg_204)
	addi	vReg_215,vReg_214,8
	lw		vReg_216,0(vReg_215)
	addi	vReg_217,vReg_216,4
	lw		vReg_218,0(vReg_217)
	addi	vReg_219,vReg_218,8
	lw		vReg_220,0(vReg_219)
	li		imm_221,0
	beq		vReg_220,imm_221,eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_222,vReg_216
	mv		returnVal_223,returnVal_222
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_224,returnVal_223
	mv		returnVal_210,returnVal_224
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_225,0(vReg_217)
	addi	vReg_226,vReg_225,8
	lw		vReg_227,0(vReg_226)
	mv		a0,vReg_227
	call	findLargest
	mv		vReg_228,a0
	mv		returnVal_229,vReg_228
	mv		returnVal_223,returnVal_229
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_230,vReg_195
	mv		returnVal_212,returnVal_230
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block_2

eraseImpl_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_231,vReg_89
	mv		returnVal_106,returnVal_231
	j		eraseImpl_split_block

eraseImpl_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_232,vReg_81
	mv		returnVal_108,returnVal_232
	j		eraseImpl_split_block_2

eraseImpl__if_then_14:
	addi	vReg_233,cur_13,4
	lw		vReg_234,0(vReg_233)
	addi	vReg_235,vReg_234,4
	lw		vReg_236,0(vReg_235)
	lui		global_tmp_237,0
	sw		root_18,0(global_tmp_237)
	mv		a0,vReg_236
	mv		a1,cur_13
	li		imm_238,0
	mv		a2,imm_238
	mv		a3,key_16
	call	eraseImpl
	mv		vReg_239,a0
	lui		global_tmp_240,0
	lw		root_241,0(global_tmp_240)
	mv		returnVal_242,vReg_239
	mv		root_22,root_241
	mv		returnVal_23,returnVal_242
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
	li		imm_14,0
	beq		cur_13,imm_14,printTree_exit
	j		printTree__if_merge

printTree__if_merge:
	addi	vReg_15,cur_13,4
	lw		vReg_16,0(vReg_15)
	addi	vReg_17,vReg_16,4
	lw		vReg_18,0(vReg_17)
	li		imm_19,0
	beq		vReg_18,imm_19,printTree_split_block_2
	j		printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	vReg_20,vReg_18,4
	lw		vReg_21,0(vReg_20)
	addi	vReg_22,vReg_21,4
	lw		vReg_23,0(vReg_22)
	li		imm_24,0
	beq		vReg_23,imm_24,printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree__if_merge

printTree_fake_fake_printTree_2_printTree__if_merge:
	addi	vReg_25,vReg_23,4
	lw		vReg_26,0(vReg_25)
	addi	vReg_27,vReg_26,4
	lw		vReg_28,0(vReg_27)
	li		imm_29,0
	beq		vReg_28,imm_29,printTree_fake_fake_printTree_2_printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	vReg_30,vReg_28,4
	lw		vReg_31,0(vReg_30)
	addi	vReg_32,vReg_31,4
	lw		vReg_33,0(vReg_32)
	mv		a0,vReg_33
	call	printTree
	addi	vReg_34,vReg_28,8
	lw		vReg_35,0(vReg_34)
	mv		a0,vReg_35
	call	__builtin_printInt
	la		str_const_36,__str_const_1
	mv		a0,str_const_36
	call	__builtin_print
	addi	vReg_37,vReg_28,12
	lw		vReg_38,0(vReg_37)
	mv		a0,vReg_38
	call	__builtin_printlnInt
	lw		vReg_39,0(vReg_30)
	addi	vReg_40,vReg_39,8
	lw		vReg_41,0(vReg_40)
	mv		a0,vReg_41
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block

printTree_fake_fake_printTree_2_printTree_split_block:
	addi	vReg_42,vReg_23,8
	lw		vReg_43,0(vReg_42)
	mv		a0,vReg_43
	call	__builtin_printInt
	la		str_const_44,__str_const_1
	mv		a0,str_const_44
	call	__builtin_print
	addi	vReg_45,vReg_23,12
	lw		vReg_46,0(vReg_45)
	mv		a0,vReg_46
	call	__builtin_printlnInt
	addi	vReg_47,vReg_23,4
	lw		vReg_48,0(vReg_47)
	addi	vReg_49,vReg_48,8
	lw		vReg_50,0(vReg_49)
	li		imm_51,0
	beq		vReg_50,imm_51,printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	vReg_52,vReg_50,4
	lw		vReg_53,0(vReg_52)
	addi	vReg_54,vReg_53,4
	lw		vReg_55,0(vReg_54)
	mv		a0,vReg_55
	call	printTree
	addi	vReg_56,vReg_50,8
	lw		vReg_57,0(vReg_56)
	mv		a0,vReg_57
	call	__builtin_printInt
	la		str_const_58,__str_const_1
	mv		a0,str_const_58
	call	__builtin_print
	addi	vReg_59,vReg_50,12
	lw		vReg_60,0(vReg_59)
	mv		a0,vReg_60
	call	__builtin_printlnInt
	lw		vReg_61,0(vReg_52)
	addi	vReg_62,vReg_61,8
	lw		vReg_63,0(vReg_62)
	mv		a0,vReg_63
	call	printTree
	j		printTree_split_block

printTree_split_block:
	addi	vReg_64,vReg_18,8
	lw		vReg_65,0(vReg_64)
	mv		a0,vReg_65
	call	__builtin_printInt
	la		str_const_66,__str_const_1
	mv		a0,str_const_66
	call	__builtin_print
	addi	vReg_67,vReg_18,12
	lw		vReg_68,0(vReg_67)
	mv		a0,vReg_68
	call	__builtin_printlnInt
	addi	vReg_69,vReg_18,4
	lw		vReg_70,0(vReg_69)
	addi	vReg_71,vReg_70,8
	lw		vReg_72,0(vReg_71)
	mv		a0,vReg_72
	call	printTree
	j		printTree_split_block_2

printTree_split_block_2:
	addi	vReg_73,cur_13,8
	lw		vReg_74,0(vReg_73)
	mv		a0,vReg_74
	call	__builtin_printInt
	la		str_const_75,__str_const_1
	mv		a0,str_const_75
	call	__builtin_print
	addi	vReg_76,cur_13,12
	lw		vReg_77,0(vReg_76)
	mv		a0,vReg_77
	call	__builtin_printlnInt
	addi	vReg_78,cur_13,4
	lw		vReg_79,0(vReg_78)
	addi	vReg_80,vReg_79,8
	lw		vReg_81,0(vReg_80)
	li		imm_82,0
	beq		vReg_81,imm_82,printTree_exit
	j		printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	vReg_83,vReg_81,4
	lw		vReg_84,0(vReg_83)
	addi	vReg_85,vReg_84,4
	lw		vReg_86,0(vReg_85)
	mv		a0,vReg_86
	call	printTree
	addi	vReg_87,vReg_81,8
	lw		vReg_88,0(vReg_87)
	mv		a0,vReg_88
	call	__builtin_printInt
	la		str_const_89,__str_const_1
	mv		a0,str_const_89
	call	__builtin_print
	addi	vReg_90,vReg_81,12
	lw		vReg_91,0(vReg_90)
	mv		a0,vReg_91
	call	__builtin_printlnInt
	lw		vReg_92,0(vReg_83)
	addi	vReg_93,vReg_92,8
	lw		vReg_94,0(vReg_93)
	mv		a0,vReg_94
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
	mv		seed_20,vReg_19
	li		imm_22,10
	div		vReg_21,MaxRandInt_18,imm_22
	li		imm_24,8
	mul		vReg_23,imm_24,vReg_21
	li		imm_26,0
	mv		i_25,imm_26
	mv		seed_27,seed_20
	mv		root_28,root_16
	mv		i_29,i_25
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations__for_cond:
	li		imm_30,50000
	blt		i_29,imm_30,main_fake_generateOperations_split_block_9
	j		main_split_block

main_split_block:
	li		imm_32,10
	div		vReg_31,MaxRandInt_18,imm_32
	li		imm_34,2
	mul		vReg_33,imm_34,vReg_31
	li		imm_36,0
	mv		i_35,imm_36
	mv		i_37,i_35
	mv		seed_38,seed_27
	mv		root_39,root_28
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations__for_cond_2:
	li		imm_40,100000
	blt		i_37,imm_40,main_fake_generateOperations_split_block
	j		main_split_block_3

main_fake_generateOperations_split_block:
	slli	vReg_41,seed_38,13
	xor		vReg_42,seed_38,vReg_41
	li		imm_44,2147483647
	and		vReg_43,vReg_42,imm_44
	srai	vReg_45,vReg_43,17
	xor		vReg_46,vReg_43,vReg_45
	slli	vReg_47,vReg_46,5
	xor		vReg_48,vReg_46,vReg_47
	li		imm_50,2147483647
	and		vReg_49,vReg_48,imm_50
	rem		vReg_51,vReg_49,MAX_14
	slli	vReg_52,vReg_49,13
	xor		vReg_53,vReg_49,vReg_52
	li		imm_55,2147483647
	and		vReg_54,vReg_53,imm_55
	srai	vReg_56,vReg_54,17
	xor		vReg_57,vReg_54,vReg_56
	slli	vReg_58,vReg_57,5
	xor		vReg_59,vReg_57,vReg_58
	li		imm_61,2147483647
	and		vReg_60,vReg_59,imm_61
	mv		seed_62,vReg_60
	blt		vReg_60,vReg_33,main_fake_generateOperations_fake_randOp__if_then
	j		main_fake_generateOperations_fake_randOp__if_merge

main_fake_generateOperations_fake_randOp__if_merge:
	li		imm_64,2
	mv		returnVal_63,imm_64
	mv		returnVal_65,returnVal_63
	j		main_fake_generateOperations_split_block_2

main_fake_generateOperations_split_block_2:
	li		imm_66,1
	beq		returnVal_65,imm_66,main_fake_generateOperations__if_then
	j		main_fake_generateOperations__if_else

main_fake_generateOperations__if_else:
	li		imm_67,0
	beq		root_39,imm_67,main_fake_generateOperations_fake_erase__if_then
	j		main_fake_generateOperations_fake_erase__if_merge

main_fake_generateOperations_fake_erase__if_then:
	mv		root_68,root_39
	j		main_fake_generateOperations_split_block_3

main_fake_generateOperations_split_block_3:
	mv		root_69,root_68
	j		main_fake_generateOperations__for_step

main_fake_generateOperations__for_step:
	addi	i_70,i_37,1
	mv		i_37,i_70
	mv		seed_38,seed_62
	mv		root_39,root_69
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations_fake_erase__if_merge:
	lui		global_tmp_71,0
	sw		root_39,0(global_tmp_71)
	mv		a0,root_39
	li		imm_72,0
	mv		a1,imm_72
	li		imm_73,-1
	mv		a2,imm_73
	mv		a3,vReg_51
	call	eraseImpl
	mv		vReg_74,a0
	lui		global_tmp_75,0
	lw		root_76,0(global_tmp_75)
	mv		root_68,root_76
	j		main_fake_generateOperations_split_block_3

main_fake_generateOperations__if_then:
	li		imm_77,0
	bne		root_39,imm_77,main_fake_generateOperations_fake_insert__if_then
	j		main_fake_generateOperations_fake_insert_split_block

main_fake_generateOperations_fake_insert__if_then:
	li		imm_78,0
	beq		root_39,imm_78,main_fake_fake_insertImpl_1_insertImpl_split_block
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge

main_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	vReg_79,root_39,8
	lw		vReg_80,0(vReg_79)
	beq		vReg_80,vReg_51,main_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_2

main_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		imm_82,0
	mv		id_81,imm_82
	lw		vReg_83,0(vReg_79)
	blt		vReg_83,vReg_51,main_fake_fake_insertImpl_1_insertImpl__if_then
	j		main__parallel_copy_

main__parallel_copy_:
	mv		id_84,id_81
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	vReg_85,root_39,4
	lw		vReg_86,0(vReg_85)
	li		imm_88,4
	mul		vReg_87,id_84,imm_88
	addi	vReg_89,vReg_87,4
	add		vReg_90,vReg_89,vReg_86
	lw		vReg_91,0(vReg_90)
	mv		a0,vReg_91
	mv		a1,root_39
	mv		a2,id_84
	mv		a3,vReg_51
	call	insertImpl
	mv		vReg_92,a0
	j		main_split_block_2

main_split_block_2:
	mv		root_93,root_39
	j		main_fake_generateOperations_split_block_4

main_fake_generateOperations_split_block_4:
	mv		root_69,root_93
	j		main_fake_generateOperations__for_step

main_fake_fake_insertImpl_1_insertImpl__if_then:
	li		imm_95,1
	mv		id_94,imm_95
	mv		id_84,id_94
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	vReg_96,root_39,12
	lw		vReg_97,0(vReg_96)
	addi	vReg_98,vReg_97,1
	sw		vReg_98,0(vReg_96)
	j		main_split_block_2

main_fake_fake_insertImpl_1_insertImpl_split_block:
	li		imm_99,16
	mv		a0,imm_99
	call	malloc
	mv		vReg_100,a0
	addi	vReg_101,vReg_100,4
	li		imm_102,12
	mv		a0,imm_102
	call	malloc
	mv		vReg_103,a0
	li		imm_104,2
	sw		imm_104,0(vReg_103)
	sw		vReg_103,0(vReg_101)
	addi	vReg_105,vReg_100,8
	sw		vReg_51,0(vReg_105)
	addi	vReg_106,vReg_100,12
	li		imm_107,1
	sw		imm_107,0(vReg_106)
	addi	vReg_108,vReg_100,0
	li		imm_109,0
	sw		imm_109,0(vReg_108)
	lw		vReg_110,0(vReg_101)
	addi	vReg_111,vReg_110,4
	li		imm_112,0
	sw		imm_112,0(vReg_111)
	lw		vReg_113,0(vReg_101)
	addi	vReg_114,vReg_113,8
	li		imm_115,0
	sw		imm_115,0(vReg_114)
	li		imm_117,4
	lw		vReg_116,0(imm_117)
	addi	vReg_118,vReg_116,0
	sw		vReg_100,0(vReg_118)
	j		main_split_block_2

main_fake_generateOperations_fake_insert_split_block:
	li		imm_119,16
	mv		a0,imm_119
	call	malloc
	mv		vReg_120,a0
	addi	vReg_121,vReg_120,4
	li		imm_122,12
	mv		a0,imm_122
	call	malloc
	mv		vReg_123,a0
	li		imm_124,2
	sw		imm_124,0(vReg_123)
	sw		vReg_123,0(vReg_121)
	addi	vReg_125,vReg_120,8
	sw		vReg_51,0(vReg_125)
	addi	vReg_126,vReg_120,12
	li		imm_127,1
	sw		imm_127,0(vReg_126)
	addi	vReg_128,vReg_120,0
	li		imm_129,0
	sw		imm_129,0(vReg_128)
	lw		vReg_130,0(vReg_121)
	addi	vReg_131,vReg_130,4
	li		imm_132,0
	sw		imm_132,0(vReg_131)
	lw		vReg_133,0(vReg_121)
	addi	vReg_134,vReg_133,8
	li		imm_135,0
	sw		imm_135,0(vReg_134)
	mv		root_136,vReg_120
	mv		root_93,root_136
	j		main_fake_generateOperations_split_block_4

main_fake_generateOperations_fake_randOp__if_then:
	li		imm_138,1
	mv		returnVal_137,imm_138
	mv		returnVal_65,returnVal_137
	j		main_fake_generateOperations_split_block_2

main_split_block_3:
	li		imm_140,10
	div		vReg_139,MaxRandInt_18,imm_140
	li		imm_142,4
	mul		vReg_141,imm_142,vReg_139
	li		imm_144,0
	mv		i_143,imm_144
	mv		seed_145,seed_38
	mv		i_146,i_143
	mv		root_147,root_39
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations__for_cond_3:
	li		imm_148,50000
	blt		i_146,imm_148,main_fake_generateOperations_split_block_5
	j		main_split_block_4

main_split_block_4:
	li		imm_149,0
	beq		root_147,imm_149,main_split_block_5
	j		main_fake_fake_printTree_1_printTree__if_merge

main_split_block_5:
	lui		global_tmp_150,0
	sw		root_147,0(global_tmp_150)
	lui		global_tmp_151,0
	sw		seed_145,0(global_tmp_151)
	li		imm_152,0
	mv		a0,imm_152
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
	addi	vReg_153,root_147,4
	lw		vReg_154,0(vReg_153)
	addi	vReg_155,vReg_154,4
	lw		vReg_156,0(vReg_155)
	mv		a0,vReg_156
	call	printTree
	addi	vReg_157,root_147,8
	lw		vReg_158,0(vReg_157)
	mv		a0,vReg_158
	call	__builtin_printInt
	la		str_const_159,__str_const_1
	mv		a0,str_const_159
	call	__builtin_print
	addi	vReg_160,root_147,12
	lw		vReg_161,0(vReg_160)
	mv		a0,vReg_161
	call	__builtin_printlnInt
	lw		vReg_162,0(vReg_153)
	addi	vReg_163,vReg_162,8
	lw		vReg_164,0(vReg_163)
	mv		a0,vReg_164
	call	printTree
	j		main_split_block_5

main_fake_generateOperations_split_block_5:
	slli	vReg_165,seed_145,13
	xor		vReg_166,seed_145,vReg_165
	li		imm_168,2147483647
	and		vReg_167,vReg_166,imm_168
	srai	vReg_169,vReg_167,17
	xor		vReg_170,vReg_167,vReg_169
	slli	vReg_171,vReg_170,5
	xor		vReg_172,vReg_170,vReg_171
	li		imm_174,2147483647
	and		vReg_173,vReg_172,imm_174
	rem		vReg_175,vReg_173,MAX_14
	slli	vReg_176,vReg_173,13
	xor		vReg_177,vReg_173,vReg_176
	li		imm_179,2147483647
	and		vReg_178,vReg_177,imm_179
	srai	vReg_180,vReg_178,17
	xor		vReg_181,vReg_178,vReg_180
	slli	vReg_182,vReg_181,5
	xor		vReg_183,vReg_181,vReg_182
	li		imm_185,2147483647
	and		vReg_184,vReg_183,imm_185
	mv		seed_186,vReg_184
	blt		vReg_184,vReg_141,main_fake_generateOperations_fake_randOp__if_then_2
	j		main_fake_generateOperations_fake_randOp__if_merge_2

main_fake_generateOperations_fake_randOp__if_then_2:
	li		imm_188,1
	mv		returnVal_187,imm_188
	mv		returnVal_189,returnVal_187
	j		main_fake_generateOperations_split_block_6

main_fake_generateOperations_split_block_6:
	li		imm_190,1
	beq		returnVal_189,imm_190,main_fake_generateOperations__if_then_2
	j		main_fake_generateOperations__if_else_2

main_fake_generateOperations__if_then_2:
	li		imm_191,0
	bne		root_147,imm_191,main_fake_generateOperations_fake_insert__if_then_2
	j		main_fake_generateOperations_fake_insert_split_block_2

main_fake_generateOperations_fake_insert_split_block_2:
	li		imm_192,16
	mv		a0,imm_192
	call	malloc
	mv		vReg_193,a0
	addi	vReg_194,vReg_193,4
	li		imm_195,12
	mv		a0,imm_195
	call	malloc
	mv		vReg_196,a0
	li		imm_197,2
	sw		imm_197,0(vReg_196)
	sw		vReg_196,0(vReg_194)
	addi	vReg_198,vReg_193,8
	sw		vReg_175,0(vReg_198)
	addi	vReg_199,vReg_193,12
	li		imm_200,1
	sw		imm_200,0(vReg_199)
	addi	vReg_201,vReg_193,0
	li		imm_202,0
	sw		imm_202,0(vReg_201)
	lw		vReg_203,0(vReg_194)
	addi	vReg_204,vReg_203,4
	li		imm_205,0
	sw		imm_205,0(vReg_204)
	lw		vReg_206,0(vReg_194)
	addi	vReg_207,vReg_206,8
	li		imm_208,0
	sw		imm_208,0(vReg_207)
	mv		root_209,vReg_193
	mv		root_210,root_209
	j		main_fake_generateOperations_split_block_7

main_fake_generateOperations_split_block_7:
	mv		root_211,root_210
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations__for_step_2:
	addi	i_212,i_146,1
	mv		seed_145,seed_186
	mv		i_146,i_212
	mv		root_147,root_211
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations_fake_insert__if_then_2:
	li		imm_213,0
	beq		root_147,imm_213,main_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_4

main_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		imm_214,16
	mv		a0,imm_214
	call	malloc
	mv		vReg_215,a0
	addi	vReg_216,vReg_215,4
	li		imm_217,12
	mv		a0,imm_217
	call	malloc
	mv		vReg_218,a0
	li		imm_219,2
	sw		imm_219,0(vReg_218)
	sw		vReg_218,0(vReg_216)
	addi	vReg_220,vReg_215,8
	sw		vReg_175,0(vReg_220)
	addi	vReg_221,vReg_215,12
	li		imm_222,1
	sw		imm_222,0(vReg_221)
	addi	vReg_223,vReg_215,0
	li		imm_224,0
	sw		imm_224,0(vReg_223)
	lw		vReg_225,0(vReg_216)
	addi	vReg_226,vReg_225,4
	li		imm_227,0
	sw		imm_227,0(vReg_226)
	lw		vReg_228,0(vReg_216)
	addi	vReg_229,vReg_228,8
	li		imm_230,0
	sw		imm_230,0(vReg_229)
	li		imm_232,4
	lw		vReg_231,0(imm_232)
	addi	vReg_233,vReg_231,0
	sw		vReg_215,0(vReg_233)
	j		main_split_block_6

main_split_block_6:
	mv		root_210,root_147
	j		main_fake_generateOperations_split_block_7

main_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	vReg_234,root_147,8
	lw		vReg_235,0(vReg_234)
	beq		vReg_235,vReg_175,main_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_5

main_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	li		imm_237,0
	mv		id_236,imm_237
	lw		vReg_238,0(vReg_234)
	blt		vReg_238,vReg_175,main_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		main__parallel_copy__2

main_fake_fake_insertImpl_1_insertImpl__if_then_3:
	li		imm_240,1
	mv		id_239,imm_240
	mv		id_241,id_239
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	vReg_242,root_147,4
	lw		vReg_243,0(vReg_242)
	li		imm_245,4
	mul		vReg_244,id_241,imm_245
	addi	vReg_246,vReg_244,4
	add		vReg_247,vReg_246,vReg_243
	lw		vReg_248,0(vReg_247)
	mv		a0,vReg_248
	mv		a1,root_147
	mv		a2,id_241
	mv		a3,vReg_175
	call	insertImpl
	mv		vReg_249,a0
	j		main_split_block_6

main__parallel_copy__2:
	mv		id_241,id_236
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_then_4:
	addi	vReg_250,root_147,12
	lw		vReg_251,0(vReg_250)
	addi	vReg_252,vReg_251,1
	sw		vReg_252,0(vReg_250)
	j		main_split_block_6

main_fake_generateOperations__if_else_2:
	li		imm_253,0
	beq		root_147,imm_253,main_fake_generateOperations_fake_erase__if_then_2
	j		main_fake_generateOperations_fake_erase__if_merge_2

main_fake_generateOperations_fake_erase__if_then_2:
	mv		root_254,root_147
	j		main_fake_generateOperations_split_block_8

main_fake_generateOperations_split_block_8:
	mv		root_211,root_254
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations_fake_erase__if_merge_2:
	lui		global_tmp_255,0
	sw		root_147,0(global_tmp_255)
	mv		a0,root_147
	li		imm_256,0
	mv		a1,imm_256
	li		imm_257,-1
	mv		a2,imm_257
	mv		a3,vReg_175
	call	eraseImpl
	mv		vReg_258,a0
	lui		global_tmp_259,0
	lw		root_260,0(global_tmp_259)
	mv		root_254,root_260
	j		main_fake_generateOperations_split_block_8

main_fake_generateOperations_fake_randOp__if_merge_2:
	li		imm_262,2
	mv		returnVal_261,imm_262
	mv		returnVal_189,returnVal_261
	j		main_fake_generateOperations_split_block_6

main_fake_generateOperations_split_block_9:
	slli	vReg_263,seed_27,13
	xor		vReg_264,seed_27,vReg_263
	li		imm_266,2147483647
	and		vReg_265,vReg_264,imm_266
	srai	vReg_267,vReg_265,17
	xor		vReg_268,vReg_265,vReg_267
	slli	vReg_269,vReg_268,5
	xor		vReg_270,vReg_268,vReg_269
	li		imm_272,2147483647
	and		vReg_271,vReg_270,imm_272
	rem		vReg_273,vReg_271,MAX_14
	slli	vReg_274,vReg_271,13
	xor		vReg_275,vReg_271,vReg_274
	li		imm_277,2147483647
	and		vReg_276,vReg_275,imm_277
	srai	vReg_278,vReg_276,17
	xor		vReg_279,vReg_276,vReg_278
	slli	vReg_280,vReg_279,5
	xor		vReg_281,vReg_279,vReg_280
	li		imm_283,2147483647
	and		vReg_282,vReg_281,imm_283
	mv		seed_284,vReg_282
	blt		vReg_282,vReg_23,main_fake_generateOperations_fake_randOp__if_then_3
	j		main_fake_generateOperations_fake_randOp__if_merge_3

main_fake_generateOperations_fake_randOp__if_then_3:
	li		imm_286,1
	mv		returnVal_285,imm_286
	mv		returnVal_287,returnVal_285
	j		main_fake_generateOperations_split_block_10

main_fake_generateOperations_split_block_10:
	li		imm_288,1
	beq		returnVal_287,imm_288,main_fake_generateOperations__if_then_3
	j		main_fake_generateOperations__if_else_3

main_fake_generateOperations__if_then_3:
	li		imm_289,0
	bne		root_28,imm_289,main_fake_generateOperations_fake_insert__if_then_3
	j		main_fake_generateOperations_fake_insert_split_block_3

main_fake_generateOperations_fake_insert_split_block_3:
	li		imm_290,16
	mv		a0,imm_290
	call	malloc
	mv		vReg_291,a0
	addi	vReg_292,vReg_291,4
	li		imm_293,12
	mv		a0,imm_293
	call	malloc
	mv		vReg_294,a0
	li		imm_295,2
	sw		imm_295,0(vReg_294)
	sw		vReg_294,0(vReg_292)
	addi	vReg_296,vReg_291,8
	sw		vReg_273,0(vReg_296)
	addi	vReg_297,vReg_291,12
	li		imm_298,1
	sw		imm_298,0(vReg_297)
	addi	vReg_299,vReg_291,0
	li		imm_300,0
	sw		imm_300,0(vReg_299)
	lw		vReg_301,0(vReg_292)
	addi	vReg_302,vReg_301,4
	li		imm_303,0
	sw		imm_303,0(vReg_302)
	lw		vReg_304,0(vReg_292)
	addi	vReg_305,vReg_304,8
	li		imm_306,0
	sw		imm_306,0(vReg_305)
	mv		root_307,vReg_291
	mv		root_308,root_307
	j		main_fake_generateOperations_split_block_11

main_fake_generateOperations_split_block_11:
	mv		root_309,root_308
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations__for_step_3:
	addi	i_310,i_29,1
	mv		seed_27,seed_284
	mv		root_28,root_309
	mv		i_29,i_310
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations_fake_insert__if_then_3:
	li		imm_311,0
	beq		root_28,imm_311,main_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_7

main_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	vReg_312,root_28,8
	lw		vReg_313,0(vReg_312)
	beq		vReg_313,vReg_273,main_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_8

main_fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	vReg_314,root_28,12
	lw		vReg_315,0(vReg_314)
	addi	vReg_316,vReg_315,1
	sw		vReg_316,0(vReg_314)
	j		main_split_block_7

main_split_block_7:
	mv		root_308,root_28
	j		main_fake_generateOperations_split_block_11

main_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	li		imm_318,0
	mv		id_317,imm_318
	lw		vReg_319,0(vReg_312)
	blt		vReg_319,vReg_273,main_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		main__parallel_copy__3

main__parallel_copy__3:
	mv		id_320,id_317
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	vReg_321,root_28,4
	lw		vReg_322,0(vReg_321)
	li		imm_324,4
	mul		vReg_323,id_320,imm_324
	addi	vReg_325,vReg_323,4
	add		vReg_326,vReg_325,vReg_322
	lw		vReg_327,0(vReg_326)
	mv		a0,vReg_327
	mv		a1,root_28
	mv		a2,id_320
	mv		a3,vReg_273
	call	insertImpl
	mv		vReg_328,a0
	j		main_split_block_7

main_fake_fake_insertImpl_1_insertImpl__if_then_6:
	li		imm_330,1
	mv		id_329,imm_330
	mv		id_320,id_329
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		imm_331,16
	mv		a0,imm_331
	call	malloc
	mv		vReg_332,a0
	addi	vReg_333,vReg_332,4
	li		imm_334,12
	mv		a0,imm_334
	call	malloc
	mv		vReg_335,a0
	li		imm_336,2
	sw		imm_336,0(vReg_335)
	sw		vReg_335,0(vReg_333)
	addi	vReg_337,vReg_332,8
	sw		vReg_273,0(vReg_337)
	addi	vReg_338,vReg_332,12
	li		imm_339,1
	sw		imm_339,0(vReg_338)
	addi	vReg_340,vReg_332,0
	li		imm_341,0
	sw		imm_341,0(vReg_340)
	lw		vReg_342,0(vReg_333)
	addi	vReg_343,vReg_342,4
	li		imm_344,0
	sw		imm_344,0(vReg_343)
	lw		vReg_345,0(vReg_333)
	addi	vReg_346,vReg_345,8
	li		imm_347,0
	sw		imm_347,0(vReg_346)
	li		imm_349,4
	lw		vReg_348,0(imm_349)
	addi	vReg_350,vReg_348,0
	sw		vReg_332,0(vReg_350)
	j		main_split_block_7

main_fake_generateOperations__if_else_3:
	li		imm_351,0
	beq		root_28,imm_351,main_fake_generateOperations_fake_erase__if_then_3
	j		main_fake_generateOperations_fake_erase__if_merge_3

main_fake_generateOperations_fake_erase__if_then_3:
	mv		root_352,root_28
	j		main_fake_generateOperations_split_block_12

main_fake_generateOperations_split_block_12:
	mv		root_309,root_352
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations_fake_erase__if_merge_3:
	lui		global_tmp_353,0
	sw		root_28,0(global_tmp_353)
	mv		a0,root_28
	li		imm_354,0
	mv		a1,imm_354
	li		imm_355,-1
	mv		a2,imm_355
	mv		a3,vReg_273
	call	eraseImpl
	mv		vReg_356,a0
	lui		global_tmp_357,0
	lw		root_358,0(global_tmp_357)
	mv		root_352,root_358
	j		main_fake_generateOperations_split_block_12

main_fake_generateOperations_fake_randOp__if_merge_3:
	li		imm_360,2
	mv		returnVal_359,imm_360
	mv		returnVal_287,returnVal_359
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


