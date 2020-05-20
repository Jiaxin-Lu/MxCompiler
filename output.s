	.text

	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	li		a0, 4
	call	malloc
	addi	a6, a0, 0
	li		t2, 10
	sw		t2, 0(a6)
	mv		a6, t2
	li		t2, 2
	mul		a0, t2, a6
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


