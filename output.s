	.data

	.globl	__str_const_1
__str_const_1:
	.string	": "

	.globl	root
root:
	.zero	4

	.globl	MAX
MAX:
	.zero	4

	.globl	MaxRandInt
MaxRandInt:
	.zero	4

	.globl	seed
seed:
	.zero	4


	.text

	.globl	insertImpl
	.p2align	2
	.type	insertImpl, @function
insertImpl:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s0, 24(sp)
	sw		s2, 20(sp)
	sw		s8, 16(sp)
	sw		s9, 12(sp)
	sw		s10, 8(sp)
	sw		s11, 4(sp)
	mv		s9, a0
	mv		s8, a1
	mv		s0, a2
	mv		s10, a3
	li		s2, 0
	beq		s9, s2, insertImpl_split_block
	j		insertImpl__if_merge

insertImpl__if_merge:
	addi	s8, s9, 8
	lw		s0, 0(s8)
	beq		s0, s10, insertImpl__if_then_2
	j		insertImpl__if_merge_2

insertImpl__if_merge_2:
	li		s0, 0
	lw		s8, 0(s8)
	blt		s8, s10, insertImpl__if_then
	j		insertImpl__if_merge_3

insertImpl__if_then:
	li		s0, 1
	j		insertImpl__if_merge_3

insertImpl__if_merge_3:
	addi	s2, s9, 4
	lw		s8, 0(s2)
	li		s11, 4
	mul		s0, s0, s11
	addi	s11, s0, 4
	add		s0, s11, s8
	lw		s8, 0(s0)
	li		s0, 0
	beq		s8, s0, insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s9, s8, 8
	lw		s0, 0(s9)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s0, s8, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_exit:
	lw		s11, 4(sp)
	lw		s10, 8(sp)
	lw		s9, 12(sp)
	lw		s8, 16(sp)
	lw		s2, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s0, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s2, s8, 4
	lw		s11, 0(s2)
	li		s9, 4
	mul		s0, s0, s9
	addi	s0, s0, 4
	add		s9, s0, s11
	lw		s9, 0(s9)
	li		s11, 0
	beq		s9, s11, insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s11, a0
	addi	s9, s11, 4
	li		ra, 2
	li		t1, 4
	mul		ra, ra, t1
	addi	a0, ra, 4
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s9)
	addi	ra, s11, 8
	sw		s10, 0(ra)
	addi	s10, s11, 12
	li		ra, 1
	sw		ra, 0(s10)
	addi	s10, s11, 0
	sw		s8, 0(s10)
	lw		s10, 0(s9)
	li		ra, 0
	li		s8, 4
	mul		s8, ra, s8
	addi	s8, s8, 4
	add		s8, s8, s10
	li		s10, 0
	sw		s10, 0(s8)
	lw		s9, 0(s9)
	li		s8, 1
	li		s10, 4
	mul		s10, s8, s10
	addi	s10, s10, 4
	add		s9, s10, s9
	li		s10, 0
	sw		s10, 0(s9)
	lw		s10, 0(s2)
	add		s0, s0, s10
	sw		s11, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s8, s9, 8
	lw		s0, 0(s8)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s0, 0
	lw		s8, 0(s8)
	blt		s8, s10, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s8, s9, 4
	lw		s11, 0(s8)
	li		s2, 4
	mul		s0, s0, s2
	addi	s2, s0, 4
	add		s0, s2, s11
	lw		a1, 0(s0)
	li		s0, 0
	beq		a1, s0, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s9, a1, 8
	lw		s0, 0(s9)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		a2, 0
	lw		s0, 0(s9)
	blt		s0, s10, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		a2, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s0, a1, 4
	lw		s0, 0(s0)
	li		s9, 4
	mul		s9, a2, s9
	addi	s9, s9, 4
	add		s0, s9, s0
	lw		a0, 0(s0)
	mv		a3, s10
	call	insertImpl
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s10, a1, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s11, s0, 4
	li		ra, 2
	li		t1, 4
	mul		ra, ra, t1
	addi	a0, ra, 4
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s11)
	addi	ra, s0, 8
	sw		s10, 0(ra)
	addi	ra, s0, 12
	li		s10, 1
	sw		s10, 0(ra)
	addi	s10, s0, 0
	sw		s9, 0(s10)
	lw		s9, 0(s11)
	li		ra, 0
	li		s10, 4
	mul		s10, ra, s10
	addi	s10, s10, 4
	add		s10, s10, s9
	li		s9, 0
	sw		s9, 0(s10)
	lw		s9, 0(s11)
	li		s10, 1
	li		s11, 4
	mul		s10, s10, s11
	addi	s10, s10, 4
	add		s10, s10, s9
	li		s9, 0
	sw		s9, 0(s10)
	lw		s10, 0(s8)
	add		s10, s2, s10
	sw		s0, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s10, s9, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s8, s0, 4
	li		ra, 2
	li		t1, 4
	mul		ra, ra, t1
	addi	a0, ra, 4
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s8)
	addi	ra, s0, 8
	sw		s10, 0(ra)
	addi	s10, s0, 12
	li		ra, 1
	sw		ra, 0(s10)
	addi	s10, s0, 0
	sw		s9, 0(s10)
	lw		s9, 0(s8)
	li		ra, 0
	li		s10, 4
	mul		s10, ra, s10
	addi	s10, s10, 4
	add		s9, s10, s9
	li		s10, 0
	sw		s10, 0(s9)
	lw		s9, 0(s8)
	li		s8, 1
	li		s10, 4
	mul		s10, s8, s10
	addi	s10, s10, 4
	add		s9, s10, s9
	li		s10, 0
	sw		s10, 0(s9)
	lw		s10, 0(s2)
	add		s10, s11, s10
	sw		s0, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl__if_then_2:
	addi	s10, s9, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s9, a0
	addi	s2, s9, 4
	li		s11, 2
	li		ra, 4
	mul		s11, s11, ra
	addi	a0, s11, 4
	call	malloc
	li		s11, 2
	sw		s11, 0(a0)
	sw		a0, 0(s2)
	addi	s11, s9, 8
	sw		s10, 0(s11)
	addi	s11, s9, 12
	li		s10, 1
	sw		s10, 0(s11)
	addi	s10, s9, 0
	sw		s8, 0(s10)
	lw		s11, 0(s2)
	li		s10, 0
	li		ra, 4
	mul		s10, s10, ra
	addi	s10, s10, 4
	add		s10, s10, s11
	li		s11, 0
	sw		s11, 0(s10)
	lw		s11, 0(s2)
	li		s10, 1
	li		s2, 4
	mul		s10, s10, s2
	addi	s10, s10, 4
	add		s2, s10, s11
	li		s10, 0
	sw		s10, 0(s2)
	addi	s10, s8, 4
	lw		s10, 0(s10)
	li		s8, 4
	mul		s0, s0, s8
	addi	s0, s0, 4
	add		s0, s0, s10
	sw		s9, 0(s0)
	li		a0, 0
	j		insertImpl_exit


	.globl	findLargest
	.p2align	2
	.type	findLargest, @function
