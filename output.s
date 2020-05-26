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
	sw		s3, 20(sp)
	sw		s5, 16(sp)
	sw		s8, 12(sp)
	sw		s9, 8(sp)
	sw		s10, 4(sp)
	mv		s9, a0
	mv		s5, a1
	mv		s10, a2
	mv		s8, a3
	beq		s9, zero, insertImpl_split_block
	j		insertImpl__if_merge

insertImpl__if_merge:
	addi	s5, s9, 8
	lw		s10, 0(s5)
	beq		s10, s8, insertImpl__if_then_2
	j		insertImpl__if_merge_2

insertImpl__if_then_2:
	addi	s8, s9, 12
	lw		s9, 0(s8)
	addi	s9, s9, 1
	sw		s9, 0(s8)
	li		a0, 1
	j		insertImpl_exit

insertImpl_exit:
	lw		s10, 4(sp)
	lw		s9, 8(sp)
	lw		s8, 12(sp)
	lw		s5, 16(sp)
	lw		s3, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

insertImpl__if_merge_2:
	li		s10, 0
	lw		s5, 0(s5)
	blt		s5, s8, insertImpl__if_then
	j		insertImpl__if_merge_3

insertImpl__if_then:
	li		s10, 1
	j		insertImpl__if_merge_3

insertImpl__if_merge_3:
	addi	s0, s9, 4
	lw		s5, 0(s0)
	li		s3, 4
	mul		s10, s10, s3
	addi	s10, s10, 4
	add		s5, s10, s5
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s10, s5, 8
	lw		s9, 0(s10)
	beq		s9, s8, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s9, 0
	lw		s10, 0(s10)
	blt		s10, s8, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s9, 1
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s10, s5, 4
	lw		s3, 0(s10)
	li		s0, 4
	mul		s9, s9, s0
	addi	s0, s9, 4
	add		s9, s0, s3
	lw		s9, 0(s9)
	beq		s9, zero, insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s5, s9, 8
	lw		s10, 0(s5)
	beq		s10, s8, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s10, 0
	lw		s5, 0(s5)
	blt		s5, s8, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s5, s9, 4
	lw		s3, 0(s5)
	li		s0, 4
	mul		s10, s10, s0
	addi	s0, s10, 4
	add		s10, s0, s3
	lw		a1, 0(s10)
	beq		a1, zero, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s3, s10, 4
	li		a0, 12
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s3)
	addi	ra, s10, 8
	sw		s8, 0(ra)
	addi	ra, s10, 12
	li		s8, 1
	sw		s8, 0(ra)
	addi	s8, s10, 0
	sw		s9, 0(s8)
	lw		s9, 0(s3)
	addi	s9, s9, 4
	li		s8, 0
	sw		s8, 0(s9)
	lw		s9, 0(s3)
	addi	s9, s9, 8
	li		s8, 0
	sw		s8, 0(s9)
	lw		s9, 0(s5)
	add		s9, s0, s9
	sw		s10, 0(s9)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s10, a1, 8
	lw		s9, 0(s10)
	beq		s9, s8, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		a2, 0
	lw		s9, 0(s10)
	blt		s9, s8, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s9, a1, 4
	lw		s10, 0(s9)
	li		s9, 4
	mul		s9, a2, s9
	addi	s9, s9, 4
	add		s9, s9, s10
	lw		a0, 0(s9)
	mv		a3, s8
	call	insertImpl
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		a2, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s8, a1, 12
	lw		s9, 0(s8)
	addi	s9, s9, 1
	sw		s9, 0(s8)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s8, s9, 12
	lw		s9, 0(s8)
	addi	s9, s9, 1
	sw		s9, 0(s8)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s9, a0
	addi	s3, s9, 4
	li		a0, 12
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s3)
	addi	ra, s9, 8
	sw		s8, 0(ra)
	addi	s8, s9, 12
	li		ra, 1
	sw		ra, 0(s8)
	addi	s8, s9, 0
	sw		s5, 0(s8)
	lw		s8, 0(s3)
	addi	s8, s8, 4
	li		s5, 0
	sw		s5, 0(s8)
	lw		s8, 0(s3)
	addi	s5, s8, 8
	li		s8, 0
	sw		s8, 0(s5)
	lw		s8, 0(s10)
	add		s8, s0, s8
	sw		s9, 0(s8)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s9, s5, 12
	lw		s8, 0(s9)
	addi	s8, s8, 1
	sw		s8, 0(s9)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s3, s5, 4
	li		a0, 12
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s3)
	addi	ra, s5, 8
	sw		s8, 0(ra)
	addi	ra, s5, 12
	li		s8, 1
	sw		s8, 0(ra)
	addi	s8, s5, 0
	sw		s9, 0(s8)
	lw		s9, 0(s3)
	addi	s8, s9, 4
	li		s9, 0
	sw		s9, 0(s8)
	lw		s9, 0(s3)
	addi	s9, s9, 8
	li		s8, 0
	sw		s8, 0(s9)
	lw		s9, 0(s0)
	add		s9, s10, s9
	sw		s5, 0(s9)
	li		a0, 0
	j		insertImpl_exit

insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s9, a0
	addi	s0, s9, 4
	li		a0, 12
	call	malloc
	li		s3, 2
	sw		s3, 0(a0)
	sw		a0, 0(s0)
	addi	s3, s9, 8
	sw		s8, 0(s3)
	addi	s3, s9, 12
	li		s8, 1
	sw		s8, 0(s3)
	addi	s8, s9, 0
	sw		s5, 0(s8)
	lw		s8, 0(s0)
	addi	s8, s8, 4
	li		s3, 0
	sw		s3, 0(s8)
	lw		s8, 0(s0)
	addi	s0, s8, 8
	li		s8, 0
	sw		s8, 0(s0)
	addi	s8, s5, 4
	lw		s5, 0(s8)
	li		s8, 4
	mul		s8, s10, s8
	addi	s8, s8, 4
	add		s8, s8, s5
	sw		s9, 0(s8)
	li		a0, 0
	j		insertImpl_exit


	.globl	findLargest
	.p2align	2
	.type	findLargest, @function
findLargest:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	addi	ra, a0, 4
	lw		t6, 0(ra)
	addi	t6, t6, 8
	lw		t6, 0(t6)
	beq		t6, zero, findLargest_exit
	j		findLargest__if_merge

findLargest_exit:
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t6, 0(ra)
	addi	t6, t6, 8
	lw		t6, 0(t6)
	beq		t6, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t6, 0(ra)
	addi	t6, t6, 8
	lw		t6, 0(t6)
	beq		t6, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t6, 0(ra)
	addi	t6, t6, 8
	lw		t6, 0(t6)
	beq		t6, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t6, 0(ra)
	addi	t6, t6, 8
	lw		t6, 0(t6)
	beq		t6, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t6)
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
	sw		s1, 24(sp)
	sw		s2, 20(sp)
	sw		s4, 16(sp)
	sw		s7, 12(sp)
	sw		s9, 8(sp)
	mv		s1, a0
	mv		s9, a1
	mv		s4, a2
	mv		s7, a3
	lui		s2, %hi(root)
	lw		s2, %lo(root)(s2)
	beq		s1, zero, eraseImpl__if_then
	j		eraseImpl__if_merge

eraseImpl__if_then:
	li		a0, 0
	j		eraseImpl_exit

eraseImpl_exit:
	lui		s1, %hi(root)
	sw		s2, %lo(root)(s1)
	lw		s9, 8(sp)
	lw		s7, 12(sp)
	lw		s4, 16(sp)
	lw		s2, 20(sp)
	lw		s1, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

eraseImpl__if_merge:
	addi	ra, s1, 8
	lw		t6, 0(ra)
	bgt		t6, s7, eraseImpl__if_then_14
	j		eraseImpl__if_merge_2

eraseImpl__if_then_14:
	addi	s9, s1, 4
	lw		s9, 0(s9)
	addi	s9, s9, 4
	lw		a0, 0(s9)
	lui		s9, %hi(root)
	sw		s2, %lo(root)(s9)
	mv		a1, s1
	li		a2, 0
	mv		a3, s7
	call	eraseImpl
	lui		s1, %hi(root)
	lw		s2, %lo(root)(s1)
	j		eraseImpl_exit

eraseImpl__if_merge_2:
	lw		ra, 0(ra)
	blt		ra, s7, eraseImpl__if_then_13
	j		eraseImpl__if_merge_3

eraseImpl__if_then_13:
	addi	s9, s1, 4
	lw		s9, 0(s9)
	addi	s9, s9, 8
	lw		a0, 0(s9)
	lui		s9, %hi(root)
	sw		s2, %lo(root)(s9)
	mv		a1, s1
	li		a2, 1
	mv		a3, s7
	call	eraseImpl
	lui		s1, %hi(root)
	lw		s2, %lo(root)(s1)
	j		eraseImpl_exit

eraseImpl__if_merge_3:
	addi	t6, s1, 12
	lw		ra, 0(t6)
	addi	ra, ra, -1
	sw		ra, 0(t6)
	bgt		ra, zero, eraseImpl__if_then_2
	j		eraseImpl__if_merge_4

eraseImpl__if_merge_4:
	addi	ra, s1, 4
	lw		t6, 0(ra)
	addi	t6, t6, 4
	lw		t6, 0(t6)
	beq		t6, zero, eraseImpl__if_then_3
	j		eraseImpl__if_merge_8

eraseImpl__if_merge_8:
	lw		ra, 0(ra)
	addi	ra, ra, 4
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_split_block_2:
	addi	ra, s2, 8
	lw		ra, 0(ra)
	beq		s7, ra, eraseImpl__if_then_12
	j		eraseImpl__if_merge_9

eraseImpl__if_merge_9:
	addi	ra, a0, 8
	addi	s7, s1, 4
	lw		s7, 0(s7)
	addi	s7, s7, 4
	lw		s7, 0(s7)
	addi	s7, s7, 8
	lw		ra, 0(ra)
	lw		s7, 0(s7)
	bne		ra, s7, eraseImpl__if_then_10
	j		eraseImpl__if_merge_10

eraseImpl__if_merge_10:
	bne		s9, zero, eraseImpl__if_then_9
	j		eraseImpl__if_merge_11

eraseImpl__if_then_9:
	addi	s7, s9, 4
	lw		ra, 0(s7)
	li		s7, 4
	mul		s7, s4, s7
	addi	s7, s7, 4
	add		s7, s7, ra
	sw		a0, 0(s7)
	j		eraseImpl__if_merge_11

eraseImpl__if_merge_11:
	addi	s7, a0, 0
	sw		s9, 0(s7)
	addi	s9, a0, 4
	lw		s9, 0(s9)
	addi	s9, s9, 8
	addi	s7, s1, 4
	lw		s4, 0(s7)
	addi	s4, s4, 8
	lw		s4, 0(s4)
	sw		s4, 0(s9)
	lw		s9, 0(s7)
	addi	s9, s9, 8
	lw		s9, 0(s9)
	bne		s9, zero, eraseImpl__if_then_8
	j		eraseImpl__if_merge_12

eraseImpl__if_then_8:
	lw		s9, 0(s7)
	addi	s9, s9, 8
	lw		s9, 0(s9)
	addi	s9, s9, 0
	sw		a0, 0(s9)
	j		eraseImpl__if_merge_12

eraseImpl__if_merge_12:
	addi	s9, a0, 8
	addi	s7, s1, 4
	lw		s1, 0(s7)
	addi	s1, s1, 4
	lw		s1, 0(s1)
	addi	s1, s1, 8
	lw		s9, 0(s9)
	lw		s1, 0(s1)
	bne		s9, s1, eraseImpl__if_then_7
	j		eraseImpl__if_merge_13

eraseImpl__if_then_7:
	addi	s1, a0, 4
	lw		s1, 0(s1)
	addi	s1, s1, 4
	lw		s9, 0(s7)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	sw		s9, 0(s1)
	lw		s1, 0(s7)
	addi	s1, s1, 4
	lw		s1, 0(s1)
	addi	s1, s1, 0
	sw		a0, 0(s1)
	j		eraseImpl__if_merge_13

eraseImpl__if_merge_13:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_then_10:
	addi	ra, a0, 0
	lw		s7, 0(ra)
	addi	s7, s7, 4
	lw		s7, 0(s7)
	addi	a6, s7, 8
	addi	t6, a0, 4
	lw		s7, 0(t6)
	addi	s7, s7, 4
	lw		s7, 0(s7)
	sw		s7, 0(a6)
	lw		s7, 0(t6)
	addi	s7, s7, 4
	lw		s7, 0(s7)
	bne		s7, zero, eraseImpl__if_then_11
	j		eraseImpl__if_merge_10

eraseImpl__if_then_11:
	lw		s7, 0(t6)
	addi	s7, s7, 4
	lw		s7, 0(s7)
	addi	s7, s7, 0
	lw		ra, 0(ra)
	sw		ra, 0(s7)
	j		eraseImpl__if_merge_10

eraseImpl__if_then_12:
	mv		s2, a0
	j		eraseImpl__if_merge_9

eraseImpl_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t6, 0(ra)
	addi	t6, t6, 8
	lw		t6, 0(t6)
	beq		t6, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	ra, a0, 4
	lw		t6, 0(ra)
	addi	t6, t6, 8
	lw		t6, 0(t6)
	beq		t6, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		ra, 0(ra)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	addi	t6, a0, 4
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		ra, 0(ra)
	beq		ra, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		ra, 0(t6)
	addi	ra, ra, 8
	lw		a0, 0(ra)
	call	findLargest
	j		eraseImpl_split_block_2

eraseImpl__if_then_3:
	bne		s9, zero, eraseImpl__if_then_4
	j		eraseImpl__if_merge_5

eraseImpl__if_then_4:
	addi	t6, s9, 4
	lw		t6, 0(t6)
	li		a6, 4
	mul		s4, s4, a6
	addi	s4, s4, 4
	add		t6, s4, t6
	lw		s4, 0(ra)
	addi	s4, s4, 8
	lw		s4, 0(s4)
	sw		s4, 0(t6)
	j		eraseImpl__if_merge_5

eraseImpl__if_merge_5:
	addi	ra, s1, 4
	lw		s4, 0(ra)
	addi	s4, s4, 8
	lw		s4, 0(s4)
	bne		s4, zero, eraseImpl__if_then_6
	j		eraseImpl__if_merge_6

eraseImpl__if_then_6:
	lw		s4, 0(ra)
	addi	s4, s4, 8
	lw		s4, 0(s4)
	addi	s4, s4, 0
	sw		s9, 0(s4)
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_6:
	addi	s9, s2, 8
	lw		s9, 0(s9)
	beq		s7, s9, eraseImpl__if_then_5
	j		eraseImpl__if_merge_7

eraseImpl__if_merge_7:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_then_5:
	addi	s1, s1, 4
	lw		s1, 0(s1)
	addi	s1, s1, 8
	lw		s2, 0(s1)
	j		eraseImpl__if_merge_7

eraseImpl__if_then_2:
	li		a0, 1
	j		eraseImpl_exit


	.globl	printTree
	.p2align	2
	.type	printTree, @function
printTree:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s0, 24(sp)
	sw		s4, 20(sp)
	sw		s7, 16(sp)
	sw		s8, 12(sp)
	mv		s0, s9
	sw		s11, 8(sp)
	mv		s4, a0
	beq		s4, zero, printTree_exit
	j		printTree__if_merge

printTree_exit:
	lw		s11, 8(sp)
	mv		s9, s0
	lw		s8, 12(sp)
	lw		s7, 16(sp)
	lw		s4, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

printTree__if_merge:
	addi	s9, s4, 4
	lw		s9, 0(s9)
	addi	s9, s9, 4
	lw		s8, 0(s9)
	beq		s8, zero, printTree_split_block_2
	j		printTree_fake_fake_printTree_1_printTree__if_merge

printTree_split_block_2:
	addi	s9, s4, 8
	lw		a0, 0(s9)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s9, s4, 12
	lw		a0, 0(s9)
	call	__builtin_printlnInt
	addi	s9, s4, 4
	lw		s9, 0(s9)
	addi	s9, s9, 8
	lw		s8, 0(s9)
	beq		s8, zero, printTree_exit
	j		printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s9, s8, 4
	lw		s7, 0(s9)
	addi	s7, s7, 4
	lw		a0, 0(s7)
	call	printTree
	addi	s7, s8, 8
	lw		a0, 0(s7)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s8, s8, 12
	lw		a0, 0(s8)
	call	__builtin_printlnInt
	lw		s9, 0(s9)
	addi	s9, s9, 8
	lw		a0, 0(s9)
	call	printTree
	j		printTree_exit

printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s9, s8, 4
	lw		s9, 0(s9)
	addi	s9, s9, 4
	lw		s11, 0(s9)
	beq		s11, zero, printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree__if_merge

printTree_split_block:
	addi	s9, s8, 8
	lw		a0, 0(s9)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s9, s8, 12
	lw		a0, 0(s9)
	call	__builtin_printlnInt
	addi	s9, s8, 4
	lw		s9, 0(s9)
	addi	s9, s9, 8
	lw		a0, 0(s9)
	call	printTree
	j		printTree_split_block_2

printTree_fake_fake_printTree_2_printTree__if_merge:
	addi	s9, s11, 4
	lw		s9, 0(s9)
	addi	s9, s9, 4
	lw		s7, 0(s9)
	beq		s7, zero, printTree_fake_fake_printTree_2_printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s9, s7, 4
	lw		ra, 0(s9)
	addi	ra, ra, 4
	lw		a0, 0(ra)
	call	printTree
	addi	ra, s7, 8
	lw		a0, 0(ra)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s7, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	lw		s9, 0(s9)
	addi	s9, s9, 8
	lw		a0, 0(s9)
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block

printTree_fake_fake_printTree_2_printTree_split_block:
	addi	s9, s11, 8
	lw		a0, 0(s9)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s9, s11, 12
	lw		a0, 0(s9)
	call	__builtin_printlnInt
	addi	s9, s11, 4
	lw		s9, 0(s9)
	addi	s9, s9, 8
	lw		s7, 0(s9)
	beq		s7, zero, printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s9, s7, 4
	lw		s11, 0(s9)
	addi	s11, s11, 4
	lw		a0, 0(s11)
	call	printTree
	addi	s11, s7, 8
	lw		a0, 0(s11)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s7, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	lw		s9, 0(s9)
	addi	s9, s9, 8
	lw		a0, 0(s9)
	call	printTree
	j		printTree_split_block


	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -64
	sw		ra, 60(sp)
	sw		s0, 56(sp)
	sw		s1, 52(sp)
	sw		s2, 48(sp)
	sw		s3, 44(sp)
	sw		s4, 40(sp)
	sw		s5, 36(sp)
	sw		s6, 32(sp)
	sw		s7, 28(sp)
	sw		s8, 24(sp)
	sw		s9, 20(sp)
	sw		s10, 16(sp)
	sw		s11, 12(sp)
	lui		s1, %hi(MAX)
	lw		s6, %lo(MAX)(s1)
	lui		s1, %hi(root)
	lw		s1, %lo(root)(s1)
	lui		s2, %hi(MaxRandInt)
	lw		s2, %lo(MaxRandInt)(s2)
	sw		s2, 8(sp)
	call	__builtin_getInt
	li		s9, 10
	lw		s2, 8(sp)
	div		s9, s2, s9
	li		s2, 8
	mul		s7, s2, s9
	li		s2, 0
	li		s9, 1
	mv		s11, s9
	li		s9, 2
	mv		s4, s9
	li		s9, 0
	mv		s8, s9
	li		s9, 1
	mv		s5, s1
	mv		s3, s2
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations__for_cond:
	li		s1, 50000
	blt		s3, s1, main_fake_generateOperations_split_block_9
	j		main_split_block

main_split_block:
	li		s2, 10
	lw		s1, 8(sp)
	div		s2, s1, s2
	li		s1, 2
	mul		s11, s1, s2
	li		s2, 0
	mv		s7, s5
	li		s1, 1
	mv		s5, s1
	li		s1, 0
	mv		s9, s1
	li		s1, 2
	mv		s8, s1
	li		s1, 1
	mv		s4, s1
	mv		s3, s2
	mv		s2, s7
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations__for_cond_2:
	li		s1, 100000
	blt		s3, s1, main_fake_generateOperations_split_block
	j		main_split_block_3

main_fake_generateOperations_split_block:
	slli	s1, a0, 13
	xor		s1, a0, s1
	li		s7, 2147483647
	and		s1, s1, s7
	srai	s7, s1, 17
	xor		s7, s1, s7
	slli	s1, s7, 5
	xor		s7, s7, s1
	li		s1, 2147483647
	and		s1, s7, s1
	rem		s0, s1, s6
	slli	s7, s1, 13
	xor		s1, s1, s7
	li		s7, 2147483647
	and		s7, s1, s7
	srai	s1, s7, 17
	xor		s1, s7, s1
	slli	s7, s1, 5
	xor		s7, s1, s7
	li		s1, 2147483647
	and		s1, s7, s1
	mv		s7, s1
	blt		s1, s11, main_fake_generateOperations_fake_randOp__if_then
	j		main_fake_generateOperations_fake_randOp__if_merge

main_fake_generateOperations_fake_randOp__if_merge:
	mv		s1, s8
	j		main_fake_generateOperations_split_block_2

main_fake_generateOperations_split_block_2:
	li		s10, 1
	beq		s1, s10, main_fake_generateOperations__if_then
	j		main_fake_generateOperations__if_else

main_fake_generateOperations__if_else:
	beq		s2, zero, main_fake_generateOperations_fake_erase__if_then
	j		main_fake_generateOperations_fake_erase__if_merge

main_fake_generateOperations_fake_erase__if_then:
	mv		s1, s2
	j		main_fake_generateOperations__for_step

main_fake_generateOperations__for_step:
	addi	s2, s3, 1
	mv		s3, s2
	mv		a0, s7
	mv		s2, s1
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations_fake_erase__if_merge:
	lui		s1, %hi(root)
	sw		s2, %lo(root)(s1)
	mv		a0, s2
	li		a1, 0
	li		a2, -1
	mv		a3, s0
	call	eraseImpl
	lui		s1, %hi(root)
	lw		s1, %lo(root)(s1)
	j		main_fake_generateOperations__for_step

main_fake_generateOperations__if_then:
	bne		s2, zero, main_fake_generateOperations_fake_insert__if_then
	j		main_fake_generateOperations_fake_insert_split_block

main_fake_generateOperations_fake_insert_split_block:
	li		a0, 16
	call	malloc
	mv		s1, a0
	addi	s2, s1, 4
	li		a0, 12
	call	malloc
	li		s10, 2
	sw		s10, 0(a0)
	sw		a0, 0(s2)
	addi	s10, s1, 8
	sw		s0, 0(s10)
	addi	s0, s1, 12
	li		s10, 1
	sw		s10, 0(s0)
	addi	s10, s1, 0
	li		s0, 0
	sw		s0, 0(s10)
	lw		s10, 0(s2)
	addi	s0, s10, 4
	li		s10, 0
	sw		s10, 0(s0)
	lw		s2, 0(s2)
	addi	s10, s2, 8
	li		s2, 0
	sw		s2, 0(s10)
	j		main_fake_generateOperations__for_step

