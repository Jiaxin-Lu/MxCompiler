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
	sw		s4, 20(sp)
	sw		s5, 16(sp)
	sw		s8, 12(sp)
	sw		s9, 8(sp)
	sw		s10, 4(sp)
	mv		s5, a0
	mv		s9, a1
	mv		s0, a2
	mv		s10, a3
	beq		s5, zero, insertImpl_split_block
	j		insertImpl__if_merge

insertImpl__if_merge:
	addi	s9, s5, 8
	lw		s0, 0(s9)
	beq		s0, s10, insertImpl__if_then_2
	j		insertImpl__if_merge_2

insertImpl__if_merge_2:
	li		s0, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl__if_then
	j		insertImpl__if_merge_3

insertImpl__if_merge_3:
	addi	s8, s5, 4
	lw		s9, 0(s8)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s9, s0, s9
	lw		s9, 0(s9)
	beq		s9, zero, insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s9, a0
	addi	s4, s9, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s9, 8
	sw		s10, 0(a3)
	addi	a3, s9, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s9, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s5, s10, 4
	li		s10, 0
	sw		s10, 0(s5)
	lw		s10, 0(s4)
	addi	s10, s10, 8
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s8)
	add		s0, s0, s10
	sw		s9, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_exit:
	lw		s10, 4(sp)
	lw		s9, 8(sp)
	lw		s8, 12(sp)
	lw		s5, 16(sp)
	lw		s4, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s5, s9, 8
	lw		s0, 0(s5)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s10, s9, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s0, 0
	lw		s5, 0(s5)
	blt		s5, s10, insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s8, s9, 4
	lw		s5, 0(s8)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s5, s0, s5
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s4, s5, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s5, 8
	sw		s10, 0(a3)
	addi	s10, s5, 12
	li		a3, 1
	sw		a3, 0(s10)
	addi	s10, s5, 0
	sw		s9, 0(s10)
	lw		s10, 0(s4)
	addi	s10, s10, 4
	li		s9, 0
	sw		s9, 0(s10)
	lw		s10, 0(s4)
	addi	s10, s10, 8
	li		s9, 0
	sw		s9, 0(s10)
	lw		s10, 0(s8)
	add		s0, s0, s10
	sw		s5, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s9, s5, 8
	lw		s0, 0(s9)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s0, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s8, s5, 4
	lw		s9, 0(s8)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s9, s0, s9
	lw		s9, 0(s9)
	beq		s9, zero, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s9, a0
	addi	s4, s9, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s9, 8
	sw		s10, 0(a3)
	addi	a3, s9, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s9, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s5, s10, 4
	li		s10, 0
	sw		s10, 0(s5)
	lw		s10, 0(s4)
	addi	s5, s10, 8
	li		s10, 0
	sw		s10, 0(s5)
	lw		s10, 0(s8)
	add		s0, s0, s10
	sw		s9, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s5, s9, 8
	lw		s0, 0(s5)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, s9, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s0, 0
	lw		s5, 0(s5)
	blt		s5, s10, insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s8, s9, 4
	lw		s5, 0(s8)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s5, s0, s5
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_3_insertImpl_split_block_3
	j		insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge:
	addi	s9, s5, 8
	lw		s0, 0(s9)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_3_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_2:
	li		s0, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_3_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3:
	addi	s9, s5, 4
	lw		s4, 0(s9)
	slli	s0, s0, 2
	addi	s8, s0, 4
	add		s0, s8, s4
	lw		s0, 0(s0)
	beq		s0, zero, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s9, s0, 8
	lw		s5, 0(s9)
	beq		s5, s10, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s5, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s5, 1
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s9, s0, 4
	lw		s4, 0(s9)
	slli	s5, s5, 2
	addi	s8, s5, 4
	add		s5, s8, s4
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s5, s4, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s5)
	addi	a3, s4, 8
	sw		s10, 0(a3)
	addi	a3, s4, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s4, 0
	sw		s0, 0(s10)
	lw		s0, 0(s5)
	addi	s10, s0, 4
	li		s0, 0
	sw		s0, 0(s10)
	lw		s0, 0(s5)
	addi	s10, s0, 8
	li		s0, 0
	sw		s0, 0(s10)
	lw		s0, 0(s9)
	add		s0, s8, s0
	sw		s4, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s9, s5, 8
	lw		s0, 0(s9)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s0, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s9, s5, 4
	lw		s4, 0(s9)
	slli	s0, s0, 2
	addi	s8, s0, 4
	add		s0, s8, s4
	lw		s0, 0(s0)
	beq		s0, zero, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s0, s4, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s0)
	addi	a3, s4, 8
	sw		s10, 0(a3)
	addi	s10, s4, 12
	li		a3, 1
	sw		a3, 0(s10)
	addi	s10, s4, 0
	sw		s5, 0(s10)
	lw		s10, 0(s0)
	addi	s5, s10, 4
	li		s10, 0
	sw		s10, 0(s5)
	lw		s0, 0(s0)
	addi	s0, s0, 8
	li		s10, 0
	sw		s10, 0(s0)
	lw		s0, 0(s9)
	add		s0, s8, s0
	sw		s4, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s9, s0, 8
	lw		s5, 0(s9)
	beq		s5, s10, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s5, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s5, 1
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s8, s0, 4
	lw		s9, 0(s8)
	slli	s5, s5, 2
	addi	s5, s5, 4
	add		s9, s5, s9
	lw		s9, 0(s9)
	beq		s9, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_split_block_4
	j		insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_split_block_4:
	li		a0, 16
	call	malloc
	mv		s9, a0
	addi	s4, s9, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s9, 8
	sw		s10, 0(a3)
	addi	a3, s9, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s9, 0
	sw		s0, 0(s10)
	lw		s0, 0(s4)
	addi	s10, s0, 4
	li		s0, 0
	sw		s0, 0(s10)
	lw		s0, 0(s4)
	addi	s0, s0, 8
	li		s10, 0
	sw		s10, 0(s0)
	lw		s0, 0(s8)
	add		s0, s5, s0
	sw		s9, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge:
	addi	s5, s9, 8
	lw		s0, 0(s5)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_4_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_2:
	li		s0, 0
	lw		s5, 0(s5)
	blt		s5, s10, insertImpl_fake_fake_insertImpl_4_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_3:
	addi	s8, s9, 4
	lw		s5, 0(s8)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s5, s0, s5
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s9, s5, 8
	lw		s0, 0(s9)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s0, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s9, s5, 4
	lw		s8, 0(s9)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s8, s0, s8
	lw		s8, 0(s8)
	beq		s8, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s8, a0
	addi	s4, s8, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s8, 8
	sw		s10, 0(a3)
	addi	a3, s8, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s8, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s10, s10, 4
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s10, s10, 8
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s9)
	add		s0, s0, s10
	sw		s8, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s5, s8, 8
	lw		s0, 0(s5)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	addi	s0, s8, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s0, 0
	lw		s5, 0(s5)
	blt		s5, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s5, s8, 4
	lw		s9, 0(s5)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s9, s0, s9
	lw		s9, 0(s9)
	beq		s9, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s9, a0
	addi	s4, s9, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s9, 8
	sw		s10, 0(a3)
	addi	s10, s9, 12
	li		a3, 1
	sw		a3, 0(s10)
	addi	s10, s9, 0
	sw		s8, 0(s10)
	lw		s10, 0(s4)
	addi	s8, s10, 4
	li		s10, 0
	sw		s10, 0(s8)
	lw		s10, 0(s4)
	addi	s10, s10, 8
	li		s8, 0
	sw		s8, 0(s10)
	lw		s10, 0(s5)
	add		s0, s0, s10
	sw		s9, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s8, s9, 8
	lw		s0, 0(s8)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, s9, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s5, 0
	lw		s0, 0(s8)
	blt		s0, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s5, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s0, s9, 4
	lw		s4, 0(s0)
	slli	s5, s5, 2
	addi	s8, s5, 4
	add		s5, s8, s4
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_split_block_3
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s4, s5, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s5, 8
	sw		s10, 0(a3)
	addi	a3, s5, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s5, 0
	sw		s9, 0(s10)
	lw		s10, 0(s4)
	addi	s9, s10, 4
	li		s10, 0
	sw		s10, 0(s9)
	lw		s10, 0(s4)
	addi	s9, s10, 8
	li		s10, 0
	sw		s10, 0(s9)
	lw		s0, 0(s0)
	add		s0, s8, s0
	sw		s5, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge:
	addi	s9, s5, 8
	lw		s0, 0(s9)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_2:
	li		s0, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3:
	addi	s9, s5, 4
	lw		s4, 0(s9)
	slli	s0, s0, 2
	addi	s8, s0, 4
	add		s0, s8, s4
	lw		s0, 0(s0)
	beq		s0, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s9, s0, 8
	lw		s5, 0(s9)
	beq		s5, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, s0, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		s5, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		s5, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s9, s0, 4
	lw		s4, 0(s9)
	slli	s5, s5, 2
	addi	s8, s5, 4
	add		s5, s8, s4
	lw		s5, 0(s5)
	beq		s5, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s9, s5, 8
	lw		s0, 0(s9)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	li		s0, 0
	lw		s9, 0(s9)
	blt		s9, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s9, s5, 4
	lw		s8, 0(s9)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s8, s0, s8
	lw		a1, 0(s8)
	beq		a1, zero, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s8, a0
	addi	s4, s8, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s8, 8
	sw		s10, 0(a3)
	addi	a3, s8, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s8, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s10, s10, 4
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s10, s10, 8
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s9)
	add		s0, s0, s10
	sw		s8, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s5, a1, 8
	lw		s0, 0(s5)
	beq		s0, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	li		a2, 0
	lw		s0, 0(s5)
	blt		s0, s10, insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s0, a1, 4
	lw		s5, 0(s0)
	slli	s0, a2, 2
	addi	s0, s0, 4
	add		s0, s0, s5
	lw		a0, 0(s0)
	mv		a3, s10
	call	insertImpl
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	li		a2, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, a1, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	addi	s10, s5, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s5, s4, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s5)
	addi	a3, s4, 8
	sw		s10, 0(a3)
	addi	s10, s4, 12
	li		a3, 1
	sw		a3, 0(s10)
	addi	s10, s4, 0
	sw		s0, 0(s10)
	lw		s0, 0(s5)
	addi	s10, s0, 4
	li		s0, 0
	sw		s0, 0(s10)
	lw		s0, 0(s5)
	addi	s10, s0, 8
	li		s0, 0
	sw		s0, 0(s10)
	lw		s0, 0(s9)
	add		s0, s8, s0
	sw		s4, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s4, s0, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s0, 8
	sw		s10, 0(a3)
	addi	s10, s0, 12
	li		a3, 1
	sw		a3, 0(s10)
	addi	s10, s0, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s10, s10, 4
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s5, s10, 8
	li		s10, 0
	sw		s10, 0(s5)
	lw		s10, 0(s9)
	add		s10, s8, s10
	sw		s0, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_then:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_3_insertImpl__if_then_2:
	addi	s0, s5, 12
	lw		s10, 0(s0)
	addi	s10, s10, 1
	sw		s10, 0(s0)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s10, s5, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s4, a0
	addi	s5, s4, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s5)
	addi	a3, s4, 8
	sw		s10, 0(a3)
	addi	s10, s4, 12
	li		a3, 1
	sw		a3, 0(s10)
	addi	s10, s4, 0
	sw		s9, 0(s10)
	lw		s10, 0(s5)
	addi	s10, s10, 4
	li		s9, 0
	sw		s9, 0(s10)
	lw		s10, 0(s5)
	addi	s10, s10, 8
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s8)
	add		s0, s0, s10
	sw		s4, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_4_insertImpl__if_then:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_4_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_4_insertImpl__if_then_2:
	addi	s10, s9, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, s0, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s10, s5, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s10, s0, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s4, s0, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s0, 8
	sw		s10, 0(a3)
	addi	s10, s0, 12
	li		a3, 1
	sw		a3, 0(s10)
	addi	s10, s0, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s10, s10, 4
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s4)
	addi	s10, s10, 8
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s9)
	add		s10, s8, s10
	sw		s0, 0(s10)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl__if_then_2:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_3_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_3_insertImpl__if_then:
	addi	s10, s5, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_3_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s4, s5, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s4)
	addi	a3, s5, 8
	sw		s10, 0(a3)
	addi	s10, s5, 12
	li		a3, 1
	sw		a3, 0(s10)
	addi	s10, s5, 0
	sw		s9, 0(s10)
	lw		s10, 0(s4)
	addi	s9, s10, 4
	li		s10, 0
	sw		s10, 0(s9)
	lw		s10, 0(s4)
	addi	s10, s10, 8
	li		s9, 0
	sw		s9, 0(s10)
	lw		s10, 0(s8)
	add		s0, s0, s10
	sw		s5, 0(s0)
	li		a0, 0
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s10, s5, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	li		s0, 1
	j		insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

insertImpl__if_then:
	li		s0, 1
	j		insertImpl__if_merge_3

insertImpl__if_then_2:
	addi	s10, s5, 12
	lw		s0, 0(s10)
	addi	s0, s0, 1
	sw		s0, 0(s10)
	li		a0, 1
	j		insertImpl_exit

insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s8, s5, 4
	li		a0, 12
	call	malloc
	li		s4, 2
	sw		s4, 0(a0)
	sw		a0, 0(s8)
	addi	s4, s5, 8
	sw		s10, 0(s4)
	addi	s10, s5, 12
	li		s4, 1
	sw		s4, 0(s10)
	addi	s10, s5, 0
	sw		s9, 0(s10)
	lw		s10, 0(s8)
	addi	s10, s10, 4
	li		s4, 0
	sw		s4, 0(s10)
	lw		s10, 0(s8)
	addi	s8, s10, 8
	li		s10, 0
	sw		s10, 0(s8)
	addi	s10, s9, 4
	lw		s10, 0(s10)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s0, s0, s10
	sw		s5, 0(s0)
	li		a0, 0
	j		insertImpl_exit


	.globl	findLargest
	.p2align	2
	.type	findLargest, @function
findLargest:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s0, 8(sp)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest__if_merge

findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_exit:
	lw		s0, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	a3, a0, 4
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		s0, 0(s0)
	beq		s0, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(a3)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	addi	s0, a0, 4
	lw		a3, 0(s0)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, findLargest_exit
	j		findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

findLargest_fake_fake_findLargest_6_findLargest_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	call	findLargest
	j		findLargest_exit


	.globl	eraseImpl
	.p2align	2
	.type	eraseImpl, @function
eraseImpl:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s2, 24(sp)
	sw		s5, 20(sp)
	sw		s6, 16(sp)
	sw		s9, 12(sp)
	sw		s11, 8(sp)
	mv		s5, a0
	mv		s11, a1
	mv		s2, a2
	mv		s6, a3
	lui		s9, %hi(root)
	lw		s9, %lo(root)(s9)
	beq		s5, zero, eraseImpl__if_then
	j		eraseImpl__if_merge

eraseImpl__if_then:
	li		a0, 0
	mv		s6, s9
	j		eraseImpl_exit

eraseImpl_exit:
	lui		s2, %hi(root)
	sw		s6, %lo(root)(s2)
	lw		s11, 8(sp)
	lw		s9, 12(sp)
	lw		s6, 16(sp)
	lw		s5, 20(sp)
	lw		s2, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

eraseImpl__if_merge:
	addi	t5, s5, 8
	lw		a3, 0(t5)
	bgt		a3, s6, eraseImpl__if_then_14
	j		eraseImpl__if_merge_2

eraseImpl__if_merge_2:
	lw		a3, 0(t5)
	blt		a3, s6, eraseImpl__if_then_2
	j		eraseImpl__if_merge_3

eraseImpl__if_merge_3:
	addi	t5, s5, 12
	lw		a3, 0(t5)
	addi	a3, a3, -1
	sw		a3, 0(t5)
	bgt		a3, zero, eraseImpl__if_then_3
	j		eraseImpl__if_merge_4

eraseImpl__if_then_3:
	li		a0, 1
	mv		s6, s9
	j		eraseImpl_exit

eraseImpl__if_merge_4:
	addi	t5, s5, 4
	lw		a3, 0(t5)
	addi	a3, a3, 4
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl__if_then_4
	j		eraseImpl__if_merge_8

eraseImpl__if_then_4:
	bne		s11, zero, eraseImpl__if_then_5
	j		eraseImpl__if_merge_5

eraseImpl__if_merge_5:
	addi	s2, s5, 4
	lw		a3, 0(s2)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	bne		a3, zero, eraseImpl__if_then_7
	j		eraseImpl__if_merge_6

eraseImpl__if_then_7:
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		s11, 0(s2)
	j		eraseImpl__if_merge_6

eraseImpl__if_merge_6:
	addi	s2, s9, 8
	lw		s2, 0(s2)
	beq		s6, s2, eraseImpl__if_then_6
	j		eraseImpl__parallel_copy__3

eraseImpl__parallel_copy__3:
	mv		s6, s9
	j		eraseImpl__if_merge_7

eraseImpl__if_merge_7:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_then_6:
	addi	s2, s5, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s6, 0(s2)
	j		eraseImpl__if_merge_7

eraseImpl__if_then_5:
	addi	a3, s11, 4
	lw		a3, 0(a3)
	slli	s2, s2, 2
	addi	s2, s2, 4
	add		a3, s2, a3
	lw		s2, 0(t5)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	sw		s2, 0(a3)
	j		eraseImpl__if_merge_5

eraseImpl__if_merge_8:
	lw		a3, 0(t5)
	addi	a3, a3, 4
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_1_findLargest__if_merge:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	a3, a0, 4
	lw		t5, 0(a3)
	addi	t5, t5, 8
	lw		t5, 0(t5)
	beq		t5, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		a3, 0(a3)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	a3, a0, 4
	lw		t5, 0(a3)
	addi	t5, t5, 8
	lw		t5, 0(t5)
	beq		t5, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(a3)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	a3, a0, 4
	lw		t5, 0(a3)
	addi	t5, t5, 8
	lw		t5, 0(t5)
	beq		t5, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(a3)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	a3, a0, 4
	lw		t5, 0(a3)
	addi	t5, t5, 8
	lw		t5, 0(t5)
	beq		t5, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2:
	lw		a3, 0(a3)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	a3, a0, 4
	lw		t5, 0(a3)
	addi	t5, t5, 8
	lw		t5, 0(t5)
	beq		t5, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(a3)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	a3, a0, 4
	lw		t5, 0(a3)
	addi	t5, t5, 8
	lw		t5, 0(t5)
	beq		t5, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		a3, 0(a3)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	a3, a0, 4
	lw		t5, 0(a3)
	addi	t5, t5, 8
	lw		t5, 0(t5)
	beq		t5, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(a3)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	a3, a0, 4
	lw		t5, 0(a3)
	addi	t5, t5, 8
	lw		t5, 0(t5)
	beq		t5, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(a3)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	addi	t5, a0, 4
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_6
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_2:
	lw		a3, 0(t5)
	addi	a3, a3, 8
	lw		a0, 0(a3)
	call	findLargest
	j		eraseImpl_split_block_6

eraseImpl_split_block_6:
	addi	a3, s9, 8
	lw		a3, 0(a3)
	beq		s6, a3, eraseImpl__if_then_8
	j		eraseImpl__parallel_copy__4

eraseImpl__parallel_copy__4:
	mv		s6, s9
	j		eraseImpl__if_merge_9

eraseImpl__if_merge_9:
	addi	a3, a0, 8
	addi	s9, s5, 4
	lw		s9, 0(s9)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	addi	t5, s9, 8
	lw		s9, 0(a3)
	lw		a3, 0(t5)
	bne		s9, a3, eraseImpl__if_then_12
	j		eraseImpl__if_merge_10

eraseImpl__if_then_12:
	addi	a3, a0, 0
	lw		s9, 0(a3)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	addi	t4, s9, 8
	addi	t5, a0, 4
	lw		s9, 0(t5)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	sw		s9, 0(t4)
	lw		s9, 0(t5)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	bne		s9, zero, eraseImpl__if_then_13
	j		eraseImpl__if_merge_10

eraseImpl__if_merge_10:
	bne		s11, zero, eraseImpl__if_then_11
	j		eraseImpl__if_merge_11

eraseImpl__if_merge_11:
	addi	s2, a0, 0
	sw		s11, 0(s2)
	addi	s2, a0, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	addi	s11, s5, 4
	lw		s9, 0(s11)
	addi	s9, s9, 8
	lw		s9, 0(s9)
	sw		s9, 0(s2)
	lw		s2, 0(s11)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	bne		s2, zero, eraseImpl__if_then_10
	j		eraseImpl__if_merge_12

eraseImpl__if_then_10:
	lw		s2, 0(s11)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		a0, 0(s2)
	j		eraseImpl__if_merge_12

eraseImpl__if_merge_12:
	addi	s9, a0, 8
	addi	s5, s5, 4
	lw		s2, 0(s5)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s9, 0(s9)
	lw		s2, 0(s2)
	bne		s9, s2, eraseImpl__if_then_9
	j		eraseImpl__if_merge_13

eraseImpl__if_merge_13:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl__if_then_9:
	addi	s2, a0, 4
	lw		s2, 0(s2)
	addi	s9, s2, 4
	lw		s2, 0(s5)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	sw		s2, 0(s9)
	lw		s2, 0(s5)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		a0, 0(s2)
	j		eraseImpl__if_merge_13

eraseImpl__if_then_11:
	addi	s9, s11, 4
	lw		s9, 0(s9)
	slli	s2, s2, 2
	addi	s2, s2, 4
	add		s2, s2, s9
	sw		a0, 0(s2)
	j		eraseImpl__if_merge_11