findLargest:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	addi	t2, a0, 4
	lw		ra, 0(t2)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	li		t1, 0
	beq		ra, t1, findLargest_exit
	j		findLargest__if_merge

findLargest__if_merge:
	lw		ra, 0(t2)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t1, 0(ra)
	addi	t1, t1, 8
	lw		t2, 0(t1)
	li		t1, 0
	beq		t2, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	li		t2, 0
	beq		ra, t2, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	li		t2, 0
	beq		ra, t2, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_exit:
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	li		t2, 0
	beq		ra, t2, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t1, 0(ra)
	addi	t1, t1, 8
	lw		t1, 0(t1)
	li		t2, 0
	beq		t1, t2, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		t2, 0(ra)
	li		ra, 0
	beq		t2, ra, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t1, 0(ra)
	addi	t1, t1, 8
	lw		t1, 0(t1)
	li		t2, 0
	beq		t1, t2, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t2, a0, 4
	lw		ra, 0(t2)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	li		t1, 0
	beq		ra, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		ra, 0(t2)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		t2, 0(ra)
	li		ra, 0
	beq		t2, ra, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t1, 0(ra)
	addi	t1, t1, 8
	lw		t1, 0(t1)
	li		t2, 0
	beq		t1, t2, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t1, 0(ra)
	addi	t1, t1, 8
	lw		t2, 0(t1)
	li		t1, 0
	beq		t2, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t1, 0(ra)
	addi	t1, t1, 8
	lw		t1, 0(t1)
	li		t2, 0
	beq		t1, t2, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	li		t2, 0
	beq		ra, t2, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	li		t2, 0
	beq		ra, t2, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(t1)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t1, 0(ra)
	addi	t1, t1, 8
	lw		t2, 0(t1)
	li		t1, 0
	beq		t2, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	call	findLargest
	j		findLargest_exit


	.globl	eraseImpl
	.p2align	2
	.type	eraseImpl, @function
eraseImpl:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s0, 24(sp)
	sw		s3, 20(sp)
	sw		s6, 16(sp)
	sw		s9, 12(sp)
	sw		s10, 8(sp)
	mv		s0, a0
	mv		s9, a1
	mv		s6, a2
	mv		s10, a3
	lui		s3, %hi(root)
	lw		s3, %lo(root)(s3)
	li		ra, 0
	beq		s0, ra, eraseImpl__if_then
	j		eraseImpl__if_merge

eraseImpl__if_then:
	li		a0, 0
	j		eraseImpl_exit

eraseImpl_exit:
	lui		s0, %hi(root)
	sw		s3, %lo(root)(s0)
	lw		s10, 8(sp)
	lw		s9, 12(sp)
	lw		s6, 16(sp)
	lw		s3, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

eraseImpl__if_merge:
	addi	t1, s0, 8
	lw		ra, 0(t1)
	bgt		ra, s10, eraseImpl__if_then_14
	j		eraseImpl__if_merge_2

eraseImpl__if_then_14:
	addi	s6, s0, 4
	lw		s6, 0(s6)
	li		ra, 0
	li		s9, 4
	mul		s9, ra, s9
	addi	s9, s9, 4
	add		s6, s9, s6
	lw		a0, 0(s6)
	lui		s6, %hi(root)
	sw		s3, %lo(root)(s6)
	mv		a1, s0
	li		a2, 0
	mv		a3, s10
	call	eraseImpl
	lui		s0, %hi(root)
	lw		s3, %lo(root)(s0)
	j		eraseImpl_exit

eraseImpl__if_merge_2:
	lw		ra, 0(t1)
	blt		ra, s10, eraseImpl__if_then_2
	j		eraseImpl__if_merge_3

eraseImpl__if_then_2:
	addi	s6, s0, 4
	lw		s9, 0(s6)
	li		ra, 1
	li		s6, 4
	mul		s6, ra, s6
	addi	s6, s6, 4
	add		s6, s6, s9
	lw		a0, 0(s6)
	lui		s6, %hi(root)
	sw		s3, %lo(root)(s6)
	mv		a1, s0
	li		a2, 1
	mv		a3, s10
	call	eraseImpl
	lui		s0, %hi(root)
	lw		s3, %lo(root)(s0)
	j		eraseImpl_exit

eraseImpl__if_merge_3:
	addi	t1, s0, 12
	lw		ra, 0(t1)
	addi	ra, ra, -1
	sw		ra, 0(t1)
	mv		t1, ra
	li		ra, 0
	bgt		t1, ra, eraseImpl__if_then_3
	j		eraseImpl__if_merge_4

eraseImpl__if_then_3:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_merge_4:
	addi	t1, s0, 4
	lw		t5, 0(t1)
	li		ra, 0
	li		t2, 4
	mul		ra, ra, t2
	addi	t2, ra, 4
	add		ra, t2, t5
	lw		ra, 0(ra)
	li		t5, 0
	beq		ra, t5, eraseImpl__if_then_4
	j		eraseImpl__if_merge_8

eraseImpl__if_merge_8:
	lw		ra, 0(t1)
	add		ra, t2, ra
	lw		a0, 0(ra)
	addi	t5, a0, 4
	lw		t1, 0(t5)
	li		ra, 1
	li		t2, 4
	mul		ra, ra, t2
	addi	t2, ra, 4
	add		ra, t2, t1
	lw		ra, 0(ra)
	li		t1, 0
	beq		ra, t1, eraseImpl_split_block
	j		eraseImpl_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_split_block:
	addi	ra, s3, 8
	lw		ra, 0(ra)
	beq		s10, ra, eraseImpl__if_then_8
	j		eraseImpl__if_merge_9

eraseImpl__if_then_8:
	mv		s3, a0
	j		eraseImpl__if_merge_9

eraseImpl__if_merge_9:
	addi	t1, a0, 8
	addi	s10, s0, 4
	lw		s10, 0(s10)
	addi	s10, s10, 4
	lw		s10, 0(s10)
	addi	ra, s10, 8
	lw		s10, 0(t1)
	lw		ra, 0(ra)
	bne		s10, ra, eraseImpl__if_then_12
	j		eraseImpl__if_merge_10

eraseImpl__if_then_12:
	addi	t2, a0, 0
	lw		s10, 0(t2)
	addi	s10, s10, 4
	lw		s10, 0(s10)
	addi	t1, s10, 8
	addi	ra, a0, 4
	lw		s10, 0(ra)
	addi	s10, s10, 4
	lw		s10, 0(s10)
	sw		s10, 0(t1)
	lw		s10, 0(ra)
	addi	s10, s10, 4
	lw		t1, 0(s10)
	li		s10, 0
	bne		t1, s10, eraseImpl__if_then_13
	j		eraseImpl__if_merge_10

eraseImpl__if_then_13:
	lw		s10, 0(ra)
	addi	s10, s10, 4
	lw		s10, 0(s10)
	addi	s10, s10, 0
	lw		ra, 0(t2)
	sw		ra, 0(s10)
	j		eraseImpl__if_merge_10

eraseImpl__if_merge_10:
	li		s10, 0
	bne		s9, s10, eraseImpl__if_then_11
	j		eraseImpl__if_merge_11

eraseImpl__if_merge_11:
	addi	s10, a0, 0
	sw		s9, 0(s10)
	addi	s10, a0, 4
	lw		s10, 0(s10)
	li		s6, 1
	li		s9, 4
	mul		s6, s6, s9
	addi	s9, s6, 4
	add		s10, s9, s10
	addi	ra, s0, 4
	lw		s6, 0(ra)
	add		s6, s9, s6
	lw		s6, 0(s6)
	sw		s6, 0(s10)
	lw		s10, 0(ra)
	add		s10, s9, s10
	lw		s6, 0(s10)
	li		s10, 0
	bne		s6, s10, eraseImpl__if_then_10
	j		eraseImpl__if_merge_12

eraseImpl__if_merge_12:
	addi	s10, a0, 8
	addi	ra, s0, 4
	lw		s6, 0(ra)
	li		s9, 0
	li		s0, 4
	mul		s0, s9, s0
	addi	s9, s0, 4
	add		s0, s9, s6
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		s10, 0(s10)
	lw		s0, 0(s0)
	bne		s10, s0, eraseImpl__if_then_9
	j		eraseImpl__if_merge_13

eraseImpl__if_then_9:
	addi	s0, a0, 4
	lw		s0, 0(s0)
	add		s10, s9, s0
	lw		s0, 0(ra)
	add		s0, s9, s0
	lw		s0, 0(s0)
	sw		s0, 0(s10)
	lw		s0, 0(ra)
	add		s0, s9, s0
	lw		s0, 0(s0)
	addi	s0, s0, 0
	sw		a0, 0(s0)
	j		eraseImpl__if_merge_13

eraseImpl__if_merge_13:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_then_10:
	lw		s10, 0(ra)
	add		s10, s9, s10
	lw		s10, 0(s10)
	addi	s10, s10, 0
	sw		a0, 0(s10)
	j		eraseImpl__if_merge_12

eraseImpl__if_then_11:
	addi	s10, s9, 4
	lw		s10, 0(s10)
	li		ra, 4
	mul		s6, s6, ra
	addi	s6, s6, 4
	add		s10, s6, s10
	sw		a0, 0(s10)
	j		eraseImpl__if_merge_11

