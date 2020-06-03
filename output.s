	.data

	.globl	__str_const_1
__str_const_1:
	.string	""

	.globl	__str_const_2
__str_const_2:
	.string	""

	.globl	__str_const_3
__str_const_3:
	.string	"nChunk > MAXCHUNK!"

	.globl	__str_const_4
__str_const_4:
	.string	""

	.globl	__str_const_5
__str_const_5:
	.string	"Invalid input"

	.globl	__str_const_6
__str_const_6:
	.string	""

	.globl	__str_const_7
__str_const_7:
	.string	"Not Found!"

	.globl	__str_const_8
__str_const_8:
	.string	""

	.globl	__str_const_9
__str_const_9:
	.string	" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"

	.globl	asciiTable
asciiTable:
	.zero	4

	.globl	MAXCHUNK
MAXCHUNK:
	.zero	4

	.globl	MAXLENGTH
MAXLENGTH:
	.zero	4

	.globl	chunks
chunks:
	.zero	4

	.globl	inputBuffer
inputBuffer:
	.zero	4

	.globl	outputBuffer
outputBuffer:
	.zero	4


	.text

	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -320
	sw		ra, 316(sp)
	sw		s0, 312(sp)
	sw		s1, 308(sp)
	sw		s2, 304(sp)
	sw		s3, 300(sp)
	sw		s4, 296(sp)
	sw		s5, 292(sp)
	sw		s6, 288(sp)
	sw		s7, 284(sp)
	sw		s8, 280(sp)
	sw		s9, 276(sp)
	sw		s10, 272(sp)
	sw		s11, 268(sp)
	li		a0, 404
	call	malloc
	mv		s7, a0
	li		s8, 100
	sw		s8, 0(s7)
	addi	s8, s7, 4
	addi	s9, s7, 404
	j		_init___array_loop_cond

_init___array_loop_cond:
	blt		s8, s9, _init___array_loop_body
	j		_init___array_loop_merge

_init___array_loop_merge:
	li		a0, 25284
	call	malloc
	mv		s9, a0
	li		s8, 6320
	sw		s8, 0(s9)
	li		a0, 24
	call	malloc
	li		s8, 5
	sw		s8, 0(a0)
	li		s8, 0
	sw		s8, 264(sp)
	li		s8, 0
	sw		s8, 260(sp)
	li		s8, 0
	sw		s8, 256(sp)
	li		s8, 1
	sw		s8, 252(sp)
	li		s8, 0
	sw		s8, 248(sp)
	li		s8, -1
	sw		s8, 244(sp)
	li		s8, 97
	sw		s8, 240(sp)
	li		s8, 65
	sw		s8, 236(sp)
	li		s11, 1518500249
	li		s0, -899497514
	li		s6, 1859775393
	li		s2, -1894007588
	li		s8, 1732584193
	sw		s8, 232(sp)
	li		s8, 1
	sw		s8, 228(sp)
	li		s8, 0
	sw		s8, 224(sp)
	li		s8, 0
	sw		s8, 220(sp)
	li		s8, -1009589776
	sw		s8, 216(sp)
	li		s8, 0
	sw		s8, 212(sp)
	li		s8, -271733879
	sw		s8, 208(sp)
	li		s8, -1732584194
	sw		s8, 204(sp)
	li		s8, 271733878
	sw		s8, 200(sp)
	li		s8, 0
	sw		s8, 196(sp)
	addi	s8, a0, 4
	sw		s8, 192(sp)
	addi	s8, a0, 8
	sw		s8, 188(sp)
	addi	s8, a0, 12
	sw		s8, 184(sp)
	addi	s8, a0, 16
	sw		s8, 180(sp)
	addi	s8, a0, 20
	sw		s8, 176(sp)
	sw		a0, 172(sp)
	li		s8, 0
	sw		s8, 168(sp)
	la		s8, __str_const_1
	sw		s8, 164(sp)
	la		s8, __str_const_1
	sw		s8, 160(sp)
	li		s8, -1894007588
	sw		s8, 156(sp)
	li		s8, -899497514
	sw		s8, 152(sp)
	li		s8, 1518500249
	sw		s8, 148(sp)
	li		s8, 1859775393
	sw		s8, 144(sp)
	sw		a0, 140(sp)
	li		s8, 0
	sw		s8, 136(sp)
	li		s8, 0
	sw		s8, 132(sp)
	li		s8, 0
	sw		s8, 128(sp)
	li		s8, 0
	sw		s8, 124(sp)
	li		s8, 0
	sw		s8, 120(sp)
	li		s8, 0
	sw		s8, 116(sp)
	la		s8, __str_const_1
	sw		s8, 112(sp)
	li		s8, 1
	sw		s8, 108(sp)
	li		s8, 0
	sw		s8, 104(sp)
	li		s8, 28
	sw		s8, 100(sp)
	la		s8, __str_const_2
	sw		s8, 96(sp)
	li		s8, 0
	sw		s8, 92(sp)
	li		s8, 16
	sw		s8, 88(sp)
	li		s8, 0
	sw		s8, 84(sp)
	li		s8, 0
	sw		s8, 80(sp)
	li		s8, 16
	sw		s8, 76(sp)
	li		s8, 0
	sw		s8, 72(sp)
	li		s8, 0
	sw		s8, 68(sp)
	li		s8, 0
	sw		s8, 64(sp)
	li		s8, 0
	sw		s8, 60(sp)
	li		s8, -271733879
	sw		s8, 56(sp)
	li		s8, -1009589776
	sw		s8, 52(sp)
	li		s8, 0
	sw		s8, 48(sp)
	li		s8, -1732584194
	sw		s8, 44(sp)
	li		s8, 271733878
	sw		s8, 40(sp)
	li		s8, 1732584193
	sw		s8, 36(sp)
	li		s8, 0
	sw		s8, 32(sp)
	j		_init__fake_main__while_body

_init__fake_main__while_body:
	call	__builtin_getInt
	beq		a0, zero, _init__split_block
	j		_init__fake_main__if_merge

_init__split_block:
	li		a0, 0
	lw		s11, 268(sp)
	lw		s10, 272(sp)
	lw		s9, 276(sp)
	lw		s8, 280(sp)
	lw		s7, 284(sp)
	lw		s6, 288(sp)
	lw		s5, 292(sp)
	lw		s4, 296(sp)
	lw		s3, 300(sp)
	lw		s2, 304(sp)
	lw		s1, 308(sp)
	lw		s0, 312(sp)
	lw		ra, 316(sp)
	addi	sp, sp, 320
	jr		ra

_init__fake_main__if_merge:
	li		s8, 1
	beq		a0, s8, _init__fake_main__if_then_2
	j		_init__fake_main__if_else

_init__fake_main__if_then_2:
	call	__builtin_getString
	mv		s8, a0
	lw		s5, 116(sp)
	j		_init__fake_main_fake_computeSHA1__for_cond

_init__fake_main_fake_computeSHA1__for_cond:
	mv		a0, s8
	call	__builtin_string_length
	blt		s5, a0, _init__fake_main_fake_computeSHA1__for_body
	j		_init__fake_main_fake_computeSHA1__for_merge

_init__fake_main_fake_computeSHA1__for_body:
	slli	s1, s5, 2
	addi	s1, s1, 4
	add		s1, s1, s9
	mv		a0, s8
	mv		a1, s5
	call	__builtin_string_ord
	sw		a0, 0(s1)
	addi	s5, s5, 1
	j		_init__fake_main_fake_computeSHA1__for_cond

_init__fake_main_fake_computeSHA1__for_merge:
	mv		a0, s8
	call	__builtin_string_length
	addi	s8, a0, 64
	addi	s5, s8, -56
	li		s8, 64
	div		s8, s5, s8
	addi	a4, s8, 1
	li		s8, 100
	bgt		a4, s8, _init__fake_main_fake_computeSHA1_fake_sha1__if_then_4
	j		_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header

_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header:
	lw		s5, 64(sp)
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond:
	blt		s5, a4, _init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_2
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_merge

_init__fake_main_fake_computeSHA1_fake_sha1__for_merge:
	lw		s8, 124(sp)
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_3

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_3:
	blt		s8, a0, _init__fake_main_fake_computeSHA1_fake_sha1__for_body_4
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_merge_2

_init__fake_main_fake_computeSHA1_fake_sha1__for_merge_2:
	li		s5, 64
	div		s5, s8, s5
	slli	s5, s5, 2
	addi	s5, s5, 4
	add		s10, s5, s7
	li		s5, 64
	rem		s1, s8, s5
	li		s5, 4
	div		s5, s1, s5
	lw		s1, 0(s10)
	slli	s5, s5, 2
	addi	s5, s5, 4
	add		s1, s5, s1
	lw		s10, 0(s10)
	add		s10, s5, s10
	li		s5, 4
	rem		s5, s8, s5
	li		s8, 3
	sub		s8, s8, s5
	slli	s8, s8, 3
	li		s5, 128
	sll		s8, s5, s8
	lw		s5, 0(s10)
	or		s8, s5, s8
	sw		s8, 0(s1)
	addi	s8, a4, -1
	slli	s8, s8, 2
	addi	s8, s8, 4
	add		s5, s8, s7
	lw		s8, 0(s5)
	addi	s1, s8, 64
	slli	s8, a0, 3
	sw		s8, 0(s1)
	lw		s8, 0(s5)
	addi	s5, s8, 60
	srai	s8, a0, 29
	andi	s8, s8, 7
	sw		s8, 0(s5)
	lw		s8, 56(sp)
	lw		s5, 52(sp)
	lw		s3, 48(sp)
	lw		t1, 44(sp)
	lw		t2, 40(sp)
	lw		t5, 36(sp)
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_4

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_4:
	blt		s3, a4, _init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_3
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_merge_3

_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_3:
	slli	s1, s3, 2
	addi	s1, s1, 4
	add		a3, s1, s7
	lw		s1, 88(sp)
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_5

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_5:
	li		s10, 80
	blt		s1, s10, _init__fake_main_fake_computeSHA1_fake_sha1__for_body_2
	j		_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_4

_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_4:
	mv		a6, t5
	mv		t0, s8
	mv		t3, t2
	mv		s1, s5
	lw		a7, 92(sp)
	mv		t4, t1
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_6

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_6:
	li		s10, 80
	blt		a7, s10, _init__fake_main_fake_computeSHA1_fake_sha1__for_body_3
	j		_init__fake_main_fake_computeSHA1_fake_sha1_split_block

_init__fake_main_fake_computeSHA1_fake_sha1_split_block:
	li		s10, 65535
	and		s4, t5, s10
	li		s10, 65535
	and		s10, a6, s10
	add		a7, s4, s10
	srai	s10, t5, 16
	li		s4, 65535
	and		t5, s10, s4
	srai	s10, a6, 16
	li		s4, 65535
	and		s10, s10, s4
	add		s10, t5, s10
	srai	s4, a7, 16
	add		s4, s10, s4
	li		s10, 65535
	and		s10, s4, s10
	slli	s10, s10, 16
	li		s4, 65535
	and		s4, a7, s4
	or		t5, s10, s4
	li		s10, 65535
	and		s4, s8, s10
	li		s10, 65535
	and		s10, t0, s10
	add		s4, s4, s10
	srai	s8, s8, 16
	li		s10, 65535
	and		s10, s8, s10
	srai	s8, t0, 16
	li		a6, 65535
	and		s8, s8, a6
	add		s8, s10, s8
	srai	s10, s4, 16
	add		s8, s8, s10
	li		s10, 65535
	and		s8, s8, s10
	slli	s10, s8, 16
	li		s8, 65535
	and		s8, s4, s8
	or		s8, s10, s8
	li		s10, 65535
	and		s4, t1, s10
	li		s10, 65535
	and		s10, t4, s10
	add		a6, s4, s10
	srai	s10, t1, 16
	li		s4, 65535
	and		s10, s10, s4
	srai	t0, t4, 16
	li		s4, 65535
	and		s4, t0, s4
	add		s10, s10, s4
	srai	s4, a6, 16
	add		s10, s10, s4
	li		s4, 65535
	and		s10, s10, s4
	slli	s4, s10, 16
	li		s10, 65535
	and		s10, a6, s10
	or		t1, s4, s10
	li		s10, 65535
	and		s10, t2, s10
	li		s4, 65535
	and		s4, t3, s4
	add		s10, s10, s4
	srai	a6, t2, 16
	li		s4, 65535
	and		s4, a6, s4
	srai	t2, t3, 16
	li		a6, 65535
	and		a6, t2, a6
	add		a6, s4, a6
	srai	s4, s10, 16
	add		a6, a6, s4
	li		s4, 65535
	and		s4, a6, s4
	slli	a6, s4, 16
	li		s4, 65535
	and		s10, s10, s4
	or		t2, a6, s10
	li		s10, 65535
	and		s4, s5, s10
	li		s10, 65535
	and		s10, s1, s10
	add		s4, s4, s10
	srai	s5, s5, 16
	li		s10, 65535
	and		s10, s5, s10
	srai	s5, s1, 16
	li		s1, 65535
	and		s5, s5, s1
	add		s5, s10, s5
	srai	s1, s4, 16
	add		s5, s5, s1
	li		s1, 65535
	and		s5, s5, s1
	slli	s1, s5, 16
	li		s5, 65535
	and		s5, s4, s5
	or		s5, s1, s5
	addi	s3, s3, 1
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_4

_init__fake_main_fake_computeSHA1_fake_sha1__for_body_3:
	li		s10, 20
	blt		a7, s10, _init__fake_main_fake_computeSHA1_fake_sha1__if_then_3
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_else

_init__fake_main_fake_computeSHA1_fake_sha1__if_else:
	li		s10, 40
	blt		a7, s10, _init__fake_main_fake_computeSHA1_fake_sha1__if_then_2
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_else_2

_init__fake_main_fake_computeSHA1_fake_sha1__if_else_2:
	li		s10, 60
	blt		a7, s10, _init__fake_main_fake_computeSHA1_fake_sha1__if_then
	j		_init__fake_main_fake_computeSHA1_fake_sha1__if_else_3

_init__fake_main_fake_computeSHA1_fake_sha1__if_then:
	and		s4, t0, t4
	and		s10, t0, t3
	or		s4, s4, s10
	and		s10, t4, t3
	or		s4, s4, s10
	lw		s10, 156(sp)
	j		_init__fake_main_fake_computeSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_main_fake_computeSHA1_fake_sha1_fake_rotate_left__if_merge:
	li		a0, 134217727
	and		a0, a6, a0
	slli	a0, a0, 5
	srai	a1, a6, 27
	andi	a1, a1, 31
	or		a0, a0, a1
	li		a1, 65535
	and		a1, a0, a1
	li		ra, 65535
	and		ra, s1, ra
	add		a1, a1, ra
	srai	a0, a0, 16
	li		ra, 65535
	and		ra, a0, ra
	srai	a0, s1, 16
	li		s1, 65535
	and		s1, a0, s1
	add		s1, ra, s1
	srai	a0, a1, 16
	add		s1, s1, a0
	li		a0, 65535
	and		s1, s1, a0
	slli	a0, s1, 16
	li		s1, 65535
	and		s1, a1, s1
	or		s1, a0, s1
	li		a0, 65535
	and		a0, s4, a0
	li		a1, 65535
	and		a1, s10, a1
	add		a0, a0, a1
	srai	s4, s4, 16
	li		a1, 65535
	and		s4, s4, a1
	srai	a1, s10, 16
	li		s10, 65535
	and		s10, a1, s10
	add		s4, s4, s10
	srai	s10, a0, 16
	add		s4, s4, s10
	li		s10, 65535
	and		s10, s4, s10
	slli	s4, s10, 16
	li		s10, 65535
	and		s10, a0, s10
	or		a0, s4, s10
	li		s10, 65535
	and		s4, s1, s10
	li		s10, 65535
	and		s10, a0, s10
	add		s4, s4, s10
	srai	s1, s1, 16
	li		s10, 65535
	and		s10, s1, s10
	srai	a0, a0, 16
	li		s1, 65535
	and		s1, a0, s1
	add		s1, s10, s1
	srai	s10, s4, 16
	add		s1, s1, s10
	li		s10, 65535
	and		s1, s1, s10
	slli	s10, s1, 16
	li		s1, 65535
	and		s1, s4, s1
	or		a0, s10, s1
	lw		s10, 0(a3)
	slli	s1, a7, 2
	addi	s1, s1, 4
	add		s1, s1, s10
	lw		a1, 0(s1)
	li		s1, 65535
	and		s10, a0, s1
	li		s1, 65535
	and		s1, a1, s1
	add		s4, s10, s1
	srai	s10, a0, 16
	li		s1, 65535
	and		s10, s10, s1
	srai	a0, a1, 16
	li		s1, 65535
	and		s1, a0, s1
	add		s1, s10, s1
	srai	s10, s4, 16
	add		s10, s1, s10
	li		s1, 65535
	and		s1, s10, s1
	slli	s10, s1, 16
	li		s1, 65535
	and		s1, s4, s1
	or		s10, s10, s1
	mv		s1, t3
	andi	s4, t0, 3
	slli	t3, s4, 30
	srai	s4, t0, 2
	li		t0, 1073741823
	and		s4, s4, t0
	or		s4, t3, s4
	mv		t0, a6
	mv		a6, s10
	addi	a7, a7, 1
	mv		t3, t4
	mv		t4, s4
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_6

_init__fake_main_fake_computeSHA1_fake_sha1__if_else_3:
	xor		s10, t0, t4
	xor		s4, s10, t3
	lw		s10, 152(sp)
	j		_init__fake_main_fake_computeSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_main_fake_computeSHA1_fake_sha1__if_then_2:
	xor		s10, t0, t4
	xor		s4, s10, t3
	lw		s10, 144(sp)
	j		_init__fake_main_fake_computeSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_main_fake_computeSHA1_fake_sha1__if_then_3:
	and		s4, t0, t4
	xori	s10, t0, -1
	and		s10, s10, t3
	or		s4, s4, s10
	lw		s10, 148(sp)
	j		_init__fake_main_fake_computeSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_main_fake_computeSHA1_fake_sha1__for_body_2:
	lw		s10, 0(a3)
	slli	s4, s1, 2
	addi	s4, s4, 4
	add		a6, s4, s10
	addi	s10, s1, -3
	lw		s4, 0(a3)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		t0, s10, s4
	addi	s10, s1, -8
	lw		s4, 0(a3)
	slli	s10, s10, 2
	addi	s10, s10, 4
	add		s4, s10, s4
	lw		s10, 0(t0)
	lw		s4, 0(s4)
	xor		t0, s10, s4
	addi	s4, s1, -14
	lw		s10, 0(a3)
	slli	s4, s4, 2
	addi	s4, s4, 4
	add		s10, s4, s10
	lw		s10, 0(s10)
	xor		t0, t0, s10
	addi	s4, s1, -16
	lw		s10, 0(a3)
	slli	s4, s4, 2
	addi	s4, s4, 4
	add		s10, s4, s10
	lw		s10, 0(s10)
	xor		s4, t0, s10
	li		s10, 2147483647
	and		s10, s4, s10
	slli	t0, s10, 1
	srai	s10, s4, 31
	andi	s10, s10, 1
	or		s10, t0, s10
	sw		s10, 0(a6)
	addi	s1, s1, 1
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_5

_init__fake_main_fake_computeSHA1_fake_sha1__for_merge_3:
	lw		s1, 192(sp)
	sw		t5, 0(s1)
	lw		s1, 188(sp)
	sw		s8, 0(s1)
	lw		s8, 184(sp)
	sw		t1, 0(s8)
	lw		s8, 180(sp)
	sw		t2, 0(s8)
	lw		s8, 176(sp)
	sw		s5, 0(s8)
	lw		s8, 140(sp)
	sw		s8, 0(sp)
	j		_init___init__fake_main_fake_computeSHA1__for_cond_pre_header

_init___init__fake_main_fake_computeSHA1__for_cond_pre_header:
	lw		s10, 60(sp)
	j		_init__fake_main_fake_computeSHA1__for_cond_2

_init__fake_main_fake_computeSHA1__for_cond_2:
	lw		s8, 0(sp)
	lw		s8, 0(s8)
	blt		s10, s8, _init__fake_main_fake_computeSHA1__for_body_2
	j		_init__fake_main_split_block

_init__fake_main_split_block:
	la		a0, __str_const_4
	call	__builtin_println
	j		_init__fake_main__while_body

_init__fake_main_fake_computeSHA1__for_body_2:
	slli	s8, s10, 2
	addi	s5, s8, 4
	lw		s8, 0(sp)
	add		s8, s5, s8
	lw		s1, 0(s8)
	lw		s5, 100(sp)
	lw		s8, 96(sp)
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__for_cond

_init__fake_main_fake_computeSHA1_fake_toStringHex__for_cond:
	bge		s5, zero, _init__fake_main_fake_computeSHA1_fake_toStringHex__for_body
	j		_init__fake_main_fake_computeSHA1_split_block

_init__fake_main_fake_computeSHA1_fake_toStringHex__for_body:
	sra		s4, s1, s5
	andi	s4, s4, 15
	li		s3, 10
	blt		s4, s3, _init__fake_main_fake_computeSHA1_fake_toStringHex__if_then
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__if_else

_init__fake_main_fake_computeSHA1_fake_toStringHex__if_else:
	addi	s4, s4, 65
	addi	s3, s4, -10
	li		s4, 32
	bge		s3, s4, _init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__lhs_and_then
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__lhs_and_then:
	li		s4, 126
	ble		s3, s4, _init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_then
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_then:
	addi	a1, s3, -32
	addi	a2, s3, -31
	la		a0, __str_const_9
	call	__builtin_string_substring
	mv		a1, a0
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block

_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block:
	mv		a0, s8
	call	__builtin_string_add
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__for_step

_init__fake_main_fake_computeSHA1_fake_toStringHex__for_step:
	addi	s5, s5, -4
	mv		s8, a0
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__for_cond

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge:
	lw		a1, 164(sp)
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block

_init__fake_main_fake_computeSHA1_fake_toStringHex__if_then:
	addi	s4, s4, 48
	li		s3, 32
	bge		s4, s3, _init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__lhs_and_then_2
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge_2

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge_2:
	lw		a1, 160(sp)
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block_2

_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block_2:
	mv		a0, s8
	call	__builtin_string_add
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex__for_step

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__lhs_and_then_2:
	li		s3, 126
	ble		s4, s3, _init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_then_2
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_merge_2

_init__fake_main_fake_computeSHA1_fake_toStringHex_fake_int2chr__if_then_2:
	addi	a1, s4, -32
	addi	a2, s4, -31
	la		a0, __str_const_9
	call	__builtin_string_substring
	mv		a1, a0
	j		_init__fake_main_fake_computeSHA1_fake_toStringHex_split_block_2

_init__fake_main_fake_computeSHA1_split_block:
	mv		a0, s8
	call	__builtin_print
	addi	s10, s10, 1
	j		_init__fake_main_fake_computeSHA1__for_cond_2

_init__fake_main_fake_computeSHA1_fake_sha1__for_body_4:
	li		s5, 64
	div		s5, s8, s5
	slli	s5, s5, 2
	addi	s5, s5, 4
	add		s4, s5, s7
	li		s5, 64
	rem		s1, s8, s5
	li		s5, 4
	div		s5, s1, s5
	lw		s10, 0(s4)
	slli	s5, s5, 2
	addi	s1, s5, 4
	add		s10, s1, s10
	lw		s5, 0(s4)
	add		s4, s1, s5
	slli	s5, s8, 2
	addi	s5, s5, 4
	add		s1, s5, s9
	li		s5, 4
	rem		s5, s8, s5
	li		s3, 3
	sub		s5, s3, s5
	slli	s5, s5, 3
	lw		s1, 0(s1)
	sll		s5, s1, s5
	lw		s1, 0(s4)
	or		s5, s1, s5
	sw		s5, 0(s10)
	addi	s8, s8, 1
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_3

_init___init__fake_main_fake_computeSHA1_fake_sha1__for_cond_pre_header_2:
	slli	s8, s5, 2
	addi	s8, s8, 4
	add		s4, s8, s7
	lw		s8, 104(sp)
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_2

_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_2:
	li		s1, 80
	blt		s8, s1, _init__fake_main_fake_computeSHA1_fake_sha1__for_body
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_step

_init__fake_main_fake_computeSHA1_fake_sha1__for_step:
	addi	s5, s5, 1
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond

_init__fake_main_fake_computeSHA1_fake_sha1__for_body:
	lw		s10, 0(s4)
	slli	s1, s8, 2
	addi	s1, s1, 4
	add		s10, s1, s10
	li		s1, 0
	sw		s1, 0(s10)
	addi	s8, s8, 1
	j		_init__fake_main_fake_computeSHA1_fake_sha1__for_cond_2

_init__fake_main_fake_computeSHA1_fake_sha1__if_then_4:
	la		a0, __str_const_3
	call	__builtin_println
	lw		s8, 260(sp)
	sw		s8, 0(sp)
	j		_init___init__fake_main_fake_computeSHA1__for_cond_pre_header

_init__fake_main__if_else:
	li		s8, 2
	beq		a0, s8, _init__fake_main__if_then
	j		_init__fake_main__while_body

_init__fake_main__if_then:
	call	__builtin_getString
	sw		a0, 28(sp)
	li		a0, 24
	call	malloc
	mv		s1, a0
	li		s8, 5
	sw		s8, 0(s1)
	lw		a0, 28(sp)
	call	__builtin_string_length
	li		s8, 40
	bne		a0, s8, _init__fake_crackSHA1__if_then
	j		_init__fake_crackSHA1__if_merge

_init__fake_crackSHA1__if_merge:
	lw		s8, 264(sp)
	j		_init__fake_crackSHA1__for_cond

_init__fake_crackSHA1__for_cond:
	li		s5, 5
	blt		s8, s5, _init__fake_crackSHA1__for_body
	j		_init___init__fake_crackSHA1__for_cond_pre_header

_init___init__fake_crackSHA1__for_cond_pre_header:
	lw		s4, 84(sp)
	j		_init__fake_crackSHA1__for_cond_2

_init__fake_crackSHA1__for_cond_2:
	li		s8, 40
	blt		s4, s8, _init__fake_crackSHA1__for_body_5
	j		_init__fake_crackSHA1__for_merge

_init__fake_crackSHA1__for_merge:
	lw		s10, 108(sp)
	j		_init__fake_crackSHA1__for_cond_3

_init__fake_crackSHA1__for_cond_3:
	li		s8, 4
	ble		s10, s8, _init__fake_crackSHA1__for_body_2
	j		_init__fake_crackSHA1__for_merge_3

_init__fake_crackSHA1__for_merge_3:
	la		a0, __str_const_7
	call	__builtin_println
	j		_init__fake_main__while_body

_init__fake_crackSHA1__for_body_2:
	lw		s8, 120(sp)
	j		_init__fake_crackSHA1__for_cond_4

