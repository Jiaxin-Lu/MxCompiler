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

	.globl	hex2int
	.p2align	2
	.type	hex2int, @function
hex2int:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s2, 8(sp)
	sw		s3, 4(sp)
	sw		s6, 0(sp)
	mv		s6, a0
	li		s3, 0
	li		s2, 0
	mv		a3, s3
	mv		a3, s2
	j		hex2int__for_cond

hex2int__for_cond:
	mv		a0, s6
	call	__builtin_string_length
	blt		s2, a0, hex2int__for_body
	j		hex2int__for_merge

hex2int__for_merge:
	mv		a0, s3
	j		hex2int_exit

hex2int_exit:
	lw		s6, 0(sp)
	lw		s3, 4(sp)
	lw		s2, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

hex2int__for_body:
	mv		a0, s6
	mv		a1, s2
	call	__builtin_string_ord
	li		a3, 48
	bge		a0, a3, hex2int__lhs_and_then_3
	j		hex2int__if_else

hex2int__if_else:
	li		a3, 65
	bge		a0, a3, hex2int__lhs_and_then_2
	j		hex2int__if_else_2

hex2int__if_else_2:
	li		a3, 97
	bge		a0, a3, hex2int__lhs_and_then
	j		hex2int__if_else_3

hex2int__if_else_3:
	li		a0, 0
	j		hex2int_exit

hex2int__lhs_and_then:
	li		a3, 102
	ble		a0, a3, hex2int__if_then
	j		hex2int__if_else_3

hex2int__if_then:
	li		a3, 16
	mul		s3, s3, a3
	add		s3, s3, a0
	addi	s3, s3, -97
	addi	s3, s3, 10
	j		hex2int__for_step

hex2int__for_step:
	addi	s2, s2, 1
	mv		a3, s3
	mv		a3, s2
	j		hex2int__for_cond

hex2int__lhs_and_then_2:
	li		a3, 70
	ble		a0, a3, hex2int__if_then_2
	j		hex2int__if_else_2

hex2int__if_then_2:
	li		a3, 16
	mul		s3, s3, a3
	add		s3, s3, a0
	addi	s3, s3, -65
	addi	s3, s3, 10
	j		hex2int__for_step

hex2int__lhs_and_then_3:
	li		a3, 57
	ble		a0, a3, hex2int__if_then_3
	j		hex2int__if_else

hex2int__if_then_3:
	li		a3, 16
	mul		s3, s3, a3
	add		s3, s3, a0
	addi	s3, s3, -48
	j		hex2int__for_step


	.globl	int2chr
	.p2align	2
	.type	int2chr, @function
int2chr:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	lui		a3, %hi(asciiTable)
	lw		a3, %lo(asciiTable)(a3)
	li		t3, 32
	bge		a0, t3, int2chr__lhs_and_then
	j		int2chr__if_merge

int2chr__lhs_and_then:
	li		t3, 126
	ble		a0, t3, int2chr__if_then
	j		int2chr__if_merge

int2chr__if_merge:
	la		a0, __str_const_1
	j		int2chr_exit

int2chr_exit:
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

int2chr__if_then:
	addi	a1, a0, -32
	addi	a2, a0, -31
	mv		a0, a3
	call	__builtin_string_substring
	j		int2chr_exit


	.globl	toStringHex
	.p2align	2
	.type	toStringHex, @function
toStringHex:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s2, 8(sp)
	sw		s5, 4(sp)
	sw		s9, 0(sp)
	mv		s2, a0
	la		s9, __str_const_2
	li		s5, 28
	mv		a3, s5
	mv		a3, s9
	j		toStringHex__for_cond

toStringHex__for_cond:
	li		a3, 0
	bge		s5, a3, toStringHex__for_body
	j		toStringHex__for_merge

toStringHex__for_body:
	sra		a3, s2, s5
	andi	a3, a3, 15
	li		t3, 10
	blt		a3, t3, toStringHex__if_then
	j		toStringHex__if_else

toStringHex__if_else:
	addi	a3, a3, 65
	addi	a0, a3, -10
	call	int2chr
	mv		a1, a0
	mv		a0, s9
	call	__builtin_string_add
	mv		s9, a0
	j		toStringHex__for_step

toStringHex__for_step:
	addi	s5, s5, -4
	mv		a3, s5
	mv		a3, s9
	j		toStringHex__for_cond

toStringHex__if_then:
	addi	a0, a3, 48
	call	int2chr
	mv		a1, a0
	mv		a0, s9
	call	__builtin_string_add
	mv		s9, a0
	j		toStringHex__for_step

toStringHex__for_merge:
	mv		a0, s9
	lw		s9, 0(sp)
	lw		s5, 4(sp)
	lw		s2, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


	.globl	rotate_left
	.p2align	2
	.type	rotate_left, @function
rotate_left:
	li		a3, 1
	beq		a1, a3, rotate_left__if_then
	j		rotate_left__if_merge

rotate_left__if_then:
	li		a3, 2147483647
	and		a3, a0, a3
	slli	a3, a3, 1
	srai	t3, a0, 31
	andi	t3, t3, 1
	or		a0, a3, t3
	j		rotate_left_exit

rotate_left_exit:
	jr		ra

rotate_left__if_merge:
	li		a3, 31
	beq		a1, a3, rotate_left__if_then_2
	j		rotate_left__if_merge_2

rotate_left__if_merge_2:
	li		a3, 32
	sub		t3, a3, a1
	li		a3, 1
	sll		a3, a3, t3
	addi	a3, a3, -1
	and		a3, a0, a3
	sll		t5, a3, a1
	sra		a3, a0, t3
	li		t3, 1
	sll		t3, t3, a1
	addi	t3, t3, -1
	and		a3, a3, t3
	or		a0, t5, a3
	j		rotate_left_exit

rotate_left__if_then_2:
	andi	a3, a0, 1
	slli	t3, a3, 31
	srai	a3, a0, 1
	li		t5, 2147483647
	and		a3, a3, t5
	or		a0, t3, a3
	j		rotate_left_exit


	.globl	add
	.p2align	2
	.type	add, @function
add:
	li		a3, 65535
	and		t3, a0, a3
	li		a3, 65535
	and		a3, a1, a3
	add		t5, t3, a3
	srai	t3, a0, 16
	li		a3, 65535
	and		a2, t3, a3
	srai	t3, a1, 16
	li		a3, 65535
	and		a3, t3, a3
	add		a3, a2, a3
	srai	t3, t5, 16
	add		t3, a3, t3
	li		a3, 65535
	and		a3, t3, a3
	slli	t3, a3, 16
	li		a3, 65535
	and		a3, t5, a3
	or		a0, t3, a3
	jr		ra


	.globl	lohi
	.p2align	2
	.type	lohi, @function
lohi:
	slli	a3, a1, 16
	or		a0, a0, a3
	jr		ra


	.globl	sha1
	.p2align	2
	.type	sha1, @function
sha1:
	addi	sp, sp, -80
	sw		ra, 76(sp)
	sw		s0, 72(sp)
	sw		s1, 68(sp)
	sw		s2, 64(sp)
	sw		s3, 60(sp)
	sw		s4, 56(sp)
	sw		s5, 52(sp)
	sw		s6, 48(sp)
	sw		s7, 44(sp)
	sw		s8, 40(sp)
	sw		s9, 36(sp)
	sw		s10, 32(sp)
	sw		s11, 28(sp)
	lui		s11, %hi(chunks)
	lw		s6, %lo(chunks)(s11)
	lui		s11, %hi(outputBuffer)
	lw		s11, %lo(outputBuffer)(s11)
	sw		s11, 24(sp)
	lui		s11, %hi(MAXCHUNK)
	lw		s10, %lo(MAXCHUNK)(s11)
	addi	s11, a1, 64
	addi	s3, s11, -56
	li		s11, 64
	div		s11, s3, s11
	addi	s11, s11, 1
	sw		s11, 20(sp)
	bgt		s11, s10, sha1__if_then
	j		sha1__if_merge

sha1__if_then:
	la		a0, __str_const_3
	call	__builtin_println
	li		a0, 0
	j		sha1_exit

sha1_exit:
	lw		s11, 28(sp)
	lw		s10, 32(sp)
	lw		s9, 36(sp)
	lw		s8, 40(sp)
	lw		s7, 44(sp)
	lw		s6, 48(sp)
	lw		s5, 52(sp)
	lw		s4, 56(sp)
	lw		s3, 60(sp)
	lw		s2, 64(sp)
	lw		s1, 68(sp)
	lw		s0, 72(sp)
	lw		ra, 76(sp)
	addi	sp, sp, 80
	jr		ra

