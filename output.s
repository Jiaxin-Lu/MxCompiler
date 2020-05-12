	.data

	.globl	__str_const_1
__str_const_1:
	.string	""

	.globl	__str_const_2
__str_const_2:
	.string	"\n"

	.globl	__str_const_3
__str_const_3:
	.string	""

	.globl	__str_const_4
__str_const_4:
	.string	"-1"

	.globl	__str_const_5
__str_const_5:
	.string	"0"

	.globl	__str_const_6
__str_const_6:
	.string	"11h"


	.text

	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s1, 8(sp)
	sw		s4, 4(sp)
	mv		s4, s5
	li		s1, 0
	j		main__for_cond

main__for_cond:
	li		s5, 10
	blt		s1, s5, main__for_body
	j		main__for_merge

main__for_body:
	la		a0, __str_const_1
	la		a1, __str_const_2
	call	__builtin_string_add
	call	__builtin_print
	j		main__for_step

main__for_step:
	addi	s1, s1, 1
	j		main__for_cond

main__for_merge:
	li		s1, 0
	mv		s5, s1
	mv		s1, s5
	j		main__for_cond_2

main__for_cond_2:
	li		s1, 10
	blt		s5, s1, main__for_body_2
	j		main__for_merge_2

main__for_body_2:
	li		s1, 0
	j		main__for_cond_3

main__for_cond_3:
	li		s5, 10
	blt		s1, s5, main__for_step_2
	j		main__for_step_3

main__for_step_2:
	addi	s1, s1, 1
	j		main__for_cond_3

main__for_step_3:
	addi	s1, s1, 1
	mv		s5, s1
	mv		s1, s5
	j		main__for_cond_2

main__for_merge_2:
	li		s1, 0
	beq		s5, s1, main__if_then
	j		main__if_else

main__if_else:
	la		a0, __str_const_4
	la		a1, __str_const_4
	call	__builtin_string_add
	mv		s1, a0
	call	__builtin_getString
	mv		a1, a0
	mv		a0, s1
	call	__builtin_string_add
	call	__builtin_println
	j		main__while_cond

main__while_cond:
	mv		a0, s5
	call	__builtin_toString
	la		a1, __str_const_5
	call	__builtin_string_eq
	bne		a0, zero, main__while_body
	j		main__while_merge

main__while_merge:
	li		a0, 0
	mv		s5, s4
	lw		s4, 4(sp)
	lw		s1, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

main__while_body:
	la		a0, __str_const_6
	call	__builtin_string_parseInt
	j		main__while_cond

main__if_then:
	la		a0, __str_const_3
	la		a1, __str_const_3
	call	__builtin_string_add
	call	__builtin_println
	j		main__while_cond


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


