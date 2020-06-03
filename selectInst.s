	.data

	.globl	__str_const_1
__str_const_1:
	.string	

	.globl	__str_const_2
__str_const_2:
	.string	

	.globl	__str_const_3
__str_const_3:
	.string	nChunk > MAXCHUNK!

	.globl	__str_const_4
__str_const_4:
	.string	

	.globl	__str_const_5
__str_const_5:
	.string	Invalid input

	.globl	__str_const_6
__str_const_6:
	.string	

	.globl	__str_const_7
__str_const_7:
	.string	Not Found!

	.globl	__str_const_8
__str_const_8:
	.string	

	.globl	__str_const_9
__str_const_9:
	.string	 !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~

	.globl	asciiTable
asciiTable:
	.zero	4

	.globl	MAXCHUNK
MAXCHUNK:
	.zero	4

	.globl	MAXLENGTH
MAXLENGTH:
	.zero	4

	.globl	chunks
chunks:
	.zero	4

	.globl	inputBuffer
inputBuffer:
	.zero	4

	.globl	outputBuffer
outputBuffer:
	.zero	4


	.text

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
	li		imm_13,404
	mv		a0,imm_13
	call	malloc
	mv		vReg_14,a0
	li		imm_15,100
	sw		imm_15,0(vReg_14)
	addi	vReg_16,vReg_14,4
	addi	vReg_17,vReg_14,404
	mv		vReg_18,vReg_16
	j		_init___array_loop_cond

_init___array_loop_cond:
	blt		vReg_18,vReg_17,_init___array_loop_body
	j		_init___array_loop_merge

_init___array_loop_merge:
	li		imm_19,25284
	mv		a0,imm_19
	call	malloc
	mv		vReg_20,a0
	li		imm_21,6320
	sw		imm_21,0(vReg_20)
	li		imm_22,24
	mv		a0,imm_22
	call	malloc
	mv		vReg_23,a0
	li		imm_24,5
	sw		imm_24,0(vReg_23)
	li		imm_26,0
	mv		i_25,imm_26
	li		imm_28,0
	mv		returnVal_27,imm_28
	li		imm_30,0
	mv		returnVal_29,imm_30
	li		imm_32,1
	mv		returnVal_31,imm_32
	li		imm_34,0
	mv		returnVal_33,imm_34
	li		imm_36,-1
	mv		returnVal_35,imm_36
	li		imm_38,97
	mv		returnVal_37,imm_38
	li		imm_40,65
	mv		returnVal_39,imm_40
	li		imm_42,1518500249
	mv		k_41,imm_42
	li		imm_44,-899497514
	mv		k_43,imm_44
	li		imm_46,1859775393
	mv		k_45,imm_46
	li		imm_48,-1894007588
	mv		k_47,imm_48
	li		imm_50,1732584193
	mv		h0_49,imm_50
	li		imm_52,1
	mv		returnVal_51,imm_52
	li		imm_54,0
	mv		returnVal_53,imm_54
	li		imm_56,0
	mv		i_55,imm_56
	li		imm_58,-1009589776
	mv		h4_57,imm_58
	li		imm_60,0
	mv		i_59,imm_60
	li		imm_62,-271733879
	mv		h1_61,imm_62
	li		imm_64,-1732584194
	mv		h2_63,imm_64
	li		imm_66,271733878
	mv		h3_65,imm_66
	li		imm_68,0
	mv		returnVal_67,imm_68
	addi	vReg_69,vReg_23,4
	addi	vReg_70,vReg_23,8
	addi	vReg_71,vReg_23,12
	addi	vReg_72,vReg_23,16
	addi	vReg_73,vReg_23,20
	mv		returnVal_74,vReg_23
	li		imm_76,0
	mv		i_75,imm_76
	la		str_const_78,__str_const_1
	mv		returnVal_77,str_const_78
	la		str_const_80,__str_const_1
	mv		returnVal_79,str_const_80
	li		imm_82,-1894007588
	mv		k_81,imm_82
	li		imm_84,-899497514
	mv		k_83,imm_84
	li		imm_86,1518500249
	mv		k_85,imm_86
	li		imm_88,1859775393
	mv		k_87,imm_88
	mv		returnVal_89,vReg_23
	li		imm_91,0
	mv		result_90,imm_91
	li		imm_93,0
	mv		i_92,imm_93
	li		imm_95,0
	mv		returnVal_94,imm_95
	li		imm_97,0
	mv		i_96,imm_97
	li		imm_99,0
	mv		i_98,imm_99
	li		imm_101,0
	mv		i_100,imm_101
	la		str_const_103,__str_const_1
	mv		returnVal_102,str_const_103
	li		imm_105,1
	mv		digit_104,imm_105
	li		imm_107,0
	mv		j_licm_phi_106,imm_107
	li		imm_109,28
	mv		i_licm_phi_108,imm_109
	la		str_const_111,__str_const_2
	mv		ret_licm_phi_110,str_const_111
	li		imm_113,0
	mv		j_licm_phi_112,imm_113
	li		imm_115,16
	mv		j_licm_phi_114,imm_115
	li		imm_117,0
	mv		i_licm_phi_116,imm_117
	li		imm_119,0
	mv		i_licm_phi_118,imm_119
	li		imm_121,16
	mv		j_licm_phi_120,imm_121
	li		imm_123,0
	mv		j_licm_phi_122,imm_123
	li		imm_125,0
	mv		j_licm_phi_124,imm_125
	li		imm_127,0
	mv		i_licm_phi_126,imm_127
	li		imm_129,0
	mv		i_licm_phi_128,imm_129
	li		imm_131,-271733879
	mv		h1_licm_phi_130,imm_131
	li		imm_133,-1009589776
	mv		h4_licm_phi_132,imm_133
	li		imm_135,0
	mv		i_licm_phi_134,imm_135
	li		imm_137,-1732584194
	mv		h2_licm_phi_136,imm_137
	li		imm_139,271733878
	mv		h3_licm_phi_138,imm_139
	li		imm_141,1732584193
	mv		h0_licm_phi_140,imm_141
	li		imm_143,0
	mv		i_licm_phi_142,imm_143
	j		_init__fake_main__while_body

_init__fake_main__while_body:
	call	__builtin_getInt
	mv		vReg_144,a0
	beq		vReg_144,zero,_init__split_block
	j		_init__fake_main__if_merge

_init__fake_main__if_merge:
	li		imm_145,1
	beq		vReg_144,imm_145,_init__fake_main__if_then_2
	j		_init__fake_main__if_else

_init__fake_main__if_else:
	li		imm_146,2
	beq		vReg_144,imm_146,_init__fake_main__if_then
	j		_init__fake_main__while_body

_init__fake_main__if_then:
	call	__builtin_getString
	mv		vReg_147,a0
	li		imm_148,24
	mv		a0,imm_148
	call	malloc
	mv		vReg_149,a0
	li		imm_150,5
	sw		imm_150,0(vReg_149)
	mv		a0,vReg_147
	call	__builtin_string_length
	mv		vReg_151,a0
	li		imm_152,40
	bne		vReg_151,imm_152,_init__fake_crackSHA1__if_then
	j		_init__fake_crackSHA1__if_merge

_init__fake_crackSHA1__if_merge:
	mv		i_153,i_25
	j		_init__fake_crackSHA1__for_cond

_init__fake_crackSHA1__for_cond:
	li		imm_154,5
	blt		i_153,imm_154,_init__fake_crackSHA1__for_body
	j		_init___init__fake_crackSHA1__for_cond_pre_header

_init__fake_crackSHA1__for_body:
	slli	vReg_155,i_153,2
	addi	vReg_156,vReg_155,4
	add		vReg_157,vReg_156,vReg_149
	li		imm_158,0
	sw		imm_158,0(vReg_157)
	addi	i_159,i_153,1
	mv		i_153,i_159
	j		_init__fake_crackSHA1__for_cond

_init___init__fake_crackSHA1__for_cond_pre_header:
	mv		i_160,i_licm_phi_116
	j		_init__fake_crackSHA1__for_cond_2

_init__fake_crackSHA1__for_cond_2:
	li		imm_161,40
	blt		i_160,imm_161,_init__fake_crackSHA1__for_body_5
	j		_init__fake_crackSHA1__for_merge

_init__fake_crackSHA1__for_merge:
	mv		digit_162,digit_104
	j		_init__fake_crackSHA1__for_cond_3

_init__fake_crackSHA1__for_cond_3:
	li		imm_163,4
	ble		digit_162,imm_163,_init__fake_crackSHA1__for_body_2
	j		_init__fake_crackSHA1__for_merge_3

_init__fake_crackSHA1__for_body_2:
	mv		i_164,i_98
	j		_init__fake_crackSHA1__for_cond_4

_init__fake_crackSHA1__for_cond_4:
	blt		i_164,digit_162,_init__fake_crackSHA1__for_body_3
	j		_init___init__fake_crackSHA1__while_cond_pre_header