sha1__if_merge:
	li		s11, 0
	j		sha1__for_cond

sha1__for_cond:
	lw		s3, 20(sp)
	blt		s11, s3, sha1__for_body
	j		sha1__for_merge

sha1__for_body:
	li		s3, 0
	j		sha1__for_cond_2

sha1__for_cond_2:
	li		s10, 80
	blt		s3, s10, sha1__for_body_2
	j		sha1__for_step_2

sha1__for_body_2:
	li		s10, 4
	mul		s10, s11, s10
	addi	s10, s10, 4
	add		s10, s10, s6
	lw		s1, 0(s10)
	li		s10, 4
	mul		s10, s3, s10
	addi	s10, s10, 4
	add		s10, s10, s1
	li		s1, 0
	sw		s1, 0(s10)
	j		sha1__for_step

sha1__for_step:
	addi	s3, s3, 1
	j		sha1__for_cond_2

sha1__for_step_2:
	addi	s11, s11, 1
	j		sha1__for_cond

sha1__for_merge:
	li		s11, 0
	j		sha1__for_cond_3

sha1__for_cond_3:
	blt		s11, a1, sha1__for_body_3
	j		sha1__for_merge_2

sha1__for_body_3:
	li		s3, 64
	div		s3, s11, s3
	li		s10, 4
	mul		s3, s3, s10
	addi	s3, s3, 4
	add		s5, s3, s6
	li		s3, 64
	rem		s10, s11, s3
	li		s3, 4
	div		s1, s10, s3
	lw		s10, 0(s5)
	li		s3, 4
	mul		s3, s1, s3
	addi	s4, s3, 4
	add		s1, s4, s10
	lw		s3, 0(s5)
	add		s4, s4, s3
	li		s3, 4
	mul		s3, s11, s3
	addi	s3, s3, 4
	add		s3, s3, a0
	li		s10, 4
	rem		s10, s11, s10
	li		s5, 3
	sub		s5, s5, s10
	li		s10, 8
	mul		s10, s5, s10
	lw		s3, 0(s3)
	sll		s10, s3, s10
	lw		s3, 0(s4)
	or		s3, s3, s10
	sw		s3, 0(s1)
	j		sha1__for_step_3

sha1__for_step_3:
	addi	s11, s11, 1
	j		sha1__for_cond_3

sha1__for_merge_2:
	li		s3, 64
	div		s3, s11, s3
	li		s10, 4
	mul		s3, s3, s10
	addi	s3, s3, 4
	add		s3, s3, s6
	li		s10, 64
	rem		s1, s11, s10
	li		s10, 4
	div		s1, s1, s10
	lw		s5, 0(s3)
	li		s10, 4
	mul		s10, s1, s10
	addi	s1, s10, 4
	add		s10, s1, s5
	lw		s3, 0(s3)
	add		s1, s1, s3
	li		s3, 4
	rem		s11, s11, s3
	li		s3, 3
	sub		s11, s3, s11
	li		s3, 8
	mul		s11, s11, s3
	li		s3, 128
	sll		s11, s3, s11
	lw		s3, 0(s1)
	or		s11, s3, s11
	sw		s11, 0(s10)
	lw		s11, 20(sp)
	addi	s3, s11, -1
	li		s11, 4
	mul		s11, s3, s11
	addi	s11, s11, 4
	add		s10, s11, s6
	lw		s11, 0(s10)
	li		s1, 15
	li		s3, 4
	mul		s3, s1, s3
	addi	s3, s3, 4
	add		s3, s3, s11
	slli	s11, a1, 3
	sw		s11, 0(s3)
	lw		s3, 0(s10)
	li		s11, 14
	li		s10, 4
	mul		s11, s11, s10
	addi	s11, s11, 4
	add		s3, s11, s3
	srai	s11, a1, 29
	andi	s11, s11, 7
	sw		s11, 0(s3)
	li		s11, 1732584193
	li		a0, 43913
	li		a1, 61389
	call	lohi
	mv		s3, a0
	li		a0, 56574
	li		a1, 39098
	call	lohi
	mv		s2, a0
	li		s10, 271733878
	li		a0, 57840
	li		a1, 50130
	call	lohi
	li		s1, 0
	sw		s10, 16(sp)
	mv		s0, a0
	sw		s3, 12(sp)
	sw		s11, 8(sp)
	mv		s11, s1
	mv		s11, s2
	lw		s11, 16(sp)
	lw		s11, 16(sp)
	sw		s11, 16(sp)
	mv		s11, s0
	lw		s11, 12(sp)
	lw		s11, 12(sp)
	sw		s11, 12(sp)
	lw		s11, 8(sp)
	j		sha1__for_cond_4

sha1__for_cond_4:
	lw		s11, 20(sp)
	blt		s1, s11, sha1__for_body_4
	j		sha1__for_merge_3

sha1__for_merge_3:
	li		s3, 0
	li		s11, 4
	mul		s11, s3, s11
	addi	s11, s11, 4
	lw		s3, 24(sp)
	add		s3, s11, s3
	lw		s11, 8(sp)
	sw		s11, 0(s3)
	li		s11, 1
	li		s3, 4
	mul		s11, s11, s3
	addi	s3, s11, 4
	lw		s11, 24(sp)
	add		s11, s3, s11
	lw		s3, 12(sp)
	sw		s3, 0(s11)
	li		s3, 2
	li		s11, 4
	mul		s11, s3, s11
	addi	s3, s11, 4
	lw		s11, 24(sp)
	add		s11, s3, s11
	sw		s2, 0(s11)
	li		s3, 3
	li		s11, 4
	mul		s11, s3, s11
	addi	s3, s11, 4
	lw		s11, 24(sp)
	add		s11, s3, s11
	lw		s3, 16(sp)
	sw		s3, 0(s11)
	li		s11, 4
	li		s3, 4
	mul		s11, s11, s3
	addi	s11, s11, 4
	lw		s3, 24(sp)
	add		s11, s11, s3
	sw		s0, 0(s11)
	lw		a0, 24(sp)
	j		sha1_exit

sha1__for_body_4:
	li		s11, 16
	j		sha1__for_cond_5

sha1__for_cond_5:
	li		s3, 80
	blt		s11, s3, sha1__for_body_6
	j		sha1__for_merge_4

sha1__for_merge_4:
	lw		s9, 8(sp)
	lw		s5, 12(sp)
	lw		s4, 16(sp)
	mv		s11, s0
	li		s8, 0
	mv		s10, s2
	mv		s3, s10
	mv		s3, s11
	mv		s3, s5
	mv		s3, s9
	mv		s3, s4
	mv		s3, s8
	j		sha1__for_cond_6

sha1__for_cond_6:
	li		s3, 80
	blt		s8, s3, sha1__for_body_5
	j		sha1__for_merge_5

sha1__for_body_5:
	li		s3, 20
	blt		s8, s3, sha1__if_then_4
	j		sha1__if_else

sha1__if_else:
	li		s3, 40
	blt		s8, s3, sha1__if_then_2
	j		sha1__if_else_2

sha1__if_then_2:
	xor		s3, s5, s10
	xor		s3, s3, s4
	li		s7, 1859775393
	mv		a3, s7
	mv		a3, s3
	j		sha1__if_merge_2

sha1__if_merge_2:
	mv		a0, s9
	li		a1, 5
	call	rotate_left
	mv		a1, s11
	call	add
	mv		s11, a0
	mv		a0, s3
	mv		a1, s7
	call	add
	mv		a1, a0
	mv		a0, s11
	call	add
	li		s11, 4
	mul		s11, s1, s11
	addi	s11, s11, 4
	add		s11, s11, s6
	lw		s3, 0(s11)
	li		s11, 4
	mul		s11, s8, s11
	addi	s11, s11, 4
	add		s11, s11, s3
	lw		a1, 0(s11)
	call	add
	mv		s3, a0
	mv		s11, s4
	mv		s4, s10
	mv		a0, s5
	li		a1, 30
	call	rotate_left
	mv		s5, s9
	mv		s9, s3
	j		sha1__for_step_4

sha1__for_step_4:
	addi	s8, s8, 1
	mv		s10, a0
	mv		s3, s10
	mv		s3, s11
	mv		s3, s5
	mv		s3, s9
	mv		s3, s4
	mv		s3, s8
	j		sha1__for_cond_6

sha1__if_else_2:
	li		s3, 60
	blt		s8, s3, sha1__if_then_3
	j		sha1__if_else_3

sha1__if_then_3:
	and		s7, s5, s10
	and		s3, s5, s4
	or		s7, s7, s3
	and		s3, s10, s4
	or		s3, s7, s3
	li		a0, 48348
	li		a1, 36635
	call	lohi
	mv		s7, a0
	mv		a3, s7
	mv		a3, s3
	j		sha1__if_merge_2

sha1__if_else_3:
	xor		s3, s5, s10
	xor		s3, s3, s4
	li		a0, 49622
	li		a1, 51810
	call	lohi
	mv		s7, a0
	mv		a3, s7
	mv		a3, s3
	j		sha1__if_merge_2

sha1__if_then_4:
	and		s3, s5, s10
	xori	s7, s5, -1
	and		s7, s7, s4
	or		s3, s3, s7
	li		s7, 1518500249
	mv		a3, s7
	mv		a3, s3
	j		sha1__if_merge_2

sha1__for_merge_5:
	lw		a0, 8(sp)
	mv		a1, s9
	call	add
	mv		s3, a0
	lw		a0, 12(sp)
	mv		a1, s5
	call	add
	mv		s5, a0
	mv		a0, s2
	mv		a1, s10
	call	add
	mv		s2, a0
	lw		a0, 16(sp)
	mv		a1, s4
	call	add
	mv		s10, a0
	mv		a0, s0
	mv		a1, s11
	call	add
	j		sha1__for_step_5

sha1__for_step_5:
	addi	s1, s1, 1
	sw		s10, 16(sp)
	mv		s0, a0
	sw		s5, 12(sp)
	sw		s3, 8(sp)
	mv		s11, s1
	mv		s11, s2
	lw		s11, 16(sp)
	lw		s11, 16(sp)
	sw		s11, 16(sp)
	mv		s11, s0
	lw		s11, 12(sp)
	lw		s11, 12(sp)
	sw		s11, 12(sp)
	lw		s11, 8(sp)
	j		sha1__for_cond_4

sha1__for_body_6:
	li		s3, 4
	mul		s3, s1, s3
	addi	s3, s3, 4
	add		s4, s3, s6
	lw		s10, 0(s4)
	li		s3, 4
	mul		s3, s11, s3
	addi	s3, s3, 4
	add		s10, s3, s10
	addi	s5, s11, -3
	lw		s8, 0(s4)
	li		s3, 4
	mul		s3, s5, s3
	addi	s3, s3, 4
	add		s5, s3, s8
	addi	s3, s11, -8
	lw		s8, 0(s4)
	li		s9, 4
	mul		s3, s3, s9
	addi	s3, s3, 4
	add		s3, s3, s8
	lw		s5, 0(s5)
	lw		s3, 0(s3)
	xor		s9, s5, s3
	addi	s8, s11, -14
	lw		s5, 0(s4)
	li		s3, 4
	mul		s3, s8, s3
	addi	s3, s3, 4
	add		s3, s3, s5
	lw		s3, 0(s3)
	xor		s8, s9, s3
	addi	s3, s11, -16
	lw		s4, 0(s4)
	li		s5, 4
	mul		s3, s3, s5
	addi	s3, s3, 4
	add		s3, s3, s4
	lw		s3, 0(s3)
	xor		a0, s8, s3
	li		a1, 1
	call	rotate_left
	sw		a0, 0(s10)
	j		sha1__for_step_6

sha1__for_step_6:
	addi	s11, s11, 1
	j		sha1__for_cond_5


	.globl	computeSHA1
	.p2align	2
	.type	computeSHA1, @function
computeSHA1:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s1, 24(sp)
	sw		s5, 20(sp)
	sw		s7, 16(sp)
	sw		s8, 12(sp)
	mv		s5, a0
	lui		s1, %hi(inputBuffer)
	lw		s8, %lo(inputBuffer)(s1)
	li		s1, 0
	j		computeSHA1__for_cond

computeSHA1__for_cond:
	mv		a0, s5
	call	__builtin_string_length
	blt		s1, a0, computeSHA1__for_body
	j		computeSHA1__for_merge

computeSHA1__for_body:
	li		s7, 4
	mul		s7, s1, s7
	addi	s7, s7, 4
	add		s7, s7, s8
	mv		a0, s5
	mv		a1, s1
	call	__builtin_string_ord
	sw		a0, 0(s7)
	j		computeSHA1__for_step

computeSHA1__for_step:
	addi	s1, s1, 1
	j		computeSHA1__for_cond

computeSHA1__for_merge:
	mv		a0, s5
	call	__builtin_string_length
	mv		a1, a0
	mv		a0, s8
	call	sha1
	mv		s5, a0
	li		s1, 0
	j		computeSHA1__for_cond_2

computeSHA1__for_cond_2:
	lw		s8, 0(s5)
	blt		s1, s8, computeSHA1__for_body_2
	j		computeSHA1__for_merge_2

computeSHA1__for_body_2:
	li		s8, 4
	mul		s8, s1, s8
	addi	s8, s8, 4
	add		s8, s8, s5
	lw		a0, 0(s8)
	call	toStringHex
	call	__builtin_print
	j		computeSHA1__for_step_2

computeSHA1__for_step_2:
	addi	s1, s1, 1
	j		computeSHA1__for_cond_2

computeSHA1__for_merge_2:
	la		a0, __str_const_4
	call	__builtin_println
	lw		s8, 12(sp)
	lw		s7, 16(sp)
	lw		s5, 20(sp)
	lw		s1, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra


	.globl	nextLetter
	.p2align	2
	.type	nextLetter, @function
nextLetter:
	li		a3, 122
	beq		a0, a3, nextLetter__if_then
	j		nextLetter__if_merge

nextLetter__if_then:
	li		a3, 1
	sub		a0, zero, a3
	j		nextLetter_exit

nextLetter_exit:
	jr		ra

nextLetter__if_merge:
	li		a3, 90
	beq		a0, a3, nextLetter__if_then_2
	j		nextLetter__if_merge_2

nextLetter__if_then_2:
	li		a0, 97
	j		nextLetter_exit

nextLetter__if_merge_2:
	li		a3, 57
	beq		a0, a3, nextLetter__if_then_3
	j		nextLetter__if_merge_3

nextLetter__if_then_3:
	li		a0, 65
	j		nextLetter_exit

nextLetter__if_merge_3:
	addi	a0, a0, 1
	j		nextLetter_exit


	.globl	nextText
	.p2align	2
	.type	nextText, @function
nextText:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s1, 8(sp)
	sw		s3, 4(sp)
	sw		s10, 0(sp)
	mv		s1, a0
	addi	s3, a1, -1
	mv		s10, s3
	mv		s3, s10
	j		nextText__for_cond

nextText__for_cond:
	li		s3, 0
	bge		s10, s3, nextText__for_body
	j		nextText__for_merge

nextText__for_body:
	li		s3, 4
	mul		s3, s10, s3
	addi	s3, s3, 4
	add		s3, s3, s1
	lw		a0, 0(s3)
	call	nextLetter
	sw		a0, 0(s3)
	li		a3, 1
	sub		t3, zero, a3
	lw		a3, 0(s3)
	beq		a3, t3, nextText__if_then
	j		nextText__if_else

nextText__if_else:
	li		a0, 1
	j		nextText_exit

nextText_exit:
	lw		s10, 0(sp)
	lw		s3, 4(sp)
	lw		s1, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

nextText__if_then:
	li		a3, 48
	sw		a3, 0(s3)
	j		nextText__for_step

nextText__for_step:
	addi	s3, s10, -1
	mv		s10, s3
	mv		s3, s10
	j		nextText__for_cond

nextText__for_merge:
	li		a0, 0
	j		nextText_exit


	.globl	array_equal
	.p2align	2
	.type	array_equal, @function
array_equal:
	lw		a3, 0(a0)
	lw		t3, 0(a1)
	bne		a3, t3, array_equal__if_then
	j		array_equal__if_merge

array_equal__if_then:
	li		a0, 0
	j		array_equal_exit

array_equal_exit:
	jr		ra

array_equal__if_merge:
	li		a3, 0
	j		array_equal__for_cond

