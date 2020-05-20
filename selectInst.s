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
	li		imm_22,2
	li		imm_23,4
	mul		vReg_21,imm_22,imm_23
	addi	vReg_24,vReg_21,4
	mv		a0,vReg_24
	call	malloc
	mv		vReg_25,a0
	li		imm_26,2
	sw		imm_26,0(vReg_25)
	sw		vReg_25,0(vReg_20)
	addi	vReg_27,vReg_19,8
	sw		key_16,0(vReg_27)
	addi	vReg_28,vReg_19,12
	li		imm_29,1
	sw		imm_29,0(vReg_28)
	addi	vReg_30,vReg_19,0
	sw		pnt_14,0(vReg_30)
	lw		vReg_31,0(vReg_20)
	li		imm_33,0
	li		imm_34,4
	mul		vReg_32,imm_33,imm_34
	addi	vReg_35,vReg_32,4
	add		vReg_36,vReg_35,vReg_31
	li		imm_37,0
	sw		imm_37,0(vReg_36)
	lw		vReg_38,0(vReg_20)
	li		imm_40,1
	li		imm_41,4
	mul		vReg_39,imm_40,imm_41
	addi	vReg_42,vReg_39,4
	add		vReg_43,vReg_42,vReg_38
	li		imm_44,0
	sw		imm_44,0(vReg_43)
	addi	vReg_45,pnt_14,4
	lw		vReg_46,0(vReg_45)
	li		imm_48,4
	mul		vReg_47,childId_15,imm_48
	addi	vReg_49,vReg_47,4
	add		vReg_50,vReg_49,vReg_46
	sw		vReg_19,0(vReg_50)
	li		imm_52,0
	mv		returnVal_51,imm_52
	mv		returnVal_53,returnVal_51
	j		insertImpl_exit

insertImpl_exit:
	mv		a0,returnVal_53
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
	addi	vReg_54,cur_13,8
	lw		vReg_55,0(vReg_54)
	beq		vReg_55,key_16,insertImpl__if_then_2
	j		insertImpl__if_merge_2

insertImpl__if_merge_2:
	li		imm_57,0
	mv		id_56,imm_57
	lw		vReg_58,0(vReg_54)
	blt		vReg_58,key_16,insertImpl__if_then
	j		insertImpl__parallel_copy_

insertImpl__parallel_copy_:
	mv		id_59,id_56
	j		insertImpl__if_merge_3

insertImpl__if_merge_3:
	addi	vReg_60,cur_13,4
	lw		vReg_61,0(vReg_60)
	li		imm_63,4
	mul		vReg_62,id_59,imm_63
	addi	vReg_64,vReg_62,4
	add		vReg_65,vReg_64,vReg_61
	lw		vReg_66,0(vReg_65)
	li		imm_67,0
	beq		vReg_66,imm_67,insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	vReg_68,vReg_66,8
	lw		vReg_69,0(vReg_68)
	beq		vReg_69,key_16,insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		imm_71,0
	mv		id_70,imm_71
	lw		vReg_72,0(vReg_68)
	blt		vReg_72,key_16,insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl__parallel_copy__2

insertImpl__parallel_copy__2:
	mv		id_73,id_70
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	vReg_74,vReg_66,4
	lw		vReg_75,0(vReg_74)
	li		imm_77,4
	mul		vReg_76,id_73,imm_77
	addi	vReg_78,vReg_76,4
	add		vReg_79,vReg_78,vReg_75
	lw		vReg_80,0(vReg_79)
	li		imm_81,0
	beq		vReg_80,imm_81,insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		imm_82,16
	mv		a0,imm_82
	call	malloc
	mv		vReg_83,a0
	addi	vReg_84,vReg_83,4
	li		imm_86,2
	li		imm_87,4
	mul		vReg_85,imm_86,imm_87
	addi	vReg_88,vReg_85,4
	mv		a0,vReg_88
	call	malloc
	mv		vReg_89,a0
	li		imm_90,2
	sw		imm_90,0(vReg_89)
	sw		vReg_89,0(vReg_84)
	addi	vReg_91,vReg_83,8
	sw		key_16,0(vReg_91)
	addi	vReg_92,vReg_83,12
	li		imm_93,1
	sw		imm_93,0(vReg_92)
	addi	vReg_94,vReg_83,0
	sw		vReg_66,0(vReg_94)
	lw		vReg_95,0(vReg_84)
	li		imm_97,0
	li		imm_98,4
	mul		vReg_96,imm_97,imm_98
	addi	vReg_99,vReg_96,4
	add		vReg_100,vReg_99,vReg_95
	li		imm_101,0
	sw		imm_101,0(vReg_100)
	lw		vReg_102,0(vReg_84)
	li		imm_104,1
	li		imm_105,4
	mul		vReg_103,imm_104,imm_105
	addi	vReg_106,vReg_103,4
	add		vReg_107,vReg_106,vReg_102
	li		imm_108,0
	sw		imm_108,0(vReg_107)
	lw		vReg_109,0(vReg_74)
	add		vReg_110,vReg_78,vReg_109
	sw		vReg_83,0(vReg_110)
	li		imm_112,0
	mv		returnVal_111,imm_112
	mv		returnVal_113,returnVal_111
	j		insertImpl_split_block_2

insertImpl_split_block_2:
	mv		returnVal_114,returnVal_113
	mv		returnVal_115,returnVal_114
	j		insertImpl_split_block_3

insertImpl_split_block_3:
	mv		returnVal_116,returnVal_115
	mv		returnVal_53,returnVal_116
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	vReg_117,vReg_80,8
	lw		vReg_118,0(vReg_117)
	beq		vReg_118,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	vReg_119,vReg_80,12
	lw		vReg_120,0(vReg_119)
	addi	vReg_121,vReg_120,1
	sw		vReg_121,0(vReg_119)
	li		imm_123,1
	mv		returnVal_122,imm_123
	mv		returnVal_113,returnVal_122
	j		insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		imm_125,0
	mv		id_124,imm_125
	lw		vReg_126,0(vReg_117)
	blt		vReg_126,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl__parallel_copy__3

insertImpl__parallel_copy__3:
	mv		id_127,id_124
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	vReg_128,vReg_80,4
	lw		vReg_129,0(vReg_128)
	li		imm_131,4
	mul		vReg_130,id_127,imm_131
	addi	vReg_132,vReg_130,4
	add		vReg_133,vReg_132,vReg_129
	lw		vReg_134,0(vReg_133)
	li		imm_135,0
	beq		vReg_134,imm_135,insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		imm_136,16
	mv		a0,imm_136
	call	malloc
	mv		vReg_137,a0
	addi	vReg_138,vReg_137,4
	li		imm_140,2
	li		imm_141,4
	mul		vReg_139,imm_140,imm_141
	addi	vReg_142,vReg_139,4
	mv		a0,vReg_142
	call	malloc
	mv		vReg_143,a0
	li		imm_144,2
	sw		imm_144,0(vReg_143)
	sw		vReg_143,0(vReg_138)
	addi	vReg_145,vReg_137,8
	sw		key_16,0(vReg_145)
	addi	vReg_146,vReg_137,12
	li		imm_147,1
	sw		imm_147,0(vReg_146)
	addi	vReg_148,vReg_137,0
	sw		vReg_80,0(vReg_148)
	lw		vReg_149,0(vReg_138)
	li		imm_151,0
	li		imm_152,4
	mul		vReg_150,imm_151,imm_152
	addi	vReg_153,vReg_150,4
	add		vReg_154,vReg_153,vReg_149
	li		imm_155,0
	sw		imm_155,0(vReg_154)
	lw		vReg_156,0(vReg_138)
	li		imm_158,1
	li		imm_159,4
	mul		vReg_157,imm_158,imm_159
	addi	vReg_160,vReg_157,4
	add		vReg_161,vReg_160,vReg_156
	li		imm_162,0
	sw		imm_162,0(vReg_161)
	lw		vReg_163,0(vReg_128)
	add		vReg_164,vReg_132,vReg_163
	sw		vReg_137,0(vReg_164)
	li		imm_166,0
	mv		returnVal_165,imm_166
	mv		returnVal_167,returnVal_165
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2:
	mv		returnVal_168,returnVal_167
	mv		returnVal_113,returnVal_168
	j		insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	vReg_169,vReg_134,8
	lw		vReg_170,0(vReg_169)
	beq		vReg_170,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	vReg_171,vReg_134,12
	lw		vReg_172,0(vReg_171)
	addi	vReg_173,vReg_172,1
	sw		vReg_173,0(vReg_171)
	li		imm_175,1
	mv		returnVal_174,imm_175
	mv		returnVal_167,returnVal_174
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		imm_177,0
	mv		id_176,imm_177
	lw		vReg_178,0(vReg_169)
	blt		vReg_178,key_16,insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl__parallel_copy__4

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		imm_180,1
	mv		id_179,imm_180
	mv		id_181,id_179
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	vReg_182,vReg_134,4
	lw		vReg_183,0(vReg_182)
	li		imm_185,4
	mul		vReg_184,id_181,imm_185
	addi	vReg_186,vReg_184,4
	add		vReg_187,vReg_186,vReg_183
	lw		vReg_188,0(vReg_187)
	mv		a0,vReg_188
	mv		a1,vReg_134
	mv		a2,id_181
	mv		a3,key_16
	call	insertImpl
	mv		vReg_189,a0
	mv		returnVal_190,vReg_189
	mv		returnVal_167,returnVal_190
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2

insertImpl__parallel_copy__4:
	mv		id_181,id_176
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		imm_192,1
	mv		id_191,imm_192
	mv		id_127,id_191
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		imm_194,1
	mv		id_193,imm_194
	mv		id_73,id_193
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	vReg_195,vReg_66,12
	lw		vReg_196,0(vReg_195)
	addi	vReg_197,vReg_196,1
	sw		vReg_197,0(vReg_195)
	li		imm_199,1
	mv		returnVal_198,imm_199
	mv		returnVal_115,returnVal_198
	j		insertImpl_split_block_3

insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		imm_200,16
	mv		a0,imm_200
	call	malloc
	mv		vReg_201,a0
	addi	vReg_202,vReg_201,4
	li		imm_204,2
	li		imm_205,4
	mul		vReg_203,imm_204,imm_205
	addi	vReg_206,vReg_203,4
	mv		a0,vReg_206
	call	malloc
	mv		vReg_207,a0
	li		imm_208,2
	sw		imm_208,0(vReg_207)
	sw		vReg_207,0(vReg_202)
	addi	vReg_209,vReg_201,8
	sw		key_16,0(vReg_209)
	addi	vReg_210,vReg_201,12
	li		imm_211,1
	sw		imm_211,0(vReg_210)
	addi	vReg_212,vReg_201,0
	sw		cur_13,0(vReg_212)
	lw		vReg_213,0(vReg_202)
	li		imm_215,0
	li		imm_216,4
	mul		vReg_214,imm_215,imm_216
	addi	vReg_217,vReg_214,4
	add		vReg_218,vReg_217,vReg_213
	li		imm_219,0
	sw		imm_219,0(vReg_218)
	lw		vReg_220,0(vReg_202)
	li		imm_222,1
	li		imm_223,4
	mul		vReg_221,imm_222,imm_223
	addi	vReg_224,vReg_221,4
	add		vReg_225,vReg_224,vReg_220
	li		imm_226,0
	sw		imm_226,0(vReg_225)
	lw		vReg_227,0(vReg_60)
	add		vReg_228,vReg_64,vReg_227
	sw		vReg_201,0(vReg_228)
	li		imm_230,0
	mv		returnVal_229,imm_230
	mv		returnVal_115,returnVal_229
	j		insertImpl_split_block_3

insertImpl__if_then:
	li		imm_232,1
	mv		id_231,imm_232
	mv		id_59,id_231
	j		insertImpl__if_merge_3

insertImpl__if_then_2:
	addi	vReg_233,cur_13,12
	lw		vReg_234,0(vReg_233)
	addi	vReg_235,vReg_234,1
	sw		vReg_235,0(vReg_233)
	li		imm_237,1
	mv		returnVal_236,imm_237
	mv		returnVal_53,returnVal_236
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

findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_29,vReg_23
	mv		returnVal_30,returnVal_29
	j		findLargest_split_block

findLargest_split_block:
	mv		returnVal_31,returnVal_30
	mv		returnVal_20,returnVal_31
	j		findLargest_exit

findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_32,0(vReg_24)
	addi	vReg_33,vReg_32,8
	lw		vReg_34,0(vReg_33)
	addi	vReg_35,vReg_34,4
	lw		vReg_36,0(vReg_35)
	addi	vReg_37,vReg_36,8
	lw		vReg_38,0(vReg_37)
	li		imm_39,0
	beq		vReg_38,imm_39,findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_40,vReg_34
	mv		returnVal_41,returnVal_40
	j		findLargest_split_block_2

findLargest_split_block_2:
	mv		returnVal_42,returnVal_41
	mv		returnVal_30,returnVal_42
	j		findLargest_split_block

findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_43,0(vReg_35)
	addi	vReg_44,vReg_43,8
	lw		vReg_45,0(vReg_44)
	addi	vReg_46,vReg_45,4
	lw		vReg_47,0(vReg_46)
	addi	vReg_48,vReg_47,8
	lw		vReg_49,0(vReg_48)
	li		imm_50,0
	beq		vReg_49,imm_50,findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_51,vReg_45
	mv		returnVal_52,returnVal_51
	j		findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_53,returnVal_52
	mv		returnVal_41,returnVal_53
	j		findLargest_split_block_2

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_54,0(vReg_46)
	addi	vReg_55,vReg_54,8
	lw		vReg_56,0(vReg_55)
	addi	vReg_57,vReg_56,4
	lw		vReg_58,0(vReg_57)
	addi	vReg_59,vReg_58,8
	lw		vReg_60,0(vReg_59)
	li		imm_61,0
	beq		vReg_60,imm_61,findLargest_fake_fake_findLargest_3_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest__if_then:
	mv		returnVal_62,vReg_56
	mv		returnVal_63,returnVal_62
	j		findLargest_split_block_3

findLargest_split_block_3:
	mv		returnVal_64,returnVal_63
	mv		returnVal_52,returnVal_64
	j		findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		vReg_65,0(vReg_57)
	addi	vReg_66,vReg_65,8
	lw		vReg_67,0(vReg_66)
	addi	vReg_68,vReg_67,4
	lw		vReg_69,0(vReg_68)
	addi	vReg_70,vReg_69,8
	lw		vReg_71,0(vReg_70)
	li		imm_72,0
	beq		vReg_71,imm_72,findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_73,vReg_67
	mv		returnVal_74,returnVal_73
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest_split_block:
	mv		returnVal_75,returnVal_74
	mv		returnVal_63,returnVal_75
	j		findLargest_split_block_3

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_76,0(vReg_68)
	addi	vReg_77,vReg_76,8
	lw		vReg_78,0(vReg_77)
	addi	vReg_79,vReg_78,4
	lw		vReg_80,0(vReg_79)
	addi	vReg_81,vReg_80,8
	lw		vReg_82,0(vReg_81)
	li		imm_83,0
	beq		vReg_82,imm_83,findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_84,0(vReg_79)
	addi	vReg_85,vReg_84,8
	lw		vReg_86,0(vReg_85)
	addi	vReg_87,vReg_86,4
	lw		vReg_88,0(vReg_87)
	addi	vReg_89,vReg_88,8
	lw		vReg_90,0(vReg_89)
	li		imm_91,0
	beq		vReg_90,imm_91,findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_92,0(vReg_87)
	addi	vReg_93,vReg_92,8
	lw		vReg_94,0(vReg_93)
	addi	vReg_95,vReg_94,4
	lw		vReg_96,0(vReg_95)
	addi	vReg_97,vReg_96,8
	lw		vReg_98,0(vReg_97)
	li		imm_99,0
	beq		vReg_98,imm_99,findLargest_fake_fake_findLargest_4_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest__if_then:
	mv		returnVal_100,vReg_94
	mv		returnVal_101,returnVal_100
	j		findLargest_split_block_4

findLargest_split_block_4:
	mv		returnVal_102,returnVal_101
	mv		returnVal_103,returnVal_102
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_104,returnVal_103
	mv		returnVal_105,returnVal_104
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_3_findLargest_split_block_2:
	mv		returnVal_106,returnVal_105
	mv		returnVal_74,returnVal_106
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		vReg_107,0(vReg_95)
	addi	vReg_108,vReg_107,8
	lw		vReg_109,0(vReg_108)
	addi	vReg_110,vReg_109,4
	lw		vReg_111,0(vReg_110)
	addi	vReg_112,vReg_111,8
	lw		vReg_113,0(vReg_112)
	li		imm_114,0
	beq		vReg_113,imm_114,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_115,0(vReg_110)
	addi	vReg_116,vReg_115,8
	lw		vReg_117,0(vReg_116)
	addi	vReg_118,vReg_117,4
	lw		vReg_119,0(vReg_118)
	addi	vReg_120,vReg_119,8
	lw		vReg_121,0(vReg_120)
	li		imm_122,0
	beq		vReg_121,imm_122,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_123,0(vReg_118)
	addi	vReg_124,vReg_123,8
	lw		vReg_125,0(vReg_124)
	addi	vReg_126,vReg_125,4
	lw		vReg_127,0(vReg_126)
	addi	vReg_128,vReg_127,8
	lw		vReg_129,0(vReg_128)
	li		imm_130,0
	beq		vReg_129,imm_130,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_131,0(vReg_126)
	addi	vReg_132,vReg_131,8
	lw		vReg_133,0(vReg_132)
	addi	vReg_134,vReg_133,4
	lw		vReg_135,0(vReg_134)
	addi	vReg_136,vReg_135,8
	lw		vReg_137,0(vReg_136)
	li		imm_138,0
	beq		vReg_137,imm_138,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		vReg_139,0(vReg_134)
	addi	vReg_140,vReg_139,8
	lw		vReg_141,0(vReg_140)
	addi	vReg_142,vReg_141,4
	lw		vReg_143,0(vReg_142)
	addi	vReg_144,vReg_143,8
	lw		vReg_145,0(vReg_144)
	li		imm_146,0
	beq		vReg_145,imm_146,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_147,0(vReg_142)
	addi	vReg_148,vReg_147,8
	lw		vReg_149,0(vReg_148)
	addi	vReg_150,vReg_149,4
	lw		vReg_151,0(vReg_150)
	addi	vReg_152,vReg_151,8
	lw		vReg_153,0(vReg_152)
	li		imm_154,0
	beq		vReg_153,imm_154,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_155,vReg_149
	mv		returnVal_156,returnVal_155
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block:
	mv		returnVal_157,returnVal_156
	mv		returnVal_158,returnVal_157
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block_2:
	mv		returnVal_159,returnVal_158
	mv		returnVal_160,returnVal_159
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_split_block:
	mv		returnVal_161,returnVal_160
	mv		returnVal_162,returnVal_161
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_163,returnVal_162
	mv		returnVal_164,returnVal_163
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_split_block_2:
	mv		returnVal_165,returnVal_164
	mv		returnVal_166,returnVal_165
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_3

findLargest_fake_fake_findLargest_4_findLargest_split_block_3:
	mv		returnVal_167,returnVal_166
	mv		returnVal_101,returnVal_167
	j		findLargest_split_block_4

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_168,0(vReg_150)
	addi	vReg_169,vReg_168,8
	lw		vReg_170,0(vReg_169)
	addi	vReg_171,vReg_170,4
	lw		vReg_172,0(vReg_171)
	addi	vReg_173,vReg_172,8
	lw		vReg_174,0(vReg_173)
	li		imm_175,0
	beq		vReg_174,imm_175,findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_176,vReg_170
	mv		returnVal_177,returnVal_176
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_178,returnVal_177
	mv		returnVal_156,returnVal_178
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_179,0(vReg_171)
	addi	vReg_180,vReg_179,8
	lw		vReg_181,0(vReg_180)
	mv		a0,vReg_181
	call	findLargest
	mv		vReg_182,a0
	mv		returnVal_183,vReg_182
	mv		returnVal_177,returnVal_183
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_184,vReg_141
	mv		returnVal_158,returnVal_184
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_then:
	mv		returnVal_185,vReg_133
	mv		returnVal_160,returnVal_185
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_186,vReg_125
	mv		returnVal_162,returnVal_186
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_187,vReg_117
	mv		returnVal_164,returnVal_187
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_2

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_188,vReg_109
	mv		returnVal_166,returnVal_188
	j		findLargest_fake_fake_findLargest_4_findLargest_split_block_3

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_189,vReg_86
	mv		returnVal_103,returnVal_189
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_190,vReg_78
	mv		returnVal_105,returnVal_190
	j		findLargest_fake_fake_findLargest_3_findLargest_split_block_2


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
	mv		returnVal_22,returnVal_20
	mv		root_23,root_18
	j		eraseImpl_exit

eraseImpl_exit:
	lui		global_tmp_24,0
	sw		root_23,0(global_tmp_24)
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
	li		imm_31,1
	li		imm_32,4
	mul		vReg_30,imm_31,imm_32
	addi	vReg_33,vReg_30,4
	add		vReg_34,vReg_33,vReg_29
	lw		vReg_35,0(vReg_34)
	lui		global_tmp_36,0
	sw		root_18,0(global_tmp_36)
	mv		a0,vReg_35
	mv		a1,cur_13
	li		imm_37,1
	mv		a2,imm_37
	mv		a3,key_16
	call	eraseImpl
	mv		vReg_38,a0
	lui		global_tmp_39,0
	lw		root_40,0(global_tmp_39)
	mv		returnVal_41,vReg_38
	mv		returnVal_22,returnVal_41
	mv		root_23,root_40
	j		eraseImpl_exit

eraseImpl__if_merge_3:
	addi	vReg_42,cur_13,12
	lw		vReg_43,0(vReg_42)
	addi	vReg_44,vReg_43,-1
	sw		vReg_44,0(vReg_42)
	lw		vReg_45,0(vReg_42)
	li		imm_46,0
	bgt		vReg_45,imm_46,eraseImpl__if_then_3
	j		eraseImpl__if_merge_4

eraseImpl__if_then_3:
	li		imm_48,1
	mv		returnVal_47,imm_48
	mv		returnVal_22,returnVal_47
	mv		root_23,root_18
	j		eraseImpl_exit

eraseImpl__if_merge_4:
	addi	vReg_49,cur_13,4
	lw		vReg_50,0(vReg_49)
	li		imm_52,0
	li		imm_53,4
	mul		vReg_51,imm_52,imm_53
	addi	vReg_54,vReg_51,4
	add		vReg_55,vReg_54,vReg_50
	lw		vReg_56,0(vReg_55)
	li		imm_57,0
	beq		vReg_56,imm_57,eraseImpl__if_then_4
	j		eraseImpl__if_merge_8

eraseImpl__if_then_4:
	li		imm_58,0
	bne		pnt_14,imm_58,eraseImpl__if_then_5
	j		eraseImpl__if_merge_5

eraseImpl__if_then_5:
	addi	vReg_59,pnt_14,4
	lw		vReg_60,0(vReg_59)
	li		imm_62,4
	mul		vReg_61,childId_15,imm_62
	addi	vReg_63,vReg_61,4
	add		vReg_64,vReg_63,vReg_60
	lw		vReg_65,0(vReg_49)
	li		imm_67,1
	li		imm_68,4
	mul		vReg_66,imm_67,imm_68
	addi	vReg_69,vReg_66,4
	add		vReg_70,vReg_69,vReg_65
	lw		vReg_71,0(vReg_70)
	sw		vReg_71,0(vReg_64)
	j		eraseImpl__if_merge_5

eraseImpl__if_merge_5:
	addi	vReg_72,cur_13,4
	lw		vReg_73,0(vReg_72)
	li		imm_75,1
	li		imm_76,4
	mul		vReg_74,imm_75,imm_76
	addi	vReg_77,vReg_74,4
	add		vReg_78,vReg_77,vReg_73
	lw		vReg_79,0(vReg_78)
	li		imm_80,0
	bne		vReg_79,imm_80,eraseImpl__if_then_7
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_6:
	addi	vReg_81,root_18,8
	lw		vReg_82,0(vReg_81)
	beq		key_16,vReg_82,eraseImpl__if_then_6
	j		eraseImpl__parallel_copy_

eraseImpl__parallel_copy_:
	mv		root_83,root_18
	j		eraseImpl__if_merge_7

eraseImpl__if_merge_7:
	li		imm_85,1
	mv		returnVal_84,imm_85
	mv		returnVal_22,returnVal_84
	mv		root_23,root_83
	j		eraseImpl_exit

eraseImpl__if_then_6:
	addi	vReg_86,cur_13,4
	lw		vReg_87,0(vReg_86)
	addi	vReg_88,vReg_87,8
	lw		vReg_89,0(vReg_88)
	mv		root_90,vReg_89
	mv		root_83,root_90
	j		eraseImpl__if_merge_7

eraseImpl__if_then_7:
	lw		vReg_91,0(vReg_72)
	add		vReg_92,vReg_77,vReg_91
	lw		vReg_93,0(vReg_92)
	addi	vReg_94,vReg_93,0
	sw		pnt_14,0(vReg_94)
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_8:
	lw		vReg_95,0(vReg_49)
	add		vReg_96,vReg_54,vReg_95
	lw		vReg_97,0(vReg_96)
	addi	vReg_98,vReg_97,4
	lw		vReg_99,0(vReg_98)
	li		imm_101,1
	li		imm_102,4
	mul		vReg_100,imm_101,imm_102
	addi	vReg_103,vReg_100,4
	add		vReg_104,vReg_103,vReg_99
	lw		vReg_105,0(vReg_104)
	li		imm_106,0
	beq		vReg_105,imm_106,eraseImpl_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_107,vReg_97
	mv		returnVal_108,returnVal_107
	j		eraseImpl_split_block

eraseImpl_split_block:
	addi	vReg_109,root_18,8
	lw		vReg_110,0(vReg_109)
	beq		key_16,vReg_110,eraseImpl__if_then_8
	j		eraseImpl__parallel_copy__2

eraseImpl__if_then_8:
	mv		root_111,returnVal_108
	mv		root_112,root_111
	j		eraseImpl__if_merge_9

eraseImpl__if_merge_9:
	addi	vReg_113,returnVal_108,8
	addi	vReg_114,cur_13,4
	lw		vReg_115,0(vReg_114)
	addi	vReg_116,vReg_115,4
	lw		vReg_117,0(vReg_116)
	addi	vReg_118,vReg_117,8
	lw		vReg_119,0(vReg_113)
	lw		vReg_120,0(vReg_118)
	bne		vReg_119,vReg_120,eraseImpl__if_then_12
	j		eraseImpl__if_merge_10

eraseImpl__if_merge_10:
	li		imm_121,0
	bne		pnt_14,imm_121,eraseImpl__if_then_11
	j		eraseImpl__if_merge_11

eraseImpl__if_merge_11:
	addi	vReg_122,returnVal_108,0
	sw		pnt_14,0(vReg_122)
	addi	vReg_123,returnVal_108,4
	lw		vReg_124,0(vReg_123)
	li		imm_126,1
	li		imm_127,4
	mul		vReg_125,imm_126,imm_127
	addi	vReg_128,vReg_125,4
	add		vReg_129,vReg_128,vReg_124
	addi	vReg_130,cur_13,4
	lw		vReg_131,0(vReg_130)
	add		vReg_132,vReg_128,vReg_131
	lw		vReg_133,0(vReg_132)
	sw		vReg_133,0(vReg_129)
	lw		vReg_134,0(vReg_130)
	add		vReg_135,vReg_128,vReg_134
	lw		vReg_136,0(vReg_135)
	li		imm_137,0
	bne		vReg_136,imm_137,eraseImpl__if_then_10
	j		eraseImpl__if_merge_12

eraseImpl__if_merge_12:
	addi	vReg_138,returnVal_108,8
	addi	vReg_139,cur_13,4
	lw		vReg_140,0(vReg_139)
	li		imm_142,0
	li		imm_143,4
	mul		vReg_141,imm_142,imm_143
	addi	vReg_144,vReg_141,4
	add		vReg_145,vReg_144,vReg_140
	lw		vReg_146,0(vReg_145)
	addi	vReg_147,vReg_146,8
	lw		vReg_148,0(vReg_138)
	lw		vReg_149,0(vReg_147)
	bne		vReg_148,vReg_149,eraseImpl__if_then_9
	j		eraseImpl__if_merge_13

eraseImpl__if_merge_13:
	li		imm_151,1
	mv		returnVal_150,imm_151
	mv		returnVal_22,returnVal_150
	mv		root_23,root_112
	j		eraseImpl_exit

eraseImpl__if_then_9:
	addi	vReg_152,returnVal_108,4
	lw		vReg_153,0(vReg_152)
	add		vReg_154,vReg_144,vReg_153
	lw		vReg_155,0(vReg_139)
	add		vReg_156,vReg_144,vReg_155
	lw		vReg_157,0(vReg_156)
	sw		vReg_157,0(vReg_154)
	lw		vReg_158,0(vReg_139)
	add		vReg_159,vReg_144,vReg_158
	lw		vReg_160,0(vReg_159)
	addi	vReg_161,vReg_160,0
	sw		returnVal_108,0(vReg_161)
	j		eraseImpl__if_merge_13

eraseImpl__if_then_10:
	lw		vReg_162,0(vReg_130)
	add		vReg_163,vReg_128,vReg_162
	lw		vReg_164,0(vReg_163)
	addi	vReg_165,vReg_164,0
	sw		returnVal_108,0(vReg_165)
	j		eraseImpl__if_merge_12

eraseImpl__if_then_11:
	addi	vReg_166,pnt_14,4
	lw		vReg_167,0(vReg_166)
	li		imm_169,4
	mul		vReg_168,childId_15,imm_169
	addi	vReg_170,vReg_168,4
	add		vReg_171,vReg_170,vReg_167
	sw		returnVal_108,0(vReg_171)
	j		eraseImpl__if_merge_11

eraseImpl__if_then_12:
	addi	vReg_172,returnVal_108,0
	lw		vReg_173,0(vReg_172)
	addi	vReg_174,vReg_173,4
	lw		vReg_175,0(vReg_174)
	addi	vReg_176,vReg_175,8
	addi	vReg_177,returnVal_108,4
	lw		vReg_178,0(vReg_177)
	addi	vReg_179,vReg_178,4
	lw		vReg_180,0(vReg_179)
	sw		vReg_180,0(vReg_176)
	lw		vReg_181,0(vReg_177)
	addi	vReg_182,vReg_181,4
	lw		vReg_183,0(vReg_182)
	li		imm_184,0
	bne		vReg_183,imm_184,eraseImpl__if_then_13
	j		eraseImpl__if_merge_10

eraseImpl__if_then_13:
	lw		vReg_185,0(vReg_177)
	addi	vReg_186,vReg_185,4
	lw		vReg_187,0(vReg_186)
	addi	vReg_188,vReg_187,0
	lw		vReg_189,0(vReg_172)
	sw		vReg_189,0(vReg_188)
	j		eraseImpl__if_merge_10

eraseImpl__parallel_copy__2:
	mv		root_112,root_18
	j		eraseImpl__if_merge_9

eraseImpl_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_190,0(vReg_98)
	add		vReg_191,vReg_103,vReg_190
	lw		vReg_192,0(vReg_191)
	addi	vReg_193,vReg_192,4
	lw		vReg_194,0(vReg_193)
	add		vReg_195,vReg_103,vReg_194
	lw		vReg_196,0(vReg_195)
	li		imm_197,0
	beq		vReg_196,imm_197,eraseImpl_fake_fake_findLargest_2_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_198,vReg_192
	mv		returnVal_199,returnVal_198
	j		eraseImpl_split_block_2

eraseImpl_split_block_2:
	mv		returnVal_200,returnVal_199
	mv		returnVal_108,returnVal_200
	j		eraseImpl_split_block

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_201,0(vReg_193)
	add		vReg_202,vReg_103,vReg_201
	lw		vReg_203,0(vReg_202)
	addi	vReg_204,vReg_203,4
	lw		vReg_205,0(vReg_204)
	add		vReg_206,vReg_103,vReg_205
	lw		vReg_207,0(vReg_206)
	li		imm_208,0
	beq		vReg_207,imm_208,eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_209,0(vReg_204)
	add		vReg_210,vReg_103,vReg_209
	lw		vReg_211,0(vReg_210)
	addi	vReg_212,vReg_211,4
	lw		vReg_213,0(vReg_212)
	add		vReg_214,vReg_103,vReg_213
	lw		vReg_215,0(vReg_214)
	li		imm_216,0
	beq		vReg_215,imm_216,eraseImpl_fake_fake_findLargest_3_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge:
	lw		vReg_217,0(vReg_212)
	add		vReg_218,vReg_103,vReg_217
	lw		vReg_219,0(vReg_218)
	addi	vReg_220,vReg_219,4
	lw		vReg_221,0(vReg_220)
	add		vReg_222,vReg_103,vReg_221
	lw		vReg_223,0(vReg_222)
	li		imm_224,0
	beq		vReg_223,imm_224,eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_225,vReg_219
	mv		returnVal_226,returnVal_225
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_split_block:
	mv		returnVal_227,returnVal_226
	mv		returnVal_228,returnVal_227
	j		eraseImpl_split_block_3

eraseImpl_split_block_3:
	mv		returnVal_229,returnVal_228
	mv		returnVal_230,returnVal_229
	j		eraseImpl_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_231,returnVal_230
	mv		returnVal_199,returnVal_231
	j		eraseImpl_split_block_2

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_232,0(vReg_220)
	add		vReg_233,vReg_103,vReg_232
	lw		vReg_234,0(vReg_233)
	addi	vReg_235,vReg_234,4
	lw		vReg_236,0(vReg_235)
	add		vReg_237,vReg_103,vReg_236
	lw		vReg_238,0(vReg_237)
	li		imm_239,0
	beq		vReg_238,imm_239,eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_then:
	mv		returnVal_240,vReg_234
	mv		returnVal_241,returnVal_240
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block_2

eraseImpl_fake_fake_findLargest_3_findLargest_split_block_2:
	mv		returnVal_242,returnVal_241
	mv		returnVal_226,returnVal_242
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		vReg_243,0(vReg_235)
	add		vReg_244,vReg_103,vReg_243
	lw		vReg_245,0(vReg_244)
	addi	vReg_246,vReg_245,4
	lw		vReg_247,0(vReg_246)
	add		vReg_248,vReg_103,vReg_247
	lw		vReg_249,0(vReg_248)
	li		imm_250,0
	beq		vReg_249,imm_250,eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_251,vReg_245
	mv		returnVal_252,returnVal_251
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block:
	mv		returnVal_253,returnVal_252
	mv		returnVal_241,returnVal_253
	j		eraseImpl_fake_fake_findLargest_3_findLargest_split_block_2

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		vReg_254,0(vReg_246)
	add		vReg_255,vReg_103,vReg_254
	lw		vReg_256,0(vReg_255)
	mv		a0,vReg_256
	call	findLargest
	mv		vReg_257,a0
	mv		returnVal_258,vReg_257
	mv		returnVal_252,returnVal_258
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_split_block

eraseImpl_fake_fake_findLargest_3_findLargest__if_then:
	mv		returnVal_259,vReg_211
	mv		returnVal_228,returnVal_259
	j		eraseImpl_split_block_3

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_then:
	mv		returnVal_260,vReg_203
	mv		returnVal_230,returnVal_260
	j		eraseImpl_fake_fake_findLargest_2_findLargest_split_block

