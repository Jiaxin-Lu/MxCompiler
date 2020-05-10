	.data

	.globl	a
a:
	.zero	4

	.globl	b
b:
	.zero	4


	.text

	.globl	_main
	.type	_main, @function
_main:
	addi	sp,sp,-16
	sw		ra,12(sp)
	lw		a7,0(b)
	lw		a2,0(a)
	add		a0,a2,a7
	call	__builtin_printInt
	mv		a0,zero
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
	li		a0,4
	call	malloc
	lw		a7,0(b)
	lw		a7,0(a)
	li		a7,1
	sw		a7,0(a)
	li		a7,2
	sw		a7,0(b)
	call	_main
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra


