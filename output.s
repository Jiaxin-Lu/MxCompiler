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
	sw		s4, 16(sp)
	sw		s5, 12(sp)
	sw		s6, 8(sp)
	sw		s8, 4(sp)
	mv		s0, a0
	mv		s4, a1
	mv		s2, a2
	mv		s8, a3
	li		s6, 0
	beq		s0, s6, insertImpl_split_block
	j		insertImpl__if_merge

insertImpl__if_merge:
	addi	s2, s0, 8
	lw		s4, 0(s2)
	beq		s4, s8, insertImpl__if_then_2
	j		insertImpl__if_merge_2

insertImpl__if_then_2:
	addi	s8, s0, 12
	lw		s4, 0(s8)
	addi	s4, s4, 1
	sw		s4, 0(s8)
	li		a0, 1
	j		insertImpl_exit

insertImpl_exit:
	lw		s8, 4(sp)
	lw		s6, 8(sp)
	lw		s5, 12(sp)
	lw		s4, 16(sp)
	lw		s2, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

insertImpl__if_merge_2:
	li		s4, 0
	lw		s2, 0(s2)
	blt		s2, s8, insertImpl__if_then
	j		insertImpl__if_merge_3

insertImpl__if_merge_3:
	addi	s5, s0, 4
	lw		a5, 0(s5)
	li		s2, 4
	mul		s4, s4, s2
	addi	s6, s4, 4
	add		s4, s6, a5
	lw		s2, 0(s4)
	li		s4, 0
	beq		s2, s4, insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s0, s2, 8
	lw		s4, 0(s0)
	beq		s4, s8, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s4, 0
	lw		s0, 0(s0)
	blt		s0, s8, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s6, s2, 4
	lw		s0, 0(s6)
	li		s5, 4
	mul		s4, s4, s5
	addi	s5, s4, 4
	add		s4, s5, s0
	lw		s0, 0(s4)
	li		s4, 0
	beq		s0, s4, insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s2, s0, 8
	lw		s4, 0(s2)
	beq		s4, s8, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s4, 0
	lw		s2, 0(s2)
	blt		s2, s8, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		s4, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s2, s0, 4
	lw		s5, 0(s2)
	li		s6, 4
	mul		s4, s4, s6
	addi	s4, s4, 4
	add		s6, s4, s5
	lw		a1, 0(s6)
	li		s6, 0
	beq		a1, s6, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s5, s6, 4
	li		a0, 12
	call	malloc
	li		a5, 2
	sw		a5, 0(a0)
	sw		a0, 0(s5)
	addi	a5, s6, 8
	sw		s8, 0(a5)
	addi	a5, s6, 12
	li		s8, 1
	sw		s8, 0(a5)
	addi	s8, s6, 0
	sw		s0, 0(s8)
	lw		s8, 0(s5)
	addi	s0, s8, 4
	li		s8, 0
	sw		s8, 0(s0)
	lw		s8, 0(s5)
	addi	s0, s8, 8
	li		s8, 0
	sw		s8, 0(s0)
	lw		s8, 0(s2)
	add		s4, s4, s8
	sw		s6, 0(s4)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s4, a1, 8
	lw		s0, 0(s4)
	beq		s0, s8, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s8, a1, 12
	lw		s4, 0(s8)
	addi	s4, s4, 1
	sw		s4, 0(s8)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		a2, 0
	lw		s4, 0(s4)
	blt		s4, s8, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s4, a1, 4
	lw		s0, 0(s4)
	li		s4, 4
	mul		s4, a2, s4
	addi	s4, s4, 4
	add		s4, s4, s0
	lw		a0, 0(s4)
	mv		a3, s8
	call	insertImpl
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		a2, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s8, s0, 12
	lw		s4, 0(s8)
	addi	s4, s4, 1
	sw		s4, 0(s8)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s0, s4, 4
	li		a0, 12
	call	malloc
	li		a5, 2
	sw		a5, 0(a0)
	sw		a0, 0(s0)
	addi	a5, s4, 8
	sw		s8, 0(a5)
	addi	s8, s4, 12
	li		a5, 1
	sw		a5, 0(s8)
	addi	s8, s4, 0
	sw		s2, 0(s8)
	lw		s8, 0(s0)
	addi	s8, s8, 4
	li		s2, 0
	sw		s2, 0(s8)
	lw		s8, 0(s0)
	addi	s0, s8, 8
	li		s8, 0
	sw		s8, 0(s0)
	lw		s8, 0(s6)
	add		s8, s5, s8
	sw		s4, 0(s8)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		s4, 1
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s8, s2, 12
	lw		s4, 0(s8)
	addi	s4, s4, 1
	sw		s4, 0(s8)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s2, s4, 4
	li		a0, 12
	call	malloc
	li		a5, 2
	sw		a5, 0(a0)
	sw		a0, 0(s2)
	addi	a5, s4, 8
	sw		s8, 0(a5)
	addi	a5, s4, 12
	li		s8, 1
	sw		s8, 0(a5)
	addi	s8, s4, 0
	sw		s0, 0(s8)
	lw		s8, 0(s2)
	addi	s0, s8, 4
	li		s8, 0
	sw		s8, 0(s0)
	lw		s8, 0(s2)
	addi	s8, s8, 8
	li		s0, 0
	sw		s0, 0(s8)
	lw		s8, 0(s5)
	add		s8, s6, s8
	sw		s4, 0(s8)
	li		a0, 0
	j		insertImpl_exit

insertImpl__if_then:
	li		s4, 1
	j		insertImpl__if_merge_3

insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s6, s0, 4
	li		a0, 12
	call	malloc
	li		s5, 2
	sw		s5, 0(a0)
	sw		a0, 0(s6)
	addi	s5, s0, 8
	sw		s8, 0(s5)
	addi	s5, s0, 12
	li		s8, 1
	sw		s8, 0(s5)
	addi	s8, s0, 0
	sw		s4, 0(s8)
	lw		s8, 0(s6)
	addi	s5, s8, 4
	li		s8, 0
	sw		s8, 0(s5)
	lw		s8, 0(s6)
	addi	s6, s8, 8
	li		s8, 0
	sw		s8, 0(s6)
	addi	s4, s4, 4
	lw		s8, 0(s4)
	li		s4, 4
	mul		s4, s2, s4
	addi	s4, s4, 4
	add		s4, s4, s8
	sw		s0, 0(s4)
	li		a0, 0
	j		insertImpl_exit


	.globl	findLargest
	.p2align	2
	.type	findLargest, @function
findLargest:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	addi	a4, a0, 4
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		t1, 0(a5)
	li		a5, 0
	beq		t1, a5, findLargest_exit
	j		findLargest__if_merge

findLargest__if_merge:
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a4, 0(a5)
	li		a5, 0
	beq		a4, a5, findLargest_exit
	j		findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_exit:
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a4, 0(a5)
	li		a5, 0
	beq		a4, a5, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		a4, 0
	beq		a5, a4, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a4, a0, 4
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		t1, 0
	beq		a5, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a4, a0, 4
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		t1, 0
	beq		a5, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		a4, 0
	beq		a5, a4, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a4, a0, 4
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		t1, 0(a5)
	li		a5, 0
	beq		t1, a5, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a4, a0, 4
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		t1, 0
	beq		a5, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a4, a0, 4
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		t1, 0
	beq		a5, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a4, a0, 4
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		t1, 0
	beq		a5, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a5, a0, 4
	lw		t1, 0(a5)
	addi	t1, t1, 8
	lw		t1, 0(t1)
	li		a4, 0
	beq		t1, a4, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(a5)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a4, 0(a5)
	li		a5, 0
	beq		a4, a5, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a4, 0(a5)
	li		a5, 0
	beq		a4, a5, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a4, a0, 4
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		t1, 0
	beq		a5, t1, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		a4, 0
	beq		a5, a4, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	call	findLargest
	j		findLargest_exit


	.globl	eraseImpl
	.p2align	2
	.type	eraseImpl, @function
eraseImpl:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s4, 24(sp)
	sw		s5, 20(sp)
	sw		s6, 16(sp)
	sw		s9, 12(sp)
	sw		s10, 8(sp)
	mv		s4, a0
	mv		s10, a1
	mv		s5, a2
	mv		s9, a3
	lui		s6, %hi(root)
	lw		s6, %lo(root)(s6)
	li		a5, 0
	beq		s4, a5, eraseImpl__if_then
	j		eraseImpl__if_merge

eraseImpl__if_then:
	li		a0, 0
	j		eraseImpl_exit

eraseImpl_exit:
	lui		s4, %hi(root)
	sw		s6, %lo(root)(s4)
	lw		s10, 8(sp)
	lw		s9, 12(sp)
	lw		s6, 16(sp)
	lw		s5, 20(sp)
	lw		s4, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

eraseImpl__if_merge:
	addi	a5, s4, 8
	lw		t1, 0(a5)
	bgt		t1, s9, eraseImpl__if_then_14
	j		eraseImpl__if_merge_2

eraseImpl__if_then_14:
	addi	s10, s4, 4
	lw		s10, 0(s10)
	addi	s10, s10, 4
	lw		a0, 0(s10)
	lui		s10, %hi(root)
	sw		s6, %lo(root)(s10)
	mv		a1, s4
	li		a2, 0
	mv		a3, s9
	call	eraseImpl
	lui		s4, %hi(root)
	lw		s6, %lo(root)(s4)
	j		eraseImpl_exit

eraseImpl__if_merge_2:
	lw		a5, 0(a5)
	blt		a5, s9, eraseImpl__if_then_2
	j		eraseImpl__if_merge_3

eraseImpl__if_then_2:
	addi	s10, s4, 4
	lw		s10, 0(s10)
	addi	s10, s10, 8
	lw		a0, 0(s10)
	lui		s10, %hi(root)
	sw		s6, %lo(root)(s10)
	mv		a1, s4
	li		a2, 1
	mv		a3, s9
	call	eraseImpl
	lui		s4, %hi(root)
	lw		s6, %lo(root)(s4)
	j		eraseImpl_exit

eraseImpl__if_merge_3:
	addi	t1, s4, 12
	lw		a5, 0(t1)
	addi	a5, a5, -1
	sw		a5, 0(t1)
	li		t1, 0
	bgt		a5, t1, eraseImpl__if_then_3
	j		eraseImpl__if_merge_4

eraseImpl__if_then_3:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_merge_4:
	addi	a5, s4, 4
	lw		t1, 0(a5)
	addi	t1, t1, 4
	lw		a4, 0(t1)
	li		t1, 0
	beq		a4, t1, eraseImpl__if_then_4
	j		eraseImpl__if_merge_8

eraseImpl__if_then_4:
	li		t1, 0
	bne		s10, t1, eraseImpl__if_then_5
	j		eraseImpl__if_merge_5

eraseImpl__if_then_5:
	addi	t1, s10, 4
	lw		t1, 0(t1)
	li		a4, 4
	mul		s5, s5, a4
	addi	s5, s5, 4
	add		t1, s5, t1
	lw		s5, 0(a5)
	addi	s5, s5, 8
	lw		s5, 0(s5)
	sw		s5, 0(t1)
	j		eraseImpl__if_merge_5

eraseImpl__if_merge_5:
	addi	s5, s4, 4
	lw		a5, 0(s5)
	addi	a5, a5, 8
	lw		t1, 0(a5)
	li		a5, 0
	bne		t1, a5, eraseImpl__if_then_7
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_6:
	addi	s10, s6, 8
	lw		s10, 0(s10)
	beq		s9, s10, eraseImpl__if_then_6
	j		eraseImpl__if_merge_7

eraseImpl__if_merge_7:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_then_6:
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	s4, s4, 8
	lw		s6, 0(s4)
	j		eraseImpl__if_merge_7

eraseImpl__if_then_7:
	lw		s5, 0(s5)
	addi	s5, s5, 8
	lw		s5, 0(s5)
	addi	s5, s5, 0
	sw		s10, 0(s5)
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_8:
	lw		a5, 0(a5)
	addi	a5, a5, 4
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a4, 0(a5)
	li		a5, 0
	beq		a4, a5, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		a4, 0
	beq		a5, a4, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a4, a0, 4
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		t1, 0
	beq		a5, t1, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(a4)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a5, 0(a5)
	li		a4, 0
	beq		a5, a4, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge:
	lw		a5, 0(t1)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a5, a0, 4
	lw		t1, 0(a5)
	addi	t1, t1, 8
	lw		t1, 0(t1)
	li		a4, 0
	beq		t1, a4, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(a5)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a5, a0, 4
	lw		t1, 0(a5)
	addi	t1, t1, 8
	lw		a4, 0(t1)
	li		t1, 0
	beq		a4, t1, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		a5, 0(a5)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	addi	a5, a0, 4
	lw		t1, 0(a5)
	addi	t1, t1, 8
	lw		t1, 0(t1)
	li		a4, 0
	beq		t1, a4, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_split_block_2:
	addi	a5, s6, 8
	lw		a5, 0(a5)
	beq		s9, a5, eraseImpl__if_then_13
	j		eraseImpl__if_merge_9

eraseImpl__if_then_13:
	mv		s6, a0
	j		eraseImpl__if_merge_9

eraseImpl__if_merge_9:
	addi	a5, a0, 8
	addi	s9, s4, 4
	lw		s9, 0(s9)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	addi	s9, s9, 8
	lw		a5, 0(a5)
	lw		s9, 0(s9)
	bne		a5, s9, eraseImpl__if_then_11
	j		eraseImpl__if_merge_10

eraseImpl__if_then_11:
	addi	a4, a0, 0
	lw		s9, 0(a4)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	addi	s9, s9, 8
	addi	t1, a0, 4
	lw		a5, 0(t1)
	addi	a5, a5, 4
	lw		a5, 0(a5)
	sw		a5, 0(s9)
	lw		s9, 0(t1)
	addi	s9, s9, 4
	lw		a5, 0(s9)
	li		s9, 0
	bne		a5, s9, eraseImpl__if_then_12
	j		eraseImpl__if_merge_10

eraseImpl__if_then_12:
	lw		s9, 0(t1)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	addi	a5, s9, 0
	lw		s9, 0(a4)
	sw		s9, 0(a5)
	j		eraseImpl__if_merge_10

eraseImpl__if_merge_10:
	li		s9, 0
	bne		s10, s9, eraseImpl__if_then_10
	j		eraseImpl__if_merge_11

eraseImpl__if_then_10:
	addi	s9, s10, 4
	lw		a5, 0(s9)
	li		s9, 4
	mul		s9, s5, s9
	addi	s9, s9, 4
	add		s9, s9, a5
	sw		a0, 0(s9)
	j		eraseImpl__if_merge_11

eraseImpl__if_merge_11:
	addi	s9, a0, 0
	sw		s10, 0(s9)
	addi	s9, a0, 4
	lw		s9, 0(s9)
	addi	s10, s9, 8
	addi	s9, s4, 4
	lw		s5, 0(s9)
	addi	s5, s5, 8
	lw		s5, 0(s5)
	sw		s5, 0(s10)
	lw		s10, 0(s9)
	addi	s10, s10, 8
	lw		s5, 0(s10)
	li		s10, 0
	bne		s5, s10, eraseImpl__if_then_9
	j		eraseImpl__if_merge_12

eraseImpl__if_then_9:
	lw		s9, 0(s9)
	addi	s9, s9, 8
	lw		s9, 0(s9)
	addi	s9, s9, 0
	sw		a0, 0(s9)
	j		eraseImpl__if_merge_12

eraseImpl__if_merge_12:
	addi	s10, a0, 8
	addi	s9, s4, 4
	lw		s4, 0(s9)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	s4, s4, 8
	lw		s10, 0(s10)
	lw		s4, 0(s4)
	bne		s10, s4, eraseImpl__if_then_8
	j		eraseImpl__if_merge_13

eraseImpl__if_merge_13:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_then_8:
	addi	s4, a0, 4
	lw		s4, 0(s4)
	addi	s10, s4, 4
	lw		s4, 0(s9)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	sw		s4, 0(s10)
	lw		s4, 0(s9)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	s4, s4, 0
	sw		a0, 0(s4)
	j		eraseImpl__if_merge_13

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a5, 0(a5)
	addi	a5, a5, 8
	lw		a0, 0(a5)
	call	findLargest
	j		eraseImpl_split_block_2


	.globl	printTree
	.p2align	2
	.type	printTree, @function
printTree:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s0, 24(sp)
	sw		s1, 20(sp)
	sw		s2, 16(sp)
	sw		s7, 12(sp)
	sw		s8, 8(sp)
	mv		s1, a0
	li		s8, 0
	beq		s1, s8, printTree_exit
	j		printTree__if_merge

printTree_exit:
	lw		s8, 8(sp)
	lw		s7, 12(sp)
	lw		s2, 16(sp)
	lw		s1, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

printTree__if_merge:
	addi	s8, s1, 4
	lw		s8, 0(s8)
	addi	s8, s8, 4
	lw		s8, 0(s8)
	li		s7, 0
	beq		s8, s7, printTree_split_block_2
	j		printTree_fake_fake_printTree_1_printTree__if_merge

printTree_split_block_2:
	addi	s8, s1, 8
	lw		a0, 0(s8)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s8, s1, 12
	lw		a0, 0(s8)
	call	__builtin_printlnInt
	addi	s1, s1, 4
	lw		s1, 0(s1)
	addi	s1, s1, 8
	lw		s8, 0(s1)
	li		s1, 0
	beq		s8, s1, printTree_exit
	j		printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s1, s8, 4
	lw		s7, 0(s1)
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
	lw		s1, 0(s1)
	addi	s1, s1, 8
	lw		a0, 0(s1)
	call	printTree
	j		printTree_exit

printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s7, s8, 4
	lw		s7, 0(s7)
	addi	s7, s7, 4
	lw		s0, 0(s7)
	li		s7, 0
	beq		s0, s7, printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree__if_merge

printTree_split_block:
	addi	s7, s8, 8
	lw		a0, 0(s7)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s8, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	addi	s8, s8, 4
	lw		s8, 0(s8)
	addi	s8, s8, 8
	lw		a0, 0(s8)
	call	printTree
	j		printTree_split_block_2

printTree_fake_fake_printTree_2_printTree__if_merge:
	addi	s7, s0, 4
	lw		s7, 0(s7)
	addi	s7, s7, 4
	lw		s7, 0(s7)
	li		s2, 0
	beq		s7, s2, printTree_fake_fake_printTree_2_printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s2, s7, 4
	lw		a5, 0(s2)
	addi	a5, a5, 4
	lw		a0, 0(a5)
	call	printTree
	addi	a5, s7, 8
	lw		a0, 0(a5)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s7, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	lw		s7, 0(s2)
	addi	s7, s7, 8
	lw		a0, 0(s7)
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block

printTree_fake_fake_printTree_2_printTree_split_block:
	addi	s7, s0, 8
	lw		a0, 0(s7)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s0, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	addi	s7, s0, 4
	lw		s7, 0(s7)
	addi	s7, s7, 8
	lw		s0, 0(s7)
	li		s7, 0
	beq		s0, s7, printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s7, s0, 4
	lw		s2, 0(s7)
	addi	s2, s2, 4
	lw		a0, 0(s2)
	call	printTree
	addi	s2, s0, 8
	lw		a0, 0(s2)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s0, s0, 12
	lw		a0, 0(s0)
	call	__builtin_printlnInt
	lw		s7, 0(s7)
	addi	s7, s7, 8
	lw		a0, 0(s7)
	call	printTree
	j		printTree_split_block


	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -48
	sw		ra, 44(sp)
	sw		s0, 40(sp)
	sw		s2, 36(sp)
	sw		s4, 32(sp)
	sw		s5, 28(sp)
	sw		s6, 24(sp)
	sw		s7, 20(sp)
	sw		s9, 16(sp)
	sw		s10, 12(sp)
	sw		s11, 8(sp)
	lui		s4, %hi(MAX)
	lw		s6, %lo(MAX)(s4)
	lui		s4, %hi(root)
	lw		s4, %lo(root)(s4)
	lui		s9, %hi(MaxRandInt)
	lw		s0, %lo(MaxRandInt)(s9)
	call	__builtin_getInt
	li		s9, 10
	div		s9, s0, s9
	li		s7, 8
	mul		s10, s7, s9
	li		s7, 0
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations__for_cond:
	li		s9, 50000
	blt		s7, s9, main_fake_generateOperations_split_block_9
	j		main_split_block

main_fake_generateOperations_split_block_9:
	slli	s9, a0, 13
	xor		s2, a0, s9
	li		s9, 2147483647
	and		s9, s2, s9
	srai	s2, s9, 17
	xor		s9, s9, s2
	slli	s2, s9, 5
	xor		s9, s9, s2
	li		s2, 2147483647
	and		s11, s9, s2
	rem		s2, s11, s6
	slli	s9, s11, 13
	xor		s11, s11, s9
	li		s9, 2147483647
	and		s9, s11, s9
	srai	s11, s9, 17
	xor		s9, s9, s11
	slli	s11, s9, 5
	xor		s11, s9, s11
	li		s9, 2147483647
	and		s11, s11, s9
	blt		s11, s10, main_fake_generateOperations_fake_randOp__if_then_3
	j		main_fake_generateOperations_fake_randOp__if_merge_3

main_fake_generateOperations_fake_randOp__if_then_3:
	li		s9, 1
	j		main_fake_generateOperations_split_block_10

main_fake_generateOperations_split_block_10:
	li		s5, 1
	beq		s9, s5, main_fake_generateOperations__if_then_3
	j		main_fake_generateOperations__if_else_3

main_fake_generateOperations__if_then_3:
	li		s9, 0
	bne		s4, s9, main_fake_generateOperations_fake_insert__if_then_3
	j		main_fake_generateOperations_fake_insert_split_block_3

main_fake_generateOperations_fake_insert_split_block_3:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s9, s4, 4
	li		a0, 12
	call	malloc
	li		s5, 2
	sw		s5, 0(a0)
	sw		a0, 0(s9)
	addi	s5, s4, 8
	sw		s2, 0(s5)
	addi	s5, s4, 12
	li		s2, 1
	sw		s2, 0(s5)
	addi	s5, s4, 0
	li		s2, 0
	sw		s2, 0(s5)
	lw		s2, 0(s9)
	addi	s2, s2, 4
	li		s5, 0
	sw		s5, 0(s2)
	lw		s9, 0(s9)
	addi	s9, s9, 8
	li		s2, 0
	sw		s2, 0(s9)
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations__for_step_3:
	addi	s7, s7, 1
	mv		a0, s11
	j		main_fake_generateOperations__for_cond

main_fake_generateOperations_fake_insert__if_then_3:
	li		s9, 0
	beq		s4, s9, main_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_7

main_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s9, s5, 4
	li		a0, 12
	call	malloc
	li		a5, 2
	sw		a5, 0(a0)
	sw		a0, 0(s9)
	addi	a5, s5, 8
	sw		s2, 0(a5)
	addi	s2, s5, 12
	li		a5, 1
	sw		a5, 0(s2)
	addi	a5, s5, 0
	li		s2, 0
	sw		s2, 0(a5)
	lw		s2, 0(s9)
	addi	s2, s2, 4
	li		a5, 0
	sw		a5, 0(s2)
	lw		s9, 0(s9)
	addi	s2, s9, 8
	li		s9, 0
	sw		s9, 0(s2)
	li		s9, 4
	lw		s9, 0(s9)
	addi	s9, s9, 0
	sw		s5, 0(s9)
	j		main_fake_generateOperations__for_step_3

main_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s5, s4, 8
	lw		s9, 0(s5)
	beq		s9, s2, main_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_8

main_fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	s2, s4, 12
	lw		s9, 0(s2)
	addi	s9, s9, 1
	sw		s9, 0(s2)
	j		main_fake_generateOperations__for_step_3

main_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	li		a2, 0
	lw		s9, 0(s5)
	blt		s9, s2, main_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl__if_then_6:
	li		a2, 1
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_9

main_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s9, s4, 4
	lw		s5, 0(s9)
	li		s9, 4
	mul		s9, a2, s9
	addi	s9, s9, 4
	add		s9, s9, s5
	lw		a0, 0(s9)
	mv		a1, s4
	mv		a3, s2
	call	insertImpl
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations__if_else_3:
	li		s9, 0
	beq		s4, s9, main_fake_generateOperations__for_step_3
	j		main_fake_generateOperations_fake_erase__if_merge_3

main_fake_generateOperations_fake_erase__if_merge_3:
	lui		s9, %hi(root)
	sw		s4, %lo(root)(s9)
	mv		a0, s4
	li		a1, 0
	li		a2, -1
	mv		a3, s2
	call	eraseImpl
	lui		s4, %hi(root)
	lw		s4, %lo(root)(s4)
	j		main_fake_generateOperations__for_step_3

main_fake_generateOperations_fake_randOp__if_merge_3:
	li		s9, 2
	j		main_fake_generateOperations_split_block_10

main_split_block:
	li		s9, 10
	div		s7, s0, s9
	li		s9, 2
	mul		s2, s9, s7
	li		s7, 0
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations__for_cond_2:
	li		s9, 100000
	blt		s7, s9, main_fake_generateOperations_split_block
	j		main_split_block_3

main_fake_generateOperations_split_block:
	slli	s9, a0, 13
	xor		s11, a0, s9
	li		s9, 2147483647
	and		s9, s11, s9
	srai	s11, s9, 17
	xor		s11, s9, s11
	slli	s9, s11, 5
	xor		s9, s11, s9
	li		s11, 2147483647
	and		s11, s9, s11
	rem		s9, s11, s6
	slli	s10, s11, 13
	xor		s10, s11, s10
	li		s11, 2147483647
	and		s10, s10, s11
	srai	s11, s10, 17
	xor		s11, s10, s11
	slli	s10, s11, 5
	xor		s11, s11, s10
	li		s10, 2147483647
	and		s11, s11, s10
	blt		s11, s2, main_fake_generateOperations_fake_randOp__if_then
	j		main_fake_generateOperations_fake_randOp__if_merge

main_fake_generateOperations_fake_randOp__if_then:
	li		s10, 1
	j		main_fake_generateOperations_split_block_2

main_fake_generateOperations_split_block_2:
	li		s5, 1
	beq		s10, s5, main_fake_generateOperations__if_then
	j		main_fake_generateOperations__if_else

main_fake_generateOperations__if_then:
	li		s10, 0
	bne		s4, s10, main_fake_generateOperations_fake_insert__if_then
	j		main_fake_generateOperations_fake_insert_split_block

main_fake_generateOperations_fake_insert_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s10, s4, 4
	li		a0, 12
	call	malloc
	li		s5, 2
	sw		s5, 0(a0)
	sw		a0, 0(s10)
	addi	s5, s4, 8
	sw		s9, 0(s5)
	addi	s9, s4, 12
	li		s5, 1
	sw		s5, 0(s9)
	addi	s5, s4, 0
	li		s9, 0
	sw		s9, 0(s5)
	lw		s9, 0(s10)
	addi	s5, s9, 4
	li		s9, 0
	sw		s9, 0(s5)
	lw		s9, 0(s10)
	addi	s10, s9, 8
	li		s9, 0
	sw		s9, 0(s10)
	j		main_fake_generateOperations__for_step

