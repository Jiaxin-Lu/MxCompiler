	.data

	.globl	__str_const_1
__str_const_1:
	.string	"Oops!"

	.globl	__str_const_2
__str_const_2:
	.string	" "

	.globl	__str_const_3
__str_const_3:
	.string	" "

	.globl	__str_const_4
__str_const_4:
	.string	" "

	.globl	__str_const_5
__str_const_5:
	.string	" "

	.globl	__str_const_6
__str_const_6:
	.string	"\n"

	.globl	__str_const_7
__str_const_7:
	.string	">"

	.globl	__str_const_8
__str_const_8:
	.string	"<="

	.globl	__str_const_9
__str_const_9:
	.string	","

	.globl	__str_const_10
__str_const_10:
	.string	""

	.globl	__str_const_11
__str_const_11:
	.string	"0"

	.globl	__str_const_12
__str_const_12:
	.string	"0"

	.globl	__str_const_13
__str_const_13:
	.string	"0"

	.globl	countA
countA:
	.zero	4

	.globl	countB
countB:
	.zero	4

	.globl	countC
countC:
	.zero	4

	.globl	something
something:
	.zero	4


	.text

	.globl	A_Constructor
	.p2align	2
	.type	A_Constructor, @function
A_Constructor:
	addi	sp, sp, -48
	sw		ra, 44(sp)
	sw		s0, 40(sp)
	sw		s1, 36(sp)
	sw		s2, 32(sp)
	sw		s5, 28(sp)
	sw		s7, 24(sp)
	sw		s8, 20(sp)
	sw		s9, 16(sp)
	sw		s10, 12(sp)
	mv		s2, a0
	lui		s8, %hi(countA)
	lw		s1, %lo(countA)(s8)
	lui		s8, %hi(countB)
	lw		s8, %lo(countB)(s8)
	addi	s8, s2, 12
	addi	s7, s1, 1
	sw		s1, 0(s8)
	mv		s8, s1
	li		s1, 2
	rem		s1, s8, s1
	li		s8, 0
	beq		s1, s8, A_Constructor__if_then_2
	j		A_Constructor__if_else

A_Constructor__if_else:
	addi	s8, s2, 0
	li		s1, 0
	sw		s1, 0(s8)
	j		A_Constructor__if_merge

A_Constructor__if_merge:
	addi	s1, s2, 8
	li		s8, 2
	li		s5, 4
	mul		s8, s8, s5
	addi	a0, s8, 4
	call	malloc
	li		s8, 2
	sw		s8, 0(a0)
	sw		a0, 0(s1)
	mv		s5, a0
	li		s8, 0
	li		s1, 4
	mul		s8, s8, s1
	addi	s8, s8, 4
	add		s8, s8, s5
	sw		s8, 8(sp)
	li		s1, 6
	li		s8, 4
	mul		s8, s1, s8
	addi	s1, s8, 4
	mv		a0, s1
	call	malloc
	mv		s9, a0
	li		s8, 6
	sw		s8, 0(s9)
	addi	s8, s9, 4
	add		s1, s9, s1
	sw		s1, 4(sp)
	j		A_Constructor__array_loop_cond

A_Constructor__array_loop_cond:
	lw		s1, 4(sp)
	blt		s8, s1, A_Constructor__array_loop_body
	j		A_Constructor__array_loop_merge

A_Constructor__array_loop_merge:
	li		s1, 2
	li		s8, 4
	mul		s8, s1, s8
	addi	s8, s8, 4
	add		s8, s8, s9
	lw		s1, 0(s8)
	li		s8, 3
	li		s5, 4
	mul		s8, s8, s5
	addi	s8, s8, 4
	add		s1, s8, s1
	lw		s1, 0(s1)
	add		s8, s8, s1
	lw		s1, 0(s8)
	lw		s8, 8(sp)
	sw		s1, 0(s8)
	addi	s2, s2, 8
	lw		s8, 0(s2)
	li		s1, 1
	li		s5, 4
	mul		s1, s1, s5
	addi	s1, s1, 4
	add		s1, s1, s8
	li		s8, 0
	sw		s8, 0(s1)
	lw		s8, 0(s2)
	lw		s8, 0(s8)
	li		s1, 2
	bne		s8, s1, A_Constructor__if_then
	j		A_Constructor__if_merge_2

A_Constructor__if_merge_2:
	lui		s8, %hi(countA)
	sw		s7, %lo(countA)(s8)
	lw		s10, 12(sp)
	lw		s9, 16(sp)
	lw		s8, 20(sp)
	lw		s7, 24(sp)
	lw		s5, 28(sp)
	lw		s2, 32(sp)
	lw		s1, 36(sp)
	lw		s0, 40(sp)
	lw		ra, 44(sp)
	addi	sp, sp, 48
	jr		ra

A_Constructor__if_then:
	la		a0, __str_const_1
	call	__builtin_println
	j		A_Constructor__if_merge_2

A_Constructor__array_loop_body:
	li		s1, 6
	li		s5, 4
	mul		s1, s1, s5
	addi	s1, s1, 4
	mv		a0, s1
	call	malloc
	li		s5, 6
	sw		s5, 0(a0)
	sw		a0, 0(s8)
	addi	s10, a0, 4
	add		s1, a0, s1
	j		A_Constructor__array_loop_cond_2

A_Constructor__array_loop_cond_2:
	blt		s10, s1, A_Constructor__array_loop_body_2
	j		A_Constructor__array_loop_step_3

A_Constructor__array_loop_body_2:
	li		s5, 6
	li		s0, 4
	mul		s5, s5, s0
	addi	s5, s5, 4
	mv		a0, s5
	call	malloc
	li		s0, 6
	sw		s0, 0(a0)
	sw		a0, 0(s10)
	addi	s0, a0, 4
	add		s5, a0, s5
	j		A_Constructor__array_loop_cond_3

A_Constructor__array_loop_cond_3:
	blt		s0, s5, A_Constructor__array_loop_body_3
	j		A_Constructor__array_loop_step_2

A_Constructor__array_loop_body_3:
	li		t4, 6
	li		a4, 4
	mul		a4, t4, a4
	addi	a0, a4, 4
	call	malloc
	li		a4, 6
	sw		a4, 0(a0)
	sw		a0, 0(s0)
	j		A_Constructor__array_loop_step

A_Constructor__array_loop_step:
	addi	s0, s0, 4
	j		A_Constructor__array_loop_cond_3

A_Constructor__array_loop_step_2:
	addi	s10, s10, 4
	j		A_Constructor__array_loop_cond_2

A_Constructor__array_loop_step_3:
	addi	s8, s8, 4
	j		A_Constructor__array_loop_cond

A_Constructor__if_then_2:
	addi	s5, s2, 0
	li		a0, 16
	call	malloc
	mv		s8, a0
	lui		s1, %hi(countA)
	sw		s7, %lo(countA)(s1)
	mv		a0, s8
	call	A_Constructor
	lui		s7, %hi(countA)
	lw		s7, %lo(countA)(s7)
	lui		s1, %hi(countB)
	lw		s1, %lo(countB)(s1)
	sw		s8, 0(s5)
	li		s8, 2
	rem		s8, s1, s8
	li		s1, 0
	beq		s8, s1, A_Constructor__if_then_3
	j		A_Constructor__if_else_2

A_Constructor__if_else_2:
	addi	s1, s2, 4
	li		s8, 0
	sw		s8, 0(s1)
	j		A_Constructor__if_merge

A_Constructor__if_then_3:
	addi	s5, s2, 4
	li		a0, 8
	call	malloc
	mv		s8, a0
	lui		s1, %hi(countA)
	sw		s7, %lo(countA)(s1)
	mv		a0, s8
	call	B_Constructor
	lui		s7, %hi(countA)
	lw		s7, %lo(countA)(s7)
	lui		s1, %hi(countB)
	lw		s1, %lo(countB)(s1)
	sw		s8, 0(s5)
	j		A_Constructor__if_merge


	.globl	A_getc0
	.p2align	2
	.type	A_getc0, @function
A_getc0:
	addi	a4, a0, 8
	lw		a4, 0(a4)
	addi	a4, a4, 4
	lw		a0, 0(a4)
	jr		ra


	.globl	B_Constructor
	.p2align	2
	.type	B_Constructor, @function
B_Constructor:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s6, 8(sp)
	sw		s8, 4(sp)
	sw		s9, 0(sp)
	lui		s8, %hi(countB)
	lw		s9, %lo(countB)(s8)
	addi	s8, a0, 0
	addi	s6, s9, 1
	sw		s9, 0(s8)
	addi	s9, a0, 4
	li		a0, 16
	call	malloc
	mv		s8, a0
	lui		a4, %hi(countB)
	sw		s6, %lo(countB)(a4)
	mv		a0, s8
	call	A_Constructor
	lui		s6, %hi(countB)
	lw		s6, %lo(countB)(s6)
	mv		a0, s8
	call	A_getc0
	addi	s8, a0, 4
	lw		a0, 0(s8)
	call	C_Me
	call	C_Me
	sw		a0, 0(s9)
	lui		s8, %hi(countB)
	sw		s6, %lo(countB)(s8)
	lw		s9, 0(sp)
	lw		s8, 4(sp)
	lw		s6, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


	.globl	C_Me
	.p2align	2
	.type	C_Me, @function
C_Me:
	jr		ra


	.globl	count
	.p2align	2
	.type	count, @function
count:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s3, 24(sp)
	sw		s4, 20(sp)
	sw		s5, 16(sp)
	mv		s3, s7
	sw		s11, 12(sp)
	lui		s7, %hi(countA)
	lw		s7, %lo(countA)(s7)
	lui		s7, %hi(something)
	lw		s11, %lo(something)(s7)
	lui		s7, %hi(countC)
	lw		s7, %lo(countC)(s7)
	lui		s7, %hi(countB)
	lw		s7, %lo(countB)(s7)
	li		a0, 8
	call	malloc
	lui		s7, %hi(countB)
	li		s4, 0
	sw		s4, %lo(countB)(s7)
	lui		s7, %hi(countA)
	li		s4, 0
	sw		s4, %lo(countA)(s7)
	call	B_Constructor
	lui		s7, %hi(countA)
	lw		a0, %lo(countA)(s7)
	lui		s7, %hi(countB)
	lw		s4, %lo(countB)(s7)
	call	__builtin_toString
	la		a1, __str_const_2
	call	__builtin_string_add
	mv		s7, a0
	mv		a0, s4
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s7
	call	__builtin_string_add
	la		a1, __str_const_3
	call	__builtin_string_add
	la		a1, __str_const_11
	call	__builtin_string_add
	call	__builtin_println
	li		a0, 8
	call	malloc
	lui		s7, %hi(countB)
	li		s4, 1
	sw		s4, %lo(countB)(s7)
	lui		s7, %hi(countA)
	li		s4, 1
	sw		s4, %lo(countA)(s7)
	call	B_Constructor
	lui		s7, %hi(countA)
	lw		s5, %lo(countA)(s7)
	lui		s7, %hi(countB)
	lw		s7, %lo(countB)(s7)
	addi	a0, s5, -1
	call	__builtin_toString
	la		a1, __str_const_4
	call	__builtin_string_add
	mv		s4, a0
	addi	a0, s7, -1
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s4
	call	__builtin_string_add
	la		a1, __str_const_5
	call	__builtin_string_add
	la		a1, __str_const_12
	call	__builtin_string_add
	call	__builtin_print
	la		a0, __str_const_6
	call	__builtin_print
	mv		a0, s11
	call	C_Me
	addi	s4, a0, 4
	lw		s4, 0(s4)
	addi	s11, s11, 4
	lw		a0, 0(s11)
	call	__builtin_string_length
	addi	a2, a0, -1
	mv		a0, s4
	li		a1, 1
	call	__builtin_string_substring
	call	__builtin_string_parseInt
	call	__builtin_toString
	call	__builtin_println
	lw		a0, 0(s11)
	li		a1, 0
	call	__builtin_string_ord
	call	__builtin_toString
	mv		s4, a0
	lw		a0, 0(s11)
	mv		a1, s4
	call	__builtin_string_rt
	bne		a0, zero, count__if_then
	j		count__if_else

count__if_then:
	lw		a0, 0(s11)
	la		a1, __str_const_7
	call	__builtin_string_add
	mv		a1, s4
	call	__builtin_string_add
	call	__builtin_println
	j		count__if_merge

count__if_merge:
	lui		s4, %hi(countB)
	sw		s7, %lo(countB)(s4)
	lui		s7, %hi(countC)
	li		s4, 1
	sw		s4, %lo(countC)(s7)
	lui		s7, %hi(countA)
	sw		s5, %lo(countA)(s7)
	lw		s11, 12(sp)
	mv		s7, s3
	lw		s5, 16(sp)
	lw		s4, 20(sp)
	lw		s3, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

count__if_else:
	lw		a0, 0(s11)
	la		a1, __str_const_8
	call	__builtin_string_add
	mv		a1, s4
	call	__builtin_string_add
	call	__builtin_println
	j		count__if_merge


	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	li		s8, 0
	j		main__for_body

main__for_body:
	li		s7, 891
	andi	s7, s7, 759
	xor		s7, s8, s7
	xori	s4, s7, 666
	seqz	s4, s4
	j		main__bool_merge

main__bool_merge:
	li		s7, 1
	beq		s4, s7, main__if_then
	j		main__for_step

main__for_step:
	addi	s8, s8, 1
	j		main__for_body

main__if_then:
	mv		a0, s8
	call	__builtin_toString
	call	__builtin_println
	li		a0, 0
	call	__builtin_toString
	call	__builtin_println
	li		a0, 1
	call	__builtin_toString
	call	__builtin_println
	call	count
	j		main__while_body

main__while_body:
	li		s7, 2
	rem		s7, s8, s7
	li		s4, 0
	beq		s7, s4, main__while_body
	j		main__if_merge

main__if_merge:
	mv		a0, s8
	call	__builtin_toString
	la		a1, __str_const_9
	call	__builtin_string_add
	call	__builtin_print
	j		main__while_body


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	call	_main
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