eraseImpl__if_then_14:
	addi	vReg_261,cur_13,4
	lw		vReg_262,0(vReg_261)
	li		imm_264,0
	li		imm_265,4
	mul		vReg_263,imm_264,imm_265
	addi	vReg_266,vReg_263,4
	add		vReg_267,vReg_266,vReg_262
	lw		vReg_268,0(vReg_267)
	lui		global_tmp_269,0
	sw		root_18,0(global_tmp_269)
	mv		a0,vReg_268
	mv		a1,cur_13
	li		imm_270,0
	mv		a2,imm_270
	mv		a3,key_16
	call	eraseImpl
	mv		vReg_271,a0
	lui		global_tmp_272,0
	lw		root_273,0(global_tmp_272)
	mv		returnVal_274,vReg_271
	mv		returnVal_22,returnVal_274
	mv		root_23,root_273
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
	li		imm_18,0
	li		imm_19,4
	mul		vReg_17,imm_18,imm_19
	addi	vReg_20,vReg_17,4
	add		vReg_21,vReg_20,vReg_16
	lw		vReg_22,0(vReg_21)
	li		imm_23,0
	beq		vReg_22,imm_23,printTree_split_block_2
	j		printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	vReg_24,vReg_22,4
	lw		vReg_25,0(vReg_24)
	add		vReg_26,vReg_20,vReg_25
	lw		vReg_27,0(vReg_26)
	li		imm_28,0
	beq		vReg_27,imm_28,printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree__if_merge

printTree_split_block:
	addi	vReg_29,vReg_22,8
	lw		vReg_30,0(vReg_29)
	mv		a0,vReg_30
	call	__builtin_toString
	mv		vReg_31,a0
	mv		a0,vReg_31
	la		str_const_32,__str_const_1
	mv		a1,str_const_32
	call	__builtin_string_add
	mv		vReg_33,a0
	addi	vReg_34,vReg_22,12
	lw		vReg_35,0(vReg_34)
	mv		a0,vReg_35
	call	__builtin_toString
	mv		vReg_36,a0
	mv		a0,vReg_33
	mv		a1,vReg_36
	call	__builtin_string_add
	mv		vReg_37,a0
	mv		a0,vReg_37
	call	__builtin_println
	addi	vReg_38,vReg_22,4
	lw		vReg_39,0(vReg_38)
	li		imm_41,1
	li		imm_42,4
	mul		vReg_40,imm_41,imm_42
	addi	vReg_43,vReg_40,4
	add		vReg_44,vReg_43,vReg_39
	lw		vReg_45,0(vReg_44)
	mv		a0,vReg_45
	call	printTree
	j		printTree_split_block_2

printTree_split_block_2:
	addi	vReg_46,cur_13,8
	lw		vReg_47,0(vReg_46)
	mv		a0,vReg_47
	call	__builtin_toString
	mv		vReg_48,a0
	mv		a0,vReg_48
	la		str_const_49,__str_const_1
	mv		a1,str_const_49
	call	__builtin_string_add
	mv		vReg_50,a0
	addi	vReg_51,cur_13,12
	lw		vReg_52,0(vReg_51)
	mv		a0,vReg_52
	call	__builtin_toString
	mv		vReg_53,a0
	mv		a0,vReg_50
	mv		a1,vReg_53
	call	__builtin_string_add
	mv		vReg_54,a0
	mv		a0,vReg_54
	call	__builtin_println
	addi	vReg_55,cur_13,4
	lw		vReg_56,0(vReg_55)
	li		imm_58,1
	li		imm_59,4
	mul		vReg_57,imm_58,imm_59
	addi	vReg_60,vReg_57,4
	add		vReg_61,vReg_60,vReg_56
	lw		vReg_62,0(vReg_61)
	li		imm_63,0
	beq		vReg_62,imm_63,printTree_exit
	j		printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	vReg_64,vReg_62,4
	lw		vReg_65,0(vReg_64)
	li		imm_67,0
	li		imm_68,4
	mul		vReg_66,imm_67,imm_68
	addi	vReg_69,vReg_66,4
	add		vReg_70,vReg_69,vReg_65
	lw		vReg_71,0(vReg_70)
	mv		a0,vReg_71
	call	printTree
	addi	vReg_72,vReg_62,8
	lw		vReg_73,0(vReg_72)
	mv		a0,vReg_73
	call	__builtin_toString
	mv		vReg_74,a0
	mv		a0,vReg_74
	la		str_const_75,__str_const_1
	mv		a1,str_const_75
	call	__builtin_string_add
	mv		vReg_76,a0
	addi	vReg_77,vReg_62,12
	lw		vReg_78,0(vReg_77)
	mv		a0,vReg_78
	call	__builtin_toString
	mv		vReg_79,a0
	mv		a0,vReg_76
	mv		a1,vReg_79
	call	__builtin_string_add
	mv		vReg_80,a0
	mv		a0,vReg_80
	call	__builtin_println
	lw		vReg_81,0(vReg_64)
	add		vReg_82,vReg_60,vReg_81
	lw		vReg_83,0(vReg_82)
	mv		a0,vReg_83
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

printTree_fake_fake_printTree_2_printTree__if_merge:
	addi	vReg_84,vReg_27,4
	lw		vReg_85,0(vReg_84)
	add		vReg_86,vReg_20,vReg_85
	lw		vReg_87,0(vReg_86)
	li		imm_88,0
	beq		vReg_87,imm_88,printTree_fake_fake_printTree_2_printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	vReg_89,vReg_87,4
	lw		vReg_90,0(vReg_89)
	add		vReg_91,vReg_20,vReg_90
	lw		vReg_92,0(vReg_91)
	mv		a0,vReg_92
	call	printTree
	addi	vReg_93,vReg_87,8
	lw		vReg_94,0(vReg_93)
	mv		a0,vReg_94
	call	__builtin_toString
	mv		vReg_95,a0
	mv		a0,vReg_95
	la		str_const_96,__str_const_1
	mv		a1,str_const_96
	call	__builtin_string_add
	mv		vReg_97,a0
	addi	vReg_98,vReg_87,12
	lw		vReg_99,0(vReg_98)
	mv		a0,vReg_99
	call	__builtin_toString
	mv		vReg_100,a0
	mv		a0,vReg_97
	mv		a1,vReg_100
	call	__builtin_string_add
	mv		vReg_101,a0
	mv		a0,vReg_101
	call	__builtin_println
	lw		vReg_102,0(vReg_89)
	li		imm_104,1
	li		imm_105,4
	mul		vReg_103,imm_104,imm_105
	addi	vReg_106,vReg_103,4
	add		vReg_107,vReg_106,vReg_102
	lw		vReg_108,0(vReg_107)
	mv		a0,vReg_108
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block

printTree_fake_fake_printTree_2_printTree_split_block:
	addi	vReg_109,vReg_27,8
	lw		vReg_110,0(vReg_109)
	mv		a0,vReg_110
	call	__builtin_toString
	mv		vReg_111,a0
	mv		a0,vReg_111
	la		str_const_112,__str_const_1
	mv		a1,str_const_112
	call	__builtin_string_add
	mv		vReg_113,a0
	addi	vReg_114,vReg_27,12
	lw		vReg_115,0(vReg_114)
	mv		a0,vReg_115
	call	__builtin_toString
	mv		vReg_116,a0
	mv		a0,vReg_113
	mv		a1,vReg_116
	call	__builtin_string_add
	mv		vReg_117,a0
	mv		a0,vReg_117
	call	__builtin_println
	addi	vReg_118,vReg_27,4
	lw		vReg_119,0(vReg_118)
	li		imm_121,1
	li		imm_122,4
	mul		vReg_120,imm_121,imm_122
	addi	vReg_123,vReg_120,4
	add		vReg_124,vReg_123,vReg_119
	lw		vReg_125,0(vReg_124)
	li		imm_126,0
	beq		vReg_125,imm_126,printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	vReg_127,vReg_125,4
	lw		vReg_128,0(vReg_127)
	li		imm_130,0
	li		imm_131,4
	mul		vReg_129,imm_130,imm_131
	addi	vReg_132,vReg_129,4
	add		vReg_133,vReg_132,vReg_128
	lw		vReg_134,0(vReg_133)
	mv		a0,vReg_134
	call	printTree
	addi	vReg_135,vReg_125,8
	lw		vReg_136,0(vReg_135)
	mv		a0,vReg_136
	call	__builtin_toString
	mv		vReg_137,a0
	mv		a0,vReg_137
	la		str_const_138,__str_const_1
	mv		a1,str_const_138
	call	__builtin_string_add
	mv		vReg_139,a0
	addi	vReg_140,vReg_125,12
	lw		vReg_141,0(vReg_140)
	mv		a0,vReg_141
	call	__builtin_toString
	mv		vReg_142,a0
	mv		a0,vReg_139
	mv		a1,vReg_142
	call	__builtin_string_add
	mv		vReg_143,a0
	mv		a0,vReg_143
	call	__builtin_println
	lw		vReg_144,0(vReg_127)
	add		vReg_145,vReg_123,vReg_144
	lw		vReg_146,0(vReg_145)
	mv		a0,vReg_146
	call	printTree
	j		printTree_split_block


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
	lw		MaxRandInt_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		root_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		MAX_18,0(global_tmp_17)
	call	__builtin_getInt
	mv		vReg_19,a0
	mv		seed_20,vReg_19
	li		imm_22,10
	div		vReg_21,MaxRandInt_14,imm_22
	li		imm_24,8
	mul		vReg_23,imm_24,vReg_21
	li		imm_26,0
	mv		i_25,imm_26
	mv		seed_27,seed_20
	mv		i_28,i_25
	mv		root_29,root_16
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations__for_cond:
	li		imm_30,50000
	blt		i_28,imm_30,main_fake_generateOperations_split_block_9
	j		main_split_block

main_split_block:
	li		imm_32,10
	div		vReg_31,MaxRandInt_14,imm_32
	li		imm_34,2
	mul		vReg_33,imm_34,vReg_31
	li		imm_36,2
	li		imm_37,50000
	mul		vReg_35,imm_36,imm_37
	li		imm_39,0
	mv		i_38,imm_39
	mv		i_40,i_38
	mv		seed_41,seed_27
	mv		root_42,root_29
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations__for_cond_2:
	blt		i_40,vReg_35,main_fake_generateOperations_split_block_5
	j		main_split_block_2

main_split_block_2:
	li		imm_44,10
	div		vReg_43,MaxRandInt_14,imm_44
	li		imm_46,4
	mul		vReg_45,imm_46,vReg_43
	li		imm_48,0
	mv		i_47,imm_48
	mv		seed_49,seed_41
	mv		i_50,i_47
	mv		root_51,root_42
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations__for_cond_3:
	li		imm_52,50000
	blt		i_50,imm_52,main_fake_generateOperations_split_block
	j		main_split_block_3

main_split_block_3:
	li		imm_53,0
	beq		root_51,imm_53,main_split_block_4
	j		main_fake_fake_printTree_1_printTree__if_merge

main_fake_fake_printTree_1_printTree__if_merge:
	addi	vReg_54,root_51,4
	lw		vReg_55,0(vReg_54)
	li		imm_57,0
	li		imm_58,4
	mul		vReg_56,imm_57,imm_58
	addi	vReg_59,vReg_56,4
	add		vReg_60,vReg_59,vReg_55
	lw		vReg_61,0(vReg_60)
	mv		a0,vReg_61
	call	printTree
	addi	vReg_62,root_51,8
	lw		vReg_63,0(vReg_62)
	mv		a0,vReg_63
	call	__builtin_toString
	mv		vReg_64,a0
	mv		a0,vReg_64
	la		str_const_65,__str_const_1
	mv		a1,str_const_65
	call	__builtin_string_add
	mv		vReg_66,a0
	addi	vReg_67,root_51,12
	lw		vReg_68,0(vReg_67)
	mv		a0,vReg_68
	call	__builtin_toString
	mv		vReg_69,a0
	mv		a0,vReg_66
	mv		a1,vReg_69
	call	__builtin_string_add
	mv		vReg_70,a0
	mv		a0,vReg_70
	call	__builtin_println
	lw		vReg_71,0(vReg_54)
	li		imm_73,1
	li		imm_74,4
	mul		vReg_72,imm_73,imm_74
	addi	vReg_75,vReg_72,4
	add		vReg_76,vReg_75,vReg_71
	lw		vReg_77,0(vReg_76)
	mv		a0,vReg_77
	call	printTree
	j		main_split_block_4

main_split_block_4:
	lui		global_tmp_78,0
	sw		root_51,0(global_tmp_78)
	lui		global_tmp_79,0
	sw		seed_49,0(global_tmp_79)
	li		imm_80,0
	mv		a0,imm_80
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

main_fake_generateOperations_split_block:
	slli	vReg_81,seed_49,13
	xor		vReg_82,seed_49,vReg_81
	li		imm_84,1
	slli	vReg_83,imm_84,31
	xori	vReg_85,vReg_83,-1
	and		vReg_86,vReg_82,vReg_85
	srai	vReg_87,vReg_86,17
	xor		vReg_88,vReg_86,vReg_87
	slli	vReg_89,vReg_88,5
	xor		vReg_90,vReg_88,vReg_89
	xori	vReg_91,vReg_83,-1
	and		vReg_92,vReg_90,vReg_91
	rem		vReg_93,vReg_92,MAX_18
	slli	vReg_94,vReg_92,13
	xor		vReg_95,vReg_92,vReg_94
	xori	vReg_96,vReg_83,-1
	and		vReg_97,vReg_95,vReg_96
	srai	vReg_98,vReg_97,17
	xor		vReg_99,vReg_97,vReg_98
	slli	vReg_100,vReg_99,5
	xor		vReg_101,vReg_99,vReg_100
	xori	vReg_102,vReg_83,-1
	and		vReg_103,vReg_101,vReg_102
	mv		seed_104,vReg_103
	blt		vReg_103,vReg_45,main_fake_generateOperations_fake_randOp__if_then
	j		main_fake_generateOperations_fake_randOp__if_merge

main_fake_generateOperations_fake_randOp__if_merge:
	li		imm_106,2
	mv		returnVal_105,imm_106
	mv		returnVal_107,returnVal_105
	j		main_fake_generateOperations_split_block_2

main_fake_generateOperations_split_block_2:
	li		imm_108,1
	beq		returnVal_107,imm_108,main_fake_generateOperations__if_then
	j		main_fake_generateOperations__if_else

main_fake_generateOperations__if_else:
	li		imm_109,0
	beq		root_51,imm_109,main_fake_generateOperations_fake_erase__if_then
	j		main_fake_generateOperations_fake_erase__if_merge

main_fake_generateOperations_fake_erase__if_then:
	mv		root_110,root_51
	j		main_fake_generateOperations_split_block_3

main_fake_generateOperations_split_block_3:
	mv		root_111,root_110
	j		main_fake_generateOperations__for_step

main_fake_generateOperations__for_step:
	addi	i_112,i_50,1
	mv		seed_49,seed_104
	mv		i_50,i_112
	mv		root_51,root_111
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations_fake_erase__if_merge:
	li		imm_114,1
	sub		vReg_113,zero,imm_114
	lui		global_tmp_115,0
	sw		root_51,0(global_tmp_115)
	mv		a0,root_51
	li		imm_116,0
	mv		a1,imm_116
	mv		a2,vReg_113
	mv		a3,vReg_93
	call	eraseImpl
	mv		vReg_117,a0
	lui		global_tmp_118,0
	lw		root_119,0(global_tmp_118)
	mv		root_110,root_119
	j		main_fake_generateOperations_split_block_3

main_fake_generateOperations__if_then:
	li		imm_120,0
	bne		root_51,imm_120,main_fake_generateOperations_fake_insert__if_then
	j		main_fake_generateOperations_fake_insert_split_block

main_fake_generateOperations_fake_insert_split_block:
	li		imm_121,16
	mv		a0,imm_121
	call	malloc
	mv		vReg_122,a0
	addi	vReg_123,vReg_122,4
	li		imm_125,2
	li		imm_126,4
	mul		vReg_124,imm_125,imm_126
	addi	vReg_127,vReg_124,4
	mv		a0,vReg_127
	call	malloc
	mv		vReg_128,a0
	li		imm_129,2
	sw		imm_129,0(vReg_128)
	sw		vReg_128,0(vReg_123)
	addi	vReg_130,vReg_122,8
	sw		vReg_93,0(vReg_130)
	addi	vReg_131,vReg_122,12
	li		imm_132,1
	sw		imm_132,0(vReg_131)
	addi	vReg_133,vReg_122,0
	li		imm_134,0
	sw		imm_134,0(vReg_133)
	lw		vReg_135,0(vReg_123)
	li		imm_137,0
	li		imm_138,4
	mul		vReg_136,imm_137,imm_138
	addi	vReg_139,vReg_136,4
	add		vReg_140,vReg_139,vReg_135
	li		imm_141,0
	sw		imm_141,0(vReg_140)
	lw		vReg_142,0(vReg_123)
	li		imm_144,1
	li		imm_145,4
	mul		vReg_143,imm_144,imm_145
	addi	vReg_146,vReg_143,4
	add		vReg_147,vReg_146,vReg_142
	li		imm_148,0
	sw		imm_148,0(vReg_147)
	mv		root_149,vReg_122
	mv		root_150,root_149
	j		main_fake_generateOperations_split_block_4

main_fake_generateOperations_split_block_4:
	mv		root_111,root_150
	j		main_fake_generateOperations__for_step

main_fake_generateOperations_fake_insert__if_then:
	li		imm_152,0
	addi	vReg_151,imm_152,-1
	li		imm_153,0
	beq		root_51,imm_153,main_fake_fake_insertImpl_1_insertImpl_split_block
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge

main_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	vReg_154,root_51,8
	lw		vReg_155,0(vReg_154)
	beq		vReg_155,vReg_93,main_fake_fake_insertImpl_1_insertImpl__if_then
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_2

main_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	vReg_156,root_51,12
	lw		vReg_157,0(vReg_156)
	addi	vReg_158,vReg_157,1
	sw		vReg_158,0(vReg_156)
	j		main_split_block_5

main_split_block_5:
	mv		root_150,root_51
	j		main_fake_generateOperations_split_block_4

main_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		imm_160,0
	mv		id_159,imm_160
	lw		vReg_161,0(vReg_154)
	blt		vReg_161,vReg_93,main_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		main__parallel_copy_