main_fake_generateOperations_fake_insert__if_then:
	beq		s2, zero, main_fake_fake_insertImpl_1_insertImpl_split_block
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge

main_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s1, s2, 8
	lw		s10, 0(s1)
	beq		s10, s0, main_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_2

main_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, s2, 12
	lw		s1, 0(s10)
	addi	s1, s1, 1
	sw		s1, 0(s10)
	j		main_split_block_2

main_split_block_2:
	mv		s1, s2
	j		main_fake_generateOperations__for_step

main_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		s1, 0(s1)
	blt		s1, s0, main_fake_fake_insertImpl_1_insertImpl__if_then
	j		main__parallel_copy_

main_fake_fake_insertImpl_1_insertImpl__if_then:
	mv		a2, s5
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s1, s2, 4
	lw		s10, 0(s1)
	li		s1, 4
	mul		s1, a2, s1
	addi	s1, s1, 4
	add		s1, s1, s10
	lw		a0, 0(s1)
	mv		a1, s2
	mv		a3, s0
	call	insertImpl
	j		main_split_block_2

main__parallel_copy_:
	mv		a2, s9
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s1, s10, 4
	li		a0, 12
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s1)
	addi	ra, s10, 8
	sw		s0, 0(ra)
	addi	ra, s10, 12
	li		s0, 1
	sw		s0, 0(ra)
	addi	s0, s10, 0
	li		ra, 0
	sw		ra, 0(s0)
	lw		s0, 0(s1)
	addi	s0, s0, 4
	li		ra, 0
	sw		ra, 0(s0)
	lw		s1, 0(s1)
	addi	s1, s1, 8
	li		s0, 0
	sw		s0, 0(s1)
	li		s1, 4
	lw		s1, 0(s1)
	addi	s1, s1, 0
	sw		s10, 0(s1)
	j		main_split_block_2

main_fake_generateOperations_fake_randOp__if_then:
	mv		s1, s4
	j		main_fake_generateOperations_split_block_2

main_split_block_3:
	li		s1, 10
	lw		s9, 8(sp)
	div		s9, s9, s1
	li		s1, 4
	mul		s8, s1, s9
	li		s7, 0
	li		s1, 1
	mv		s5, s1
	li		s1, 0
	mv		s10, s1
	li		s1, 1
	mv		s9, s1
	li		s1, 2
	mv		s4, a0
	mv		s3, s7
	mv		s7, s2
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations__for_cond_3:
	li		s2, 50000
	blt		s3, s2, main_fake_generateOperations_split_block_5
	j		main_split_block_5

main_split_block_5:
	beq		s7, zero, main_split_block_6
	j		main_fake_fake_printTree_1_printTree__if_merge

main_split_block_6:
	lui		s1, %hi(root)
	sw		s7, %lo(root)(s1)
	lui		s1, %hi(seed)
	sw		s4, %lo(seed)(s1)
	li		a0, 0
	lw		s11, 12(sp)
	lw		s10, 16(sp)
	lw		s9, 20(sp)
	lw		s8, 24(sp)
	lw		s7, 28(sp)
	lw		s6, 32(sp)
	lw		s5, 36(sp)
	lw		s4, 40(sp)
	lw		s3, 44(sp)
	lw		s2, 48(sp)
	lw		s1, 52(sp)
	lw		s0, 56(sp)
	lw		ra, 60(sp)
	addi	sp, sp, 64
	jr		ra

main_fake_fake_printTree_1_printTree__if_merge:
	addi	s2, s7, 4
	lw		s1, 0(s2)
	addi	s1, s1, 4
	lw		a0, 0(s1)
	call	printTree
	addi	s1, s7, 8
	lw		a0, 0(s1)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s1, s7, 12
	lw		a0, 0(s1)
	call	__builtin_printlnInt
	lw		s1, 0(s2)
	addi	s1, s1, 8
	lw		a0, 0(s1)
	call	printTree
	j		main_split_block_6

main_fake_generateOperations_split_block_5:
	slli	s2, s4, 13
	xor		s4, s4, s2
	li		s2, 2147483647
	and		s4, s4, s2
	srai	s2, s4, 17
	xor		s2, s4, s2
	slli	s4, s2, 5
	xor		s2, s2, s4
	li		s4, 2147483647
	and		s11, s2, s4
	rem		s2, s11, s6
	slli	s4, s11, 13
	xor		s4, s11, s4
	li		s11, 2147483647
	and		s4, s4, s11
	srai	s11, s4, 17
	xor		s11, s4, s11
	slli	s4, s11, 5
	xor		s4, s11, s4
	li		s11, 2147483647
	and		s4, s4, s11
	mv		s11, s4
	blt		s4, s8, main_fake_generateOperations_fake_randOp__if_then_2
	j		main_fake_generateOperations_fake_randOp__if_merge_2

main_fake_generateOperations_fake_randOp__if_then_2:
	mv		s4, s9
	j		main_fake_generateOperations_split_block_6

main_fake_generateOperations_split_block_6:
	li		s0, 1
	beq		s4, s0, main_fake_generateOperations__if_then_2
	j		main_fake_generateOperations__if_else_2

main_fake_generateOperations__if_else_2:
	beq		s7, zero, main_fake_generateOperations__for_step_2
	j		main_fake_generateOperations_fake_erase__if_merge_2

main_fake_generateOperations_fake_erase__if_merge_2:
	lui		s4, %hi(root)
	sw		s7, %lo(root)(s4)
	mv		a0, s7
	li		a1, 0
	li		a2, -1
	mv		a3, s2
	call	eraseImpl
	lui		s2, %hi(root)
	lw		s7, %lo(root)(s2)
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations__for_step_2:
	addi	s2, s3, 1
	mv		s4, s11
	mv		s3, s2
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations__if_then_2:
	bne		s7, zero, main_fake_generateOperations_fake_insert__if_then_2
	j		main_fake_generateOperations_fake_insert_split_block_2

main_fake_generateOperations_fake_insert_split_block_2:
	li		a0, 16
	call	malloc
	mv		s7, a0
	addi	s4, s7, 4
	li		a0, 12
	call	malloc
	li		s0, 2
	sw		s0, 0(a0)
	sw		a0, 0(s4)
	addi	s0, s7, 8
	sw		s2, 0(s0)
	addi	s0, s7, 12
	li		s2, 1
	sw		s2, 0(s0)
	addi	s0, s7, 0
	li		s2, 0
	sw		s2, 0(s0)
	lw		s2, 0(s4)
	addi	s0, s2, 4
	li		s2, 0
	sw		s2, 0(s0)
	lw		s2, 0(s4)
	addi	s4, s2, 8
	li		s2, 0
	sw		s2, 0(s4)
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations_fake_insert__if_then_2:
	beq		s7, zero, main_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_4

main_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s0, s7, 8
	lw		s4, 0(s0)
	beq		s4, s2, main_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_5

main_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		s4, 0(s0)
	blt		s4, s2, main_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		main__parallel_copy__2

main_fake_fake_insertImpl_1_insertImpl__if_then_3:
	mv		a2, s5
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s4, s7, 4
	lw		s0, 0(s4)
	li		s4, 4
	mul		s4, a2, s4
	addi	s4, s4, 4
	add		s4, s4, s0
	lw		a0, 0(s4)
	mv		a1, s7
	mv		a3, s2
	call	insertImpl
	j		main_fake_generateOperations__for_step_2

main__parallel_copy__2:
	mv		a2, s10
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_then_4:
	addi	s4, s7, 12
	lw		s2, 0(s4)
	addi	s2, s2, 1
	sw		s2, 0(s4)
	j		main_fake_generateOperations__for_step_2

main_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s0, s4, 4
	li		a0, 12
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s0)
	addi	ra, s4, 8
	sw		s2, 0(ra)
	addi	s2, s4, 12
	li		ra, 1
	sw		ra, 0(s2)
	addi	ra, s4, 0
	li		s2, 0
	sw		s2, 0(ra)
	lw		s2, 0(s0)
	addi	ra, s2, 4
	li		s2, 0
	sw		s2, 0(ra)
	lw		s2, 0(s0)
	addi	s2, s2, 8
	li		s0, 0
	sw		s0, 0(s2)
	li		s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		s4, 0(s2)
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations_fake_randOp__if_merge_2:
	mv		s4, s1
	j		main_fake_generateOperations_split_block_6

main_fake_generateOperations_split_block_9:
	slli	s1, a0, 13
	xor		s2, a0, s1
	li		s1, 2147483647
	and		s1, s2, s1
	srai	s2, s1, 17
	xor		s1, s1, s2
	slli	s2, s1, 5
	xor		s2, s1, s2
	li		s1, 2147483647
	and		s2, s2, s1
	rem		s0, s2, s6
	slli	s1, s2, 13
	xor		s2, s2, s1
	li		s1, 2147483647
	and		s1, s2, s1
	srai	s2, s1, 17
	xor		s1, s1, s2
	slli	s2, s1, 5
	xor		s1, s1, s2
	li		s2, 2147483647
	and		s1, s1, s2
	mv		s10, s1
	blt		s1, s7, main_fake_generateOperations_fake_randOp__if_then_3
	j		main_fake_generateOperations_fake_randOp__if_merge_3

