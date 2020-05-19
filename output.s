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

	.globl	random
	.p2align	2
	.type	random, @function
random:
	lui		a3, %hi(Q)
	lw		a6, %lo(Q)(a3)
	lui		a3, %hi(R)
	lw		t5, %lo(R)(a3)
	lui		a3, %hi(seed)
	lw		t3, %lo(seed)(a3)
	lui		a3, %hi(A)
	lw		a1, %lo(A)(a3)
	lui		a3, %hi(M)
	lw		a3, %lo(M)(a3)
	rem		a0, t3, a6
	mul		a1, a1, a0
	div		a6, t3, a6
	mul		a6, t5, a6
	sub		a0, a1, a6
	li		a6, 0
	bge		a0, a6, random__if_then
	j		random__if_else

random__if_else:
	add		a0, a0, a3
	j		random__if_merge

random__if_merge:
	lui		a3, %hi(seed)
	sw		a0, %lo(seed)(a3)
	jr		ra

random__if_then:
	j		random__if_merge


	.globl	initialize
	.p2align	2
	.type	initialize, @function
initialize:
	lui		a3, %hi(seed)
	sw		a0, %lo(seed)(a3)
	jr		ra


	.globl	swap
	.p2align	2
	.type	swap, @function
swap:
	lui		a3, %hi(a)
	lw		t5, %lo(a)(a3)
	li		a3, 4
	mul		a3, a0, a3
	addi	a3, a3, 4
	add		a6, a3, t5
	lw		t3, 0(a6)
	li		a3, 4
	mul		a3, a1, a3
	addi	a3, a3, 4
	add		a3, a3, t5
	lw		t5, 0(a3)
	sw		t5, 0(a6)
	sw		t3, 0(a3)
	jr		ra


	.globl	pd
	.p2align	2
	.type	pd, @function
pd:
	lui		a3, %hi(h)
	lw		a3, %lo(h)(a3)
	j		pd__for_cond

pd__for_cond:
	ble		a3, a0, pd__for_body
	j		pd__for_merge

pd__for_body:
	addi	a6, a3, 1
	mul		t5, a3, a6
	li		t3, 2
	div		t3, t5, t3
	beq		a0, t3, pd__if_then
	j		pd__for_step

pd__for_step:
	mv		a3, a6
	j		pd__for_cond

pd__if_then:
	li		a0, 1
	j		pd_exit

pd_exit:
	lui		a6, %hi(h)
	sw		a3, %lo(h)(a6)
	jr		ra

pd__for_merge:
	li		a0, 0
	j		pd_exit


	.globl	show
	.p2align	2
	.type	show, @function
show:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s3, 8(sp)
	sw		s5, 4(sp)
	lui		s5, %hi(a)
	lw		s3, %lo(a)(s5)
	lui		s5, %hi(now)
	lw		s5, %lo(now)(s5)
	sw		s5, 0(sp)
	li		s5, 0
	j		show__for_cond

show__for_cond:
	lw		a3, 0(sp)
	blt		s5, a3, show__for_body
	j		show__for_merge

show__for_body:
	li		a3, 4
	mul		a3, s5, a3
	addi	a3, a3, 4
	add		a3, a3, s3
	lw		a0, 0(a3)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	call	__builtin_print
	j		show__for_step

show__for_step:
	addi	s5, s5, 1
	j		show__for_cond

show__for_merge:
	la		a0, __str_const_2
	call	__builtin_println
	lw		s5, 4(sp)
	lw		s3, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


	.globl	win
	.p2align	2
	.type	win, @function
win:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s1, 8(sp)
	sw		s3, 4(sp)
	lui		s1, %hi(h)
	lw		s1, %lo(h)(s1)
	sw		s1, 0(sp)
	lui		s1, %hi(a)
	lw		s3, %lo(a)(s1)
	lui		s1, %hi(now)
	lw		s1, %lo(now)(s1)
	li		a0, 404
	call	malloc
	li		a3, 100
	sw		a3, 0(a0)
	lw		a3, 0(sp)
	bne		s1, a3, win__if_then
	j		win__if_merge

win__if_then:
	li		a0, 0
	j		win_exit

win_exit:
	lw		s3, 4(sp)
	lw		s1, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

win__if_merge:
	li		a3, 0
	j		win__for_cond

win__for_cond:
	blt		a3, s1, win__for_body
	j		win__for_merge

win__for_body:
	li		a6, 4
	mul		a6, a3, a6
	addi	a6, a6, 4
	add		t3, a6, a0
	add		a6, a6, s3
	lw		a6, 0(a6)
	sw		a6, 0(t3)
	j		win__for_step

win__for_step:
	addi	a3, a3, 1
	j		win__for_cond

win__for_merge:
	li		a3, 0
	j		win__for_cond_2

win__for_cond_2:
	addi	s3, s1, -1
	blt		a3, s3, win__for_body_2
	j		win__for_merge_2

win__for_body_2:
	addi	s3, a3, 1
	j		win__for_cond_3

win__for_cond_3:
	blt		s3, s1, win__for_body_3
	j		win__for_step_3

win__for_body_3:
	li		a6, 4
	mul		a6, a3, a6
	addi	a6, a6, 4
	add		t5, a6, a0
	li		a6, 4
	mul		a6, s3, a6
	addi	a6, a6, 4
	add		a1, a6, a0
	lw		a6, 0(t5)
	lw		t3, 0(a1)
	bgt		a6, t3, win__if_then_2
	j		win__for_step_2

win__for_step_2:
	addi	s3, s3, 1
	j		win__for_cond_3

win__if_then_2:
	lw		a6, 0(t5)
	lw		t3, 0(a1)
	sw		t3, 0(t5)
	sw		a6, 0(a1)
	j		win__for_step_2

win__for_step_3:
	addi	a3, a3, 1
	j		win__for_cond_2

win__for_merge_2:
	li		s3, 0
	j		win__for_cond_4

win__for_cond_4:
	blt		s3, s1, win__for_body_4
	j		win__for_merge_3

win__for_body_4:
	li		a3, 4
	mul		a3, s3, a3
	addi	a3, a3, 4
	add		a3, a3, a0
	addi	s3, s3, 1
	lw		a3, 0(a3)
	bne		a3, s3, win__if_then_3
	j		win__for_step_4

win__for_step_4:
	j		win__for_cond_4

win__if_then_3:
	li		a0, 0
	j		win_exit

win__for_merge_3:
	li		a0, 1
	j		win_exit


	.globl	merge
	.p2align	2
	.type	merge, @function
merge:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s3, 8(sp)
	sw		s4, 4(sp)
	sw		s7, 0(sp)
	lui		s7, %hi(a)
	lw		s4, %lo(a)(s7)
	lui		s7, %hi(now)
	lw		s3, %lo(now)(s7)
	li		s7, 0
	j		merge__for_cond

merge__for_cond:
	blt		s7, s3, merge__for_body_2
	j		merge__for_merge

merge__for_merge:
	li		s7, 0
	j		merge__for_cond_2

merge__for_cond_2:
	blt		s7, s3, merge__for_body
	j		merge__parallel_copy_

merge__for_body:
	li		a3, 4
	mul		a3, s7, a3
	addi	a3, a3, 4
	add		a3, a3, s4
	lw		a6, 0(a3)
	li		a3, 0
	beq		a6, a3, merge__if_then
	j		merge__for_step

merge__for_step:
	addi	s7, s7, 1
	j		merge__for_cond_2

merge__if_then:
	j		merge__for_merge_2

merge__for_merge_2:
	lui		s4, %hi(now)
	sw		s7, %lo(now)(s4)
	lw		s7, 0(sp)
	lw		s4, 4(sp)
	lw		s3, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

merge__parallel_copy_:
	mv		s7, s3
	j		merge__for_merge_2

merge__for_body_2:
	li		a3, 4
	mul		a3, s7, a3
	addi	a3, a3, 4
	add		a3, a3, s4
	lw		a6, 0(a3)
	li		a3, 0
	beq		a6, a3, merge__if_then_2
	j		merge__for_step_3

merge__if_then_2:
	addi	a1, s7, 1
	j		merge__for_cond_3

merge__for_cond_3:
	blt		a1, s3, merge__for_body_3
	j		merge__for_step_3

merge__for_body_3:
	li		a3, 4
	mul		a3, a1, a3
	addi	a3, a3, 4
	add		a3, a3, s4
	lw		a6, 0(a3)
	li		a3, 0
	bne		a6, a3, merge__if_then_3
	j		merge__for_step_2

merge__for_step_2:
	addi	a1, a1, 1
	j		merge__for_cond_3

merge__if_then_3:
	mv		a0, s7
	call	swap
	j		merge__for_step_3

merge__for_step_3:
	addi	s7, s7, 1
	j		merge__for_cond


	.globl	move
	.p2align	2
	.type	move, @function
move:
	lui		a3, %hi(a)
	lw		a1, %lo(a)(a3)
	lui		a3, %hi(now)
	lw		t3, %lo(now)(a3)
	li		a3, 0
	j		move__for_cond

move__for_cond:
	blt		a3, t3, move__for_body
	j		move__for_merge

move__for_body:
	li		a6, 4
	mul		a6, a3, a6
	addi	a6, a6, 4
	add		t5, a6, a1
	lw		a6, 0(t5)
	addi	a6, a6, -1
	sw		a6, 0(t5)
	addi	a3, a3, 1
	j		move__for_cond

move__for_merge:
	li		a3, 4
	mul		a3, t3, a3
	addi	a3, a3, 4
	add		a3, a3, a1
	sw		t3, 0(a3)
	addi	a6, t3, 1
	lui		a3, %hi(now)
	sw		a6, %lo(now)(a3)
	jr		ra


	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -48
	sw		ra, 44(sp)
	sw		s1, 40(sp)
	sw		s3, 36(sp)
	sw		s4, 32(sp)
	sw		s5, 28(sp)
	sw		s7, 24(sp)
	sw		s8, 20(sp)
	sw		s9, 16(sp)
	sw		s10, 12(sp)
	sw		s11, 8(sp)
	lui		s8, %hi(A)
	lw		s4, %lo(A)(s8)
	lui		s8, %hi(M)
	lw		s11, %lo(M)(s8)
	lui		s8, %hi(now)
	lw		s5, %lo(now)(s8)
	li		s8, 0
	sw		s8, 4(sp)
	li		s8, 0
	li		s7, 0
	li		a0, 404
	call	malloc
	mv		s3, a0
	li		s9, 100
	sw		s9, 0(s3)
	div		s9, s11, s4
	rem		s10, s11, s4
	lui		s4, %hi(h)
	li		s11, 0
	sw		s11, %lo(h)(s4)
	li		a0, 210
	call	pd
	lui		s4, %hi(h)
	lw		s4, %lo(h)(s4)
	bne		a0, zero, main__if_merge
	j		main__if_then

main__if_then:
	la		a0, __str_const_3
	call	__builtin_println
	li		a0, 1
	j		main_exit

main_exit:
	lui		s7, %hi(n)
	li		s8, 210
	sw		s8, %lo(n)(s7)
	lui		s8, %hi(now)
	sw		s5, %lo(now)(s8)
	lui		s8, %hi(a)
	sw		s3, %lo(a)(s8)
	lui		s8, %hi(R)
	sw		s10, %lo(R)(s8)
	lui		s8, %hi(h)
	sw		s4, %lo(h)(s8)
	lui		s8, %hi(Q)
	sw		s9, %lo(Q)(s8)
	lw		s11, 8(sp)
	lw		s10, 12(sp)
	lw		s9, 16(sp)
	lw		s8, 20(sp)
	lw		s7, 24(sp)
	lw		s5, 28(sp)
	lw		s4, 32(sp)
	lw		s3, 36(sp)
	lw		s1, 40(sp)
	lw		ra, 44(sp)
	addi	sp, sp, 48
	jr		ra

main__if_merge:
	la		a0, __str_const_4
	call	__builtin_println
	li		a0, 3654898
	call	initialize
	lui		s5, %hi(R)
	sw		s10, %lo(R)(s5)
	lui		s5, %hi(Q)
	sw		s9, %lo(Q)(s5)
	call	random
	li		s5, 10
	rem		s5, a0, s5
	addi	s11, s5, 1
	mv		a0, s11
	call	__builtin_toString
	call	__builtin_println
	mv		s1, s8
	lw		s8, 4(sp)
	j		main__for_cond

