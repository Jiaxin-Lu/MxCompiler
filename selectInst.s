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
	mv		result_18,result_14
	mv		i_19,i_16
	mv		_fresh_variable__20,result_18
	mv		result_18,result_18
	mv		_fresh_variable__20,i_19
	j		hex2int__for_cond

hex2int__for_cond:
	mv		a0,x_13
	call	__builtin_string_length
	mv		vReg_21,a0
	blt		i_19,vReg_21,hex2int__for_body
	j		hex2int__for_merge

hex2int__for_merge:
	mv		returnVal_22,result_18
	mv		returnVal_23,returnVal_22
	mv		_fresh_variable__24,returnVal_23
	j		hex2int_exit

hex2int_exit:
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

hex2int__for_body:
	mv		a0,x_13
	mv		a1,i_19
	call	__builtin_string_ord
	mv		vReg_25,a0
	li		imm_26,48
	bge		vReg_25,imm_26,hex2int__lhs_and_then_3
	j		hex2int__if_else

hex2int__if_else:
	li		imm_27,65
	bge		vReg_25,imm_27,hex2int__lhs_and_then_2
	j		hex2int__if_else_2

hex2int__if_else_2:
	li		imm_28,97
	bge		vReg_25,imm_28,hex2int__lhs_and_then
	j		hex2int__if_else_3

hex2int__if_else_3:
	li		imm_30,0
	mv		returnVal_29,imm_30
	mv		returnVal_23,returnVal_29
	mv		_fresh_variable__31,returnVal_23
	j		hex2int_exit

hex2int__lhs_and_then:
	li		imm_32,102
	ble		vReg_25,imm_32,hex2int__if_then
	j		hex2int__if_else_3

hex2int__if_then:
	li		imm_34,16
	mul		vReg_33,result_18,imm_34
	add		vReg_35,vReg_33,vReg_25
	addi	vReg_36,vReg_35,-97
	addi	vReg_37,vReg_36,10
	mv		result_38,vReg_37
	mv		result_39,result_38
	mv		_fresh_variable__40,result_39
	j		hex2int__for_step

hex2int__for_step:
	addi	i_41,i_19,1
	mv		result_18,result_39
	mv		i_19,i_41
	mv		_fresh_variable__42,result_18
	mv		result_18,result_18
	mv		_fresh_variable__42,i_19
	j		hex2int__for_cond

hex2int__lhs_and_then_2:
	li		imm_43,70
	ble		vReg_25,imm_43,hex2int__if_then_2
	j		hex2int__if_else_2

hex2int__if_then_2:
	li		imm_45,16
	mul		vReg_44,result_18,imm_45
	add		vReg_46,vReg_44,vReg_25
	addi	vReg_47,vReg_46,-65
	addi	vReg_48,vReg_47,10
	mv		result_49,vReg_48
	mv		result_39,result_49
	mv		_fresh_variable__50,result_39
	j		hex2int__for_step

hex2int__lhs_and_then_3:
	li		imm_51,57
	ble		vReg_25,imm_51,hex2int__if_then_3
	j		hex2int__if_else

hex2int__if_then_3:
	li		imm_53,16
	mul		vReg_52,result_18,imm_53
	add		vReg_54,vReg_52,vReg_25
	addi	vReg_55,vReg_54,-48
	mv		result_56,vReg_55
	mv		result_39,result_56
	mv		_fresh_variable__57,result_39
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

int2chr__if_merge:
	la		str_const_19,__str_const_1
	mv		returnVal_18,str_const_19
	mv		returnVal_20,returnVal_18
	mv		_fresh_variable__21,returnVal_20
	j		int2chr_exit

int2chr_exit:
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

int2chr__if_then:
	addi	vReg_22,x_13,-32
	addi	vReg_23,x_13,-31
	mv		a0,asciiTable_15
	mv		a1,vReg_22
	mv		a2,vReg_23
	call	__builtin_string_substring
	mv		vReg_24,a0
	mv		returnVal_25,vReg_24
	mv		returnVal_20,returnVal_25
	mv		_fresh_variable__26,returnVal_20
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
	li		imm_21,0
	bge		i_18,imm_21,toStringHex__for_body
	j		toStringHex__for_merge

toStringHex__for_body:
	sra		vReg_22,x_13,i_18
	andi	vReg_23,vReg_22,15
	li		imm_24,10
	blt		vReg_23,imm_24,toStringHex__if_then
	j		toStringHex__if_else

toStringHex__if_else:
	addi	vReg_25,vReg_23,65
	addi	vReg_26,vReg_25,-10
	mv		a0,vReg_26
	call	int2chr
	mv		vReg_27,a0
	mv		a0,ret_19
	mv		a1,vReg_27
	call	__builtin_string_add
	mv		vReg_28,a0
	mv		ret_29,vReg_28
	mv		ret_30,ret_29
	mv		_fresh_variable__31,ret_30
	j		toStringHex__for_step

toStringHex__for_step:
	addi	vReg_32,i_18,-4
	mv		i_33,vReg_32
	mv		i_18,i_33
	mv		ret_19,ret_30
	mv		_fresh_variable__34,i_18
	mv		i_18,i_18
	mv		_fresh_variable__34,ret_19
	j		toStringHex__for_cond

toStringHex__if_then:
	addi	vReg_35,vReg_23,48
	mv		a0,vReg_35
	call	int2chr
	mv		vReg_36,a0
	mv		a0,ret_19
	mv		a1,vReg_36
	call	__builtin_string_add
	mv		vReg_37,a0
	mv		ret_38,vReg_37
	mv		ret_30,ret_38
	mv		_fresh_variable__39,ret_30
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
	lui		global_tmp_15,0
	lw		chunks_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		outputBuffer_18,0(global_tmp_17)
	lui		global_tmp_19,0
	lw		MAXCHUNK_20,0(global_tmp_19)
	addi	vReg_21,length_14,64
	addi	vReg_22,vReg_21,-56
	li		imm_24,64
	div		vReg_23,vReg_22,imm_24
	addi	vReg_25,vReg_23,1
	bgt		vReg_25,MAXCHUNK_20,sha1__if_then
	j		sha1__if_merge

sha1__if_then:
	la		str_const_26,__str_const_3
	mv		a0,str_const_26
	call	__builtin_println
	li		imm_28,0
	mv		returnVal_27,imm_28
	mv		returnVal_29,returnVal_27
	mv		_fresh_variable__30,returnVal_29
	j		sha1_exit

sha1_exit:
	mv		a0,returnVal_29
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
	li		imm_32,0
	mv		i_31,imm_32
	mv		i_33,i_31
	mv		_fresh_variable__34,i_33
	j		sha1__for_cond

sha1__for_cond:
	blt		i_33,vReg_25,sha1__for_body
	j		sha1__for_merge

sha1__for_body:
	li		imm_36,0
	mv		j_35,imm_36
	mv		j_37,j_35
	mv		_fresh_variable__38,j_37
	j		sha1__for_cond_2

sha1__for_cond_2:
	li		imm_39,80
	blt		j_37,imm_39,sha1__for_body_2
	j		sha1__for_step_2

sha1__for_body_2:
	li		imm_41,4
	mul		vReg_40,i_33,imm_41
	addi	vReg_42,vReg_40,4
	add		vReg_43,vReg_42,chunks_16
	lw		vReg_44,0(vReg_43)
	li		imm_46,4
	mul		vReg_45,j_37,imm_46
	addi	vReg_47,vReg_45,4
	add		vReg_48,vReg_47,vReg_44
	li		imm_49,0
	sw		imm_49,0(vReg_48)
	j		sha1__for_step

sha1__for_step:
	addi	j_50,j_37,1
	mv		j_37,j_50
	mv		_fresh_variable__51,j_37
	j		sha1__for_cond_2

sha1__for_step_2:
	addi	i_52,i_33,1
	mv		i_33,i_52
	mv		_fresh_variable__53,i_33
	j		sha1__for_cond

sha1__for_merge:
	li		imm_55,0
	mv		i_54,imm_55
	mv		i_56,i_54
	mv		_fresh_variable__57,i_56
	j		sha1__for_cond_3

sha1__for_cond_3:
	blt		i_56,length_14,sha1__for_body_3
	j		sha1__for_merge_2

sha1__for_body_3:
	li		imm_59,64
	div		vReg_58,i_56,imm_59
	li		imm_61,4
	mul		vReg_60,vReg_58,imm_61
	addi	vReg_62,vReg_60,4
	add		vReg_63,vReg_62,chunks_16
	li		imm_65,64
	rem		vReg_64,i_56,imm_65
	li		imm_67,4
	div		vReg_66,vReg_64,imm_67
	lw		vReg_68,0(vReg_63)
	li		imm_70,4
	mul		vReg_69,vReg_66,imm_70
	addi	vReg_71,vReg_69,4
	add		vReg_72,vReg_71,vReg_68
	lw		vReg_73,0(vReg_63)
	add		vReg_74,vReg_71,vReg_73
	li		imm_76,4
	mul		vReg_75,i_56,imm_76
	addi	vReg_77,vReg_75,4
	add		vReg_78,vReg_77,input_13
	li		imm_80,4
	rem		vReg_79,i_56,imm_80
	li		imm_82,3
	sub		vReg_81,imm_82,vReg_79
	li		imm_84,8
	mul		vReg_83,vReg_81,imm_84
	lw		vReg_85,0(vReg_78)
	sll		vReg_86,vReg_85,vReg_83
	lw		vReg_87,0(vReg_74)
	or		vReg_88,vReg_87,vReg_86
	sw		vReg_88,0(vReg_72)
	j		sha1__for_step_3

