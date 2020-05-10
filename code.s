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
	lw		t2,0(s3)
	lw		a5,0(s3)
	add		a0,a5,t2
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
	mv		a5,s3
	sw		a5,8(sp)
	li		a5,4
	mv		a5,a0
	call	malloc
	mv		a0,s3
	li		a5,4
	mv		a5,a0
	call	malloc
	mv		a0,s3
	lw		a5,0(s3)
	lw		a5,0(s3)
	li		a5,1
	sw		a5,0(s3)
	li		a5,2
	sw		a5,0(s3)
	call	_main
	lw		s3,8(sp)
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra


