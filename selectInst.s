	.data

	.globl	c
c:
	.zero	4

	.globl	ans
ans:
	.zero	4

	.globl	visit
visit:
	.zero	4

	.globl	pre
pre:
	.zero	4

	.globl	f
f:
	.zero	4

	.globl	i
i:
	.zero	4

	.globl	j
j:
	.zero	4

	.globl	open
open:
	.zero	4

	.globl	closed
closed:
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
	lw		j_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		f_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		visit_18,0(global_tmp_17)
	lui		global_tmp_19,0
	lw		pre_20,0(global_tmp_19)
	lui		global_tmp_21,0
	lw		ans_22,0(global_tmp_21)
	li		imm_23,444
	mv		a0,imm_23
	call	malloc
	mv		vReg_24,a0
	li		imm_25,110
	sw		imm_25,0(vReg_24)
	li		imm_27,0
	mv		i_26,imm_27
	mv		i_28,i_26
	mv		j_29,j_14
	j		main_fake_origin__for_cond

main_fake_origin__for_cond:
	li		imm_30,110
	blt		i_28,imm_30,main_fake_origin__for_body
	j		main_split_block

main_split_block:
	li		imm_32,1
	mv		i_31,imm_32
	mv		i_33,i_31
	mv		j_34,j_29
	j		main_fake_build__for_cond

main_fake_build__for_cond:
	li		imm_35,49
	ble		i_33,imm_35,main_fake_build__for_body_3
	j		main_fake_build__for_merge

main_fake_build__for_merge:
	li		imm_37,1
	mv		i_36,imm_37
	mv		i_38,i_36
	j		main_fake_build__for_cond_2

main_fake_build__for_cond_2:
	li		imm_39,49
	ble		i_38,imm_39,main_fake_build__for_body
	j		main_fake_build__for_merge_2

main_fake_build__for_body:
	li		imm_41,99
	li		imm_42,4
	mul		vReg_40,imm_41,imm_42
	addi	vReg_43,vReg_40,4
	add		vReg_44,vReg_43,vReg_24
	lw		vReg_45,0(vReg_44)
	li		imm_47,4
	mul		vReg_46,i_38,imm_47
	addi	vReg_48,vReg_46,4
	add		vReg_49,vReg_48,vReg_45
	li		imm_50,1
	sw		imm_50,0(vReg_49)
	addi	i_51,i_38,1
	mv		i_38,i_51
	j		main_fake_build__for_cond_2

main_fake_build__for_merge_2:
	li		imm_53,50
	mv		i_52,imm_53
	mv		i_54,i_52
	j		main_fake_build__for_cond_3

main_fake_build__for_cond_3:
	li		imm_55,98
	ble		i_54,imm_55,main_fake_build__for_body_2
	j		main_split_block_2

main_split_block_2:
	mv		ans_56,ans_22
	mv		j_57,j_34
	j		main__while_cond

main__while_cond:
	li		imm_59,0
	mv		open_58,imm_59
	li		imm_61,1
	mv		closed_60,imm_61
	li		imm_63,1
	mv		i_62,imm_63
	mv		i_64,i_62
	j		main_fake_find__for_cond

main_fake_find__for_cond:
	li		imm_65,100
	ble		i_64,imm_65,main_fake_find__for_body_2
	j		main_fake_find__for_merge

main_fake_find__for_merge:
	li		imm_67,1
	li		imm_68,4
	mul		vReg_66,imm_67,imm_68
	addi	vReg_69,vReg_66,4
	add		vReg_70,vReg_69,f_16
	li		imm_71,99
	sw		imm_71,0(vReg_70)
	li		imm_73,99
	li		imm_74,4
	mul		vReg_72,imm_73,imm_74
	addi	vReg_75,vReg_72,4
	add		vReg_76,vReg_75,visit_18
	li		imm_77,1
	sw		imm_77,0(vReg_76)
	add		vReg_78,vReg_75,pre_20
	li		imm_79,0
	sw		imm_79,0(vReg_78)
	li		imm_81,0
	mv		flag_80,imm_81
	mv		closed_82,closed_60
	mv		i_83,i_64
	mv		open_84,open_58
	mv		flag_85,flag_80
	mv		j_86,j_57
	j		main_fake_find__while_cond

main_fake_find__while_cond:
	blt		open_84,closed_82,main_fake_find__lhs_and_then
	j		main_split_block_3

main_fake_find__lhs_and_then:
	li		imm_87,0
	beq		flag_85,imm_87,main_fake_find__while_body
	j		main_split_block_3

main_split_block_3:
	li		imm_88,0
	bgt		flag_85,imm_88,main__while_body
	j		main__while_merge

main__while_body:
	li		imm_90,100
	mv		i_89,imm_90
	addi	ans_91,ans_56,1
	mv		i_92,i_89
	mv		j_93,j_86
	j		main_fake_improve__while_cond