_init__fake_crackSHA1__for_body_3:
	slli	vReg_165,i_164,2
	addi	vReg_166,vReg_165,4
	add		vReg_167,vReg_166,vReg_20
	li		imm_168,48
	sw		imm_168,0(vReg_167)
	addi	i_169,i_164,1
	mv		i_164,i_169
	j		_init__fake_crackSHA1__for_cond_4

_init___init__fake_crackSHA1__while_cond_pre_header:
	addi	vReg_170,digit_162,64
	addi	vReg_171,vReg_170,-56
	li		imm_173,64
	div		vReg_172,vReg_171,imm_173
	addi	vReg_174,vReg_172,1
	addi	vReg_175,vReg_174,-1
	slli	vReg_176,vReg_175,2
	addi	vReg_177,vReg_176,4
	add		vReg_178,vReg_177,vReg_14
	slli	vReg_179,digit_162,3
	srai	vReg_180,digit_162,29
	andi	vReg_181,vReg_180,7
	addi	vReg_182,digit_162,-1
	mv		i_licm_phi_183,vReg_182
	j		_init__fake_crackSHA1__while_body

_init__fake_crackSHA1__while_body:
	li		imm_184,100
	bgt		vReg_174,imm_184,_init__fake_crackSHA1_fake_sha1__if_then
	j		_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header

_init__fake_crackSHA1_fake_sha1__if_then:
	la		str_const_185,__str_const_3
	mv		a0,str_const_185
	call	__builtin_println
	mv		returnVal_186,returnVal_67
	j		_init__fake_crackSHA1_split_block

_init__fake_crackSHA1_split_block:
	lw		vReg_187,0(returnVal_186)
	lw		vReg_188,0(vReg_149)
	bne		vReg_187,vReg_188,_init__fake_crackSHA1_fake_array_equal__if_then
	j		_init__fake_crackSHA1_fake_array_equal__if_merge

_init__fake_crackSHA1_fake_array_equal__if_then:
	mv		returnVal_189,returnVal_53
	j		_init__fake_crackSHA1_split_block_2

_init__fake_crackSHA1_split_block_2:
	bne		returnVal_189,zero,_init___init__fake_crackSHA1__for_cond_pre_header_2
	j		_init___init__fake_crackSHA1_fake_nextText__for_cond_pre_header

_init___init__fake_crackSHA1__for_cond_pre_header_2:
	mv		i_190,i_licm_phi_118
	j		_init__fake_crackSHA1__for_cond_5

_init__fake_crackSHA1__for_cond_5:
	blt		i_190,digit_162,_init__fake_crackSHA1__for_body_4
	j		_init__fake_crackSHA1__for_merge_2

_init__fake_crackSHA1__for_merge_2:
	la		str_const_191,__str_const_6
	mv		a0,str_const_191
	call	__builtin_println
	j		_init__fake_main__while_body

_init__fake_crackSHA1__for_body_4:
	slli	vReg_192,i_190,2
	addi	vReg_193,vReg_192,4
	add		vReg_194,vReg_193,vReg_20
	lw		vReg_195,0(vReg_194)
	li		imm_196,32
	bge		vReg_195,imm_196,_init__fake_crackSHA1_fake_int2chr__lhs_and_then
	j		_init__fake_crackSHA1_fake_int2chr__if_merge

_init__fake_crackSHA1_fake_int2chr__lhs_and_then:
	li		imm_197,126
	ble		vReg_195,imm_197,_init__fake_crackSHA1_fake_int2chr__if_then
	j		_init__fake_crackSHA1_fake_int2chr__if_merge

_init__fake_crackSHA1_fake_int2chr__if_then:
	addi	vReg_198,vReg_195,-32
	addi	vReg_199,vReg_195,-31
	la		str_const_200,__str_const_9
	mv		a0,str_const_200
	mv		a1,vReg_198
	mv		a2,vReg_199
	call	__builtin_string_substring
	mv		vReg_201,a0
	mv		returnVal_202,vReg_201
	mv		returnVal_203,returnVal_202
	j		_init__fake_crackSHA1_split_block_3

_init__fake_crackSHA1_split_block_3:
	mv		a0,returnVal_203
	call	__builtin_print
	addi	i_204,i_190,1
	mv		i_190,i_204
	j		_init__fake_crackSHA1__for_cond_5

_init__fake_crackSHA1_fake_int2chr__if_merge:
	mv		returnVal_203,returnVal_102
	j		_init__fake_crackSHA1_split_block_3

_init___init__fake_crackSHA1_fake_nextText__for_cond_pre_header:
	mv		i_205,i_licm_phi_183
	j		_init__fake_crackSHA1_fake_nextText__for_cond

_init__fake_crackSHA1_fake_nextText__for_cond:
	bge		i_205,zero,_init__fake_crackSHA1_fake_nextText__for_body
	j		_init__fake_crackSHA1_fake_nextText__for_merge

_init__fake_crackSHA1_fake_nextText__for_body:
	slli	vReg_206,i_205,2
	addi	vReg_207,vReg_206,4
	add		vReg_208,vReg_207,vReg_20
	lw		vReg_209,0(vReg_208)
	li		imm_210,122
	beq		vReg_209,imm_210,_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then
	j		_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then:
	mv		returnVal_211,returnVal_35
	j		_init__fake_crackSHA1_fake_nextText_split_block

_init__fake_crackSHA1_fake_nextText_split_block:
	sw		returnVal_211,0(vReg_208)
	lw		vReg_212,0(vReg_208)
	li		imm_213,-1
	beq		vReg_212,imm_213,_init__fake_crackSHA1_fake_nextText__if_then
	j		_init__fake_crackSHA1_fake_nextText__if_else

_init__fake_crackSHA1_fake_nextText__if_else:
	mv		returnVal_214,returnVal_51
	j		_init__fake_crackSHA1_split_block_4

_init__fake_crackSHA1_split_block_4:
	bne		returnVal_214,zero,_init__fake_crackSHA1__while_body
	j		_init__fake_crackSHA1__for_step

_init__fake_crackSHA1__for_step:
	addi	digit_215,digit_162,1
	mv		digit_162,digit_215
	j		_init__fake_crackSHA1__for_cond_3

_init__fake_crackSHA1_fake_nextText__if_then:
	li		imm_216,48
	sw		imm_216,0(vReg_208)
	addi	i_217,i_205,-1
	mv		i_205,i_217
	j		_init__fake_crackSHA1_fake_nextText__for_cond

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge:
	li		imm_218,90
	beq		vReg_209,imm_218,_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then_3
	j		_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge_2

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge_2:
	li		imm_219,57
	beq		vReg_209,imm_219,_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then_2
	j		_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge_3

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then_2:
	mv		returnVal_211,returnVal_39
	j		_init__fake_crackSHA1_fake_nextText_split_block

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge_3:
	addi	vReg_220,vReg_209,1
	mv		returnVal_221,vReg_220
	mv		returnVal_211,returnVal_221
	j		_init__fake_crackSHA1_fake_nextText_split_block

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then_3:
	mv		returnVal_211,returnVal_37
	j		_init__fake_crackSHA1_fake_nextText_split_block

_init__fake_crackSHA1_fake_nextText__for_merge:
	mv		returnVal_214,returnVal_33
	j		_init__fake_crackSHA1_split_block_4

_init__fake_crackSHA1_fake_array_equal__if_merge:
	mv		i_222,i_75
	j		_init__fake_crackSHA1_fake_array_equal__for_cond

_init__fake_crackSHA1_fake_array_equal__for_cond:
	lw		vReg_223,0(returnVal_186)
	blt		i_222,vReg_223,_init__fake_crackSHA1_fake_array_equal__for_body
	j		_init__fake_crackSHA1_fake_array_equal__for_merge

_init__fake_crackSHA1_fake_array_equal__for_merge:
	mv		returnVal_189,returnVal_31
	j		_init__fake_crackSHA1_split_block_2

_init__fake_crackSHA1_fake_array_equal__for_body:
	slli	vReg_224,i_222,2
	addi	vReg_225,vReg_224,4
	add		vReg_226,vReg_225,returnVal_186
	add		vReg_227,vReg_225,vReg_149
	lw		vReg_228,0(vReg_226)
	lw		vReg_229,0(vReg_227)
	bne		vReg_228,vReg_229,_init__fake_crackSHA1_fake_array_equal__if_then_2
	j		_init__fake_crackSHA1_fake_array_equal__for_step

_init__fake_crackSHA1_fake_array_equal__for_step:
	addi	i_230,i_222,1
	mv		i_222,i_230
	j		_init__fake_crackSHA1_fake_array_equal__for_cond

_init__fake_crackSHA1_fake_array_equal__if_then_2:
	mv		returnVal_189,returnVal_29
	j		_init__fake_crackSHA1_split_block_2

