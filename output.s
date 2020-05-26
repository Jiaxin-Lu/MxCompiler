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
	sw		s4, 16(sp)
	sw		s5, 12(sp)
	sw		s10, 8(sp)
	sw		s11, 4(sp)
	mv		s4, a0
	mv		s10, a1
	mv		s5, a2
	mv		s0, a3
	beq		s4, zero, insertImpl_split_block
	j		insertImpl__if_merge

insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s11, s4, 4
	li		a0, 12
	call	malloc
	li		s3, 2
	sw		s3, 0(a0)
	sw		a0, 0(s11)
	addi	s3, s4, 8
	sw		s0, 0(s3)
	addi	s3, s4, 12
	li		s0, 1
	sw		s0, 0(s3)
	addi	s0, s4, 0
	sw		s10, 0(s0)
	lw		s0, 0(s11)
	addi	s3, s0, 4
	li		s0, 0
	sw		s0, 0(s3)
	lw		s0, 0(s11)
	addi	s11, s0, 8
	li		s0, 0
	sw		s0, 0(s11)
	addi	s10, s10, 4
	lw		s0, 0(s10)
	slli	s10, s5, 2
	addi	s10, s10, 4
	add		s10, s10, s0
	sw		s4, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_exit:
	lw		s11, 4(sp)
	lw		s10, 8(sp)
	lw		s5, 12(sp)
	lw		s4, 16(sp)
	lw		s3, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

insertImpl__if_merge:
	addi	s5, s4, 8
	lw		s10, 0(s5)
	beq		s10, s0, insertImpl__if_then_2
	j		insertImpl__if_merge_2

insertImpl__if_merge_2:
	li		s10, 0
	lw		s5, 0(s5)
	blt		s5, s0, insertImpl__if_then
	j		insertImpl__if_merge_3

insertImpl__if_then:
	li		s10, 1
	j		insertImpl__if_merge_3

insertImpl__if_merge_3:
	addi	s11, s4, 4
	lw		s5, 0(s11)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		s5, s10, s5
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s3, s5, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s5, 8
	sw		s0, 0(t3)
	addi	s0, s5, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s5, 0
	sw		s4, 0(s0)
	lw		s0, 0(s3)
	addi	s0, s0, 4
	li		s4, 0
	sw		s4, 0(s0)
	lw		s0, 0(s3)
	addi	s4, s0, 8
	li		s0, 0
	sw		s0, 0(s4)
	lw		s0, 0(s11)
	add		s10, s10, s0
	sw		s5, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s11, s5, 8
	lw		s10, 0(s11)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s0, s5, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s4, 0
	lw		s10, 0(s11)
	blt		s10, s0, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s10, s5, 4
	lw		s11, 0(s10)
	slli	s4, s4, 2
	addi	s4, s4, 4
	add		s11, s4, s11
	lw		s11, 0(s11)
	beq		s11, zero, insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s11, a0
	addi	s3, s11, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s11, 8
	sw		s0, 0(t3)
	addi	s0, s11, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s11, 0
	sw		s5, 0(s0)
	lw		s0, 0(s3)
	addi	s0, s0, 4
	li		s5, 0
	sw		s5, 0(s0)
	lw		s0, 0(s3)
	addi	s0, s0, 8
	li		s5, 0
	sw		s5, 0(s0)
	lw		s10, 0(s10)
	add		s10, s4, s10
	sw		s11, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s5, s11, 8
	lw		s10, 0(s5)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s10, s11, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s10, 0
	lw		s5, 0(s5)
	blt		s5, s0, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s4, s11, 4
	lw		s5, 0(s4)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		s5, s10, s5
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s4, s5, 8
	lw		s10, 0(s4)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s10, 0
	lw		s4, 0(s4)
	blt		s4, s0, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s11, s5, 4
	lw		s3, 0(s11)
	slli	s10, s10, 2
	addi	s4, s10, 4
	add		s10, s4, s3
	lw		s10, 0(s10)
	beq		s10, zero, insertImpl_fake_fake_insertImpl_3_insertImpl_split_block_3
	j		insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_3_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s3, s10, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s10, 8
	sw		s0, 0(t3)
	addi	t3, s10, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s10, 0
	sw		s5, 0(s0)
	lw		s0, 0(s3)
	addi	s5, s0, 4
	li		s0, 0
	sw		s0, 0(s5)
	lw		s0, 0(s3)
	addi	s5, s0, 8
	li		s0, 0
	sw		s0, 0(s5)
	lw		s0, 0(s11)
	add		s0, s4, s0
	sw		s10, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge:
	addi	s4, s10, 8
	lw		s5, 0(s4)
	beq		s5, s0, insertImpl_fake_fake_insertImpl_3_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_2:
	li		s5, 0
	lw		s4, 0(s4)
	blt		s4, s0, insertImpl_fake_fake_insertImpl_3_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl__if_then_2:
	li		s5, 1
	j		insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3:
	addi	s4, s10, 4
	lw		s3, 0(s4)
	slli	s5, s5, 2
	addi	s11, s5, 4
	add		s5, s11, s3
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s4, s5, 8
	lw		s10, 0(s4)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s10, 0
	lw		s4, 0(s4)
	blt		s4, s0, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s11, s5, 4
	lw		s4, 0(s11)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		s4, s10, s4
	lw		s4, 0(s4)
	beq		s4, zero, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s3, s4, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s4, 8
	sw		s0, 0(t3)
	addi	s0, s4, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s4, 0
	sw		s5, 0(s0)
	lw		s0, 0(s3)
	addi	s5, s0, 4
	li		s0, 0
	sw		s0, 0(s5)
	lw		s0, 0(s3)
	addi	s5, s0, 8
	li		s0, 0
	sw		s0, 0(s5)
	lw		s0, 0(s11)
	add		s10, s10, s0
	sw		s4, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s10, s4, 8
	lw		s5, 0(s10)
	beq		s5, s0, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s5, 0
	lw		s10, 0(s10)
	blt		s10, s0, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s10, s4, 4
	lw		s3, 0(s10)
	slli	s5, s5, 2
	addi	s11, s5, 4
	add		s5, s11, s3
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s3, s5, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s5, 8
	sw		s0, 0(t3)
	addi	t3, s5, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s5, 0
	sw		s4, 0(s0)
	lw		s0, 0(s3)
	addi	s4, s0, 4
	li		s0, 0
	sw		s0, 0(s4)
	lw		s0, 0(s3)
	addi	s0, s0, 8
	li		s4, 0
	sw		s4, 0(s0)
	lw		s10, 0(s10)
	add		s10, s11, s10
	sw		s5, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s4, s5, 8
	lw		s10, 0(s4)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s10, 0
	lw		s4, 0(s4)
	blt		s4, s0, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s11, s5, 4
	lw		s4, 0(s11)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		s4, s10, s4
	lw		s4, 0(s4)
	beq		s4, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_split_block_4
	j		insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_split_block_4:
	li		a0, 16
	call	malloc
	mv		s3, a0
	addi	s4, s3, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s4)
	addi	t3, s3, 8
	sw		s0, 0(t3)
	addi	s0, s3, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s3, 0
	sw		s5, 0(s0)
	lw		s0, 0(s4)
	addi	s5, s0, 4
	li		s0, 0
	sw		s0, 0(s5)
	lw		s0, 0(s4)
	addi	s5, s0, 8
	li		s0, 0
	sw		s0, 0(s5)
	lw		s0, 0(s11)
	add		s10, s10, s0
	sw		s3, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge:
	addi	s5, s4, 8
	lw		s10, 0(s5)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_4_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl__if_then_2:
	addi	s0, s4, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_2:
	li		s10, 0
	lw		s5, 0(s5)
	blt		s5, s0, insertImpl_fake_fake_insertImpl_4_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl__if_then:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_3:
	addi	s11, s4, 4
	lw		s5, 0(s11)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		s5, s10, s5
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s4, s5, 8
	lw		s10, 0(s4)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s10, 0
	lw		s4, 0(s4)
	blt		s4, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s4, s5, 4
	lw		s3, 0(s4)
	slli	s10, s10, 2
	addi	s11, s10, 4
	add		s10, s11, s3
	lw		s10, 0(s10)
	beq		s10, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s3, s10, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s10, 8
	sw		s0, 0(t3)
	addi	t3, s10, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s10, 0
	sw		s5, 0(s0)
	lw		s0, 0(s3)
	addi	s0, s0, 4
	li		s5, 0
	sw		s5, 0(s0)
	lw		s0, 0(s3)
	addi	s5, s0, 8
	li		s0, 0
	sw		s0, 0(s5)
	lw		s0, 0(s4)
	add		s0, s11, s0
	sw		s10, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s5, s10, 8
	lw		s4, 0(s5)
	beq		s4, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	addi	s0, s10, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s4, 0
	lw		s5, 0(s5)
	blt		s5, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s5, s10, 4
	lw		s11, 0(s5)
	slli	s4, s4, 2
	addi	s4, s4, 4
	add		s11, s4, s11
	lw		s11, 0(s11)
	beq		s11, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s5, s11, 8
	lw		s10, 0(s5)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s10, 0
	lw		s5, 0(s5)
	blt		s5, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s4, s11, 4
	lw		s3, 0(s4)
	slli	s10, s10, 2
	addi	s5, s10, 4
	add		s10, s5, s3
	lw		s10, 0(s10)
	beq		s10, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_split_block_3
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s3, a0
	addi	s10, s3, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s10)
	addi	t3, s3, 8
	sw		s0, 0(t3)
	addi	s0, s3, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s3, 0
	sw		s11, 0(s0)
	lw		s0, 0(s10)
	addi	s11, s0, 4
	li		s0, 0
	sw		s0, 0(s11)
	lw		s10, 0(s10)
	addi	s0, s10, 8
	li		s10, 0
	sw		s10, 0(s0)
	lw		s10, 0(s4)
	add		s10, s5, s10
	sw		s3, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge:
	addi	s4, s10, 8
	lw		s5, 0(s4)
	beq		s5, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_then_2:
	addi	s10, s10, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_2:
	li		s5, 0
	lw		s4, 0(s4)
	blt		s4, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_then:
	li		s5, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3:
	addi	s4, s10, 4
	lw		s3, 0(s4)
	slli	s5, s5, 2
	addi	s11, s5, 4
	add		s5, s11, s3
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s3, s5, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s5, 8
	sw		s0, 0(t3)
	addi	t3, s5, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s5, 0
	sw		s10, 0(s0)
	lw		s10, 0(s3)
	addi	s10, s10, 4
	li		s0, 0
	sw		s0, 0(s10)
	lw		s10, 0(s3)
	addi	s0, s10, 8
	li		s10, 0
	sw		s10, 0(s0)
	lw		s10, 0(s4)
	add		s10, s11, s10
	sw		s5, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s4, s5, 8
	lw		s10, 0(s4)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s10, 0
	lw		s4, 0(s4)
	blt		s4, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s11, s5, 4
	lw		s4, 0(s11)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		s4, s10, s4
	lw		s4, 0(s4)
	beq		s4, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s3, a0
	addi	s4, s3, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s4)
	addi	t3, s3, 8
	sw		s0, 0(t3)
	addi	s0, s3, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s3, 0
	sw		s5, 0(s0)
	lw		s0, 0(s4)
	addi	s0, s0, 4
	li		s5, 0
	sw		s5, 0(s0)
	lw		s0, 0(s4)
	addi	s5, s0, 8
	li		s0, 0
	sw		s0, 0(s5)
	lw		s0, 0(s11)
	add		s10, s10, s0
	sw		s3, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s5, s4, 8
	lw		s10, 0(s5)
	beq		s10, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s10, 0
	lw		s5, 0(s5)
	blt		s5, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s5, s4, 4
	lw		s3, 0(s5)
	slli	s10, s10, 2
	addi	s11, s10, 4
	add		s10, s11, s3
	lw		a1, 0(s10)
	beq		a1, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s10, a1, 8
	lw		s5, 0(s10)
	beq		s5, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s0, a1, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		a2, 0
	lw		s10, 0(s10)
	blt		s10, s0, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		a2, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s10, a1, 4
	lw		s5, 0(s10)
	slli	s10, a2, 2
	addi	s10, s10, 4
	add		s10, s10, s5
	lw		a0, 0(s10)
	mv		a3, s0
	call	insertImpl
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s3, s10, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s10, 8
	sw		s0, 0(t3)
	addi	t3, s10, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s10, 0
	sw		s4, 0(s0)
	lw		s0, 0(s3)
	addi	s4, s0, 4
	li		s0, 0
	sw		s0, 0(s4)
	lw		s0, 0(s3)
	addi	s0, s0, 8
	li		s4, 0
	sw		s4, 0(s0)
	lw		s0, 0(s5)
	add		s0, s11, s0
	sw		s10, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	addi	s0, s4, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s0, s5, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, s11, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s11, a0
	addi	s3, s11, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s11, 8
	sw		s0, 0(t3)
	addi	s0, s11, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s11, 0
	sw		s10, 0(s0)
	lw		s10, 0(s3)
	addi	s10, s10, 4
	li		s0, 0
	sw		s0, 0(s10)
	lw		s10, 0(s3)
	addi	s10, s10, 8
	li		s0, 0
	sw		s0, 0(s10)
	lw		s10, 0(s5)
	add		s10, s4, s10
	sw		s11, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	li		s4, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s0, s5, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s3, s5, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s5, 8
	sw		s0, 0(t3)
	addi	t3, s5, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s5, 0
	sw		s4, 0(s0)
	lw		s0, 0(s3)
	addi	s0, s0, 4
	li		s4, 0
	sw		s4, 0(s0)
	lw		s0, 0(s3)
	addi	s0, s0, 8
	li		s4, 0
	sw		s4, 0(s0)
	lw		s0, 0(s11)
	add		s10, s10, s0
	sw		s5, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s0, s5, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		s5, 1
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s0, s4, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s10, 1
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, s5, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s3, a0
	addi	s5, s3, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s5)
	addi	t3, s3, 8
	sw		s0, 0(t3)
	addi	t3, s3, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s3, 0
	sw		s10, 0(s0)
	lw		s10, 0(s5)
	addi	s0, s10, 4
	li		s10, 0
	sw		s10, 0(s0)
	lw		s10, 0(s5)
	addi	s0, s10, 8
	li		s10, 0
	sw		s10, 0(s0)
	lw		s10, 0(s4)
	add		s10, s11, s10
	sw		s3, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl__if_then:
	addi	s0, s10, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s0, s5, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s3, s5, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s5, 8
	sw		s0, 0(t3)
	addi	s0, s5, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s5, 0
	sw		s11, 0(s0)
	lw		s0, 0(s3)
	addi	s11, s0, 4
	li		s0, 0
	sw		s0, 0(s11)
	lw		s0, 0(s3)
	addi	s0, s0, 8
	li		s11, 0
	sw		s11, 0(s0)
	lw		s0, 0(s4)
	add		s10, s10, s0
	sw		s5, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		s4, 1
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl__if_then_2:
	addi	s10, s4, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit


	.globl	findLargest
	.p2align	2
	.type	findLargest, @function
findLargest:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s2, 8(sp)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest__if_merge

findLargest_exit:
	lw		s2, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	s2, a0, 4
	lw		t3, 0(s2)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	addi	t3, a0, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	call	findLargest
	j		findLargest_exit


	.globl	eraseImpl
	.p2align	2
	.type	eraseImpl, @function
eraseImpl:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s2, 24(sp)
	sw		s3, 20(sp)
	sw		s4, 16(sp)
	mv		s3, s7
	sw		s8, 12(sp)
	sw		s11, 8(sp)
	mv		s7, a0
	mv		s11, a1
	mv		s2, a2
	mv		s8, a3
	lui		s4, %hi(root)
	lw		s4, %lo(root)(s4)
	beq		s7, zero, eraseImpl__if_then
	j		eraseImpl__if_merge

eraseImpl__if_merge:
	addi	t4, s7, 8
	lw		t3, 0(t4)
	bgt		t3, s8, eraseImpl__if_then_14
	j		eraseImpl__if_merge_2

eraseImpl__if_then_14:
	addi	t3, s7, 4
	lw		s2, 0(t3)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	beq		s2, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_28
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_14

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_28:
	li		a0, 0
	mv		s8, s4
	j		eraseImpl_exit

eraseImpl_exit:
	lui		s2, %hi(root)
	sw		s8, %lo(root)(s2)
	lw		s11, 8(sp)
	lw		s8, 12(sp)
	mv		s7, s3
	lw		s4, 16(sp)
	lw		s3, 20(sp)
	lw		s2, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_14:
	addi	s11, s2, 8
	lw		t4, 0(s11)
	bgt		t4, s8, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_15
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_15

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_15:
	addi	s7, s2, 4
	lw		s7, 0(s7)
	addi	s7, s7, 4
	lw		a0, 0(s7)
	lui		s7, %hi(root)
	sw		s4, %lo(root)(s7)
	mv		a1, s2
	li		a2, 0
	mv		a3, s8
	call	eraseImpl
	lui		s8, %hi(root)
	lw		s8, %lo(root)(s8)
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_15:
	lw		s11, 0(s11)
	blt		s11, s8, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_27
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_16

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_27:
	addi	s7, s2, 4
	lw		s7, 0(s7)
	addi	s7, s7, 8
	lw		a0, 0(s7)
	lui		s7, %hi(root)
	sw		s4, %lo(root)(s7)
	mv		a1, s2
	li		a2, 1
	mv		a3, s8
	call	eraseImpl
	lui		s8, %hi(root)
	lw		s8, %lo(root)(s8)
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_16:
	addi	t4, s2, 12
	lw		s11, 0(t4)
	addi	s11, s11, -1
	sw		s11, 0(t4)
	bgt		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_26
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_17

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_17:
	addi	t4, s2, 4
	lw		s11, 0(t4)
	addi	s11, s11, 4
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_22
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_18

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_18:
	lw		s11, 0(t4)
	addi	s11, s11, 4
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest__if_merge_3:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	call	findLargest
	j		eraseImpl_split_block_12

eraseImpl_split_block_12:
	addi	s11, s4, 8
	lw		s11, 0(s11)
	beq		s8, s11, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_16
	j		eraseImpl__parallel_copy__5

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_16:
	mv		s8, a0
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_19

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_19:
	addi	s11, a0, 8
	addi	s4, s2, 4
	lw		s4, 0(s4)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	s4, s4, 8
	lw		s11, 0(s11)
	lw		s4, 0(s4)
	bne		s11, s4, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_20
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_20

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_20:
	bne		s7, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_17
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_21

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_17:
	addi	s4, s7, 4
	lw		s4, 0(s4)
	addi	s4, s4, 4
	sw		a0, 0(s4)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_21

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_21:
	addi	s4, a0, 0
	sw		s7, 0(s4)
	addi	s7, a0, 4
	lw		s7, 0(s7)
	addi	s7, s7, 8
	addi	s11, s2, 4
	lw		s4, 0(s11)
	addi	s4, s4, 8
	lw		s4, 0(s4)
	sw		s4, 0(s7)
	lw		s7, 0(s11)
	addi	s7, s7, 8
	lw		s7, 0(s7)
	bne		s7, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_18
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_22

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_18:
	lw		s7, 0(s11)
	addi	s7, s7, 8
	lw		s7, 0(s7)
	addi	s7, s7, 0
	sw		a0, 0(s7)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_22

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_22:
	addi	s11, a0, 8
	addi	s4, s2, 4
	lw		s2, 0(s4)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s7, s2, 8
	lw		s2, 0(s11)
	lw		s7, 0(s7)
	bne		s2, s7, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_19
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_23

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_23:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_19:
	addi	s2, a0, 4
	lw		s2, 0(s2)
	addi	s7, s2, 4
	lw		s2, 0(s4)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	sw		s2, 0(s7)
	lw		s2, 0(s4)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		a0, 0(s2)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_23

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_20:
	addi	t4, a0, 0
	lw		s4, 0(t4)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	t3, s4, 8
	addi	s11, a0, 4
	lw		s4, 0(s11)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	sw		s4, 0(t3)
	lw		s4, 0(s11)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	bne		s4, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_21
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_20

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_21:
	lw		s4, 0(s11)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	s4, s4, 0
	lw		s11, 0(t4)
	sw		s11, 0(s4)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_20

eraseImpl__parallel_copy__5:
	mv		s8, s4
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_19

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_22:
	bne		s7, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_23
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_24

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_23:
	lw		s11, 0(t3)
	addi	t3, s11, 4
	lw		s11, 0(t4)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	sw		s11, 0(t3)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_24

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_24:
	addi	t3, s2, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	bne		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_24
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_25

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_25:
	addi	s7, s4, 8
	lw		s7, 0(s7)
	beq		s8, s7, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_25
	j		eraseImpl__parallel_copy__6

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_25:
	addi	s8, s2, 4
	lw		s8, 0(s8)
	addi	s8, s8, 8
	lw		s8, 0(s8)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_26

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_26:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__parallel_copy__6:
	mv		s8, s4
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_26

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_24:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	addi	s11, s11, 0
	sw		s7, 0(s11)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_25

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_26:
	li		a0, 1
	mv		s8, s4
	j		eraseImpl_exit

eraseImpl__if_merge_2:
	lw		t3, 0(t4)
	blt		t3, s8, eraseImpl__if_then_2
	j		eraseImpl__if_merge_3

eraseImpl__if_merge_3:
	addi	t3, s7, 12
	lw		t4, 0(t3)
	addi	t4, t4, -1
	sw		t4, 0(t3)
	mv		t3, t4
	bgt		t3, zero, eraseImpl__if_then_3
	j		eraseImpl__if_merge_4

eraseImpl__if_merge_4:
	addi	t4, s7, 4
	lw		t3, 0(t4)
	addi	t3, t3, 4
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl__if_then_4
	j		eraseImpl__if_merge_8

eraseImpl__if_merge_8:
	lw		t3, 0(t4)
	addi	t3, t3, 4
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_split_block_6:
	addi	t3, s4, 8
	lw		t3, 0(t3)
	beq		s8, t3, eraseImpl__if_then_8
	j		eraseImpl__parallel_copy__4

eraseImpl__if_then_8:
	mv		s8, a0
	j		eraseImpl__if_merge_9

eraseImpl__if_merge_9:
	addi	t4, a0, 8
	addi	s4, s7, 4
	lw		s4, 0(s4)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	t3, s4, 8
	lw		s4, 0(t4)
	lw		t3, 0(t3)
	bne		s4, t3, eraseImpl__if_then_12
	j		eraseImpl__if_merge_10

eraseImpl__if_then_12:
	addi	t6, a0, 0
	lw		s4, 0(t6)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	t4, s4, 8
	addi	t3, a0, 4
	lw		s4, 0(t3)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	sw		s4, 0(t4)
	lw		s4, 0(t3)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	bne		s4, zero, eraseImpl__if_then_13
	j		eraseImpl__if_merge_10

eraseImpl__if_then_13:
	lw		s4, 0(t3)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	t3, s4, 0
	lw		s4, 0(t6)
	sw		s4, 0(t3)
	j		eraseImpl__if_merge_10

eraseImpl__if_merge_10:
	bne		s11, zero, eraseImpl__if_then_11
	j		eraseImpl__if_merge_11

eraseImpl__if_then_11:
	addi	s4, s11, 4
	lw		s4, 0(s4)
	slli	s2, s2, 2
	addi	s2, s2, 4
	add		s2, s2, s4
	sw		a0, 0(s2)
	j		eraseImpl__if_merge_11

eraseImpl__if_merge_11:
	addi	s2, a0, 0
	sw		s11, 0(s2)
	addi	s2, a0, 4
	lw		s2, 0(s2)
	addi	s11, s2, 8
	addi	s4, s7, 4
	lw		s2, 0(s4)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	sw		s2, 0(s11)
	lw		s2, 0(s4)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	bne		s2, zero, eraseImpl__if_then_10
	j		eraseImpl__if_merge_12

eraseImpl__if_merge_12:
	addi	s4, a0, 8
	addi	s7, s7, 4
	lw		s2, 0(s7)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s4, 0(s4)
	lw		s2, 0(s2)
	bne		s4, s2, eraseImpl__if_then_9
	j		eraseImpl__if_merge_13

eraseImpl__if_then_9:
	addi	s2, a0, 4
	lw		s2, 0(s2)
	addi	s4, s2, 4
	lw		s2, 0(s7)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	sw		s2, 0(s4)
	lw		s2, 0(s7)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		a0, 0(s2)
	j		eraseImpl__if_merge_13

eraseImpl__if_merge_13:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_then_10:
	lw		s2, 0(s4)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		a0, 0(s2)
	j		eraseImpl__if_merge_12

eraseImpl__parallel_copy__4:
	mv		s8, s4
	j		eraseImpl__if_merge_9

eraseImpl_fake_fake_findLargest_1_findLargest__if_merge:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t3, a0, 4
	lw		t4, 0(t3)
	addi	t4, t4, 8
	lw		t4, 0(t4)
	beq		t4, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t3)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t3, a0, 4
	lw		t4, 0(t3)
	addi	t4, t4, 8
	lw		t4, 0(t4)
	beq		t4, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		t3, 0(t3)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t3, a0, 4
	lw		t4, 0(t3)
	addi	t4, t4, 8
	lw		t4, 0(t4)
	beq		t4, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest__if_merge_2:
	lw		t3, 0(t3)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t3, a0, 4
	lw		t4, 0(t3)
	addi	t4, t4, 8
	lw		t4, 0(t4)
	beq		t4, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		t3, 0(t3)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t3, a0, 4
	lw		t4, 0(t3)
	addi	t4, t4, 8
	lw		t4, 0(t4)
	beq		t4, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t3)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t3, a0, 4
	lw		t4, 0(t3)
	addi	t4, t4, 8
	lw		t4, 0(t4)
	beq		t4, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		t3, 0(t3)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t3, a0, 4
	lw		t4, 0(t3)
	addi	t4, t4, 8
	lw		t4, 0(t4)
	beq		t4, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t3)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t4, a0, 4
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		t3, 0(t4)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	addi	t3, a0, 4
	lw		t4, 0(t3)
	addi	t4, t4, 8
	lw		t4, 0(t4)
	beq		t4, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		t3, 0(t3)
	addi	t3, t3, 8
	lw		a0, 0(t3)
	call	findLargest
	j		eraseImpl_split_block_6

eraseImpl__if_then_4:
	bne		s11, zero, eraseImpl__if_then_5
	j		eraseImpl__if_merge_5

eraseImpl__if_then_5:
	addi	t3, s11, 4
	lw		t3, 0(t3)
	slli	s2, s2, 2
	addi	s2, s2, 4
	add		t3, s2, t3
	lw		s2, 0(t4)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	sw		s2, 0(t3)
	j		eraseImpl__if_merge_5

eraseImpl__if_merge_5:
	addi	t3, s7, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	bne		s2, zero, eraseImpl__if_then_7
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_6:
	addi	s2, s4, 8
	lw		s2, 0(s2)
	beq		s8, s2, eraseImpl__if_then_6
	j		eraseImpl__parallel_copy__3

eraseImpl__if_then_6:
	addi	s8, s7, 4
	lw		s8, 0(s8)
	addi	s8, s8, 8
	lw		s8, 0(s8)
	j		eraseImpl__if_merge_7

eraseImpl__if_merge_7:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__parallel_copy__3:
	mv		s8, s4
	j		eraseImpl__if_merge_7

eraseImpl__if_then_7:
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		s11, 0(s2)
	j		eraseImpl__if_merge_6

eraseImpl__if_then_3:
	li		a0, 1
	mv		s8, s4
	j		eraseImpl_exit

eraseImpl__if_then_2:
	addi	t3, s7, 4
	lw		s2, 0(t3)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge:
	addi	s11, s2, 8
	lw		t4, 0(s11)
	bgt		t4, s8, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_14
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_2

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_2:
	lw		s11, 0(s11)
	blt		s11, s8, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_2
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_3

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_2:
	addi	s7, s2, 4
	lw		s7, 0(s7)
	addi	s7, s7, 8
	lw		a0, 0(s7)
	lui		s7, %hi(root)
	sw		s4, %lo(root)(s7)
	mv		a1, s2
	li		a2, 1
	mv		a3, s8
	call	eraseImpl
	lui		s8, %hi(root)
	lw		s8, %lo(root)(s8)
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_3:
	addi	t4, s2, 12
	lw		s11, 0(t4)
	addi	s11, s11, -1
	sw		s11, 0(t4)
	bgt		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_3
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_4

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_3:
	li		a0, 1
	mv		s8, s4
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_4:
	addi	t4, s2, 4
	lw		s11, 0(t4)
	addi	s11, s11, 4
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_10
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_5

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_5:
	lw		s11, 0(t4)
	addi	s11, s11, 4
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_split_block_2:
	addi	s11, s4, 8
	lw		s11, 0(s11)
	beq		s8, s11, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_4
	j		eraseImpl__parallel_copy_

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_4:
	mv		s8, a0
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_6

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_6:
	addi	s11, a0, 8
	addi	s4, s2, 4
	lw		s4, 0(s4)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	t3, s4, 8
	lw		s4, 0(s11)
	lw		s11, 0(t3)
	bne		s4, s11, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_8
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_7

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_8:
	addi	t3, a0, 0
	lw		s4, 0(t3)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	t4, s4, 8
	addi	s11, a0, 4
	lw		s4, 0(s11)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	sw		s4, 0(t4)
	lw		s4, 0(s11)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	bne		s4, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_9
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_7

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_7:
	bne		s7, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_7
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_8

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_7:
	addi	s4, s7, 4
	lw		s4, 0(s4)
	addi	s4, s4, 8
	sw		a0, 0(s4)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_8

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_8:
	addi	s4, a0, 0
	sw		s7, 0(s4)
	addi	s7, a0, 4
	lw		s7, 0(s7)
	addi	s11, s7, 8
	addi	s7, s2, 4
	lw		s4, 0(s7)
	addi	s4, s4, 8
	lw		s4, 0(s4)
	sw		s4, 0(s11)
	lw		s4, 0(s7)
	addi	s4, s4, 8
	lw		s4, 0(s4)
	bne		s4, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_5
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_9

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_9:
	addi	s7, a0, 8
	addi	s4, s2, 4
	lw		s2, 0(s4)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s7, 0(s7)
	lw		s2, 0(s2)
	bne		s7, s2, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_6
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_10

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_10:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_6:
	addi	s2, a0, 4
	lw		s2, 0(s2)
	addi	s7, s2, 4
	lw		s2, 0(s4)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	sw		s2, 0(s7)
	lw		s2, 0(s4)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		a0, 0(s2)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_10

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_5:
	lw		s7, 0(s7)
	addi	s7, s7, 8
	lw		s7, 0(s7)
	addi	s7, s7, 0
	sw		a0, 0(s7)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_9

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_9:
	lw		s4, 0(s11)
	addi	s4, s4, 4
	lw		s4, 0(s4)
	addi	s4, s4, 0
	lw		s11, 0(t3)
	sw		s11, 0(s4)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_7

eraseImpl__parallel_copy_:
	mv		s8, s4
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_6

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		t3, 0(s11)
	addi	t3, t3, 8
	lw		t3, 0(t3)
	beq		t3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	t3, a0, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	call	findLargest
	j		eraseImpl_split_block_2

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_10:
	bne		s7, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_13
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_11

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_13:
	lw		s11, 0(t3)
	addi	t3, s11, 8
	lw		s11, 0(t4)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	sw		s11, 0(t3)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_11

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_11:
	addi	t3, s2, 4
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	bne		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_11
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_12

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_11:
	lw		s11, 0(t3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	addi	s11, s11, 0
	sw		s7, 0(s11)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_12

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_12:
	addi	s7, s4, 8
	lw		s7, 0(s7)
	beq		s8, s7, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_12
	j		eraseImpl__parallel_copy__2

eraseImpl__parallel_copy__2:
	mv		s8, s4
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_13

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_13:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_12:
	addi	s8, s2, 4
	lw		s8, 0(s8)
	addi	s8, s8, 8
	lw		s8, 0(s8)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_13

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_14:
	addi	s7, s2, 4
	lw		s7, 0(s7)
	addi	s7, s7, 4
	lw		a0, 0(s7)
	lui		s7, %hi(root)
	sw		s4, %lo(root)(s7)
	mv		a1, s2
	li		a2, 0
	mv		a3, s8
	call	eraseImpl
	lui		s8, %hi(root)
	lw		s8, %lo(root)(s8)
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then:
	li		a0, 0
	mv		s8, s4
	j		eraseImpl_exit

eraseImpl__if_then:
	li		a0, 0
	mv		s8, s4
	j		eraseImpl_exit


	.globl	printTree
	.p2align	2
	.type	printTree, @function
printTree:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s1, 24(sp)
	sw		s5, 20(sp)
	sw		s6, 16(sp)
	sw		s9, 12(sp)
	mv		s9, s10
	sw		s11, 8(sp)
	mv		s10, a0
	beq		s10, zero, printTree_exit
	j		printTree__if_merge

printTree__if_merge:
	addi	s6, s10, 4
	lw		s6, 0(s6)
	addi	s6, s6, 4
	lw		s1, 0(s6)
	beq		s1, zero, printTree_split_block
	j		printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s6, s1, 4
	lw		s6, 0(s6)
	addi	s6, s6, 4
	lw		s11, 0(s6)
	beq		s11, zero, printTree_split_block_3
	j		printTree_fake_fake_printTree_2_printTree__if_merge_3

printTree_split_block_3:
	addi	s6, s1, 8
	lw		a0, 0(s6)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s1, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	addi	s6, s1, 4
	lw		s6, 0(s6)
	addi	s6, s6, 8
	lw		a0, 0(s6)
	call	printTree
	j		printTree_split_block

printTree_split_block:
	addi	s6, s10, 8
	lw		a0, 0(s6)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s10, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	addi	s10, s10, 4
	lw		s10, 0(s10)
	addi	s10, s10, 8
	lw		s10, 0(s10)
	beq		s10, zero, printTree_exit
	j		printTree_fake_fake_printTree_1_printTree__if_merge

printTree_exit:
	lw		s11, 8(sp)
	mv		s10, s9
	lw		s9, 12(sp)
	lw		s6, 16(sp)
	lw		s5, 20(sp)
	lw		s1, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s6, s10, 4
	lw		s6, 0(s6)
	addi	s6, s6, 4
	lw		s6, 0(s6)
	beq		s6, zero, printTree_split_block_2
	j		printTree_fake_fake_printTree_2_printTree__if_merge_2

printTree_fake_fake_printTree_2_printTree__if_merge_2:
	addi	s1, s6, 4
	lw		s1, 0(s1)
	addi	s1, s1, 4
	lw		s5, 0(s1)
	beq		s5, zero, printTree_fake_fake_printTree_2_printTree_split_block_2
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_3

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_3:
	addi	s1, s5, 4
	lw		s11, 0(s1)
	addi	s11, s11, 4
	lw		a0, 0(s11)
	call	printTree
	addi	s11, s5, 8
	lw		a0, 0(s11)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s5, s5, 12
	lw		a0, 0(s5)
	call	__builtin_printlnInt
	lw		s1, 0(s1)
	addi	s1, s1, 8
	lw		a0, 0(s1)
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block_2

printTree_fake_fake_printTree_2_printTree_split_block_2:
	addi	s1, s6, 8
	lw		a0, 0(s1)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s1, s6, 12
	lw		a0, 0(s1)
	call	__builtin_printlnInt
	addi	s6, s6, 4
	lw		s6, 0(s6)
	addi	s6, s6, 8
	lw		s6, 0(s6)
	beq		s6, zero, printTree_split_block_2
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_4

printTree_split_block_2:
	addi	s6, s10, 8
	lw		a0, 0(s6)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s10, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	addi	s10, s10, 4
	lw		s10, 0(s10)
	addi	s10, s10, 8
	lw		s10, 0(s10)
	beq		s10, zero, printTree_exit
	j		printTree_fake_fake_printTree_2_printTree__if_merge

printTree_fake_fake_printTree_2_printTree__if_merge:
	addi	s6, s10, 4
	lw		s6, 0(s6)
	addi	s6, s6, 4
	lw		s6, 0(s6)
	beq		s6, zero, printTree_fake_fake_printTree_2_printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_2_printTree_split_block:
	addi	s6, s10, 8
	lw		a0, 0(s6)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s10, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	addi	s10, s10, 4
	lw		s10, 0(s10)
	addi	s10, s10, 8
	lw		s6, 0(s10)
	beq		s6, zero, printTree_exit
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s10, s6, 4
	lw		s1, 0(s10)
	addi	s1, s1, 4
	lw		a0, 0(s1)
	call	printTree
	addi	s1, s6, 8
	lw		a0, 0(s1)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s6, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	lw		s10, 0(s10)
	addi	s10, s10, 8
	lw		a0, 0(s10)
	call	printTree
	j		printTree_exit

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s1, s6, 4
	lw		s5, 0(s1)
	addi	s5, s5, 4
	lw		a0, 0(s5)
	call	printTree
	addi	s5, s6, 8
	lw		a0, 0(s5)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s6, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	lw		s6, 0(s1)
	addi	s6, s6, 8
	lw		a0, 0(s6)
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_4:
	addi	s1, s6, 4
	lw		s5, 0(s1)
	addi	s5, s5, 4
	lw		a0, 0(s5)
	call	printTree
	addi	s5, s6, 8
	lw		a0, 0(s5)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s6, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	lw		s6, 0(s1)
	addi	s6, s6, 8
	lw		a0, 0(s6)
	call	printTree
	j		printTree_split_block_2

printTree_fake_fake_printTree_2_printTree__if_merge_3:
	addi	s6, s11, 4
	lw		s6, 0(s6)
	addi	s6, s6, 4
	lw		s5, 0(s6)
	beq		s5, zero, printTree_fake_fake_printTree_2_printTree_split_block_3
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_6

printTree_fake_fake_printTree_2_printTree_split_block_3:
	addi	s6, s11, 8
	lw		a0, 0(s6)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s11, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	addi	s6, s11, 4
	lw		s6, 0(s6)
	addi	s6, s6, 8
	lw		s5, 0(s6)
	beq		s5, zero, printTree_split_block_3
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_5

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_5:
	addi	s6, s5, 4
	lw		s11, 0(s6)
	addi	s11, s11, 4
	lw		a0, 0(s11)
	call	printTree
	addi	s11, s5, 8
	lw		a0, 0(s11)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s5, s5, 12
	lw		a0, 0(s5)
	call	__builtin_printlnInt
	lw		s6, 0(s6)
	addi	s6, s6, 8
	lw		a0, 0(s6)
	call	printTree
	j		printTree_split_block_3

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_6:
	addi	s6, s5, 4
	lw		t3, 0(s6)
	addi	t3, t3, 4
	lw		a0, 0(t3)
	call	printTree
	addi	t3, s5, 8
	lw		a0, 0(t3)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s5, s5, 12
	lw		a0, 0(s5)
	call	__builtin_printlnInt
	lw		s6, 0(s6)
	addi	s6, s6, 8
	lw		a0, 0(s6)
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block_3


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -208
	sw		ra, 204(sp)
	sw		s0, 200(sp)
	sw		s1, 196(sp)
	sw		s2, 192(sp)
	sw		s3, 188(sp)
	sw		s4, 184(sp)
	sw		s5, 180(sp)
	sw		s6, 176(sp)
	sw		s7, 172(sp)
	sw		s8, 168(sp)
	sw		s9, 164(sp)
	sw		s10, 160(sp)
	sw		s11, 156(sp)
	call	__builtin_getInt
	li		s6, 0
	li		s7, 0
	li		s10, 1
	sw		s10, 152(sp)
	li		s10, 0
	sw		s10, 148(sp)
	li		s10, 0
	mv		s9, s10
	li		s10, 0
	sw		s10, 144(sp)
	li		s10, 1
	mv		s8, s10
	li		s10, 0
	sw		s10, 140(sp)
	li		s10, 1
	sw		s10, 136(sp)
	li		s10, 0
	mv		s2, s10
	li		s10, 0
	sw		s10, 132(sp)
	li		s10, 2
	sw		s10, 128(sp)
	li		s10, 1
	sw		s10, 124(sp)
	li		s10, 0
	sw		s10, 120(sp)
	li		s10, 1
	sw		s10, 116(sp)
	li		s10, 1
	sw		s10, 112(sp)
	li		s10, 1
	sw		s10, 108(sp)
	li		s10, 1
	sw		s10, 104(sp)
	mv		s5, s6
	mv		s4, s7
	j		_init__fake_main_fake_generateOperations__for_cond

_init__fake_main_fake_generateOperations__for_cond:
	li		s10, 50000
	blt		s4, s10, _init__fake_main_fake_generateOperations_split_block_9
	j		_init___init__fake_main_fake_generateOperations__for_cond_pre_header

_init__fake_main_fake_generateOperations_split_block_9:
	slli	s10, a0, 13
	xor		s6, a0, s10
	li		s10, 2147483647
	and		s6, s6, s10
	srai	s10, s6, 17
	xor		s6, s6, s10
	slli	s10, s6, 5
	xor		s10, s6, s10
	li		s6, 2147483647
	and		s6, s10, s6
	li		s10, 128
	rem		s0, s6, s10
	slli	s10, s6, 13
	xor		s6, s6, s10
	li		s10, 2147483647
	and		s6, s6, s10
	srai	s10, s6, 17
	xor		s10, s6, s10
	slli	s6, s10, 5
	xor		s10, s10, s6
	li		s6, 2147483647
	and		s10, s10, s6
	mv		s1, s10
	li		s6, 1717986912
	blt		s10, s6, _init__fake_main_fake_generateOperations_fake_randOp__if_then_3
	j		_init__fake_main_fake_generateOperations_fake_randOp__if_merge_3

_init__fake_main_fake_generateOperations_fake_randOp__if_merge_3:
	lw		s10, 128(sp)
	j		_init__fake_main_fake_generateOperations_split_block_10

_init__fake_main_fake_generateOperations_split_block_10:
	li		s6, 1
	beq		s10, s6, _init__fake_main_fake_generateOperations__if_then_3
	j		_init__fake_main_fake_generateOperations__if_else_3

_init__fake_main_fake_generateOperations__if_else_3:
	beq		s5, zero, _init__fake_main_fake_generateOperations_fake_erase__if_then_3
	j		_init__fake_main_fake_generateOperations_fake_erase__if_merge_3

_init__fake_main_fake_generateOperations_fake_erase__if_then_3:
	mv		s6, s5
	j		_init__fake_main_fake_generateOperations__for_step_3

_init__fake_main_fake_generateOperations__for_step_3:
	addi	s10, s4, 1
	mv		s5, s6
	mv		s4, s10
	mv		a0, s1
	j		_init__fake_main_fake_generateOperations__for_cond

_init__fake_main_fake_generateOperations_fake_erase__if_merge_3:
	lui		s10, %hi(root)
	sw		s5, %lo(root)(s10)
	mv		a0, s5
	li		a1, 0
	li		a2, -1
	mv		a3, s0
	call	eraseImpl
	lui		s10, %hi(root)
	lw		s6, %lo(root)(s10)
	j		_init__fake_main_fake_generateOperations__for_step_3

_init__fake_main_fake_generateOperations__if_then_3:
	bne		s5, zero, _init__fake_main_fake_generateOperations_fake_insert__if_then_3
	j		_init__fake_main_fake_generateOperations_fake_insert_split_block_3

_init__fake_main_fake_generateOperations_fake_insert_split_block_3:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s7, s6, 4
	li		a0, 12
	call	malloc
	li		s10, 2
	sw		s10, 0(a0)
	sw		a0, 0(s7)
	addi	s10, s6, 8
	sw		s0, 0(s10)
	addi	s0, s6, 12
	li		s10, 1
	sw		s10, 0(s0)
	addi	s10, s6, 0
	li		s0, 0
	sw		s0, 0(s10)
	lw		s10, 0(s7)
	addi	s0, s10, 4
	li		s10, 0
	sw		s10, 0(s0)
	lw		s10, 0(s7)
	addi	s10, s10, 8
	li		s7, 0
	sw		s7, 0(s10)
	j		_init__fake_main_fake_generateOperations__for_step_3

_init__fake_main_fake_generateOperations_fake_insert__if_then_3:
	beq		s5, zero, _init__fake_fake_insertImpl_1_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_7

_init__fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s6, s10, 4
	li		a0, 12
	call	malloc
	li		s7, 2
	sw		s7, 0(a0)
	sw		a0, 0(s6)
	addi	s7, s10, 8
	sw		s0, 0(s7)
	addi	s7, s10, 12
	li		s0, 1
	sw		s0, 0(s7)
	addi	s7, s10, 0
	li		s0, 0
	sw		s0, 0(s7)
	lw		s7, 0(s6)
	addi	s7, s7, 4
	li		s0, 0
	sw		s0, 0(s7)
	lw		s6, 0(s6)
	addi	s6, s6, 8
	li		s7, 0
	sw		s7, 0(s6)
	li		s6, 4
	lw		s6, 0(s6)
	addi	s6, s6, 0
	sw		s10, 0(s6)
	j		_init__split_block_5

_init__split_block_5:
	mv		s6, s5
	j		_init__fake_main_fake_generateOperations__for_step_3

_init__fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s6, s5, 8
	lw		s10, 0(s6)
	beq		s10, s0, _init__fake_fake_insertImpl_1_insertImpl__if_then_5
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_8

_init__fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		s10, 0(s6)
	blt		s10, s0, _init__fake_fake_insertImpl_1_insertImpl__if_then_6
	j		_init___parallel_copy__15

_init___parallel_copy__15:
	lw		s10, 148(sp)
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s7, s5, 4
	lw		s6, 0(s7)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		s6, s10, s6
	lw		s6, 0(s6)
	beq		s6, zero, _init__fake_fake_insertImpl_2_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_7

_init__fake_fake_insertImpl_2_insertImpl__if_merge_7:
	addi	s10, s6, 8
	lw		s7, 0(s10)
	beq		s7, s0, _init__fake_fake_insertImpl_2_insertImpl__if_then_5
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_8

_init__fake_fake_insertImpl_2_insertImpl__if_merge_8:
	lw		s10, 0(s10)
	blt		s10, s0, _init__fake_fake_insertImpl_2_insertImpl__if_then_6
	j		_init___parallel_copy__21

_init__fake_fake_insertImpl_2_insertImpl__if_then_6:
	lw		s7, 104(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_9

_init__fake_fake_insertImpl_2_insertImpl__if_merge_9:
	addi	s10, s6, 4
	lw		s11, 0(s10)
	slli	s7, s7, 2
	addi	s3, s7, 4
	add		s7, s3, s11
	lw		s11, 0(s7)
	beq		s11, zero, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s7, a0
	addi	s11, s7, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s11)
	addi	t3, s7, 8
	sw		s0, 0(t3)
	addi	t3, s7, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s7, 0
	sw		s6, 0(s0)
	lw		s6, 0(s11)
	addi	s0, s6, 4
	li		s6, 0
	sw		s6, 0(s0)
	lw		s6, 0(s11)
	addi	s0, s6, 8
	li		s6, 0
	sw		s6, 0(s0)
	lw		s10, 0(s10)
	add		s10, s3, s10
	sw		s7, 0(s10)
	j		_init__split_block_5

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s6, s11, 8
	lw		s10, 0(s6)
	beq		s10, s0, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	s6, s11, 12
	lw		s10, 0(s6)
	addi	s10, s10, 1
	sw		s10, 0(s6)
	j		_init__split_block_5

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		s10, 0(s6)
	blt		s10, s0, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		_init___parallel_copy__20

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6:
	lw		s10, 124(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s7, s11, 4
	lw		s3, 0(s7)
	slli	s10, s10, 2
	addi	s6, s10, 4
	add		s10, s6, s3
	lw		s10, 0(s10)
	beq		s10, zero, _init__fake_fake_insertImpl_3_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_7

_init__fake_fake_insertImpl_3_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s3, s10, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s10, 8
	sw		s0, 0(t3)
	addi	t3, s10, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s10, 0
	sw		s11, 0(s0)
	lw		s0, 0(s3)
	addi	s11, s0, 4
	li		s0, 0
	sw		s0, 0(s11)
	lw		s0, 0(s3)
	addi	s0, s0, 8
	li		s11, 0
	sw		s11, 0(s0)
	lw		s7, 0(s7)
	add		s6, s6, s7
	sw		s10, 0(s6)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl__if_merge_7:
	addi	s7, s10, 8
	lw		s6, 0(s7)
	beq		s6, s0, _init__fake_fake_insertImpl_3_insertImpl__if_then_6
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_8

_init__fake_fake_insertImpl_3_insertImpl__if_merge_8:
	lw		s6, 0(s7)
	blt		s6, s0, _init__fake_fake_insertImpl_3_insertImpl__if_then_5
	j		_init___parallel_copy__19

_init__fake_fake_insertImpl_3_insertImpl__if_then_5:
	lw		s6, 112(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl__if_merge_9:
	addi	s11, s10, 4
	lw		s3, 0(s11)
	slli	s6, s6, 2
	addi	s7, s6, 4
	add		s6, s7, s3
	lw		s6, 0(s6)
	beq		s6, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s7, s6, 8
	lw		s10, 0(s7)
	beq		s10, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6:
	addi	s10, s6, 12
	lw		s6, 0(s10)
	addi	s6, s6, 1
	sw		s6, 0(s10)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		s10, 0(s7)
	blt		s10, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		_init___parallel_copy__18

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5:
	lw		s10, 152(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s3, s6, 4
	lw		s7, 0(s3)
	slli	s10, s10, 2
	addi	s11, s10, 4
	add		s10, s11, s7
	lw		s7, 0(s10)
	beq		s7, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_7

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_7:
	addi	s10, s7, 8
	lw		s6, 0(s10)
	beq		s6, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_6
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_8

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_8:
	lw		s10, 0(s10)
	blt		s10, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_5
	j		_init___parallel_copy__16

_init___parallel_copy__16:
	lw		s10, 144(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_9:
	addi	s6, s7, 4
	lw		s11, 0(s6)
	slli	s10, s10, 2
	addi	s3, s10, 4
	add		s10, s3, s11
	lw		a1, 0(s10)
	beq		a1, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s11, a0
	addi	s10, s11, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s10)
	addi	t3, s11, 8
	sw		s0, 0(t3)
	addi	t3, s11, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s11, 0
	sw		s7, 0(s0)
	lw		s7, 0(s10)
	addi	s7, s7, 4
	li		s0, 0
	sw		s0, 0(s7)
	lw		s10, 0(s10)
	addi	s10, s10, 8
	li		s7, 0
	sw		s7, 0(s10)
	lw		s10, 0(s6)
	add		s10, s3, s10
	sw		s11, 0(s10)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s6, a1, 8
	lw		s10, 0(s6)
	beq		s10, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6:
	addi	s10, a1, 12
	lw		s6, 0(s10)
	addi	s6, s6, 1
	sw		s6, 0(s10)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		s10, 0(s6)
	blt		s10, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		_init___parallel_copy__17

_init___parallel_copy__17:
	lw		a2, 120(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s10, a1, 4
	lw		s6, 0(s10)
	slli	s10, a2, 2
	addi	s10, s10, 4
	add		s10, s10, s6
	lw		a0, 0(s10)
	mv		a3, s0
	call	insertImpl
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5:
	lw		a2, 108(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_5:
	lw		s10, 116(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_6:
	addi	s6, s7, 12
	lw		s10, 0(s6)
	addi	s10, s10, 1
	sw		s10, 0(s6)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s7, s10, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s7)
	addi	t3, s10, 8
	sw		s0, 0(t3)
	addi	s0, s10, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s10, 0
	sw		s6, 0(s0)
	lw		s6, 0(s7)
	addi	s0, s6, 4
	li		s6, 0
	sw		s6, 0(s0)
	lw		s6, 0(s7)
	addi	s7, s6, 8
	li		s6, 0
	sw		s6, 0(s7)
	lw		s6, 0(s3)
	add		s6, s11, s6
	sw		s10, 0(s6)
	j		_init__split_block_5

_init___parallel_copy__18:
	lw		s10, 140(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s3, s6, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s6, 8
	sw		s0, 0(t3)
	addi	t3, s6, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s6, 0
	sw		s10, 0(s0)
	lw		s10, 0(s3)
	addi	s10, s10, 4
	li		s0, 0
	sw		s0, 0(s10)
	lw		s10, 0(s3)
	addi	s0, s10, 8
	li		s10, 0
	sw		s10, 0(s0)
	lw		s10, 0(s11)
	add		s10, s7, s10
	sw		s6, 0(s10)
	j		_init__split_block_5

_init___parallel_copy__19:
	lw		s6, 132(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl__if_then_6:
	addi	s6, s10, 12
	lw		s10, 0(s6)
	addi	s10, s10, 1
	sw		s10, 0(s6)
	j		_init__split_block_5

_init___parallel_copy__20:
	mv		s10, s2
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init___parallel_copy__21:
	mv		s7, s9
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_9

_init__fake_fake_insertImpl_2_insertImpl__if_then_5:
	addi	s6, s6, 12
	lw		s10, 0(s6)
	addi	s10, s10, 1
	sw		s10, 0(s6)
	j		_init__split_block_5

_init__fake_fake_insertImpl_2_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s11, a0
	addi	s6, s11, 4
	li		a0, 12
	call	malloc
	li		s3, 2
	sw		s3, 0(a0)
	sw		a0, 0(s6)
	addi	s3, s11, 8
	sw		s0, 0(s3)
	addi	s3, s11, 12
	li		s0, 1
	sw		s0, 0(s3)
	addi	s0, s11, 0
	sw		s5, 0(s0)
	lw		s0, 0(s6)
	addi	s0, s0, 4
	li		s3, 0
	sw		s3, 0(s0)
	lw		s6, 0(s6)
	addi	s0, s6, 8
	li		s6, 0
	sw		s6, 0(s0)
	lw		s6, 0(s7)
	add		s10, s10, s6
	sw		s11, 0(s10)
	j		_init__split_block_5

_init__fake_fake_insertImpl_1_insertImpl__if_then_6:
	mv		s10, s8
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	s10, s5, 12
	lw		s6, 0(s10)
	addi	s6, s6, 1
	sw		s6, 0(s10)
	j		_init__split_block_5

_init__fake_main_fake_generateOperations_fake_randOp__if_then_3:
	lw		s10, 136(sp)
	j		_init__fake_main_fake_generateOperations_split_block_10

_init___init__fake_main_fake_generateOperations__for_cond_pre_header:
	mv		s8, s5
	li		s6, 0
	li		s10, 0
	sw		s10, 100(sp)
	li		s10, 1
	sw		s10, 96(sp)
	li		s10, 0
	sw		s10, 92(sp)
	li		s10, 0
	mv		s7, s10
	li		s10, 2
	sw		s10, 88(sp)
	li		s10, 1
	sw		s10, 84(sp)
	li		s10, 1
	sw		s10, 80(sp)
	li		s10, 0
	mv		s9, s10
	li		s10, 1
	sw		s10, 76(sp)
	li		s10, 0
	sw		s10, 72(sp)
	li		s10, 1
	sw		s10, 68(sp)
	li		s10, 1
	sw		s10, 64(sp)
	li		s10, 0
	mv		s2, s10
	li		s10, 1
	sw		s10, 60(sp)
	li		s10, 0
	sw		s10, 56(sp)
	li		s10, 1
	sw		s10, 52(sp)
	mv		s0, s8
	mv		s4, s6
	j		_init__fake_main_fake_generateOperations__for_cond_2

_init__fake_main_fake_generateOperations__for_cond_2:
	li		s10, 100000
	blt		s4, s10, _init__fake_main_fake_generateOperations_split_block_5
	j		_init___init__fake_main_fake_generateOperations__for_cond_pre_header_2

_init__fake_main_fake_generateOperations_split_block_5:
	slli	s10, a0, 13
	xor		s8, a0, s10
	li		s10, 2147483647
	and		s8, s8, s10
	srai	s10, s8, 17
	xor		s8, s8, s10
	slli	s10, s8, 5
	xor		s8, s8, s10
	li		s10, 2147483647
	and		s8, s8, s10
	li		s10, 128
	rem		s1, s8, s10
	slli	s10, s8, 13
	xor		s10, s8, s10
	li		s8, 2147483647
	and		s8, s10, s8
	srai	s10, s8, 17
	xor		s10, s8, s10
	slli	s8, s10, 5
	xor		s10, s10, s8
	li		s8, 2147483647
	and		s10, s10, s8
	mv		s5, s10
	li		s8, 429496728
	blt		s10, s8, _init__fake_main_fake_generateOperations_fake_randOp__if_then_2
	j		_init__fake_main_fake_generateOperations_fake_randOp__if_merge_2

_init__fake_main_fake_generateOperations_fake_randOp__if_then_2:
	lw		s10, 60(sp)
	j		_init__fake_main_fake_generateOperations_split_block_6

_init__fake_main_fake_generateOperations_split_block_6:
	li		s8, 1
	beq		s10, s8, _init__fake_main_fake_generateOperations__if_then_2
	j		_init__fake_main_fake_generateOperations__if_else_2

_init__fake_main_fake_generateOperations__if_then_2:
	bne		s0, zero, _init__fake_main_fake_generateOperations_fake_insert__if_then_2
	j		_init__fake_main_fake_generateOperations_fake_insert_split_block_2

_init__fake_main_fake_generateOperations_fake_insert_split_block_2:
	li		a0, 16
	call	malloc
	mv		s8, a0
	addi	s6, s8, 4
	li		a0, 12
	call	malloc
	li		s10, 2
	sw		s10, 0(a0)
	sw		a0, 0(s6)
	addi	s10, s8, 8
	sw		s1, 0(s10)
	addi	s0, s8, 12
	li		s10, 1
	sw		s10, 0(s0)
	addi	s10, s8, 0
	li		s0, 0
	sw		s0, 0(s10)
	lw		s10, 0(s6)
	addi	s0, s10, 4
	li		s10, 0
	sw		s10, 0(s0)
	lw		s10, 0(s6)
	addi	s6, s10, 8
	li		s10, 0
	sw		s10, 0(s6)
	j		_init__fake_main_fake_generateOperations__for_step_2

_init__fake_main_fake_generateOperations__for_step_2:
	addi	s10, s4, 1
	mv		s0, s8
	mv		s4, s10
	mv		a0, s5
	j		_init__fake_main_fake_generateOperations__for_cond_2

_init__fake_main_fake_generateOperations_fake_insert__if_then_2:
	beq		s0, zero, _init__fake_fake_insertImpl_1_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_4

_init__fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s10, s0, 8
	lw		s8, 0(s10)
	beq		s8, s1, _init__fake_fake_insertImpl_1_insertImpl__if_then_3
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_5

_init__fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		s10, 0(s10)
	blt		s10, s1, _init__fake_fake_insertImpl_1_insertImpl__if_then_4
	j		_init___parallel_copy__14

_init__fake_fake_insertImpl_1_insertImpl__if_then_4:
	lw		s10, 84(sp)
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s8, s0, 4
	lw		s6, 0(s8)
	slli	s10, s10, 2
	addi	s11, s10, 4
	add		s10, s11, s6
	lw		s6, 0(s10)
	beq		s6, zero, _init__fake_fake_insertImpl_2_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_4

_init__fake_fake_insertImpl_2_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s10, s6, 4
	li		a0, 12
	call	malloc
	li		s3, 2
	sw		s3, 0(a0)
	sw		a0, 0(s10)
	addi	s3, s6, 8
	sw		s1, 0(s3)
	addi	s1, s6, 12
	li		s3, 1
	sw		s3, 0(s1)
	addi	s1, s6, 0
	sw		s0, 0(s1)
	lw		s1, 0(s10)
	addi	s1, s1, 4
	li		s3, 0
	sw		s3, 0(s1)
	lw		s10, 0(s10)
	addi	s1, s10, 8
	li		s10, 0
	sw		s10, 0(s1)
	lw		s10, 0(s8)
	add		s10, s11, s10
	sw		s6, 0(s10)
	j		_init__split_block_4

_init__split_block_4:
	mv		s8, s0
	j		_init__fake_main_fake_generateOperations__for_step_2

_init__fake_fake_insertImpl_2_insertImpl__if_merge_4:
	addi	s10, s6, 8
	lw		s8, 0(s10)
	beq		s8, s1, _init__fake_fake_insertImpl_2_insertImpl__if_then_3
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_5

_init__fake_fake_insertImpl_2_insertImpl__if_merge_5:
	lw		s10, 0(s10)
	blt		s10, s1, _init__fake_fake_insertImpl_2_insertImpl__if_then_4
	j		_init___parallel_copy__8

_init__fake_fake_insertImpl_2_insertImpl__if_then_4:
	lw		s8, 96(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_6

_init__fake_fake_insertImpl_2_insertImpl__if_merge_6:
	addi	s10, s6, 4
	lw		s11, 0(s10)
	slli	s8, s8, 2
	addi	s3, s8, 4
	add		s8, s3, s11
	lw		s11, 0(s8)
	beq		s11, zero, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s11, a0
	addi	s8, s11, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s8)
	addi	t3, s11, 8
	sw		s1, 0(t3)
	addi	t3, s11, 12
	li		s1, 1
	sw		s1, 0(t3)
	addi	s1, s11, 0
	sw		s6, 0(s1)
	lw		s6, 0(s8)
	addi	s6, s6, 4
	li		s1, 0
	sw		s1, 0(s6)
	lw		s8, 0(s8)
	addi	s6, s8, 8
	li		s8, 0
	sw		s8, 0(s6)
	lw		s10, 0(s10)
	add		s10, s3, s10
	sw		s11, 0(s10)
	j		_init__split_block_4

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s10, s11, 8
	lw		s8, 0(s10)
	beq		s8, s1, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4:
	addi	s8, s11, 12
	lw		s10, 0(s8)
	addi	s10, s10, 1
	sw		s10, 0(s8)
	j		_init__split_block_4

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		s10, 0(s10)
	blt		s10, s1, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		_init___parallel_copy__9

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3:
	lw		s10, 80(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s6, s11, 4
	lw		s8, 0(s6)
	slli	s10, s10, 2
	addi	s3, s10, 4
	add		s10, s3, s8
	lw		s8, 0(s10)
	beq		s8, zero, _init__fake_fake_insertImpl_3_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_4

_init__fake_fake_insertImpl_3_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s8, a0
	addi	s10, s8, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s10)
	addi	t3, s8, 8
	sw		s1, 0(t3)
	addi	s1, s8, 12
	li		t3, 1
	sw		t3, 0(s1)
	addi	s1, s8, 0
	sw		s11, 0(s1)
	lw		s1, 0(s10)
	addi	s1, s1, 4
	li		s11, 0
	sw		s11, 0(s1)
	lw		s10, 0(s10)
	addi	s10, s10, 8
	li		s1, 0
	sw		s1, 0(s10)
	lw		s10, 0(s6)
	add		s10, s3, s10
	sw		s8, 0(s10)
	j		_init__split_block_4

_init__fake_fake_insertImpl_3_insertImpl__if_merge_4:
	addi	s6, s8, 8
	lw		s10, 0(s6)
	beq		s10, s1, _init__fake_fake_insertImpl_3_insertImpl__if_then_4
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_5

_init__fake_fake_insertImpl_3_insertImpl__if_then_4:
	addi	s8, s8, 12
	lw		s10, 0(s8)
	addi	s10, s10, 1
	sw		s10, 0(s8)
	j		_init__split_block_4

_init__fake_fake_insertImpl_3_insertImpl__if_merge_5:
	lw		s10, 0(s6)
	blt		s10, s1, _init__fake_fake_insertImpl_3_insertImpl__if_then_3
	j		_init___parallel_copy__10

_init__fake_fake_insertImpl_3_insertImpl__if_then_3:
	lw		s10, 64(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl__if_merge_6:
	addi	s11, s8, 4
	lw		s6, 0(s11)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		s6, s10, s6
	lw		s6, 0(s6)
	beq		s6, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s3, s6, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s3)
	addi	t3, s6, 8
	sw		s1, 0(t3)
	addi	s1, s6, 12
	li		t3, 1
	sw		t3, 0(s1)
	addi	s1, s6, 0
	sw		s8, 0(s1)
	lw		s8, 0(s3)
	addi	s8, s8, 4
	li		s1, 0
	sw		s1, 0(s8)
	lw		s8, 0(s3)
	addi	s1, s8, 8
	li		s8, 0
	sw		s8, 0(s1)
	lw		s8, 0(s11)
	add		s10, s10, s8
	sw		s6, 0(s10)
	j		_init__split_block_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s8, s6, 8
	lw		s10, 0(s8)
	beq		s10, s1, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3:
	addi	s10, s6, 12
	lw		s8, 0(s10)
	addi	s8, s8, 1
	sw		s8, 0(s10)
	j		_init__split_block_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		s10, 0(s8)
	blt		s10, s1, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		_init___parallel_copy__11

_init___parallel_copy__11:
	lw		s10, 100(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s8, s6, 4
	lw		s3, 0(s8)
	slli	s10, s10, 2
	addi	s11, s10, 4
	add		s10, s11, s3
	lw		s3, 0(s10)
	beq		s3, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s3, a0
	addi	s10, s3, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s10)
	addi	t3, s3, 8
	sw		s1, 0(t3)
	addi	s1, s3, 12
	li		t3, 1
	sw		t3, 0(s1)
	addi	s1, s3, 0
	sw		s6, 0(s1)
	lw		s6, 0(s10)
	addi	s1, s6, 4
	li		s6, 0
	sw		s6, 0(s1)
	lw		s10, 0(s10)
	addi	s6, s10, 8
	li		s10, 0
	sw		s10, 0(s6)
	lw		s10, 0(s8)
	add		s10, s11, s10
	sw		s3, 0(s10)
	j		_init__split_block_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_4:
	addi	s8, s3, 8
	lw		s10, 0(s8)
	beq		s10, s1, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_5:
	lw		s10, 0(s8)
	blt		s10, s1, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_4
	j		_init___parallel_copy__13

_init___parallel_copy__13:
	mv		s8, s7
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_6:
	addi	s10, s3, 4
	lw		s6, 0(s10)
	slli	s8, s8, 2
	addi	s8, s8, 4
	add		s6, s8, s6
	lw		a1, 0(s6)
	beq		a1, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s10, a1, 8
	lw		s8, 0(s10)
	beq		s8, s1, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3:
	addi	s10, a1, 12
	lw		s8, 0(s10)
	addi	s8, s8, 1
	sw		s8, 0(s10)
	j		_init__split_block_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		s10, 0(s10)
	blt		s10, s1, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		_init___parallel_copy__12

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4:
	lw		a2, 68(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s10, a1, 4
	lw		s8, 0(s10)
	slli	s10, a2, 2
	addi	s10, s10, 4
	add		s10, s10, s8
	lw		a0, 0(s10)
	mv		a3, s1
	call	insertImpl
	j		_init__split_block_4

_init___parallel_copy__12:
	lw		a2, 56(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s11, a0
	addi	s6, s11, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s6)
	addi	t3, s11, 8
	sw		s1, 0(t3)
	addi	s1, s11, 12
	li		t3, 1
	sw		t3, 0(s1)
	addi	s1, s11, 0
	sw		s3, 0(s1)
	lw		s1, 0(s6)
	addi	s3, s1, 4
	li		s1, 0
	sw		s1, 0(s3)
	lw		s6, 0(s6)
	addi	s1, s6, 8
	li		s6, 0
	sw		s6, 0(s1)
	lw		s10, 0(s10)
	add		s10, s8, s10
	sw		s11, 0(s10)
	j		_init__split_block_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_4:
	lw		s8, 76(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_3:
	addi	s10, s3, 12
	lw		s8, 0(s10)
	addi	s8, s8, 1
	sw		s8, 0(s10)
	j		_init__split_block_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4:
	lw		s10, 52(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init___parallel_copy__10:
	mv		s10, s9
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_6

_init___parallel_copy__9:
	lw		s10, 92(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init___parallel_copy__8:
	lw		s8, 72(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_6

_init__fake_fake_insertImpl_2_insertImpl__if_then_3:
	addi	s8, s6, 12
	lw		s10, 0(s8)
	addi	s10, s10, 1
	sw		s10, 0(s8)
	j		_init__split_block_4

_init___parallel_copy__14:
	mv		s10, s2
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_1_insertImpl__if_then_3:
	addi	s10, s0, 12
	lw		s8, 0(s10)
	addi	s8, s8, 1
	sw		s8, 0(s10)
	j		_init__split_block_4

_init__fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s8, s10, 4
	li		a0, 12
	call	malloc
	li		s6, 2
	sw		s6, 0(a0)
	sw		a0, 0(s8)
	addi	s6, s10, 8
	sw		s1, 0(s6)
	addi	s1, s10, 12
	li		s6, 1
	sw		s6, 0(s1)
	addi	s6, s10, 0
	li		s1, 0
	sw		s1, 0(s6)
	lw		s6, 0(s8)
	addi	s6, s6, 4
	li		s1, 0
	sw		s1, 0(s6)
	lw		s8, 0(s8)
	addi	s8, s8, 8
	li		s6, 0
	sw		s6, 0(s8)
	li		s8, 4
	lw		s8, 0(s8)
	addi	s8, s8, 0
	sw		s10, 0(s8)
	j		_init__split_block_4

_init__fake_main_fake_generateOperations__if_else_2:
	beq		s0, zero, _init__fake_main_fake_generateOperations_fake_erase__if_then_2
	j		_init__fake_main_fake_generateOperations_fake_erase__if_merge_2

_init__fake_main_fake_generateOperations_fake_erase__if_merge_2:
	lui		s10, %hi(root)
	sw		s0, %lo(root)(s10)
	mv		a0, s0
	li		a1, 0
	li		a2, -1
	mv		a3, s1
	call	eraseImpl
	lui		s10, %hi(root)
	lw		s8, %lo(root)(s10)
	j		_init__fake_main_fake_generateOperations__for_step_2

_init__fake_main_fake_generateOperations_fake_erase__if_then_2:
	mv		s8, s0
	j		_init__fake_main_fake_generateOperations__for_step_2

_init__fake_main_fake_generateOperations_fake_randOp__if_merge_2:
	lw		s10, 88(sp)
	j		_init__fake_main_fake_generateOperations_split_block_6

_init___init__fake_main_fake_generateOperations__for_cond_pre_header_2:
	mv		s6, s0
	li		s8, 0
	li		s10, 1
	sw		s10, 48(sp)
	li		s10, 0
	sw		s10, 44(sp)
	li		s10, 0
	mv		s9, s10
	li		s10, 1
	sw		s10, 40(sp)
	li		s10, 1
	sw		s10, 36(sp)
	li		s10, 1
	sw		s10, 32(sp)
	li		s10, 1
	sw		s10, 28(sp)
	li		s10, 1
	sw		s10, 24(sp)
	li		s10, 0
	sw		s10, 20(sp)
	li		s10, 0
	li		s2, 0
	sw		s2, 16(sp)
	li		s2, 2
	sw		s2, 12(sp)
	li		s2, 1
	sw		s2, 8(sp)
	li		s2, 0
	sw		s2, 4(sp)
	li		s2, 1
	li		s7, 0
	sw		s7, 0(sp)
	mv		s5, s6
	mv		s1, s8
	j		_init__fake_main_fake_generateOperations__for_cond_3

_init__fake_main_fake_generateOperations__for_cond_3:
	li		s8, 50000
	blt		s1, s8, _init__fake_main_fake_generateOperations_split_block
	j		_init__split_block_2

_init__split_block_2:
	beq		s5, zero, _init__split_block_3
	j		_init__fake_fake_printTree_1_printTree__if_merge

_init__split_block_3:
	li		a0, 0
	lw		s11, 156(sp)
	lw		s10, 160(sp)
	lw		s9, 164(sp)
	lw		s8, 168(sp)
	lw		s7, 172(sp)
	lw		s6, 176(sp)
	lw		s5, 180(sp)
	lw		s4, 184(sp)
	lw		s3, 188(sp)
	lw		s2, 192(sp)
	lw		s1, 196(sp)
	lw		s0, 200(sp)
	lw		ra, 204(sp)
	addi	sp, sp, 208
	jr		ra

_init__fake_fake_printTree_1_printTree__if_merge:
	addi	s8, s5, 4
	lw		s10, 0(s8)
	addi	s10, s10, 4
	lw		a0, 0(s10)
	call	printTree
	addi	s10, s5, 8
	lw		a0, 0(s10)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s10, s5, 12
	lw		a0, 0(s10)
	call	__builtin_printlnInt
	lw		s10, 0(s8)
	addi	s10, s10, 8
	lw		a0, 0(s10)
	call	printTree
	j		_init__split_block_3

_init__fake_main_fake_generateOperations_split_block:
	slli	s8, a0, 13
	xor		s8, a0, s8
	li		s6, 2147483647
	and		s6, s8, s6
	srai	s8, s6, 17
	xor		s8, s6, s8
	slli	s6, s8, 5
	xor		s6, s8, s6
	li		s8, 2147483647
	and		s8, s6, s8
	li		s6, 128
	rem		s0, s8, s6
	slli	s6, s8, 13
	xor		s8, s8, s6
	li		s6, 2147483647
	and		s8, s8, s6
	srai	s6, s8, 17
	xor		s8, s8, s6
	slli	s6, s8, 5
	xor		s6, s8, s6
	li		s8, 2147483647
	and		s8, s6, s8
	mv		s7, s8
	li		s6, 858993456
	blt		s8, s6, _init__fake_main_fake_generateOperations_fake_randOp__if_then
	j		_init__fake_main_fake_generateOperations_fake_randOp__if_merge

_init__fake_main_fake_generateOperations_fake_randOp__if_then:
	lw		s8, 24(sp)
	j		_init__fake_main_fake_generateOperations_split_block_2

_init__fake_main_fake_generateOperations_split_block_2:
	li		s6, 1
	beq		s8, s6, _init__fake_main_fake_generateOperations__if_then
	j		_init__fake_main_fake_generateOperations__if_else

_init__fake_main_fake_generateOperations__if_else:
	beq		s5, zero, _init__fake_main_fake_generateOperations_fake_erase__if_then
	j		_init__fake_main_fake_generateOperations_fake_erase__if_merge

_init__fake_main_fake_generateOperations_fake_erase__if_merge:
	lui		s8, %hi(root)
	sw		s5, %lo(root)(s8)
	mv		a0, s5
	li		a1, 0
	li		a2, -1
	mv		a3, s0
	call	eraseImpl
	lui		s8, %hi(root)
	lw		s8, %lo(root)(s8)
	j		_init__fake_main_fake_generateOperations__for_step

_init__fake_main_fake_generateOperations__for_step:
	addi	s6, s1, 1
	mv		s5, s8
	mv		a0, s7
	mv		s1, s6
	j		_init__fake_main_fake_generateOperations__for_cond_3

_init__fake_main_fake_generateOperations_fake_erase__if_then:
	mv		s8, s5
	j		_init__fake_main_fake_generateOperations__for_step

_init__fake_main_fake_generateOperations__if_then:
	bne		s5, zero, _init__fake_main_fake_generateOperations_fake_insert__if_then
	j		_init__fake_main_fake_generateOperations_fake_insert_split_block

_init__fake_main_fake_generateOperations_fake_insert_split_block:
	li		a0, 16
	call	malloc
	mv		s8, a0
	addi	s5, s8, 4
	li		a0, 12
	call	malloc
	li		s6, 2
	sw		s6, 0(a0)
	sw		a0, 0(s5)
	addi	s6, s8, 8
	sw		s0, 0(s6)
	addi	s6, s8, 12
	li		s0, 1
	sw		s0, 0(s6)
	addi	s0, s8, 0
	li		s6, 0
	sw		s6, 0(s0)
	lw		s6, 0(s5)
	addi	s0, s6, 4
	li		s6, 0
	sw		s6, 0(s0)
	lw		s6, 0(s5)
	addi	s6, s6, 8
	li		s0, 0
	sw		s0, 0(s6)
	j		_init__fake_main_fake_generateOperations__for_step

_init__fake_main_fake_generateOperations_fake_insert__if_then:
	beq		s5, zero, _init__fake_fake_insertImpl_1_insertImpl_split_block
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge

_init__fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s6, s5, 8
	lw		s8, 0(s6)
	beq		s8, s0, _init__fake_fake_insertImpl_1_insertImpl__if_then
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_2

_init__fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s8, s5, 12
	lw		s6, 0(s8)
	addi	s6, s6, 1
	sw		s6, 0(s8)
	j		_init__split_block

_init__split_block:
	mv		s8, s5
	j		_init__fake_main_fake_generateOperations__for_step

_init__fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		s8, 0(s6)
	blt		s8, s0, _init__fake_fake_insertImpl_1_insertImpl__if_then_2
	j		_init___parallel_copy_

_init__fake_fake_insertImpl_1_insertImpl__if_then_2:
	lw		s8, 40(sp)
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s4, s5, 4
	lw		s11, 0(s4)
	slli	s8, s8, 2
	addi	s6, s8, 4
	add		s8, s6, s11
	lw		s3, 0(s8)
	beq		s3, zero, _init__fake_fake_insertImpl_2_insertImpl_split_block
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge

_init__fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s8, a0
	addi	s11, s8, 4
	li		a0, 12
	call	malloc
	li		s3, 2
	sw		s3, 0(a0)
	sw		a0, 0(s11)
	addi	s3, s8, 8
	sw		s0, 0(s3)
	addi	s3, s8, 12
	li		s0, 1
	sw		s0, 0(s3)
	addi	s0, s8, 0
	sw		s5, 0(s0)
	lw		s0, 0(s11)
	addi	s0, s0, 4
	li		s3, 0
	sw		s3, 0(s0)
	lw		s0, 0(s11)
	addi	s0, s0, 8
	li		s11, 0
	sw		s11, 0(s0)
	lw		s0, 0(s4)
	add		s6, s6, s0
	sw		s8, 0(s6)
	j		_init__split_block

_init__fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s8, s3, 8
	lw		s6, 0(s8)
	beq		s6, s0, _init__fake_fake_insertImpl_2_insertImpl__if_then_2
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_2

_init__fake_fake_insertImpl_2_insertImpl__if_then_2:
	addi	s6, s3, 12
	lw		s8, 0(s6)
	addi	s8, s8, 1
	sw		s8, 0(s6)
	j		_init__split_block

_init__fake_fake_insertImpl_2_insertImpl__if_merge_2:
	lw		s8, 0(s8)
	blt		s8, s0, _init__fake_fake_insertImpl_2_insertImpl__if_then
	j		_init___parallel_copy__7

_init__fake_fake_insertImpl_2_insertImpl__if_then:
	lw		s6, 48(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_3

_init__fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s8, s3, 4
	lw		s11, 0(s8)
	slli	s6, s6, 2
	addi	s4, s6, 4
	add		s6, s4, s11
	lw		s11, 0(s6)
	beq		s11, zero, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s11, s6, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s11)
	addi	t3, s6, 8
	sw		s0, 0(t3)
	addi	s0, s6, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s6, 0
	sw		s3, 0(s0)
	lw		s0, 0(s11)
	addi	s0, s0, 4
	li		s3, 0
	sw		s3, 0(s0)
	lw		s0, 0(s11)
	addi	s0, s0, 8
	li		s11, 0
	sw		s11, 0(s0)
	lw		s8, 0(s8)
	add		s8, s4, s8
	sw		s6, 0(s8)
	j		_init__split_block

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s6, s11, 8
	lw		s8, 0(s6)
	beq		s8, s0, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s8, s11, 12
	lw		s6, 0(s8)
	addi	s6, s6, 1
	sw		s6, 0(s8)
	j		_init__split_block

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		s8, 0(s6)
	blt		s8, s0, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		_init___parallel_copy__2

_init___parallel_copy__2:
	lw		s8, 16(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s6, s11, 4
	lw		s4, 0(s6)
	slli	s8, s8, 2
	addi	s3, s8, 4
	add		s8, s3, s4
	lw		s4, 0(s8)
	beq		s4, zero, _init__fake_fake_insertImpl_3_insertImpl_split_block
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge

_init__fake_fake_insertImpl_3_insertImpl__if_merge:
	addi	s8, s4, 8
	lw		s6, 0(s8)
	beq		s6, s0, _init__fake_fake_insertImpl_3_insertImpl__if_then_2
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_2

_init__fake_fake_insertImpl_3_insertImpl__if_then_2:
	addi	s6, s4, 12
	lw		s8, 0(s6)
	addi	s8, s8, 1
	sw		s8, 0(s6)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl__if_merge_2:
	lw		s8, 0(s8)
	blt		s8, s0, _init__fake_fake_insertImpl_3_insertImpl__if_then
	j		_init___parallel_copy__3

_init__fake_fake_insertImpl_3_insertImpl__if_then:
	lw		s8, 32(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl__if_merge_3:
	addi	s11, s4, 4
	lw		s3, 0(s11)
	slli	s8, s8, 2
	addi	s6, s8, 4
	add		s8, s6, s3
	lw		s3, 0(s8)
	beq		s3, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s8, s3, 8
	lw		s6, 0(s8)
	beq		s6, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s8, s3, 12
	lw		s6, 0(s8)
	addi	s6, s6, 1
	sw		s6, 0(s8)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		s8, 0(s8)
	blt		s8, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		_init___parallel_copy__4

_init___parallel_copy__4:
	mv		s6, s10
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s8, s3, 4
	lw		s4, 0(s8)
	slli	s6, s6, 2
	addi	s11, s6, 4
	add		s6, s11, s4
	lw		s4, 0(s6)
	beq		s4, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s8, s4, 8
	lw		s6, 0(s8)
	beq		s6, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	lw		s8, 0(s8)
	blt		s8, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		_init___parallel_copy__6

_init___parallel_copy__6:
	lw		s8, 44(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s3, s4, 4
	lw		s6, 0(s3)
	slli	s8, s8, 2
	addi	s11, s8, 4
	add		s8, s11, s6
	lw		a1, 0(s8)
	beq		a1, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s8, s6, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s8)
	addi	t3, s6, 8
	sw		s0, 0(t3)
	addi	t3, s6, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s6, 0
	sw		s4, 0(s0)
	lw		s0, 0(s8)
	addi	s4, s0, 4
	li		s0, 0
	sw		s0, 0(s4)
	lw		s8, 0(s8)
	addi	s0, s8, 8
	li		s8, 0
	sw		s8, 0(s0)
	lw		s8, 0(s3)
	add		s8, s11, s8
	sw		s6, 0(s8)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s8, a1, 8
	lw		s6, 0(s8)
	beq		s6, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		s8, 0(s8)
	blt		s8, s0, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		_init___parallel_copy__5

_init___parallel_copy__5:
	lw		a2, 4(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s8, a1, 4
	lw		s8, 0(s8)
	slli	s6, a2, 2
	addi	s6, s6, 4
	add		s8, s6, s8
	lw		a0, 0(s8)
	mv		a3, s0
	call	insertImpl
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	lw		a2, 8(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s6, a1, 12
	lw		s8, 0(s6)
	addi	s8, s8, 1
	sw		s8, 0(s6)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	lw		s8, 28(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s6, s4, 12
	lw		s8, 0(s6)
	addi	s8, s8, 1
	sw		s8, 0(s6)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s6, s4, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s6)
	addi	t3, s4, 8
	sw		s0, 0(t3)
	addi	t3, s4, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s4, 0
	sw		s3, 0(s0)
	lw		s0, 0(s6)
	addi	s3, s0, 4
	li		s0, 0
	sw		s0, 0(s3)
	lw		s6, 0(s6)
	addi	s0, s6, 8
	li		s6, 0
	sw		s6, 0(s0)
	lw		s8, 0(s8)
	add		s8, s11, s8
	sw		s4, 0(s8)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	lw		s6, 36(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s3, a0
	addi	s8, s3, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s8)
	addi	t3, s3, 8
	sw		s0, 0(t3)
	addi	s0, s3, 12
	li		t3, 1
	sw		t3, 0(s0)
	addi	s0, s3, 0
	sw		s4, 0(s0)
	lw		s0, 0(s8)
	addi	s4, s0, 4
	li		s0, 0
	sw		s0, 0(s4)
	lw		s8, 0(s8)
	addi	s8, s8, 8
	li		s0, 0
	sw		s0, 0(s8)
	lw		s8, 0(s11)
	add		s8, s6, s8
	sw		s3, 0(s8)
	j		_init__split_block

_init___parallel_copy__3:
	lw		s8, 0(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s8, s4, 4
	li		a0, 12
	call	malloc
	li		t3, 2
	sw		t3, 0(a0)
	sw		a0, 0(s8)
	addi	t3, s4, 8
	sw		s0, 0(t3)
	addi	t3, s4, 12
	li		s0, 1
	sw		s0, 0(t3)
	addi	s0, s4, 0
	sw		s11, 0(s0)
	lw		s0, 0(s8)
	addi	s11, s0, 4
	li		s0, 0
	sw		s0, 0(s11)
	lw		s8, 0(s8)
	addi	s0, s8, 8
	li		s8, 0
	sw		s8, 0(s0)
	lw		s8, 0(s6)
	add		s8, s3, s8
	sw		s4, 0(s8)
	j		_init__split_block

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	mv		s8, s2
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init___parallel_copy__7:
	lw		s6, 20(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_3

_init___parallel_copy_:
	mv		s8, s9
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s8, a0
	addi	s6, s8, 4
	li		a0, 12
	call	malloc
	li		s4, 2
	sw		s4, 0(a0)
	sw		a0, 0(s6)
	addi	s4, s8, 8
	sw		s0, 0(s4)
	addi	s0, s8, 12
	li		s4, 1
	sw		s4, 0(s0)
	addi	s4, s8, 0
	li		s0, 0
	sw		s0, 0(s4)
	lw		s0, 0(s6)
	addi	s0, s0, 4
	li		s4, 0
	sw		s4, 0(s0)
	lw		s6, 0(s6)
	addi	s6, s6, 8
	li		s0, 0
	sw		s0, 0(s6)
	li		s6, 4
	lw		s6, 0(s6)
	addi	s6, s6, 0
	sw		s8, 0(s6)
	j		_init__split_block

_init__fake_main_fake_generateOperations_fake_randOp__if_merge:
	lw		s8, 12(sp)
	j		_init__fake_main_fake_generateOperations_split_block_2