main_fake_improve__while_cond:
	li		imm_95,4
	mul		vReg_94,i_92,imm_95
	addi	vReg_96,vReg_94,4
	add		vReg_97,vReg_96,pre_20
	lw		vReg_98,0(vReg_97)
	li		imm_99,0
	bgt		vReg_98,imm_99,main_fake_improve__while_body
	j		main_split_block_4

main_split_block_4:
	mv		ans_56,ans_91
	mv		j_57,j_93
	j		main__while_cond

main_fake_improve__while_body:
	lw		vReg_100,0(vReg_97)
	mv		j_101,vReg_100
	li		imm_103,4
	mul		vReg_102,vReg_100,imm_103
	addi	vReg_104,vReg_102,4
	add		vReg_105,vReg_104,vReg_24
	lw		vReg_106,0(vReg_105)
	add		vReg_107,vReg_96,vReg_106
	lw		vReg_108,0(vReg_107)
	addi	vReg_109,vReg_108,-1
	sw		vReg_109,0(vReg_107)
	add		vReg_110,vReg_96,vReg_24
	lw		vReg_111,0(vReg_110)
	add		vReg_112,vReg_104,vReg_111
	lw		vReg_113,0(vReg_112)
	addi	vReg_114,vReg_113,1
	sw		vReg_114,0(vReg_112)
	mv		i_115,vReg_100
	mv		i_92,i_115
	mv		j_93,j_101
	j		main_fake_improve__while_cond

main__while_merge:
	mv		a0,ans_56
	call	__builtin_toString
	mv		vReg_116,a0
	mv		a0,vReg_116
	call	__builtin_println
	lui		global_tmp_117,0
	sw		ans_56,0(global_tmp_117)
	lui		global_tmp_118,0
	sw		closed_82,0(global_tmp_118)
	lui		global_tmp_119,0
	sw		i_83,0(global_tmp_119)
	lui		global_tmp_120,0
	sw		vReg_24,0(global_tmp_120)
	lui		global_tmp_121,0
	sw		j_86,0(global_tmp_121)
	lui		global_tmp_122,0
	sw		open_84,0(global_tmp_122)
	li		imm_123,0
	mv		a0,imm_123
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

main_fake_find__while_body:
	addi	open_124,open_84,1
	li		imm_126,4
	mul		vReg_125,open_124,imm_126
	addi	vReg_127,vReg_125,4
	add		vReg_128,vReg_127,f_16
	lw		vReg_129,0(vReg_128)
	mv		i_130,vReg_129
	li		imm_132,1
	mv		j_131,imm_132
	mv		closed_133,closed_82
	mv		flag_134,flag_85
	mv		j_135,j_131
	j		main_fake_find__for_cond_2

main_fake_find__for_cond_2:
	li		imm_136,100
	ble		j_135,imm_136,main_fake_find__for_body
	j		main_fake_find__for_merge_2

main_fake_find__for_body:
	li		imm_138,4
	mul		vReg_137,vReg_129,imm_138
	addi	vReg_139,vReg_137,4
	add		vReg_140,vReg_139,vReg_24
	lw		vReg_141,0(vReg_140)
	li		imm_143,4
	mul		vReg_142,j_135,imm_143
	addi	vReg_144,vReg_142,4
	add		vReg_145,vReg_144,vReg_141
	lw		vReg_146,0(vReg_145)
	li		imm_147,0
	bgt		vReg_146,imm_147,main_fake_find__lhs_and_then_2
	j		main__parallel_copy__3

main_fake_find__lhs_and_then_2:
	add		vReg_148,vReg_144,visit_18
	lw		vReg_149,0(vReg_148)
	li		imm_150,0
	beq		vReg_149,imm_150,main_fake_find__if_then
	j		main__parallel_copy__2

main_fake_find__if_then:
	li		imm_151,1
	sw		imm_151,0(vReg_148)
	addi	closed_152,closed_133,1
	li		imm_154,4
	mul		vReg_153,closed_152,imm_154
	addi	vReg_155,vReg_153,4
	add		vReg_156,vReg_155,f_16
	sw		j_135,0(vReg_156)
	add		vReg_157,vReg_144,pre_20
	sw		vReg_129,0(vReg_157)
	li		imm_158,100
	beq		closed_152,imm_158,main_fake_find__if_then_2
	j		main__parallel_copy_

main__parallel_copy_:
	mv		flag_159,flag_134
	j		main_fake_find__if_merge

main_fake_find__if_merge:
	mv		closed_160,closed_152
	mv		flag_161,flag_159
	j		main_fake_find__for_step

main_fake_find__for_step:
	addi	j_162,j_135,1
	mv		closed_133,closed_160
	mv		flag_134,flag_161
	mv		j_135,j_162
	j		main_fake_find__for_cond_2

main_fake_find__if_then_2:
	li		imm_164,1
	mv		flag_163,imm_164
	mv		flag_159,flag_163
	j		main_fake_find__if_merge

main__parallel_copy__2:
	mv		closed_160,closed_133
	mv		flag_161,flag_134
	j		main_fake_find__for_step

main__parallel_copy__3:
	mv		closed_160,closed_133
	mv		flag_161,flag_134
	j		main_fake_find__for_step