sha1__for_step_3:
	addi	i_89,i_56,1
	mv		i_56,i_89
	mv		_fresh_variable__90,i_56
	j		sha1__for_cond_3

sha1__for_merge_2:
	li		imm_92,64
	div		vReg_91,i_56,imm_92
	li		imm_94,4
	mul		vReg_93,vReg_91,imm_94
	addi	vReg_95,vReg_93,4
	add		vReg_96,vReg_95,chunks_16
	li		imm_98,64
	rem		vReg_97,i_56,imm_98
	li		imm_100,4
	div		vReg_99,vReg_97,imm_100
	lw		vReg_101,0(vReg_96)
	li		imm_103,4
	mul		vReg_102,vReg_99,imm_103
	addi	vReg_104,vReg_102,4
	add		vReg_105,vReg_104,vReg_101
	lw		vReg_106,0(vReg_96)
	add		vReg_107,vReg_104,vReg_106
	li		imm_109,4
	rem		vReg_108,i_56,imm_109
	li		imm_111,3
	sub		vReg_110,imm_111,vReg_108
	li		imm_113,8
	mul		vReg_112,vReg_110,imm_113
	li		imm_115,128
	sll		vReg_114,imm_115,vReg_112
	lw		vReg_116,0(vReg_107)
	or		vReg_117,vReg_116,vReg_114
	sw		vReg_117,0(vReg_105)
	addi	vReg_118,vReg_25,-1
	li		imm_120,4
	mul		vReg_119,vReg_118,imm_120
	addi	vReg_121,vReg_119,4
	add		vReg_122,vReg_121,chunks_16
	lw		vReg_123,0(vReg_122)
	li		imm_125,15
	li		imm_126,4
	mul		vReg_124,imm_125,imm_126
	addi	vReg_127,vReg_124,4
	add		vReg_128,vReg_127,vReg_123
	slli	vReg_129,length_14,3
	sw		vReg_129,0(vReg_128)
	lw		vReg_130,0(vReg_122)
	li		imm_132,14
	li		imm_133,4
	mul		vReg_131,imm_132,imm_133
	addi	vReg_134,vReg_131,4
	add		vReg_135,vReg_134,vReg_130
	srai	vReg_136,length_14,29
	andi	vReg_137,vReg_136,7
	sw		vReg_137,0(vReg_135)
	li		imm_139,1732584193
	mv		h0_138,imm_139
	li		imm_140,43913
	mv		a0,imm_140
	li		imm_141,61389
	mv		a1,imm_141
	call	lohi
	mv		vReg_142,a0
	mv		h1_143,vReg_142
	li		imm_144,56574
	mv		a0,imm_144
	li		imm_145,39098
	mv		a1,imm_145
	call	lohi
	mv		vReg_146,a0
	mv		h2_147,vReg_146
	li		imm_149,271733878
	mv		h3_148,imm_149
	li		imm_150,57840
	mv		a0,imm_150
	li		imm_151,50130
	mv		a1,imm_151
	call	lohi
	mv		vReg_152,a0
	mv		h4_153,vReg_152
	li		imm_155,0
	mv		i_154,imm_155
	mv		i_156,i_154
	mv		h2_157,h2_147
	mv		h3_158,h3_148
	mv		h4_159,h4_153
	mv		h1_160,h1_143
	mv		h0_161,h0_138
	mv		_fresh_variable__162,i_156
	mv		i_156,i_156
	mv		_fresh_variable__162,h2_157
	mv		h2_157,h2_157
	mv		_fresh_variable__162,h3_158
	mv		h3_158,h3_158
	mv		_fresh_variable__162,h4_159
	mv		h4_159,h4_159
	mv		_fresh_variable__162,h1_160
	mv		h1_160,h1_160
	mv		_fresh_variable__162,h0_161
	j		sha1__for_cond_4

sha1__for_cond_4:
	blt		i_156,vReg_25,sha1__for_body_4
	j		sha1__for_merge_3

sha1__for_merge_3:
	li		imm_164,0
	li		imm_165,4
	mul		vReg_163,imm_164,imm_165
	addi	vReg_166,vReg_163,4
	add		vReg_167,vReg_166,outputBuffer_18
	sw		h0_161,0(vReg_167)
	li		imm_169,1
	li		imm_170,4
	mul		vReg_168,imm_169,imm_170
	addi	vReg_171,vReg_168,4
	add		vReg_172,vReg_171,outputBuffer_18
	sw		h1_160,0(vReg_172)
	li		imm_174,2
	li		imm_175,4
	mul		vReg_173,imm_174,imm_175
	addi	vReg_176,vReg_173,4
	add		vReg_177,vReg_176,outputBuffer_18
	sw		h2_157,0(vReg_177)
	li		imm_179,3
	li		imm_180,4
	mul		vReg_178,imm_179,imm_180
	addi	vReg_181,vReg_178,4
	add		vReg_182,vReg_181,outputBuffer_18
	sw		h3_158,0(vReg_182)
	li		imm_184,4
	li		imm_185,4
	mul		vReg_183,imm_184,imm_185
	addi	vReg_186,vReg_183,4
	add		vReg_187,vReg_186,outputBuffer_18
	sw		h4_159,0(vReg_187)
	mv		returnVal_188,outputBuffer_18
	mv		returnVal_29,returnVal_188
	mv		_fresh_variable__189,returnVal_29
	j		sha1_exit

sha1__for_body_4:
	li		imm_191,16
	mv		j_190,imm_191
	mv		j_192,j_190
	mv		_fresh_variable__193,j_192
	j		sha1__for_cond_5

sha1__for_cond_5:
	li		imm_194,80
	blt		j_192,imm_194,sha1__for_body_6
	j		sha1__for_merge_4

sha1__for_merge_4:
	mv		a_195,h0_161
	mv		b_196,h1_160
	mv		c_197,h2_157
	mv		d_198,h3_158
	mv		e_199,h4_159
	li		imm_201,0
	mv		j_200,imm_201
	mv		c_202,c_197
	mv		e_203,e_199
	mv		b_204,b_196
	mv		a_205,a_195
	mv		d_206,d_198
	mv		j_207,j_200
	mv		_fresh_variable__208,c_202
	mv		c_202,c_202
	mv		_fresh_variable__208,e_203
	mv		e_203,e_203
	mv		_fresh_variable__208,b_204
	mv		b_204,b_204
	mv		_fresh_variable__208,a_205
	mv		a_205,a_205
	mv		_fresh_variable__208,d_206
	mv		d_206,d_206
	mv		_fresh_variable__208,j_207
	j		sha1__for_cond_6

sha1__for_cond_6:
	li		imm_209,80
	blt		j_207,imm_209,sha1__for_body_5
	j		sha1__for_merge_5

sha1__for_body_5:
	li		imm_210,20
	blt		j_207,imm_210,sha1__if_then_4
	j		sha1__if_else

sha1__if_else:
	li		imm_211,40
	blt		j_207,imm_211,sha1__if_then_2
	j		sha1__if_else_2

sha1__if_then_2:
	xor		vReg_212,b_204,c_202
	xor		vReg_213,vReg_212,d_206
	mv		f_214,vReg_213
	li		imm_216,1859775393
	mv		k_215,imm_216
	mv		k_217,k_215
	mv		f_218,f_214
	mv		_fresh_variable__219,k_217
	mv		k_217,k_217
	mv		_fresh_variable__219,f_218
	j		sha1__if_merge_2

sha1__if_merge_2:
	mv		a0,a_205
	li		imm_220,5
	mv		a1,imm_220
	call	rotate_left
	mv		vReg_221,a0
	mv		a0,vReg_221
	mv		a1,e_203
	call	add
	mv		vReg_222,a0
	mv		a0,f_218
	mv		a1,k_217
	call	add
	mv		vReg_223,a0
	mv		a0,vReg_222
	mv		a1,vReg_223
	call	add
	mv		vReg_224,a0
	li		imm_226,4
	mul		vReg_225,i_156,imm_226
	addi	vReg_227,vReg_225,4
	add		vReg_228,vReg_227,chunks_16
	lw		vReg_229,0(vReg_228)
	li		imm_231,4
	mul		vReg_230,j_207,imm_231
	addi	vReg_232,vReg_230,4
	add		vReg_233,vReg_232,vReg_229
	lw		vReg_234,0(vReg_233)
	mv		a0,vReg_224
	mv		a1,vReg_234
	call	add
	mv		vReg_235,a0
	mv		e_236,d_206
	mv		d_237,c_202
	mv		a0,b_204
	li		imm_238,30
	mv		a1,imm_238
	call	rotate_left
	mv		vReg_239,a0
	mv		c_240,vReg_239
	mv		b_241,a_205
	mv		a_242,vReg_235
	j		sha1__for_step_4

sha1__for_step_4:
	addi	j_243,j_207,1
	mv		c_202,c_240
	mv		e_203,e_236
	mv		b_204,b_241
	mv		a_205,a_242
	mv		d_206,d_237
	mv		j_207,j_243
	mv		_fresh_variable__244,c_202
	mv		c_202,c_202
	mv		_fresh_variable__244,e_203
	mv		e_203,e_203
	mv		_fresh_variable__244,b_204
	mv		b_204,b_204
	mv		_fresh_variable__244,a_205
	mv		a_205,a_205
	mv		_fresh_variable__244,d_206
	mv		d_206,d_206
	mv		_fresh_variable__244,j_207
	j		sha1__for_cond_6

sha1__if_else_2:
	li		imm_245,60
	blt		j_207,imm_245,sha1__if_then_3
	j		sha1__if_else_3

