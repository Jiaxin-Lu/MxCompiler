	.data

	.globl	__str_const_1
__str_const_1:
	.string	""

	.globl	__str_const_2
__str_const_2:
	.string	""

	.globl	__str_const_3
__str_const_3:
	.string	"nChunk > MAXCHUNK!"

	.globl	__str_const_4
__str_const_4:
	.string	""

	.globl	__str_const_5
__str_const_5:
	.string	"Invalid input"

	.globl	__str_const_6
__str_const_6:
	.string	""

	.globl	__str_const_7
__str_const_7:
	.string	"Not Found!"

	.globl	__str_const_8
__str_const_8:
	.string	newString

	.globl	__str_const_9
__str_const_9:
	.string	" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"

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
	mv		result_14,zero
	mv		i_15,zero
	mv		result_16,result_14
	mv		i_17,i_15
	mv		_fresh_variable__18,result_16
	mv		result_16,result_16
	mv		_fresh_variable__18,i_17
	j		hex2int__for_cond

hex2int__for_cond:
	mv		a0,x_13
	call	__builtin_string_length
	mv		vReg_19,a0
	blt		i_17,vReg_19,hex2int__for_body
	j		hex2int__for_merge

hex2int__for_merge:
	mv		returnVal_20,result_16
	mv		returnVal_21,returnVal_20
	mv		_fresh_variable__22,returnVal_21
	j		hex2int_exit

hex2int_exit:
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

hex2int__for_body:
	mv		a0,x_13
	mv		a1,i_17
	call	__builtin_string_ord
	mv		vReg_23,a0
	li		imm_24,48
	bge		vReg_23,imm_24,hex2int__lhs_and_then_3
	j		hex2int__if_else

hex2int__if_else:
	li		imm_25,65
	bge		vReg_23,imm_25,hex2int__lhs_and_then_2
	j		hex2int__if_else_2

hex2int__if_else_2:
	li		imm_26,97
	bge		vReg_23,imm_26,hex2int__lhs_and_then
	j		hex2int__if_else_3

hex2int__if_else_3:
	mv		returnVal_27,zero
	mv		returnVal_21,returnVal_27
	mv		_fresh_variable__28,returnVal_21
	j		hex2int_exit

hex2int__lhs_and_then:
	li		imm_29,102
	ble		vReg_23,imm_29,hex2int__if_then
	j		hex2int__if_else_3

hex2int__if_then:
	li		imm_31,16
	mul		vReg_30,result_16,imm_31
	add		vReg_32,vReg_30,vReg_23
	addi	vReg_33,vReg_32,-97
	addi	vReg_34,vReg_33,10
	mv		result_35,vReg_34
	mv		result_36,result_35
	mv		_fresh_variable__37,result_36
	j		hex2int__for_step

hex2int__for_step:
	addi	i_38,i_17,1
	mv		result_16,result_36
	mv		i_17,i_38
	mv		_fresh_variable__39,result_16
	mv		result_16,result_16
	mv		_fresh_variable__39,i_17
	j		hex2int__for_cond

hex2int__lhs_and_then_2:
	li		imm_40,70
	ble		vReg_23,imm_40,hex2int__if_then_2
	j		hex2int__if_else_2

hex2int__if_then_2:
	li		imm_42,16
	mul		vReg_41,result_16,imm_42
	add		vReg_43,vReg_41,vReg_23
	addi	vReg_44,vReg_43,-65
	addi	vReg_45,vReg_44,10
	mv		result_46,vReg_45
	mv		result_36,result_46
	mv		_fresh_variable__47,result_36
	j		hex2int__for_step

hex2int__lhs_and_then_3:
	li		imm_48,57
	ble		vReg_23,imm_48,hex2int__if_then_3
	j		hex2int__if_else

hex2int__if_then_3:
	li		imm_50,16
	mul		vReg_49,result_16,imm_50
	add		vReg_51,vReg_49,vReg_23
	addi	vReg_52,vReg_51,-48
	mv		result_53,vReg_52
	mv		result_36,result_53
	mv		_fresh_variable__54,result_36
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
	lw		asciiTable_14,0(asciiTable)
	li		imm_15,32
	bge		x_13,imm_15,int2chr__lhs_and_then
	j		int2chr__if_merge

int2chr__lhs_and_then:
	li		imm_16,126
	ble		x_13,imm_16,int2chr__if_then
	j		int2chr__if_merge

int2chr__if_merge:
	la		str_const_18,__str_const_1
	mv		returnVal_17,str_const_18
	mv		returnVal_19,returnVal_17
	mv		_fresh_variable__20,returnVal_19
	j		int2chr_exit

int2chr_exit:
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

int2chr__if_then:
	addi	vReg_21,x_13,-32
	addi	vReg_22,x_13,-31
	mv		a0,asciiTable_14
	mv		a1,vReg_21
	mv		a2,vReg_22
	call	__builtin_string_substring
	mv		vReg_23,a0
	mv		returnVal_24,vReg_23
	mv		returnVal_19,returnVal_24
	mv		_fresh_variable__25,returnVal_19
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
	mv		i_18,i_16
	mv		ret_19,ret_14
	mv		_fresh_variable__20,i_18
	mv		i_18,i_18
	mv		_fresh_variable__20,ret_19
	j		toStringHex__for_cond

toStringHex__for_cond:
	bge		i_18,zero,toStringHex__for_body
	j		toStringHex__for_merge

toStringHex__for_body:
	sra		vReg_21,x_13,i_18
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
	mv		a0,ret_19
	mv		a1,vReg_26
	call	__builtin_string_add
	mv		vReg_27,a0
	mv		ret_28,vReg_27
	mv		ret_29,ret_28
	mv		_fresh_variable__30,ret_29
	j		toStringHex__for_step

toStringHex__for_step:
	addi	vReg_31,i_18,-4
	mv		i_32,vReg_31
	mv		i_18,i_32
	mv		ret_19,ret_29
	mv		_fresh_variable__33,i_18
	mv		i_18,i_18
	mv		_fresh_variable__33,ret_19
	j		toStringHex__for_cond

toStringHex__if_then:
	addi	vReg_34,vReg_22,48
	mv		a0,vReg_34
	call	int2chr
	mv		vReg_35,a0
	mv		a0,ret_19
	mv		a1,vReg_35
	call	__builtin_string_add
	mv		vReg_36,a0
	mv		ret_37,vReg_36
	mv		ret_29,ret_37
	mv		_fresh_variable__38,ret_29
	j		toStringHex__for_step

toStringHex__for_merge:
	mv		a0,ret_19
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
	mv		_fresh_variable__24,returnVal_23
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
	li		imm_25,31
	beq		shift_14,imm_25,rotate_left__if_then_2
	j		rotate_left__if_merge_2

rotate_left__if_merge_2:
	li		imm_27,32
	sub		vReg_26,imm_27,shift_14
	li		imm_29,1
	sll		vReg_28,imm_29,vReg_26
	addi	vReg_30,vReg_28,-1
	and		vReg_31,x_13,vReg_30
	sll		vReg_32,vReg_31,shift_14
	sra		vReg_33,x_13,vReg_26
	li		imm_35,1
	sll		vReg_34,imm_35,shift_14
	addi	vReg_36,vReg_34,-1
	and		vReg_37,vReg_33,vReg_36
	or		vReg_38,vReg_32,vReg_37
	mv		returnVal_39,vReg_38
	mv		returnVal_23,returnVal_39
	mv		_fresh_variable__40,returnVal_23
	j		rotate_left_exit

rotate_left__if_then_2:
	andi	vReg_41,x_13,1
	slli	vReg_42,vReg_41,31
	srai	vReg_43,x_13,1
	li		imm_45,2147483647
	and		vReg_44,vReg_43,imm_45
	or		vReg_46,vReg_42,vReg_44
	mv		returnVal_47,vReg_46
	mv		returnVal_23,returnVal_47
	mv		_fresh_variable__48,returnVal_23
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
	lw		chunks_15,0(chunks)
	lw		outputBuffer_16,0(outputBuffer)
	lw		MAXCHUNK_17,0(MAXCHUNK)
	addi	vReg_18,length_14,64
	addi	vReg_19,vReg_18,-56
	li		imm_21,64
	div		vReg_20,vReg_19,imm_21
	addi	vReg_22,vReg_20,1
	bgt		vReg_22,MAXCHUNK_17,sha1__if_then
	j		sha1__if_merge

sha1__if_then:
	la		str_const_23,__str_const_3
	mv		a0,str_const_23
	call	__builtin_println
	mv		returnVal_24,zero
	mv		returnVal_25,returnVal_24
	mv		_fresh_variable__26,returnVal_25
	j		sha1_exit

sha1_exit:
	mv		a0,returnVal_25
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

sha1__if_merge:
	mv		i_27,zero
	mv		i_28,i_27
	mv		_fresh_variable__29,i_28
	j		sha1__for_cond

sha1__for_cond:
	blt		i_28,vReg_22,sha1__for_body
	j		sha1__for_merge

sha1__for_body:
	mv		j_30,zero
	mv		j_31,j_30
	mv		_fresh_variable__32,j_31
	j		sha1__for_cond_2

sha1__for_cond_2:
	li		imm_33,80
	blt		j_31,imm_33,sha1__for_body_2
	j		sha1__for_step_2

sha1__for_body_2:
	li		imm_35,4
	mul		vReg_34,i_28,imm_35
	addi	vReg_36,vReg_34,4
	add		vReg_37,vReg_36,chunks_15
	lw		vReg_38,0(vReg_37)
	li		imm_40,4
	mul		vReg_39,j_31,imm_40
	addi	vReg_41,vReg_39,4
	add		vReg_42,vReg_41,vReg_38
	sw		zero,0(vReg_42)
	j		sha1__for_step

sha1__for_step:
	addi	j_43,j_31,1
	mv		j_31,j_43
	mv		_fresh_variable__44,j_31
	j		sha1__for_cond_2

sha1__for_step_2:
	addi	i_45,i_28,1
	mv		i_28,i_45
	mv		_fresh_variable__46,i_28
	j		sha1__for_cond

sha1__for_merge:
	mv		i_47,zero
	mv		i_48,i_47
	mv		_fresh_variable__49,i_48
	j		sha1__for_cond_3

sha1__for_cond_3:
	blt		i_48,length_14,sha1__for_body_3
	j		sha1__for_merge_2