_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header:
	mv		i_231,i_licm_phi_142
	j		_init__fake_crackSHA1_fake_sha1__for_cond

_init__fake_crackSHA1_fake_sha1__for_cond:
	blt		i_231,vReg_174,_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_4
	j		_init__fake_crackSHA1_fake_sha1__for_merge

_init__fake_crackSHA1_fake_sha1__for_merge:
	mv		i_232,i_55
	j		_init__fake_crackSHA1_fake_sha1__for_cond_2

_init__fake_crackSHA1_fake_sha1__for_cond_2:
	blt		i_232,digit_162,_init__fake_crackSHA1_fake_sha1__for_body
	j		_init__fake_crackSHA1_fake_sha1__for_merge_2

_init__fake_crackSHA1_fake_sha1__for_body:
	li		imm_234,64
	div		vReg_233,i_232,imm_234
	slli	vReg_235,vReg_233,2
	addi	vReg_236,vReg_235,4
	add		vReg_237,vReg_236,vReg_14
	li		imm_239,64
	rem		vReg_238,i_232,imm_239
	li		imm_241,4
	div		vReg_240,vReg_238,imm_241
	lw		vReg_242,0(vReg_237)
	slli	vReg_243,vReg_240,2
	addi	vReg_244,vReg_243,4
	add		vReg_245,vReg_244,vReg_242
	lw		vReg_246,0(vReg_237)
	add		vReg_247,vReg_244,vReg_246
	slli	vReg_248,i_232,2
	addi	vReg_249,vReg_248,4
	add		vReg_250,vReg_249,vReg_20
	li		imm_252,4
	rem		vReg_251,i_232,imm_252
	li		imm_254,3
	sub		vReg_253,imm_254,vReg_251
	slli	vReg_255,vReg_253,3
	lw		vReg_256,0(vReg_250)
	sll		vReg_257,vReg_256,vReg_255
	lw		vReg_258,0(vReg_247)
	or		vReg_259,vReg_258,vReg_257
	sw		vReg_259,0(vReg_245)
	addi	i_260,i_232,1
	mv		i_232,i_260
	j		_init__fake_crackSHA1_fake_sha1__for_cond_2

_init__fake_crackSHA1_fake_sha1__for_merge_2:
	li		imm_262,64
	div		vReg_261,i_232,imm_262
	slli	vReg_263,vReg_261,2
	addi	vReg_264,vReg_263,4
	add		vReg_265,vReg_264,vReg_14
	li		imm_267,64
	rem		vReg_266,i_232,imm_267
	li		imm_269,4
	div		vReg_268,vReg_266,imm_269
	lw		vReg_270,0(vReg_265)
	slli	vReg_271,vReg_268,2
	addi	vReg_272,vReg_271,4
	add		vReg_273,vReg_272,vReg_270
	lw		vReg_274,0(vReg_265)
	add		vReg_275,vReg_272,vReg_274
	li		imm_277,4
	rem		vReg_276,i_232,imm_277
	li		imm_279,3
	sub		vReg_278,imm_279,vReg_276
	slli	vReg_280,vReg_278,3
	li		imm_282,128
	sll		vReg_281,imm_282,vReg_280
	lw		vReg_283,0(vReg_275)
	or		vReg_284,vReg_283,vReg_281
	sw		vReg_284,0(vReg_273)
	lw		vReg_285,0(vReg_178)
	addi	vReg_286,vReg_285,64
	sw		vReg_179,0(vReg_286)
	lw		vReg_287,0(vReg_178)
	addi	vReg_288,vReg_287,60
	sw		vReg_181,0(vReg_288)
	mv		h3_289,h3_65
	mv		h4_290,h4_57
	mv		h1_291,h1_61
	mv		i_292,i_59
	mv		h0_293,h0_49
	mv		h2_294,h2_63
	j		_init__fake_crackSHA1_fake_sha1__for_cond_3

_init__fake_crackSHA1_fake_sha1__for_cond_3:
	blt		i_292,vReg_174,_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_2
	j		_init__fake_crackSHA1_fake_sha1__for_merge_3

_init__fake_crackSHA1_fake_sha1__for_merge_3:
	sw		h0_293,0(vReg_69)
	sw		h1_291,0(vReg_70)
	sw		h2_294,0(vReg_71)
	sw		h3_289,0(vReg_72)
	sw		h4_290,0(vReg_73)
	mv		returnVal_186,returnVal_74
	j		_init__fake_crackSHA1_split_block

_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_2:
	slli	vReg_295,i_292,2
	addi	vReg_296,vReg_295,4
	add		vReg_297,vReg_296,vReg_14
	mv		j_298,j_licm_phi_120
	j		_init__fake_crackSHA1_fake_sha1__for_cond_4

_init__fake_crackSHA1_fake_sha1__for_cond_4:
	li		imm_299,80
	blt		j_298,imm_299,_init__fake_crackSHA1_fake_sha1__for_body_3
	j		_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_3

_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_3:
	mv		d_licm_phi_300,h3_289
	mv		a_licm_phi_301,h0_293
	mv		c_licm_phi_302,h2_294
	mv		b_licm_phi_303,h1_291
	mv		e_licm_phi_304,h4_290
	mv		d_305,d_licm_phi_300
	mv		a_306,a_licm_phi_301
	mv		c_307,c_licm_phi_302
	mv		j_308,j_licm_phi_122
	mv		b_309,b_licm_phi_303
	mv		e_310,e_licm_phi_304
	j		_init__fake_crackSHA1_fake_sha1__for_cond_5

_init__fake_crackSHA1_fake_sha1__for_cond_5:
	li		imm_311,80
	blt		j_308,imm_311,_init__fake_crackSHA1_fake_sha1__for_body_2
	j		_init__fake_crackSHA1_fake_sha1_split_block

_init__fake_crackSHA1_fake_sha1_split_block:
	li		imm_313,65535
	and		vReg_312,h0_293,imm_313
	li		imm_315,65535
	and		vReg_314,a_306,imm_315
	add		vReg_316,vReg_312,vReg_314
	srai	vReg_317,h0_293,16
	li		imm_319,65535
	and		vReg_318,vReg_317,imm_319
	srai	vReg_320,a_306,16
	li		imm_322,65535
	and		vReg_321,vReg_320,imm_322
	add		vReg_323,vReg_318,vReg_321
	srai	vReg_324,vReg_316,16
	add		vReg_325,vReg_323,vReg_324
	li		imm_327,65535
	and		vReg_326,vReg_325,imm_327
	slli	vReg_328,vReg_326,16
	li		imm_330,65535
	and		vReg_329,vReg_316,imm_330
	or		vReg_331,vReg_328,vReg_329
	mv		h0_332,vReg_331
	li		imm_334,65535
	and		vReg_333,h1_291,imm_334
	li		imm_336,65535
	and		vReg_335,b_309,imm_336
	add		vReg_337,vReg_333,vReg_335
	srai	vReg_338,h1_291,16
	li		imm_340,65535
	and		vReg_339,vReg_338,imm_340
	srai	vReg_341,b_309,16
	li		imm_343,65535
	and		vReg_342,vReg_341,imm_343
	add		vReg_344,vReg_339,vReg_342
	srai	vReg_345,vReg_337,16
	add		vReg_346,vReg_344,vReg_345
	li		imm_348,65535
	and		vReg_347,vReg_346,imm_348
	slli	vReg_349,vReg_347,16
	li		imm_351,65535
	and		vReg_350,vReg_337,imm_351
	or		vReg_352,vReg_349,vReg_350
	mv		h1_353,vReg_352
	li		imm_355,65535
	and		vReg_354,h2_294,imm_355
	li		imm_357,65535
	and		vReg_356,c_307,imm_357
	add		vReg_358,vReg_354,vReg_356
	srai	vReg_359,h2_294,16
	li		imm_361,65535
	and		vReg_360,vReg_359,imm_361
	srai	vReg_362,c_307,16
	li		imm_364,65535
	and		vReg_363,vReg_362,imm_364
	add		vReg_365,vReg_360,vReg_363
	srai	vReg_366,vReg_358,16
	add		vReg_367,vReg_365,vReg_366
	li		imm_369,65535
	and		vReg_368,vReg_367,imm_369
	slli	vReg_370,vReg_368,16
	li		imm_372,65535
	and		vReg_371,vReg_358,imm_372
	or		vReg_373,vReg_370,vReg_371
	mv		h2_374,vReg_373
	li		imm_376,65535
	and		vReg_375,h3_289,imm_376
	li		imm_378,65535
	and		vReg_377,d_305,imm_378
	add		vReg_379,vReg_375,vReg_377
	srai	vReg_380,h3_289,16
	li		imm_382,65535
	and		vReg_381,vReg_380,imm_382
	srai	vReg_383,d_305,16
	li		imm_385,65535
	and		vReg_384,vReg_383,imm_385
	add		vReg_386,vReg_381,vReg_384
	srai	vReg_387,vReg_379,16
	add		vReg_388,vReg_386,vReg_387
	li		imm_390,65535
	and		vReg_389,vReg_388,imm_390
	slli	vReg_391,vReg_389,16
	li		imm_393,65535
	and		vReg_392,vReg_379,imm_393
	or		vReg_394,vReg_391,vReg_392
	mv		h3_395,vReg_394
	li		imm_397,65535
	and		vReg_396,h4_290,imm_397
	li		imm_399,65535
	and		vReg_398,e_310,imm_399
	add		vReg_400,vReg_396,vReg_398
	srai	vReg_401,h4_290,16
	li		imm_403,65535
	and		vReg_402,vReg_401,imm_403
	srai	vReg_404,e_310,16
	li		imm_406,65535
	and		vReg_405,vReg_404,imm_406
	add		vReg_407,vReg_402,vReg_405
	srai	vReg_408,vReg_400,16
	add		vReg_409,vReg_407,vReg_408
	li		imm_411,65535
	and		vReg_410,vReg_409,imm_411
	slli	vReg_412,vReg_410,16
	li		imm_414,65535
	and		vReg_413,vReg_400,imm_414
	or		vReg_415,vReg_412,vReg_413
	mv		h4_416,vReg_415
	addi	i_417,i_292,1
	mv		h3_289,h3_395
	mv		h4_290,h4_416
	mv		h1_291,h1_353
	mv		i_292,i_417
	mv		h0_293,h0_332
	mv		h2_294,h2_374
	j		_init__fake_crackSHA1_fake_sha1__for_cond_3

_init__fake_crackSHA1_fake_sha1__for_body_2:
	li		imm_418,20
	blt		j_308,imm_418,_init__fake_crackSHA1_fake_sha1__if_then_2
	j		_init__fake_crackSHA1_fake_sha1__if_else

_init__fake_crackSHA1_fake_sha1__if_then_2:
	and		vReg_419,b_309,c_307
	xori	vReg_420,b_309,-1
	and		vReg_421,vReg_420,d_305
	or		vReg_422,vReg_419,vReg_421
	mv		f_423,vReg_422
	mv		f_424,f_423
	mv		k_425,k_41
	j		_init__fake_crackSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_crackSHA1_fake_sha1_fake_rotate_left__if_merge:
	li		imm_427,134217727
	and		vReg_426,a_306,imm_427
	slli	vReg_428,vReg_426,5
	srai	vReg_429,a_306,27
	andi	vReg_430,vReg_429,31
	or		vReg_431,vReg_428,vReg_430
	li		imm_433,65535
	and		vReg_432,vReg_431,imm_433
	li		imm_435,65535
	and		vReg_434,e_310,imm_435
	add		vReg_436,vReg_432,vReg_434
	srai	vReg_437,vReg_431,16
	li		imm_439,65535
	and		vReg_438,vReg_437,imm_439
	srai	vReg_440,e_310,16
	li		imm_442,65535
	and		vReg_441,vReg_440,imm_442
	add		vReg_443,vReg_438,vReg_441
	srai	vReg_444,vReg_436,16
	add		vReg_445,vReg_443,vReg_444
	li		imm_447,65535
	and		vReg_446,vReg_445,imm_447
	slli	vReg_448,vReg_446,16
	li		imm_450,65535
	and		vReg_449,vReg_436,imm_450
	or		vReg_451,vReg_448,vReg_449
	li		imm_453,65535
	and		vReg_452,f_424,imm_453
	li		imm_455,65535
	and		vReg_454,k_425,imm_455
	add		vReg_456,vReg_452,vReg_454
	srai	vReg_457,f_424,16
	li		imm_459,65535
	and		vReg_458,vReg_457,imm_459
	srai	vReg_460,k_425,16
	li		imm_462,65535
	and		vReg_461,vReg_460,imm_462
	add		vReg_463,vReg_458,vReg_461
	srai	vReg_464,vReg_456,16
	add		vReg_465,vReg_463,vReg_464
	li		imm_467,65535
	and		vReg_466,vReg_465,imm_467
	slli	vReg_468,vReg_466,16
	li		imm_470,65535
	and		vReg_469,vReg_456,imm_470
	or		vReg_471,vReg_468,vReg_469
	li		imm_473,65535
	and		vReg_472,vReg_451,imm_473
	li		imm_475,65535
	and		vReg_474,vReg_471,imm_475
	add		vReg_476,vReg_472,vReg_474
	srai	vReg_477,vReg_451,16
	li		imm_479,65535
	and		vReg_478,vReg_477,imm_479
	srai	vReg_480,vReg_471,16
	li		imm_482,65535
	and		vReg_481,vReg_480,imm_482
	add		vReg_483,vReg_478,vReg_481
	srai	vReg_484,vReg_476,16
	add		vReg_485,vReg_483,vReg_484
	li		imm_487,65535
	and		vReg_486,vReg_485,imm_487
	slli	vReg_488,vReg_486,16
	li		imm_490,65535
	and		vReg_489,vReg_476,imm_490
	or		vReg_491,vReg_488,vReg_489
	lw		vReg_492,0(vReg_297)
	slli	vReg_493,j_308,2
	addi	vReg_494,vReg_493,4
	add		vReg_495,vReg_494,vReg_492
	lw		vReg_496,0(vReg_495)
	li		imm_498,65535
	and		vReg_497,vReg_491,imm_498
	li		imm_500,65535
	and		vReg_499,vReg_496,imm_500
	add		vReg_501,vReg_497,vReg_499
	srai	vReg_502,vReg_491,16
	li		imm_504,65535
	and		vReg_503,vReg_502,imm_504
	srai	vReg_505,vReg_496,16
	li		imm_507,65535
	and		vReg_506,vReg_505,imm_507
	add		vReg_508,vReg_503,vReg_506
	srai	vReg_509,vReg_501,16
	add		vReg_510,vReg_508,vReg_509
	li		imm_512,65535
	and		vReg_511,vReg_510,imm_512
	slli	vReg_513,vReg_511,16
	li		imm_515,65535
	and		vReg_514,vReg_501,imm_515
	or		vReg_516,vReg_513,vReg_514
	mv		e_517,d_305
	mv		d_518,c_307
	andi	vReg_519,b_309,3
	slli	vReg_520,vReg_519,30
	srai	vReg_521,b_309,2
	li		imm_523,1073741823
	and		vReg_522,vReg_521,imm_523
	or		vReg_524,vReg_520,vReg_522
	mv		c_525,vReg_524
	mv		b_526,a_306
	mv		a_527,vReg_516
	addi	j_528,j_308,1
	mv		d_305,d_518
	mv		a_306,a_527
	mv		c_307,c_525
	mv		j_308,j_528
	mv		b_309,b_526
	mv		e_310,e_517
	j		_init__fake_crackSHA1_fake_sha1__for_cond_5

_init__fake_crackSHA1_fake_sha1__if_else:
	li		imm_529,40
	blt		j_308,imm_529,_init__fake_crackSHA1_fake_sha1__if_then_4
	j		_init__fake_crackSHA1_fake_sha1__if_else_2

_init__fake_crackSHA1_fake_sha1__if_else_2:
	li		imm_530,60
	blt		j_308,imm_530,_init__fake_crackSHA1_fake_sha1__if_then_3
	j		_init__fake_crackSHA1_fake_sha1__if_else_3

_init__fake_crackSHA1_fake_sha1__if_then_3:
	and		vReg_531,b_309,c_307
	and		vReg_532,b_309,d_305
	or		vReg_533,vReg_531,vReg_532
	and		vReg_534,c_307,d_305
	or		vReg_535,vReg_533,vReg_534
	mv		f_536,vReg_535
	mv		f_537,f_536
	mv		k_538,k_47
	j		_init__fake_crackSHA1_fake_sha1__if_merge

_init__fake_crackSHA1_fake_sha1__if_merge:
	mv		f_539,f_537
	mv		k_540,k_538
	j		_init__fake_crackSHA1_fake_sha1__if_merge_2

_init__fake_crackSHA1_fake_sha1__if_merge_2:
	mv		f_424,f_539
	mv		k_425,k_540
	j		_init__fake_crackSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_crackSHA1_fake_sha1__if_else_3:
	xor		vReg_541,b_309,c_307
	xor		vReg_542,vReg_541,d_305
	mv		f_543,vReg_542
	mv		f_537,f_543
	mv		k_538,k_43
	j		_init__fake_crackSHA1_fake_sha1__if_merge

_init__fake_crackSHA1_fake_sha1__if_then_4:
	xor		vReg_544,b_309,c_307
	xor		vReg_545,vReg_544,d_305
	mv		f_546,vReg_545
	mv		f_539,f_546
	mv		k_540,k_45
	j		_init__fake_crackSHA1_fake_sha1__if_merge_2

_init__fake_crackSHA1_fake_sha1__for_body_3:
	lw		vReg_547,0(vReg_297)
	slli	vReg_548,j_298,2
	addi	vReg_549,vReg_548,4
	add		vReg_550,vReg_549,vReg_547
	addi	vReg_551,j_298,-3
	lw		vReg_552,0(vReg_297)
	slli	vReg_553,vReg_551,2
	addi	vReg_554,vReg_553,4
	add		vReg_555,vReg_554,vReg_552
	addi	vReg_556,j_298,-8
	lw		vReg_557,0(vReg_297)
	slli	vReg_558,vReg_556,2
	addi	vReg_559,vReg_558,4
	add		vReg_560,vReg_559,vReg_557
	lw		vReg_561,0(vReg_555)
	lw		vReg_562,0(vReg_560)
	xor		vReg_563,vReg_561,vReg_562
	addi	vReg_564,j_298,-14
	lw		vReg_565,0(vReg_297)
	slli	vReg_566,vReg_564,2
	addi	vReg_567,vReg_566,4
	add		vReg_568,vReg_567,vReg_565
	lw		vReg_569,0(vReg_568)
	xor		vReg_570,vReg_563,vReg_569
	addi	vReg_571,j_298,-16
	lw		vReg_572,0(vReg_297)
	slli	vReg_573,vReg_571,2
	addi	vReg_574,vReg_573,4
	add		vReg_575,vReg_574,vReg_572
	lw		vReg_576,0(vReg_575)
	xor		vReg_577,vReg_570,vReg_576
	li		imm_579,2147483647
	and		vReg_578,vReg_577,imm_579
	slli	vReg_580,vReg_578,1
	srai	vReg_581,vReg_577,31
	andi	vReg_582,vReg_581,1
	or		vReg_583,vReg_580,vReg_582
	sw		vReg_583,0(vReg_550)
	addi	j_584,j_298,1
	mv		j_298,j_584
	j		_init__fake_crackSHA1_fake_sha1__for_cond_4

_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_4:
	slli	vReg_585,i_231,2
	addi	vReg_586,vReg_585,4
	add		vReg_587,vReg_586,vReg_14
	mv		j_588,j_licm_phi_124
	j		_init__fake_crackSHA1_fake_sha1__for_cond_6

_init__fake_crackSHA1_fake_sha1__for_cond_6:
	li		imm_589,80
	blt		j_588,imm_589,_init__fake_crackSHA1_fake_sha1__for_body_4
	j		_init__fake_crackSHA1_fake_sha1__for_step

_init__fake_crackSHA1_fake_sha1__for_body_4:
	lw		vReg_590,0(vReg_587)
	slli	vReg_591,j_588,2
	addi	vReg_592,vReg_591,4
	add		vReg_593,vReg_592,vReg_590
	li		imm_594,0
	sw		imm_594,0(vReg_593)
	addi	j_595,j_588,1
	mv		j_588,j_595
	j		_init__fake_crackSHA1_fake_sha1__for_cond_6

_init__fake_crackSHA1_fake_sha1__for_step:
	addi	i_596,i_231,1
	mv		i_231,i_596
	j		_init__fake_crackSHA1_fake_sha1__for_cond

_init__fake_crackSHA1__for_merge_3:
	la		str_const_597,__str_const_7
	mv		a0,str_const_597
	call	__builtin_println
	j		_init__fake_main__while_body

_init__fake_crackSHA1__for_body_5:
	li		imm_599,8
	div		vReg_598,i_160,imm_599
	slli	vReg_600,vReg_598,2
	addi	vReg_601,vReg_600,4
	add		vReg_602,vReg_601,vReg_149
	addi	vReg_603,i_160,4
	mv		a0,vReg_147
	mv		a1,i_160
	mv		a2,vReg_603
	call	__builtin_string_substring
	mv		vReg_604,a0
	mv		i_605,i_92
	mv		result_606,result_90
	j		_init__fake_crackSHA1_fake_hex2int__for_cond

_init__fake_crackSHA1_fake_hex2int__for_cond:
	mv		a0,vReg_604
	call	__builtin_string_length
	mv		vReg_607,a0
	blt		i_605,vReg_607,_init__fake_crackSHA1_fake_hex2int__for_body
	j		_init__fake_crackSHA1_fake_hex2int__for_merge

_init__fake_crackSHA1_fake_hex2int__for_body:
	mv		a0,vReg_604
	mv		a1,i_605
	call	__builtin_string_ord
	mv		vReg_608,a0
	li		imm_609,48
	bge		vReg_608,imm_609,_init__fake_crackSHA1_fake_hex2int__lhs_and_then
	j		_init__fake_crackSHA1_fake_hex2int__if_else

_init__fake_crackSHA1_fake_hex2int__lhs_and_then:
	li		imm_610,57
	ble		vReg_608,imm_610,_init__fake_crackSHA1_fake_hex2int__if_then_3
	j		_init__fake_crackSHA1_fake_hex2int__if_else

_init__fake_crackSHA1_fake_hex2int__if_else:
	li		imm_611,65
	bge		vReg_608,imm_611,_init__fake_crackSHA1_fake_hex2int__lhs_and_then_2
	j		_init__fake_crackSHA1_fake_hex2int__if_else_2

_init__fake_crackSHA1_fake_hex2int__lhs_and_then_2:
	li		imm_612,70
	ble		vReg_608,imm_612,_init__fake_crackSHA1_fake_hex2int__if_then
	j		_init__fake_crackSHA1_fake_hex2int__if_else_2

_init__fake_crackSHA1_fake_hex2int__if_then:
	slli	vReg_613,result_606,4
	add		vReg_614,vReg_613,vReg_608
	addi	vReg_615,vReg_614,-65
	addi	vReg_616,vReg_615,10
	mv		result_617,vReg_616
	mv		result_618,result_617
	j		_init__fake_crackSHA1_fake_hex2int__if_merge

_init__fake_crackSHA1_fake_hex2int__if_merge:
	mv		result_619,result_618
	j		_init__fake_crackSHA1_fake_hex2int__for_step

_init__fake_crackSHA1_fake_hex2int__for_step:
	addi	i_620,i_605,1
	mv		i_605,i_620
	mv		result_606,result_619
	j		_init__fake_crackSHA1_fake_hex2int__for_cond

_init__fake_crackSHA1_fake_hex2int__if_else_2:
	li		imm_621,97
	bge		vReg_608,imm_621,_init__fake_crackSHA1_fake_hex2int__lhs_and_then_3
	j		_init__fake_crackSHA1_fake_hex2int__if_else_3

_init__fake_crackSHA1_fake_hex2int__lhs_and_then_3:
	li		imm_622,102
	ble		vReg_608,imm_622,_init__fake_crackSHA1_fake_hex2int__if_then_2
	j		_init__fake_crackSHA1_fake_hex2int__if_else_3

_init__fake_crackSHA1_fake_hex2int__if_then_2:
	slli	vReg_623,result_606,4
	add		vReg_624,vReg_623,vReg_608
	addi	vReg_625,vReg_624,-97
	addi	vReg_626,vReg_625,10
	mv		result_627,vReg_626
	mv		result_618,result_627
	j		_init__fake_crackSHA1_fake_hex2int__if_merge

_init__fake_crackSHA1_fake_hex2int__if_else_3:
	mv		returnVal_628,returnVal_94
	j		_init__fake_crackSHA1_split_block_5

_init__fake_crackSHA1_split_block_5:
	li		imm_630,4
	div		vReg_629,i_160,imm_630
	li		imm_632,2
	rem		vReg_631,vReg_629,imm_632
	li		imm_634,1
	sub		vReg_633,imm_634,vReg_631
	slli	vReg_635,vReg_633,4
	sll		vReg_636,returnVal_628,vReg_635
	lw		vReg_637,0(vReg_602)
	or		vReg_638,vReg_637,vReg_636
	sw		vReg_638,0(vReg_602)
	mv		i_639,vReg_603
	mv		i_160,i_639
	j		_init__fake_crackSHA1__for_cond_2

_init__fake_crackSHA1_fake_hex2int__if_then_3:
	slli	vReg_640,result_606,4
	add		vReg_641,vReg_640,vReg_608
	addi	vReg_642,vReg_641,-48
	mv		result_643,vReg_642
	mv		result_619,result_643
	j		_init__fake_crackSHA1_fake_hex2int__for_step

_init__fake_crackSHA1_fake_hex2int__for_merge:
	mv		returnVal_644,result_606
	mv		returnVal_628,returnVal_644
	j		_init__fake_crackSHA1_split_block_5

_init__fake_crackSHA1__if_then:
	la		str_const_645,__str_const_5
	mv		a0,str_const_645
	call	__builtin_println
	j		_init__fake_main__while_body

_init__fake_main__if_then_2:
	call	__builtin_getString
	mv		vReg_646,a0
	mv		i_647,i_100
	j		_init__fake_main_fake_computeSHA1__for_cond

_init__fake_main_fake_computeSHA1__for_cond:
	mv		a0,vReg_646
	call	__builtin_string_length
	mv		vReg_648,a0
	blt		i_647,vReg_648,_init__fake_main_fake_computeSHA1__for_body
	j		_init__fake_main_fake_computeSHA1__for_merge

_init__fake_main_fake_computeSHA1__for_body:
	slli	vReg_649,i_647,2
	addi	vReg_650,vReg_649,4
	add		vReg_651,vReg_650,vReg_20
	mv		a0,vReg_646
	mv		a1,i_647
	call	__builtin_string_ord
	mv		vReg_652,a0
	sw		vReg_652,0(vReg_651)
	addi	i_653,i_647,1
	mv		i_647,i_653
	j		_init__fake_main_fake_computeSHA1__for_cond

_init__fake_main_fake_computeSHA1__for_merge:
	mv		a0,vReg_646
	call	__builtin_string_length
	mv		vReg_654,a0
	addi	vReg_655,vReg_654,64
	addi	vReg_656,vReg_655,-56
	li		imm_658,64
	div		vReg_657,vReg_656,imm_658
	addi	vReg_659,vReg_657,1
	li		imm_660,100
	bgt		vReg_659,imm_660,_init__fake_main_fake_computeSHA1_fake_sha1__if_then_4
	j		_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header

_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header:
	mv		i_661,i_licm_phi_126
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond:
	blt		i_661,vReg_659,_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_2
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_merge

_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_2:
	slli	vReg_662,i_661,2
	addi	vReg_663,vReg_662,4
	add		vReg_664,vReg_663,vReg_14
	mv		j_665,j_licm_phi_106
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_2

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_2:
	li		imm_666,80
	blt		j_665,imm_666,_init__fake_main_fake_computeSHA1_fake_sha1__for_body
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_step

_init__fake_main_fake_computeSHA1_fake_sha1__for_body:
	lw		vReg_667,0(vReg_664)
	slli	vReg_668,j_665,2
	addi	vReg_669,vReg_668,4
	add		vReg_670,vReg_669,vReg_667
	li		imm_671,0
	sw		imm_671,0(vReg_670)
	addi	j_672,j_665,1
	mv		j_665,j_672
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_2

_init__fake_main_fake_computeSHA1_fake_sha1__for_step:
	addi	i_673,i_661,1
	mv		i_661,i_673
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond

_init__fake_main_fake_computeSHA1_fake_sha1__for_merge:
	mv		i_674,i_96
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_3

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_3:
	blt		i_674,vReg_654,_init__fake_main_fake_computeSHA1_fake_sha1__for_body_4
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_merge_2

_init__fake_main_fake_computeSHA1_fake_sha1__for_merge_2:
	li		imm_676,64
	div		vReg_675,i_674,imm_676
	slli	vReg_677,vReg_675,2
	addi	vReg_678,vReg_677,4
	add		vReg_679,vReg_678,vReg_14
	li		imm_681,64
	rem		vReg_680,i_674,imm_681
	li		imm_683,4
	div		vReg_682,vReg_680,imm_683
	lw		vReg_684,0(vReg_679)
	slli	vReg_685,vReg_682,2
	addi	vReg_686,vReg_685,4
	add		vReg_687,vReg_686,vReg_684
	lw		vReg_688,0(vReg_679)
	add		vReg_689,vReg_686,vReg_688
	li		imm_691,4
	rem		vReg_690,i_674,imm_691
	li		imm_693,3
	sub		vReg_692,imm_693,vReg_690
	slli	vReg_694,vReg_692,3
	li		imm_696,128
	sll		vReg_695,imm_696,vReg_694
	lw		vReg_697,0(vReg_689)
	or		vReg_698,vReg_697,vReg_695
	sw		vReg_698,0(vReg_687)
	addi	vReg_699,vReg_659,-1
	slli	vReg_700,vReg_699,2
	addi	vReg_701,vReg_700,4
	add		vReg_702,vReg_701,vReg_14
	lw		vReg_703,0(vReg_702)
	addi	vReg_704,vReg_703,64
	slli	vReg_705,vReg_654,3
	sw		vReg_705,0(vReg_704)
	lw		vReg_706,0(vReg_702)
	addi	vReg_707,vReg_706,60
	srai	vReg_708,vReg_654,29
	andi	vReg_709,vReg_708,7
	sw		vReg_709,0(vReg_707)
	mv		h1_710,h1_licm_phi_130
	mv		h4_711,h4_licm_phi_132
	mv		i_712,i_licm_phi_134
	mv		h2_713,h2_licm_phi_136
	mv		h3_714,h3_licm_phi_138
	mv		h0_715,h0_licm_phi_140
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_4

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_4:
	blt		i_712,vReg_659,_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_3
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_merge_3

_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_3:
	slli	vReg_716,i_712,2
	addi	vReg_717,vReg_716,4
	add		vReg_718,vReg_717,vReg_14
	mv		j_719,j_licm_phi_114
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_5

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_5:
	li		imm_720,80
	blt		j_719,imm_720,_init__fake_main_fake_computeSHA1_fake_sha1__for_body_2
	j		_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_4

_init__fake_main_fake_computeSHA1_fake_sha1__for_body_2:
	lw		vReg_721,0(vReg_718)
	slli	vReg_722,j_719,2
	addi	vReg_723,vReg_722,4
	add		vReg_724,vReg_723,vReg_721
	addi	vReg_725,j_719,-3
	lw		vReg_726,0(vReg_718)
	slli	vReg_727,vReg_725,2
	addi	vReg_728,vReg_727,4
	add		vReg_729,vReg_728,vReg_726
	addi	vReg_730,j_719,-8
	lw		vReg_731,0(vReg_718)
	slli	vReg_732,vReg_730,2
	addi	vReg_733,vReg_732,4
	add		vReg_734,vReg_733,vReg_731
	lw		vReg_735,0(vReg_729)
	lw		vReg_736,0(vReg_734)
	xor		vReg_737,vReg_735,vReg_736
	addi	vReg_738,j_719,-14
	lw		vReg_739,0(vReg_718)
	slli	vReg_740,vReg_738,2
	addi	vReg_741,vReg_740,4
	add		vReg_742,vReg_741,vReg_739
	lw		vReg_743,0(vReg_742)
	xor		vReg_744,vReg_737,vReg_743
	addi	vReg_745,j_719,-16
	lw		vReg_746,0(vReg_718)
	slli	vReg_747,vReg_745,2
	addi	vReg_748,vReg_747,4
	add		vReg_749,vReg_748,vReg_746
	lw		vReg_750,0(vReg_749)
	xor		vReg_751,vReg_744,vReg_750
	li		imm_753,2147483647
	and		vReg_752,vReg_751,imm_753
	slli	vReg_754,vReg_752,1
	srai	vReg_755,vReg_751,31
	andi	vReg_756,vReg_755,1
	or		vReg_757,vReg_754,vReg_756
	sw		vReg_757,0(vReg_724)
	addi	j_758,j_719,1
	mv		j_719,j_758
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_5

_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_4:
	mv		b_licm_phi_759,h1_710
	mv		d_licm_phi_760,h3_714
	mv		e_licm_phi_761,h4_711
	mv		c_licm_phi_762,h2_713
	mv		a_licm_phi_763,h0_715
	mv		b_764,b_licm_phi_759
	mv		d_765,d_licm_phi_760
	mv		e_766,e_licm_phi_761
	mv		j_767,j_licm_phi_112
	mv		c_768,c_licm_phi_762
	mv		a_769,a_licm_phi_763
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_6

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_6:
	li		imm_770,80
	blt		j_767,imm_770,_init__fake_main_fake_computeSHA1_fake_sha1__for_body_3
	j		_init__fake_main_fake_computeSHA1_fake_sha1_split_block

_init__fake_main_fake_computeSHA1_fake_sha1_split_block:
	li		imm_772,65535
	and		vReg_771,h0_715,imm_772
	li		imm_774,65535
	and		vReg_773,a_769,imm_774
	add		vReg_775,vReg_771,vReg_773
	srai	vReg_776,h0_715,16
	li		imm_778,65535
	and		vReg_777,vReg_776,imm_778
	srai	vReg_779,a_769,16
	li		imm_781,65535
	and		vReg_780,vReg_779,imm_781
	add		vReg_782,vReg_777,vReg_780
	srai	vReg_783,vReg_775,16
	add		vReg_784,vReg_782,vReg_783
	li		imm_786,65535
	and		vReg_785,vReg_784,imm_786
	slli	vReg_787,vReg_785,16
	li		imm_789,65535
	and		vReg_788,vReg_775,imm_789
	or		vReg_790,vReg_787,vReg_788
	mv		h0_791,vReg_790
	li		imm_793,65535
	and		vReg_792,h1_710,imm_793
	li		imm_795,65535
	and		vReg_794,b_764,imm_795
	add		vReg_796,vReg_792,vReg_794
	srai	vReg_797,h1_710,16
	li		imm_799,65535
	and		vReg_798,vReg_797,imm_799
	srai	vReg_800,b_764,16
	li		imm_802,65535
	and		vReg_801,vReg_800,imm_802
	add		vReg_803,vReg_798,vReg_801
	srai	vReg_804,vReg_796,16
	add		vReg_805,vReg_803,vReg_804
	li		imm_807,65535
	and		vReg_806,vReg_805,imm_807
	slli	vReg_808,vReg_806,16
	li		imm_810,65535
	and		vReg_809,vReg_796,imm_810
	or		vReg_811,vReg_808,vReg_809
	mv		h1_812,vReg_811
	li		imm_814,65535
	and		vReg_813,h2_713,imm_814
	li		imm_816,65535
	and		vReg_815,c_768,imm_816
	add		vReg_817,vReg_813,vReg_815
	srai	vReg_818,h2_713,16
	li		imm_820,65535
	and		vReg_819,vReg_818,imm_820
	srai	vReg_821,c_768,16
	li		imm_823,65535
	and		vReg_822,vReg_821,imm_823
	add		vReg_824,vReg_819,vReg_822
	srai	vReg_825,vReg_817,16
	add		vReg_826,vReg_824,vReg_825
	li		imm_828,65535
	and		vReg_827,vReg_826,imm_828
	slli	vReg_829,vReg_827,16
	li		imm_831,65535
	and		vReg_830,vReg_817,imm_831
	or		vReg_832,vReg_829,vReg_830
	mv		h2_833,vReg_832
	li		imm_835,65535
	and		vReg_834,h3_714,imm_835
	li		imm_837,65535
	and		vReg_836,d_765,imm_837
	add		vReg_838,vReg_834,vReg_836
	srai	vReg_839,h3_714,16
	li		imm_841,65535
	and		vReg_840,vReg_839,imm_841
	srai	vReg_842,d_765,16
	li		imm_844,65535
	and		vReg_843,vReg_842,imm_844
	add		vReg_845,vReg_840,vReg_843
	srai	vReg_846,vReg_838,16
	add		vReg_847,vReg_845,vReg_846
	li		imm_849,65535
	and		vReg_848,vReg_847,imm_849
	slli	vReg_850,vReg_848,16
	li		imm_852,65535
	and		vReg_851,vReg_838,imm_852
	or		vReg_853,vReg_850,vReg_851
	mv		h3_854,vReg_853
	li		imm_856,65535
	and		vReg_855,h4_711,imm_856
	li		imm_858,65535
	and		vReg_857,e_766,imm_858
	add		vReg_859,vReg_855,vReg_857
	srai	vReg_860,h4_711,16
	li		imm_862,65535
	and		vReg_861,vReg_860,imm_862
	srai	vReg_863,e_766,16
	li		imm_865,65535
	and		vReg_864,vReg_863,imm_865
	add		vReg_866,vReg_861,vReg_864
	srai	vReg_867,vReg_859,16
	add		vReg_868,vReg_866,vReg_867
	li		imm_870,65535
	and		vReg_869,vReg_868,imm_870
	slli	vReg_871,vReg_869,16
	li		imm_873,65535
	and		vReg_872,vReg_859,imm_873
	or		vReg_874,vReg_871,vReg_872
	mv		h4_875,vReg_874
	addi	i_876,i_712,1
	mv		h1_710,h1_812
	mv		h4_711,h4_875
	mv		i_712,i_876
	mv		h2_713,h2_833
	mv		h3_714,h3_854
	mv		h0_715,h0_791
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_4

_init__fake_main_fake_computeSHA1_fake_sha1__for_body_3:
	li		imm_877,20
	blt		j_767,imm_877,_init__fake_main_fake_computeSHA1_fake_sha1__if_then_3
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_else

_init__fake_main_fake_computeSHA1_fake_sha1__if_else:
	li		imm_878,40
	blt		j_767,imm_878,_init__fake_main_fake_computeSHA1_fake_sha1__if_then_2
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_else_2

_init__fake_main_fake_computeSHA1_fake_sha1__if_else_2:
	li		imm_879,60
	blt		j_767,imm_879,_init__fake_main_fake_computeSHA1_fake_sha1__if_then
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_else_3

_init__fake_main_fake_computeSHA1_fake_sha1__if_else_3:
	xor		vReg_880,b_764,c_768
	xor		vReg_881,vReg_880,d_765
	mv		f_882,vReg_881
	mv		f_883,f_882
	mv		k_884,k_83
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_merge

_init__fake_main_fake_computeSHA1_fake_sha1__if_merge:
	mv		f_885,f_883
	mv		k_886,k_884
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_merge_2

_init__fake_main_fake_computeSHA1_fake_sha1__if_merge_2:
	mv		f_887,f_885
	mv		k_888,k_886
	j		_init__fake_main_fake_computeSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_main_fake_computeSHA1_fake_sha1_fake_rotate_left__if_merge:
	li		imm_890,134217727
	and		vReg_889,a_769,imm_890
	slli	vReg_891,vReg_889,5
	srai	vReg_892,a_769,27
	andi	vReg_893,vReg_892,31
	or		vReg_894,vReg_891,vReg_893
	li		imm_896,65535
	and		vReg_895,vReg_894,imm_896
	li		imm_898,65535
	and		vReg_897,e_766,imm_898
	add		vReg_899,vReg_895,vReg_897
	srai	vReg_900,vReg_894,16
	li		imm_902,65535
	and		vReg_901,vReg_900,imm_902
	srai	vReg_903,e_766,16
	li		imm_905,65535
	and		vReg_904,vReg_903,imm_905
	add		vReg_906,vReg_901,vReg_904
	srai	vReg_907,vReg_899,16
	add		vReg_908,vReg_906,vReg_907
	li		imm_910,65535
	and		vReg_909,vReg_908,imm_910
	slli	vReg_911,vReg_909,16
	li		imm_913,65535
	and		vReg_912,vReg_899,imm_913
	or		vReg_914,vReg_911,vReg_912
	li		imm_916,65535
	and		vReg_915,f_887,imm_916
	li		imm_918,65535
	and		vReg_917,k_888,imm_918
	add		vReg_919,vReg_915,vReg_917
	srai	vReg_920,f_887,16
	li		imm_922,65535
	and		vReg_921,vReg_920,imm_922
	srai	vReg_923,k_888,16
	li		imm_925,65535
	and		vReg_924,vReg_923,imm_925
	add		vReg_926,vReg_921,vReg_924
	srai	vReg_927,vReg_919,16
	add		vReg_928,vReg_926,vReg_927
	li		imm_930,65535
	and		vReg_929,vReg_928,imm_930
	slli	vReg_931,vReg_929,16
	li		imm_933,65535
	and		vReg_932,vReg_919,imm_933
	or		vReg_934,vReg_931,vReg_932
	li		imm_936,65535
	and		vReg_935,vReg_914,imm_936
	li		imm_938,65535
	and		vReg_937,vReg_934,imm_938
	add		vReg_939,vReg_935,vReg_937
	srai	vReg_940,vReg_914,16
	li		imm_942,65535
	and		vReg_941,vReg_940,imm_942
	srai	vReg_943,vReg_934,16
	li		imm_945,65535
	and		vReg_944,vReg_943,imm_945
	add		vReg_946,vReg_941,vReg_944
	srai	vReg_947,vReg_939,16
	add		vReg_948,vReg_946,vReg_947
	li		imm_950,65535
	and		vReg_949,vReg_948,imm_950
	slli	vReg_951,vReg_949,16
	li		imm_953,65535
	and		vReg_952,vReg_939,imm_953
	or		vReg_954,vReg_951,vReg_952
	lw		vReg_955,0(vReg_718)
	slli	vReg_956,j_767,2
	addi	vReg_957,vReg_956,4
	add		vReg_958,vReg_957,vReg_955
	lw		vReg_959,0(vReg_958)
	li		imm_961,65535
	and		vReg_960,vReg_954,imm_961
	li		imm_963,65535
	and		vReg_962,vReg_959,imm_963
	add		vReg_964,vReg_960,vReg_962
	srai	vReg_965,vReg_954,16
	li		imm_967,65535
	and		vReg_966,vReg_965,imm_967
	srai	vReg_968,vReg_959,16
	li		imm_970,65535
	and		vReg_969,vReg_968,imm_970
	add		vReg_971,vReg_966,vReg_969
	srai	vReg_972,vReg_964,16
	add		vReg_973,vReg_971,vReg_972
	li		imm_975,65535
	and		vReg_974,vReg_973,imm_975
	slli	vReg_976,vReg_974,16
	li		imm_978,65535
	and		vReg_977,vReg_964,imm_978
	or		vReg_979,vReg_976,vReg_977
	mv		e_980,d_765
	mv		d_981,c_768
	andi	vReg_982,b_764,3
	slli	vReg_983,vReg_982,30
	srai	vReg_984,b_764,2
	li		imm_986,1073741823
	and		vReg_985,vReg_984,imm_986
	or		vReg_987,vReg_983,vReg_985
	mv		c_988,vReg_987
	mv		b_989,a_769
	mv		a_990,vReg_979
	addi	j_991,j_767,1
	mv		b_764,b_989
	mv		d_765,d_981
	mv		e_766,e_980
	mv		j_767,j_991
	mv		c_768,c_988
	mv		a_769,a_990
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_6

_init__fake_main_fake_computeSHA1_fake_sha1__if_then:
	and		vReg_992,b_764,c_768
	and		vReg_993,b_764,d_765
	or		vReg_994,vReg_992,vReg_993
	and		vReg_995,c_768,d_765
	or		vReg_996,vReg_994,vReg_995
	mv		f_997,vReg_996
	mv		f_883,f_997
	mv		k_884,k_81
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_merge

_init__fake_main_fake_computeSHA1_fake_sha1__if_then_2:
	xor		vReg_998,b_764,c_768
	xor		vReg_999,vReg_998,d_765
	mv		f_1000,vReg_999
	mv		f_885,f_1000
	mv		k_886,k_87
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_merge_2

_init__fake_main_fake_computeSHA1_fake_sha1__if_then_3:
	and		vReg_1001,b_764,c_768
	xori	vReg_1002,b_764,-1
	and		vReg_1003,vReg_1002,d_765
	or		vReg_1004,vReg_1001,vReg_1003
	mv		f_1005,vReg_1004
	mv		f_887,f_1005
	mv		k_888,k_85
	j		_init__fake_main_fake_computeSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_main_fake_computeSHA1_fake_sha1__for_merge_3:
	sw		h0_715,0(vReg_69)
	sw		h1_710,0(vReg_70)
	sw		h2_713,0(vReg_71)
	sw		h3_714,0(vReg_72)
	sw		h4_711,0(vReg_73)
	mv		returnVal_1006,returnVal_89
	j		_init___init__fake_main_fake_computeSHA1__for_cond_pre_header

_init___init__fake_main_fake_computeSHA1__for_cond_pre_header:
	mv		i_1007,i_licm_phi_128
	j		_init__fake_main_fake_computeSHA1__for_cond_2

_init__fake_main_fake_computeSHA1__for_cond_2:
	lw		vReg_1008,0(returnVal_1006)
	blt		i_1007,vReg_1008,_init__fake_main_fake_computeSHA1__for_body_2
	j		_init__fake_main_split_block

_init__fake_main_fake_computeSHA1__for_body_2:
	slli	vReg_1009,i_1007,2
	addi	vReg_1010,vReg_1009,4
	add		vReg_1011,vReg_1010,returnVal_1006
	lw		vReg_1012,0(vReg_1011)
	mv		i_1013,i_licm_phi_108
	mv		ret_1014,ret_licm_phi_110
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__for_cond

_init__fake_main_fake_computeSHA1_fake_toStringHex__for_cond:
	bge		i_1013,zero,_init__fake_main_fake_computeSHA1_fake_toStringHex__for_body
	j		_init__fake_main_fake_computeSHA1_split_block

_init__fake_main_fake_computeSHA1_split_block:
	mv		a0,ret_1014
	call	__builtin_print
	addi	i_1015,i_1007,1
	mv		i_1007,i_1015
	j		_init__fake_main_fake_computeSHA1__for_cond_2

_init__fake_main_fake_computeSHA1_fake_toStringHex__for_body:
	sra		vReg_1016,vReg_1012,i_1013
	andi	vReg_1017,vReg_1016,15
	li		imm_1018,10
	blt		vReg_1017,imm_1018,_init__fake_main_fake_computeSHA1_fake_toStringHex__if_then
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__if_else

_init__fake_main_fake_computeSHA1_fake_toStringHex__if_else:
	addi	vReg_1019,vReg_1017,65
	addi	vReg_1020,vReg_1019,-10
	li		imm_1021,32
	bge		vReg_1020,imm_1021,_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__lhs_and_then
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge:
	mv		returnVal_1022,returnVal_77
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block

_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block:
	mv		a0,ret_1014
	mv		a1,returnVal_1022
	call	__builtin_string_add
	mv		vReg_1023,a0
	mv		ret_1024,vReg_1023
	mv		ret_1025,ret_1024
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__for_step

_init__fake_main_fake_computeSHA1_fake_toStringHex__for_step:
	addi	vReg_1026,i_1013,-4
	mv		i_1027,vReg_1026
	mv		i_1013,i_1027
	mv		ret_1014,ret_1025
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__for_cond

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__lhs_and_then:
	li		imm_1028,126
	ble		vReg_1020,imm_1028,_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_then
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_then:
	addi	vReg_1029,vReg_1020,-32
	addi	vReg_1030,vReg_1020,-31
	la		str_const_1031,__str_const_9
	mv		a0,str_const_1031
	mv		a1,vReg_1029
	mv		a2,vReg_1030
	call	__builtin_string_substring
	mv		vReg_1032,a0
	mv		returnVal_1033,vReg_1032
	mv		returnVal_1022,returnVal_1033
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block

_init__fake_main_fake_computeSHA1_fake_toStringHex__if_then:
	addi	vReg_1034,vReg_1017,48
	li		imm_1035,32
	bge		vReg_1034,imm_1035,_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__lhs_and_then_2
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge_2

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__lhs_and_then_2:
	li		imm_1036,126
	ble		vReg_1034,imm_1036,_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_then_2
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge_2

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_then_2:
	addi	vReg_1037,vReg_1034,-32
	addi	vReg_1038,vReg_1034,-31
	la		str_const_1039,__str_const_9
	mv		a0,str_const_1039
	mv		a1,vReg_1037
	mv		a2,vReg_1038
	call	__builtin_string_substring
	mv		vReg_1040,a0
	mv		returnVal_1041,vReg_1040
	mv		returnVal_1042,returnVal_1041
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block_2

_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block_2:
	mv		a0,ret_1014
	mv		a1,returnVal_1042
	call	__builtin_string_add
	mv		vReg_1043,a0
	mv		ret_1044,vReg_1043
	mv		ret_1025,ret_1044
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__for_step

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge_2:
	mv		returnVal_1042,returnVal_79
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block_2

_init__fake_main_split_block:
	la		str_const_1045,__str_const_4
	mv		a0,str_const_1045
	call	__builtin_println
	j		_init__fake_main__while_body

_init__fake_main_fake_computeSHA1_fake_sha1__for_body_4:
	li		imm_1047,64
	div		vReg_1046,i_674,imm_1047
	slli	vReg_1048,vReg_1046,2
	addi	vReg_1049,vReg_1048,4
	add		vReg_1050,vReg_1049,vReg_14
	li		imm_1052,64
	rem		vReg_1051,i_674,imm_1052
	li		imm_1054,4
	div		vReg_1053,vReg_1051,imm_1054
	lw		vReg_1055,0(vReg_1050)
	slli	vReg_1056,vReg_1053,2
	addi	vReg_1057,vReg_1056,4
	add		vReg_1058,vReg_1057,vReg_1055
	lw		vReg_1059,0(vReg_1050)
	add		vReg_1060,vReg_1057,vReg_1059
	slli	vReg_1061,i_674,2
	addi	vReg_1062,vReg_1061,4
	add		vReg_1063,vReg_1062,vReg_20
	li		imm_1065,4
	rem		vReg_1064,i_674,imm_1065
	li		imm_1067,3
	sub		vReg_1066,imm_1067,vReg_1064
	slli	vReg_1068,vReg_1066,3
	lw		vReg_1069,0(vReg_1063)
	sll		vReg_1070,vReg_1069,vReg_1068
	lw		vReg_1071,0(vReg_1060)
	or		vReg_1072,vReg_1071,vReg_1070
	sw		vReg_1072,0(vReg_1058)
	addi	i_1073,i_674,1
	mv		i_674,i_1073
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_3

_init__fake_main_fake_computeSHA1_fake_sha1__if_then_4:
	la		str_const_1074,__str_const_3
	mv		a0,str_const_1074
	call	__builtin_println
	mv		returnVal_1006,returnVal_27
	j		_init___init__fake_main_fake_computeSHA1__for_cond_pre_header

_init__split_block:
	li		imm_1075,0
	mv		a0,imm_1075
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

_init___array_loop_body:
	li		imm_1076,324
	mv		a0,imm_1076
	call	malloc
	mv		vReg_1077,a0
	li		imm_1078,80
	sw		imm_1078,0(vReg_1077)
	sw		vReg_1077,0(vReg_18)
	addi	vReg_1079,vReg_18,4
	mv		vReg_1080,vReg_1079
	mv		vReg_18,vReg_1080
	j		_init___array_loop_cond