eraseImpl_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t5)
	add		ra, t2, ra
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t1, 0(ra)
	add		t1, t2, t1
	lw		t5, 0(t1)
	li		t1, 0
	beq		t5, t1, eraseImpl_split_block
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(ra)
	add		ra, t2, ra
	lw		a0, 0(ra)
	addi	t5, a0, 4
	lw		ra, 0(t5)
	add		ra, t2, ra
	lw		ra, 0(ra)
	li		t1, 0
	beq		ra, t1, eraseImpl_split_block
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t5)
	add		ra, t2, ra
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t1, 0(ra)
	add		t1, t2, t1
	lw		t1, 0(t1)
	li		t5, 0
	beq		t1, t5, eraseImpl_split_block
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge:
	lw		ra, 0(ra)
	add		ra, t2, ra
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	add		ra, t2, ra
	lw		ra, 0(ra)
	li		t5, 0
	beq		ra, t5, eraseImpl_split_block
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t1)
	add		ra, t2, ra
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	add		ra, t2, ra
	lw		ra, 0(ra)
	li		t5, 0
	beq		ra, t5, eraseImpl_split_block
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(t1)
	add		ra, t2, ra
	lw		a0, 0(ra)
	addi	t1, a0, 4
	lw		ra, 0(t1)
	add		ra, t2, ra
	lw		t5, 0(ra)
	li		ra, 0
	beq		t5, ra, eraseImpl_split_block
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t1)
	add		ra, t2, ra
	lw		a0, 0(ra)
	call	findLargest
	j		eraseImpl_split_block

eraseImpl__if_then_4:
	li		ra, 0
	bne		s9, ra, eraseImpl__if_then_5
	j		eraseImpl__if_merge_5

eraseImpl__if_merge_5:
	addi	ra, s0, 4
	lw		t2, 0(ra)
	li		s6, 1
	li		t1, 4
	mul		s6, s6, t1
	addi	t1, s6, 4
	add		s6, t1, t2
	lw		s6, 0(s6)
	li		t2, 0
	bne		s6, t2, eraseImpl__if_then_7
	j		eraseImpl__if_merge_6

eraseImpl__if_then_7:
	lw		s6, 0(ra)
	add		s6, t1, s6
	lw		s6, 0(s6)
	addi	s6, s6, 0
	sw		s9, 0(s6)
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_6:
	addi	s6, s3, 8
	lw		s6, 0(s6)
	beq		s10, s6, eraseImpl__if_then_6
	j		eraseImpl__if_merge_7

eraseImpl__if_merge_7:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_then_6:
	addi	s0, s0, 4
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		s3, 0(s0)
	j		eraseImpl__if_merge_7

eraseImpl__if_then_5:
	addi	ra, s9, 4
	lw		t2, 0(ra)
	li		ra, 4
	mul		s6, s6, ra
	addi	s6, s6, 4
	add		ra, s6, t2
	lw		t1, 0(t1)
	li		t2, 1
	li		s6, 4
	mul		s6, t2, s6
	addi	s6, s6, 4
	add		s6, s6, t1
	lw		s6, 0(s6)
	sw		s6, 0(ra)
	j		eraseImpl__if_merge_5


	.globl	printTree
	.p2align	2
	.type	printTree, @function
printTree:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s0, 24(sp)
	sw		s1, 20(sp)
	sw		s2, 16(sp)
	sw		s4, 12(sp)
	sw		s6, 8(sp)
	sw		s9, 4(sp)
	mv		s0, a0
	li		s1, 0
	beq		s0, s1, printTree_exit
	j		printTree__if_merge

printTree_exit:
	lw		s9, 4(sp)
	lw		s6, 8(sp)
	lw		s4, 12(sp)
	lw		s2, 16(sp)
	lw		s1, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

printTree__if_merge:
	addi	s1, s0, 4
	lw		s9, 0(s1)
	li		s1, 0
	li		s6, 4
	mul		s1, s1, s6
	addi	ra, s1, 4
	add		s1, ra, s9
	lw		s1, 0(s1)
	li		s6, 0
	beq		s1, s6, printTree_split_block_2
	j		printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s6, s1, 4
	lw		s6, 0(s6)
	add		s6, ra, s6
	lw		s9, 0(s6)
	li		s6, 0
	beq		s9, s6, printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree__if_merge

printTree_fake_fake_printTree_2_printTree__if_merge:
	addi	s6, s9, 4
	lw		s6, 0(s6)
	add		s6, ra, s6
	lw		s4, 0(s6)
	li		s6, 0
	beq		s4, s6, printTree_fake_fake_printTree_2_printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_2_printTree_split_block:
	addi	s6, s9, 8
	lw		a0, 0(s6)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	mv		s6, a0
	addi	s4, s9, 12
	lw		a0, 0(s4)
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s6
	call	__builtin_string_add
	call	__builtin_println
	addi	s6, s9, 4
	lw		s2, 0(s6)
	li		s9, 1
	li		s6, 4
	mul		s6, s9, s6
	addi	s4, s6, 4
	add		s6, s4, s2
	lw		s9, 0(s6)
	li		s6, 0
	beq		s9, s6, printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_split_block:
	addi	s6, s1, 8
	lw		a0, 0(s6)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	mv		s6, a0
	addi	s9, s1, 12
	lw		a0, 0(s9)
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s6
	call	__builtin_string_add
	call	__builtin_println
	addi	s1, s1, 4
	lw		s1, 0(s1)
	li		s6, 1
	li		s9, 4
	mul		s6, s6, s9
	addi	s6, s6, 4
	add		s1, s6, s1
	lw		a0, 0(s1)
	call	printTree
	j		printTree_split_block_2

printTree_split_block_2:
	addi	s1, s0, 8
	lw		a0, 0(s1)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	mv		s1, a0
	addi	s6, s0, 12
	lw		a0, 0(s6)
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s1
	call	__builtin_string_add
	call	__builtin_println
	addi	s0, s0, 4
	lw		s6, 0(s0)
	li		s1, 1
	li		s0, 4
	mul		s0, s1, s0
	addi	s0, s0, 4
	add		s1, s0, s6
	lw		s6, 0(s1)
	li		s1, 0
	beq		s6, s1, printTree_exit
	j		printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s1, s6, 4
	lw		s4, 0(s1)
	li		s2, 0
	li		s9, 4
	mul		s9, s2, s9
	addi	s9, s9, 4
	add		s9, s9, s4
	lw		a0, 0(s9)
	call	printTree
	addi	s9, s6, 8
	lw		a0, 0(s9)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	mv		s9, a0
	addi	s6, s6, 12
	lw		a0, 0(s6)
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s9
	call	__builtin_string_add
	call	__builtin_println
	lw		s1, 0(s1)
	add		s0, s0, s1
	lw		a0, 0(s0)
	call	printTree
	j		printTree_exit

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s6, s9, 4
	lw		s2, 0(s6)
	li		t1, 0
	li		ra, 4
	mul		ra, t1, ra
	addi	ra, ra, 4
	add		s2, ra, s2
	lw		a0, 0(s2)
	call	printTree
	addi	s2, s9, 8
	lw		a0, 0(s2)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	mv		s2, a0
	addi	s9, s9, 12
	lw		a0, 0(s9)
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s2
	call	__builtin_string_add
	call	__builtin_println
	lw		s6, 0(s6)
	add		s6, s4, s6
	lw		a0, 0(s6)
	call	printTree
	j		printTree_split_block

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s6, s4, 4
	lw		s2, 0(s6)
	add		s2, ra, s2
	lw		a0, 0(s2)
	call	printTree
	addi	s2, s4, 8
	lw		a0, 0(s2)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	mv		s2, a0
	addi	s4, s4, 12
	lw		a0, 0(s4)
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s2
	call	__builtin_string_add
	call	__builtin_println
	lw		s6, 0(s6)
	li		s4, 1
	li		s2, 4
	mul		s4, s4, s2
	addi	s4, s4, 4
	add		s6, s4, s6
	lw		a0, 0(s6)
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block


	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -48
	sw		ra, 44(sp)
	sw		s0, 40(sp)
	sw		s1, 36(sp)
	sw		s3, 32(sp)
	sw		s4, 28(sp)
	sw		s5, 24(sp)
	sw		s6, 20(sp)
	sw		s7, 16(sp)
	sw		s8, 12(sp)
	sw		s9, 8(sp)
	sw		s10, 4(sp)
	lui		s0, %hi(MaxRandInt)
	lw		s5, %lo(MaxRandInt)(s0)
	lui		s0, %hi(root)
	lw		s3, %lo(root)(s0)
	lui		s0, %hi(MAX)
	lw		s8, %lo(MAX)(s0)
	call	__builtin_getInt
	mv		s7, a0
	li		s0, 10
	div		s1, s5, s0
	li		s0, 8
	mul		s0, s0, s1
	li		s1, 0
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations__for_cond:
	li		s10, 50000
	blt		s1, s10, main_fake_generateOperations_split_block_9
	j		main_split_block

main_fake_generateOperations_split_block_9:
	slli	s10, s7, 13
	xor		s10, s7, s10
	li		s7, 1
	slli	s6, s7, 31
	xori	s7, s6, -1
	and		s7, s10, s7
	srai	s10, s7, 17
	xor		s10, s7, s10
	slli	s7, s10, 5
	xor		s7, s10, s7
	xori	s10, s6, -1
	and		s7, s7, s10
	rem		s10, s7, s8
	slli	s9, s7, 13
	xor		s7, s7, s9
	xori	s9, s6, -1
	and		s9, s7, s9
	srai	s7, s9, 17
	xor		s7, s9, s7
	slli	s9, s7, 5
	xor		s9, s7, s9
	xori	s7, s6, -1
	and		s7, s9, s7
	blt		s7, s0, main_fake_generateOperations_fake_randOp__if_then_3
	j		main_fake_generateOperations_fake_randOp__if_merge_3

main_fake_generateOperations_fake_randOp__if_then_3:
	li		s6, 1
	j		main_fake_generateOperations_split_block_10

main_fake_generateOperations_split_block_10:
	li		s9, 1
	beq		s6, s9, main_fake_generateOperations__if_then_3
	j		main_fake_generateOperations__if_else_3

main_fake_generateOperations__if_then_3:
	li		s6, 0
	bne		s3, s6, main_fake_generateOperations_fake_insert__if_then_3
	j		main_fake_generateOperations_fake_insert_split_block_3

main_fake_generateOperations_fake_insert__if_then_3:
	li		s6, 0
	beq		s3, s6, main_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_7

main_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s9, s3, 8
	lw		s6, 0(s9)
	beq		s6, s10, main_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_8

main_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	li		a2, 0
	lw		s6, 0(s9)
	blt		s6, s10, main_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s6, s3, 4
	lw		s9, 0(s6)
	li		s6, 4
	mul		s6, a2, s6
	addi	s6, s6, 4
	add		s6, s6, s9
	lw		a0, 0(s6)
	mv		a1, s3
	mv		a3, s10
	call	insertImpl
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations__for_step_3:
	addi	s1, s1, 1
	j		main_fake_generateOperations__for_cond

main_fake_fake_insertImpl_1_insertImpl__if_then_6:
	li		a2, 1
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	s10, s3, 12
	lw		s6, 0(s10)
	addi	s6, s6, 1
	sw		s6, 0(s10)
	j		main_fake_generateOperations__for_step_3

main_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s9, s6, 4
	li		a0, 12
	call	malloc
	li		s4, 2
	sw		s4, 0(a0)
	sw		a0, 0(s9)
	addi	s4, s6, 8
	sw		s10, 0(s4)
	addi	s10, s6, 12
	li		s4, 1
	sw		s4, 0(s10)
	addi	s4, s6, 0
	li		s10, 0
	sw		s10, 0(s4)
	lw		s10, 0(s9)
	addi	s10, s10, 4
	li		s4, 0
	sw		s4, 0(s10)
	lw		s10, 0(s9)
	addi	s10, s10, 8
	li		s9, 0
	sw		s9, 0(s10)
	li		s10, 4
	lw		s10, 0(s10)
	addi	s10, s10, 0
	sw		s6, 0(s10)
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations_fake_insert_split_block_3:
	li		a0, 16
	call	malloc
	mv		s3, a0
	addi	s6, s3, 4
	li		a0, 12
	call	malloc
	li		s9, 2
	sw		s9, 0(a0)
	sw		a0, 0(s6)
	addi	s9, s3, 8
	sw		s10, 0(s9)
	addi	s10, s3, 12
	li		s9, 1
	sw		s9, 0(s10)
	addi	s9, s3, 0
	li		s10, 0
	sw		s10, 0(s9)
	lw		s10, 0(s6)
	addi	s10, s10, 4
	li		s9, 0
	sw		s9, 0(s10)
	lw		s10, 0(s6)
	addi	s6, s10, 8
	li		s10, 0
	sw		s10, 0(s6)
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations__if_else_3:
	li		s6, 0
	beq		s3, s6, main_fake_generateOperations__for_step_3
	j		main_fake_generateOperations_fake_erase__if_merge_3

main_fake_generateOperations_fake_erase__if_merge_3:
	lui		s6, %hi(root)
	sw		s3, %lo(root)(s6)
	mv		a0, s3
	li		a1, 0
	li		a2, -1
	mv		a3, s10
	call	eraseImpl
	lui		s3, %hi(root)
	lw		s3, %lo(root)(s3)
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations_fake_randOp__if_merge_3:
	li		s6, 2
	j		main_fake_generateOperations_split_block_10

main_split_block:
	li		s0, 10
	div		s1, s5, s0
	li		s0, 2
	mul		s4, s0, s1
	li		s0, 2
	li		s1, 50000
	mul		s0, s0, s1
	sw		s0, 0(sp)
	li		s0, 0
	mv		s6, s0
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations__for_cond_2:
	lw		s0, 0(sp)
	blt		s6, s0, main_fake_generateOperations_split_block_5
	j		main_split_block_2

main_fake_generateOperations_split_block_5:
	slli	s0, s7, 13
	xor		s0, s7, s0
	li		s7, 1
	slli	s1, s7, 31
	xori	s7, s1, -1
	and		s0, s0, s7
	srai	s7, s0, 17
	xor		s0, s0, s7
	slli	s7, s0, 5
	xor		s7, s0, s7
	xori	s0, s1, -1
	and		s7, s7, s0
	rem		s9, s7, s8
	slli	s0, s7, 13
	xor		s7, s7, s0
	xori	s0, s1, -1
	and		s0, s7, s0
	srai	s7, s0, 17
	xor		s0, s0, s7
	slli	s7, s0, 5
	xor		s0, s0, s7
	xori	s7, s1, -1
	and		s0, s0, s7
	mv		s7, s0
	blt		s0, s4, main_fake_generateOperations_fake_randOp__if_then_2
	j		main_fake_generateOperations_fake_randOp__if_merge_2

main_fake_generateOperations_fake_randOp__if_merge_2:
	li		s0, 2
	j		main_fake_generateOperations_split_block_6

main_fake_generateOperations_split_block_6:
	li		s1, 1
	beq		s0, s1, main_fake_generateOperations__if_then_2
	j		main_fake_generateOperations__if_else_2

main_fake_generateOperations__if_then_2:
	li		s0, 0
	bne		s3, s0, main_fake_generateOperations_fake_insert__if_then_2
	j		main_fake_generateOperations_fake_insert_split_block_2

main_fake_generateOperations_fake_insert_split_block_2:
	li		a0, 16
	call	malloc
	mv		s3, a0
	addi	s0, s3, 4
	li		s10, 2
	li		s1, 4
	mul		s1, s10, s1
	addi	a0, s1, 4
	call	malloc
	li		s1, 2
	sw		s1, 0(a0)
	sw		a0, 0(s0)
	addi	s1, s3, 8
	sw		s9, 0(s1)
	addi	s1, s3, 12
	li		s10, 1
	sw		s10, 0(s1)
	addi	s10, s3, 0
	li		s1, 0
	sw		s1, 0(s10)
	lw		s10, 0(s0)
	li		s9, 0
	li		s1, 4
	mul		s1, s9, s1
	addi	s1, s1, 4
	add		s10, s1, s10
	li		s1, 0
	sw		s1, 0(s10)
	lw		s10, 0(s0)
	li		s0, 1
	li		s1, 4
	mul		s0, s0, s1
	addi	s0, s0, 4
	add		s1, s0, s10
	li		s0, 0
	sw		s0, 0(s1)
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations__for_step_2:
	addi	s0, s6, 1
	mv		s6, s0
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations_fake_insert__if_then_2:
	li		s0, 0
	addi	s10, s0, -1
	li		s0, 0
	beq		s3, s0, main_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_4

