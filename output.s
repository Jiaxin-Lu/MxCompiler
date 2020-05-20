	.data

	.globl	__str_const_1
__str_const_1:
	.string	" "

	.globl	__str_const_2
__str_const_2:
	.string	" "

	.globl	A
A:
	.zero	4

	.globl	B
B:
	.zero	4

	.globl	C
C:
	.zero	4


	.text

	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s1, 24(sp)
	sw		s3, 20(sp)
	sw		s8, 16(sp)
	sw		s9, 12(sp)
	lui		s8, %hi(C)
	lw		s3, %lo(C)(s8)
	lui		s8, %hi(B)
	lw		s8, %lo(B)(s8)
	lui		s1, %hi(A)
	lw		s1, %lo(A)(s1)
	j		main__while_cond

main__while_cond:
	li		s9, 536870912
	blt		s3, s9, main__lhs_and_then
	j		main__while_merge

main__lhs_and_then:
	li		s9, -536870912
	bgt		s3, s9, main__while_body
	j		main__while_merge

main__while_body:
	sub		s9, s3, s1
	add		s9, s9, s8
	add		a0, s1, s8
	sub		s1, s9, a0
	add		a5, s1, s1
	add		ra, s1, s9
	add		a5, a5, ra
	add		t0, a0, s9
	sub		s1, t0, a0
	add		s9, s1, ra
	sub		t1, a5, s9
	sub		a0, t0, t0
	sub		a0, a0, s1
	sub		a5, ra, s1
	add		a0, a0, a5
	sub		t0, t1, a0
	sub		s1, s9, s9
	sub		s1, t1, s1
	add		s9, t0, s1
	add		a5, a5, a5
	add		a0, a0, a5
	add		s1, a0, s1
	sub		s1, s9, s1
	sub		a5, s3, s1
	add		t1, a5, s8
	add		a0, s1, s8
	sub		s8, t1, a0
	add		s9, s8, s8
	add		s3, s8, t1
	add		s9, s9, s3
	add		s8, a0, t1
	sub		t1, s8, a0
	add		a0, t1, s3
	sub		s9, s9, a0
	sub		s8, s8, s8
	sub		s8, s8, t1
	sub		t0, s3, t1
	add		s3, s8, t0
	sub		t1, s9, s3
	sub		s8, a0, a0
	sub		s8, s9, s8
	add		a0, t1, s8
	add		s9, t0, t0
	add		s3, s3, s9
	add		s8, s3, s8
	sub		s8, a0, s8
	add		a0, a5, s8
	add		a5, s1, s8
	sub		s9, a0, a5
	add		s3, s9, s9
	add		ra, s9, a0
	add		s3, s3, ra
	add		a0, a5, a0
	sub		s9, a0, a5
	add		t1, s9, ra
	sub		t0, s3, t1
	sub		s3, a0, a0
	sub		s3, s3, s9
	sub		s9, ra, s9
	add		a0, s3, s9
	sub		a5, t0, a0
	sub		s3, t1, t1
	sub		t1, t0, s3
	add		s3, a5, t1
	add		s9, s9, s9
	add		s9, a0, s9
	add		s9, s9, t1
	sub		s3, s3, s9
	j		main__while_cond

main__while_merge:
	mv		a0, s1
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	mv		s9, a0
	mv		a0, s8
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s9
	call	__builtin_string_add
	la		a1, __str_const_2
	call	__builtin_string_add
	mv		s9, a0
	mv		a0, s3
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s9
	call	__builtin_string_add
	call	__builtin_println
	lui		s9, %hi(A)
	sw		s1, %lo(A)(s9)
	lui		s1, %hi(B)
	sw		s8, %lo(B)(s1)
	lui		s8, %hi(C)
	sw		s3, %lo(C)(s8)
	li		a0, 0
	lw		s9, 12(sp)
	lw		s8, 16(sp)
	lw		s3, 20(sp)
	lw		s1, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	lui		a0, %hi(A)
	li		a5, 1
	sw		a5, %lo(A)(a0)
	lui		a0, %hi(B)
	li		a5, 1
	sw		a5, %lo(B)(a0)
	lui		a5, %hi(C)
	li		a0, 1
	sw		a0, %lo(C)(a5)
	call	_main
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