main__for_cond:
	addi	s5, s11, -1
	blt		s8, s5, main__for_body
	j		main__for_merge

main__for_body:
	li		s5, 4
	mul		s5, s8, s5
	addi	s5, s5, 4
	add		s5, s5, s3
	lui		a3, %hi(R)
	sw		s10, %lo(R)(a3)
	lui		a3, %hi(Q)
	sw		s9, %lo(Q)(a3)
	call	random
	li		a3, 10
	rem		a3, a0, a3
	addi	a3, a3, 1
	sw		a3, 0(s5)
	j		main__while_cond

main__while_cond:
	li		s5, 4
	mul		s5, s8, s5
	addi	s5, s5, 4
	add		s5, s5, s3
	lw		a3, 0(s5)
	add		a6, a3, s1
	li		a3, 210
	bgt		a6, a3, main__while_body
	j		main__while_merge

main__while_body:
	lui		a3, %hi(R)
	sw		s10, %lo(R)(a3)
	lui		a3, %hi(Q)
	sw		s9, %lo(Q)(a3)
	call	random
	li		a3, 10
	rem		a3, a0, a3
	addi	a3, a3, 1
	sw		a3, 0(s5)
	j		main__while_cond

main__while_merge:
	lw		s5, 0(s5)
	add		s5, s1, s5
	j		main__for_step

main__for_step:
	addi	s8, s8, 1
	mv		s1, s5
	j		main__for_cond

main__for_merge:
	li		s8, 4
	mul		s8, s5, s8
	addi	s8, s8, 4
	add		s5, s8, s3
	li		s8, 210
	sub		s8, s8, s1
	sw		s8, 0(s5)
	lui		s8, %hi(now)
	sw		s11, %lo(now)(s8)
	lui		s8, %hi(a)
	sw		s3, %lo(a)(s8)
	call	show
	lui		s8, %hi(now)
	sw		s11, %lo(now)(s8)
	lui		s8, %hi(a)
	sw		s3, %lo(a)(s8)
	call	merge
	lui		s8, %hi(now)
	lw		s5, %lo(now)(s8)
	mv		s8, s7
	j		main__while_cond_2

main__while_cond_2:
	lui		s7, %hi(now)
	sw		s5, %lo(now)(s7)
	lui		s7, %hi(a)
	sw		s3, %lo(a)(s7)
	lui		s7, %hi(h)
	sw		s4, %lo(h)(s7)
	call	win
	bne		a0, zero, main__while_merge_2
	j		main__while_body_2

main__while_body_2:
	addi	s8, s8, 1
	mv		a0, s8
	call	__builtin_toString
	mv		a1, a0
	la		a0, __str_const_5
	call	__builtin_string_add
	la		a1, __str_const_6
	call	__builtin_string_add
	call	__builtin_println
	lui		s7, %hi(now)
	sw		s5, %lo(now)(s7)
	lui		s7, %hi(a)
	sw		s3, %lo(a)(s7)
	call	move
	lui		s7, %hi(now)
	lw		s7, %lo(now)(s7)
	lui		s5, %hi(now)
	sw		s7, %lo(now)(s5)
	lui		s7, %hi(a)
	sw		s3, %lo(a)(s7)
	call	merge
	lui		s7, %hi(now)
	lw		s5, %lo(now)(s7)
	lui		s7, %hi(now)
	sw		s5, %lo(now)(s7)
	lui		s7, %hi(a)
	sw		s3, %lo(a)(s7)
	call	show
	j		main__while_cond_2

main__while_merge_2:
	mv		a0, s8
	call	__builtin_toString
	mv		a1, a0
	la		a0, __str_const_7
	call	__builtin_string_add
	la		a1, __str_const_8
	call	__builtin_string_add
	call	__builtin_println
	li		a0, 0
	j		main_exit


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	lui		a3, %hi(M)
	li		a6, 2147483647
	sw		a6, %lo(M)(a3)
	lui		a3, %hi(A)
	li		a6, 48271
	sw		a6, %lo(A)(a3)
	lui		a6, %hi(seed)
	li		a3, 1
	sw		a3, %lo(seed)(a6)
	call	_main
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


