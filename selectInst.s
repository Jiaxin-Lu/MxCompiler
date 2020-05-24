	.data

	.globl	__str_const_1
__str_const_1:
	.string	 

	.globl	__str_const_2
__str_const_2:
	.string	

	.globl	__str_const_3
__str_const_3:
	.string	Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i

	.globl	__str_const_4
__str_const_4:
	.string	Let's start!

	.globl	__str_const_5
__str_const_5:
	.string	step 

	.globl	__str_const_6
__str_const_6:
	.string	:

	.globl	__str_const_7
__str_const_7:
	.string	Total: 

	.globl	__str_const_8
__str_const_8:
	.string	 step(s)

	.globl	n
n:
	.zero	4

	.globl	h
h:
	.zero	4

	.globl	now
now:
	.zero	4

	.globl	a
a:
	.zero	4

	.globl	A
A:
	.zero	4

	.globl	M
M:
	.zero	4

	.globl	Q
Q:
	.zero	4

	.globl	R
R:
	.zero	4

	.globl	seed
seed:
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
	lw		A_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		seed_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		M_18,0(global_tmp_17)
	lui		global_tmp_19,0
	lw		now_20,0(global_tmp_19)
	li		imm_22,0
	mv		i_21,imm_22
	li		imm_24,0
	mv		temp_23,imm_24
	li		imm_26,0
	mv		count_25,imm_26
	li		imm_28,0
	mv		h_27,imm_28
	li		imm_29,404
	mv		a0,imm_29
	call	malloc
	mv		vReg_30,a0
	li		imm_31,100
	sw		imm_31,0(vReg_30)
	div		vReg_32,M_18,A_14
	rem		vReg_33,M_18,A_14
	mv		h_34,h_27
	j		main_fake_pd__for_cond

main_fake_pd__for_cond:
	li		imm_35,210
	ble		h_34,imm_35,main_fake_pd__for_body
	j		main_fake_pd__for_merge

main_fake_pd__for_merge:
	li		imm_37,0
	mv		returnVal_36,imm_37
	mv		returnVal_38,returnVal_36
	j		main_split_block

main_split_block:
	bne		returnVal_38,zero,main__if_merge
	j		main__if_then

main__if_then:
	la		str_const_39,__str_const_3
	mv		a0,str_const_39
	call	__builtin_println
	li		imm_41,1
	mv		returnVal_40,imm_41
	mv		now_42,now_20
	mv		returnVal_43,returnVal_40
	mv		seed_44,seed_16
	j		main_exit

main_exit:
	lui		global_tmp_45,0
	sw		vReg_33,0(global_tmp_45)
	lui		global_tmp_46,0
	sw		now_42,0(global_tmp_46)
	lui		global_tmp_47,0
	li		imm_48,210
	sw		imm_48,0(global_tmp_47)
	lui		global_tmp_49,0
	sw		vReg_30,0(global_tmp_49)
	lui		global_tmp_50,0
	sw		seed_44,0(global_tmp_50)
	lui		global_tmp_51,0
	sw		vReg_32,0(global_tmp_51)
	lui		global_tmp_52,0
	sw		h_34,0(global_tmp_52)
	mv		a0,returnVal_43
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

main__if_merge:
	la		str_const_53,__str_const_4
	mv		a0,str_const_53
	call	__builtin_println
	li		imm_55,3654898
	rem		vReg_54,imm_55,vReg_32
	mul		vReg_56,A_14,vReg_54
	li		imm_58,3654898
	div		vReg_57,imm_58,vReg_32
	mul		vReg_59,vReg_33,vReg_57
	sub		vReg_60,vReg_56,vReg_59
	li		imm_61,0
	bge		vReg_60,imm_61,main_fake_random__if_then
	j		main_fake_random__if_else_3

main_fake_random__if_then:
	mv		seed_62,vReg_60
	mv		seed_63,seed_62
	j		main_split_block_2

main_split_block_2:
	li		imm_65,10
	rem		vReg_64,seed_63,imm_65
	addi	vReg_66,vReg_64,1
	mv		now_67,vReg_66
	mv		a0,vReg_66
	call	__builtin_toString
	mv		vReg_68,a0
	mv		a0,vReg_68
	call	__builtin_println
	mv		seed_69,seed_63
	mv		temp_70,temp_23
	mv		i_71,i_21
	j		main__for_cond

main__for_cond:
	addi	vReg_72,vReg_66,-1
	blt		i_71,vReg_72,main__for_body
	j		main__for_merge

main__for_body:
	li		imm_74,4
	mul		vReg_73,i_71,imm_74
	addi	vReg_75,vReg_73,4
	add		vReg_76,vReg_75,vReg_30
	rem		vReg_77,seed_69,vReg_32
	mul		vReg_78,A_14,vReg_77
	div		vReg_79,seed_69,vReg_32
	mul		vReg_80,vReg_33,vReg_79
	sub		vReg_81,vReg_78,vReg_80
	li		imm_82,0
	bge		vReg_81,imm_82,main_fake_random__if_then_2
	j		main_fake_random__if_else_2

main_fake_random__if_then_2:
	mv		seed_83,vReg_81
	mv		seed_84,seed_83
	j		main_split_block_3

main_split_block_3:
	li		imm_86,10
	rem		vReg_85,seed_84,imm_86
	addi	vReg_87,vReg_85,1
	sw		vReg_87,0(vReg_76)
	mv		seed_88,seed_84
	j		main__while_cond

main__while_cond:
	li		imm_90,4
	mul		vReg_89,i_71,imm_90
	addi	vReg_91,vReg_89,4
	add		vReg_92,vReg_91,vReg_30
	lw		vReg_93,0(vReg_92)
	add		vReg_94,vReg_93,temp_70
	li		imm_95,210
	bgt		vReg_94,imm_95,main__while_body
	j		main__while_merge

main__while_body:
	rem		vReg_96,seed_88,vReg_32
	mul		vReg_97,A_14,vReg_96
	div		vReg_98,seed_88,vReg_32
	mul		vReg_99,vReg_33,vReg_98
	sub		vReg_100,vReg_97,vReg_99
	li		imm_101,0
	bge		vReg_100,imm_101,main_fake_random__if_then_3
	j		main_fake_random__if_else

main_fake_random__if_then_3:
	mv		seed_102,vReg_100
	mv		seed_103,seed_102
	j		main_split_block_4

main_split_block_4:
	li		imm_105,10
	rem		vReg_104,seed_103,imm_105
	addi	vReg_106,vReg_104,1
	sw		vReg_106,0(vReg_92)
	mv		seed_88,seed_103
	j		main__while_cond

main_fake_random__if_else:
	add		vReg_107,vReg_100,M_18
	mv		seed_108,vReg_107
	mv		seed_103,seed_108
	j		main_split_block_4

main__while_merge:
	lw		vReg_109,0(vReg_92)
	add		vReg_110,temp_70,vReg_109
	mv		temp_111,vReg_110
	addi	i_112,i_71,1
	mv		seed_69,seed_88
	mv		temp_70,temp_111
	mv		i_71,i_112
	j		main__for_cond

main_fake_random__if_else_2:
	add		vReg_113,vReg_81,M_18
	mv		seed_114,vReg_113
	mv		seed_84,seed_114
	j		main_split_block_3

main__for_merge:
	li		imm_116,4
	mul		vReg_115,vReg_72,imm_116
	addi	vReg_117,vReg_115,4
	add		vReg_118,vReg_117,vReg_30
	li		imm_120,210
	sub		vReg_119,imm_120,temp_70
	sw		vReg_119,0(vReg_118)
	li		imm_122,0
	mv		i_121,imm_122
	mv		i_123,i_121
	j		main_fake_show__for_cond

main_fake_show__for_cond:
	blt		i_123,vReg_66,main_fake_show__for_body_2
	j		main_split_block_5

main_split_block_5:
	la		str_const_124,__str_const_2
	mv		a0,str_const_124
	call	__builtin_println
	li		imm_126,0
	mv		i_125,imm_126
	mv		i_127,i_125
	j		main_fake_merge__for_cond

main_fake_merge__for_cond:
	blt		i_127,vReg_66,main_fake_merge__for_body_5
	j		main_fake_merge__for_merge

main_fake_merge__for_merge:
	li		imm_129,0
	mv		i_128,imm_129
	mv		i_130,i_128
	j		main_fake_merge__for_cond_2

main_fake_merge__for_cond_2:
	blt		i_130,vReg_66,main_fake_merge__for_body_4
	j		main__parallel_copy_

main__parallel_copy_:
	mv		now_131,now_67
	j		main_split_block_6

main_split_block_6:
	mv		now_132,now_131
	mv		count_133,count_25
	j		main__while_cond_2

main__while_cond_2:
	li		imm_134,404
	mv		a0,imm_134
	call	malloc
	mv		vReg_135,a0
	li		imm_136,100
	sw		imm_136,0(vReg_135)
	bne		now_132,h_34,main_fake_win__if_then
	j		main_fake_win__if_merge

main_fake_win__if_then:
	li		imm_138,0
	mv		returnVal_137,imm_138
	mv		returnVal_139,returnVal_137
	j		main_split_block_7

main_split_block_7:
	bne		returnVal_139,zero,main__while_merge_2
	j		main__while_body_2

main__while_body_2:
	addi	count_140,count_133,1
	mv		a0,count_140
	call	__builtin_toString
	mv		vReg_141,a0
	la		str_const_142,__str_const_5
	mv		a0,str_const_142
	mv		a1,vReg_141
	call	__builtin_string_add
	mv		vReg_143,a0
	mv		a0,vReg_143
	la		str_const_144,__str_const_6
	mv		a1,str_const_144
	call	__builtin_string_add
	mv		vReg_145,a0
	mv		a0,vReg_145
	call	__builtin_println
	li		imm_147,0
	mv		i_146,imm_147
	mv		i_148,i_146
	j		main_fake_move__for_cond

main_fake_move__for_cond:
	blt		i_148,now_132,main_fake_move__for_body
	j		main_split_block_8

main_split_block_8:
	li		imm_150,4
	mul		vReg_149,now_132,imm_150
	addi	vReg_151,vReg_149,4
	add		vReg_152,vReg_151,vReg_30
	sw		now_132,0(vReg_152)
	addi	now_153,now_132,1
	li		imm_155,0
	mv		i_154,imm_155
	mv		i_156,i_154
	j		main_fake_merge__for_cond_3

main_fake_merge__for_cond_3:
	blt		i_156,now_153,main_fake_merge__for_body_2
	j		main_fake_merge__for_merge_2

main_fake_merge__for_merge_2:
	li		imm_158,0
	mv		i_157,imm_158
	mv		i_159,i_157
	j		main_fake_merge__for_cond_4

main_fake_merge__for_cond_4:
	blt		i_159,now_153,main_fake_merge__for_body
	j		main__parallel_copy__2

main__parallel_copy__2:
	mv		now_160,now_153
	j		main_split_block_9

main_split_block_9:
	li		imm_162,0
	mv		i_161,imm_162
	mv		i_163,i_161
	j		main_fake_show__for_cond_2

main_fake_show__for_cond_2:
	blt		i_163,now_160,main_fake_show__for_body
	j		main_split_block_10

main_fake_show__for_body:
	li		imm_165,4
	mul		vReg_164,i_163,imm_165
	addi	vReg_166,vReg_164,4
	add		vReg_167,vReg_166,vReg_30
	lw		vReg_168,0(vReg_167)
	mv		a0,vReg_168
	call	__builtin_toString
	mv		vReg_169,a0
	mv		a0,vReg_169
	la		str_const_170,__str_const_1
	mv		a1,str_const_170
	call	__builtin_string_add
	mv		vReg_171,a0
	mv		a0,vReg_171
	call	__builtin_print
	addi	i_172,i_163,1
	mv		i_163,i_172
	j		main_fake_show__for_cond_2

main_split_block_10:
	la		str_const_173,__str_const_2
	mv		a0,str_const_173
	call	__builtin_println
	mv		now_132,now_160
	mv		count_133,count_140
	j		main__while_cond_2

main_fake_merge__for_body:
	li		imm_175,4
	mul		vReg_174,i_159,imm_175
	addi	vReg_176,vReg_174,4
	add		vReg_177,vReg_176,vReg_30
	lw		vReg_178,0(vReg_177)
	li		imm_179,0
	beq		vReg_178,imm_179,main_fake_merge__if_then
	j		main_fake_merge__for_step

main_fake_merge__for_step:
	addi	i_180,i_159,1
	mv		i_159,i_180
	j		main_fake_merge__for_cond_4

main_fake_merge__if_then:
	mv		now_181,i_159
	mv		now_160,now_181
	j		main_split_block_9

main_fake_merge__for_body_2:
	li		imm_183,4
	mul		vReg_182,i_156,imm_183
	addi	vReg_184,vReg_182,4
	add		vReg_185,vReg_184,vReg_30
	lw		vReg_186,0(vReg_185)
	li		imm_187,0
	beq		vReg_186,imm_187,main_fake_merge__if_then_2
	j		main_fake_merge__for_step_2

main_fake_merge__for_step_2:
	addi	i_188,i_156,1
	mv		i_156,i_188
	j		main_fake_merge__for_cond_3

main_fake_merge__if_then_2:
	addi	vReg_189,i_156,1
	mv		j_190,vReg_189
	mv		j_191,j_190
	j		main_fake_merge__for_cond_5

main_fake_merge__for_cond_5:
	blt		j_191,now_153,main_fake_merge__for_body_3
	j		main_fake_merge__for_step_2

main_fake_merge__for_body_3:
	li		imm_193,4
	mul		vReg_192,j_191,imm_193
	addi	vReg_194,vReg_192,4
	add		vReg_195,vReg_194,vReg_30
	lw		vReg_196,0(vReg_195)
	li		imm_197,0
	bne		vReg_196,imm_197,main_fake_merge_split_block
	j		main_fake_merge__for_step_3

main_fake_merge_split_block:
	li		imm_199,4
	mul		vReg_198,i_156,imm_199
	addi	vReg_200,vReg_198,4
	add		vReg_201,vReg_200,vReg_30
	lw		vReg_202,0(vReg_201)
	lw		vReg_203,0(vReg_195)
	sw		vReg_203,0(vReg_201)
	sw		vReg_202,0(vReg_195)
	j		main_fake_merge__for_step_2

main_fake_merge__for_step_3:
	addi	j_204,j_191,1
	mv		j_191,j_204
	j		main_fake_merge__for_cond_5

main_fake_move__for_body:
	li		imm_206,4
	mul		vReg_205,i_148,imm_206
	addi	vReg_207,vReg_205,4
	add		vReg_208,vReg_207,vReg_30
	lw		vReg_209,0(vReg_208)
	addi	vReg_210,vReg_209,-1
	sw		vReg_210,0(vReg_208)
	addi	vReg_211,i_148,1
	mv		i_212,vReg_211
	mv		i_148,i_212
	j		main_fake_move__for_cond

main__while_merge_2:
	mv		a0,count_133
	call	__builtin_toString
	mv		vReg_213,a0
	la		str_const_214,__str_const_7
	mv		a0,str_const_214
	mv		a1,vReg_213
	call	__builtin_string_add
	mv		vReg_215,a0
	mv		a0,vReg_215
	la		str_const_216,__str_const_8
	mv		a1,str_const_216
	call	__builtin_string_add
	mv		vReg_217,a0
	mv		a0,vReg_217
	call	__builtin_println
	li		imm_219,0
	mv		returnVal_218,imm_219
	mv		now_42,now_132
	mv		returnVal_43,returnVal_218
	mv		seed_44,seed_69
	j		main_exit

main_fake_win__if_merge:
	li		imm_221,0
	mv		j_220,imm_221
	mv		j_222,j_220
	j		main_fake_win__for_cond

main_fake_win__for_cond:
	blt		j_222,now_132,main_fake_win__for_body
	j		main_fake_win__for_merge

main_fake_win__for_body:
	li		imm_224,4
	mul		vReg_223,j_222,imm_224
	addi	vReg_225,vReg_223,4
	add		vReg_226,vReg_225,vReg_135
	add		vReg_227,vReg_225,vReg_30
	lw		vReg_228,0(vReg_227)
	sw		vReg_228,0(vReg_226)
	addi	j_229,j_222,1
	mv		j_222,j_229
	j		main_fake_win__for_cond

main_fake_win__for_merge:
	li		imm_231,0
	mv		i_230,imm_231
	mv		i_232,i_230
	j		main_fake_win__for_cond_2

main_fake_win__for_cond_2:
	addi	vReg_233,now_132,-1
	blt		i_232,vReg_233,main_fake_win__for_body_3
	j		main_fake_win__for_merge_2

main_fake_win__for_merge_2:
	li		imm_235,0
	mv		i_234,imm_235
	mv		i_236,i_234
	j		main_fake_win__for_cond_3

main_fake_win__for_cond_3:
	blt		i_236,now_132,main_fake_win__for_body_2
	j		main_fake_win__for_merge_3

main_fake_win__for_merge_3:
	li		imm_238,1
	mv		returnVal_237,imm_238
	mv		returnVal_139,returnVal_237
	j		main_split_block_7

main_fake_win__for_body_2:
	li		imm_240,4
	mul		vReg_239,i_236,imm_240
	addi	vReg_241,vReg_239,4
	add		vReg_242,vReg_241,vReg_135
	addi	vReg_243,i_236,1
	lw		vReg_244,0(vReg_242)
	bne		vReg_244,vReg_243,main_fake_win__if_then_2
	j		main_fake_win__for_step

main_fake_win__for_step:
	mv		i_245,vReg_243
	mv		i_236,i_245
	j		main_fake_win__for_cond_3

main_fake_win__if_then_2:
	li		imm_247,0
	mv		returnVal_246,imm_247
	mv		returnVal_139,returnVal_246
	j		main_split_block_7

main_fake_win__for_body_3:
	addi	vReg_248,i_232,1
	mv		j_249,vReg_248
	mv		j_250,j_249
	j		main_fake_win__for_cond_4

main_fake_win__for_cond_4:
	blt		j_250,now_132,main_fake_win__for_body_4
	j		main_fake_win__for_step_3

main_fake_win__for_body_4:
	li		imm_252,4
	mul		vReg_251,i_232,imm_252
	addi	vReg_253,vReg_251,4
	add		vReg_254,vReg_253,vReg_135
	li		imm_256,4
	mul		vReg_255,j_250,imm_256
	addi	vReg_257,vReg_255,4
	add		vReg_258,vReg_257,vReg_135
	lw		vReg_259,0(vReg_254)
	lw		vReg_260,0(vReg_258)
	bgt		vReg_259,vReg_260,main_fake_win__if_then_3
	j		main_fake_win__for_step_2

main_fake_win__if_then_3:
	lw		vReg_261,0(vReg_254)
	lw		vReg_262,0(vReg_258)
	sw		vReg_262,0(vReg_254)
	sw		vReg_261,0(vReg_258)
	j		main_fake_win__for_step_2

main_fake_win__for_step_2:
	addi	j_263,j_250,1
	mv		j_250,j_263
	j		main_fake_win__for_cond_4

main_fake_win__for_step_3:
	addi	i_264,i_232,1
	mv		i_232,i_264
	j		main_fake_win__for_cond_2

main_fake_merge__for_body_4:
	li		imm_266,4
	mul		vReg_265,i_130,imm_266
	addi	vReg_267,vReg_265,4
	add		vReg_268,vReg_267,vReg_30
	lw		vReg_269,0(vReg_268)
	li		imm_270,0
	beq		vReg_269,imm_270,main_fake_merge__if_then_3
	j		main_fake_merge__for_step_4

main_fake_merge__if_then_3:
	mv		now_271,i_130
	mv		now_131,now_271
	j		main_split_block_6

main_fake_merge__for_step_4:
	addi	i_272,i_130,1
	mv		i_130,i_272
	j		main_fake_merge__for_cond_2

main_fake_merge__for_body_5:
	li		imm_274,4
	mul		vReg_273,i_127,imm_274
	addi	vReg_275,vReg_273,4
	add		vReg_276,vReg_275,vReg_30
	lw		vReg_277,0(vReg_276)
	li		imm_278,0
	beq		vReg_277,imm_278,main_fake_merge__if_then_4
	j		main_fake_merge__for_step_5

main_fake_merge__if_then_4:
	addi	vReg_279,i_127,1
	mv		j_280,vReg_279
	mv		j_281,j_280
	j		main_fake_merge__for_cond_6

main_fake_merge__for_cond_6:
	blt		j_281,vReg_66,main_fake_merge__for_body_6
	j		main_fake_merge__for_step_5

main_fake_merge__for_step_5:
	addi	i_282,i_127,1
	mv		i_127,i_282
	j		main_fake_merge__for_cond

main_fake_merge__for_body_6:
	li		imm_284,4
	mul		vReg_283,j_281,imm_284
	addi	vReg_285,vReg_283,4
	add		vReg_286,vReg_285,vReg_30
	lw		vReg_287,0(vReg_286)
	li		imm_288,0
	bne		vReg_287,imm_288,main_fake_merge_split_block_2
	j		main_fake_merge__for_step_6

main_fake_merge_split_block_2:
	li		imm_290,4
	mul		vReg_289,i_127,imm_290
	addi	vReg_291,vReg_289,4
	add		vReg_292,vReg_291,vReg_30
	lw		vReg_293,0(vReg_292)
	lw		vReg_294,0(vReg_286)
	sw		vReg_294,0(vReg_292)
	sw		vReg_293,0(vReg_286)
	j		main_fake_merge__for_step_5

main_fake_merge__for_step_6:
	addi	j_295,j_281,1
	mv		j_281,j_295
	j		main_fake_merge__for_cond_6

main_fake_show__for_body_2:
	li		imm_297,4
	mul		vReg_296,i_123,imm_297
	addi	vReg_298,vReg_296,4
	add		vReg_299,vReg_298,vReg_30
	lw		vReg_300,0(vReg_299)
	mv		a0,vReg_300
	call	__builtin_toString
	mv		vReg_301,a0
	mv		a0,vReg_301
	la		str_const_302,__str_const_1
	mv		a1,str_const_302
	call	__builtin_string_add
	mv		vReg_303,a0
	mv		a0,vReg_303
	call	__builtin_print
	addi	i_304,i_123,1
	mv		i_123,i_304
	j		main_fake_show__for_cond

main_fake_random__if_else_3:
	add		vReg_305,vReg_60,M_18
	mv		seed_306,vReg_305
	mv		seed_63,seed_306
	j		main_split_block_2

main_fake_pd__for_body:
	addi	vReg_307,h_34,1
	mul		vReg_308,h_34,vReg_307
	li		imm_310,2
	div		vReg_309,vReg_308,imm_310
	li		imm_311,210
	beq		imm_311,vReg_309,main_fake_pd__if_then
	j		main_fake_pd__for_step

main_fake_pd__if_then:
	li		imm_313,1
	mv		returnVal_312,imm_313
	mv		returnVal_38,returnVal_312
	j		main_split_block

main_fake_pd__for_step:
	mv		h_314,vReg_307
	mv		h_34,h_314
	j		main_fake_pd__for_cond


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
	li		imm_16,1
	sw		imm_16,0(global_tmp_15)
	lui		global_tmp_17,0
	li		imm_18,48271
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


