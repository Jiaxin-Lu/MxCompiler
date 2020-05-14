	.text

	.globl	qpow
	.p2align	2
	.type	qpow, @function
qpow:
	li		a6, 1
	mv		t1, a1
	mv		t1, a6
	mv		t1, a0
	j		qpow__while_cond

qpow__while_cond:
	li		t1, 0
	bgt		a1, t1, qpow__while_body
	j		qpow__while_merge

qpow__while_body:
	andi	t1, a1, 1
	li		t0, 1
	beq		t1, t0, qpow__if_then
	j		qpow__parallel_copy_

qpow__if_then:
	mul		t1, a6, a0
	rem		a6, t1, a2
	j		qpow__if_merge

qpow__if_merge:
	mul		t1, a0, a0
	rem		a0, t1, a2
	li		t1, 2
	div		a1, a1, t1
	mv		t1, a1
	mv		t1, a6
	mv		t1, a0
	j		qpow__while_cond

qpow__parallel_copy_:
	j		qpow__if_merge

qpow__while_merge:
	mv		a0, a6
	jr		ra


	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	li		a0, 2
	li		a1, 10
	li		a2, 10000
	call	qpow
	call	__builtin_toString
	call	__builtin_println
	li		a0, 0
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


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