eraseImpl__if_then_13:
	lw		s9, 0(t5)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	addi	t5, s9, 0
	lw		s9, 0(a3)
	sw		s9, 0(t5)
	j		eraseImpl__if_merge_10

eraseImpl__if_then_8:
	mv		s6, a0
	j		eraseImpl__if_merge_9

eraseImpl__if_then_2:
	addi	t5, s5, 4
	lw		s2, 0(t5)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge:
	addi	a3, s2, 8
	lw		s11, 0(a3)
	bgt		s11, s6, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_14
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_2

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_14:
	addi	s5, s2, 4
	lw		s5, 0(s5)
	addi	s5, s5, 4
	lw		a0, 0(s5)
	lui		s5, %hi(root)
	sw		s9, %lo(root)(s5)
	mv		a1, s2
	li		a2, 0
	mv		a3, s6
	call	eraseImpl
	lui		s2, %hi(root)
	lw		s6, %lo(root)(s2)
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_2:
	lw		s11, 0(a3)
	blt		s11, s6, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_2
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_3

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_3:
	addi	a3, s2, 12
	lw		s11, 0(a3)
	addi	s11, s11, -1
	sw		s11, 0(a3)
	bgt		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_3
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_4

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_3:
	li		a0, 1
	mv		s6, s9
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_4:
	addi	t4, s2, 4
	lw		s11, 0(t4)
	addi	s11, s11, 4
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_10
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_5

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_10:
	bne		s5, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_13
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_11

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_11:
	addi	a3, s2, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	bne		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_11
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_12

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_12:
	addi	s5, s9, 8
	lw		s5, 0(s5)
	beq		s6, s5, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_12
	j		eraseImpl__parallel_copy__2

eraseImpl__parallel_copy__2:
	mv		s6, s9
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_13

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_13:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_12:
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s6, 0(s2)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_13

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_11:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	addi	s11, s11, 0
	sw		s5, 0(s11)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_12

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_13:
	lw		s11, 0(t5)
	addi	a3, s11, 8
	lw		s11, 0(t4)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	sw		s11, 0(a3)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_11

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_5:
	lw		s11, 0(t4)
	addi	s11, s11, 4
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_split_block_2:
	addi	s11, s9, 8
	lw		s11, 0(s11)
	beq		s6, s11, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_4
	j		eraseImpl__parallel_copy_

eraseImpl__parallel_copy_:
	mv		s6, s9
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_6

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_6:
	addi	s9, a0, 8
	addi	s11, s2, 4
	lw		s11, 0(s11)
	addi	s11, s11, 4
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		s9, 0(s9)
	lw		s11, 0(s11)
	bne		s9, s11, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_8
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_7

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_8:
	addi	s9, a0, 0
	lw		s11, 0(s9)
	addi	s11, s11, 4
	lw		s11, 0(s11)
	addi	t5, s11, 8
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 4
	lw		s11, 0(s11)
	sw		s11, 0(t5)
	lw		s11, 0(a3)
	addi	s11, s11, 4
	lw		s11, 0(s11)
	bne		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_9
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_7

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_9:
	lw		s11, 0(a3)
	addi	s11, s11, 4
	lw		s11, 0(s11)
	addi	s11, s11, 0
	lw		s9, 0(s9)
	sw		s9, 0(s11)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_7

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_7:
	bne		s5, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_7
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_8

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_7:
	addi	s9, s5, 4
	lw		s9, 0(s9)
	addi	s9, s9, 8
	sw		a0, 0(s9)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_8

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_8:
	addi	s9, a0, 0
	sw		s5, 0(s9)
	addi	s5, a0, 4
	lw		s5, 0(s5)
	addi	s11, s5, 8
	addi	s9, s2, 4
	lw		s5, 0(s9)
	addi	s5, s5, 8
	lw		s5, 0(s5)
	sw		s5, 0(s11)
	lw		s5, 0(s9)
	addi	s5, s5, 8
	lw		s5, 0(s5)
	bne		s5, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_5
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_9

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_5:
	lw		s5, 0(s9)
	addi	s5, s5, 8
	lw		s5, 0(s5)
	addi	s5, s5, 0
	sw		a0, 0(s5)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_9

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_9:
	addi	s5, a0, 8
	addi	s9, s2, 4
	lw		s2, 0(s9)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s5, 0(s5)
	lw		s2, 0(s2)
	bne		s5, s2, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_6
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_10

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_6:
	addi	s2, a0, 4
	lw		s2, 0(s2)
	addi	s5, s2, 4
	lw		s2, 0(s9)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	sw		s2, 0(s5)
	lw		s2, 0(s9)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		a0, 0(s2)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_10

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_10:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_4:
	mv		s6, a0
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_6

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_2
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	call	findLargest
	j		eraseImpl_split_block_2

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_2:
	addi	s5, s2, 4
	lw		s5, 0(s5)
	addi	s5, s5, 8
	lw		a0, 0(s5)
	lui		s5, %hi(root)
	sw		s9, %lo(root)(s5)
	mv		a1, s2
	li		a2, 1
	mv		a3, s6
	call	eraseImpl
	lui		s2, %hi(root)
	lw		s6, %lo(root)(s2)
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then:
	li		a0, 0
	mv		s6, s9
	j		eraseImpl_exit

eraseImpl__if_then_14:
	addi	a3, s5, 4
	lw		s2, 0(a3)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	beq		s2, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_28
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_14

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_14:
	addi	t5, s2, 8
	lw		s11, 0(t5)
	bgt		s11, s6, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_15
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_15

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_15:
	lw		s11, 0(t5)
	blt		s11, s6, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_27
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_16

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_27:
	addi	s5, s2, 4
	lw		s5, 0(s5)
	addi	s5, s5, 8
	lw		a0, 0(s5)
	lui		s5, %hi(root)
	sw		s9, %lo(root)(s5)
	mv		a1, s2
	li		a2, 1
	mv		a3, s6
	call	eraseImpl
	lui		s2, %hi(root)
	lw		s6, %lo(root)(s2)
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_16:
	addi	t5, s2, 12
	lw		s11, 0(t5)
	addi	s11, s11, -1
	sw		s11, 0(t5)
	bgt		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_26
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_17

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_26:
	li		a0, 1
	mv		s6, s9
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_17:
	addi	t5, s2, 4
	lw		s11, 0(t5)
	addi	s11, s11, 4
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_22
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_18

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_18:
	lw		s11, 0(t5)
	addi	s11, s11, 4
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_3_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_3_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_split_block_12:
	addi	s11, s9, 8
	lw		s11, 0(s11)
	beq		s6, s11, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_16
	j		eraseImpl__parallel_copy__5

eraseImpl__parallel_copy__5:
	mv		s6, s9
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_19

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_19:
	addi	a3, a0, 8
	addi	s9, s2, 4
	lw		s9, 0(s9)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	addi	s11, s9, 8
	lw		s9, 0(a3)
	lw		s11, 0(s11)
	bne		s9, s11, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_20
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_20

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_20:
	addi	t5, a0, 0
	lw		s9, 0(t5)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	addi	s11, s9, 8
	addi	a3, a0, 4
	lw		s9, 0(a3)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	sw		s9, 0(s11)
	lw		s9, 0(a3)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	bne		s9, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_21
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_20

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_21:
	lw		s9, 0(a3)
	addi	s9, s9, 4
	lw		s9, 0(s9)
	addi	s11, s9, 0
	lw		s9, 0(t5)
	sw		s9, 0(s11)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_20

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_20:
	bne		s5, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_17
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_21

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_17:
	addi	s9, s5, 4
	lw		s9, 0(s9)
	addi	s9, s9, 4
	sw		a0, 0(s9)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_21

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_21:
	addi	s9, a0, 0
	sw		s5, 0(s9)
	addi	s5, a0, 4
	lw		s5, 0(s5)
	addi	s11, s5, 8
	addi	s9, s2, 4
	lw		s5, 0(s9)
	addi	s5, s5, 8
	lw		s5, 0(s5)
	sw		s5, 0(s11)
	lw		s5, 0(s9)
	addi	s5, s5, 8
	lw		s5, 0(s5)
	bne		s5, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_18
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_22

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_18:
	lw		s5, 0(s9)
	addi	s5, s5, 8
	lw		s5, 0(s5)
	addi	s5, s5, 0
	sw		a0, 0(s5)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_22

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_22:
	addi	s5, a0, 8
	addi	s9, s2, 4
	lw		s2, 0(s9)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s5, 0(s5)
	lw		s2, 0(s2)
	bne		s5, s2, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_19
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_23

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_19:
	addi	s2, a0, 4
	lw		s2, 0(s2)
	addi	s2, s2, 4
	lw		s5, 0(s9)
	addi	s5, s5, 4
	lw		s5, 0(s5)
	sw		s5, 0(s2)
	lw		s2, 0(s9)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 0
	sw		a0, 0(s2)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_23

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_23:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_16:
	mv		s6, a0
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_19

eraseImpl_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	s11, a0, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	beq		a3, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	addi	a3, a0, 4
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	beq		s11, zero, eraseImpl_split_block_12
	j		eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3

eraseImpl_fake_fake_findLargest_5_findLargest_fake_fake_findLargest_4_findLargest_fake_fake_findLargest_3_findLargest_fake_fake_findLargest_2_findLargest_fake_fake_findLargest_1_findLargest__if_merge_3:
	lw		s11, 0(a3)
	addi	s11, s11, 8
	lw		a0, 0(s11)
	call	findLargest
	j		eraseImpl_split_block_12

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_22:
	bne		s5, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_23
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_24

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_23:
	lw		s11, 0(a3)
	addi	a3, s11, 4
	lw		s11, 0(t5)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	sw		s11, 0(a3)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_24

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_24:
	addi	s11, s2, 4
	lw		a3, 0(s11)
	addi	a3, a3, 8
	lw		a3, 0(a3)
	bne		a3, zero, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_24
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_25

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_25:
	addi	s5, s9, 8
	lw		s5, 0(s5)
	beq		s6, s5, eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_25
	j		eraseImpl__parallel_copy__6

eraseImpl__parallel_copy__6:
	mv		s6, s9
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_26

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_26:
	li		a0, 1
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_25:
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s6, 0(s2)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_26

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_24:
	lw		s11, 0(s11)
	addi	s11, s11, 8
	lw		s11, 0(s11)
	addi	s11, s11, 0
	sw		s5, 0(s11)
	j		eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_merge_25

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_15:
	addi	s5, s2, 4
	lw		s5, 0(s5)
	addi	s5, s5, 4
	lw		a0, 0(s5)
	lui		s5, %hi(root)
	sw		s9, %lo(root)(s5)
	mv		a1, s2
	li		a2, 0
	mv		a3, s6
	call	eraseImpl
	lui		s2, %hi(root)
	lw		s6, %lo(root)(s2)
	j		eraseImpl_exit

eraseImpl_fake_fake_eraseImpl_1_eraseImpl__if_then_28:
	li		a0, 0
	mv		s6, s9
	j		eraseImpl_exit


	.globl	printTree
	.p2align	2
	.type	printTree, @function
printTree:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s0, 24(sp)
	sw		s1, 20(sp)
	sw		s2, 16(sp)
	mv		s1, s6
	sw		s7, 12(sp)
	sw		s8, 8(sp)
	mv		s0, a0
	beq		s0, zero, printTree_exit
	j		printTree__if_merge

printTree_exit:
	lw		s8, 8(sp)
	lw		s7, 12(sp)
	mv		s6, s1
	lw		s2, 16(sp)
	lw		s1, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

printTree__if_merge:
	addi	s2, s0, 4
	lw		s2, 0(s2)
	addi	s2, s2, 4
	lw		s6, 0(s2)
	beq		s6, zero, printTree_split_block
	j		printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s2, s6, 4
	lw		s2, 0(s2)
	addi	s2, s2, 4
	lw		s2, 0(s2)
	beq		s2, zero, printTree_split_block_3
	j		printTree_fake_fake_printTree_2_printTree__if_merge_3

printTree_split_block_3:
	addi	s2, s6, 8
	lw		a0, 0(s2)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s2, s6, 12
	lw		a0, 0(s2)
	call	__builtin_printlnInt
	addi	s2, s6, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	call	printTree
	j		printTree_split_block

printTree_split_block:
	addi	s2, s0, 8
	lw		a0, 0(s2)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s2, s0, 12
	lw		a0, 0(s2)
	call	__builtin_printlnInt
	addi	s2, s0, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, printTree_exit
	j		printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s6, s2, 4
	lw		s6, 0(s6)
	addi	s6, s6, 4
	lw		s6, 0(s6)
	beq		s6, zero, printTree_split_block_2
	j		printTree_fake_fake_printTree_2_printTree__if_merge_2

printTree_split_block_2:
	addi	s6, s2, 8
	lw		a0, 0(s6)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s2, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s2, 0(s2)
	beq		s2, zero, printTree_exit
	j		printTree_fake_fake_printTree_2_printTree__if_merge

printTree_fake_fake_printTree_2_printTree__if_merge:
	addi	s6, s2, 4
	lw		s6, 0(s6)
	addi	s6, s6, 4
	lw		s0, 0(s6)
	beq		s0, zero, printTree_fake_fake_printTree_2_printTree_split_block
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge:
	addi	s6, s0, 4
	lw		s7, 0(s6)
	addi	s7, s7, 4
	lw		a0, 0(s7)
	call	printTree
	addi	s7, s0, 8
	lw		a0, 0(s7)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s0, s0, 12
	lw		a0, 0(s0)
	call	__builtin_printlnInt
	lw		s6, 0(s6)
	addi	s6, s6, 8
	lw		a0, 0(s6)
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block

printTree_fake_fake_printTree_2_printTree_split_block:
	addi	s6, s2, 8
	lw		a0, 0(s6)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s2, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s6, 0(s2)
	beq		s6, zero, printTree_exit
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_2:
	addi	s2, s6, 4
	lw		s0, 0(s2)
	addi	s0, s0, 4
	lw		a0, 0(s0)
	call	printTree
	addi	s0, s6, 8
	lw		a0, 0(s0)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s6, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	call	printTree
	j		printTree_exit

printTree_fake_fake_printTree_2_printTree__if_merge_2:
	addi	s0, s6, 4
	lw		s0, 0(s0)
	addi	s0, s0, 4
	lw		s7, 0(s0)
	beq		s7, zero, printTree_fake_fake_printTree_2_printTree_split_block_2
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_3

printTree_fake_fake_printTree_2_printTree_split_block_2:
	addi	s0, s6, 8
	lw		a0, 0(s0)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s0, s6, 12
	lw		a0, 0(s0)
	call	__builtin_printlnInt
	addi	s6, s6, 4
	lw		s6, 0(s6)
	addi	s6, s6, 8
	lw		s6, 0(s6)
	beq		s6, zero, printTree_split_block_2
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_4

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_4:
	addi	s0, s6, 4
	lw		s7, 0(s0)
	addi	s7, s7, 4
	lw		a0, 0(s7)
	call	printTree
	addi	s7, s6, 8
	lw		a0, 0(s7)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s6, s6, 12
	lw		a0, 0(s6)
	call	__builtin_printlnInt
	lw		s6, 0(s0)
	addi	s6, s6, 8
	lw		a0, 0(s6)
	call	printTree
	j		printTree_split_block_2

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_3:
	addi	s0, s7, 4
	lw		s8, 0(s0)
	addi	s8, s8, 4
	lw		a0, 0(s8)
	call	printTree
	addi	s8, s7, 8
	lw		a0, 0(s8)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s7, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	lw		s0, 0(s0)
	addi	s0, s0, 8
	lw		a0, 0(s0)
	call	printTree
	j		printTree_fake_fake_printTree_2_printTree_split_block_2

printTree_fake_fake_printTree_2_printTree__if_merge_3:
	addi	s7, s2, 4
	lw		s7, 0(s7)
	addi	s7, s7, 4
	lw		s7, 0(s7)
	beq		s7, zero, printTree_fake_fake_printTree_2_printTree_split_block_3
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_6

printTree_fake_fake_printTree_2_printTree_split_block_3:
	addi	s7, s2, 8
	lw		a0, 0(s7)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s2, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	addi	s2, s2, 4
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		s7, 0(s2)
	beq		s7, zero, printTree_split_block_3
	j		printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_5

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_5:
	addi	s2, s7, 4
	lw		s8, 0(s2)
	addi	s8, s8, 4
	lw		a0, 0(s8)
	call	printTree
	addi	s8, s7, 8
	lw		a0, 0(s8)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s7, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	lw		s2, 0(s2)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	call	printTree
	j		printTree_split_block_3

printTree_fake_fake_printTree_2_printTree_fake_fake_printTree_1_printTree__if_merge_6:
	addi	s8, s7, 4
	lw		a3, 0(s8)
	addi	a3, a3, 4
	lw		a0, 0(a3)
	call	printTree
	addi	a3, s7, 8
	lw		a0, 0(a3)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s7, s7, 12
	lw		a0, 0(s7)
	call	__builtin_printlnInt
	lw		s7, 0(s8)
	addi	s7, s7, 8
	lw		a0, 0(s7)
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
	li		s7, 0
	li		s10, 0
	li		s2, 1
	sw		s2, 152(sp)
	li		s2, 0
	sw		s2, 148(sp)
	li		s2, 0
	sw		s2, 144(sp)
	li		s2, 0
	mv		s4, s2
	li		s2, 1
	mv		s6, s2
	li		s2, 0
	sw		s2, 140(sp)
	li		s2, 1
	sw		s2, 136(sp)
	li		s2, 0
	sw		s2, 132(sp)
	li		s2, 0
	sw		s2, 128(sp)
	li		s2, 2
	mv		s0, s2
	li		s2, 1
	sw		s2, 124(sp)
	li		s2, 0
	sw		s2, 120(sp)
	li		s2, 1
	sw		s2, 116(sp)
	li		s2, 1
	sw		s2, 112(sp)
	li		s2, 1
	sw		s2, 108(sp)
	li		s2, 1
	sw		s2, 104(sp)
	mv		s11, s7
	mv		s3, s10
	j		_init__fake_main_fake_generateOperations__for_cond

_init__fake_main_fake_generateOperations__for_cond:
	li		s2, 50000
	blt		s3, s2, _init__fake_main_fake_generateOperations_split_block_9
	j		_init___init__fake_main_fake_generateOperations__for_cond_pre_header

_init__fake_main_fake_generateOperations_split_block_9:
	slli	s2, a0, 13
	xor		s7, a0, s2
	li		s2, 2147483647
	and		s2, s7, s2
	srai	s7, s2, 17
	xor		s2, s2, s7
	slli	s7, s2, 5
	xor		s7, s2, s7
	li		s2, 2147483647
	and		s7, s7, s2
	li		s2, 128
	rem		s5, s7, s2
	slli	s2, s7, 13
	xor		s7, s7, s2
	li		s2, 2147483647
	and		s2, s7, s2
	srai	s7, s2, 17
	xor		s2, s2, s7
	slli	s7, s2, 5
	xor		s7, s2, s7
	li		s2, 2147483647
	and		s2, s7, s2
	mv		s9, s2
	li		s7, 1717986912
	blt		s2, s7, _init__fake_main_fake_generateOperations_fake_randOp__if_then_3
	j		_init__fake_main_fake_generateOperations_fake_randOp__if_merge_3

_init__fake_main_fake_generateOperations_fake_randOp__if_then_3:
	lw		s2, 136(sp)
	j		_init__fake_main_fake_generateOperations_split_block_10

_init__fake_main_fake_generateOperations_split_block_10:
	li		s7, 1
	beq		s2, s7, _init__fake_main_fake_generateOperations__if_then_3
	j		_init__fake_main_fake_generateOperations__if_else_3

_init__fake_main_fake_generateOperations__if_else_3:
	beq		s11, zero, _init__fake_main_fake_generateOperations_fake_erase__if_then_3
	j		_init__fake_main_fake_generateOperations_fake_erase__if_merge_3

_init__fake_main_fake_generateOperations_fake_erase__if_merge_3:
	lui		s2, %hi(root)
	sw		s11, %lo(root)(s2)
	mv		a0, s11
	li		a1, 0
	li		a2, -1
	mv		a3, s5
	call	eraseImpl
	lui		s2, %hi(root)
	lw		s7, %lo(root)(s2)
	j		_init__fake_main_fake_generateOperations__for_step_3

_init__fake_main_fake_generateOperations__for_step_3:
	addi	s2, s3, 1
	mv		s11, s7
	mv		s3, s2
	mv		a0, s9
	j		_init__fake_main_fake_generateOperations__for_cond

_init__fake_main_fake_generateOperations_fake_erase__if_then_3:
	mv		s7, s11
	j		_init__fake_main_fake_generateOperations__for_step_3

_init__fake_main_fake_generateOperations__if_then_3:
	bne		s11, zero, _init__fake_main_fake_generateOperations_fake_insert__if_then_3
	j		_init__fake_main_fake_generateOperations_fake_insert_split_block_3

_init__fake_main_fake_generateOperations_fake_insert__if_then_3:
	beq		s11, zero, _init__fake_fake_insertImpl_1_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_7

_init__fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s2, a0
	addi	s7, s2, 4
	li		a0, 12
	call	malloc
	li		s10, 2
	sw		s10, 0(a0)
	sw		a0, 0(s7)
	addi	s10, s2, 8
	sw		s5, 0(s10)
	addi	s10, s2, 12
	li		s5, 1
	sw		s5, 0(s10)
	addi	s10, s2, 0
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s7)
	addi	s10, s10, 4
	li		s5, 0
	sw		s5, 0(s10)
	lw		s7, 0(s7)
	addi	s7, s7, 8
	li		s10, 0
	sw		s10, 0(s7)
	li		s7, 4
	lw		s7, 0(s7)
	addi	s7, s7, 0
	sw		s2, 0(s7)
	j		_init__split_block_5

_init__split_block_5:
	mv		s7, s11
	j		_init__fake_main_fake_generateOperations__for_step_3

_init__fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s2, s11, 8
	lw		s7, 0(s2)
	beq		s7, s5, _init__fake_fake_insertImpl_1_insertImpl__if_then_5
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_8

_init__fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		s2, 0(s2)
	blt		s2, s5, _init__fake_fake_insertImpl_1_insertImpl__if_then_6
	j		_init___parallel_copy__15

_init___parallel_copy__15:
	lw		s2, 148(sp)
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s8, s11, 4
	lw		s7, 0(s8)
	slli	s2, s2, 2
	addi	s10, s2, 4
	add		s2, s10, s7
	lw		s7, 0(s2)
	beq		s7, zero, _init__fake_fake_insertImpl_2_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_7

_init__fake_fake_insertImpl_2_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s2, a0
	addi	s7, s2, 4
	li		a0, 12
	call	malloc
	li		s1, 2
	sw		s1, 0(a0)
	sw		a0, 0(s7)
	addi	s1, s2, 8
	sw		s5, 0(s1)
	addi	s1, s2, 12
	li		s5, 1
	sw		s5, 0(s1)
	addi	s5, s2, 0
	sw		s11, 0(s5)
	lw		s5, 0(s7)
	addi	s1, s5, 4
	li		s5, 0
	sw		s5, 0(s1)
	lw		s7, 0(s7)
	addi	s5, s7, 8
	li		s7, 0
	sw		s7, 0(s5)
	lw		s7, 0(s8)
	add		s7, s10, s7
	sw		s2, 0(s7)
	j		_init__split_block_5

_init__fake_fake_insertImpl_2_insertImpl__if_merge_7:
	addi	s10, s7, 8
	lw		s2, 0(s10)
	beq		s2, s5, _init__fake_fake_insertImpl_2_insertImpl__if_then_5
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_8

_init__fake_fake_insertImpl_2_insertImpl__if_merge_8:
	lw		s2, 0(s10)
	blt		s2, s5, _init__fake_fake_insertImpl_2_insertImpl__if_then_6
	j		_init___parallel_copy__21

_init___parallel_copy__21:
	lw		s2, 144(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_9

_init__fake_fake_insertImpl_2_insertImpl__if_merge_9:
	addi	s8, s7, 4
	lw		s1, 0(s8)
	slli	s2, s2, 2
	addi	s10, s2, 4
	add		s2, s10, s1
	lw		s2, 0(s2)
	beq		s2, zero, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s7, s2, 8
	lw		s10, 0(s7)
	beq		s10, s5, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	s7, s2, 12
	lw		s2, 0(s7)
	addi	s2, s2, 1
	sw		s2, 0(s7)
	j		_init__split_block_5

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		s7, 0(s7)
	blt		s7, s5, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		_init___parallel_copy__20

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6:
	lw		s10, 124(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s7, s2, 4
	lw		s1, 0(s7)
	slli	s10, s10, 2
	addi	s8, s10, 4
	add		s10, s8, s1
	lw		s10, 0(s10)
	beq		s10, zero, _init__fake_fake_insertImpl_3_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_7

_init__fake_fake_insertImpl_3_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s1, a0
	addi	s10, s1, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s10)
	addi	a3, s1, 8
	sw		s5, 0(a3)
	addi	s5, s1, 12
	li		a3, 1
	sw		a3, 0(s5)
	addi	s5, s1, 0
	sw		s2, 0(s5)
	lw		s2, 0(s10)
	addi	s2, s2, 4
	li		s5, 0
	sw		s5, 0(s2)
	lw		s2, 0(s10)
	addi	s10, s2, 8
	li		s2, 0
	sw		s2, 0(s10)
	lw		s2, 0(s7)
	add		s2, s8, s2
	sw		s1, 0(s2)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl__if_merge_7:
	addi	s7, s10, 8
	lw		s2, 0(s7)
	beq		s2, s5, _init__fake_fake_insertImpl_3_insertImpl__if_then_6
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_8

_init__fake_fake_insertImpl_3_insertImpl__if_then_6:
	addi	s7, s10, 12
	lw		s2, 0(s7)
	addi	s2, s2, 1
	sw		s2, 0(s7)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl__if_merge_8:
	lw		s2, 0(s7)
	blt		s2, s5, _init__fake_fake_insertImpl_3_insertImpl__if_then_5
	j		_init___parallel_copy__19

_init___parallel_copy__19:
	lw		s2, 128(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl__if_merge_9:
	addi	s1, s10, 4
	lw		s8, 0(s1)
	slli	s2, s2, 2
	addi	s7, s2, 4
	add		s2, s7, s8
	lw		s8, 0(s2)
	beq		s8, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s2, a0
	addi	s8, s2, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s8)
	addi	a3, s2, 8
	sw		s5, 0(a3)
	addi	a3, s2, 12
	li		s5, 1
	sw		s5, 0(a3)
	addi	s5, s2, 0
	sw		s10, 0(s5)
	lw		s10, 0(s8)
	addi	s5, s10, 4
	li		s10, 0
	sw		s10, 0(s5)
	lw		s10, 0(s8)
	addi	s10, s10, 8
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s1)
	add		s7, s7, s10
	sw		s2, 0(s7)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s7, s8, 8
	lw		s2, 0(s7)
	beq		s2, s5, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		s2, 0(s7)
	blt		s2, s5, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		_init___parallel_copy__18

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5:
	lw		s7, 152(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s2, s8, 4
	lw		s10, 0(s2)
	slli	s7, s7, 2
	addi	s1, s7, 4
	add		s7, s1, s10
	lw		s10, 0(s7)
	beq		s10, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_7

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s10, a0
	addi	s7, s10, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s7)
	addi	a3, s10, 8
	sw		s5, 0(a3)
	addi	s5, s10, 12
	li		a3, 1
	sw		a3, 0(s5)
	addi	s5, s10, 0
	sw		s8, 0(s5)
	lw		s5, 0(s7)
	addi	s8, s5, 4
	li		s5, 0
	sw		s5, 0(s8)
	lw		s7, 0(s7)
	addi	s5, s7, 8
	li		s7, 0
	sw		s7, 0(s5)
	lw		s2, 0(s2)
	add		s2, s1, s2
	sw		s10, 0(s2)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_7:
	addi	s2, s10, 8
	lw		s7, 0(s2)
	beq		s7, s5, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_6
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_8

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_6:
	addi	s7, s10, 12
	lw		s2, 0(s7)
	addi	s2, s2, 1
	sw		s2, 0(s7)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_8:
	lw		s2, 0(s2)
	blt		s2, s5, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_5
	j		_init___parallel_copy__16

_init___parallel_copy__16:
	mv		s2, s4
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_9:
	addi	s1, s10, 4
	lw		s7, 0(s1)
	slli	s2, s2, 2
	addi	s8, s2, 4
	add		s2, s8, s7
	lw		a1, 0(s2)
	beq		a1, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s2, a0
	addi	s7, s2, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s7)
	addi	a3, s2, 8
	sw		s5, 0(a3)
	addi	a3, s2, 12
	li		s5, 1
	sw		s5, 0(a3)
	addi	s5, s2, 0
	sw		s10, 0(s5)
	lw		s10, 0(s7)
	addi	s5, s10, 4
	li		s10, 0
	sw		s10, 0(s5)
	lw		s7, 0(s7)
	addi	s7, s7, 8
	li		s10, 0
	sw		s10, 0(s7)
	lw		s7, 0(s1)
	add		s7, s8, s7
	sw		s2, 0(s7)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_7:
	addi	s7, a1, 8
	lw		s2, 0(s7)
	beq		s2, s5, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6:
	addi	s2, a1, 12
	lw		s7, 0(s2)
	addi	s7, s7, 1
	sw		s7, 0(s2)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_8:
	lw		s2, 0(s7)
	blt		s2, s5, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5
	j		_init___parallel_copy__17

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_5:
	lw		a2, 108(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9:
	addi	s2, a1, 4
	lw		s7, 0(s2)
	slli	s2, a2, 2
	addi	s2, s2, 4
	add		s2, s2, s7
	lw		a0, 0(s2)
	mv		a3, s5
	call	insertImpl
	j		_init__split_block_5

_init___parallel_copy__17:
	lw		a2, 120(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_5:
	lw		s2, 116(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_9

_init___parallel_copy__18:
	lw		s7, 140(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_6:
	addi	s2, s8, 12
	lw		s7, 0(s2)
	addi	s7, s7, 1
	sw		s7, 0(s2)
	j		_init__split_block_5

_init__fake_fake_insertImpl_3_insertImpl__if_then_5:
	lw		s2, 112(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_9

_init___parallel_copy__20:
	lw		s10, 132(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_3:
	li		a0, 16
	call	malloc
	mv		s1, a0
	addi	s2, s1, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s2)
	addi	a3, s1, 8
	sw		s5, 0(a3)
	addi	a3, s1, 12
	li		s5, 1
	sw		s5, 0(a3)
	addi	s5, s1, 0
	sw		s7, 0(s5)
	lw		s7, 0(s2)
	addi	s5, s7, 4
	li		s7, 0
	sw		s7, 0(s5)
	lw		s2, 0(s2)
	addi	s2, s2, 8
	li		s7, 0
	sw		s7, 0(s2)
	lw		s2, 0(s8)
	add		s2, s10, s2
	sw		s1, 0(s2)
	j		_init__split_block_5

_init__fake_fake_insertImpl_2_insertImpl__if_then_6:
	lw		s2, 104(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_9

_init__fake_fake_insertImpl_2_insertImpl__if_then_5:
	addi	s7, s7, 12
	lw		s2, 0(s7)
	addi	s2, s2, 1
	sw		s2, 0(s7)
	j		_init__split_block_5

_init__fake_fake_insertImpl_1_insertImpl__if_then_6:
	mv		s2, s6
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_9

_init__fake_fake_insertImpl_1_insertImpl__if_then_5:
	addi	s7, s11, 12
	lw		s2, 0(s7)
	addi	s2, s2, 1
	sw		s2, 0(s7)
	j		_init__split_block_5

_init__fake_main_fake_generateOperations_fake_insert_split_block_3:
	li		a0, 16
	call	malloc
	mv		s7, a0
	addi	s10, s7, 4
	li		a0, 12
	call	malloc
	li		s2, 2
	sw		s2, 0(a0)
	sw		a0, 0(s10)
	addi	s2, s7, 8
	sw		s5, 0(s2)
	addi	s2, s7, 12
	li		s5, 1
	sw		s5, 0(s2)
	addi	s5, s7, 0
	li		s2, 0
	sw		s2, 0(s5)
	lw		s2, 0(s10)
	addi	s2, s2, 4
	li		s5, 0
	sw		s5, 0(s2)
	lw		s2, 0(s10)
	addi	s10, s2, 8
	li		s2, 0
	sw		s2, 0(s10)
	j		_init__fake_main_fake_generateOperations__for_step_3

_init__fake_main_fake_generateOperations_fake_randOp__if_merge_3:
	mv		s2, s0
	j		_init__fake_main_fake_generateOperations_split_block_10

_init___init__fake_main_fake_generateOperations__for_cond_pre_header:
	mv		s0, s11
	li		s7, 0
	li		s2, 0
	sw		s2, 100(sp)
	li		s2, 1
	sw		s2, 96(sp)
	li		s2, 0
	li		s6, 0
	sw		s6, 92(sp)
	li		s6, 2
	sw		s6, 88(sp)
	li		s6, 1
	sw		s6, 84(sp)
	li		s6, 1
	sw		s6, 80(sp)
	li		s6, 0
	sw		s6, 76(sp)
	li		s6, 1
	mv		s4, s6
	li		s6, 0
	sw		s6, 72(sp)
	li		s6, 1
	sw		s6, 68(sp)
	li		s6, 1
	li		s10, 0
	sw		s10, 64(sp)
	li		s10, 1
	sw		s10, 60(sp)
	li		s10, 0
	sw		s10, 56(sp)
	li		s10, 1
	sw		s10, 52(sp)
	mv		s11, s0
	mv		s9, s7
	j		_init__fake_main_fake_generateOperations__for_cond_2

_init__fake_main_fake_generateOperations__for_cond_2:
	li		s0, 100000
	blt		s9, s0, _init__fake_main_fake_generateOperations_split_block
	j		_init___init__fake_main_fake_generateOperations__for_cond_pre_header_2

_init___init__fake_main_fake_generateOperations__for_cond_pre_header_2:
	mv		s6, s11
	li		s0, 0
	li		s2, 1
	mv		s4, s2
	li		s2, 0
	sw		s2, 48(sp)
	li		s2, 0
	sw		s2, 44(sp)
	li		s2, 1
	sw		s2, 40(sp)
	li		s2, 1
	sw		s2, 36(sp)
	li		s2, 1
	sw		s2, 32(sp)
	li		s2, 1
	sw		s2, 28(sp)
	li		s2, 1
	sw		s2, 24(sp)
	li		s2, 0
	sw		s2, 20(sp)
	li		s2, 0
	sw		s2, 16(sp)
	li		s2, 0
	sw		s2, 12(sp)
	li		s2, 2
	mv		s7, s2
	li		s2, 1
	sw		s2, 8(sp)
	li		s2, 0
	sw		s2, 4(sp)
	li		s2, 1
	li		s10, 0
	sw		s10, 0(sp)
	mv		s9, s6
	mv		s5, s0
	j		_init__fake_main_fake_generateOperations__for_cond_3

_init__fake_main_fake_generateOperations__for_cond_3:
	li		s6, 50000
	blt		s5, s6, _init__fake_main_fake_generateOperations_split_block_5
	j		_init__split_block_3

_init__fake_main_fake_generateOperations_split_block_5:
	slli	s6, a0, 13
	xor		s6, a0, s6
	li		s0, 2147483647
	and		s6, s6, s0
	srai	s0, s6, 17
	xor		s0, s6, s0
	slli	s6, s0, 5
	xor		s6, s0, s6
	li		s0, 2147483647
	and		s0, s6, s0
	li		s6, 128
	rem		s3, s0, s6
	slli	s6, s0, 13
	xor		s6, s0, s6
	li		s0, 2147483647
	and		s6, s6, s0
	srai	s0, s6, 17
	xor		s6, s6, s0
	slli	s0, s6, 5
	xor		s0, s6, s0
	li		s6, 2147483647
	and		s6, s0, s6
	mv		s10, s6
	li		s0, 858993456
	blt		s6, s0, _init__fake_main_fake_generateOperations_fake_randOp__if_then_2
	j		_init__fake_main_fake_generateOperations_fake_randOp__if_merge_2

_init__fake_main_fake_generateOperations_fake_randOp__if_merge_2:
	mv		s6, s7
	j		_init__fake_main_fake_generateOperations_split_block_6

_init__fake_main_fake_generateOperations_split_block_6:
	li		s0, 1
	beq		s6, s0, _init__fake_main_fake_generateOperations__if_then_2
	j		_init__fake_main_fake_generateOperations__if_else_2

_init__fake_main_fake_generateOperations__if_else_2:
	beq		s9, zero, _init__fake_main_fake_generateOperations_fake_erase__if_then_2
	j		_init__fake_main_fake_generateOperations_fake_erase__if_merge_2

_init__fake_main_fake_generateOperations_fake_erase__if_then_2:
	mv		s6, s9
	j		_init__fake_main_fake_generateOperations__for_step_2

_init__fake_main_fake_generateOperations__for_step_2:
	addi	s0, s5, 1
	mv		s9, s6
	mv		a0, s10
	mv		s5, s0
	j		_init__fake_main_fake_generateOperations__for_cond_3

_init__fake_main_fake_generateOperations_fake_erase__if_merge_2:
	lui		s6, %hi(root)
	sw		s9, %lo(root)(s6)
	mv		a0, s9
	li		a1, 0
	li		a2, -1
	mv		a3, s3
	call	eraseImpl
	lui		s6, %hi(root)
	lw		s6, %lo(root)(s6)
	j		_init__fake_main_fake_generateOperations__for_step_2

_init__fake_main_fake_generateOperations__if_then_2:
	bne		s9, zero, _init__fake_main_fake_generateOperations_fake_insert__if_then_2
	j		_init__fake_main_fake_generateOperations_fake_insert_split_block_2

_init__fake_main_fake_generateOperations_fake_insert__if_then_2:
	beq		s9, zero, _init__fake_fake_insertImpl_1_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_4

_init__fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s0, s9, 8
	lw		s6, 0(s0)
	beq		s6, s3, _init__fake_fake_insertImpl_1_insertImpl__if_then_3
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_5

_init__fake_fake_insertImpl_1_insertImpl__if_then_3:
	addi	s0, s9, 12
	lw		s6, 0(s0)
	addi	s6, s6, 1
	sw		s6, 0(s0)
	j		_init__split_block_2

_init__split_block_2:
	mv		s6, s9
	j		_init__fake_main_fake_generateOperations__for_step_2

_init__fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		s6, 0(s0)
	blt		s6, s3, _init__fake_fake_insertImpl_1_insertImpl__if_then_4
	j		_init___parallel_copy__8

_init___parallel_copy__8:
	lw		s6, 44(sp)
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s11, s9, 4
	lw		s0, 0(s11)
	slli	s6, s6, 2
	addi	s8, s6, 4
	add		s6, s8, s0
	lw		s0, 0(s6)
	beq		s0, zero, _init__fake_fake_insertImpl_2_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_4

_init__fake_fake_insertImpl_2_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s0, s6, 4
	li		a0, 12
	call	malloc
	li		s1, 2
	sw		s1, 0(a0)
	sw		a0, 0(s0)
	addi	s1, s6, 8
	sw		s3, 0(s1)
	addi	s1, s6, 12
	li		s3, 1
	sw		s3, 0(s1)
	addi	s3, s6, 0
	sw		s9, 0(s3)
	lw		s3, 0(s0)
	addi	s3, s3, 4
	li		s1, 0
	sw		s1, 0(s3)
	lw		s0, 0(s0)
	addi	s3, s0, 8
	li		s0, 0
	sw		s0, 0(s3)
	lw		s0, 0(s11)
	add		s0, s8, s0
	sw		s6, 0(s0)
	j		_init__split_block_2

_init__fake_fake_insertImpl_2_insertImpl__if_merge_4:
	addi	s6, s0, 8
	lw		s11, 0(s6)
	beq		s11, s3, _init__fake_fake_insertImpl_2_insertImpl__if_then_4
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_5

_init__fake_fake_insertImpl_2_insertImpl__if_merge_5:
	lw		s6, 0(s6)
	blt		s6, s3, _init__fake_fake_insertImpl_2_insertImpl__if_then_3
	j		_init___parallel_copy__14

_init__fake_fake_insertImpl_2_insertImpl__if_then_3:
	mv		s6, s4
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_6

_init__fake_fake_insertImpl_2_insertImpl__if_merge_6:
	addi	s1, s0, 4
	lw		s11, 0(s1)
	slli	s6, s6, 2
	addi	s8, s6, 4
	add		s6, s8, s11
	lw		s11, 0(s6)
	beq		s11, zero, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s0, s11, 8
	lw		s6, 0(s0)
	beq		s6, s3, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3:
	addi	s0, s11, 12
	lw		s6, 0(s0)
	addi	s6, s6, 1
	sw		s6, 0(s0)
	j		_init__split_block_2

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		s6, 0(s0)
	blt		s6, s3, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		_init___parallel_copy__9

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4:
	mv		s6, s2
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s8, s11, 4
	lw		s0, 0(s8)
	slli	s6, s6, 2
	addi	s1, s6, 4
	add		s6, s1, s0
	lw		s0, 0(s6)
	beq		s0, zero, _init__fake_fake_insertImpl_3_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_4

_init__fake_fake_insertImpl_3_insertImpl__if_merge_4:
	addi	s6, s0, 8
	lw		s11, 0(s6)
	beq		s11, s3, _init__fake_fake_insertImpl_3_insertImpl__if_then_4
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_5

_init__fake_fake_insertImpl_3_insertImpl__if_then_4:
	addi	s0, s0, 12
	lw		s6, 0(s0)
	addi	s6, s6, 1
	sw		s6, 0(s0)
	j		_init__split_block_2

_init__fake_fake_insertImpl_3_insertImpl__if_merge_5:
	lw		s6, 0(s6)
	blt		s6, s3, _init__fake_fake_insertImpl_3_insertImpl__if_then_3
	j		_init___parallel_copy__10

_init__fake_fake_insertImpl_3_insertImpl__if_then_3:
	lw		s11, 32(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl__if_merge_6:
	addi	s6, s0, 4
	lw		s1, 0(s6)
	slli	s11, s11, 2
	addi	s8, s11, 4
	add		s11, s8, s1
	lw		s11, 0(s11)
	beq		s11, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s1, a0
	addi	s11, s1, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s11)
	addi	a3, s1, 8
	sw		s3, 0(a3)
	addi	a3, s1, 12
	li		s3, 1
	sw		s3, 0(a3)
	addi	s3, s1, 0
	sw		s0, 0(s3)
	lw		s0, 0(s11)
	addi	s3, s0, 4
	li		s0, 0
	sw		s0, 0(s3)
	lw		s0, 0(s11)
	addi	s0, s0, 8
	li		s3, 0
	sw		s3, 0(s0)
	lw		s6, 0(s6)
	add		s6, s8, s6
	sw		s1, 0(s6)
	j		_init__split_block_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s6, s11, 8
	lw		s0, 0(s6)
	beq		s0, s3, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3:
	addi	s0, s11, 12
	lw		s6, 0(s0)
	addi	s6, s6, 1
	sw		s6, 0(s0)
	j		_init__split_block_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		s6, 0(s6)
	blt		s6, s3, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		_init___parallel_copy__11

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4:
	lw		s6, 36(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s8, s11, 4
	lw		s0, 0(s8)
	slli	s6, s6, 2
	addi	s6, s6, 4
	add		s0, s6, s0
	lw		s0, 0(s0)
	beq		s0, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_4:
	addi	s6, s0, 8
	lw		s11, 0(s6)
	beq		s11, s3, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_3
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_5:
	lw		s6, 0(s6)
	blt		s6, s3, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_4
	j		_init___parallel_copy__13

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_4:
	lw		s11, 28(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_6:
	addi	s6, s0, 4
	lw		s8, 0(s6)
	slli	s11, s11, 2
	addi	s1, s11, 4
	add		s11, s1, s8
	lw		a1, 0(s11)
	beq		a1, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_4:
	addi	s0, a1, 8
	lw		s6, 0(s0)
	beq		s6, s3, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_5:
	lw		s6, 0(s0)
	blt		s6, s3, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3
	j		_init___parallel_copy__12

_init___parallel_copy__12:
	lw		a2, 4(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6:
	addi	s6, a1, 4
	lw		s6, 0(s6)
	slli	s0, a2, 2
	addi	s0, s0, 4
	add		s6, s0, s6
	lw		a0, 0(s6)
	mv		a3, s3
	call	insertImpl
	j		_init__split_block_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_3:
	lw		a2, 8(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_4:
	addi	s6, a1, 12
	lw		s0, 0(s6)
	addi	s0, s0, 1
	sw		s0, 0(s6)
	j		_init__split_block_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s11, a0
	addi	s8, s11, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s8)
	addi	a3, s11, 8
	sw		s3, 0(a3)
	addi	s3, s11, 12
	li		a3, 1
	sw		a3, 0(s3)
	addi	s3, s11, 0
	sw		s0, 0(s3)
	lw		s0, 0(s8)
	addi	s0, s0, 4
	li		s3, 0
	sw		s3, 0(s0)
	lw		s0, 0(s8)
	addi	s0, s0, 8
	li		s3, 0
	sw		s3, 0(s0)
	lw		s6, 0(s6)
	add		s6, s1, s6
	sw		s11, 0(s6)
	j		_init__split_block_2

_init___parallel_copy__13:
	lw		s11, 48(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_3:
	addi	s0, s0, 12
	lw		s6, 0(s0)
	addi	s6, s6, 1
	sw		s6, 0(s0)
	j		_init__split_block_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s1, a0
	addi	s0, s1, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s0)
	addi	a3, s1, 8
	sw		s3, 0(a3)
	addi	a3, s1, 12
	li		s3, 1
	sw		s3, 0(a3)
	addi	s3, s1, 0
	sw		s11, 0(s3)
	lw		s3, 0(s0)
	addi	s3, s3, 4
	li		s11, 0
	sw		s11, 0(s3)
	lw		s0, 0(s0)
	addi	s0, s0, 8
	li		s3, 0
	sw		s3, 0(s0)
	lw		s0, 0(s8)
	add		s6, s6, s0
	sw		s1, 0(s6)
	j		_init__split_block_2

_init___parallel_copy__11:
	lw		s6, 16(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init___parallel_copy__10:
	lw		s11, 0(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_6

_init__fake_fake_insertImpl_3_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s6, s0, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s6)
	addi	a3, s0, 8
	sw		s3, 0(a3)
	addi	a3, s0, 12
	li		s3, 1
	sw		s3, 0(a3)
	addi	s3, s0, 0
	sw		s11, 0(s3)
	lw		s3, 0(s6)
	addi	s3, s3, 4
	li		s11, 0
	sw		s11, 0(s3)
	lw		s6, 0(s6)
	addi	s3, s6, 8
	li		s6, 0
	sw		s6, 0(s3)
	lw		s6, 0(s8)
	add		s6, s1, s6
	sw		s0, 0(s6)
	j		_init__split_block_2

_init___parallel_copy__9:
	lw		s6, 12(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s11, s6, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s11)
	addi	a3, s6, 8
	sw		s3, 0(a3)
	addi	a3, s6, 12
	li		s3, 1
	sw		s3, 0(a3)
	addi	s3, s6, 0
	sw		s0, 0(s3)
	lw		s0, 0(s11)
	addi	s0, s0, 4
	li		s3, 0
	sw		s3, 0(s0)
	lw		s0, 0(s11)
	addi	s3, s0, 8
	li		s0, 0
	sw		s0, 0(s3)
	lw		s0, 0(s1)
	add		s0, s8, s0
	sw		s6, 0(s0)
	j		_init__split_block_2

_init___parallel_copy__14:
	lw		s6, 20(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_6

_init__fake_fake_insertImpl_2_insertImpl__if_then_4:
	addi	s6, s0, 12
	lw		s0, 0(s6)
	addi	s0, s0, 1
	sw		s0, 0(s6)
	j		_init__split_block_2

_init__fake_fake_insertImpl_1_insertImpl__if_then_4:
	lw		s6, 40(sp)
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_6

_init__fake_fake_insertImpl_1_insertImpl_split_block_2:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s0, s6, 4
	li		a0, 12
	call	malloc
	li		s11, 2
	sw		s11, 0(a0)
	sw		a0, 0(s0)
	addi	s11, s6, 8
	sw		s3, 0(s11)
	addi	s3, s6, 12
	li		s11, 1
	sw		s11, 0(s3)
	addi	s11, s6, 0
	li		s3, 0
	sw		s3, 0(s11)
	lw		s3, 0(s0)
	addi	s3, s3, 4
	li		s11, 0
	sw		s11, 0(s3)
	lw		s0, 0(s0)
	addi	s0, s0, 8
	li		s3, 0
	sw		s3, 0(s0)
	li		s0, 4
	lw		s0, 0(s0)
	addi	s0, s0, 0
	sw		s6, 0(s0)
	j		_init__split_block_2

_init__fake_main_fake_generateOperations_fake_insert_split_block_2:
	li		a0, 16
	call	malloc
	mv		s6, a0
	addi	s9, s6, 4
	li		a0, 12
	call	malloc
	li		s0, 2
	sw		s0, 0(a0)
	sw		a0, 0(s9)
	addi	s0, s6, 8
	sw		s3, 0(s0)
	addi	s3, s6, 12
	li		s0, 1
	sw		s0, 0(s3)
	addi	s0, s6, 0
	li		s3, 0
	sw		s3, 0(s0)
	lw		s0, 0(s9)
	addi	s3, s0, 4
	li		s0, 0
	sw		s0, 0(s3)
	lw		s0, 0(s9)
	addi	s3, s0, 8
	li		s0, 0
	sw		s0, 0(s3)
	j		_init__fake_main_fake_generateOperations__for_step_2

_init__fake_main_fake_generateOperations_fake_randOp__if_then_2:
	lw		s6, 24(sp)
	j		_init__fake_main_fake_generateOperations_split_block_6

_init__split_block_3:
	beq		s9, zero, _init__split_block_4
	j		_init__fake_fake_printTree_1_printTree__if_merge

_init__split_block_4:
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
	addi	s6, s9, 4
	lw		s2, 0(s6)
	addi	s2, s2, 4
	lw		a0, 0(s2)
	call	printTree
	addi	s2, s9, 8
	lw		a0, 0(s2)
	call	__builtin_printInt
	la		a0, __str_const_1
	call	__builtin_print
	addi	s2, s9, 12
	lw		a0, 0(s2)
	call	__builtin_printlnInt
	lw		s2, 0(s6)
	addi	s2, s2, 8
	lw		a0, 0(s2)
	call	printTree
	j		_init__split_block_4

_init__fake_main_fake_generateOperations_split_block:
	slli	s0, a0, 13
	xor		s7, a0, s0
	li		s0, 2147483647
	and		s7, s7, s0
	srai	s0, s7, 17
	xor		s7, s7, s0
	slli	s0, s7, 5
	xor		s0, s7, s0
	li		s7, 2147483647
	and		s7, s0, s7
	li		s0, 128
	rem		s10, s7, s0
	slli	s0, s7, 13
	xor		s0, s7, s0
	li		s7, 2147483647
	and		s0, s0, s7
	srai	s7, s0, 17
	xor		s0, s0, s7
	slli	s7, s0, 5
	xor		s0, s0, s7
	li		s7, 2147483647
	and		s0, s0, s7
	mv		s3, s0
	li		s7, 429496728
	blt		s0, s7, _init__fake_main_fake_generateOperations_fake_randOp__if_then
	j		_init__fake_main_fake_generateOperations_fake_randOp__if_merge

_init__fake_main_fake_generateOperations_fake_randOp__if_then:
	lw		s0, 60(sp)
	j		_init__fake_main_fake_generateOperations_split_block_2

_init__fake_main_fake_generateOperations_split_block_2:
	li		s7, 1
	beq		s0, s7, _init__fake_main_fake_generateOperations__if_then
	j		_init__fake_main_fake_generateOperations__if_else

_init__fake_main_fake_generateOperations__if_then:
	bne		s11, zero, _init__fake_main_fake_generateOperations_fake_insert__if_then
	j		_init__fake_main_fake_generateOperations_fake_insert_split_block

_init__fake_main_fake_generateOperations_fake_insert_split_block:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s5, s0, 4
	li		a0, 12
	call	malloc
	li		s7, 2
	sw		s7, 0(a0)
	sw		a0, 0(s5)
	addi	s7, s0, 8
	sw		s10, 0(s7)
	addi	s10, s0, 12
	li		s7, 1
	sw		s7, 0(s10)
	addi	s10, s0, 0
	li		s7, 0
	sw		s7, 0(s10)
	lw		s7, 0(s5)
	addi	s7, s7, 4
	li		s10, 0
	sw		s10, 0(s7)
	lw		s7, 0(s5)
	addi	s7, s7, 8
	li		s10, 0
	sw		s10, 0(s7)
	j		_init__fake_main_fake_generateOperations__for_step

_init__fake_main_fake_generateOperations__for_step:
	addi	s7, s9, 1
	mv		s11, s0
	mv		s9, s7
	mv		a0, s3
	j		_init__fake_main_fake_generateOperations__for_cond_2

_init__fake_main_fake_generateOperations_fake_insert__if_then:
	beq		s11, zero, _init__fake_fake_insertImpl_1_insertImpl_split_block
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge

_init__fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s7, s0, 4
	li		a0, 12
	call	malloc
	li		s5, 2
	sw		s5, 0(a0)
	sw		a0, 0(s7)
	addi	s5, s0, 8
	sw		s10, 0(s5)
	addi	s5, s0, 12
	li		s10, 1
	sw		s10, 0(s5)
	addi	s10, s0, 0
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s7)
	addi	s5, s10, 4
	li		s10, 0
	sw		s10, 0(s5)
	lw		s7, 0(s7)
	addi	s10, s7, 8
	li		s7, 0
	sw		s7, 0(s10)
	li		s7, 4
	lw		s7, 0(s7)
	addi	s7, s7, 0
	sw		s0, 0(s7)
	j		_init__split_block

_init__split_block:
	mv		s0, s11
	j		_init__fake_main_fake_generateOperations__for_step

_init__fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s0, s11, 8
	lw		s7, 0(s0)
	beq		s7, s10, _init__fake_fake_insertImpl_1_insertImpl__if_then
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_2

_init__fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s7, s11, 12
	lw		s0, 0(s7)
	addi	s0, s0, 1
	sw		s0, 0(s7)
	j		_init__split_block

_init__fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		s0, 0(s0)
	blt		s0, s10, _init__fake_fake_insertImpl_1_insertImpl__if_then_2
	j		_init___parallel_copy__7

_init___parallel_copy__7:
	lw		s0, 64(sp)
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s5, s11, 4
	lw		s7, 0(s5)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s7, s0, s7
	lw		s7, 0(s7)
	beq		s7, zero, _init__fake_fake_insertImpl_2_insertImpl_split_block
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge

_init__fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s8, a0
	addi	s7, s8, 4
	li		a0, 12
	call	malloc
	li		s1, 2
	sw		s1, 0(a0)
	sw		a0, 0(s7)
	addi	s1, s8, 8
	sw		s10, 0(s1)
	addi	s10, s8, 12
	li		s1, 1
	sw		s1, 0(s10)
	addi	s10, s8, 0
	sw		s11, 0(s10)
	lw		s10, 0(s7)
	addi	s10, s10, 4
	li		s1, 0
	sw		s1, 0(s10)
	lw		s7, 0(s7)
	addi	s7, s7, 8
	li		s10, 0
	sw		s10, 0(s7)
	lw		s7, 0(s5)
	add		s0, s0, s7
	sw		s8, 0(s0)
	j		_init__split_block

_init__fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s0, s7, 8
	lw		s5, 0(s0)
	beq		s5, s10, _init__fake_fake_insertImpl_2_insertImpl__if_then
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_2

_init__fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s0, s7, 12
	lw		s7, 0(s0)
	addi	s7, s7, 1
	sw		s7, 0(s0)
	j		_init__split_block

_init__fake_fake_insertImpl_2_insertImpl__if_merge_2:
	lw		s0, 0(s0)
	blt		s0, s10, _init__fake_fake_insertImpl_2_insertImpl__if_then_2
	j		_init___parallel_copy_

_init__fake_fake_insertImpl_2_insertImpl__if_then_2:
	lw		s0, 96(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_3

_init__fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s8, s7, 4
	lw		s5, 0(s8)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s5, s0, s5
	lw		s5, 0(s5)
	beq		s5, zero, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s1, s5, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s1)
	addi	a3, s5, 8
	sw		s10, 0(a3)
	addi	a3, s5, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s5, 0
	sw		s7, 0(s10)
	lw		s7, 0(s1)
	addi	s10, s7, 4
	li		s7, 0
	sw		s7, 0(s10)
	lw		s7, 0(s1)
	addi	s10, s7, 8
	li		s7, 0
	sw		s7, 0(s10)
	lw		s7, 0(s8)
	add		s0, s0, s7
	sw		s5, 0(s0)
	j		_init__split_block

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s7, s5, 8
	lw		s0, 0(s7)
	beq		s0, s10, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		s0, 0(s7)
	blt		s0, s10, _init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		_init___parallel_copy__2

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	lw		s0, 80(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s8, s5, 4
	lw		s1, 0(s8)
	slli	s0, s0, 2
	addi	s7, s0, 4
	add		s0, s7, s1
	lw		s0, 0(s0)
	beq		s0, zero, _init__fake_fake_insertImpl_3_insertImpl_split_block
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge

_init__fake_fake_insertImpl_3_insertImpl__if_merge:
	addi	s5, s0, 8
	lw		s7, 0(s5)
	beq		s7, s10, _init__fake_fake_insertImpl_3_insertImpl__if_then_2
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_2

_init__fake_fake_insertImpl_3_insertImpl__if_merge_2:
	lw		s7, 0(s5)
	blt		s7, s10, _init__fake_fake_insertImpl_3_insertImpl__if_then
	j		_init___parallel_copy__3

_init___parallel_copy__3:
	lw		s7, 76(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl__if_merge_3:
	addi	s5, s0, 4
	lw		s1, 0(s5)
	slli	s7, s7, 2
	addi	s8, s7, 4
	add		s7, s8, s1
	lw		s7, 0(s7)
	beq		s7, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s5, s7, 8
	lw		s0, 0(s5)
	beq		s0, s10, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		s0, 0(s5)
	blt		s0, s10, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		_init___parallel_copy__4

_init___parallel_copy__4:
	lw		s5, 100(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s0, s7, 4
	lw		s8, 0(s0)
	slli	s5, s5, 2
	addi	s1, s5, 4
	add		s5, s1, s8
	lw		s8, 0(s5)
	beq		s8, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s8, a0
	addi	s5, s8, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s5)
	addi	a3, s8, 8
	sw		s10, 0(a3)
	addi	a3, s8, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s8, 0
	sw		s7, 0(s10)
	lw		s7, 0(s5)
	addi	s10, s7, 4
	li		s7, 0
	sw		s7, 0(s10)
	lw		s7, 0(s5)
	addi	s10, s7, 8
	li		s7, 0
	sw		s7, 0(s10)
	lw		s0, 0(s0)
	add		s0, s1, s0
	sw		s8, 0(s0)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge:
	addi	s0, s8, 8
	lw		s7, 0(s0)
	beq		s7, s10, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then:
	addi	s7, s8, 12
	lw		s0, 0(s7)
	addi	s0, s0, 1
	sw		s0, 0(s7)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_2:
	lw		s0, 0(s0)
	blt		s0, s10, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2
	j		_init___parallel_copy__6

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_then_2:
	mv		s0, s4
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3:
	addi	s1, s8, 4
	lw		s7, 0(s1)
	slli	s0, s0, 2
	addi	s0, s0, 4
	add		s7, s0, s7
	lw		a1, 0(s7)
	beq		a1, zero, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge:
	addi	s0, a1, 8
	lw		s7, 0(s0)
	beq		s7, s10, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s7, a1, 12
	lw		s0, 0(s7)
	addi	s0, s0, 1
	sw		s0, 0(s7)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_2:
	lw		s0, 0(s0)
	blt		s0, s10, _init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2
	j		_init___parallel_copy__5

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	lw		a2, 68(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3:
	addi	s0, a1, 4
	lw		s0, 0(s0)
	slli	s7, a2, 2
	addi	s7, s7, 4
	add		s0, s7, s0
	lw		a0, 0(s0)
	mv		a3, s10
	call	insertImpl
	j		_init__split_block

_init___parallel_copy__5:
	lw		a2, 56(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s5, a0
	addi	s7, s5, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s7)
	addi	a3, s5, 8
	sw		s10, 0(a3)
	addi	a3, s5, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s5, 0
	sw		s8, 0(s10)
	lw		s10, 0(s7)
	addi	s10, s10, 4
	li		s8, 0
	sw		s8, 0(s10)
	lw		s7, 0(s7)
	addi	s10, s7, 8
	li		s7, 0
	sw		s7, 0(s10)
	lw		s7, 0(s1)
	add		s0, s0, s7
	sw		s5, 0(s0)
	j		_init__split_block

_init___parallel_copy__6:
	lw		s0, 92(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_2_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	lw		s5, 52(sp)
	j		_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then:
	addi	s7, s7, 12
	lw		s0, 0(s7)
	addi	s0, s0, 1
	sw		s0, 0(s7)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_fake_fake_insertImpl_1_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s1, a0
	addi	s7, s1, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s7)
	addi	a3, s1, 8
	sw		s10, 0(a3)
	addi	s10, s1, 12
	li		a3, 1
	sw		a3, 0(s10)
	addi	s10, s1, 0
	sw		s0, 0(s10)
	lw		s0, 0(s7)
	addi	s10, s0, 4
	li		s0, 0
	sw		s0, 0(s10)
	lw		s0, 0(s7)
	addi	s0, s0, 8
	li		s7, 0
	sw		s7, 0(s0)
	lw		s0, 0(s5)
	add		s0, s8, s0
	sw		s1, 0(s0)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl__if_then:
	mv		s7, s6
	j		_init__fake_fake_insertImpl_3_insertImpl__if_merge_3

_init__fake_fake_insertImpl_3_insertImpl__if_then_2:
	addi	s7, s0, 12
	lw		s0, 0(s7)
	addi	s0, s0, 1
	sw		s0, 0(s7)
	j		_init__split_block

_init__fake_fake_insertImpl_3_insertImpl_split_block:
	li		a0, 16
	call	malloc
	mv		s0, a0
	addi	s1, s0, 4
	li		a0, 12
	call	malloc
	li		a3, 2
	sw		a3, 0(a0)
	sw		a0, 0(s1)
	addi	a3, s0, 8
	sw		s10, 0(a3)
	addi	a3, s0, 12
	li		s10, 1
	sw		s10, 0(a3)
	addi	s10, s0, 0
	sw		s5, 0(s10)
	lw		s10, 0(s1)
	addi	s10, s10, 4
	li		s5, 0
	sw		s5, 0(s10)
	lw		s10, 0(s1)
	addi	s5, s10, 8
	li		s10, 0
	sw		s10, 0(s5)
	lw		s10, 0(s8)
	add		s7, s7, s10
	sw		s0, 0(s7)
	j		_init__split_block

_init___parallel_copy__2:
	mv		s0, s2
	j		_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_fake_insertImpl_2_insertImpl_fake_fake_insertImpl_1_insertImpl__if_then_2:
	addi	s7, s5, 12
	lw		s0, 0(s7)
	addi	s0, s0, 1
	sw		s0, 0(s7)
	j		_init__split_block

_init___parallel_copy_:
	lw		s0, 72(sp)
	j		_init__fake_fake_insertImpl_2_insertImpl__if_merge_3

_init__fake_fake_insertImpl_1_insertImpl__if_then_2:
	lw		s0, 84(sp)
	j		_init__fake_fake_insertImpl_1_insertImpl__if_merge_3

_init__fake_main_fake_generateOperations__if_else:
	beq		s11, zero, _init__fake_main_fake_generateOperations_fake_erase__if_then
	j		_init__fake_main_fake_generateOperations_fake_erase__if_merge

_init__fake_main_fake_generateOperations_fake_erase__if_then:
	mv		s0, s11
	j		_init__fake_main_fake_generateOperations__for_step

_init__fake_main_fake_generateOperations_fake_erase__if_merge:
	lui		s0, %hi(root)
	sw		s11, %lo(root)(s0)
	mv		a0, s11
	li		a1, 0
	li		a2, -1
	mv		a3, s10
	call	eraseImpl
	lui		s0, %hi(root)
	lw		s0, %lo(root)(s0)
	j		_init__fake_main_fake_generateOperations__for_step

_init__fake_main_fake_generateOperations_fake_randOp__if_merge:
	lw		s0, 88(sp)
	j		_init__fake_main_fake_generateOperations_split_block_2


