	.data

	.globl	c
c:
	.zero	4

	.globl	ans
ans:
	.zero	4

	.globl	visit
visit:
	.zero	4

	.globl	pre
pre:
	.zero	4

	.globl	f
f:
	.zero	4

	.globl	i
i:
	.zero	4

	.globl	j
j:
	.zero	4

	.globl	open
open:
	.zero	4

	.globl	closed
closed:
	.zero	4


	.text

	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -48
	sw		ra, 44(sp)
	sw		s0, 40(sp)
	sw		s3, 36(sp)
	sw		s4, 32(sp)
	sw		s5, 28(sp)
	sw		s6, 24(sp)
	sw		s7, 20(sp)
	sw		s8, 16(sp)
	sw		s9, 12(sp)
	sw		s11, 8(sp)
	lui		s11, %hi(j)
	lw		s7, %lo(j)(s11)
	lui		s11, %hi(f)
	lw		s3, %lo(f)(s11)
	lui		s11, %hi(visit)
	lw		s5, %lo(visit)(s11)
	lui		s11, %hi(pre)
	lw		s4, %lo(pre)(s11)
	lui		s11, %hi(ans)
	lw		s9, %lo(ans)(s11)
	li		a0, 444
	call	malloc
	mv		s6, a0
	li		s11, 110
	sw		s11, 0(s6)
	li		s11, 0
	j		main_fake_origin__for_cond

main_fake_origin__for_cond:
	li		s0, 110
	blt		s11, s0, main_fake_origin__for_body
	j		main_split_block

main_split_block:
	li		s11, 1
	j		main_fake_build__for_cond

main_fake_build__for_cond:
	li		s0, 49
	ble		s11, s0, main_fake_build__for_body_3
	j		main_fake_build__for_merge

main_fake_build__for_merge:
	li		s11, 1
	j		main_fake_build__for_cond_2

main_fake_build__for_cond_2:
	li		s0, 49
	ble		s11, s0, main_fake_build__for_body
	j		main_fake_build__for_merge_2

main_fake_build__for_body:
	li		s0, 99
	li		s8, 4
	mul		s0, s0, s8
	addi	s0, s0, 4
	add		s0, s0, s6
	lw		s0, 0(s0)
	li		s8, 4
	mul		s8, s11, s8
	addi	s8, s8, 4
	add		s0, s8, s0
	li		s8, 1
	sw		s8, 0(s0)
	addi	s11, s11, 1
	j		main_fake_build__for_cond_2

main_fake_build__for_merge_2:
	li		s11, 50
	j		main_fake_build__for_cond_3

main_fake_build__for_cond_3:
	li		s0, 98
	ble		s11, s0, main_fake_build__for_body_2
	j		main__while_cond

main__while_cond:
	li		s8, 0
	li		s11, 1
	li		s0, 1
	j		main_fake_find__for_cond

main_fake_find__for_cond:
	li		t2, 100
	ble		s0, t2, main_fake_find__for_body_2
	j		main_fake_find__for_merge

main_fake_find__for_merge:
	li		t2, 1
	li		a3, 4
	mul		t2, t2, a3
	addi	t2, t2, 4
	add		t2, t2, s3
	li		a3, 99
	sw		a3, 0(t2)
	li		t2, 99
	li		a3, 4
	mul		t2, t2, a3
	addi	a0, t2, 4
	add		a3, a0, s5
	li		t2, 1
	sw		t2, 0(a3)
	add		t2, a0, s4
	li		a3, 0
	sw		a3, 0(t2)
	li		t2, 0
	j		main_fake_find__while_cond

main_fake_find__while_cond:
	blt		s8, s11, main_fake_find__lhs_and_then
	j		main_split_block_3

main_fake_find__lhs_and_then:
	li		a3, 0
	beq		t2, a3, main_fake_find__while_body
	j		main_split_block_3

main_split_block_3:
	li		a3, 0
	bgt		t2, a3, main__while_body
	j		main__while_merge

main__while_merge:
	mv		a0, s9
	call	__builtin_toString
	call	__builtin_println
	lui		s4, %hi(ans)
	sw		s9, %lo(ans)(s4)
	lui		s4, %hi(closed)
	sw		s11, %lo(closed)(s4)
	lui		s11, %hi(i)
	sw		s0, %lo(i)(s11)
	lui		s11, %hi(c)
	sw		s6, %lo(c)(s11)
	lui		s11, %hi(j)
	sw		s7, %lo(j)(s11)
	lui		s11, %hi(open)
	sw		s8, %lo(open)(s11)
	li		a0, 0
	lw		s11, 8(sp)
	lw		s9, 12(sp)
	lw		s8, 16(sp)
	lw		s7, 20(sp)
	lw		s6, 24(sp)
	lw		s5, 28(sp)
	lw		s4, 32(sp)
	lw		s3, 36(sp)
	lw		s0, 40(sp)
	lw		ra, 44(sp)
	addi	sp, sp, 48
	jr		ra

main__while_body:
	li		s11, 100
	addi	s9, s9, 1
	j		main_fake_improve__while_cond

main_fake_improve__while_cond:
	li		s0, 4
	mul		s11, s11, s0
	addi	t2, s11, 4
	add		s8, t2, s4
	lw		s11, 0(s8)
	li		s0, 0
	bgt		s11, s0, main_fake_improve__while_body
	j		main__while_cond

main_fake_improve__while_body:
	lw		s11, 0(s8)
	mv		s7, s11
	li		s0, 4
	mul		s0, s11, s0
	addi	s8, s0, 4
	add		s0, s8, s6
	lw		s0, 0(s0)
	add		a3, t2, s0
	lw		s0, 0(a3)
	addi	s0, s0, -1
	sw		s0, 0(a3)
	add		s0, t2, s6
	lw		s0, 0(s0)
	add		s8, s8, s0
	lw		s0, 0(s8)
	addi	s0, s0, 1
	sw		s0, 0(s8)
	j		main_fake_improve__while_cond

main_fake_find__while_body:
	addi	s8, s8, 1
	li		s0, 4
	mul		s0, s8, s0
	addi	s0, s0, 4
	add		s0, s0, s3
	lw		s0, 0(s0)
	li		s7, 1
	j		main_fake_find__for_cond_2

main_fake_find__for_cond_2:
	li		a3, 100
	ble		s7, a3, main_fake_find__for_body
	j		main_fake_find__while_cond

main_fake_find__for_body:
	li		a3, 4
	mul		a3, s0, a3
	addi	a3, a3, 4
	add		a3, a3, s6
	lw		a0, 0(a3)
	li		a3, 4
	mul		a3, s7, a3
	addi	t5, a3, 4
	add		a3, t5, a0
	lw		a3, 0(a3)
	li		a0, 0
	bgt		a3, a0, main_fake_find__lhs_and_then_2
	j		main_fake_find__for_step

main_fake_find__for_step:
	addi	s7, s7, 1
	j		main_fake_find__for_cond_2

main_fake_find__lhs_and_then_2:
	add		a0, t5, s5
	lw		a3, 0(a0)
	li		ra, 0
	beq		a3, ra, main_fake_find__if_then
	j		main_fake_find__for_step

main_fake_find__if_then:
	li		a3, 1
	sw		a3, 0(a0)
	addi	s11, s11, 1
	li		a3, 4
	mul		a3, s11, a3
	addi	a3, a3, 4
	add		a3, a3, s3
	sw		s7, 0(a3)
	add		a3, t5, s4
	sw		s0, 0(a3)
	li		a3, 100
	beq		s11, a3, main_fake_find__if_then_2
	j		main_fake_find__for_step

main_fake_find__if_then_2:
	li		t2, 1
	j		main_fake_find__for_step

main_fake_find__for_body_2:
	li		t2, 4
	mul		t2, s0, t2
	addi	t2, t2, 4
	add		a3, t2, s5
	li		t2, 0
	sw		t2, 0(a3)
	addi	s0, s0, 1
	j		main_fake_find__for_cond

main_fake_build__for_body_2:
	li		s0, 4
	mul		s0, s11, s0
	addi	s0, s0, 4
	add		s0, s0, s6
	lw		s8, 0(s0)
	li		t2, 100
	li		s0, 4
	mul		s0, t2, s0
	addi	s0, s0, 4
	add		s8, s0, s8
	li		s0, 1
	sw		s0, 0(s8)
	addi	s11, s11, 1
	j		main_fake_build__for_cond_3

main_fake_build__for_body_3:
	li		s7, 50
	j		main_fake_build__for_cond_4

main_fake_build__for_cond_4:
	li		s0, 98
	sub		s0, s0, s11
	addi	s0, s0, 1
	ble		s7, s0, main_fake_build__for_body_4
	j		main_fake_build__for_step

main_fake_build__for_step:
	addi	s11, s11, 1
	j		main_fake_build__for_cond

main_fake_build__for_body_4:
	li		s0, 4
	mul		s0, s11, s0
	addi	s0, s0, 4
	add		s0, s0, s6
	lw		s0, 0(s0)
	li		s8, 4
	mul		s8, s7, s8
	addi	s8, s8, 4
	add		s0, s8, s0
	li		s8, 1
	sw		s8, 0(s0)
	addi	s7, s7, 1
	j		main_fake_build__for_cond_4

main_fake_origin__for_body:
	li		s0, 4
	mul		s0, s11, s0
	addi	s0, s0, 4
	add		s0, s0, s6
	li		s8, 110
	li		s7, 4
	mul		s8, s8, s7
	addi	a0, s8, 4
	call	malloc
	li		s8, 110
	sw		s8, 0(a0)
	sw		a0, 0(s0)
	li		s7, 0
	j		main_fake_origin__for_cond_2

main_fake_origin__for_cond_2:
	li		s0, 110
	blt		s7, s0, main_fake_origin__for_body_2
	j		main_fake_origin__for_step

main_fake_origin__for_step:
	addi	s11, s11, 1
	j		main_fake_origin__for_cond

main_fake_origin__for_body_2:
	li		s0, 4
	mul		s0, s11, s0
	addi	s0, s0, 4
	add		s0, s0, s6
	lw		s8, 0(s0)
	li		s0, 4
	mul		s0, s7, s0
	addi	s0, s0, 4
	add		s8, s0, s8
	li		s0, 0
	sw		s0, 0(s8)
	addi	s7, s7, 1
	j		main_fake_origin__for_cond_2


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s1, 8(sp)
	sw		s8, 4(sp)
	li		a0, 444
	call	malloc
	mv		s8, a0
	li		s1, 110
	sw		s1, 0(s8)
	li		a0, 444
	call	malloc
	mv		s1, a0
	li		t2, 110
	sw		t2, 0(s1)
	li		a0, 444
	call	malloc
	li		t2, 110
	sw		t2, 0(a0)
	lui		t2, %hi(ans)
	li		a3, 0
	sw		a3, %lo(ans)(t2)
	lui		t2, %hi(pre)
	sw		s1, %lo(pre)(t2)
	lui		s1, %hi(visit)
	sw		s8, %lo(visit)(s1)
	lui		s8, %hi(f)
	sw		a0, %lo(f)(s8)
	call	_main
	lw		s8, 4(sp)
	lw		s1, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