main_fake_generateOperations_fake_randOp__if_merge_3:
	mv		s1, s4
	j		main_fake_generateOperations_split_block_10

main_fake_generateOperations_split_block_10:
	li		s2, 1
	beq		s1, s2, main_fake_generateOperations__if_then_3
	j		main_fake_generateOperations__if_else_3

main_fake_generateOperations__if_then_3:
	bne		s5, zero, main_fake_generateOperations_fake_insert__if_then_3
	j		main_fake_generateOperations_fake_insert_split_block_3

main_fake_generateOperations_fake_insert__if_then_3:
	beq		s5, zero, main_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_7

main_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s2, a0
	addi	s1, s2, 4
	li		a0, 12
	call	malloc
	li		ra, 2
	sw		ra, 0(a0)
	sw		a0, 0(s1)
	addi	ra, s2, 8
	sw		s0, 0(ra)
	addi	s0, s2, 12
	li		ra, 1
	sw		ra, 0(s0)
	addi	ra, s2, 0
	li		s0, 0
	sw		s0, 0(ra)
	lw		s0, 0(s1)
	addi	s0, s0, 4
	li		ra, 0
	sw		ra, 0(s0)
	lw		s1, 0(s1)
	addi	s0, s1, 8
	li		s1, 0
	sw		s1, 0(s0)
	li		s1, 4
	lw		s1, 0(s1)
	addi	s1, s1, 0
	sw		s2, 0(s1)
	j		main_split_block_7

main_split_block_7:
	mv		s2, s5
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations__for_step_3:
	addi	s1, s3, 1
	mv		a0, s10
	mv		s5, s2
	mv		s3, s1
	j		main_fake_generateOperations__for_cond

main_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s2, s5, 8
	lw		s1, 0(s2)
	beq		s1, s0, main_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_8

main_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		s1, 0(s2)
	blt		s1, s0, main_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		main__parallel_copy__3

main__parallel_copy__3:
	mv		a2, s8
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s1, s5, 4
	lw		s1, 0(s1)
	li		s2, 4
	mul		s2, a2, s2
	addi	s2, s2, 4
	add		s1, s2, s1
	lw		a0, 0(s1)
	mv		a1, s5
	mv		a3, s0
	call	insertImpl
	j		main_split_block_7

main_fake_fake_insertImpl_1_insertImpl__if_then_6:
	mv		a2, s9
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	s2, s5, 12
	lw		s1, 0(s2)
	addi	s1, s1, 1
	sw		s1, 0(s2)
	j		main_split_block_7

main_fake_generateOperations_fake_insert_split_block_3:
	li		a0, 16
	call	malloc
	mv		s2, a0
	addi	s1, s2, 4
	li		a0, 12
	call	malloc
	li		s5, 2
	sw		s5, 0(a0)
	sw		a0, 0(s1)
	addi	s5, s2, 8
	sw		s0, 0(s5)
	addi	s5, s2, 12
	li		s0, 1
	sw		s0, 0(s5)
	addi	s0, s2, 0
	li		s5, 0
	sw		s5, 0(s0)
	lw		s5, 0(s1)
	addi	s0, s5, 4
	li		s5, 0
	sw		s5, 0(s0)
	lw		s1, 0(s1)
	addi	s1, s1, 8
	li		s5, 0
	sw		s5, 0(s1)
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations__if_else_3:
	beq		s5, zero, main_fake_generateOperations_fake_erase__if_then_3
	j		main_fake_generateOperations_fake_erase__if_merge_3

main_fake_generateOperations_fake_erase__if_then_3:
	mv		s2, s5
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations_fake_erase__if_merge_3:
	lui		s1, %hi(root)
	sw		s5, %lo(root)(s1)
	mv		a0, s5
	li		a1, 0
	li		a2, -1
	mv		a3, s0
	call	eraseImpl
	lui		s1, %hi(root)
	lw		s2, %lo(root)(s1)
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations_fake_randOp__if_then_3:
	mv		s1, s11
	j		main_fake_generateOperations_split_block_10


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	lui		ra, %hi(MaxRandInt)
	li		t6, 2147483647
	sw		t6, %lo(MaxRandInt)(ra)
	lui		t6, %hi(root)
	li		ra, 0
	sw		ra, %lo(root)(t6)
	lui		ra, %hi(MAX)
	li		t6, 128
	sw		t6, %lo(MAX)(ra)
	call	_main
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