main_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s1, s3, 8
	lw		s0, 0(s1)
	beq		s0, s9, main_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_5

main_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	li		a2, 0
	lw		s0, 0(s1)
	blt		s0, s9, main_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s0, s3, 4
	lw		s1, 0(s0)
	li		s0, 4
	mul		s0, a2, s0
	addi	s0, s0, 4
	add		s0, s0, s1
	lw		a0, 0(s0)
	mv		a1, s3
	mv		a3, s9
	call	insertImpl
	j		main_fake_generateOperations__for_step_2

main_fake_fake_insertImpl_1_insertImpl__if_then_3:
	li		a2, 1
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_then_4:
	addi	s1, s3, 12
	lw		s0, 0(s1)
	addi	s0, s0, 1
	sw		s0, 0(s1)
	j		main_fake_generateOperations__for_step_2

main_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s1, s0, 4
	li		t1, 2
	li		ra, 4
	mul		ra, t1, ra
	addi	a0, ra, 4
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s1)
	addi	ra, s0, 8
	sw		s9, 0(ra)
	addi	s9, s0, 12
	li		ra, 1
	sw		ra, 0(s9)
	addi	s9, s0, 0
	li		ra, 0
	sw		ra, 0(s9)
	lw		ra, 0(s1)
	li		s9, 0
	li		t1, 4
	mul		s9, s9, t1
	addi	s9, s9, 4
	add		s9, s9, ra
	li		ra, 0
	sw		ra, 0(s9)
	lw		ra, 0(s1)
	li		s1, 1
	li		s9, 4
	mul		s1, s1, s9
	addi	s1, s1, 4
	add		s9, s1, ra
	li		s1, 0
	sw		s1, 0(s9)
	li		s1, 0
	addi	s1, s1, 4
	lw		s9, 0(s1)
	li		s1, 4
	mul		s1, s10, s1
	addi	s1, s1, 4
	add		s1, s1, s9
	sw		s0, 0(s1)
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations__if_else_2:
	li		s0, 0
	beq		s3, s0, main_fake_generateOperations__for_step_2
	j		main_fake_generateOperations_fake_erase__if_merge_2

main_fake_generateOperations_fake_erase__if_merge_2:
	li		s0, 1
	sub		a2, zero, s0
	lui		s0, %hi(root)
	sw		s3, %lo(root)(s0)
	mv		a0, s3
	li		a1, 0
	mv		a3, s9
	call	eraseImpl
	lui		s0, %hi(root)
	lw		s3, %lo(root)(s0)
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations_fake_randOp__if_then_2:
	li		s0, 1
	j		main_fake_generateOperations_split_block_6

main_split_block_2:
	li		s0, 10
	div		s1, s5, s0
	li		s0, 4
	mul		s1, s0, s1
	li		s10, 0
	mv		s0, s3
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations__for_cond_3:
	li		s3, 50000
	blt		s10, s3, main_fake_generateOperations_split_block
	j		main_split_block_3

main_fake_generateOperations_split_block:
	slli	s3, s7, 13
	xor		s3, s7, s3
	li		s7, 1
	slli	s6, s7, 31
	xori	s7, s6, -1
	and		s3, s3, s7
	srai	s7, s3, 17
	xor		s3, s3, s7
	slli	s7, s3, 5
	xor		s3, s3, s7
	xori	s7, s6, -1
	and		s9, s3, s7
	rem		s3, s9, s8
	slli	s7, s9, 13
	xor		s9, s9, s7
	xori	s7, s6, -1
	and		s9, s9, s7
	srai	s7, s9, 17
	xor		s7, s9, s7
	slli	s9, s7, 5
	xor		s7, s7, s9
	xori	s6, s6, -1
	and		s7, s7, s6
	blt		s7, s1, main_fake_generateOperations_fake_randOp__if_then
	j		main_fake_generateOperations_fake_randOp__if_merge

main_fake_generateOperations_fake_randOp__if_then:
	li		s6, 1
	j		main_fake_generateOperations_split_block_2

main_fake_generateOperations_split_block_2:
	li		s9, 1
	beq		s6, s9, main_fake_generateOperations__if_then
	j		main_fake_generateOperations__if_else

main_fake_generateOperations__if_then:
	li		s6, 0
	bne		s0, s6, main_fake_generateOperations_fake_insert__if_then
	j		main_fake_generateOperations_fake_insert_split_block

main_fake_generateOperations_fake_insert__if_then:
	li		s6, 0
	addi	s9, s6, -1
	li		s6, 0
	beq		s0, s6, main_fake_fake_insertImpl_1_insertImpl_split_block
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge

main_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s6, s0, 8
	lw		s9, 0(s6)
	beq		s9, s3, main_fake_fake_insertImpl_1_insertImpl__if_then
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_2

main_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		a2, 0
	lw		s6, 0(s6)
	blt		s6, s3, main_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s6, s0, 4
	lw		s9, 0(s6)
	li		s6, 4
	mul		s6, a2, s6
	addi	s6, s6, 4
	add		s6, s6, s9
	lw		a0, 0(s6)
	mv		a1, s0
	mv		a3, s3
	call	insertImpl
	j		main_fake_generateOperations__for_step

main_fake_generateOperations__for_step:
	addi	s10, s10, 1
	j		main_fake_generateOperations__for_cond_3

main_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		a2, 1
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s3, s0, 12
	lw		s6, 0(s3)
	addi	s6, s6, 1
	sw		s6, 0(s3)
	j		main_fake_generateOperations__for_step

main_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s6, s4, 4
	li		s5, 2
	li		ra, 4
	mul		s5, s5, ra
	addi	a0, s5, 4
	call	malloc
	li		s5, 2
	sw		s5, 0(a0)
	sw		a0, 0(s6)
	addi	s5, s4, 8
	sw		s3, 0(s5)
	addi	s3, s4, 12
	li		s5, 1
	sw		s5, 0(s3)
	addi	s5, s4, 0
	li		s3, 0
	sw		s3, 0(s5)
	lw		ra, 0(s6)
	li		s3, 0
	li		s5, 4
	mul		s3, s3, s5
	addi	s3, s3, 4
	add		s3, s3, ra
	li		s5, 0
	sw		s5, 0(s3)
	lw		s6, 0(s6)
	li		s3, 1
	li		s5, 4
	mul		s3, s3, s5
	addi	s3, s3, 4
	add		s3, s3, s6
	li		s6, 0
	sw		s6, 0(s3)
	li		s3, 0
	addi	s3, s3, 4
	lw		s6, 0(s3)
	li		s3, 4
	mul		s3, s9, s3
	addi	s3, s3, 4
	add		s3, s3, s6
	sw		s4, 0(s3)
	j		main_fake_generateOperations__for_step

main_fake_generateOperations_fake_insert_split_block:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s6, s0, 4
	li		s4, 2
	li		s9, 4
	mul		s9, s4, s9
	addi	a0, s9, 4
	call	malloc
	li		s9, 2
	sw		s9, 0(a0)
	sw		a0, 0(s6)
	addi	s9, s0, 8
	sw		s3, 0(s9)
	addi	s9, s0, 12
	li		s3, 1
	sw		s3, 0(s9)
	addi	s3, s0, 0
	li		s9, 0
	sw		s9, 0(s3)
	lw		s9, 0(s6)
	li		s3, 0
	li		s4, 4
	mul		s3, s3, s4
	addi	s3, s3, 4
	add		s9, s3, s9
	li		s3, 0
	sw		s3, 0(s9)
	lw		s6, 0(s6)
	li		s9, 1
	li		s3, 4
	mul		s3, s9, s3
	addi	s3, s3, 4
	add		s3, s3, s6
	li		s6, 0
	sw		s6, 0(s3)
	j		main_fake_generateOperations__for_step

main_fake_generateOperations__if_else:
	li		s6, 0
	beq		s0, s6, main_fake_generateOperations__for_step
	j		main_fake_generateOperations_fake_erase__if_merge

main_fake_generateOperations_fake_erase__if_merge:
	li		s6, 1
	sub		a2, zero, s6
	lui		s6, %hi(root)
	sw		s0, %lo(root)(s6)
	mv		a0, s0
	li		a1, 0
	mv		a3, s3
	call	eraseImpl
	lui		s0, %hi(root)
	lw		s0, %lo(root)(s0)
	j		main_fake_generateOperations__for_step

main_fake_generateOperations_fake_randOp__if_merge:
	li		s6, 2
	j		main_fake_generateOperations_split_block_2

main_split_block_3:
	li		s3, 0
	beq		s0, s3, main_split_block_4
	j		main_fake_fake_printTree_1_printTree__if_merge

main_fake_fake_printTree_1_printTree__if_merge:
	addi	s1, s0, 4
	lw		s6, 0(s1)
	li		s3, 0
	li		s10, 4
	mul		s3, s3, s10
	addi	s3, s3, 4
	add		s3, s3, s6
	lw		a0, 0(s3)
	call	printTree
	addi	s3, s0, 8
	lw		a0, 0(s3)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	mv		s3, a0
	addi	s10, s0, 12
	lw		a0, 0(s10)
	call	__builtin_toString
	mv		a1, a0
	mv		a0, s3
	call	__builtin_string_add
	call	__builtin_println
	lw		s1, 0(s1)
	li		s3, 1
	li		s10, 4
	mul		s3, s3, s10
	addi	s3, s3, 4
	add		s3, s3, s1
	lw		a0, 0(s3)
	call	printTree
	j		main_split_block_4

main_split_block_4:
	lui		s3, %hi(root)
	sw		s0, %lo(root)(s3)
	lui		s0, %hi(seed)
	sw		s7, %lo(seed)(s0)
	li		a0, 0
	lw		s10, 4(sp)
	lw		s9, 8(sp)
	lw		s8, 12(sp)
	lw		s7, 16(sp)
	lw		s6, 20(sp)
	lw		s5, 24(sp)
	lw		s4, 28(sp)
	lw		s3, 32(sp)
	lw		s1, 36(sp)
	lw		s0, 40(sp)
	lw		ra, 44(sp)
	addi	sp, sp, 48
	jr		ra


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	lui		t1, %hi(root)
	li		ra, 0
	sw		ra, %lo(root)(t1)
	lui		t1, %hi(MAX)
	li		ra, 128
	sw		ra, %lo(MAX)(t1)
	lui		ra, %hi(MaxRandInt)
	li		t1, 2147483647
	sw		t1, %lo(MaxRandInt)(ra)
	call	_main
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


