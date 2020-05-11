	.data

	.globl	__str_const_1
__str_const_1:
	.string	"no"

	.globl	__str_const_2
__str_const_2:
	.string	"yes"

	.globl	a
a:
	.zero	4


	.text

	.globl	_main
	.type	_main, @function
_main:
	addi	sp,sp,-16
	sw		ra,12(sp)
	sw		s0,8(sp)
	lw		s0,0(a)
	mv		a0,s0
	call	__builtin_print
	mv		a0,s0
	lw		a1,4(sp)
	call	__builtin_string_add
	call	__builtin_print
	mv		a0,zero
	lw		s0,8(sp)
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra


	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw		ra,12(sp)
	li		a0,4
	call	malloc
	lw		a0,0(a)
	lw		a0,8(sp)
	sw		a0,0(a)
	call	_main
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra


