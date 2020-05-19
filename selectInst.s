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

	.globl	random
	.type	random, @function
random:
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
	lw		Q_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		R_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		seed_18,0(global_tmp_17)
	lui		global_tmp_19,0
	lw		A_20,0(global_tmp_19)
	lui		global_tmp_21,0
	lw		M_22,0(global_tmp_21)
	rem		vReg_23,seed_18,Q_14
	mul		vReg_24,A_20,vReg_23
	div		vReg_25,seed_18,Q_14
	mul		vReg_26,R_16,vReg_25
	sub		vReg_27,vReg_24,vReg_26
	li		imm_28,0
	bge		vReg_27,imm_28,random__if_then
	j		random__if_else

random__if_else:
	add		vReg_29,vReg_27,M_22
	mv		seed_30,vReg_29
	mv		seed_31,seed_30
	j		random__if_merge

random__if_merge:
	lui		global_tmp_32,0
	sw		seed_31,0(global_tmp_32)
	mv		a0,seed_31
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

random__if_then:
	mv		seed_33,vReg_27
	mv		seed_31,seed_33
	j		random__if_merge


	.globl	initialize
	.type	initialize, @function
initialize:
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
	mv		val_13,a0
	lui		global_tmp_14,0
	sw		val_13,0(global_tmp_14)
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


	.globl	swap
	.type	swap, @function
swap:
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
	lui		global_tmp_15,0
	lw		a_16,0(global_tmp_15)
	li		imm_18,4
	mul		vReg_17,x_13,imm_18
	addi	vReg_19,vReg_17,4
	add		vReg_20,vReg_19,a_16
	lw		vReg_21,0(vReg_20)
	li		imm_23,4
	mul		vReg_22,y_14,imm_23
	addi	vReg_24,vReg_22,4
	add		vReg_25,vReg_24,a_16
	lw		vReg_26,0(vReg_25)
	sw		vReg_26,0(vReg_20)
	sw		vReg_21,0(vReg_25)
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


	.globl	pd
	.type	pd, @function
pd:
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
	lw		h_15,0(global_tmp_14)
	mv		h_16,h_15
	j		pd__for_cond

pd__for_cond:
	ble		h_16,x_13,pd__for_body
	j		pd__for_merge

pd__for_body:
	addi	vReg_17,h_16,1
	mul		vReg_18,h_16,vReg_17
	li		imm_20,2
	div		vReg_19,vReg_18,imm_20
	beq		x_13,vReg_19,pd__if_then
	j		pd__for_step

pd__for_step:
	mv		h_21,vReg_17
	mv		h_16,h_21
	j		pd__for_cond

pd__if_then:
	li		imm_23,1
	mv		returnVal_22,imm_23
	mv		returnVal_24,returnVal_22
	j		pd_exit

pd_exit:
	lui		global_tmp_25,0
	sw		h_16,0(global_tmp_25)
	mv		a0,returnVal_24
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

pd__for_merge:
	li		imm_27,0
	mv		returnVal_26,imm_27
	mv		returnVal_24,returnVal_26
	j		pd_exit


	.globl	show
	.type	show, @function
show:
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
	lw		a_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		now_16,0(global_tmp_15)
	li		imm_18,0
	mv		i_17,imm_18
	mv		i_19,i_17
	j		show__for_cond

show__for_cond:
	blt		i_19,now_16,show__for_body
	j		show__for_merge

show__for_body:
	li		imm_21,4
	mul		vReg_20,i_19,imm_21
	addi	vReg_22,vReg_20,4
	add		vReg_23,vReg_22,a_14
	lw		vReg_24,0(vReg_23)
	mv		a0,vReg_24
	call	__builtin_toString
	mv		vReg_25,a0
	mv		a0,vReg_25
	la		str_const_26,__str_const_1
	mv		a1,str_const_26
	call	__builtin_string_add
	mv		vReg_27,a0
	mv		a0,vReg_27
	call	__builtin_print
	addi	i_28,i_19,1
	mv		i_19,i_28
	j		show__for_cond

show__for_merge:
	la		str_const_29,__str_const_2
	mv		a0,str_const_29
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


	.globl	win
	.type	win, @function
win:
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
	lw		h_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		a_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		now_18,0(global_tmp_17)
	li		imm_19,404
	mv		a0,imm_19
	call	malloc
	mv		vReg_20,a0
	li		imm_21,100
	sw		imm_21,0(vReg_20)
	bne		now_18,h_14,win__if_then
	j		win__if_merge

win__if_then:
	li		imm_23,0
	mv		returnVal_22,imm_23
	mv		returnVal_24,returnVal_22
	j		win_exit

win_exit:
	mv		a0,returnVal_24
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

win__if_merge:
	li		imm_26,0
	mv		j_25,imm_26
	mv		j_27,j_25
	j		win__for_cond

win__for_cond:
	blt		j_27,now_18,win__for_body
	j		win__for_merge

win__for_body:
	li		imm_29,4
	mul		vReg_28,j_27,imm_29
	addi	vReg_30,vReg_28,4
	add		vReg_31,vReg_30,vReg_20
	add		vReg_32,vReg_30,a_16
	lw		vReg_33,0(vReg_32)
	sw		vReg_33,0(vReg_31)
	addi	j_34,j_27,1
	mv		j_27,j_34
	j		win__for_cond

win__for_merge:
	li		imm_36,0
	mv		i_35,imm_36
	mv		i_37,i_35
	j		win__for_cond_2

win__for_cond_2:
	addi	vReg_38,now_18,-1
	blt		i_37,vReg_38,win__for_body_2
	j		win__for_merge_2

win__for_body_2:
	addi	vReg_39,i_37,1
	mv		j_40,vReg_39
	mv		j_41,j_40
	j		win__for_cond_3

win__for_cond_3:
	blt		j_41,now_18,win__for_body_3
	j		win__for_step_2

win__for_body_3:
	li		imm_43,4
	mul		vReg_42,i_37,imm_43
	addi	vReg_44,vReg_42,4
	add		vReg_45,vReg_44,vReg_20
	li		imm_47,4
	mul		vReg_46,j_41,imm_47
	addi	vReg_48,vReg_46,4
	add		vReg_49,vReg_48,vReg_20
	lw		vReg_50,0(vReg_45)
	lw		vReg_51,0(vReg_49)
	bgt		vReg_50,vReg_51,win__if_then_2
	j		win__for_step

win__for_step:
	addi	j_52,j_41,1
	mv		j_41,j_52
	j		win__for_cond_3

win__if_then_2:
	lw		vReg_53,0(vReg_45)
	lw		vReg_54,0(vReg_49)
	sw		vReg_54,0(vReg_45)
	sw		vReg_53,0(vReg_49)
	j		win__for_step

win__for_step_2:
	addi	i_55,i_37,1
	mv		i_37,i_55
	j		win__for_cond_2

win__for_merge_2:
	li		imm_57,0
	mv		i_56,imm_57
	mv		i_58,i_56
	j		win__for_cond_4

win__for_cond_4:
	blt		i_58,now_18,win__for_body_4
	j		win__for_merge_3

win__for_body_4:
	li		imm_60,4
	mul		vReg_59,i_58,imm_60
	addi	vReg_61,vReg_59,4
	add		vReg_62,vReg_61,vReg_20
	addi	vReg_63,i_58,1
	lw		vReg_64,0(vReg_62)
	bne		vReg_64,vReg_63,win__if_then_3
	j		win__for_step_3

win__for_step_3:
	mv		i_65,vReg_63
	mv		i_58,i_65
	j		win__for_cond_4

win__if_then_3:
	li		imm_67,0
	mv		returnVal_66,imm_67
	mv		returnVal_24,returnVal_66
	j		win_exit

win__for_merge_3:
	li		imm_69,1
	mv		returnVal_68,imm_69
	mv		returnVal_24,returnVal_68
	j		win_exit


	.globl	merge
	.type	merge, @function
merge:
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
	lw		a_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		now_16,0(global_tmp_15)
	li		imm_18,0
	mv		i_17,imm_18
	mv		i_19,i_17
	j		merge__for_cond

merge__for_cond:
	blt		i_19,now_16,merge__for_body_2
	j		merge__for_merge

merge__for_merge:
	li		imm_21,0
	mv		i_20,imm_21
	mv		i_22,i_20
	j		merge__for_cond_2

merge__for_cond_2:
	blt		i_22,now_16,merge__for_body
	j		merge__parallel_copy_

merge__for_body:
	li		imm_24,4
	mul		vReg_23,i_22,imm_24
	addi	vReg_25,vReg_23,4
	add		vReg_26,vReg_25,a_14
	lw		vReg_27,0(vReg_26)
	li		imm_28,0
	beq		vReg_27,imm_28,merge__if_then
	j		merge__for_step

merge__for_step:
	addi	i_29,i_22,1
	mv		i_22,i_29
	j		merge__for_cond_2

merge__if_then:
	mv		now_30,i_22
	mv		now_31,now_30
	j		merge__for_merge_2

merge__for_merge_2:
	lui		global_tmp_32,0
	sw		now_31,0(global_tmp_32)
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

merge__parallel_copy_:
	mv		now_31,now_16
	j		merge__for_merge_2

merge__for_body_2:
	li		imm_34,4
	mul		vReg_33,i_19,imm_34
	addi	vReg_35,vReg_33,4
	add		vReg_36,vReg_35,a_14
	lw		vReg_37,0(vReg_36)
	li		imm_38,0
	beq		vReg_37,imm_38,merge__if_then_2
	j		merge__for_step_3

merge__if_then_2:
	addi	vReg_39,i_19,1
	mv		j_40,vReg_39
	mv		j_41,j_40
	j		merge__for_cond_3

merge__for_cond_3:
	blt		j_41,now_16,merge__for_body_3
	j		merge__for_step_3

merge__for_body_3:
	li		imm_43,4
	mul		vReg_42,j_41,imm_43
	addi	vReg_44,vReg_42,4
	add		vReg_45,vReg_44,a_14
	lw		vReg_46,0(vReg_45)
	li		imm_47,0
	bne		vReg_46,imm_47,merge__if_then_3
	j		merge__for_step_2

merge__for_step_2:
	addi	j_48,j_41,1
	mv		j_41,j_48
	j		merge__for_cond_3

merge__if_then_3:
	mv		a0,i_19
	mv		a1,j_41
	call	swap
	j		merge__for_step_3

merge__for_step_3:
	addi	i_49,i_19,1
	mv		i_19,i_49
	j		merge__for_cond


	.globl	move
	.type	move, @function
move:
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
	lw		a_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		now_16,0(global_tmp_15)
	li		imm_18,0
	mv		i_17,imm_18
	mv		i_19,i_17
	j		move__for_cond

move__for_cond:
	blt		i_19,now_16,move__for_body
	j		move__for_merge

move__for_body:
	li		imm_21,4
	mul		vReg_20,i_19,imm_21
	addi	vReg_22,vReg_20,4
	add		vReg_23,vReg_22,a_14
	lw		vReg_24,0(vReg_23)
	addi	vReg_25,vReg_24,-1
	sw		vReg_25,0(vReg_23)
	addi	vReg_26,i_19,1
	mv		i_27,vReg_26
	mv		i_19,i_27
	j		move__for_cond

move__for_merge:
	li		imm_29,4
	mul		vReg_28,now_16,imm_29
	addi	vReg_30,vReg_28,4
	add		vReg_31,vReg_30,a_14
	sw		now_16,0(vReg_31)
	addi	now_32,now_16,1
	lui		global_tmp_33,0
	sw		now_32,0(global_tmp_33)
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
	lw		A_14,0(global_tmp_13)
	lui		global_tmp_15,0
	lw		M_16,0(global_tmp_15)
	lui		global_tmp_17,0
	lw		now_18,0(global_tmp_17)
	li		imm_20,0
	mv		i_19,imm_20
	li		imm_22,0
	mv		temp_21,imm_22
	li		imm_24,0
	mv		count_23,imm_24
	li		imm_25,404
	mv		a0,imm_25
	call	malloc
	mv		vReg_26,a0
	li		imm_27,100
	sw		imm_27,0(vReg_26)
	div		vReg_28,M_16,A_14
	rem		vReg_29,M_16,A_14
	lui		global_tmp_30,0
	li		imm_31,0
	sw		imm_31,0(global_tmp_30)
	li		imm_32,210
	mv		a0,imm_32
	call	pd
	mv		vReg_33,a0
	lui		global_tmp_34,0
	lw		h_35,0(global_tmp_34)
	bne		vReg_33,zero,main__if_merge
	j		main__if_then

main__if_then:
	la		str_const_36,__str_const_3
	mv		a0,str_const_36
	call	__builtin_println
	li		imm_38,1
	mv		returnVal_37,imm_38
	mv		now_39,now_18
	mv		returnVal_40,returnVal_37
	j		main_exit

main_exit:
	lui		global_tmp_41,0
	li		imm_42,210
	sw		imm_42,0(global_tmp_41)
	lui		global_tmp_43,0
	sw		now_39,0(global_tmp_43)
	lui		global_tmp_44,0
	sw		vReg_26,0(global_tmp_44)
	lui		global_tmp_45,0
	sw		vReg_29,0(global_tmp_45)
	lui		global_tmp_46,0
	sw		h_35,0(global_tmp_46)
	lui		global_tmp_47,0
	sw		vReg_28,0(global_tmp_47)
	mv		a0,returnVal_40
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
	la		str_const_48,__str_const_4
	mv		a0,str_const_48
	call	__builtin_println
	li		imm_49,3654898
	mv		a0,imm_49
	call	initialize
	lui		global_tmp_50,0
	sw		vReg_29,0(global_tmp_50)
	lui		global_tmp_51,0
	sw		vReg_28,0(global_tmp_51)
	call	random
	mv		vReg_52,a0
	li		imm_54,10
	rem		vReg_53,vReg_52,imm_54
	addi	vReg_55,vReg_53,1
	mv		a0,vReg_55
	call	__builtin_toString
	mv		vReg_56,a0
	mv		a0,vReg_56
	call	__builtin_println
	mv		temp_57,temp_21
	mv		i_58,i_19
	j		main__for_cond

main__for_cond:
	addi	vReg_59,vReg_55,-1
	blt		i_58,vReg_59,main__for_body
	j		main__for_merge

main__for_body:
	li		imm_61,4
	mul		vReg_60,i_58,imm_61
	addi	vReg_62,vReg_60,4
	add		vReg_63,vReg_62,vReg_26
	lui		global_tmp_64,0
	sw		vReg_29,0(global_tmp_64)
	lui		global_tmp_65,0
	sw		vReg_28,0(global_tmp_65)
	call	random
	mv		vReg_66,a0
	li		imm_68,10
	rem		vReg_67,vReg_66,imm_68
	addi	vReg_69,vReg_67,1
	sw		vReg_69,0(vReg_63)
	j		main__while_cond

main__while_cond:
	li		imm_71,4
	mul		vReg_70,i_58,imm_71
	addi	vReg_72,vReg_70,4
	add		vReg_73,vReg_72,vReg_26
	lw		vReg_74,0(vReg_73)
	add		vReg_75,vReg_74,temp_57
	li		imm_76,210
	bgt		vReg_75,imm_76,main__while_body
	j		main__while_merge

main__while_body:
	lui		global_tmp_77,0
	sw		vReg_29,0(global_tmp_77)
	lui		global_tmp_78,0
	sw		vReg_28,0(global_tmp_78)
	call	random
	mv		vReg_79,a0
	li		imm_81,10
	rem		vReg_80,vReg_79,imm_81
	addi	vReg_82,vReg_80,1
	sw		vReg_82,0(vReg_73)
	j		main__while_cond

main__while_merge:
	lw		vReg_83,0(vReg_73)
	add		vReg_84,temp_57,vReg_83
	mv		temp_85,vReg_84
	addi	i_86,i_58,1
	mv		temp_57,temp_85
	mv		i_58,i_86
	j		main__for_cond

main__for_merge:
	li		imm_88,4
	mul		vReg_87,vReg_59,imm_88
	addi	vReg_89,vReg_87,4
	add		vReg_90,vReg_89,vReg_26
	li		imm_92,210
	sub		vReg_91,imm_92,temp_57
	sw		vReg_91,0(vReg_90)
	lui		global_tmp_93,0
	sw		vReg_55,0(global_tmp_93)
	lui		global_tmp_94,0
	sw		vReg_26,0(global_tmp_94)
	call	show
	lui		global_tmp_95,0
	sw		vReg_55,0(global_tmp_95)
	lui		global_tmp_96,0
	sw		vReg_26,0(global_tmp_96)
	call	merge
	lui		global_tmp_97,0
	lw		now_98,0(global_tmp_97)
	mv		now_99,now_98
	mv		count_100,count_23
	j		main__while_cond_2

main__while_cond_2:
	lui		global_tmp_101,0
	sw		now_99,0(global_tmp_101)
	lui		global_tmp_102,0
	sw		vReg_26,0(global_tmp_102)
	lui		global_tmp_103,0
	sw		h_35,0(global_tmp_103)
	call	win
	mv		vReg_104,a0
	bne		vReg_104,zero,main__while_merge_2
	j		main__while_body_2

main__while_body_2:
	addi	count_105,count_100,1
	mv		a0,count_105
	call	__builtin_toString
	mv		vReg_106,a0
	la		str_const_107,__str_const_5
	mv		a0,str_const_107
	mv		a1,vReg_106
	call	__builtin_string_add
	mv		vReg_108,a0
	mv		a0,vReg_108
	la		str_const_109,__str_const_6
	mv		a1,str_const_109
	call	__builtin_string_add
	mv		vReg_110,a0
	mv		a0,vReg_110
	call	__builtin_println
	lui		global_tmp_111,0
	sw		now_99,0(global_tmp_111)
	lui		global_tmp_112,0
	sw		vReg_26,0(global_tmp_112)
	call	move
	lui		global_tmp_113,0
	lw		now_114,0(global_tmp_113)
	lui		global_tmp_115,0
	sw		now_114,0(global_tmp_115)
	lui		global_tmp_116,0
	sw		vReg_26,0(global_tmp_116)
	call	merge
	lui		global_tmp_117,0
	lw		now_118,0(global_tmp_117)
	lui		global_tmp_119,0
	sw		now_118,0(global_tmp_119)
	lui		global_tmp_120,0
	sw		vReg_26,0(global_tmp_120)
	call	show
	mv		now_99,now_118
	mv		count_100,count_105
	j		main__while_cond_2

main__while_merge_2:
	mv		a0,count_100
	call	__builtin_toString
	mv		vReg_121,a0
	la		str_const_122,__str_const_7
	mv		a0,str_const_122
	mv		a1,vReg_121
	call	__builtin_string_add
	mv		vReg_123,a0
	mv		a0,vReg_123
	la		str_const_124,__str_const_8
	mv		a1,str_const_124
	call	__builtin_string_add
	mv		vReg_125,a0
	mv		a0,vReg_125
	call	__builtin_println
	li		imm_127,0
	mv		returnVal_126,imm_127
	mv		now_39,now_99
	mv		returnVal_40,returnVal_126
	j		main_exit


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
	li		imm_16,48271
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