sha1__if_then_3:
	and		vReg_246,b_204,c_202
	and		vReg_247,b_204,d_206
	or		vReg_248,vReg_246,vReg_247
	and		vReg_249,c_202,d_206
	or		vReg_250,vReg_248,vReg_249
	mv		f_251,vReg_250
	li		imm_252,48348
	mv		a0,imm_252
	li		imm_253,36635
	mv		a1,imm_253
	call	lohi
	mv		vReg_254,a0
	mv		k_255,vReg_254
	mv		k_217,k_255
	mv		f_218,f_251
	mv		_fresh_variable__256,k_217
	mv		k_217,k_217
	mv		_fresh_variable__256,f_218
	j		sha1__if_merge_2

sha1__if_else_3:
	xor		vReg_257,b_204,c_202
	xor		vReg_258,vReg_257,d_206
	mv		f_259,vReg_258
	li		imm_260,49622
	mv		a0,imm_260
	li		imm_261,51810
	mv		a1,imm_261
	call	lohi
	mv		vReg_262,a0
	mv		k_263,vReg_262
	mv		k_217,k_263
	mv		f_218,f_259
	mv		_fresh_variable__264,k_217
	mv		k_217,k_217
	mv		_fresh_variable__264,f_218
	j		sha1__if_merge_2

sha1__if_then_4:
	and		vReg_265,b_204,c_202
	xori	vReg_266,b_204,-1
	and		vReg_267,vReg_266,d_206
	or		vReg_268,vReg_265,vReg_267
	mv		f_269,vReg_268
	li		imm_271,1518500249
	mv		k_270,imm_271
	mv		k_217,k_270
	mv		f_218,f_269
	mv		_fresh_variable__272,k_217
	mv		k_217,k_217
	mv		_fresh_variable__272,f_218
	j		sha1__if_merge_2

sha1__for_merge_5:
	mv		a0,h0_161
	mv		a1,a_205
	call	add
	mv		vReg_273,a0
	mv		h0_274,vReg_273
	mv		a0,h1_160
	mv		a1,b_204
	call	add
	mv		vReg_275,a0
	mv		h1_276,vReg_275
	mv		a0,h2_157
	mv		a1,c_202
	call	add
	mv		vReg_277,a0
	mv		h2_278,vReg_277
	mv		a0,h3_158
	mv		a1,d_206
	call	add
	mv		vReg_279,a0
	mv		h3_280,vReg_279
	mv		a0,h4_159
	mv		a1,e_203
	call	add
	mv		vReg_281,a0
	mv		h4_282,vReg_281
	j		sha1__for_step_5

sha1__for_step_5:
	addi	i_283,i_156,1
	mv		i_156,i_283
	mv		h2_157,h2_278
	mv		h3_158,h3_280
	mv		h4_159,h4_282
	mv		h1_160,h1_276
	mv		h0_161,h0_274
	mv		_fresh_variable__284,i_156
	mv		i_156,i_156
	mv		_fresh_variable__284,h2_157
	mv		h2_157,h2_157
	mv		_fresh_variable__284,h3_158
	mv		h3_158,h3_158
	mv		_fresh_variable__284,h4_159
	mv		h4_159,h4_159
	mv		_fresh_variable__284,h1_160
	mv		h1_160,h1_160
	mv		_fresh_variable__284,h0_161
	j		sha1__for_cond_4

sha1__for_body_6:
	li		imm_286,4
	mul		vReg_285,i_156,imm_286
	addi	vReg_287,vReg_285,4
	add		vReg_288,vReg_287,chunks_16
	lw		vReg_289,0(vReg_288)
	li		imm_291,4
	mul		vReg_290,j_192,imm_291
	addi	vReg_292,vReg_290,4
	add		vReg_293,vReg_292,vReg_289
	addi	vReg_294,j_192,-3
	lw		vReg_295,0(vReg_288)
	li		imm_297,4
	mul		vReg_296,vReg_294,imm_297
	addi	vReg_298,vReg_296,4
	add		vReg_299,vReg_298,vReg_295
	addi	vReg_300,j_192,-8
	lw		vReg_301,0(vReg_288)
	li		imm_303,4
	mul		vReg_302,vReg_300,imm_303
	addi	vReg_304,vReg_302,4
	add		vReg_305,vReg_304,vReg_301
	lw		vReg_306,0(vReg_299)
	lw		vReg_307,0(vReg_305)
	xor		vReg_308,vReg_306,vReg_307
	addi	vReg_309,j_192,-14
	lw		vReg_310,0(vReg_288)
	li		imm_312,4
	mul		vReg_311,vReg_309,imm_312
	addi	vReg_313,vReg_311,4
	add		vReg_314,vReg_313,vReg_310
	lw		vReg_315,0(vReg_314)
	xor		vReg_316,vReg_308,vReg_315
	addi	vReg_317,j_192,-16
	lw		vReg_318,0(vReg_288)
	li		imm_320,4
	mul		vReg_319,vReg_317,imm_320
	addi	vReg_321,vReg_319,4
	add		vReg_322,vReg_321,vReg_318
	lw		vReg_323,0(vReg_322)
	xor		vReg_324,vReg_316,vReg_323
	mv		a0,vReg_324
	li		imm_325,1
	mv		a1,imm_325
	call	rotate_left
	mv		vReg_326,a0
	sw		vReg_326,0(vReg_293)
	j		sha1__for_step_6

sha1__for_step_6:
	addi	j_327,j_192,1
	mv		j_192,j_327
	mv		_fresh_variable__328,j_192
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
	lui		global_tmp_14,0
	lw		inputBuffer_15,0(global_tmp_14)
	li		imm_17,0
	mv		i_16,imm_17
	mv		i_18,i_16
	mv		_fresh_variable__19,i_18
	j		computeSHA1__for_cond

computeSHA1__for_cond:
	mv		a0,input_13
	call	__builtin_string_length
	mv		vReg_20,a0
	blt		i_18,vReg_20,computeSHA1__for_body
	j		computeSHA1__for_merge

computeSHA1__for_body:
	li		imm_22,4
	mul		vReg_21,i_18,imm_22
	addi	vReg_23,vReg_21,4
	add		vReg_24,vReg_23,inputBuffer_15
	mv		a0,input_13
	mv		a1,i_18
	call	__builtin_string_ord
	mv		vReg_25,a0
	sw		vReg_25,0(vReg_24)
	j		computeSHA1__for_step

computeSHA1__for_step:
	addi	i_26,i_18,1
	mv		i_18,i_26
	mv		_fresh_variable__27,i_18
	j		computeSHA1__for_cond

computeSHA1__for_merge:
	mv		a0,input_13
	call	__builtin_string_length
	mv		vReg_28,a0
	mv		a0,inputBuffer_15
	mv		a1,vReg_28
	call	sha1
	mv		vReg_29,a0
	li		imm_31,0
	mv		i_30,imm_31
	mv		i_32,i_30
	mv		_fresh_variable__33,i_32
	j		computeSHA1__for_cond_2

computeSHA1__for_cond_2:
	lw		vReg_34,0(vReg_29)
	blt		i_32,vReg_34,computeSHA1__for_body_2
	j		computeSHA1__for_merge_2

computeSHA1__for_body_2:
	li		imm_36,4
	mul		vReg_35,i_32,imm_36
	addi	vReg_37,vReg_35,4
	add		vReg_38,vReg_37,vReg_29
	lw		vReg_39,0(vReg_38)
	mv		a0,vReg_39
	call	toStringHex
	mv		vReg_40,a0
	mv		a0,vReg_40
	call	__builtin_print
	j		computeSHA1__for_step_2

computeSHA1__for_step_2:
	addi	i_41,i_32,1
	mv		i_32,i_41
	mv		_fresh_variable__42,i_32
	j		computeSHA1__for_cond_2

computeSHA1__for_merge_2:
	la		str_const_43,__str_const_4
	mv		a0,str_const_43
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
	li		imm_19,0
	bge		i_17,imm_19,nextText__for_body
	j		nextText__for_merge

nextText__for_body:
	li		imm_21,4
	mul		vReg_20,i_17,imm_21
	addi	vReg_22,vReg_20,4
	add		vReg_23,vReg_22,now_13
	lw		vReg_24,0(vReg_23)
	mv		a0,vReg_24
	call	nextLetter
	mv		vReg_25,a0
	sw		vReg_25,0(vReg_23)
	li		imm_27,1
	sub		vReg_26,zero,imm_27
	lw		vReg_28,0(vReg_23)
	beq		vReg_28,vReg_26,nextText__if_then
	j		nextText__if_else

nextText__if_else:
	li		imm_30,1
	mv		returnVal_29,imm_30
	mv		returnVal_31,returnVal_29
	mv		_fresh_variable__32,returnVal_31
	j		nextText_exit

nextText_exit:
	mv		a0,returnVal_31
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
	li		imm_33,48
	sw		imm_33,0(vReg_23)
	j		nextText__for_step

nextText__for_step:
	addi	i_34,i_17,-1
	mv		i_17,i_34
	mv		_fresh_variable__35,i_17
	j		nextText__for_cond

nextText__for_merge:
	li		imm_37,0
	mv		returnVal_36,imm_37
	mv		returnVal_31,returnVal_36
	mv		_fresh_variable__38,returnVal_31
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
	li		imm_18,0
	mv		returnVal_17,imm_18
	mv		returnVal_19,returnVal_17
	mv		_fresh_variable__20,returnVal_19
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
	li		imm_22,0
	mv		i_21,imm_22
	mv		i_23,i_21
	mv		_fresh_variable__24,i_23
	j		array_equal__for_cond

array_equal__for_cond:
	lw		vReg_25,0(a_13)
	blt		i_23,vReg_25,array_equal__for_body
	j		array_equal__for_merge

array_equal__for_body:
	li		imm_27,4
	mul		vReg_26,i_23,imm_27
	addi	vReg_28,vReg_26,4
	add		vReg_29,vReg_28,a_13
	add		vReg_30,vReg_28,b_14
	lw		vReg_31,0(vReg_29)
	lw		vReg_32,0(vReg_30)
	bne		vReg_31,vReg_32,array_equal__if_then_2
	j		array_equal__for_step

array_equal__for_step:
	addi	i_33,i_23,1
	mv		i_23,i_33
	mv		_fresh_variable__34,i_23
	j		array_equal__for_cond

array_equal__if_then_2:
	li		imm_36,0
	mv		returnVal_35,imm_36
	mv		returnVal_19,returnVal_35
	mv		_fresh_variable__37,returnVal_19
	j		array_equal_exit

array_equal__for_merge:
	li		imm_39,1
	mv		returnVal_38,imm_39
	mv		returnVal_19,returnVal_38
	mv		_fresh_variable__40,returnVal_19
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
	bne		vReg_19,imm_20,crackSHA1__if_then
	j		crackSHA1__if_merge

crackSHA1__if_then:
	la		str_const_21,__str_const_5
	mv		a0,str_const_21
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
	li		imm_23,0
	mv		i_22,imm_23
	mv		i_24,i_22
	mv		_fresh_variable__25,i_24
	j		crackSHA1__for_cond

crackSHA1__for_cond:
	li		imm_26,5
	blt		i_24,imm_26,crackSHA1__for_body_5
	j		crackSHA1__for_merge

crackSHA1__for_merge:
	li		imm_28,0
	mv		i_27,imm_28
	mv		i_29,i_27
	mv		_fresh_variable__30,i_29
	j		crackSHA1__for_cond_2

crackSHA1__for_cond_2:
	li		imm_31,40
	blt		i_29,imm_31,crackSHA1__for_body
	j		crackSHA1__for_merge_2

crackSHA1__for_body:
	li		imm_33,8
	div		vReg_32,i_29,imm_33
	li		imm_35,4
	mul		vReg_34,vReg_32,imm_35
	addi	vReg_36,vReg_34,4
	add		vReg_37,vReg_36,vReg_17
	addi	vReg_38,i_29,4
	mv		a0,input_13
	mv		a1,i_29
	mv		a2,vReg_38
	call	__builtin_string_substring
	mv		vReg_39,a0
	mv		a0,vReg_39
	call	hex2int
	mv		vReg_40,a0
	li		imm_42,4
	div		vReg_41,i_29,imm_42
	li		imm_44,2
	rem		vReg_43,vReg_41,imm_44
	li		imm_46,1
	sub		vReg_45,imm_46,vReg_43
	li		imm_48,16
	mul		vReg_47,vReg_45,imm_48
	sll		vReg_49,vReg_40,vReg_47
	lw		vReg_50,0(vReg_37)
	or		vReg_51,vReg_50,vReg_49
	sw		vReg_51,0(vReg_37)
	j		crackSHA1__for_step

crackSHA1__for_step:
	mv		i_52,vReg_38
	mv		i_29,i_52
	mv		_fresh_variable__53,i_29
	j		crackSHA1__for_cond_2

crackSHA1__for_merge_2:
	li		imm_55,1
	mv		digit_54,imm_55
	mv		digit_56,digit_54
	mv		_fresh_variable__57,digit_56
	j		crackSHA1__for_cond_3

crackSHA1__for_cond_3:
	li		imm_58,4
	ble		digit_56,imm_58,crackSHA1__for_body_2
	j		crackSHA1__for_merge_3

crackSHA1__for_merge_3:
	la		str_const_59,__str_const_7
	mv		a0,str_const_59
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__for_body_2:
	li		imm_61,0
	mv		i_60,imm_61
	mv		i_62,i_60
	mv		_fresh_variable__63,i_62
	j		crackSHA1__for_cond_4

crackSHA1__for_cond_4:
	blt		i_62,digit_56,crackSHA1__for_body_4
	j		crackSHA1__while_body

crackSHA1__while_body:
	mv		a0,inputBuffer_15
	mv		a1,digit_56
	call	sha1
	mv		vReg_64,a0
	mv		a0,vReg_64
	mv		a1,vReg_17
	call	array_equal
	mv		vReg_65,a0
	bne		vReg_65,zero,crackSHA1__if_then_2
	j		crackSHA1__if_merge_2

crackSHA1__if_then_2:
	li		imm_67,0
	mv		i_66,imm_67
	mv		i_68,i_66
	mv		_fresh_variable__69,i_68
	j		crackSHA1__for_cond_5

crackSHA1__for_cond_5:
	blt		i_68,digit_56,crackSHA1__for_body_3
	j		crackSHA1__for_merge_4

crackSHA1__for_merge_4:
	la		str_const_70,__str_const_6
	mv		a0,str_const_70
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__for_body_3:
	li		imm_72,4
	mul		vReg_71,i_68,imm_72
	addi	vReg_73,vReg_71,4
	add		vReg_74,vReg_73,inputBuffer_15
	lw		vReg_75,0(vReg_74)
	mv		a0,vReg_75
	call	int2chr
	mv		vReg_76,a0
	mv		a0,vReg_76
	call	__builtin_print
	j		crackSHA1__for_step_2

crackSHA1__for_step_2:
	addi	i_77,i_68,1
	mv		i_68,i_77
	mv		_fresh_variable__78,i_68
	j		crackSHA1__for_cond_5

crackSHA1__if_merge_2:
	mv		a0,inputBuffer_15
	mv		a1,digit_56
	call	nextText
	mv		vReg_79,a0
	bne		vReg_79,zero,crackSHA1__while_body
	j		crackSHA1__for_step_3

crackSHA1__for_step_3:
	addi	digit_80,digit_56,1
	mv		digit_56,digit_80
	mv		_fresh_variable__81,digit_56
	j		crackSHA1__for_cond_3

crackSHA1__for_body_4:
	li		imm_83,4
	mul		vReg_82,i_62,imm_83
	addi	vReg_84,vReg_82,4
	add		vReg_85,vReg_84,inputBuffer_15
	li		imm_86,48
	sw		imm_86,0(vReg_85)
	j		crackSHA1__for_step_4

crackSHA1__for_step_4:
	addi	i_87,i_62,1
	mv		i_62,i_87
	mv		_fresh_variable__88,i_62
	j		crackSHA1__for_cond_4

crackSHA1__for_body_5:
	li		imm_90,4
	mul		vReg_89,i_24,imm_90
	addi	vReg_91,vReg_89,4
	add		vReg_92,vReg_91,vReg_17
	li		imm_93,0
	sw		imm_93,0(vReg_92)
	j		crackSHA1__for_step_5

crackSHA1__for_step_5:
	addi	i_94,i_24,1
	mv		i_24,i_94
	mv		_fresh_variable__95,i_24
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
	beq		vReg_13,imm_16,main__if_then_2
	j		main__if_else

main__if_else:
	li		imm_17,2
	beq		vReg_13,imm_17,main__if_then
	j		main__while_body

main__if_then:
	call	__builtin_getString
	mv		vReg_18,a0
	mv		a0,vReg_18
	call	crackSHA1
	j		main__while_body

main__if_then_2:
	call	__builtin_getString
	mv		vReg_19,a0
	mv		a0,vReg_19
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
	lui		global_tmp_13,0
	lw		chunks_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		asciiTable_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		outputBuffer_18,0(global_tmp_17)
	lui		global_tmp_19,0
	lw		inputBuffer_20,0(global_tmp_19)
	lui		global_tmp_21,0
	lw		MAXLENGTH_22,0(global_tmp_21)
	lui		global_tmp_23,0
	lw		MAXCHUNK_24,0(global_tmp_23)
	li		imm_25,404
	mv		a0,imm_25
	call	malloc
	mv		vReg_26,a0
	li		imm_27,100
	sw		imm_27,0(vReg_26)
	addi	vReg_28,vReg_26,4
	addi	vReg_29,vReg_26,404
	mv		vReg_30,vReg_28
	mv		_fresh_variable__31,vReg_30
	j		_init___array_loop_cond

_init___array_loop_cond:
	blt		vReg_30,vReg_29,_init___array_loop_body
	j		_init___array_loop_merge

_init___array_loop_body:
	li		imm_32,324
	mv		a0,imm_32
	call	malloc
	mv		vReg_33,a0
	li		imm_34,80
	sw		imm_34,0(vReg_33)
	sw		vReg_33,0(vReg_30)
	j		_init___array_loop_step

_init___array_loop_step:
	addi	vReg_35,vReg_30,4
	mv		vReg_36,vReg_35
	mv		vReg_30,vReg_36
	mv		_fresh_variable__37,vReg_30
	j		_init___array_loop_cond

_init___array_loop_merge:
	li		imm_38,25284
	mv		a0,imm_38
	call	malloc
	mv		vReg_39,a0
	li		imm_40,6320
	sw		imm_40,0(vReg_39)
	li		imm_41,24
	mv		a0,imm_41
	call	malloc
	mv		vReg_42,a0
	li		imm_43,5
	sw		imm_43,0(vReg_42)
	lui		global_tmp_44,0
	li		imm_45,100
	sw		imm_45,0(global_tmp_44)
	lui		global_tmp_46,0
	sw		vReg_39,0(global_tmp_46)
	lui		global_tmp_47,0
	sw		vReg_42,0(global_tmp_47)
	lui		global_tmp_48,0
	la		str_const_49,__str_const_9
	sw		str_const_49,0(global_tmp_48)
	lui		global_tmp_50,0
	sw		vReg_26,0(global_tmp_50)
	call	_main
	mv		vReg_51,a0
	mv		a0,vReg_51
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