sha1__for_body_3:
	li		imm_51,64
	div		vReg_50,i_48,imm_51
	li		imm_53,4
	mul		vReg_52,vReg_50,imm_53
	addi	vReg_54,vReg_52,4
	add		vReg_55,vReg_54,chunks_15
	li		imm_57,64
	rem		vReg_56,i_48,imm_57
	li		imm_59,4
	div		vReg_58,vReg_56,imm_59
	lw		vReg_60,0(vReg_55)
	li		imm_62,4
	mul		vReg_61,vReg_58,imm_62
	addi	vReg_63,vReg_61,4
	add		vReg_64,vReg_63,vReg_60
	lw		vReg_65,0(vReg_55)
	add		vReg_66,vReg_63,vReg_65
	li		imm_68,4
	mul		vReg_67,i_48,imm_68
	addi	vReg_69,vReg_67,4
	add		vReg_70,vReg_69,input_13
	li		imm_72,4
	rem		vReg_71,i_48,imm_72
	li		imm_74,3
	sub		vReg_73,imm_74,vReg_71
	li		imm_76,8
	mul		vReg_75,vReg_73,imm_76
	lw		vReg_77,0(vReg_70)
	sll		vReg_78,vReg_77,vReg_75
	lw		vReg_79,0(vReg_66)
	or		vReg_80,vReg_79,vReg_78
	sw		vReg_80,0(vReg_64)
	j		sha1__for_step_3

sha1__for_step_3:
	addi	i_81,i_48,1
	mv		i_48,i_81
	mv		_fresh_variable__82,i_48
	j		sha1__for_cond_3

sha1__for_merge_2:
	li		imm_84,64
	div		vReg_83,i_48,imm_84
	li		imm_86,4
	mul		vReg_85,vReg_83,imm_86
	addi	vReg_87,vReg_85,4
	add		vReg_88,vReg_87,chunks_15
	li		imm_90,64
	rem		vReg_89,i_48,imm_90
	li		imm_92,4
	div		vReg_91,vReg_89,imm_92
	lw		vReg_93,0(vReg_88)
	li		imm_95,4
	mul		vReg_94,vReg_91,imm_95
	addi	vReg_96,vReg_94,4
	add		vReg_97,vReg_96,vReg_93
	lw		vReg_98,0(vReg_88)
	add		vReg_99,vReg_96,vReg_98
	li		imm_101,4
	rem		vReg_100,i_48,imm_101
	li		imm_103,3
	sub		vReg_102,imm_103,vReg_100
	li		imm_105,8
	mul		vReg_104,vReg_102,imm_105
	li		imm_107,128
	sll		vReg_106,imm_107,vReg_104
	lw		vReg_108,0(vReg_99)
	or		vReg_109,vReg_108,vReg_106
	sw		vReg_109,0(vReg_97)
	addi	vReg_110,vReg_22,-1
	li		imm_112,4
	mul		vReg_111,vReg_110,imm_112
	addi	vReg_113,vReg_111,4
	add		vReg_114,vReg_113,chunks_15
	lw		vReg_115,0(vReg_114)
	li		imm_117,15
	li		imm_118,4
	mul		vReg_116,imm_117,imm_118
	addi	vReg_119,vReg_116,4
	add		vReg_120,vReg_119,vReg_115
	slli	vReg_121,length_14,3
	sw		vReg_121,0(vReg_120)
	lw		vReg_122,0(vReg_114)
	li		imm_124,14
	li		imm_125,4
	mul		vReg_123,imm_124,imm_125
	addi	vReg_126,vReg_123,4
	add		vReg_127,vReg_126,vReg_122
	srai	vReg_128,length_14,29
	andi	vReg_129,vReg_128,7
	sw		vReg_129,0(vReg_127)
	li		imm_131,1732584193
	mv		h0_130,imm_131
	li		imm_132,43913
	mv		a0,imm_132
	li		imm_133,61389
	mv		a1,imm_133
	call	lohi
	mv		vReg_134,a0
	mv		h1_135,vReg_134
	li		imm_136,56574
	mv		a0,imm_136
	li		imm_137,39098
	mv		a1,imm_137
	call	lohi
	mv		vReg_138,a0
	mv		h2_139,vReg_138
	li		imm_141,271733878
	mv		h3_140,imm_141
	li		imm_142,57840
	mv		a0,imm_142
	li		imm_143,50130
	mv		a1,imm_143
	call	lohi
	mv		vReg_144,a0
	mv		h4_145,vReg_144
	mv		i_146,zero
	mv		i_147,i_146
	mv		h2_148,h2_139
	mv		h3_149,h3_140
	mv		h4_150,h4_145
	mv		h1_151,h1_135
	mv		h0_152,h0_130
	mv		_fresh_variable__153,i_147
	mv		i_147,i_147
	mv		_fresh_variable__153,h2_148
	mv		h2_148,h2_148
	mv		_fresh_variable__153,h3_149
	mv		h3_149,h3_149
	mv		_fresh_variable__153,h4_150
	mv		h4_150,h4_150
	mv		_fresh_variable__153,h1_151
	mv		h1_151,h1_151
	mv		_fresh_variable__153,h0_152
	j		sha1__for_cond_4

sha1__for_cond_4:
	blt		i_147,vReg_22,sha1__for_body_4
	j		sha1__for_merge_3