main_fake_find__for_merge_2:
	mv		closed_82,closed_133
	mv		i_83,i_130
	mv		open_84,open_124
	mv		flag_85,flag_134
	mv		j_86,j_135
	j		main_fake_find__while_cond

main_fake_find__for_body_2:
	li		imm_166,4
	mul		vReg_165,i_64,imm_166
	addi	vReg_167,vReg_165,4
	add		vReg_168,vReg_167,visit_18
	li		imm_169,0
	sw		imm_169,0(vReg_168)
	addi	i_170,i_64,1
	mv		i_64,i_170
	j		main_fake_find__for_cond

main_fake_build__for_body_2:
	li		imm_172,4
	mul		vReg_171,i_54,imm_172
	addi	vReg_173,vReg_171,4
	add		vReg_174,vReg_173,vReg_24
	lw		vReg_175,0(vReg_174)
	li		imm_177,100
	li		imm_178,4
	mul		vReg_176,imm_177,imm_178
	addi	vReg_179,vReg_176,4
	add		vReg_180,vReg_179,vReg_175
	li		imm_181,1
	sw		imm_181,0(vReg_180)
	addi	i_182,i_54,1
	mv		i_54,i_182
	j		main_fake_build__for_cond_3

main_fake_build__for_body_3:
	li		imm_184,50
	mv		j_183,imm_184
	mv		j_185,j_183
	j		main_fake_build__for_cond_4

main_fake_build__for_cond_4:
	li		imm_187,98
	sub		vReg_186,imm_187,i_33
	addi	vReg_188,vReg_186,1
	ble		j_185,vReg_188,main_fake_build__for_body_4
	j		main_fake_build__for_step

main_fake_build__for_body_4:
	li		imm_190,4
	mul		vReg_189,i_33,imm_190
	addi	vReg_191,vReg_189,4
	add		vReg_192,vReg_191,vReg_24
	lw		vReg_193,0(vReg_192)
	li		imm_195,4
	mul		vReg_194,j_185,imm_195
	addi	vReg_196,vReg_194,4
	add		vReg_197,vReg_196,vReg_193
	li		imm_198,1
	sw		imm_198,0(vReg_197)
	addi	j_199,j_185,1
	mv		j_185,j_199
	j		main_fake_build__for_cond_4

main_fake_build__for_step:
	addi	i_200,i_33,1
	mv		i_33,i_200
	mv		j_34,j_185
	j		main_fake_build__for_cond

main_fake_origin__for_body:
	li		imm_202,4
	mul		vReg_201,i_28,imm_202
	addi	vReg_203,vReg_201,4
	add		vReg_204,vReg_203,vReg_24
	li		imm_206,110
	li		imm_207,4
	mul		vReg_205,imm_206,imm_207
	addi	vReg_208,vReg_205,4
	mv		a0,vReg_208
	call	malloc
	mv		vReg_209,a0
	li		imm_210,110
	sw		imm_210,0(vReg_209)
	sw		vReg_209,0(vReg_204)
	li		imm_212,0
	mv		j_211,imm_212
	mv		j_213,j_211
	j		main_fake_origin__for_cond_2

main_fake_origin__for_cond_2:
	li		imm_214,110
	blt		j_213,imm_214,main_fake_origin__for_body_2
	j		main_fake_origin__for_step

main_fake_origin__for_step:
	addi	i_215,i_28,1
	mv		i_28,i_215
	mv		j_29,j_213
	j		main_fake_origin__for_cond

main_fake_origin__for_body_2:
	li		imm_217,4
	mul		vReg_216,i_28,imm_217
	addi	vReg_218,vReg_216,4
	add		vReg_219,vReg_218,vReg_24
	lw		vReg_220,0(vReg_219)
	li		imm_222,4
	mul		vReg_221,j_213,imm_222
	addi	vReg_223,vReg_221,4
	add		vReg_224,vReg_223,vReg_220
	li		imm_225,0
	sw		imm_225,0(vReg_224)
	addi	j_226,j_213,1
	mv		j_213,j_226
	j		main_fake_origin__for_cond_2


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
	li		imm_13,444
	mv		a0,imm_13
	call	malloc
	mv		vReg_14,a0
	li		imm_15,110
	sw		imm_15,0(vReg_14)
	li		imm_16,444
	mv		a0,imm_16
	call	malloc
	mv		vReg_17,a0
	li		imm_18,110
	sw		imm_18,0(vReg_17)
	li		imm_19,444
	mv		a0,imm_19
	call	malloc
	mv		vReg_20,a0
	li		imm_21,110
	sw		imm_21,0(vReg_20)
	lui		global_tmp_22,0
	li		imm_23,0
	sw		imm_23,0(global_tmp_22)
	lui		global_tmp_24,0
	sw		vReg_17,0(global_tmp_24)
	lui		global_tmp_25,0
	sw		vReg_14,0(global_tmp_25)
	lui		global_tmp_26,0
	sw		vReg_20,0(global_tmp_26)
	call	_main
	mv		vReg_27,a0
	mv		a0,vReg_27
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


