	.data

	.globl	__str_const_1
__str_const_1:
	.string	"toInt: "

	.globl	__str_const_2
__str_const_2:
	.string	"substr: "

	.globl	__str_const_3
__str_const_3:
	.string	" "

	.globl	__str_const_4
__str_const_4:
	.string	""

	.globl	__str_const_5
__str_const_5:
	.string	"BY Kipsora"

	.globl	reed
reed:
	.zero	4

	.globl	n
n:
	.zero	4


	.text

	.globl	rand
	.p2align	2
	.type	rand, @function
rand:
	lui		a0, %hi(reed)
	lw		a0, %lo(reed)(a0)
	slli	t1, a0, 5
	add		a0, a0, t1
	li		t1, 1727317
	add		t1, a0, t1
	li		a0, 1772371
	rem		a7, t1, a0
	li		a0, 1000
	blt		a7, a0, rand__if_then
	j		rand__parallel_copy_

rand__if_then:
	li		a0, 818277
	add		a0, t1, a0
	xor		a0, t1, a0
	li		a7, 18217
	sub		t1, t1, a7
	or		t1, a0, t1
	j		rand__if_merge

rand__if_merge:
	li		a0, -268435457
	and		a0, t1, a0
	lui		a7, %hi(reed)
	sw		t1, %lo(reed)(a7)
	jr		ra

rand__parallel_copy_:
	j		rand__if_merge


	.globl	Test_Constructor
	.p2align	2
	.type	Test_Constructor, @function
Test_Constructor:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s1, 24(sp)
	sw		s5, 20(sp)
	sw		s6, 16(sp)
	sw		s8, 12(sp)
	sw		s10, 8(sp)
	mv		s1, a0
	lui		s5, %hi(n)
	lw		s8, %lo(n)(s5)
	li		s10, 0
	addi	s5, s1, 0
	li		s6, 4
	mul		s6, s8, s6
	addi	a0, s6, 4
	call	malloc
	sw		s8, 0(a0)
	sw		a0, 0(s5)
	li		s5, 0
	mv		s6, s10
	mv		s6, s5
	j		Test_Constructor__for_cond

Test_Constructor__for_cond:
	blt		s5, s8, Test_Constructor__for_body
	j		Test_Constructor__for_merge

Test_Constructor__for_body:
	addi	s6, s1, 0
	lw		a0, 0(s6)
	li		s6, 4
	mul		s10, s10, s6
	addi	s10, s10, 4
	add		s6, s10, a0
	mul		s10, s5, s5
	add		s10, s5, s10
	addi	s10, s10, 3
	ori	s10, s10, 13
	li		a0, 4
	mul		a0, s10, a0
	addi	a0, a0, 4
	call	malloc
	sw		s10, 0(a0)
	sw		a0, 0(s6)
	li		s10, 0
	j		Test_Constructor__for_cond_2

Test_Constructor__for_cond_2:
	mul		s6, s5, s5
	add		s6, s5, s6
	addi	s6, s6, 2
	ori	s6, s6, 13
	blt		s10, s6, Test_Constructor__for_body_2
	j		Test_Constructor__for_step

Test_Constructor__for_step:
	addi	s5, s5, 1
	mv		s6, s10
	mv		s6, s5
	j		Test_Constructor__for_cond

Test_Constructor__for_body_2:
	addi	s6, s1, 0
	lw		a0, 0(s6)
	li		s6, 4
	mul		s6, s5, s6
	addi	s6, s6, 4
	add		s6, s6, a0
	lw		a0, 0(s6)
	li		s6, 4
	mul		s6, s10, s6
	addi	s6, s6, 4
	add		s6, s6, a0
	call	rand
	call	__builtin_toString
	sw		a0, 0(s6)
	j		Test_Constructor__for_step_2

Test_Constructor__for_step_2:
	addi	s10, s10, 1
	j		Test_Constructor__for_cond_2

Test_Constructor__for_merge:
	lw		s10, 8(sp)
	lw		s8, 12(sp)
	lw		s6, 16(sp)
	lw		s5, 20(sp)
	lw		s1, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra


	.globl	Test_printme
	.p2align	2
	.type	Test_printme, @function
Test_printme:
	addi	sp, sp, -48
	sw		ra, 44(sp)
	sw		s0, 40(sp)
	sw		s1, 36(sp)
	sw		s2, 32(sp)
	sw		s3, 28(sp)
	sw		s5, 24(sp)
	sw		s7, 20(sp)
	sw		s8, 16(sp)
	sw		s9, 12(sp)
	mv		s9, a0
	lui		s5, %hi(n)
	lw		s5, %lo(n)(s5)
	sw		s5, 8(sp)
	li		s3, 0
	j		Test_printme__for_cond

Test_printme__for_cond:
	lw		s5, 8(sp)
	blt		s3, s5, Test_printme__for_body
	j		Test_printme__for_merge_2

Test_printme__for_body:
	li		s7, 0
	j		Test_printme__for_cond_2

Test_printme__for_cond_2:
	mul		s5, s3, s3
	sub		s1, s7, s5
	addi	s5, s3, 3
	blt		s1, s5, Test_printme__for_body_2
	j		Test_printme__for_step_3

Test_printme__for_body_2:
	addi	s5, s9, 0
	lw		s2, 0(s5)
	li		s1, 4
	mul		s1, s3, s1
	addi	s1, s1, 4
	add		s2, s1, s2
	lw		s8, 0(s2)
	li		s2, 4
	mul		s2, s7, s2
	addi	s2, s2, 4
	add		s8, s2, s8
	lw		a0, 0(s8)
	call	__builtin_println
	lw		s8, 0(s5)
	add		s8, s1, s8
	lw		s8, 0(s8)
	add		s8, s2, s8
	lw		a0, 0(s8)
	call	__builtin_string_parseInt
	call	__builtin_toString
	mv		a1, a0
	la		a0, __str_const_1
	call	__builtin_string_add
	call	__builtin_println
	call	rand
	mv		s8, a0
	lw		s0, 0(s5)
	add		s0, s1, s0
	lw		s0, 0(s0)
	add		s0, s2, s0
	lw		a0, 0(s0)
	call	__builtin_string_length
	rem		s8, s8, a0
	call	rand
	mv		s0, a0
	lw		s5, 0(s5)
	add		s5, s1, s5
	lw		s5, 0(s5)
	add		s5, s2, s5
	lw		a0, 0(s5)
	call	__builtin_string_length
	rem		a2, s0, a0
	bgt		s8, a2, Test_printme__if_then
	j		Test_printme__parallel_copy_

Test_printme__parallel_copy_:
	mv		a1, s8
	mv		s5, a1
	mv		s5, a2
	j		Test_printme__if_merge

Test_printme__if_merge:
	addi	s5, s9, 0
	lw		s1, 0(s5)
	li		s5, 4
	mul		s5, s3, s5
	addi	s5, s5, 4
	add		s5, s5, s1
	lw		s1, 0(s5)
	li		s5, 4
	mul		s5, s7, s5
	addi	s5, s5, 4
	add		s5, s5, s1
	lw		a0, 0(s5)
	call	__builtin_string_substring
	mv		a1, a0
	la		a0, __str_const_2
	call	__builtin_string_add
	call	__builtin_println
	li		s5, 0
	j		Test_printme__for_cond_3

Test_printme__for_cond_3:
	addi	s2, s5, 1
	addi	s1, s9, 0
	lw		a0, 0(s1)
	li		s8, 4
	mul		s8, s3, s8
	addi	s0, s8, 4
	add		s8, s0, a0
	lw		a0, 0(s8)
	li		s8, 4
	mul		s8, s7, s8
	addi	s8, s8, 4
	add		a0, s8, a0
	lw		a0, 0(a0)
	call	__builtin_string_length
	addi	a0, a0, 1
	blt		s2, a0, Test_printme__for_body_3
	j		Test_printme__for_merge

Test_printme__for_body_3:
	lw		s1, 0(s1)
	add		s1, s0, s1
	lw		s1, 0(s1)
	add		s1, s8, s1
	lw		a0, 0(s1)
	mv		a1, s5
	call	__builtin_string_ord
	call	__builtin_toString
	la		a1, __str_const_3
	call	__builtin_string_add
	call	__builtin_print
	j		Test_printme__for_step

Test_printme__for_step:
	addi	s5, s5, 2
	j		Test_printme__for_cond_3

Test_printme__for_merge:
	la		a0, __str_const_4
	call	__builtin_println
	j		Test_printme__for_step_2

Test_printme__for_step_2:
	addi	s7, s7, 1
	j		Test_printme__for_cond_2

Test_printme__if_then:
	mv		a1, a2
	mv		a2, s8
	mv		s5, a1
	mv		s5, a2
	j		Test_printme__if_merge

Test_printme__for_step_3:
	addi	s3, s3, 1
	j		Test_printme__for_cond

Test_printme__for_merge_2:
	lw		s9, 12(sp)
	lw		s8, 16(sp)
	lw		s7, 20(sp)
	lw		s5, 24(sp)
	lw		s3, 28(sp)
	lw		s2, 32(sp)
	lw		s1, 36(sp)
	lw		s0, 40(sp)
	lw		ra, 44(sp)
	addi	sp, sp, 48
	jr		ra


	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	lui		s5, %hi(n)
	lw		s5, %lo(n)(s5)
	call	__builtin_getInt
	mv		s9, a0
	la		a0, __str_const_5
	call	__builtin_println
	li		a0, 4
	call	malloc
	mv		s5, a0
	lui		s11, %hi(n)
	sw		s9, %lo(n)(s11)
	mv		a0, s5
	call	Test_Constructor
	lui		s11, %hi(n)
	sw		s9, %lo(n)(s11)
	mv		a0, s5
	call	Test_printme
	addi	s11, s5, 0
	li		a0, 16
	call	malloc
	mv		s5, a0
	li		s9, 3
	sw		s9, 0(s5)
	addi	s9, s5, 4
	addi	s7, s5, 16
	j		main__array_loop_cond

main__array_loop_cond:
	blt		s9, s7, main__array_loop_body
	j		main__array_loop_merge

main__array_loop_merge:
	sw		s5, 0(s11)
	j		main__for_body

main__for_body:
	j		main__for_body

main__array_loop_body:
	li		a0, 16
	call	malloc
	li		s3, 3
	sw		s3, 0(a0)
	sw		a0, 0(s9)
	j		main__array_loop_step

main__array_loop_step:
	addi	s9, s9, 4
	j		main__array_loop_cond


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	lui		a0, %hi(reed)
	lw		a0, %lo(reed)(a0)
	lui		a0, %hi(reed)
	li		t1, 12883127
	sw		t1, %lo(reed)(a0)
	call	_main
	lui		t1, %hi(reed)
	lw		t1, %lo(reed)(t1)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