sha1__for_merge_3:
	li		imm_155,4
	mul		vReg_154,zero,imm_155
	addi	vReg_156,vReg_154,4
	add		vReg_157,vReg_156,outputBuffer_16
	sw		h0_152,0(vReg_157)
	li		imm_159,1
	li		imm_160,4
	mul		vReg_158,imm_159,imm_160
	addi	vReg_161,vReg_158,4
	add		vReg_162,vReg_161,outputBuffer_16
	sw		h1_151,0(vReg_162)
	li		imm_164,2
	li		imm_165,4
	mul		vReg_163,imm_164,imm_165
	addi	vReg_166,vReg_163,4
	add		vReg_167,vReg_166,outputBuffer_16
	sw		h2_148,0(vReg_167)
	li		imm_169,3
	li		imm_170,4
	mul		vReg_168,imm_169,imm_170
	addi	vReg_171,vReg_168,4
	add		vReg_172,vReg_171,outputBuffer_16
	sw		h3_149,0(vReg_172)
	li		imm_174,4
	li		imm_175,4
	mul		vReg_173,imm_174,imm_175
	addi	vReg_176,vReg_173,4
	add		vReg_177,vReg_176,outputBuffer_16
	sw		h4_150,0(vReg_177)
	mv		returnVal_178,outputBuffer_16
	mv		returnVal_25,returnVal_178
	mv		_fresh_variable__179,returnVal_25
	j		sha1_exit

sha1__for_body_4:
	li		imm_181,16
	mv		j_180,imm_181
	mv		j_182,j_180
	mv		_fresh_variable__183,j_182
	j		sha1__for_cond_5

sha1__for_cond_5:
	li		imm_184,80
	blt		j_182,imm_184,sha1__for_body_6
	j		sha1__for_merge_4

sha1__for_merge_4:
	mv		a_185,h0_152
	mv		b_186,h1_151
	mv		c_187,h2_148
	mv		d_188,h3_149
	mv		e_189,h4_150
	mv		j_190,zero
	mv		c_191,c_187
	mv		e_192,e_189
	mv		b_193,b_186
	mv		a_194,a_185
	mv		d_195,d_188
	mv		j_196,j_190
	mv		_fresh_variable__197,c_191
	mv		c_191,c_191
	mv		_fresh_variable__197,e_192
	mv		e_192,e_192
	mv		_fresh_variable__197,b_193
	mv		b_193,b_193
	mv		_fresh_variable__197,a_194
	mv		a_194,a_194
	mv		_fresh_variable__197,d_195
	mv		d_195,d_195
	mv		_fresh_variable__197,j_196
	j		sha1__for_cond_6

sha1__for_cond_6:
	li		imm_198,80
	blt		j_196,imm_198,sha1__for_body_5
	j		sha1__for_merge_5

sha1__for_body_5:
	li		imm_199,20
	blt		j_196,imm_199,sha1__if_then_4
	j		sha1__if_else

sha1__if_else:
	li		imm_200,40
	blt		j_196,imm_200,sha1__if_then_2
	j		sha1__if_else_2

sha1__if_then_2:
	xor		vReg_201,b_193,c_191
	xor		vReg_202,vReg_201,d_195
	mv		f_203,vReg_202
	li		imm_205,1859775393
	mv		k_204,imm_205
	mv		k_206,k_204
	mv		f_207,f_203
	mv		_fresh_variable__208,k_206
	mv		k_206,k_206
	mv		_fresh_variable__208,f_207
	j		sha1__if_merge_2

sha1__if_merge_2:
	mv		a0,a_194
	li		imm_209,5
	mv		a1,imm_209
	call	rotate_left
	mv		vReg_210,a0
	mv		a0,vReg_210
	mv		a1,e_192
	call	add
	mv		vReg_211,a0
	mv		a0,f_207
	mv		a1,k_206
	call	add
	mv		vReg_212,a0
	mv		a0,vReg_211
	mv		a1,vReg_212
	call	add
	mv		vReg_213,a0
	li		imm_215,4
	mul		vReg_214,i_147,imm_215
	addi	vReg_216,vReg_214,4
	add		vReg_217,vReg_216,chunks_15
	lw		vReg_218,0(vReg_217)
	li		imm_220,4
	mul		vReg_219,j_196,imm_220
	addi	vReg_221,vReg_219,4
	add		vReg_222,vReg_221,vReg_218
	lw		vReg_223,0(vReg_222)
	mv		a0,vReg_213
	mv		a1,vReg_223
	call	add
	mv		vReg_224,a0
	mv		e_225,d_195
	mv		d_226,c_191
	mv		a0,b_193
	li		imm_227,30
	mv		a1,imm_227
	call	rotate_left
	mv		vReg_228,a0
	mv		c_229,vReg_228
	mv		b_230,a_194
	mv		a_231,vReg_224
	j		sha1__for_step_4

sha1__for_step_4:
	addi	j_232,j_196,1
	mv		c_191,c_229
	mv		e_192,e_225
	mv		b_193,b_230
	mv		a_194,a_231
	mv		d_195,d_226
	mv		j_196,j_232
	mv		_fresh_variable__233,c_191
	mv		c_191,c_191
	mv		_fresh_variable__233,e_192
	mv		e_192,e_192
	mv		_fresh_variable__233,b_193
	mv		b_193,b_193
	mv		_fresh_variable__233,a_194
	mv		a_194,a_194
	mv		_fresh_variable__233,d_195
	mv		d_195,d_195
	mv		_fresh_variable__233,j_196
	j		sha1__for_cond_6

sha1__if_else_2:
	li		imm_234,60
	blt		j_196,imm_234,sha1__if_then_3
	j		sha1__if_else_3

sha1__if_then_3:
	and		vReg_235,b_193,c_191
	and		vReg_236,b_193,d_195
	or		vReg_237,vReg_235,vReg_236
	and		vReg_238,c_191,d_195
	or		vReg_239,vReg_237,vReg_238
	mv		f_240,vReg_239
	li		imm_241,48348
	mv		a0,imm_241
	li		imm_242,36635
	mv		a1,imm_242
	call	lohi
	mv		vReg_243,a0
	mv		k_244,vReg_243
	mv		k_206,k_244
	mv		f_207,f_240
	mv		_fresh_variable__245,k_206
	mv		k_206,k_206
	mv		_fresh_variable__245,f_207
	j		sha1__if_merge_2

sha1__if_else_3:
	xor		vReg_246,b_193,c_191
	xor		vReg_247,vReg_246,d_195
	mv		f_248,vReg_247
	li		imm_249,49622
	mv		a0,imm_249
	li		imm_250,51810
	mv		a1,imm_250
	call	lohi
	mv		vReg_251,a0
	mv		k_252,vReg_251
	mv		k_206,k_252
	mv		f_207,f_248
	mv		_fresh_variable__253,k_206
	mv		k_206,k_206
	mv		_fresh_variable__253,f_207
	j		sha1__if_merge_2

sha1__if_then_4:
	and		vReg_254,b_193,c_191
	xori	vReg_255,b_193,-1
	and		vReg_256,vReg_255,d_195
	or		vReg_257,vReg_254,vReg_256
	mv		f_258,vReg_257
	li		imm_260,1518500249
	mv		k_259,imm_260
	mv		k_206,k_259
	mv		f_207,f_258
	mv		_fresh_variable__261,k_206
	mv		k_206,k_206
	mv		_fresh_variable__261,f_207
	j		sha1__if_merge_2

sha1__for_merge_5:
	mv		a0,h0_152
	mv		a1,a_194
	call	add
	mv		vReg_262,a0
	mv		h0_263,vReg_262
	mv		a0,h1_151
	mv		a1,b_193
	call	add
	mv		vReg_264,a0
	mv		h1_265,vReg_264
	mv		a0,h2_148
	mv		a1,c_191
	call	add
	mv		vReg_266,a0
	mv		h2_267,vReg_266
	mv		a0,h3_149
	mv		a1,d_195
	call	add
	mv		vReg_268,a0
	mv		h3_269,vReg_268
	mv		a0,h4_150
	mv		a1,e_192
	call	add
	mv		vReg_270,a0
	mv		h4_271,vReg_270
	j		sha1__for_step_5

sha1__for_step_5:
	addi	i_272,i_147,1
	mv		i_147,i_272
	mv		h2_148,h2_267
	mv		h3_149,h3_269
	mv		h4_150,h4_271
	mv		h1_151,h1_265
	mv		h0_152,h0_263
	mv		_fresh_variable__273,i_147
	mv		i_147,i_147
	mv		_fresh_variable__273,h2_148
	mv		h2_148,h2_148
	mv		_fresh_variable__273,h3_149
	mv		h3_149,h3_149
	mv		_fresh_variable__273,h4_150
	mv		h4_150,h4_150
	mv		_fresh_variable__273,h1_151
	mv		h1_151,h1_151
	mv		_fresh_variable__273,h0_152
	j		sha1__for_cond_4

sha1__for_body_6:
	li		imm_275,4
	mul		vReg_274,i_147,imm_275
	addi	vReg_276,vReg_274,4
	add		vReg_277,vReg_276,chunks_15
	lw		vReg_278,0(vReg_277)
	li		imm_280,4
	mul		vReg_279,j_182,imm_280
	addi	vReg_281,vReg_279,4
	add		vReg_282,vReg_281,vReg_278
	addi	vReg_283,j_182,-3
	lw		vReg_284,0(vReg_277)
	li		imm_286,4
	mul		vReg_285,vReg_283,imm_286
	addi	vReg_287,vReg_285,4
	add		vReg_288,vReg_287,vReg_284
	addi	vReg_289,j_182,-8
	lw		vReg_290,0(vReg_277)
	li		imm_292,4
	mul		vReg_291,vReg_289,imm_292
	addi	vReg_293,vReg_291,4
	add		vReg_294,vReg_293,vReg_290
	lw		vReg_295,0(vReg_288)
	lw		vReg_296,0(vReg_294)
	xor		vReg_297,vReg_295,vReg_296
	addi	vReg_298,j_182,-14
	lw		vReg_299,0(vReg_277)
	li		imm_301,4
	mul		vReg_300,vReg_298,imm_301
	addi	vReg_302,vReg_300,4
	add		vReg_303,vReg_302,vReg_299
	lw		vReg_304,0(vReg_303)
	xor		vReg_305,vReg_297,vReg_304
	addi	vReg_306,j_182,-16
	lw		vReg_307,0(vReg_277)
	li		imm_309,4
	mul		vReg_308,vReg_306,imm_309
	addi	vReg_310,vReg_308,4
	add		vReg_311,vReg_310,vReg_307
	lw		vReg_312,0(vReg_311)
	xor		vReg_313,vReg_305,vReg_312
	mv		a0,vReg_313
	li		imm_314,1
	mv		a1,imm_314
	call	rotate_left
	mv		vReg_315,a0
	sw		vReg_315,0(vReg_282)
	j		sha1__for_step_6

sha1__for_step_6:
	addi	j_316,j_182,1
	mv		j_182,j_316
	mv		_fresh_variable__317,j_182
	j		sha1__for_cond_5


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
	lw		inputBuffer_14,0(inputBuffer)
	mv		i_15,zero
	mv		i_16,i_15
	mv		_fresh_variable__17,i_16
	j		computeSHA1__for_cond

computeSHA1__for_cond:
	mv		a0,input_13
	call	__builtin_string_length
	mv		vReg_18,a0
	blt		i_16,vReg_18,computeSHA1__for_body
	j		computeSHA1__for_merge

computeSHA1__for_body:
	li		imm_20,4
	mul		vReg_19,i_16,imm_20
	addi	vReg_21,vReg_19,4
	add		vReg_22,vReg_21,inputBuffer_14
	mv		a0,input_13
	mv		a1,i_16
	call	__builtin_string_ord
	mv		vReg_23,a0
	sw		vReg_23,0(vReg_22)
	j		computeSHA1__for_step

computeSHA1__for_step:
	addi	i_24,i_16,1
	mv		i_16,i_24
	mv		_fresh_variable__25,i_16
	j		computeSHA1__for_cond

computeSHA1__for_merge:
	mv		a0,input_13
	call	__builtin_string_length
	mv		vReg_26,a0
	mv		a0,inputBuffer_14
	mv		a1,vReg_26
	call	sha1
	mv		vReg_27,a0
	mv		i_28,zero
	mv		i_29,i_28
	mv		_fresh_variable__30,i_29
	j		computeSHA1__for_cond_2

computeSHA1__for_cond_2:
	lw		vReg_31,0(vReg_27)
	blt		i_29,vReg_31,computeSHA1__for_body_2
	j		computeSHA1__for_merge_2

computeSHA1__for_body_2:
	li		imm_33,4
	mul		vReg_32,i_29,imm_33
	addi	vReg_34,vReg_32,4
	add		vReg_35,vReg_34,vReg_27
	lw		vReg_36,0(vReg_35)
	mv		a0,vReg_36
	call	toStringHex
	mv		vReg_37,a0
	mv		a0,vReg_37
	call	__builtin_print
	j		computeSHA1__for_step_2

computeSHA1__for_step_2:
	addi	i_38,i_29,1
	mv		i_29,i_38
	mv		_fresh_variable__39,i_29
	j		computeSHA1__for_cond_2

computeSHA1__for_merge_2:
	la		str_const_40,__str_const_4
	mv		a0,str_const_40
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
	mv		_fresh_variable__19,returnVal_18
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
	li		imm_20,90
	beq		now_13,imm_20,nextLetter__if_then_2
	j		nextLetter__if_merge_2

nextLetter__if_then_2:
	li		imm_22,97
	mv		returnVal_21,imm_22
	mv		returnVal_18,returnVal_21
	mv		_fresh_variable__23,returnVal_18
	j		nextLetter_exit

nextLetter__if_merge_2:
	li		imm_24,57
	beq		now_13,imm_24,nextLetter__if_then_3
	j		nextLetter__if_merge_3

nextLetter__if_then_3:
	li		imm_26,65
	mv		returnVal_25,imm_26
	mv		returnVal_18,returnVal_25
	mv		_fresh_variable__27,returnVal_18
	j		nextLetter_exit

nextLetter__if_merge_3:
	addi	vReg_28,now_13,1
	mv		returnVal_29,vReg_28
	mv		returnVal_18,returnVal_29
	mv		_fresh_variable__30,returnVal_18
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
	mv		_fresh_variable__18,i_17
	j		nextText__for_cond

nextText__for_cond:
	bge		i_17,zero,nextText__for_body
	j		nextText__for_merge

nextText__for_body:
	li		imm_20,4
	mul		vReg_19,i_17,imm_20
	addi	vReg_21,vReg_19,4
	add		vReg_22,vReg_21,now_13
	lw		vReg_23,0(vReg_22)
	mv		a0,vReg_23
	call	nextLetter
	mv		vReg_24,a0
	sw		vReg_24,0(vReg_22)
	li		imm_26,1
	sub		vReg_25,zero,imm_26
	lw		vReg_27,0(vReg_22)
	beq		vReg_27,vReg_25,nextText__if_then
	j		nextText__if_else

nextText__if_else:
	addi	imm_29,zero,1
	mv		returnVal_28,imm_29
	mv		returnVal_30,returnVal_28
	mv		_fresh_variable__31,returnVal_30
	j		nextText_exit

nextText_exit:
	mv		a0,returnVal_30
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

nextText__if_then:
	li		imm_32,48
	sw		imm_32,0(vReg_22)
	j		nextText__for_step

nextText__for_step:
	addi	i_33,i_17,-1
	mv		i_17,i_33
	mv		_fresh_variable__34,i_17
	j		nextText__for_cond

nextText__for_merge:
	mv		returnVal_35,zero
	mv		returnVal_30,returnVal_35
	mv		_fresh_variable__36,returnVal_30
	j		nextText_exit


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
	mv		returnVal_17,zero
	mv		returnVal_18,returnVal_17
	mv		_fresh_variable__19,returnVal_18
	j		array_equal_exit

array_equal_exit:
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

array_equal__if_merge:
	mv		i_20,zero
	mv		i_21,i_20
	mv		_fresh_variable__22,i_21
	j		array_equal__for_cond

array_equal__for_cond:
	lw		vReg_23,0(a_13)
	blt		i_21,vReg_23,array_equal__for_body
	j		array_equal__for_merge

array_equal__for_body:
	li		imm_25,4
	mul		vReg_24,i_21,imm_25
	addi	vReg_26,vReg_24,4
	add		vReg_27,vReg_26,a_13
	add		vReg_28,vReg_26,b_14
	lw		vReg_29,0(vReg_27)
	lw		vReg_30,0(vReg_28)
	bne		vReg_29,vReg_30,array_equal__if_then_2
	j		array_equal__for_step

array_equal__for_step:
	addi	i_31,i_21,1
	mv		i_21,i_31
	mv		_fresh_variable__32,i_21
	j		array_equal__for_cond

array_equal__if_then_2:
	mv		returnVal_33,zero
	mv		returnVal_18,returnVal_33
	mv		_fresh_variable__34,returnVal_18
	j		array_equal_exit

array_equal__for_merge:
	addi	imm_36,zero,1
	mv		returnVal_35,imm_36
	mv		returnVal_18,returnVal_35
	mv		_fresh_variable__37,returnVal_18
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
	lw		inputBuffer_14,0(inputBuffer)
	li		imm_15,24
	mv		a0,imm_15
	call	malloc
	mv		vReg_16,a0
	li		imm_17,5
	sw		imm_17,0(vReg_16)
	mv		a0,input_13
	call	__builtin_string_length
	mv		vReg_18,a0
	li		imm_19,40
	bne		vReg_18,imm_19,crackSHA1__if_then
	j		crackSHA1__if_merge

crackSHA1__if_then:
	la		str_const_20,__str_const_5
	mv		a0,str_const_20
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

crackSHA1__if_merge:
	mv		i_21,zero
	mv		i_22,i_21
	mv		_fresh_variable__23,i_22
	j		crackSHA1__for_cond

crackSHA1__for_cond:
	li		imm_24,5
	blt		i_22,imm_24,crackSHA1__for_body_5
	j		crackSHA1__for_merge

crackSHA1__for_merge:
	mv		i_25,zero
	mv		i_26,i_25
	mv		_fresh_variable__27,i_26
	j		crackSHA1__for_cond_2

crackSHA1__for_cond_2:
	li		imm_28,40
	blt		i_26,imm_28,crackSHA1__for_body
	j		crackSHA1__for_merge_2

crackSHA1__for_body:
	li		imm_30,8
	div		vReg_29,i_26,imm_30
	li		imm_32,4
	mul		vReg_31,vReg_29,imm_32
	addi	vReg_33,vReg_31,4
	add		vReg_34,vReg_33,vReg_16
	addi	vReg_35,i_26,4
	mv		a0,input_13
	mv		a1,i_26
	mv		a2,vReg_35
	call	__builtin_string_substring
	mv		vReg_36,a0
	mv		a0,vReg_36
	call	hex2int
	mv		vReg_37,a0
	li		imm_39,4
	div		vReg_38,i_26,imm_39
	li		imm_41,2
	rem		vReg_40,vReg_38,imm_41
	li		imm_43,1
	sub		vReg_42,imm_43,vReg_40
	li		imm_45,16
	mul		vReg_44,vReg_42,imm_45
	sll		vReg_46,vReg_37,vReg_44
	lw		vReg_47,0(vReg_34)
	or		vReg_48,vReg_47,vReg_46
	sw		vReg_48,0(vReg_34)
	j		crackSHA1__for_step

crackSHA1__for_step:
	mv		i_49,vReg_35
	mv		i_26,i_49
	mv		_fresh_variable__50,i_26
	j		crackSHA1__for_cond_2

crackSHA1__for_merge_2:
	li		imm_52,1
	mv		digit_51,imm_52
	mv		digit_53,digit_51
	mv		_fresh_variable__54,digit_53
	j		crackSHA1__for_cond_3

crackSHA1__for_cond_3:
	li		imm_55,4
	ble		digit_53,imm_55,crackSHA1__for_body_2
	j		crackSHA1__for_merge_3

crackSHA1__for_merge_3:
	la		str_const_56,__str_const_7
	mv		a0,str_const_56
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__for_body_2:
	mv		i_57,zero
	mv		i_58,i_57
	mv		_fresh_variable__59,i_58
	j		crackSHA1__for_cond_4

crackSHA1__for_cond_4:
	blt		i_58,digit_53,crackSHA1__for_body_4
	j		crackSHA1__while_body

crackSHA1__while_body:
	mv		a0,inputBuffer_14
	mv		a1,digit_53
	call	sha1
	mv		vReg_60,a0
	mv		a0,vReg_60
	mv		a1,vReg_16
	call	array_equal
	mv		vReg_61,a0
	bne		vReg_61,zero,crackSHA1__if_then_2
	j		crackSHA1__if_merge_2

crackSHA1__if_then_2:
	mv		i_62,zero
	mv		i_63,i_62
	mv		_fresh_variable__64,i_63
	j		crackSHA1__for_cond_5

crackSHA1__for_cond_5:
	blt		i_63,digit_53,crackSHA1__for_body_3
	j		crackSHA1__for_merge_4

crackSHA1__for_merge_4:
	la		str_const_65,__str_const_6
	mv		a0,str_const_65
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__for_body_3:
	li		imm_67,4
	mul		vReg_66,i_63,imm_67
	addi	vReg_68,vReg_66,4
	add		vReg_69,vReg_68,inputBuffer_14
	lw		vReg_70,0(vReg_69)
	mv		a0,vReg_70
	call	int2chr
	mv		vReg_71,a0
	mv		a0,vReg_71
	call	__builtin_print
	j		crackSHA1__for_step_2

crackSHA1__for_step_2:
	addi	i_72,i_63,1
	mv		i_63,i_72
	mv		_fresh_variable__73,i_63
	j		crackSHA1__for_cond_5

crackSHA1__if_merge_2:
	mv		a0,inputBuffer_14
	mv		a1,digit_53
	call	nextText
	mv		vReg_74,a0
	bne		vReg_74,zero,crackSHA1__while_body
	j		crackSHA1__for_step_3

crackSHA1__for_step_3:
	addi	digit_75,digit_53,1
	mv		digit_53,digit_75
	mv		_fresh_variable__76,digit_53
	j		crackSHA1__for_cond_3

crackSHA1__for_body_4:
	li		imm_78,4
	mul		vReg_77,i_58,imm_78
	addi	vReg_79,vReg_77,4
	add		vReg_80,vReg_79,inputBuffer_14
	li		imm_81,48
	sw		imm_81,0(vReg_80)
	j		crackSHA1__for_step_4

crackSHA1__for_step_4:
	addi	i_82,i_58,1
	mv		i_58,i_82
	mv		_fresh_variable__83,i_58
	j		crackSHA1__for_cond_4

crackSHA1__for_body_5:
	li		imm_85,4
	mul		vReg_84,i_22,imm_85
	addi	vReg_86,vReg_84,4
	add		vReg_87,vReg_86,vReg_16
	sw		zero,0(vReg_87)
	j		crackSHA1__for_step_5

crackSHA1__for_step_5:
	addi	i_88,i_22,1
	mv		i_22,i_88
	mv		_fresh_variable__89,i_22
	j		crackSHA1__for_cond


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
	beq		vReg_13,zero,main__while_merge
	j		main__if_merge

main__while_merge:
	mv		a0,zero
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
	li		imm_14,1
	beq		vReg_13,imm_14,main__if_then_2
	j		main__if_else

main__if_else:
	li		imm_15,2
	beq		vReg_13,imm_15,main__if_then
	j		main__while_body

main__if_then:
	call	__builtin_getString
	mv		vReg_16,a0
	mv		a0,vReg_16
	call	crackSHA1
	j		main__while_body

main__if_then_2:
	call	__builtin_getString
	mv		vReg_17,a0
	mv		a0,vReg_17
	call	computeSHA1
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
	lw		chunks_13,0(chunks)
	lw		asciiTable_14,0(asciiTable)
	lw		outputBuffer_15,0(outputBuffer)
	lw		inputBuffer_16,0(inputBuffer)
	lw		MAXLENGTH_17,0(MAXLENGTH)
	lw		MAXCHUNK_18,0(MAXCHUNK)
	li		imm_19,404
	mv		a0,imm_19
	call	malloc
	mv		vReg_20,a0
	li		imm_21,100
	sw		imm_21,0(vReg_20)
	addi	vReg_22,vReg_20,4
	addi	vReg_23,vReg_20,404
	mv		vReg_24,vReg_22
	mv		_fresh_variable__25,vReg_24
	j		_init___array_loop_cond

_init___array_loop_cond:
	blt		vReg_24,vReg_23,_init___array_loop_body
	j		_init___array_loop_merge

_init___array_loop_body:
	li		imm_26,324
	mv		a0,imm_26
	call	malloc
	mv		vReg_27,a0
	li		imm_28,80
	sw		imm_28,0(vReg_27)
	sw		vReg_27,0(vReg_24)
	j		_init___array_loop_step

_init___array_loop_step:
	addi	vReg_29,vReg_24,4
	mv		vReg_30,vReg_29
	mv		vReg_24,vReg_30
	mv		_fresh_variable__31,vReg_24
	j		_init___array_loop_cond

_init___array_loop_merge:
	li		imm_32,25284
	mv		a0,imm_32
	call	malloc
	mv		vReg_33,a0
	li		imm_34,6320
	sw		imm_34,0(vReg_33)
	li		imm_35,24
	mv		a0,imm_35
	call	malloc
	mv		vReg_36,a0
	li		imm_37,5
	sw		imm_37,0(vReg_36)
	li		imm_38,100
	sw		imm_38,0(MAXCHUNK)
	sw		vReg_33,0(inputBuffer)
	sw		vReg_36,0(outputBuffer)
	la		str_const_39,__str_const_9
	sw		str_const_39,0(asciiTable)
	sw		vReg_20,0(chunks)
	call	_main
	mv		vReg_40,a0
	mv		a0,vReg_40
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