_init__fake_crackSHA1__for_cond_4:
	blt		s8, s10, _init__fake_crackSHA1__for_body_3
	j		_init___init__fake_crackSHA1__while_cond_pre_header

_init___init__fake_crackSHA1__while_cond_pre_header:
	addi	s8, s10, 64
	addi	s5, s8, -56
	li		s8, 64
	div		s8, s5, s8
	addi	s5, s8, 1
	addi	s8, s5, -1
	slli	s8, s8, 2
	addi	s8, s8, 4
	add		s8, s8, s7
	sw		s8, 24(sp)
	slli	s8, s10, 3
	sw		s8, 20(sp)
	srai	s8, s10, 29
	andi	s8, s8, 7
	sw		s8, 16(sp)
	addi	s8, s10, -1
	sw		s8, 12(sp)
	j		_init__fake_crackSHA1__while_body

_init__fake_crackSHA1__while_body:
	li		s8, 100
	bgt		s5, s8, _init__fake_crackSHA1_fake_sha1__if_then
	j		_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header

_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header:
	lw		s8, 32(sp)
	j		_init__fake_crackSHA1_fake_sha1__for_cond

_init__fake_crackSHA1_fake_sha1__for_cond:
	blt		s8, s5, _init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_4
	j		_init__fake_crackSHA1_fake_sha1__for_merge

_init__fake_crackSHA1_fake_sha1__for_merge:
	lw		s8, 220(sp)
	j		_init__fake_crackSHA1_fake_sha1__for_cond_2

_init__fake_crackSHA1_fake_sha1__for_cond_2:
	blt		s8, s10, _init__fake_crackSHA1_fake_sha1__for_body
	j		_init__fake_crackSHA1_fake_sha1__for_merge_2

_init__fake_crackSHA1_fake_sha1__for_body:
	li		s4, 64
	div		s4, s8, s4
	slli	s4, s4, 2
	addi	s4, s4, 4
	add		a6, s4, s7
	li		s4, 64
	rem		s4, s8, s4
	li		s3, 4
	div		s4, s4, s3
	lw		s3, 0(a6)
	slli	s4, s4, 2
	addi	s4, s4, 4
	add		s3, s4, s3
	lw		a6, 0(a6)
	add		t2, s4, a6
	slli	s4, s8, 2
	addi	s4, s4, 4
	add		a4, s4, s9
	li		s4, 4
	rem		s4, s8, s4
	li		a6, 3
	sub		s4, a6, s4
	slli	s4, s4, 3
	lw		a6, 0(a4)
	sll		a6, a6, s4
	lw		s4, 0(t2)
	or		s4, s4, a6
	sw		s4, 0(s3)
	addi	s8, s8, 1
	j		_init__fake_crackSHA1_fake_sha1__for_cond_2

_init__fake_crackSHA1_fake_sha1__for_merge_2:
	li		s4, 64
	div		s4, s8, s4
	slli	s4, s4, 2
	addi	s4, s4, 4
	add		a6, s4, s7
	li		s4, 64
	rem		s3, s8, s4
	li		s4, 4
	div		s4, s3, s4
	lw		s3, 0(a6)
	slli	s4, s4, 2
	addi	t2, s4, 4
	add		s3, t2, s3
	lw		s4, 0(a6)
	add		a6, t2, s4
	li		s4, 4
	rem		s8, s8, s4
	li		s4, 3
	sub		s8, s4, s8
	slli	s8, s8, 3
	li		s4, 128
	sll		s8, s4, s8
	lw		s4, 0(a6)
	or		s8, s4, s8
	sw		s8, 0(s3)
	lw		s8, 24(sp)
	lw		s8, 0(s8)
	addi	s4, s8, 64
	lw		s8, 20(sp)
	sw		s8, 0(s4)
	lw		s8, 24(sp)
	lw		s8, 0(s8)
	addi	s8, s8, 60
	lw		s4, 16(sp)
	sw		s4, 0(s8)
	lw		s4, 200(sp)
	lw		t3, 216(sp)
	lw		t5, 208(sp)
	lw		t1, 212(sp)
	lw		t4, 232(sp)
	lw		a0, 204(sp)
	j		_init__fake_crackSHA1_fake_sha1__for_cond_3

_init__fake_crackSHA1_fake_sha1__for_cond_3:
	blt		t1, s5, _init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_2
	j		_init__fake_crackSHA1_fake_sha1__for_merge_3

_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_2:
	slli	s8, t1, 2
	addi	s8, s8, 4
	add		a7, s8, s7
	lw		s8, 76(sp)
	j		_init__fake_crackSHA1_fake_sha1__for_cond_4

_init__fake_crackSHA1_fake_sha1__for_cond_4:
	li		s3, 80
	blt		s8, s3, _init__fake_crackSHA1_fake_sha1__for_body_3
	j		_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_3

_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_3:
	mv		s3, s4
	mv		a4, t4
	mv		a3, a0
	mv		a1, t5
	mv		a6, t3
	lw		t0, 72(sp)
	j		_init__fake_crackSHA1_fake_sha1__for_cond_5

_init__fake_crackSHA1_fake_sha1__for_cond_5:
	li		s8, 80
	blt		t0, s8, _init__fake_crackSHA1_fake_sha1__for_body_2
	j		_init__fake_crackSHA1_fake_sha1_split_block

_init__fake_crackSHA1_fake_sha1_split_block:
	li		s8, 65535
	and		s8, t4, s8
	li		t2, 65535
	and		t2, a4, t2
	add		t0, s8, t2
	srai	t2, t4, 16
	li		s8, 65535
	and		t2, t2, s8
	srai	s8, a4, 16
	li		a4, 65535
	and		s8, s8, a4
	add		t2, t2, s8
	srai	s8, t0, 16
	add		t2, t2, s8
	li		s8, 65535
	and		s8, t2, s8
	slli	t2, s8, 16
	li		s8, 65535
	and		s8, t0, s8
	or		t4, t2, s8
	li		s8, 65535
	and		t2, t5, s8
	li		s8, 65535
	and		s8, a1, s8
	add		a4, t2, s8
	srai	s8, t5, 16
	li		t2, 65535
	and		t2, s8, t2
	srai	s8, a1, 16
	li		t0, 65535
	and		s8, s8, t0
	add		t2, t2, s8
	srai	s8, a4, 16
	add		s8, t2, s8
	li		t2, 65535
	and		s8, s8, t2
	slli	t2, s8, 16
	li		s8, 65535
	and		s8, a4, s8
	or		t5, t2, s8
	li		s8, 65535
	and		s8, a0, s8
	li		t2, 65535
	and		t2, a3, t2
	add		a4, s8, t2
	srai	s8, a0, 16
	li		t2, 65535
	and		t2, s8, t2
	srai	s8, a3, 16
	li		t0, 65535
	and		s8, s8, t0
	add		s8, t2, s8
	srai	t2, a4, 16
	add		s8, s8, t2
	li		t2, 65535
	and		s8, s8, t2
	slli	s8, s8, 16
	li		t2, 65535
	and		t2, a4, t2
	or		a0, s8, t2
	li		s8, 65535
	and		t2, s4, s8
	li		s8, 65535
	and		s8, s3, s8
	add		t2, t2, s8
	srai	s8, s4, 16
	li		s4, 65535
	and		a4, s8, s4
	srai	s4, s3, 16
	li		s8, 65535
	and		s8, s4, s8
	add		s4, a4, s8
	srai	s8, t2, 16
	add		s8, s4, s8
	li		s4, 65535
	and		s8, s8, s4
	slli	s4, s8, 16
	li		s8, 65535
	and		s8, t2, s8
	or		s4, s4, s8
	li		s8, 65535
	and		s8, t3, s8
	li		s3, 65535
	and		s3, a6, s3
	add		t2, s8, s3
	srai	s8, t3, 16
	li		s3, 65535
	and		s3, s8, s3
	srai	s8, a6, 16
	li		a6, 65535
	and		s8, s8, a6
	add		s8, s3, s8
	srai	s3, t2, 16
	add		s3, s8, s3
	li		s8, 65535
	and		s8, s3, s8
	slli	s3, s8, 16
	li		s8, 65535
	and		s8, t2, s8
	or		t3, s3, s8
	addi	t1, t1, 1
	j		_init__fake_crackSHA1_fake_sha1__for_cond_3

_init__fake_crackSHA1_fake_sha1__for_body_2:
	li		s8, 20
	blt		t0, s8, _init__fake_crackSHA1_fake_sha1__if_then_2
	j		_init__fake_crackSHA1_fake_sha1__if_else

_init__fake_crackSHA1_fake_sha1__if_then_2:
	and		t2, a1, a3
	xori	s8, a1, -1
	and		s8, s8, s3
	or		s8, t2, s8
	mv		t2, s11
	j		_init__fake_crackSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_crackSHA1_fake_sha1_fake_rotate_left__if_merge:
	li		ra, 134217727
	and		ra, a4, ra
	slli	ra, ra, 5
	srai	a2, a4, 27
	andi	a2, a2, 31
	or		ra, ra, a2
	li		a2, 65535
	and		t6, ra, a2
	li		a2, 65535
	and		a2, a6, a2
	add		a2, t6, a2
	srai	ra, ra, 16
	li		t6, 65535
	and		ra, ra, t6
	srai	t6, a6, 16
	li		a6, 65535
	and		a6, t6, a6
	add		a6, ra, a6
	srai	ra, a2, 16
	add		ra, a6, ra
	li		a6, 65535
	and		a6, ra, a6
	slli	a6, a6, 16
	li		ra, 65535
	and		ra, a2, ra
	or		a6, a6, ra
	li		ra, 65535
	and		a2, s8, ra
	li		ra, 65535
	and		ra, t2, ra
	add		ra, a2, ra
	srai	s8, s8, 16
	li		a2, 65535
	and		a2, s8, a2
	srai	s8, t2, 16
	li		t2, 65535
	and		s8, s8, t2
	add		s8, a2, s8
	srai	t2, ra, 16
	add		t2, s8, t2
	li		s8, 65535
	and		s8, t2, s8
	slli	t2, s8, 16
	li		s8, 65535
	and		s8, ra, s8
	or		ra, t2, s8
	li		s8, 65535
	and		t2, a6, s8
	li		s8, 65535
	and		s8, ra, s8
	add		t2, t2, s8
	srai	s8, a6, 16
	li		a6, 65535
	and		a2, s8, a6
	srai	s8, ra, 16
	li		a6, 65535
	and		s8, s8, a6
	add		a6, a2, s8
	srai	s8, t2, 16
	add		a6, a6, s8
	li		s8, 65535
	and		s8, a6, s8
	slli	s8, s8, 16
	li		a6, 65535
	and		a6, t2, a6
	or		a6, s8, a6
	lw		s8, 0(a7)
	slli	t2, t0, 2
	addi	t2, t2, 4
	add		s8, t2, s8
	lw		t2, 0(s8)
	li		s8, 65535
	and		ra, a6, s8
	li		s8, 65535
	and		s8, t2, s8
	add		s8, ra, s8
	srai	ra, a6, 16
	li		a6, 65535
	and		ra, ra, a6
	srai	t2, t2, 16
	li		a6, 65535
	and		a6, t2, a6
	add		a6, ra, a6
	srai	t2, s8, 16
	add		a6, a6, t2
	li		t2, 65535
	and		a6, a6, t2
	slli	a6, a6, 16
	li		t2, 65535
	and		s8, s8, t2
	or		s8, a6, s8
	mv		a6, s3
	mv		s3, a3
	andi	t2, a1, 3
	slli	t2, t2, 30
	srai	a3, a1, 2
	li		a1, 1073741823
	and		a3, a3, a1
	or		a3, t2, a3
	mv		a1, a4
	mv		a4, s8
	addi	t0, t0, 1
	j		_init__fake_crackSHA1_fake_sha1__for_cond_5

_init__fake_crackSHA1_fake_sha1__if_else:
	li		s8, 40
	blt		t0, s8, _init__fake_crackSHA1_fake_sha1__if_then_4
	j		_init__fake_crackSHA1_fake_sha1__if_else_2

_init__fake_crackSHA1_fake_sha1__if_then_4:
	xor		s8, a1, a3
	xor		s8, s8, s3
	mv		t2, s6
	j		_init__fake_crackSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_crackSHA1_fake_sha1__if_else_2:
	li		s8, 60
	blt		t0, s8, _init__fake_crackSHA1_fake_sha1__if_then_3
	j		_init__fake_crackSHA1_fake_sha1__if_else_3

_init__fake_crackSHA1_fake_sha1__if_then_3:
	and		s8, a1, a3
	and		t2, a1, s3
	or		t2, s8, t2
	and		s8, a3, s3
	or		s8, t2, s8
	mv		t2, s2
	j		_init__fake_crackSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_crackSHA1_fake_sha1__if_else_3:
	xor		s8, a1, a3
	xor		s8, s8, s3
	mv		t2, s0
	j		_init__fake_crackSHA1_fake_sha1_fake_rotate_left__if_merge

_init__fake_crackSHA1_fake_sha1__for_body_3:
	lw		s3, 0(a7)
	slli	a6, s8, 2
	addi	a6, a6, 4
	add		t2, a6, s3
	addi	a6, s8, -3
	lw		s3, 0(a7)
	slli	a6, a6, 2
	addi	a6, a6, 4
	add		s3, a6, s3
	addi	a6, s8, -8
	lw		a4, 0(a7)
	slli	a6, a6, 2
	addi	a6, a6, 4
	add		a6, a6, a4
	lw		s3, 0(s3)
	lw		a6, 0(a6)
	xor		a6, s3, a6
	addi	s3, s8, -14
	lw		a4, 0(a7)
	slli	s3, s3, 2
	addi	s3, s3, 4
	add		s3, s3, a4
	lw		s3, 0(s3)
	xor		a4, a6, s3
	addi	s3, s8, -16
	lw		a6, 0(a7)
	slli	s3, s3, 2
	addi	s3, s3, 4
	add		s3, s3, a6
	lw		s3, 0(s3)
	xor		s3, a4, s3
	li		a6, 2147483647
	and		a6, s3, a6
	slli	a6, a6, 1
	srai	s3, s3, 31
	andi	s3, s3, 1
	or		s3, a6, s3
	sw		s3, 0(t2)
	addi	s8, s8, 1
	j		_init__fake_crackSHA1_fake_sha1__for_cond_4

_init__fake_crackSHA1_fake_sha1__for_merge_3:
	lw		s8, 192(sp)
	sw		t4, 0(s8)
	lw		s8, 188(sp)
	sw		t5, 0(s8)
	lw		s8, 184(sp)
	sw		a0, 0(s8)
	lw		s8, 180(sp)
	sw		s4, 0(s8)
	lw		s8, 176(sp)
	sw		t3, 0(s8)
	lw		s4, 172(sp)
	j		_init__fake_crackSHA1_split_block

_init__fake_crackSHA1_split_block:
	lw		s8, 0(s4)
	lw		s3, 0(s1)
	bne		s8, s3, _init__fake_crackSHA1_fake_array_equal__if_then
	j		_init__fake_crackSHA1_fake_array_equal__if_merge

_init__fake_crackSHA1_fake_array_equal__if_merge:
	lw		s8, 168(sp)
	j		_init__fake_crackSHA1_fake_array_equal__for_cond

_init__fake_crackSHA1_fake_array_equal__for_cond:
	lw		s3, 0(s4)
	blt		s8, s3, _init__fake_crackSHA1_fake_array_equal__for_body
	j		_init__fake_crackSHA1_fake_array_equal__for_merge

_init__fake_crackSHA1_fake_array_equal__for_merge:
	lw		s8, 252(sp)
	j		_init__fake_crackSHA1_split_block_2

_init__fake_crackSHA1_split_block_2:
	bne		s8, zero, _init___init__fake_crackSHA1__for_cond_pre_header_2
	j		_init___init__fake_crackSHA1_fake_nextText__for_cond_pre_header

_init___init__fake_crackSHA1_fake_nextText__for_cond_pre_header:
	lw		s4, 12(sp)
	j		_init__fake_crackSHA1_fake_nextText__for_cond

_init__fake_crackSHA1_fake_nextText__for_cond:
	bge		s4, zero, _init__fake_crackSHA1_fake_nextText__for_body
	j		_init__fake_crackSHA1_fake_nextText__for_merge

_init__fake_crackSHA1_fake_nextText__for_body:
	slli	s8, s4, 2
	addi	s8, s8, 4
	add		a6, s8, s9
	lw		s3, 0(a6)
	li		s8, 122
	beq		s3, s8, _init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then
	j		_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge:
	li		s8, 90
	beq		s3, s8, _init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then_3
	j		_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge_2

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then_3:
	lw		s8, 240(sp)
	j		_init__fake_crackSHA1_fake_nextText_split_block

_init__fake_crackSHA1_fake_nextText_split_block:
	sw		s8, 0(a6)
	mv		s3, s8
	li		s8, -1
	beq		s3, s8, _init__fake_crackSHA1_fake_nextText__if_then
	j		_init__fake_crackSHA1_fake_nextText__if_else

_init__fake_crackSHA1_fake_nextText__if_else:
	lw		s8, 228(sp)
	j		_init__fake_crackSHA1_split_block_4

_init__fake_crackSHA1_split_block_4:
	bne		s8, zero, _init__fake_crackSHA1__while_body
	j		_init__fake_crackSHA1__for_step

_init__fake_crackSHA1__for_step:
	addi	s10, s10, 1
	j		_init__fake_crackSHA1__for_cond_3

_init__fake_crackSHA1_fake_nextText__if_then:
	li		s8, 48
	sw		s8, 0(a6)
	addi	s4, s4, -1
	j		_init__fake_crackSHA1_fake_nextText__for_cond

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge_2:
	li		s8, 57
	beq		s3, s8, _init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then_2
	j		_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge_3

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then_2:
	lw		s8, 236(sp)
	j		_init__fake_crackSHA1_fake_nextText_split_block

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_merge_3:
	addi	s8, s3, 1
	j		_init__fake_crackSHA1_fake_nextText_split_block

_init__fake_crackSHA1_fake_nextText_fake_nextLetter__if_then:
	lw		s8, 244(sp)
	j		_init__fake_crackSHA1_fake_nextText_split_block

_init__fake_crackSHA1_fake_nextText__for_merge:
	lw		s8, 248(sp)
	j		_init__fake_crackSHA1_split_block_4

_init___init__fake_crackSHA1__for_cond_pre_header_2:
	lw		s8, 80(sp)
	j		_init__fake_crackSHA1__for_cond_5

_init__fake_crackSHA1__for_cond_5:
	blt		s8, s10, _init__fake_crackSHA1__for_body_4
	j		_init__fake_crackSHA1__for_merge_2

_init__fake_crackSHA1__for_merge_2:
	la		a0, __str_const_6
	call	__builtin_println
	j		_init__fake_main__while_body

_init__fake_crackSHA1__for_body_4:
	slli	s5, s8, 2
	addi	s5, s5, 4
	add		s5, s5, s9
	lw		s1, 0(s5)
	li		s5, 32
	bge		s1, s5, _init__fake_crackSHA1_fake_int2chr__lhs_and_then
	j		_init__fake_crackSHA1_fake_int2chr__if_merge

_init__fake_crackSHA1_fake_int2chr__lhs_and_then:
	li		s5, 126
	ble		s1, s5, _init__fake_crackSHA1_fake_int2chr__if_then
	j		_init__fake_crackSHA1_fake_int2chr__if_merge

_init__fake_crackSHA1_fake_int2chr__if_then:
	addi	a1, s1, -32
	addi	a2, s1, -31
	la		a0, __str_const_9
	call	__builtin_string_substring
	j		_init__fake_crackSHA1_split_block_3

_init__fake_crackSHA1_split_block_3:
	call	__builtin_print
	addi	s8, s8, 1
	j		_init__fake_crackSHA1__for_cond_5

_init__fake_crackSHA1_fake_int2chr__if_merge:
	lw		a0, 112(sp)
	j		_init__fake_crackSHA1_split_block_3

_init__fake_crackSHA1_fake_array_equal__for_body:
	slli	s3, s8, 2
	addi	a6, s3, 4
	add		s3, a6, s4
	add		a6, a6, s1
	lw		s3, 0(s3)
	lw		a6, 0(a6)
	bne		s3, a6, _init__fake_crackSHA1_fake_array_equal__if_then_2
	j		_init__fake_crackSHA1_fake_array_equal__for_step

_init__fake_crackSHA1_fake_array_equal__if_then_2:
	lw		s8, 256(sp)
	j		_init__fake_crackSHA1_split_block_2

_init__fake_crackSHA1_fake_array_equal__for_step:
	addi	s8, s8, 1
	j		_init__fake_crackSHA1_fake_array_equal__for_cond

_init__fake_crackSHA1_fake_array_equal__if_then:
	lw		s8, 224(sp)
	j		_init__fake_crackSHA1_split_block_2

_init___init__fake_crackSHA1_fake_sha1__for_cond_pre_header_4:
	slli	s4, s8, 2
	addi	s4, s4, 4
	add		a6, s4, s7
	lw		s4, 68(sp)
	j		_init__fake_crackSHA1_fake_sha1__for_cond_6

_init__fake_crackSHA1_fake_sha1__for_cond_6:
	li		s3, 80
	blt		s4, s3, _init__fake_crackSHA1_fake_sha1__for_body_4
	j		_init__fake_crackSHA1_fake_sha1__for_step

_init__fake_crackSHA1_fake_sha1__for_body_4:
	lw		t2, 0(a6)
	slli	s3, s4, 2
	addi	s3, s3, 4
	add		s3, s3, t2
	li		t2, 0
	sw		t2, 0(s3)
	addi	s4, s4, 1
	j		_init__fake_crackSHA1_fake_sha1__for_cond_6

_init__fake_crackSHA1_fake_sha1__for_step:
	addi	s8, s8, 1
	j		_init__fake_crackSHA1_fake_sha1__for_cond

_init__fake_crackSHA1_fake_sha1__if_then:
	la		a0, __str_const_3
	call	__builtin_println
	lw		s4, 196(sp)
	j		_init__fake_crackSHA1_split_block

_init__fake_crackSHA1__for_body_3:
	slli	s5, s8, 2
	addi	s5, s5, 4
	add		s5, s5, s9
	li		s4, 48
	sw		s4, 0(s5)
	addi	s8, s8, 1
	j		_init__fake_crackSHA1__for_cond_4

_init__fake_crackSHA1__for_body_5:
	li		s8, 8
	div		s8, s4, s8
	slli	s8, s8, 2
	addi	s8, s8, 4
	add		s8, s8, s1
	sw		s8, 8(sp)
	addi	s8, s4, 4
	sw		s8, 4(sp)
	lw		a0, 28(sp)
	mv		a1, s4
	lw		a2, 4(sp)
	call	__builtin_string_substring
	mv		s5, a0
	lw		s8, 132(sp)
	lw		s10, 136(sp)
	j		_init__fake_crackSHA1_fake_hex2int__for_cond

_init__fake_crackSHA1_fake_hex2int__for_cond:
	mv		a0, s5
	call	__builtin_string_length
	blt		s8, a0, _init__fake_crackSHA1_fake_hex2int__for_body
	j		_init__fake_crackSHA1_split_block_5

_init__fake_crackSHA1_fake_hex2int__for_body:
	mv		a0, s5
	mv		a1, s8
	call	__builtin_string_ord
	li		s3, 48
	bge		a0, s3, _init__fake_crackSHA1_fake_hex2int__lhs_and_then
	j		_init__fake_crackSHA1_fake_hex2int__if_else

_init__fake_crackSHA1_fake_hex2int__if_else:
	li		s3, 65
	bge		a0, s3, _init__fake_crackSHA1_fake_hex2int__lhs_and_then_2
	j		_init__fake_crackSHA1_fake_hex2int__if_else_2

_init__fake_crackSHA1_fake_hex2int__if_else_2:
	li		s3, 97
	bge		a0, s3, _init__fake_crackSHA1_fake_hex2int__lhs_and_then_3
	j		_init__fake_crackSHA1_fake_hex2int__if_else_3

_init__fake_crackSHA1_fake_hex2int__lhs_and_then_3:
	li		s3, 102
	ble		a0, s3, _init__fake_crackSHA1_fake_hex2int__if_then_2
	j		_init__fake_crackSHA1_fake_hex2int__if_else_3

_init__fake_crackSHA1_fake_hex2int__if_then_2:
	slli	s10, s10, 4
	add		s10, s10, a0
	addi	s10, s10, -97
	addi	s10, s10, 10
	j		_init__fake_crackSHA1_fake_hex2int__for_step

_init__fake_crackSHA1_fake_hex2int__for_step:
	addi	s8, s8, 1
	j		_init__fake_crackSHA1_fake_hex2int__for_cond

_init__fake_crackSHA1_fake_hex2int__if_else_3:
	lw		s10, 128(sp)
	j		_init__fake_crackSHA1_split_block_5

_init__fake_crackSHA1_split_block_5:
	li		s8, 4
	div		s5, s4, s8
	li		s8, 2
	rem		s5, s5, s8
	li		s8, 1
	sub		s8, s8, s5
	slli	s8, s8, 4
	sll		s8, s10, s8
	lw		s5, 8(sp)
	lw		s5, 0(s5)
	or		s5, s5, s8
	lw		s8, 8(sp)
	sw		s5, 0(s8)
	lw		s4, 4(sp)
	j		_init__fake_crackSHA1__for_cond_2

_init__fake_crackSHA1_fake_hex2int__lhs_and_then_2:
	li		s3, 70
	ble		a0, s3, _init__fake_crackSHA1_fake_hex2int__if_then
	j		_init__fake_crackSHA1_fake_hex2int__if_else_2

_init__fake_crackSHA1_fake_hex2int__if_then:
	slli	s10, s10, 4
	add		s10, s10, a0
	addi	s10, s10, -65
	addi	s10, s10, 10
	j		_init__fake_crackSHA1_fake_hex2int__for_step

_init__fake_crackSHA1_fake_hex2int__lhs_and_then:
	li		s3, 57
	ble		a0, s3, _init__fake_crackSHA1_fake_hex2int__if_then_3
	j		_init__fake_crackSHA1_fake_hex2int__if_else

_init__fake_crackSHA1_fake_hex2int__if_then_3:
	slli	s10, s10, 4
	add		s10, s10, a0
	addi	s10, s10, -48
	j		_init__fake_crackSHA1_fake_hex2int__for_step

_init__fake_crackSHA1__for_body:
	slli	s5, s8, 2
	addi	s5, s5, 4
	add		s5, s5, s1
	li		s10, 0
	sw		s10, 0(s5)
	addi	s8, s8, 1
	j		_init__fake_crackSHA1__for_cond

_init__fake_crackSHA1__if_then:
	la		a0, __str_const_5
	call	__builtin_println
	j		_init__fake_main__while_body

_init___array_loop_body:
	li		a0, 324
	call	malloc
	li		s2, 80
	sw		s2, 0(a0)
	sw		a0, 0(s8)
	addi	s8, s8, 4
	j		_init___array_loop_cond