array_equal__for_cond:
	lw		t3, 0(a0)
	blt		a3, t3, array_equal__for_body
	j		array_equal__for_merge

array_equal__for_body:
	li		t3, 4
	mul		t3, a3, t3
	addi	t3, t3, 4
	add		t5, t3, a0
	add		t3, t3, a1
	lw		t5, 0(t5)
	lw		t3, 0(t3)
	bne		t5, t3, array_equal__if_then_2
	j		array_equal__for_step

array_equal__for_step:
	addi	a3, a3, 1
	j		array_equal__for_cond

array_equal__if_then_2:
	li		a0, 0
	j		array_equal_exit

array_equal__for_merge:
	li		a0, 1
	j		array_equal_exit


	.globl	crackSHA1
	.p2align	2
	.type	crackSHA1, @function
crackSHA1:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s0, 24(sp)
	sw		s3, 20(sp)
	sw		s6, 16(sp)
	sw		s8, 12(sp)
	sw		s10, 8(sp)
	sw		s11, 4(sp)
	mv		s6, a0
	lui		s11, %hi(inputBuffer)
	lw		s3, %lo(inputBuffer)(s11)
	li		a0, 24
	call	malloc
	mv		s11, a0
	li		s10, 5
	sw		s10, 0(s11)
	mv		a0, s6
	call	__builtin_string_length
	li		s10, 40
	bne		a0, s10, crackSHA1__if_then
	j		crackSHA1__if_merge

crackSHA1__if_then:
	la		a0, __str_const_5
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1_exit:
	lw		s11, 4(sp)
	lw		s10, 8(sp)
	lw		s8, 12(sp)
	lw		s6, 16(sp)
	lw		s3, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

crackSHA1__if_merge:
	li		s10, 0
	j		crackSHA1__for_cond

crackSHA1__for_cond:
	li		s8, 5
	blt		s10, s8, crackSHA1__for_body_5
	j		crackSHA1__for_merge

crackSHA1__for_merge:
	li		s10, 0
	mv		s8, s10
	mv		s10, s8
	j		crackSHA1__for_cond_2

crackSHA1__for_cond_2:
	li		s10, 40
	blt		s8, s10, crackSHA1__for_body
	j		crackSHA1__for_merge_2

crackSHA1__for_body:
	li		s10, 8
	div		s10, s8, s10
	li		s0, 4
	mul		s10, s10, s0
	addi	s10, s10, 4
	add		s10, s10, s11
	addi	s0, s8, 4
	mv		a0, s6
	mv		a1, s8
	mv		a2, s0
	call	__builtin_string_substring
	call	hex2int
	li		a3, 4
	div		s8, s8, a3
	li		a3, 2
	rem		a3, s8, a3
	li		s8, 1
	sub		s8, s8, a3
	li		a3, 16
	mul		s8, s8, a3
	sll		a3, a0, s8
	lw		s8, 0(s10)
	or		s8, s8, a3
	sw		s8, 0(s10)
	j		crackSHA1__for_step

crackSHA1__for_step:
	mv		s10, s0
	mv		s8, s10
	mv		s10, s8
	j		crackSHA1__for_cond_2

crackSHA1__for_merge_2:
	li		s10, 1
	j		crackSHA1__for_cond_3

crackSHA1__for_cond_3:
	li		s6, 4
	ble		s10, s6, crackSHA1__for_body_2
	j		crackSHA1__for_merge_3

crackSHA1__for_merge_3:
	la		a0, __str_const_7
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__for_body_2:
	li		s6, 0
	j		crackSHA1__for_cond_4

crackSHA1__for_cond_4:
	blt		s6, s10, crackSHA1__for_body_4
	j		crackSHA1__while_body

crackSHA1__while_body:
	mv		a0, s3
	mv		a1, s10
	call	sha1
	mv		a1, s11
	call	array_equal
	bne		a0, zero, crackSHA1__if_then_2
	j		crackSHA1__if_merge_2

crackSHA1__if_then_2:
	li		s11, 0
	j		crackSHA1__for_cond_5

crackSHA1__for_cond_5:
	blt		s11, s10, crackSHA1__for_body_3
	j		crackSHA1__for_merge_4

crackSHA1__for_merge_4:
	la		a0, __str_const_6
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__for_body_3:
	li		s6, 4
	mul		s6, s11, s6
	addi	s6, s6, 4
	add		s6, s6, s3
	lw		a0, 0(s6)
	call	int2chr
	call	__builtin_print
	j		crackSHA1__for_step_2

crackSHA1__for_step_2:
	addi	s11, s11, 1
	j		crackSHA1__for_cond_5

crackSHA1__if_merge_2:
	mv		a0, s3
	mv		a1, s10
	call	nextText
	bne		a0, zero, crackSHA1__while_body
	j		crackSHA1__for_step_3

crackSHA1__for_step_3:
	addi	s10, s10, 1
	j		crackSHA1__for_cond_3

crackSHA1__for_body_4:
	li		s8, 4
	mul		s8, s6, s8
	addi	s8, s8, 4
	add		s8, s8, s3
	li		s0, 48
	sw		s0, 0(s8)
	j		crackSHA1__for_step_4

crackSHA1__for_step_4:
	addi	s6, s6, 1
	j		crackSHA1__for_cond_4

crackSHA1__for_body_5:
	li		s8, 4
	mul		s8, s10, s8
	addi	s8, s8, 4
	add		s8, s8, s11
	li		s0, 0
	sw		s0, 0(s8)
	j		crackSHA1__for_step_5

crackSHA1__for_step_5:
	addi	s10, s10, 1
	j		crackSHA1__for_cond


	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	j		main__while_body

main__while_body:
	call	__builtin_getInt
	li		a3, 0
	beq		a0, a3, main__while_merge
	j		main__if_merge

main__while_merge:
	li		a0, 0
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

main__if_merge:
	li		a3, 1
	beq		a0, a3, main__if_then_2
	j		main__if_else

main__if_else:
	li		a3, 2
	beq		a0, a3, main__if_then
	j		main__while_body

main__if_then:
	call	__builtin_getString
	call	crackSHA1
	j		main__while_body

main__if_then_2:
	call	__builtin_getString
	call	computeSHA1
	j		main__while_body


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s1, 8(sp)
	sw		s6, 4(sp)
	sw		s11, 0(sp)
	lui		s11, %hi(chunks)
	lw		s11, %lo(chunks)(s11)
	lui		s11, %hi(asciiTable)
	lw		s11, %lo(asciiTable)(s11)
	lui		s11, %hi(outputBuffer)
	lw		s11, %lo(outputBuffer)(s11)
	lui		s11, %hi(inputBuffer)
	lw		s11, %lo(inputBuffer)(s11)
	lui		s11, %hi(MAXLENGTH)
	lw		s11, %lo(MAXLENGTH)(s11)
	lui		s11, %hi(MAXCHUNK)
	lw		s11, %lo(MAXCHUNK)(s11)
	li		a0, 404
	call	malloc
	mv		s11, a0
	li		s1, 100
	sw		s1, 0(s11)
	addi	s6, s11, 4
	addi	s1, s11, 404
	j		_init___array_loop_cond

_init___array_loop_cond:
	blt		s6, s1, _init___array_loop_body
	j		_init___array_loop_merge

_init___array_loop_body:
	li		a0, 324
	call	malloc
	li		a3, 80
	sw		a3, 0(a0)
	sw		a0, 0(s6)
	j		_init___array_loop_step

_init___array_loop_step:
	addi	s6, s6, 4
	j		_init___array_loop_cond

_init___array_loop_merge:
	li		a0, 25284
	call	malloc
	mv		s1, a0
	li		s6, 6320
	sw		s6, 0(s1)
	li		a0, 24
	call	malloc
	li		s6, 5
	sw		s6, 0(a0)
	lui		s6, %hi(MAXCHUNK)
	li		a3, 100
	sw		a3, %lo(MAXCHUNK)(s6)
	lui		s6, %hi(inputBuffer)
	sw		s1, %lo(inputBuffer)(s6)
	lui		s1, %hi(outputBuffer)
	sw		a0, %lo(outputBuffer)(s1)
	lui		s6, %hi(asciiTable)
	la		s1, __str_const_9
	sw		s1, %lo(asciiTable)(s6)
	lui		s1, %hi(chunks)
	sw		s11, %lo(chunks)(s1)
	call	_main
	lw		s11, 0(sp)
	lw		s6, 4(sp)
	lw		s1, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra


