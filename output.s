	.data

	.globl	__str_const_1
__str_const_1:
	.string	" "

	.globl	__str_const_2
__str_const_2:
	.string	""

	.globl	__str_const_3
__str_const_3:
	.string	"Sorry, the number n must be a number s.t. there exists i satisfying n=1+2+...+i"

	.globl	__str_const_4
__str_const_4:
	.string	"Let's start!"

	.globl	__str_const_5
__str_const_5:
	.string	"step "

	.globl	__str_const_6
__str_const_6:
	.string	":"

	.globl	__str_const_7
__str_const_7:
	.string	"Total: "

	.globl	__str_const_8
__str_const_8:
	.string	" step(s)"

	.globl	n
n:
	.zero	4

	.globl	h
h:
	.zero	4

	.globl	now
now:
	.zero	4

	.globl	a
a:
	.zero	4

	.globl	A
A:
	.zero	4

	.globl	M
M:
	.zero	4

	.globl	Q
Q:
	.zero	4

	.globl	R
R:
	.zero	4

	.globl	seed
seed:
	.zero	4


	.text

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
	sw		s9, 28(sp)
	sw		s10, 24(sp)
	sw		s11, 20(sp)
	lui		s6, %hi(A)
	lw		s9, %lo(A)(s6)
	lui		s6, %hi(seed)
	lw		s6, %lo(seed)(s6)
	sw		s6, 16(sp)
	lui		s6, %hi(M)
	lw		s1, %lo(M)(s6)
	lui		s6, %hi(now)
	lw		s6, %lo(now)(s6)
	li		s4, 0
	sw		s4, 12(sp)
	li		s4, 0
	mv		s0, s4
	li		s4, 0
	mv		s10, s4
	li		s3, 0
	li		a0, 404
	call	malloc
	mv		s2, a0
	li		s4, 100
	sw		s4, 0(s2)
	div		s11, s1, s9
	rem		s4, s1, s9
	j		main_fake_pd__for_cond

main_fake_pd__for_cond:
	li		s5, 210
	ble		s3, s5, main_fake_pd__for_body
	j		main_fake_pd__for_merge

main_fake_pd__for_body:
	addi	s5, s3, 1
	mul		a6, s3, s5
	li		a1, 2
	div		a1, a6, a1
	li		a6, 210
	beq		a6, a1, main_fake_pd__if_then
	j		main_fake_pd__for_step

main_fake_pd__if_then:
	li		s5, 1
	j		main_split_block

main_split_block:
	bne		s5, zero, main__if_merge
	j		main__if_then

main__if_merge:
	la		a0, __str_const_4
	call	__builtin_println
	li		s6, 3654898
	rem		s6, s6, s11
	mul		s5, s9, s6
	li		s6, 3654898
	div		s6, s6, s11
	mul		s6, s4, s6
	sub		s6, s5, s6
	li		s5, 0
	bge		s6, s5, main_split_block_2
	j		main_fake_random__if_else_3

main_fake_random__if_else_3:
	add		s6, s6, s1
	j		main_split_block_2

main_split_block_2:
	li		s5, 10
	rem		s5, s6, s5
	addi	s5, s5, 1
	mv		a0, s5
	call	__builtin_toString
	call	__builtin_println
	lw		a1, 12(sp)
	j		main__for_cond

main__for_cond:
	addi	a6, s5, -1
	blt		a1, a6, main__for_body
	j		main__for_merge

main__for_merge:
	li		s9, 4
	mul		s9, a6, s9
	addi	s9, s9, 4
	add		s9, s9, s2
	li		s1, 210
	sub		s0, s1, s0
	sw		s0, 0(s9)
	li		s0, 0
	j		main_fake_show__for_cond

main_fake_show__for_cond:
	blt		s0, s5, main_fake_show__for_body_2
	j		main_split_block_5

main_fake_show__for_body_2:
	li		s9, 4
	mul		s9, s0, s9
	addi	s9, s9, 4
	add		s9, s9, s2
	lw		a0, 0(s9)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	call	__builtin_print
	addi	s0, s0, 1
	j		main_fake_show__for_cond

main_split_block_5:
	la		a0, __str_const_2
	call	__builtin_println
	li		s9, 0
	j		main_fake_merge__for_cond

main_fake_merge__for_cond:
	blt		s9, s5, main_fake_merge__for_body_5
	j		main_fake_merge__for_merge

main_fake_merge__for_merge:
	li		s0, 0
	j		main_fake_merge__for_cond_2

main_fake_merge__for_cond_2:
	blt		s0, s5, main_fake_merge__for_body_4
	j		main__parallel_copy_

main__parallel_copy_:
	mv		s0, s5
	j		main_split_block_6

main_split_block_6:
	mv		s5, s10
	j		main__while_cond_2

main__while_cond_2:
	li		a0, 404
	call	malloc
	li		s9, 100
	sw		s9, 0(a0)
	bne		s0, s3, main_fake_win__if_then
	j		main_fake_win__if_merge

main_fake_win__if_then:
	li		s9, 0
	j		main_split_block_7

main_split_block_7:
	bne		s9, zero, main__while_merge_2
	j		main__while_body_2

main__while_body_2:
	addi	s5, s5, 1
	mv		a0, s5
	call	__builtin_toString
	mv		a1, a0
	la		a0, __str_const_5
	call	__builtin_string_add
	la		a1, __str_const_6
	call	__builtin_string_add
	call	__builtin_println
	li		s9, 0
	j		main_fake_move__for_cond

main_fake_move__for_cond:
	blt		s9, s0, main_fake_move__for_body
	j		main_split_block_8

main_split_block_8:
	li		s9, 4
	mul		s9, s0, s9
	addi	s9, s9, 4
	add		s9, s9, s2
	sw		s0, 0(s9)
	addi	s1, s0, 1
	li		s9, 0
	j		main_fake_merge__for_cond_3

main_fake_merge__for_cond_3:
	blt		s9, s1, main_fake_merge__for_body_2
	j		main_fake_merge__for_merge_2

main_fake_merge__for_merge_2:
	li		s0, 0
	j		main_fake_merge__for_cond_4

main_fake_merge__for_cond_4:
	blt		s0, s1, main_fake_merge__for_body
	j		main__parallel_copy__2

main__parallel_copy__2:
	mv		s0, s1
	j		main_split_block_9

main_split_block_9:
	li		s9, 0
	j		main_fake_show__for_cond_2

main_fake_show__for_cond_2:
	blt		s9, s0, main_fake_show__for_body
	j		main_split_block_10

main_fake_show__for_body:
	li		s1, 4
	mul		s1, s9, s1
	addi	s1, s1, 4
	add		s1, s1, s2
	lw		a0, 0(s1)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	call	__builtin_print
	addi	s9, s9, 1
	j		main_fake_show__for_cond_2

main_split_block_10:
	la		a0, __str_const_2
	call	__builtin_println
	j		main__while_cond_2

main_fake_merge__for_body:
	li		s9, 4
	mul		s9, s0, s9
	addi	s9, s9, 4
	add		s9, s9, s2
	lw		s9, 0(s9)
	li		s10, 0
	beq		s9, s10, main_split_block_9
	j		main_fake_merge__for_step

main_fake_merge__for_step:
	addi	s0, s0, 1
	j		main_fake_merge__for_cond_4

main_fake_merge__for_body_2:
	li		s0, 4
	mul		s0, s9, s0
	addi	s0, s0, 4
	add		s0, s0, s2
	lw		s0, 0(s0)
	li		s10, 0
	beq		s0, s10, main_fake_merge__if_then_2
	j		main_fake_merge__for_step_2

main_fake_merge__for_step_2:
	addi	s9, s9, 1
	j		main_fake_merge__for_cond_3

main_fake_merge__if_then_2:
	addi	s0, s9, 1
	j		main_fake_merge__for_cond_5

main_fake_merge__for_cond_5:
	blt		s0, s1, main_fake_merge__for_body_3
	j		main_fake_merge__for_step_2

main_fake_merge__for_body_3:
	li		s10, 4
	mul		s10, s0, s10
	addi	s10, s10, 4
	add		a1, s10, s2
	lw		a6, 0(a1)
	li		s10, 0
	bne		a6, s10, main_fake_merge_split_block
	j		main_fake_merge__for_step_3

main_fake_merge__for_step_3:
	addi	s0, s0, 1
	j		main_fake_merge__for_cond_5

main_fake_merge_split_block:
	li		s0, 4
	mul		s0, s9, s0
	addi	s0, s0, 4
	add		s0, s0, s2
	lw		s10, 0(s0)
	lw		a6, 0(a1)
	sw		a6, 0(s0)
	sw		s10, 0(a1)
	j		main_fake_merge__for_step_2

main_fake_move__for_body:
	li		s1, 4
	mul		s1, s9, s1
	addi	s1, s1, 4
	add		s10, s1, s2
	lw		s1, 0(s10)
	addi	s1, s1, -1
	sw		s1, 0(s10)
	addi	s9, s9, 1
	j		main_fake_move__for_cond

main__while_merge_2:
	mv		a0, s5
	call	__builtin_toString
	mv		a1, a0
	la		a0, __str_const_7
	call	__builtin_string_add
	la		a1, __str_const_8
	call	__builtin_string_add
	call	__builtin_println
	li		a0, 0
	j		main_exit

main_exit:
	lui		s5, %hi(R)
	sw		s4, %lo(R)(s5)
	lui		s4, %hi(now)
	sw		s0, %lo(now)(s4)
	lui		s4, %hi(n)
	li		s5, 210
	sw		s5, %lo(n)(s4)
	lui		s4, %hi(a)
	sw		s2, %lo(a)(s4)
	lui		s4, %hi(seed)
	sw		s6, %lo(seed)(s4)
	lui		s6, %hi(Q)
	sw		s11, %lo(Q)(s6)
	lui		s6, %hi(h)
	sw		s3, %lo(h)(s6)
	lw		s11, 20(sp)
	lw		s10, 24(sp)
	lw		s9, 28(sp)
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

main_fake_win__if_merge:
	li		s9, 0
	j		main_fake_win__for_cond

main_fake_win__for_cond:
	blt		s9, s0, main_fake_win__for_body
	j		main_fake_win__for_merge

main_fake_win__for_merge:
	li		s1, 0
	j		main_fake_win__for_cond_2

main_fake_win__for_cond_2:
	addi	s9, s0, -1
	blt		s1, s9, main_fake_win__for_body_3
	j		main_fake_win__for_merge_2

main_fake_win__for_body_3:
	addi	s9, s1, 1
	j		main_fake_win__for_cond_4

main_fake_win__for_cond_4:
	blt		s9, s0, main_fake_win__for_body_4
	j		main_fake_win__for_step_3

main_fake_win__for_step_3:
	addi	s1, s1, 1
	j		main_fake_win__for_cond_2

main_fake_win__for_body_4:
	li		s10, 4
	mul		s10, s1, s10
	addi	s10, s10, 4
	add		t6, s10, a0
	li		s10, 4
	mul		s10, s9, s10
	addi	s10, s10, 4
	add		a6, s10, a0
	lw		a1, 0(t6)
	lw		s10, 0(a6)
	bgt		a1, s10, main_fake_win__if_then_3
	j		main_fake_win__for_step_2

main_fake_win__if_then_3:
	lw		s10, 0(t6)
	lw		a1, 0(a6)
	sw		a1, 0(t6)
	sw		s10, 0(a6)
	j		main_fake_win__for_step_2

main_fake_win__for_step_2:
	addi	s9, s9, 1
	j		main_fake_win__for_cond_4

main_fake_win__for_merge_2:
	li		s9, 0
	j		main_fake_win__for_cond_3

main_fake_win__for_cond_3:
	blt		s9, s0, main_fake_win__for_body_2
	j		main_fake_win__for_merge_3

main_fake_win__for_body_2:
	li		s1, 4
	mul		s1, s9, s1
	addi	s1, s1, 4
	add		s1, s1, a0
	addi	s9, s9, 1
	lw		s1, 0(s1)
	bne		s1, s9, main_fake_win__if_then_2
	j		main_fake_win__for_cond_3

main_fake_win__if_then_2:
	li		s9, 0
	j		main_split_block_7

main_fake_win__for_merge_3:
	li		s9, 1
	j		main_split_block_7

main_fake_win__for_body:
	li		s1, 4
	mul		s1, s9, s1
	addi	s1, s1, 4
	add		s10, s1, a0
	add		s1, s1, s2
	lw		s1, 0(s1)
	sw		s1, 0(s10)
	addi	s9, s9, 1
	j		main_fake_win__for_cond

