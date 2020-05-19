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
	bge		a0, a6, random__if_merge
	j		random__if_else

random__if_else:
	add		a0, a0, a3
	j		random__if_merge

random__if_merge:
	lui		a3, %hi(seed)
	sw		a0, %lo(seed)(a3)
	jr		ra


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

pd__if_then:
	li		a0, 1
	j		pd_exit

pd_exit:
	lui		a6, %hi(h)
	sw		a3, %lo(h)(a6)
	jr		ra

pd__for_step:
	mv		a3, a6
	j		pd__for_cond

pd__for_merge:
	li		a0, 0
	j		pd_exit


	.globl	show
	.p2align	2
	.type	show, @function
show:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s5, 8(sp)
	lui		s5, %hi(a)
	lw		s5, %lo(a)(s5)
	sw		s5, 4(sp)
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
	lw		a6, 4(sp)
	add		a3, a3, a6
	lw		a0, 0(a3)
	call	__builtin_toString
	la		a1, __str_const_1
	call	__builtin_string_add
	call	__builtin_print
	addi	s5, s5, 1
	j		show__for_cond

show__for_merge:
	la		a0, __str_const_2
	call	__builtin_println
	lw		s5, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


	.globl	win
	.p2align	2
	.type	win, @function
win:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s2, 8(sp)
	sw		s4, 4(sp)
	sw		s11, 0(sp)
	lui		s4, %hi(h)
	lw		s4, %lo(h)(s4)
	lui		s11, %hi(a)
	lw		s2, %lo(a)(s11)
	lui		s11, %hi(now)
	lw		s11, %lo(now)(s11)
	li		a0, 404
	call	malloc
	li		a3, 100
	sw		a3, 0(a0)
	bne		s11, s4, win__if_then
	j		win__if_merge

win__if_merge:
	li		s4, 0
	j		win__for_cond

win__for_cond:
	blt		s4, s11, win__for_body
	j		win__for_merge

win__for_merge:
	li		s2, 0
	j		win__for_cond_2

win__for_cond_2:
	addi	s4, s11, -1
	blt		s2, s4, win__for_body_2
	j		win__for_merge_2

win__for_body_2:
	addi	s4, s2, 1
	j		win__for_cond_3

win__for_cond_3:
	blt		s4, s11, win__for_body_3
	j		win__for_step_2

win__for_body_3:
	li		a3, 4
	mul		a3, s2, a3
	addi	a3, a3, 4
	add		a6, a3, a0
	li		a3, 4
	mul		a3, s4, a3
	addi	a3, a3, 4
	add		t3, a3, a0
	lw		t5, 0(a6)
	lw		a3, 0(t3)
	bgt		t5, a3, win__if_then_2
	j		win__for_step

win__if_then_2:
	lw		t5, 0(a6)
	lw		a3, 0(t3)
	sw		a3, 0(a6)
	sw		t5, 0(t3)
	j		win__for_step

win__for_step:
	addi	s4, s4, 1
	j		win__for_cond_3

win__for_step_2:
	addi	s2, s2, 1
	j		win__for_cond_2

win__for_merge_2:
	li		s4, 0
	j		win__for_cond_4

win__for_cond_4:
	blt		s4, s11, win__for_body_4
	j		win__for_merge_3

win__for_body_4:
	li		s2, 4
	mul		s2, s4, s2
	addi	s2, s2, 4
	add		s2, s2, a0
	addi	s4, s4, 1
	lw		s2, 0(s2)
	bne		s2, s4, win__if_then_3
	j		win__for_cond_4

win__if_then_3:
	li		a0, 0
	j		win_exit

win_exit:
	lw		s11, 0(sp)
	lw		s4, 4(sp)
	lw		s2, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

win__for_merge_3:
	li		a0, 1
	j		win_exit

win__for_body:
	li		a3, 4
	mul		a3, s4, a3
	addi	a3, a3, 4
	add		a6, a3, a0
	add		a3, a3, s2
	lw		a3, 0(a3)
	sw		a3, 0(a6)
	addi	s4, s4, 1
	j		win__for_cond

win__if_then:
	li		a0, 0
	j		win_exit


	.globl	merge
	.p2align	2
	.type	merge, @function
merge:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s1, 8(sp)
	sw		s6, 4(sp)
	sw		s9, 0(sp)
	lui		s9, %hi(a)
	lw		s1, %lo(a)(s9)
	lui		s9, %hi(now)
	lw		s9, %lo(now)(s9)
	li		s6, 0
	j		merge__for_cond

merge__for_cond:
	blt		s6, s9, merge__for_body_2
	j		merge__for_merge

merge__for_body_2:
	li		a3, 4
	mul		a3, s6, a3
	addi	a3, a3, 4
	add		a3, a3, s1
	lw		a3, 0(a3)
	li		a6, 0
	beq		a3, a6, merge__if_then_2
	j		merge__for_step_3

merge__for_step_3:
	addi	s6, s6, 1
	j		merge__for_cond

merge__if_then_2:
	addi	a1, s6, 1
	j		merge__for_cond_3

merge__for_cond_3:
	blt		a1, s9, merge__for_body_3
	j		merge__for_step_3

merge__for_body_3:
	li		a3, 4
	mul		a3, a1, a3
	addi	a3, a3, 4
	add		a3, a3, s1
	lw		a3, 0(a3)
	li		a6, 0
	bne		a3, a6, merge__if_then_3
	j		merge__for_step_2

merge__if_then_3:
	mv		a0, s6
	call	swap
	j		merge__for_step_3

merge__for_step_2:
	addi	a1, a1, 1
	j		merge__for_cond_3

merge__for_merge:
	li		s6, 0
	j		merge__for_cond_2

merge__for_cond_2:
	blt		s6, s9, merge__for_body
	j		merge__for_merge_2

merge__for_merge_2:
	lui		s6, %hi(now)
	sw		s9, %lo(now)(s6)
	lw		s9, 0(sp)
	lw		s6, 4(sp)
	lw		s1, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

merge__for_body:
	li		a3, 4
	mul		a3, s6, a3
	addi	a3, a3, 4
	add		a3, a3, s1
	lw		a3, 0(a3)
	li		a6, 0
	beq		a3, a6, merge__if_then
	j		merge__for_step

merge__if_then:
	mv		s9, s6
	j		merge__for_merge_2

merge__for_step:
	addi	s6, s6, 1
	j		merge__for_cond_2


	.globl	move
	.p2align	2
	.type	move, @function
move:
	lui		a3, %hi(a)
	lw		t3, %lo(a)(a3)
	lui		a3, %hi(now)
	lw		t5, %lo(now)(a3)
	li		a3, 0
	j		move__for_cond

move__for_cond:
	blt		a3, t5, move__for_body
	j		move__for_merge

move__for_merge:
	li		a3, 4
	mul		a3, t5, a3
	addi	a3, a3, 4
	add		a3, a3, t3
	sw		t5, 0(a3)
	addi	a6, t5, 1
	lui		a3, %hi(now)
	sw		a6, %lo(now)(a3)
	jr		ra

move__for_body:
	li		a6, 4
	mul		a6, a3, a6
	addi	a6, a6, 4
	add		a1, a6, t3
	lw		a6, 0(a1)
	addi	a6, a6, -1
	sw		a6, 0(a1)
	addi	a3, a3, 1
	j		move__for_cond


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
	sw		s6, 24(sp)
	sw		s7, 20(sp)
	sw		s9, 16(sp)
	sw		s10, 12(sp)
	mv		s10, s11
	lui		s7, %hi(A)
	lw		s6, %lo(A)(s7)
	lui		s7, %hi(M)
	lw		s9, %lo(M)(s7)
	lui		s7, %hi(now)
	lw		s5, %lo(now)(s7)
	li		s4, 0
	li		s7, 0
	sw		s7, 8(sp)
	li		s7, 0
	sw		s7, 4(sp)
	li		a0, 404
	call	malloc
	mv		s7, a0
	li		s11, 100
	sw		s11, 0(s7)
	div		s11, s9, s6
	rem		s9, s9, s6
	lui		s6, %hi(h)
	li		s1, 0
	sw		s1, %lo(h)(s6)
	li		a0, 210
	call	pd
	lui		s6, %hi(h)
	lw		s1, %lo(h)(s6)
	bne		a0, zero, main__if_merge
	j		main__if_then

main__if_then:
	la		a0, __str_const_3
	call	__builtin_println
	li		a0, 1
	j		main_exit

main_exit:
	lui		s6, %hi(n)
	li		s4, 210
	sw		s4, %lo(n)(s6)
	lui		s4, %hi(now)
	sw		s5, %lo(now)(s4)
	lui		s4, %hi(a)
	sw		s7, %lo(a)(s4)
	lui		s7, %hi(R)
	sw		s9, %lo(R)(s7)
	lui		s7, %hi(h)
	sw		s1, %lo(h)(s7)
	lui		s7, %hi(Q)
	sw		s11, %lo(Q)(s7)
	mv		s11, s10
	lw		s10, 12(sp)
	lw		s9, 16(sp)
	lw		s7, 20(sp)
	lw		s6, 24(sp)
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
	sw		s9, %lo(R)(s5)
	lui		s5, %hi(Q)
	sw		s11, %lo(Q)(s5)
	call	random
	li		s5, 10
	rem		s5, a0, s5
	addi	s3, s5, 1
	mv		a0, s3
	call	__builtin_toString
	call	__builtin_println
	lw		s5, 8(sp)
	mv		s6, s4
	j		main__for_cond

main__for_cond:
	addi	s4, s3, -1
	blt		s6, s4, main__for_body
	j		main__for_merge

main__for_body:
	li		s4, 4
	mul		s4, s6, s4
	addi	s4, s4, 4
	add		s4, s4, s7
	lui		a3, %hi(R)
	sw		s9, %lo(R)(a3)
	lui		a3, %hi(Q)
	sw		s11, %lo(Q)(a3)
	call	random
	li		a3, 10
	rem		a3, a0, a3
	addi	a3, a3, 1
	sw		a3, 0(s4)
	j		main__while_cond

main__while_cond:
	li		s4, 4
	mul		s4, s6, s4
	addi	s4, s4, 4
	add		s4, s4, s7
	lw		a3, 0(s4)
	add		a6, a3, s5
	li		a3, 210
	bgt		a6, a3, main__while_body
	j		main__while_merge

main__while_body:
	lui		a3, %hi(R)
	sw		s9, %lo(R)(a3)
	lui		a3, %hi(Q)
	sw		s11, %lo(Q)(a3)
	call	random
	li		a3, 10
	rem		a3, a0, a3
	addi	a3, a3, 1
	sw		a3, 0(s4)
	j		main__while_cond

main__while_merge:
	lw		s4, 0(s4)
	add		s4, s5, s4
	addi	s6, s6, 1
	mv		s5, s4
	j		main__for_cond

main__for_merge:
	li		s6, 4
	mul		s4, s4, s6
	addi	s4, s4, 4
	add		s4, s4, s7
	li		s6, 210
	sub		s5, s6, s5
	sw		s5, 0(s4)
	lui		s4, %hi(now)
	sw		s3, %lo(now)(s4)
	lui		s4, %hi(a)
	sw		s7, %lo(a)(s4)
	call	show
	lui		s4, %hi(now)
	sw		s3, %lo(now)(s4)
	lui		s4, %hi(a)
	sw		s7, %lo(a)(s4)
	call	merge
	lui		s4, %hi(now)
	lw		s5, %lo(now)(s4)
	lw		s4, 4(sp)
	j		main__while_cond_2

main__while_cond_2:
	lui		s6, %hi(now)
	sw		s5, %lo(now)(s6)
	lui		s6, %hi(a)
	sw		s7, %lo(a)(s6)
	lui		s6, %hi(h)
	sw		s1, %lo(h)(s6)
	call	win
	bne		a0, zero, main__while_merge_2
	j		main__while_body_2

main__while_body_2:
	addi	s4, s4, 1
	mv		a0, s4
	call	__builtin_toString
	mv		a1, a0
	la		a0, __str_const_5
	call	__builtin_string_add
	la		a1, __str_const_6
	call	__builtin_string_add
	call	__builtin_println
	lui		s6, %hi(now)
	sw		s5, %lo(now)(s6)
	lui		s5, %hi(a)
	sw		s7, %lo(a)(s5)
	call	move
	lui		s5, %hi(now)
	lw		s6, %lo(now)(s5)
	lui		s5, %hi(now)
	sw		s6, %lo(now)(s5)
	lui		s5, %hi(a)
	sw		s7, %lo(a)(s5)
	call	merge
	lui		s5, %hi(now)
	lw		s5, %lo(now)(s5)
	lui		s6, %hi(now)
	sw		s5, %lo(now)(s6)
	lui		s6, %hi(a)
	sw		s7, %lo(a)(s6)
	call	show
	j		main__while_cond_2

main__while_merge_2:
	mv		a0, s4
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
	lui		a6, %hi(M)
	li		a3, 2147483647
	sw		a3, %lo(M)(a6)
	lui		a6, %hi(A)
	li		a3, 48271
	sw		a3, %lo(A)(a6)
	lui		a3, %hi(seed)
	li		a6, 1
	sw		a6, %lo(seed)(a3)
	call	_main
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


