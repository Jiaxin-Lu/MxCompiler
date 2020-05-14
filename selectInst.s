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

	.globl	hex2int
	.type	hex2int, @function
hex2int:
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
	mv		x_13,a0
	li		imm_15,0
	mv		result_14,imm_15
	li		imm_17,0
	mv		i_16,imm_17
	mv		i_18,i_16
	mv		result_19,result_14
	j		hex2int__for_cond

hex2int__for_cond:
	mv		a0,x_13
	call	__builtin_string_length
	mv		vReg_20,a0
	blt		i_18,vReg_20,hex2int__for_body
	j		hex2int__for_merge

hex2int__for_merge:
	mv		returnVal_21,result_19
	mv		returnVal_22,returnVal_21
	j		hex2int_exit

hex2int_exit:
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

hex2int__for_body:
	mv		a0,x_13
	mv		a1,i_18
	call	__builtin_string_ord
	mv		vReg_23,a0
	li		imm_24,48
	bge		vReg_23,imm_24,hex2int__lhs_and_then_3
	j		hex2int__if_else

hex2int__if_else:
	li		imm_25,65
	bge		vReg_23,imm_25,hex2int__lhs_and_then
	j		hex2int__if_else_2

hex2int__lhs_and_then:
	li		imm_26,70
	ble		vReg_23,imm_26,hex2int__if_then
	j		hex2int__if_else_2

hex2int__if_then:
	li		imm_28,16
	mul		vReg_27,result_19,imm_28
	add		vReg_29,vReg_27,vReg_23
	addi	vReg_30,vReg_29,-65
	addi	vReg_31,vReg_30,10
	mv		result_32,vReg_31
	mv		result_33,result_32
	j		hex2int__for_step

hex2int__for_step:
	addi	i_34,i_18,1
	mv		i_18,i_34
	mv		result_19,result_33
	j		hex2int__for_cond

hex2int__if_else_2:
	li		imm_35,97
	bge		vReg_23,imm_35,hex2int__lhs_and_then_2
	j		hex2int__if_else_3

hex2int__lhs_and_then_2:
	li		imm_36,102
	ble		vReg_23,imm_36,hex2int__if_then_2
	j		hex2int__if_else_3

hex2int__if_then_2:
	li		imm_38,16
	mul		vReg_37,result_19,imm_38
	add		vReg_39,vReg_37,vReg_23
	addi	vReg_40,vReg_39,-97
	addi	vReg_41,vReg_40,10
	mv		result_42,vReg_41
	mv		result_33,result_42
	j		hex2int__for_step

hex2int__if_else_3:
	li		imm_44,0
	mv		returnVal_43,imm_44
	mv		returnVal_22,returnVal_43
	j		hex2int_exit

hex2int__lhs_and_then_3:
	li		imm_45,57
	ble		vReg_23,imm_45,hex2int__if_then_3
	j		hex2int__if_else

hex2int__if_then_3:
	li		imm_47,16
	mul		vReg_46,result_19,imm_47
	add		vReg_48,vReg_46,vReg_23
	addi	vReg_49,vReg_48,-48
	mv		result_50,vReg_49
	mv		result_33,result_50
	j		hex2int__for_step


	.globl	int2chr
	.type	int2chr, @function
int2chr:
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
	mv		x_13,a0
	lui		global_tmp_14,0
	lw		asciiTable_15,0(global_tmp_14)
	li		imm_16,32
	bge		x_13,imm_16,int2chr__lhs_and_then
	j		int2chr__if_merge

int2chr__lhs_and_then:
	li		imm_17,126
	ble		x_13,imm_17,int2chr__if_then
	j		int2chr__if_merge

int2chr__if_then:
	addi	vReg_18,x_13,-32
	addi	vReg_19,x_13,-31
	mv		a0,asciiTable_15
	mv		a1,vReg_18
	mv		a2,vReg_19
	call	__builtin_string_substring
	mv		vReg_20,a0
	mv		returnVal_21,vReg_20
	mv		returnVal_22,returnVal_21
	j		int2chr_exit

int2chr_exit:
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

int2chr__if_merge:
	la		str_const_24,__str_const_1
	mv		returnVal_23,str_const_24
	mv		returnVal_22,returnVal_23
	j		int2chr_exit


	.globl	toStringHex
	.type	toStringHex, @function
toStringHex:
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
	mv		x_13,a0
	la		str_const_15,__str_const_2
	mv		ret_14,str_const_15
	li		imm_17,28
	mv		i_16,imm_17
	mv		ret_18,ret_14
	mv		i_19,i_16
	j		toStringHex__for_cond

toStringHex__for_cond:
	li		imm_20,0
	bge		i_19,imm_20,toStringHex__for_body
	j		toStringHex__for_merge

toStringHex__for_merge:
	mv		a0,ret_18
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

toStringHex__for_body:
	sra		vReg_21,x_13,i_19
	andi	vReg_22,vReg_21,15
	li		imm_23,10
	blt		vReg_22,imm_23,toStringHex__if_then
	j		toStringHex__if_else