main_fake_merge__for_body_4:
	li		s9, 4
	mul		s9, s0, s9
	addi	s9, s9, 4
	add		s9, s9, s2
	lw		s1, 0(s9)
	li		s9, 0
	beq		s1, s9, main_split_block_6
	j		main_fake_merge__for_step_4

main_fake_merge__for_step_4:
	addi	s0, s0, 1
	j		main_fake_merge__for_cond_2

main_fake_merge__for_body_5:
	li		s0, 4
	mul		s0, s9, s0
	addi	s0, s0, 4
	add		s0, s0, s2
	lw		s1, 0(s0)
	li		s0, 0
	beq		s1, s0, main_fake_merge__if_then_4
	j		main_fake_merge__for_step_5

main_fake_merge__if_then_4:
	addi	s0, s9, 1
	j		main_fake_merge__for_cond_6

main_fake_merge__for_cond_6:
	blt		s0, s5, main_fake_merge__for_body_6
	j		main_fake_merge__for_step_5

main_fake_merge__for_body_6:
	li		s1, 4
	mul		s1, s0, s1
	addi	s1, s1, 4
	add		a6, s1, s2
	lw		s1, 0(a6)
	li		a1, 0
	bne		s1, a1, main_fake_merge_split_block_2
	j		main_fake_merge__for_step_6

main_fake_merge_split_block_2:
	li		s0, 4
	mul		s0, s9, s0
	addi	s0, s0, 4
	add		s0, s0, s2
	lw		s1, 0(s0)
	lw		a1, 0(a6)
	sw		a1, 0(s0)
	sw		s1, 0(a6)
	j		main_fake_merge__for_step_5

main_fake_merge__for_step_5:
	addi	s9, s9, 1
	j		main_fake_merge__for_cond

main_fake_merge__for_step_6:
	addi	s0, s0, 1
	j		main_fake_merge__for_cond_6

main__for_body:
	li		a6, 4
	mul		a6, a1, a6
	addi	a6, a6, 4
	add		t6, a6, s2
	rem		a6, s6, s11
	mul		a6, s9, a6
	div		s6, s6, s11
	mul		s6, s4, s6
	sub		s6, a6, s6
	li		a6, 0
	bge		s6, a6, main_split_block_3
	j		main_fake_random__if_else_2

main_split_block_3:
	li		a6, 10
	rem		a6, s6, a6
	addi	a6, a6, 1
	sw		a6, 0(t6)
	j		main__while_cond

main__while_cond:
	li		a6, 4
	mul		a6, a1, a6
	addi	a6, a6, 4
	add		t6, a6, s2
	lw		a6, 0(t6)
	add		a6, a6, s0
	li		a2, 210
	bgt		a6, a2, main__while_body
	j		main__while_merge

main__while_merge:
	lw		a6, 0(t6)
	add		s0, s0, a6
	addi	a1, a1, 1
	j		main__for_cond

main__while_body:
	rem		a6, s6, s11
	mul		a6, s9, a6
	div		s6, s6, s11
	mul		s6, s4, s6
	sub		s6, a6, s6
	li		a6, 0
	bge		s6, a6, main_split_block_4
	j		main_fake_random__if_else

main_fake_random__if_else:
	add		s6, s6, s1
	j		main_split_block_4

main_split_block_4:
	li		a6, 10
	rem		a6, s6, a6
	addi	a6, a6, 1
	sw		a6, 0(t6)
	j		main__while_cond

main_fake_random__if_else_2:
	add		s6, s6, s1
	j		main_split_block_3

main__if_then:
	la		a0, __str_const_3
	call	__builtin_println
	li		a0, 1
	mv		s0, s6
	lw		s6, 16(sp)
	j		main_exit

main_fake_pd__for_step:
	mv		s3, s5
	j		main_fake_pd__for_cond

main_fake_pd__for_merge:
	li		s5, 0
	j		main_split_block


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	lui		a6, %hi(M)
	li		a1, 2147483647
	sw		a1, %lo(M)(a6)
	lui		a6, %hi(seed)
	li		a1, 1
	sw		a1, %lo(seed)(a6)
	lui		a1, %hi(A)
	li		a6, 48271
	sw		a6, %lo(A)(a1)
	call	_main
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