main_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		imm_163,1
	mv		id_162,imm_163
	mv		id_164,id_162
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	vReg_165,root_51,4
	lw		vReg_166,0(vReg_165)
	li		imm_168,4
	mul		vReg_167,id_164,imm_168
	addi	vReg_169,vReg_167,4
	add		vReg_170,vReg_169,vReg_166
	lw		vReg_171,0(vReg_170)
	mv		a0,vReg_171
	mv		a1,root_51
	mv		a2,id_164
	mv		a3,vReg_93
	call	insertImpl
	mv		vReg_172,a0
	j		main_split_block_5

main__parallel_copy_:
	mv		id_164,id_159
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl_split_block:
	li		imm_173,16
	mv		a0,imm_173
	call	malloc
	mv		vReg_174,a0
	addi	vReg_175,vReg_174,4
	li		imm_177,2
	li		imm_178,4
	mul		vReg_176,imm_177,imm_178
	addi	vReg_179,vReg_176,4
	mv		a0,vReg_179
	call	malloc
	mv		vReg_180,a0
	li		imm_181,2
	sw		imm_181,0(vReg_180)
	sw		vReg_180,0(vReg_175)
	addi	vReg_182,vReg_174,8
	sw		vReg_93,0(vReg_182)
	addi	vReg_183,vReg_174,12
	li		imm_184,1
	sw		imm_184,0(vReg_183)
	addi	vReg_185,vReg_174,0
	li		imm_186,0
	sw		imm_186,0(vReg_185)
	lw		vReg_187,0(vReg_175)
	li		imm_189,0
	li		imm_190,4
	mul		vReg_188,imm_189,imm_190
	addi	vReg_191,vReg_188,4
	add		vReg_192,vReg_191,vReg_187
	li		imm_193,0
	sw		imm_193,0(vReg_192)
	lw		vReg_194,0(vReg_175)
	li		imm_196,1
	li		imm_197,4
	mul		vReg_195,imm_196,imm_197
	addi	vReg_198,vReg_195,4
	add		vReg_199,vReg_198,vReg_194
	li		imm_200,0
	sw		imm_200,0(vReg_199)
	li		imm_202,0
	addi	vReg_201,imm_202,4
	lw		vReg_203,0(vReg_201)
	li		imm_205,4
	mul		vReg_204,vReg_151,imm_205
	addi	vReg_206,vReg_204,4
	add		vReg_207,vReg_206,vReg_203
	sw		vReg_174,0(vReg_207)
	j		main_split_block_5

main_fake_generateOperations_fake_randOp__if_then:
	li		imm_209,1
	mv		returnVal_208,imm_209
	mv		returnVal_107,returnVal_208
	j		main_fake_generateOperations_split_block_2

main_fake_generateOperations_split_block_5:
	slli	vReg_210,seed_41,13
	xor		vReg_211,seed_41,vReg_210
	li		imm_213,1
	slli	vReg_212,imm_213,31
	xori	vReg_214,vReg_212,-1
	and		vReg_215,vReg_211,vReg_214
	srai	vReg_216,vReg_215,17
	xor		vReg_217,vReg_215,vReg_216
	slli	vReg_218,vReg_217,5
	xor		vReg_219,vReg_217,vReg_218
	xori	vReg_220,vReg_212,-1
	and		vReg_221,vReg_219,vReg_220
	rem		vReg_222,vReg_221,MAX_18
	slli	vReg_223,vReg_221,13
	xor		vReg_224,vReg_221,vReg_223
	xori	vReg_225,vReg_212,-1
	and		vReg_226,vReg_224,vReg_225
	srai	vReg_227,vReg_226,17
	xor		vReg_228,vReg_226,vReg_227
	slli	vReg_229,vReg_228,5
	xor		vReg_230,vReg_228,vReg_229
	xori	vReg_231,vReg_212,-1
	and		vReg_232,vReg_230,vReg_231
	mv		seed_233,vReg_232
	blt		vReg_232,vReg_33,main_fake_generateOperations_fake_randOp__if_then_2
	j		main_fake_generateOperations_fake_randOp__if_merge_2

main_fake_generateOperations_fake_randOp__if_merge_2:
	li		imm_235,2
	mv		returnVal_234,imm_235
	mv		returnVal_236,returnVal_234
	j		main_fake_generateOperations_split_block_6

main_fake_generateOperations_split_block_6:
	li		imm_237,1
	beq		returnVal_236,imm_237,main_fake_generateOperations__if_then_2
	j		main_fake_generateOperations__if_else_2

main_fake_generateOperations__if_then_2:
	li		imm_238,0
	bne		root_42,imm_238,main_fake_generateOperations_fake_insert__if_then_2
	j		main_fake_generateOperations_fake_insert_split_block_2

main_fake_generateOperations_fake_insert__if_then_2:
	li		imm_240,0
	addi	vReg_239,imm_240,-1
	li		imm_241,0
	beq		root_42,imm_241,main_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_4

main_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	vReg_242,root_42,8
	lw		vReg_243,0(vReg_242)
	beq		vReg_243,vReg_222,main_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_5

main_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	li		imm_245,0
	mv		id_244,imm_245
	lw		vReg_246,0(vReg_242)
	blt		vReg_246,vReg_222,main_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		main__parallel_copy__2

main__parallel_copy__2:
	mv		id_247,id_244
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	vReg_248,root_42,4
	lw		vReg_249,0(vReg_248)
	li		imm_251,4
	mul		vReg_250,id_247,imm_251
	addi	vReg_252,vReg_250,4
	add		vReg_253,vReg_252,vReg_249
	lw		vReg_254,0(vReg_253)
	mv		a0,vReg_254
	mv		a1,root_42
	mv		a2,id_247
	mv		a3,vReg_222
	call	insertImpl
	mv		vReg_255,a0
	j		main_split_block_6

main_split_block_6:
	mv		root_256,root_42
	j		main_fake_generateOperations_split_block_7

main_fake_generateOperations_split_block_7:
	mv		root_257,root_256
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations__for_step_2:
	addi	i_258,i_40,1
	mv		i_40,i_258
	mv		seed_41,seed_233
	mv		root_42,root_257
	j		main_fake_generateOperations__for_cond_2

main_fake_fake_insertImpl_1_insertImpl__if_then_3:
	li		imm_260,1
	mv		id_259,imm_260
	mv		id_247,id_259
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_then_4:
	addi	vReg_261,root_42,12
	lw		vReg_262,0(vReg_261)
	addi	vReg_263,vReg_262,1
	sw		vReg_263,0(vReg_261)
	j		main_split_block_6

main_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		imm_264,16
	mv		a0,imm_264
	call	malloc
	mv		vReg_265,a0
	addi	vReg_266,vReg_265,4
	li		imm_268,2
	li		imm_269,4
	mul		vReg_267,imm_268,imm_269
	addi	vReg_270,vReg_267,4
	mv		a0,vReg_270
	call	malloc
	mv		vReg_271,a0
	li		imm_272,2
	sw		imm_272,0(vReg_271)
	sw		vReg_271,0(vReg_266)
	addi	vReg_273,vReg_265,8
	sw		vReg_222,0(vReg_273)
	addi	vReg_274,vReg_265,12
	li		imm_275,1
	sw		imm_275,0(vReg_274)
	addi	vReg_276,vReg_265,0
	li		imm_277,0
	sw		imm_277,0(vReg_276)
	lw		vReg_278,0(vReg_266)
	li		imm_280,0
	li		imm_281,4
	mul		vReg_279,imm_280,imm_281
	addi	vReg_282,vReg_279,4
	add		vReg_283,vReg_282,vReg_278
	li		imm_284,0
	sw		imm_284,0(vReg_283)
	lw		vReg_285,0(vReg_266)
	li		imm_287,1
	li		imm_288,4
	mul		vReg_286,imm_287,imm_288
	addi	vReg_289,vReg_286,4
	add		vReg_290,vReg_289,vReg_285
	li		imm_291,0
	sw		imm_291,0(vReg_290)
	li		imm_293,0
	addi	vReg_292,imm_293,4
	lw		vReg_294,0(vReg_292)
	li		imm_296,4
	mul		vReg_295,vReg_239,imm_296
	addi	vReg_297,vReg_295,4
	add		vReg_298,vReg_297,vReg_294
	sw		vReg_265,0(vReg_298)
	j		main_split_block_6

main_fake_generateOperations_fake_insert_split_block_2:
	li		imm_299,16
	mv		a0,imm_299
	call	malloc
	mv		vReg_300,a0
	addi	vReg_301,vReg_300,4
	li		imm_303,2
	li		imm_304,4
	mul		vReg_302,imm_303,imm_304
	addi	vReg_305,vReg_302,4
	mv		a0,vReg_305
	call	malloc
	mv		vReg_306,a0
	li		imm_307,2
	sw		imm_307,0(vReg_306)
	sw		vReg_306,0(vReg_301)
	addi	vReg_308,vReg_300,8
	sw		vReg_222,0(vReg_308)
	addi	vReg_309,vReg_300,12
	li		imm_310,1
	sw		imm_310,0(vReg_309)
	addi	vReg_311,vReg_300,0
	li		imm_312,0
	sw		imm_312,0(vReg_311)
	lw		vReg_313,0(vReg_301)
	li		imm_315,0
	li		imm_316,4
	mul		vReg_314,imm_315,imm_316
	addi	vReg_317,vReg_314,4
	add		vReg_318,vReg_317,vReg_313
	li		imm_319,0
	sw		imm_319,0(vReg_318)
	lw		vReg_320,0(vReg_301)
	li		imm_322,1
	li		imm_323,4
	mul		vReg_321,imm_322,imm_323
	addi	vReg_324,vReg_321,4
	add		vReg_325,vReg_324,vReg_320
	li		imm_326,0
	sw		imm_326,0(vReg_325)
	mv		root_327,vReg_300
	mv		root_256,root_327
	j		main_fake_generateOperations_split_block_7

main_fake_generateOperations__if_else_2:
	li		imm_328,0
	beq		root_42,imm_328,main_fake_generateOperations_fake_erase__if_then_2
	j		main_fake_generateOperations_fake_erase__if_merge_2

main_fake_generateOperations_fake_erase__if_then_2:
	mv		root_329,root_42
	j		main_fake_generateOperations_split_block_8

main_fake_generateOperations_split_block_8:
	mv		root_257,root_329
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations_fake_erase__if_merge_2:
	li		imm_331,1
	sub		vReg_330,zero,imm_331
	lui		global_tmp_332,0
	sw		root_42,0(global_tmp_332)
	mv		a0,root_42
	li		imm_333,0
	mv		a1,imm_333
	mv		a2,vReg_330
	mv		a3,vReg_222
	call	eraseImpl
	mv		vReg_334,a0
	lui		global_tmp_335,0
	lw		root_336,0(global_tmp_335)
	mv		root_329,root_336
	j		main_fake_generateOperations_split_block_8

main_fake_generateOperations_fake_randOp__if_then_2:
	li		imm_338,1
	mv		returnVal_337,imm_338
	mv		returnVal_236,returnVal_337
	j		main_fake_generateOperations_split_block_6

main_fake_generateOperations_split_block_9:
	slli	vReg_339,seed_27,13
	xor		vReg_340,seed_27,vReg_339
	li		imm_342,1
	slli	vReg_341,imm_342,31
	xori	vReg_343,vReg_341,-1
	and		vReg_344,vReg_340,vReg_343
	srai	vReg_345,vReg_344,17
	xor		vReg_346,vReg_344,vReg_345
	slli	vReg_347,vReg_346,5
	xor		vReg_348,vReg_346,vReg_347
	xori	vReg_349,vReg_341,-1
	and		vReg_350,vReg_348,vReg_349
	rem		vReg_351,vReg_350,MAX_18
	slli	vReg_352,vReg_350,13
	xor		vReg_353,vReg_350,vReg_352
	xori	vReg_354,vReg_341,-1
	and		vReg_355,vReg_353,vReg_354
	srai	vReg_356,vReg_355,17
	xor		vReg_357,vReg_355,vReg_356
	slli	vReg_358,vReg_357,5
	xor		vReg_359,vReg_357,vReg_358
	xori	vReg_360,vReg_341,-1
	and		vReg_361,vReg_359,vReg_360
	mv		seed_362,vReg_361
	blt		vReg_361,vReg_23,main_fake_generateOperations_fake_randOp__if_then_3
	j		main_fake_generateOperations_fake_randOp__if_merge_3

main_fake_generateOperations_fake_randOp__if_then_3:
	li		imm_364,1
	mv		returnVal_363,imm_364
	mv		returnVal_365,returnVal_363
	j		main_fake_generateOperations_split_block_10

main_fake_generateOperations_split_block_10:
	li		imm_366,1
	beq		returnVal_365,imm_366,main_fake_generateOperations__if_then_3
	j		main_fake_generateOperations__if_else_3

main_fake_generateOperations__if_else_3:
	li		imm_367,0
	beq		root_29,imm_367,main_fake_generateOperations_fake_erase__if_then_3
	j		main_fake_generateOperations_fake_erase__if_merge_3

main_fake_generateOperations_fake_erase__if_merge_3:
	lui		global_tmp_368,0
	sw		root_29,0(global_tmp_368)
	mv		a0,root_29
	li		imm_369,0
	mv		a1,imm_369
	li		imm_370,-1
	mv		a2,imm_370
	mv		a3,vReg_351
	call	eraseImpl
	mv		vReg_371,a0
	lui		global_tmp_372,0
	lw		root_373,0(global_tmp_372)
	mv		root_374,root_373
	j		main_fake_generateOperations_split_block_11

main_fake_generateOperations_split_block_11:
	mv		root_375,root_374
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations__for_step_3:
	addi	i_376,i_28,1
	mv		seed_27,seed_362
	mv		i_28,i_376
	mv		root_29,root_375
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations_fake_erase__if_then_3:
	mv		root_374,root_29
	j		main_fake_generateOperations_split_block_11

main_fake_generateOperations__if_then_3:
	li		imm_377,0
	bne		root_29,imm_377,main_fake_generateOperations_fake_insert__if_then_3
	j		main_fake_generateOperations_fake_insert_split_block_3

main_fake_generateOperations_fake_insert_split_block_3:
	li		imm_378,16
	mv		a0,imm_378
	call	malloc
	mv		vReg_379,a0
	addi	vReg_380,vReg_379,4
	li		imm_381,12
	mv		a0,imm_381
	call	malloc
	mv		vReg_382,a0
	li		imm_383,2
	sw		imm_383,0(vReg_382)
	sw		vReg_382,0(vReg_380)
	addi	vReg_384,vReg_379,8
	sw		vReg_351,0(vReg_384)
	addi	vReg_385,vReg_379,12
	li		imm_386,1
	sw		imm_386,0(vReg_385)
	addi	vReg_387,vReg_379,0
	li		imm_388,0
	sw		imm_388,0(vReg_387)
	lw		vReg_389,0(vReg_380)
	addi	vReg_390,vReg_389,4
	li		imm_391,0
	sw		imm_391,0(vReg_390)
	lw		vReg_392,0(vReg_380)
	addi	vReg_393,vReg_392,8
	li		imm_394,0
	sw		imm_394,0(vReg_393)
	mv		root_395,vReg_379
	mv		root_396,root_395
	j		main_fake_generateOperations_split_block_12

main_fake_generateOperations_split_block_12:
	mv		root_375,root_396
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations_fake_insert__if_then_3:
	li		imm_397,0
	beq		root_29,imm_397,main_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_7

main_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	vReg_398,root_29,8
	lw		vReg_399,0(vReg_398)
	beq		vReg_399,vReg_351,main_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_8

main_fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	vReg_400,root_29,12
	lw		vReg_401,0(vReg_400)
	addi	vReg_402,vReg_401,1
	sw		vReg_402,0(vReg_400)
	j		main_split_block_7

main_split_block_7:
	mv		root_396,root_29
	j		main_fake_generateOperations_split_block_12

main_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	li		imm_404,0
	mv		id_403,imm_404
	lw		vReg_405,0(vReg_398)
	blt		vReg_405,vReg_351,main_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		main__parallel_copy__3

main__parallel_copy__3:
	mv		id_406,id_403
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	vReg_407,root_29,4
	lw		vReg_408,0(vReg_407)
	li		imm_410,4
	mul		vReg_409,id_406,imm_410
	addi	vReg_411,vReg_409,4
	add		vReg_412,vReg_411,vReg_408
	lw		vReg_413,0(vReg_412)
	mv		a0,vReg_413
	mv		a1,root_29
	mv		a2,id_406
	mv		a3,vReg_351
	call	insertImpl
	mv		vReg_414,a0
	j		main_split_block_7

main_fake_fake_insertImpl_1_insertImpl__if_then_6:
	li		imm_416,1
	mv		id_415,imm_416
	mv		id_406,id_415
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		imm_417,16
	mv		a0,imm_417
	call	malloc
	mv		vReg_418,a0
	addi	vReg_419,vReg_418,4
	li		imm_420,12
	mv		a0,imm_420
	call	malloc
	mv		vReg_421,a0
	li		imm_422,2
	sw		imm_422,0(vReg_421)
	sw		vReg_421,0(vReg_419)
	addi	vReg_423,vReg_418,8
	sw		vReg_351,0(vReg_423)
	addi	vReg_424,vReg_418,12
	li		imm_425,1
	sw		imm_425,0(vReg_424)
	addi	vReg_426,vReg_418,0
	li		imm_427,0
	sw		imm_427,0(vReg_426)
	lw		vReg_428,0(vReg_419)
	addi	vReg_429,vReg_428,4
	li		imm_430,0
	sw		imm_430,0(vReg_429)
	lw		vReg_431,0(vReg_419)
	addi	vReg_432,vReg_431,8
	li		imm_433,0
	sw		imm_433,0(vReg_432)
	li		imm_435,4
	lw		vReg_434,0(imm_435)
	addi	vReg_436,vReg_434,0
	sw		vReg_418,0(vReg_436)
	j		main_split_block_7

main_fake_generateOperations_fake_randOp__if_merge_3:
	li		imm_438,2
	mv		returnVal_437,imm_438
	mv		returnVal_365,returnVal_437
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
	li		imm_14,0
	sw		imm_14,0(global_tmp_13)
	lui		global_tmp_15,0
	li		imm_16,128
	sw		imm_16,0(global_tmp_15)
	lui		global_tmp_17,0
	li		imm_18,2147483647
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