toStringHex__if_else:
	addi	vReg_24,vReg_22,65
	addi	vReg_25,vReg_24,-10
	mv		a0,vReg_25
	call	int2chr
	mv		vReg_26,a0
	mv		a0,ret_18
	mv		a1,vReg_26
	call	__builtin_string_add
	mv		vReg_27,a0
	mv		ret_28,vReg_27
	mv		ret_29,ret_28
	j		toStringHex__for_step

toStringHex__for_step:
	addi	vReg_30,i_19,-4
	mv		i_31,vReg_30
	mv		ret_18,ret_29
	mv		i_19,i_31
	j		toStringHex__for_cond

toStringHex__if_then:
	addi	vReg_32,vReg_22,48
	mv		a0,vReg_32
	call	int2chr
	mv		vReg_33,a0
	mv		a0,ret_18
	mv		a1,vReg_33
	call	__builtin_string_add
	mv		vReg_34,a0
	mv		ret_35,vReg_34
	mv		ret_29,ret_35
	j		toStringHex__for_step


	.globl	rotate_left
	.type	rotate_left, @function
rotate_left:
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
	mv		x_13,a0
	mv		shift_14,a1
	li		imm_15,1
	beq		shift_14,imm_15,rotate_left__if_then
	j		rotate_left__if_merge

rotate_left__if_then:
	li		imm_17,2147483647
	and		vReg_16,x_13,imm_17
	slli	vReg_18,vReg_16,1
	srai	vReg_19,x_13,31
	andi	vReg_20,vReg_19,1
	or		vReg_21,vReg_18,vReg_20
	mv		returnVal_22,vReg_21
	mv		returnVal_23,returnVal_22
	j		rotate_left_exit

rotate_left_exit:
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

rotate_left__if_merge:
	li		imm_24,31
	beq		shift_14,imm_24,rotate_left__if_then_2
	j		rotate_left__if_merge_2

rotate_left__if_merge_2:
	li		imm_26,32
	sub		vReg_25,imm_26,shift_14
	li		imm_28,1
	sll		vReg_27,imm_28,vReg_25
	addi	vReg_29,vReg_27,-1
	and		vReg_30,x_13,vReg_29
	sll		vReg_31,vReg_30,shift_14
	sra		vReg_32,x_13,vReg_25
	li		imm_34,1
	sll		vReg_33,imm_34,shift_14
	addi	vReg_35,vReg_33,-1
	and		vReg_36,vReg_32,vReg_35
	or		vReg_37,vReg_31,vReg_36
	mv		returnVal_38,vReg_37
	mv		returnVal_23,returnVal_38
	j		rotate_left_exit

rotate_left__if_then_2:
	andi	vReg_39,x_13,1
	slli	vReg_40,vReg_39,31
	srai	vReg_41,x_13,1
	li		imm_43,2147483647
	and		vReg_42,vReg_41,imm_43
	or		vReg_44,vReg_40,vReg_42
	mv		returnVal_45,vReg_44
	mv		returnVal_23,returnVal_45
	j		rotate_left_exit


	.globl	add
	.type	add, @function
add:
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
	mv		x_13,a0
	mv		y_14,a1
	li		imm_16,65535
	and		vReg_15,x_13,imm_16
	li		imm_18,65535
	and		vReg_17,y_14,imm_18
	add		vReg_19,vReg_15,vReg_17
	srai	vReg_20,x_13,16
	li		imm_22,65535
	and		vReg_21,vReg_20,imm_22
	srai	vReg_23,y_14,16
	li		imm_25,65535
	and		vReg_24,vReg_23,imm_25
	add		vReg_26,vReg_21,vReg_24
	srai	vReg_27,vReg_19,16
	add		vReg_28,vReg_26,vReg_27
	li		imm_30,65535
	and		vReg_29,vReg_28,imm_30
	slli	vReg_31,vReg_29,16
	li		imm_33,65535
	and		vReg_32,vReg_19,imm_33
	or		vReg_34,vReg_31,vReg_32
	mv		a0,vReg_34
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


	.globl	lohi
	.type	lohi, @function
lohi:
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
	mv		lo_13,a0
	mv		hi_14,a1
	slli	vReg_15,hi_14,16
	or		vReg_16,lo_13,vReg_15
	mv		a0,vReg_16
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


	.globl	sha1
	.type	sha1, @function
sha1:
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
	mv		input_13,a0
	mv		length_14,a1
	lui		global_tmp_15,0
	lw		chunks_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		MAXCHUNK_18,0(global_tmp_17)
	lui		global_tmp_19,0
	lw		outputBuffer_20,0(global_tmp_19)
	addi	vReg_21,length_14,64
	addi	vReg_22,vReg_21,-56
	li		imm_24,64
	div		vReg_23,vReg_22,imm_24
	addi	vReg_25,vReg_23,1
	bgt		vReg_25,MAXCHUNK_18,sha1__if_then_4
	j		sha1__if_merge

sha1__if_merge:
	li		imm_27,0
	mv		i_26,imm_27
	mv		i_28,i_26
	j		sha1__for_cond

sha1__for_cond:
	blt		i_28,vReg_25,sha1__for_body
	j		sha1__for_merge

sha1__for_body:
	li		imm_30,0
	mv		j_29,imm_30
	mv		j_31,j_29
	j		sha1__for_cond_2

sha1__for_cond_2:
	li		imm_32,80
	blt		j_31,imm_32,sha1__for_body_2
	j		sha1__for_step

sha1__for_step:
	addi	i_33,i_28,1
	mv		i_28,i_33
	j		sha1__for_cond

sha1__for_body_2:
	li		imm_35,4
	mul		vReg_34,i_28,imm_35
	addi	vReg_36,vReg_34,4
	add		vReg_37,vReg_36,chunks_16
	lw		vReg_38,0(vReg_37)
	li		imm_40,4
	mul		vReg_39,j_31,imm_40
	addi	vReg_41,vReg_39,4
	add		vReg_42,vReg_41,vReg_38
	li		imm_43,0
	sw		imm_43,0(vReg_42)
	j		sha1__for_step_2

sha1__for_step_2:
	addi	j_44,j_31,1
	mv		j_31,j_44
	j		sha1__for_cond_2

sha1__for_merge:
	li		imm_46,0
	mv		i_45,imm_46
	mv		i_47,i_45
	j		sha1__for_cond_3

sha1__for_cond_3:
	blt		i_47,length_14,sha1__for_body_3
	j		sha1__for_merge_2

sha1__for_body_3:
	li		imm_49,64
	div		vReg_48,i_47,imm_49
	li		imm_51,4
	mul		vReg_50,vReg_48,imm_51
	addi	vReg_52,vReg_50,4
	add		vReg_53,vReg_52,chunks_16
	li		imm_55,64
	rem		vReg_54,i_47,imm_55
	li		imm_57,4
	div		vReg_56,vReg_54,imm_57
	lw		vReg_58,0(vReg_53)
	li		imm_60,4
	mul		vReg_59,vReg_56,imm_60
	addi	vReg_61,vReg_59,4
	add		vReg_62,vReg_61,vReg_58
	lw		vReg_63,0(vReg_53)
	add		vReg_64,vReg_61,vReg_63
	li		imm_66,4
	mul		vReg_65,i_47,imm_66
	addi	vReg_67,vReg_65,4
	add		vReg_68,vReg_67,input_13
	li		imm_70,4
	rem		vReg_69,i_47,imm_70
	li		imm_72,3
	sub		vReg_71,imm_72,vReg_69
	li		imm_74,8
	mul		vReg_73,vReg_71,imm_74
	lw		vReg_75,0(vReg_68)
	sll		vReg_76,vReg_75,vReg_73
	lw		vReg_77,0(vReg_64)
	or		vReg_78,vReg_77,vReg_76
	sw		vReg_78,0(vReg_62)
	j		sha1__for_step_3

sha1__for_step_3:
	addi	i_79,i_47,1
	mv		i_47,i_79
	j		sha1__for_cond_3

sha1__for_merge_2:
	li		imm_81,64
	div		vReg_80,i_47,imm_81
	li		imm_83,4
	mul		vReg_82,vReg_80,imm_83
	addi	vReg_84,vReg_82,4
	add		vReg_85,vReg_84,chunks_16
	li		imm_87,64
	rem		vReg_86,i_47,imm_87
	li		imm_89,4
	div		vReg_88,vReg_86,imm_89
	lw		vReg_90,0(vReg_85)
	li		imm_92,4
	mul		vReg_91,vReg_88,imm_92
	addi	vReg_93,vReg_91,4
	add		vReg_94,vReg_93,vReg_90
	lw		vReg_95,0(vReg_85)
	add		vReg_96,vReg_93,vReg_95
	li		imm_98,4
	rem		vReg_97,i_47,imm_98
	li		imm_100,3
	sub		vReg_99,imm_100,vReg_97
	li		imm_102,8
	mul		vReg_101,vReg_99,imm_102
	li		imm_104,128
	sll		vReg_103,imm_104,vReg_101
	lw		vReg_105,0(vReg_96)
	or		vReg_106,vReg_105,vReg_103
	sw		vReg_106,0(vReg_94)
	addi	vReg_107,vReg_25,-1
	li		imm_109,4
	mul		vReg_108,vReg_107,imm_109
	addi	vReg_110,vReg_108,4
	add		vReg_111,vReg_110,chunks_16
	lw		vReg_112,0(vReg_111)
	li		imm_114,15
	li		imm_115,4
	mul		vReg_113,imm_114,imm_115
	addi	vReg_116,vReg_113,4
	add		vReg_117,vReg_116,vReg_112
	slli	vReg_118,length_14,3
	sw		vReg_118,0(vReg_117)
	lw		vReg_119,0(vReg_111)
	li		imm_121,14
	li		imm_122,4
	mul		vReg_120,imm_121,imm_122
	addi	vReg_123,vReg_120,4
	add		vReg_124,vReg_123,vReg_119
	srai	vReg_125,length_14,29
	andi	vReg_126,vReg_125,7
	sw		vReg_126,0(vReg_124)
	li		imm_128,1732584193
	mv		h0_127,imm_128
	li		imm_129,43913
	mv		a0,imm_129
	li		imm_130,61389
	mv		a1,imm_130
	call	lohi
	mv		vReg_131,a0
	mv		h1_132,vReg_131
	li		imm_133,56574
	mv		a0,imm_133
	li		imm_134,39098
	mv		a1,imm_134
	call	lohi
	mv		vReg_135,a0
	mv		h2_136,vReg_135
	li		imm_138,271733878
	mv		h3_137,imm_138
	li		imm_139,57840
	mv		a0,imm_139
	li		imm_140,50130
	mv		a1,imm_140
	call	lohi
	mv		vReg_141,a0
	mv		h4_142,vReg_141
	li		imm_144,0
	mv		i_143,imm_144
	mv		h2_145,h2_136
	mv		h3_146,h3_137
	mv		h1_147,h1_132
	mv		h0_148,h0_127
	mv		i_149,i_143
	mv		h4_150,h4_142
	j		sha1__for_cond_4

sha1__for_cond_4:
	blt		i_149,vReg_25,sha1__for_body_4
	j		sha1__for_merge_5

sha1__for_body_4:
	li		imm_152,16
	mv		j_151,imm_152
	mv		j_153,j_151
	j		sha1__for_cond_5

sha1__for_cond_5:
	li		imm_154,80
	blt		j_153,imm_154,sha1__for_body_6
	j		sha1__for_merge_3

sha1__for_merge_3:
	mv		a_155,h0_148
	mv		b_156,h1_147
	mv		c_157,h2_145
	mv		d_158,h3_146
	mv		e_159,h4_150
	li		imm_161,0
	mv		j_160,imm_161
	mv		a_162,a_155
	mv		c_163,c_157
	mv		j_164,j_160
	mv		b_165,b_156
	mv		d_166,d_158
	mv		e_167,e_159
	j		sha1__for_cond_6

sha1__for_cond_6:
	li		imm_168,80
	blt		j_164,imm_168,sha1__for_body_5
	j		sha1__for_merge_4

sha1__for_body_5:
	li		imm_169,20
	blt		j_164,imm_169,sha1__if_then_3
	j		sha1__if_else

sha1__if_else:
	li		imm_170,40
	blt		j_164,imm_170,sha1__if_then
	j		sha1__if_else_2

sha1__if_then:
	xor		vReg_171,b_165,c_163
	xor		vReg_172,vReg_171,d_166
	mv		f_173,vReg_172
	li		imm_175,1859775393
	mv		k_174,imm_175
	mv		f_176,f_173
	mv		k_177,k_174
	j		sha1__if_merge_2

sha1__if_merge_2:
	mv		a0,a_162
	li		imm_178,5
	mv		a1,imm_178
	call	rotate_left
	mv		vReg_179,a0
	mv		a0,vReg_179
	mv		a1,e_167
	call	add
	mv		vReg_180,a0
	mv		a0,f_176
	mv		a1,k_177
	call	add
	mv		vReg_181,a0
	mv		a0,vReg_180
	mv		a1,vReg_181
	call	add
	mv		vReg_182,a0
	li		imm_184,4
	mul		vReg_183,i_149,imm_184
	addi	vReg_185,vReg_183,4
	add		vReg_186,vReg_185,chunks_16
	lw		vReg_187,0(vReg_186)
	li		imm_189,4
	mul		vReg_188,j_164,imm_189
	addi	vReg_190,vReg_188,4
	add		vReg_191,vReg_190,vReg_187
	lw		vReg_192,0(vReg_191)
	mv		a0,vReg_182
	mv		a1,vReg_192
	call	add
	mv		vReg_193,a0
	mv		e_194,d_166
	mv		d_195,c_163
	mv		a0,b_165
	li		imm_196,30
	mv		a1,imm_196
	call	rotate_left
	mv		vReg_197,a0
	mv		c_198,vReg_197
	mv		b_199,a_162
	mv		a_200,vReg_193
	j		sha1__for_step_4

sha1__for_step_4:
	addi	j_201,j_164,1
	mv		a_162,a_200
	mv		c_163,c_198
	mv		j_164,j_201
	mv		b_165,b_199
	mv		d_166,d_195
	mv		e_167,e_194
	j		sha1__for_cond_6

sha1__if_else_2:
	li		imm_202,60
	blt		j_164,imm_202,sha1__if_then_2
	j		sha1__if_else_3

sha1__if_else_3:
	xor		vReg_203,b_165,c_163
	xor		vReg_204,vReg_203,d_166
	mv		f_205,vReg_204
	li		imm_206,49622
	mv		a0,imm_206
	li		imm_207,51810
	mv		a1,imm_207
	call	lohi
	mv		vReg_208,a0
	mv		k_209,vReg_208
	mv		f_176,f_205
	mv		k_177,k_209
	j		sha1__if_merge_2

sha1__if_then_2:
	and		vReg_210,b_165,c_163
	and		vReg_211,b_165,d_166
	or		vReg_212,vReg_210,vReg_211
	and		vReg_213,c_163,d_166
	or		vReg_214,vReg_212,vReg_213
	mv		f_215,vReg_214
	li		imm_216,48348
	mv		a0,imm_216
	li		imm_217,36635
	mv		a1,imm_217
	call	lohi
	mv		vReg_218,a0
	mv		k_219,vReg_218
	mv		f_176,f_215
	mv		k_177,k_219
	j		sha1__if_merge_2

sha1__if_then_3:
	and		vReg_220,b_165,c_163
	xori	vReg_221,b_165,-1
	and		vReg_222,vReg_221,d_166
	or		vReg_223,vReg_220,vReg_222
	mv		f_224,vReg_223
	li		imm_226,1518500249
	mv		k_225,imm_226
	mv		f_176,f_224
	mv		k_177,k_225
	j		sha1__if_merge_2

sha1__for_merge_4:
	mv		a0,h0_148
	mv		a1,a_162
	call	add
	mv		vReg_227,a0
	mv		h0_228,vReg_227
	mv		a0,h1_147
	mv		a1,b_165
	call	add
	mv		vReg_229,a0
	mv		h1_230,vReg_229
	mv		a0,h2_145
	mv		a1,c_163
	call	add
	mv		vReg_231,a0
	mv		h2_232,vReg_231
	mv		a0,h3_146
	mv		a1,d_166
	call	add
	mv		vReg_233,a0
	mv		h3_234,vReg_233
	mv		a0,h4_150
	mv		a1,e_167
	call	add
	mv		vReg_235,a0
	mv		h4_236,vReg_235
	j		sha1__for_step_5

sha1__for_step_5:
	addi	i_237,i_149,1
	mv		h2_145,h2_232
	mv		h3_146,h3_234
	mv		h1_147,h1_230
	mv		h0_148,h0_228
	mv		i_149,i_237
	mv		h4_150,h4_236
	j		sha1__for_cond_4

sha1__for_body_6:
	li		imm_239,4
	mul		vReg_238,i_149,imm_239
	addi	vReg_240,vReg_238,4
	add		vReg_241,vReg_240,chunks_16
	lw		vReg_242,0(vReg_241)
	li		imm_244,4
	mul		vReg_243,j_153,imm_244
	addi	vReg_245,vReg_243,4
	add		vReg_246,vReg_245,vReg_242
	addi	vReg_247,j_153,-3
	lw		vReg_248,0(vReg_241)
	li		imm_250,4
	mul		vReg_249,vReg_247,imm_250
	addi	vReg_251,vReg_249,4
	add		vReg_252,vReg_251,vReg_248
	addi	vReg_253,j_153,-8
	lw		vReg_254,0(vReg_241)
	li		imm_256,4
	mul		vReg_255,vReg_253,imm_256
	addi	vReg_257,vReg_255,4
	add		vReg_258,vReg_257,vReg_254
	lw		vReg_259,0(vReg_252)
	lw		vReg_260,0(vReg_258)
	xor		vReg_261,vReg_259,vReg_260
	addi	vReg_262,j_153,-14
	lw		vReg_263,0(vReg_241)
	li		imm_265,4
	mul		vReg_264,vReg_262,imm_265
	addi	vReg_266,vReg_264,4
	add		vReg_267,vReg_266,vReg_263
	lw		vReg_268,0(vReg_267)
	xor		vReg_269,vReg_261,vReg_268
	addi	vReg_270,j_153,-16
	lw		vReg_271,0(vReg_241)
	li		imm_273,4
	mul		vReg_272,vReg_270,imm_273
	addi	vReg_274,vReg_272,4
	add		vReg_275,vReg_274,vReg_271
	lw		vReg_276,0(vReg_275)
	xor		vReg_277,vReg_269,vReg_276
	mv		a0,vReg_277
	li		imm_278,1
	mv		a1,imm_278
	call	rotate_left
	mv		vReg_279,a0
	sw		vReg_279,0(vReg_246)
	j		sha1__for_step_6

sha1__for_step_6:
	addi	j_280,j_153,1
	mv		j_153,j_280
	j		sha1__for_cond_5

sha1__for_merge_5:
	li		imm_282,0
	li		imm_283,4
	mul		vReg_281,imm_282,imm_283
	addi	vReg_284,vReg_281,4
	add		vReg_285,vReg_284,outputBuffer_20
	sw		h0_148,0(vReg_285)
	li		imm_287,1
	li		imm_288,4
	mul		vReg_286,imm_287,imm_288
	addi	vReg_289,vReg_286,4
	add		vReg_290,vReg_289,outputBuffer_20
	sw		h1_147,0(vReg_290)
	li		imm_292,2
	li		imm_293,4
	mul		vReg_291,imm_292,imm_293
	addi	vReg_294,vReg_291,4
	add		vReg_295,vReg_294,outputBuffer_20
	sw		h2_145,0(vReg_295)
	li		imm_297,3
	li		imm_298,4
	mul		vReg_296,imm_297,imm_298
	addi	vReg_299,vReg_296,4
	add		vReg_300,vReg_299,outputBuffer_20
	sw		h3_146,0(vReg_300)
	li		imm_302,4
	li		imm_303,4
	mul		vReg_301,imm_302,imm_303
	addi	vReg_304,vReg_301,4
	add		vReg_305,vReg_304,outputBuffer_20
	sw		h4_150,0(vReg_305)
	mv		returnVal_306,outputBuffer_20
	mv		returnVal_307,returnVal_306
	j		sha1_exit

sha1_exit:
	mv		a0,returnVal_307
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

sha1__if_then_4:
	la		str_const_308,__str_const_3
	mv		a0,str_const_308
	call	__builtin_println
	li		imm_310,0
	mv		returnVal_309,imm_310
	mv		returnVal_307,returnVal_309
	j		sha1_exit


	.globl	computeSHA1
	.type	computeSHA1, @function
computeSHA1:
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
	mv		input_13,a0
	lui		global_tmp_14,0
	lw		inputBuffer_15,0(global_tmp_14)
	li		imm_17,0
	mv		i_16,imm_17
	mv		i_18,i_16
	j		computeSHA1__for_cond

computeSHA1__for_cond:
	mv		a0,input_13
	call	__builtin_string_length
	mv		vReg_19,a0
	blt		i_18,vReg_19,computeSHA1__for_body_2
	j		computeSHA1__for_merge

computeSHA1__for_merge:
	mv		a0,input_13
	call	__builtin_string_length
	mv		vReg_20,a0
	mv		a0,inputBuffer_15
	mv		a1,vReg_20
	call	sha1
	mv		vReg_21,a0
	li		imm_23,0
	mv		i_22,imm_23
	mv		i_24,i_22
	j		computeSHA1__for_cond_2

computeSHA1__for_cond_2:
	lw		vReg_25,0(vReg_21)
	blt		i_24,vReg_25,computeSHA1__for_body
	j		computeSHA1__for_merge_2

computeSHA1__for_body:
	li		imm_27,4
	mul		vReg_26,i_24,imm_27
	addi	vReg_28,vReg_26,4
	add		vReg_29,vReg_28,vReg_21
	lw		vReg_30,0(vReg_29)
	mv		a0,vReg_30
	call	toStringHex
	mv		vReg_31,a0
	mv		a0,vReg_31
	call	__builtin_print
	j		computeSHA1__for_step

computeSHA1__for_step:
	addi	i_32,i_24,1
	mv		i_24,i_32
	j		computeSHA1__for_cond_2

computeSHA1__for_merge_2:
	la		str_const_33,__str_const_4
	mv		a0,str_const_33
	call	__builtin_println
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

computeSHA1__for_body_2:
	li		imm_35,4
	mul		vReg_34,i_18,imm_35
	addi	vReg_36,vReg_34,4
	add		vReg_37,vReg_36,inputBuffer_15
	mv		a0,input_13
	mv		a1,i_18
	call	__builtin_string_ord
	mv		vReg_38,a0
	sw		vReg_38,0(vReg_37)
	j		computeSHA1__for_step_2

computeSHA1__for_step_2:
	addi	i_39,i_18,1
	mv		i_18,i_39
	j		computeSHA1__for_cond


	.globl	nextLetter
	.type	nextLetter, @function
nextLetter:
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
	mv		now_13,a0
	li		imm_14,122
	beq		now_13,imm_14,nextLetter__if_then
	j		nextLetter__if_merge

nextLetter__if_then:
	li		imm_16,1
	sub		vReg_15,zero,imm_16
	mv		returnVal_17,vReg_15
	mv		returnVal_18,returnVal_17
	j		nextLetter_exit

nextLetter_exit:
	mv		a0,returnVal_18
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

nextLetter__if_merge:
	li		imm_19,90
	beq		now_13,imm_19,nextLetter__if_then_2
	j		nextLetter__if_merge_2

nextLetter__if_then_2:
	li		imm_21,97
	mv		returnVal_20,imm_21
	mv		returnVal_18,returnVal_20
	j		nextLetter_exit

nextLetter__if_merge_2:
	li		imm_22,57
	beq		now_13,imm_22,nextLetter__if_then_3
	j		nextLetter__if_merge_3

nextLetter__if_then_3:
	li		imm_24,65
	mv		returnVal_23,imm_24
	mv		returnVal_18,returnVal_23
	j		nextLetter_exit

nextLetter__if_merge_3:
	addi	vReg_25,now_13,1
	mv		returnVal_26,vReg_25
	mv		returnVal_18,returnVal_26
	j		nextLetter_exit


	.globl	nextText
	.type	nextText, @function
nextText:
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
	mv		now_13,a0
	mv		length_14,a1
	addi	vReg_15,length_14,-1
	mv		i_16,vReg_15
	mv		i_17,i_16
	j		nextText__for_cond

nextText__for_cond:
	li		imm_18,0
	bge		i_17,imm_18,nextText__for_body
	j		nextText__for_merge

nextText__for_merge:
	li		imm_20,0
	mv		returnVal_19,imm_20
	mv		returnVal_21,returnVal_19
	j		nextText_exit

nextText_exit:
	mv		a0,returnVal_21
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

nextText__for_body:
	li		imm_23,4
	mul		vReg_22,i_17,imm_23
	addi	vReg_24,vReg_22,4
	add		vReg_25,vReg_24,now_13
	lw		vReg_26,0(vReg_25)
	mv		a0,vReg_26
	call	nextLetter
	mv		vReg_27,a0
	sw		vReg_27,0(vReg_25)
	li		imm_29,1
	sub		vReg_28,zero,imm_29
	lw		vReg_30,0(vReg_25)
	beq		vReg_30,vReg_28,nextText__if_then
	j		nextText__if_else

nextText__if_else:
	li		imm_32,1
	mv		returnVal_31,imm_32
	mv		returnVal_21,returnVal_31
	j		nextText_exit

nextText__if_then:
	li		imm_33,48
	sw		imm_33,0(vReg_25)
	j		nextText__for_step

nextText__for_step:
	addi	i_34,i_17,-1
	mv		i_17,i_34
	j		nextText__for_cond


	.globl	array_equal
	.type	array_equal, @function
array_equal:
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
	mv		a_13,a0
	mv		b_14,a1
	lw		vReg_15,0(a_13)
	lw		vReg_16,0(b_14)
	bne		vReg_15,vReg_16,array_equal__if_then
	j		array_equal__if_merge

array_equal__if_then:
	li		imm_18,0
	mv		returnVal_17,imm_18
	mv		returnVal_19,returnVal_17
	j		array_equal_exit

array_equal_exit:
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

array_equal__if_merge:
	li		imm_21,0
	mv		i_20,imm_21
	mv		i_22,i_20
	j		array_equal__for_cond

array_equal__for_cond:
	lw		vReg_23,0(a_13)
	blt		i_22,vReg_23,array_equal__for_body
	j		array_equal__for_merge

array_equal__for_body:
	li		imm_25,4
	mul		vReg_24,i_22,imm_25
	addi	vReg_26,vReg_24,4
	add		vReg_27,vReg_26,a_13
	add		vReg_28,vReg_26,b_14
	lw		vReg_29,0(vReg_27)
	lw		vReg_30,0(vReg_28)
	bne		vReg_29,vReg_30,array_equal__if_then_2
	j		array_equal__for_step

array_equal__for_step:
	addi	i_31,i_22,1
	mv		i_22,i_31
	j		array_equal__for_cond

array_equal__if_then_2:
	li		imm_33,0
	mv		returnVal_32,imm_33
	mv		returnVal_19,returnVal_32
	j		array_equal_exit

array_equal__for_merge:
	li		imm_35,1
	mv		returnVal_34,imm_35
	mv		returnVal_19,returnVal_34
	j		array_equal_exit


	.globl	crackSHA1
	.type	crackSHA1, @function
crackSHA1:
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
	mv		input_13,a0
	lui		global_tmp_14,0
	lw		inputBuffer_15,0(global_tmp_14)
	li		imm_16,24
	mv		a0,imm_16
	call	malloc
	mv		vReg_17,a0
	li		imm_18,5
	sw		imm_18,0(vReg_17)
	mv		a0,input_13
	call	__builtin_string_length
	mv		vReg_19,a0
	li		imm_20,40
	bne		vReg_19,imm_20,crackSHA1__if_then_2
	j		crackSHA1__if_merge

crackSHA1__if_merge:
	li		imm_22,0
	mv		i_21,imm_22
	mv		i_23,i_21
	j		crackSHA1__for_cond

crackSHA1__for_cond:
	li		imm_24,5
	blt		i_23,imm_24,crackSHA1__for_body
	j		crackSHA1__for_merge

crackSHA1__for_body:
	li		imm_26,4
	mul		vReg_25,i_23,imm_26
	addi	vReg_27,vReg_25,4
	add		vReg_28,vReg_27,vReg_17
	li		imm_29,0
	sw		imm_29,0(vReg_28)
	j		crackSHA1__for_step

crackSHA1__for_step:
	addi	i_30,i_23,1
	mv		i_23,i_30
	j		crackSHA1__for_cond

crackSHA1__for_merge:
	li		imm_32,0
	mv		i_31,imm_32
	mv		i_33,i_31
	j		crackSHA1__for_cond_2

crackSHA1__for_cond_2:
	li		imm_34,40
	blt		i_33,imm_34,crackSHA1__for_body_2
	j		crackSHA1__for_merge_2

crackSHA1__for_body_2:
	li		imm_36,8
	div		vReg_35,i_33,imm_36
	li		imm_38,4
	mul		vReg_37,vReg_35,imm_38
	addi	vReg_39,vReg_37,4
	add		vReg_40,vReg_39,vReg_17
	addi	vReg_41,i_33,4
	mv		a0,input_13
	mv		a1,i_33
	mv		a2,vReg_41
	call	__builtin_string_substring
	mv		vReg_42,a0
	mv		a0,vReg_42
	call	hex2int
	mv		vReg_43,a0
	li		imm_45,4
	div		vReg_44,i_33,imm_45
	li		imm_47,2
	rem		vReg_46,vReg_44,imm_47
	li		imm_49,1
	sub		vReg_48,imm_49,vReg_46
	li		imm_51,16
	mul		vReg_50,vReg_48,imm_51
	sll		vReg_52,vReg_43,vReg_50
	lw		vReg_53,0(vReg_40)
	or		vReg_54,vReg_53,vReg_52
	sw		vReg_54,0(vReg_40)
	j		crackSHA1__for_step_2

crackSHA1__for_step_2:
	mv		i_55,vReg_41
	mv		i_33,i_55
	j		crackSHA1__for_cond_2

crackSHA1__for_merge_2:
	li		imm_57,1
	mv		digit_56,imm_57
	mv		digit_58,digit_56
	j		crackSHA1__for_cond_3

crackSHA1__for_cond_3:
	li		imm_59,4
	ble		digit_58,imm_59,crackSHA1__for_body_3
	j		crackSHA1__for_merge_4

crackSHA1__for_body_3:
	li		imm_61,0
	mv		i_60,imm_61
	mv		i_62,i_60
	j		crackSHA1__for_cond_4

crackSHA1__for_cond_4:
	blt		i_62,digit_58,crackSHA1__for_body_4
	j		crackSHA1__while_body

crackSHA1__for_body_4:
	li		imm_64,4
	mul		vReg_63,i_62,imm_64
	addi	vReg_65,vReg_63,4
	add		vReg_66,vReg_65,inputBuffer_15
	li		imm_67,48
	sw		imm_67,0(vReg_66)
	j		crackSHA1__for_step_3

crackSHA1__for_step_3:
	addi	i_68,i_62,1
	mv		i_62,i_68
	j		crackSHA1__for_cond_4

crackSHA1__while_body:
	mv		a0,inputBuffer_15
	mv		a1,digit_58
	call	sha1
	mv		vReg_69,a0
	mv		a0,vReg_69
	mv		a1,vReg_17
	call	array_equal
	mv		vReg_70,a0
	bne		vReg_70,zero,crackSHA1__if_then
	j		crackSHA1__if_merge_2

crackSHA1__if_merge_2:
	mv		a0,inputBuffer_15
	mv		a1,digit_58
	call	nextText
	mv		vReg_71,a0
	bne		vReg_71,zero,crackSHA1__while_body
	j		crackSHA1__for_step_4

crackSHA1__for_step_4:
	addi	digit_72,digit_58,1
	mv		digit_58,digit_72
	j		crackSHA1__for_cond_3

crackSHA1__if_then:
	li		imm_74,0
	mv		i_73,imm_74
	mv		i_75,i_73
	j		crackSHA1__for_cond_5

crackSHA1__for_cond_5:
	blt		i_75,digit_58,crackSHA1__for_body_5
	j		crackSHA1__for_merge_3

crackSHA1__for_merge_3:
	la		str_const_76,__str_const_6
	mv		a0,str_const_76
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1_exit:
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

crackSHA1__for_body_5:
	li		imm_78,4
	mul		vReg_77,i_75,imm_78
	addi	vReg_79,vReg_77,4
	add		vReg_80,vReg_79,inputBuffer_15
	lw		vReg_81,0(vReg_80)
	mv		a0,vReg_81
	call	int2chr
	mv		vReg_82,a0
	mv		a0,vReg_82
	call	__builtin_print
	j		crackSHA1__for_step_5

crackSHA1__for_step_5:
	addi	i_83,i_75,1
	mv		i_75,i_83
	j		crackSHA1__for_cond_5

crackSHA1__for_merge_4:
	la		str_const_84,__str_const_7
	mv		a0,str_const_84
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__if_then_2:
	la		str_const_85,__str_const_5
	mv		a0,str_const_85
	call	__builtin_println
	j		crackSHA1_exit


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
	j		main__while_body

main__while_body:
	call	__builtin_getInt
	mv		vReg_13,a0
	li		imm_14,0
	beq		vReg_13,imm_14,main__while_merge
	j		main__if_merge

main__while_merge:
	li		imm_15,0
	mv		a0,imm_15
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
	li		imm_16,1
	beq		vReg_13,imm_16,main__if_then
	j		main__if_else

main__if_then:
	call	__builtin_getString
	mv		vReg_17,a0
	mv		a0,vReg_17
	call	computeSHA1
	j		main__while_body

main__if_else:
	li		imm_18,2
	beq		vReg_13,imm_18,main__if_then_2
	j		main__while_body

main__if_then_2:
	call	__builtin_getString
	mv		vReg_19,a0
	mv		a0,vReg_19
	call	crackSHA1
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
	lui		global_tmp_25,0
	la		str_const_26,__str_const_9
	sw		str_const_26,0(global_tmp_25)
	lui		global_tmp_27,0
	sw		vReg_23,0(global_tmp_27)
	lui		global_tmp_28,0
	li		imm_29,100
	sw		imm_29,0(global_tmp_28)
	lui		global_tmp_30,0
	sw		vReg_14,0(global_tmp_30)
	lui		global_tmp_31,0
	sw		vReg_20,0(global_tmp_31)
	call	_main
	mv		vReg_32,a0
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

_init___array_loop_body:
	li		imm_33,324
	mv		a0,imm_33
	call	malloc
	mv		vReg_34,a0
	li		imm_35,80
	sw		imm_35,0(vReg_34)
	sw		vReg_34,0(vReg_18)
	j		_init___array_loop_step

_init___array_loop_step:
	addi	vReg_36,vReg_18,4
	mv		vReg_37,vReg_36
	mv		vReg_18,vReg_37
	j		_init___array_loop_cond