main_fake_generateOperations__for_step:
	addi	s7, s7, 1
	mv		a0, s11
	j		main_fake_generateOperations__for_cond_2

main_fake_generateOperations_fake_insert__if_then:
	li		s10, 0
	beq		s4, s10, main_fake_fake_insertImpl_1_insertImpl_split_block
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge

main_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s5, s10, 4
	li		a0, 12
	call	malloc
	li		a5, 2
	sw		a5, 0(a0)
	sw		a0, 0(s5)
	addi	a5, s10, 8
	sw		s9, 0(a5)
	addi	s9, s10, 12
	li		a5, 1
	sw		a5, 0(s9)
	addi	a5, s10, 0
	li		s9, 0
	sw		s9, 0(a5)
	lw		s9, 0(s5)
	addi	s9, s9, 4
	li		a5, 0
	sw		a5, 0(s9)
	lw		s9, 0(s5)
	addi	s5, s9, 8
	li		s9, 0
	sw		s9, 0(s5)
	li		s9, 4
	lw		s9, 0(s9)
	addi	s9, s9, 0
	sw		s10, 0(s9)
	j		main_fake_generateOperations__for_step

main_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s5, s4, 8
	lw		s10, 0(s5)
	beq		s10, s9, main_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_2

main_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, s4, 12
	lw		s9, 0(s10)
	addi	s9, s9, 1
	sw		s9, 0(s10)
	j		main_fake_generateOperations__for_step

main_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		a2, 0
	lw		s10, 0(s5)
	blt		s10, s9, main_fake_fake_insertImpl_1_insertImpl__if_then
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_then:
	li		a2, 1
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_3

main_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s10, s4, 4
	lw		s5, 0(s10)
	li		s10, 4
	mul		s10, a2, s10
	addi	s10, s10, 4
	add		s10, s10, s5
	lw		a0, 0(s10)
	mv		a1, s4
	mv		a3, s9
	call	insertImpl
	j		main_fake_generateOperations__for_step

main_fake_generateOperations__if_else:
	li		s10, 0
	beq		s4, s10, main_fake_generateOperations__for_step
	j		main_fake_generateOperations_fake_erase__if_merge

main_fake_generateOperations_fake_erase__if_merge:
	lui		s10, %hi(root)
	sw		s4, %lo(root)(s10)
	mv		a0, s4
	li		a1, 0
	li		a2, -1
	mv		a3, s9
	call	eraseImpl
	lui		s4, %hi(root)
	lw		s4, %lo(root)(s4)
	j		main_fake_generateOperations__for_step

main_fake_generateOperations_fake_randOp__if_merge:
	li		s10, 2
	j		main_fake_generateOperations_split_block_2

main_split_block_3:
	li		s9, 10
	div		s7, s0, s9
	li		s9, 4
	mul		s7, s9, s7
	li		s0, 0
	mv		s9, a0
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations__for_cond_3:
	li		s2, 50000
	blt		s0, s2, main_fake_generateOperations_split_block_5
	j		main_split_block_4

main_fake_generateOperations_split_block_5:
	slli	s2, s9, 13
	xor		s9, s9, s2
	li		s2, 2147483647
	and		s2, s9, s2
	srai	s9, s2, 17
	xor		s2, s2, s9
	slli	s9, s2, 5
	xor		s9, s2, s9
	li		s2, 2147483647
	and		s11, s9, s2
	rem		s2, s11, s6
	slli	s9, s11, 13
	xor		s11, s11, s9
	li		s9, 2147483647
	and		s9, s11, s9
	srai	s11, s9, 17
	xor		s9, s9, s11
	slli	s11, s9, 5
	xor		s11, s9, s11
	li		s9, 2147483647
	and		s9, s11, s9
	blt		s9, s7, main_fake_generateOperations_fake_randOp__if_then_2
	j		main_fake_generateOperations_fake_randOp__if_merge_2

main_fake_generateOperations_fake_randOp__if_then_2:
	li		s11, 1
	j		main_fake_generateOperations_split_block_6

main_fake_generateOperations_split_block_6:
	li		s10, 1
	beq		s11, s10, main_fake_generateOperations__if_then_2
	j		main_fake_generateOperations__if_else_2

main_fake_generateOperations__if_else_2:
	li		s11, 0
	beq		s4, s11, main_fake_generateOperations__for_step_2
	j		main_fake_generateOperations_fake_erase__if_merge_2

main_fake_generateOperations__for_step_2:
	addi	s0, s0, 1
	j		main_fake_generateOperations__for_cond_3

main_fake_generateOperations_fake_erase__if_merge_2:
	lui		s11, %hi(root)
	sw		s4, %lo(root)(s11)
	mv		a0, s4
	li		a1, 0
	li		a2, -1
	mv		a3, s2
	call	eraseImpl
	lui		s4, %hi(root)
	lw		s4, %lo(root)(s4)
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations__if_then_2:
	li		s11, 0
	bne		s4, s11, main_fake_generateOperations_fake_insert__if_then_2
	j		main_fake_generateOperations_fake_insert_split_block_2

main_fake_generateOperations_fake_insert__if_then_2:
	li		s11, 0
	beq		s4, s11, main_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_4

main_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s11, s10, 4
	li		a0, 12
	call	malloc
	li		s5, 2
	sw		s5, 0(a0)
	sw		a0, 0(s11)
	addi	s5, s10, 8
	sw		s2, 0(s5)
	addi	s5, s10, 12
	li		s2, 1
	sw		s2, 0(s5)
	addi	s2, s10, 0
	li		s5, 0
	sw		s5, 0(s2)
	lw		s2, 0(s11)
	addi	s5, s2, 4
	li		s2, 0
	sw		s2, 0(s5)
	lw		s2, 0(s11)
	addi	s11, s2, 8
	li		s2, 0
	sw		s2, 0(s11)
	li		s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		s10, 0(s2)
	j		main_fake_generateOperations__for_step_2

main_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s11, s4, 8
	lw		s10, 0(s11)
	beq		s10, s2, main_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_5

main_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	li		a2, 0
	lw		s11, 0(s11)
	blt		s11, s2, main_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_then_3:
	li		a2, 1
	j		main_fake_fake_insertImpl_1_insertImpl__if_merge_6

main_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s11, s4, 4
	lw		s10, 0(s11)
	li		s11, 4
	mul		s11, a2, s11
	addi	s11, s11, 4
	add		s11, s11, s10
	lw		a0, 0(s11)
	mv		a1, s4
	mv		a3, s2
	call	insertImpl
	j		main_fake_generateOperations__for_step_2

main_fake_fake_insertImpl_1_insertImpl__if_then_4:
	addi	s11, s4, 12
	lw		s2, 0(s11)
	addi	s2, s2, 1
	sw		s2, 0(s11)
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations_fake_insert_split_block_2:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s11, s4, 4
	li		a0, 12
	call	malloc
	li		s10, 2
	sw		s10, 0(a0)
	sw		a0, 0(s11)
	addi	s10, s4, 8
	sw		s2, 0(s10)
	addi	s2, s4, 12
	li		s10, 1
	sw		s10, 0(s2)
	addi	s2, s4, 0
	li		s10, 0
	sw		s10, 0(s2)
	lw		s2, 0(s11)
	addi	s10, s2, 4
	li		s2, 0
	sw		s2, 0(s10)
	lw		s2, 0(s11)
	addi	s2, s2, 8
	li		s11, 0
	sw		s11, 0(s2)
	j		main_fake_generateOperations__for_step_2

main_fake_generateOperations_fake_randOp__if_merge_2:
	li		s11, 2
	j		main_fake_generateOperations_split_block_6

main_split_block_4:
	li		s7, 0
	beq		s4, s7, main_split_block_5
	j		main_fake_fake_printTree_1_printTree__if_merge

main_split_block_5:
	lui		s7, %hi(root)
	sw		s4, %lo(root)(s7)
	lui		s4, %hi(seed)
	sw		s9, %lo(seed)(s4)
	li		a0, 0
	lw		s11, 8(sp)
	lw		s10, 12(sp)
	lw		s9, 16(sp)
	lw		s7, 20(sp)
	lw		s6, 24(sp)
	lw		s5, 28(sp)
	lw		s4, 32(sp)
	lw		s2, 36(sp)
	lw		s0, 40(sp)
	lw		ra, 44(sp)
	addi	sp, sp, 48
	jr		ra

main_fake_fake_printTree_1_printTree__if_merge:
	addi	s0, s4, 4
	lw		s7, 0(s0)
	addi	s7, s7, 4
	lw		a0, 0(s7)
	call	printTree
	addi	s7, s4, 8
	lw		a0, 0(s7)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s4, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	lw		s7, 0(s0)
	addi	s7, s7, 8
	lw		a0, 0(s7)
	call	printTree
	j		main_split_block_5


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	lui		t1, %hi(MaxRandInt)
	li		a5, 2147483647
	sw		a5, %lo(MaxRandInt)(t1)
	lui		t1, %hi(root)
	li		a5, 0
	sw		a5, %lo(root)(t1)
	lui		a5, %hi(MAX)
	li		t1, 128
	sw		t1, %lo(MAX)(a5)
	call	_main
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


