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
	sw		s3, 8(sp)
	sw		s6, 4(sp)
	sw		s8, 0(sp)
	mv		s6, a0
	li		s8, 0
	li		s3, 0
	j		hex2int__for_cond

hex2int__for_cond:
	mv		a0, s6
	call	__builtin_string_length
	blt		s3, a0, hex2int__for_body
	j		hex2int__for_merge

hex2int__for_merge:
	mv		a0, s8
	j		hex2int_exit

hex2int_exit:
	lw		s8, 0(sp)
	lw		s6, 4(sp)
	lw		s3, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

hex2int__for_body:
	mv		a0, s6
	mv		a1, s3
	call	__builtin_string_ord
	li		a7, 48
	bge		a0, a7, hex2int__lhs_and_then_3
	j		hex2int__if_else

hex2int__if_else:
	li		a7, 65
	bge		a0, a7, hex2int__lhs_and_then
	j		hex2int__if_else_2

hex2int__lhs_and_then:
	li		a7, 70
	ble		a0, a7, hex2int__if_then
	j		hex2int__if_else_2

hex2int__if_then:
	li		a7, 16
	mul		s8, s8, a7
	add		s8, s8, a0
	addi	s8, s8, -65
	addi	s8, s8, 10
	j		hex2int__for_step

hex2int__for_step:
	addi	s3, s3, 1
	j		hex2int__for_cond

hex2int__if_else_2:
	li		a7, 97
	bge		a0, a7, hex2int__lhs_and_then_2
	j		hex2int__if_else_3

hex2int__lhs_and_then_2:
	li		a7, 102
	ble		a0, a7, hex2int__if_then_2
	j		hex2int__if_else_3

hex2int__if_then_2:
	li		a7, 16
	mul		s8, s8, a7
	add		s8, s8, a0
	addi	s8, s8, -97
	addi	s8, s8, 10
	j		hex2int__for_step

hex2int__if_else_3:
	li		a0, 0
	j		hex2int_exit

hex2int__lhs_and_then_3:
	li		a7, 57
	ble		a0, a7, hex2int__if_then_3
	j		hex2int__if_else

hex2int__if_then_3:
	li		a7, 16
	mul		s8, s8, a7
	add		s8, s8, a0
	addi	s8, s8, -48
	j		hex2int__for_step


	.globl	int2chr
	.p2align	2
	.type	int2chr, @function
int2chr:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	lui		a7, %hi(asciiTable)
	lw		a7, %lo(asciiTable)(a7)
	li		t1, 32
	bge		a0, t1, int2chr__lhs_and_then
	j		int2chr__if_merge

int2chr__lhs_and_then:
	li		t1, 126
	ble		a0, t1, int2chr__if_then
	j		int2chr__if_merge

int2chr__if_then:
	addi	a1, a0, -32
	addi	a2, a0, -31
	mv		a0, a7
	call	__builtin_string_substring
	j		int2chr_exit

int2chr_exit:
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

int2chr__if_merge:
	la		a0, __str_const_1
	j		int2chr_exit


	.globl	toStringHex
	.p2align	2
	.type	toStringHex, @function
toStringHex:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s7, 8(sp)
	sw		s9, 4(sp)
	sw		s10, 0(sp)
	mv		s10, a0
	la		s7, __str_const_2
	li		s9, 28
	j		toStringHex__for_cond

toStringHex__for_cond:
	li		a7, 0
	bge		s9, a7, toStringHex__for_body
	j		toStringHex__for_merge

toStringHex__for_merge:
	mv		a0, s7
	lw		s10, 0(sp)
	lw		s9, 4(sp)
	lw		s7, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

toStringHex__for_body:
	sra		a7, s10, s9
	andi	a7, a7, 15
	li		t1, 10
	blt		a7, t1, toStringHex__if_then
	j		toStringHex__if_else

toStringHex__if_else:
	addi	a7, a7, 65
	addi	a0, a7, -10
	call	int2chr
	mv		a1, a0
	mv		a0, s7
	call	__builtin_string_add
	mv		s7, a0
	j		toStringHex__for_step

toStringHex__for_step:
	addi	s9, s9, -4
	j		toStringHex__for_cond

toStringHex__if_then:
	addi	a0, a7, 48
	call	int2chr
	mv		a1, a0
	mv		a0, s7
	call	__builtin_string_add
	mv		s7, a0
	j		toStringHex__for_step


	.globl	rotate_left
	.p2align	2
	.type	rotate_left, @function
rotate_left:
	li		a7, 1
	beq		a1, a7, rotate_left__if_then
	j		rotate_left__if_merge

rotate_left__if_then:
	li		a7, 2147483647
	and		a7, a0, a7
	slli	a7, a7, 1
	srai	t1, a0, 31
	andi	t1, t1, 1
	or		a0, a7, t1
	j		rotate_left_exit

rotate_left_exit:
	jr		ra

rotate_left__if_merge:
	li		a7, 31
	beq		a1, a7, rotate_left__if_then_2
	j		rotate_left__if_merge_2

rotate_left__if_merge_2:
	li		a7, 32
	sub		t1, a7, a1
	li		a7, 1
	sll		a7, a7, t1
	addi	a7, a7, -1
	and		a7, a0, a7
	sll		a3, a7, a1
	sra		a7, a0, t1
	li		t1, 1
	sll		t1, t1, a1
	addi	t1, t1, -1
	and		a7, a7, t1
	or		a0, a3, a7
	j		rotate_left_exit

rotate_left__if_then_2:
	andi	a7, a0, 1
	slli	t1, a7, 31
	srai	a7, a0, 1
	li		a3, 2147483647
	and		a7, a7, a3
	or		a0, t1, a7
	j		rotate_left_exit


	.globl	add
	.p2align	2
	.type	add, @function
add:
	li		a7, 65535
	and		t1, a0, a7
	li		a7, 65535
	and		a7, a1, a7
	add		a3, t1, a7
	srai	a7, a0, 16
	li		t1, 65535
	and		a2, a7, t1
	srai	t1, a1, 16
	li		a7, 65535
	and		a7, t1, a7
	add		a7, a2, a7
	srai	t1, a3, 16
	add		t1, a7, t1
	li		a7, 65535
	and		a7, t1, a7
	slli	a7, a7, 16
	li		t1, 65535
	and		t1, a3, t1
	or		a0, a7, t1
	jr		ra


	.globl	lohi
	.p2align	2
	.type	lohi, @function
lohi:
	slli	a7, a1, 16
	or		a0, a0, a7
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
	lui		s5, %hi(chunks)
	lw		s7, %lo(chunks)(s5)
	lui		s5, %hi(MAXCHUNK)
	lw		s10, %lo(MAXCHUNK)(s5)
	lui		s5, %hi(outputBuffer)
	lw		s5, %lo(outputBuffer)(s5)
	sw		s5, 24(sp)
	addi	s5, a1, 64
	addi	s1, s5, -56
	li		s5, 64
	div		s5, s1, s5
	addi	s5, s5, 1
	sw		s5, 20(sp)
	bgt		s5, s10, sha1__if_then_4
	j		sha1__if_merge

sha1__if_merge:
	li		s10, 0
	j		sha1__for_cond

sha1__for_cond:
	lw		s5, 20(sp)
	blt		s10, s5, sha1__for_body
	j		sha1__for_merge

sha1__for_body:
	li		s5, 0
	j		sha1__for_cond_2

sha1__for_cond_2:
	li		s1, 80
	blt		s5, s1, sha1__for_body_2
	j		sha1__for_step

sha1__for_step:
	addi	s10, s10, 1
	j		sha1__for_cond

sha1__for_body_2:
	li		s1, 4
	mul		s1, s10, s1
	addi	s1, s1, 4
	add		s1, s1, s7
	lw		s9, 0(s1)
	li		s1, 4
	mul		s1, s5, s1
	addi	s1, s1, 4
	add		s9, s1, s9
	li		s1, 0
	sw		s1, 0(s9)
	j		sha1__for_step_2

sha1__for_step_2:
	addi	s5, s5, 1
	j		sha1__for_cond_2

sha1__for_merge:
	li		s5, 0
	j		sha1__for_cond_3

sha1__for_cond_3:
	blt		s5, a1, sha1__for_body_3
	j		sha1__for_merge_2

sha1__for_body_3:
	li		s10, 64
	div		s1, s5, s10
	li		s10, 4
	mul		s10, s1, s10
	addi	s10, s10, 4
	add		s10, s10, s7
	li		s1, 64
	rem		s1, s5, s1
	li		s9, 4
	div		s9, s1, s9
	lw		s3, 0(s10)
	li		s1, 4
	mul		s1, s9, s1
	addi	s9, s1, 4
	add		s1, s9, s3
	lw		s10, 0(s10)
	add		s9, s9, s10
	li		s10, 4
	mul		s10, s5, s10
	addi	s10, s10, 4
	add		s6, s10, a0
	li		s10, 4
	rem		s10, s5, s10
	li		s3, 3
	sub		s10, s3, s10
	li		s3, 8
	mul		s3, s10, s3
	lw		s10, 0(s6)
	sll		s3, s10, s3
	lw		s10, 0(s9)
	or		s10, s10, s3
	sw		s10, 0(s1)
	j		sha1__for_step_3

sha1__for_step_3:
	addi	s5, s5, 1
	j		sha1__for_cond_3

sha1__for_merge_2:
	li		s10, 64
	div		s10, s5, s10
	li		s1, 4
	mul		s10, s10, s1
	addi	s10, s10, 4
	add		s9, s10, s7
	li		s10, 64
	rem		s1, s5, s10
	li		s10, 4
	div		s10, s1, s10
	lw		s3, 0(s9)
	li		s1, 4
	mul		s10, s10, s1
	addi	s6, s10, 4
	add		s10, s6, s3
	lw		s1, 0(s9)
	add		s9, s6, s1
	li		s1, 4
	rem		s5, s5, s1
	li		s1, 3
	sub		s5, s1, s5
	li		s1, 8
	mul		s1, s5, s1
	li		s5, 128
	sll		s5, s5, s1
	lw		s1, 0(s9)
	or		s5, s1, s5
	sw		s5, 0(s10)
	lw		s5, 20(sp)
	addi	s10, s5, -1
	li		s5, 4
	mul		s5, s10, s5
	addi	s5, s5, 4
	add		s1, s5, s7
	lw		s9, 0(s1)
	li		s10, 15
	li		s5, 4
	mul		s5, s10, s5
	addi	s5, s5, 4
	add		s10, s5, s9
	slli	s5, a1, 3
	sw		s5, 0(s10)
	lw		s1, 0(s1)
	li		s10, 14
	li		s5, 4
	mul		s5, s10, s5
	addi	s5, s5, 4
	add		s10, s5, s1
	srai	s5, a1, 29
	andi	s5, s5, 7
	sw		s5, 0(s10)
	li		s11, 1732584193
	li		a0, 43913
	li		a1, 61389
	call	lohi
	mv		s10, a0
	li		a0, 56574
	li		a1, 39098
	call	lohi
	mv		s1, a0
	li		s5, 271733878
	li		a0, 57840
	li		a1, 50130
	call	lohi
	li		s2, 0
	sw		s5, 16(sp)
	sw		s10, 12(sp)
	sw		a0, 8(sp)
	j		sha1__for_cond_4

sha1__for_cond_4:
	lw		s5, 20(sp)
	blt		s2, s5, sha1__for_body_4
	j		sha1__for_merge_5

sha1__for_body_4:
	li		s5, 16
	j		sha1__for_cond_5

sha1__for_cond_5:
	li		s10, 80
	blt		s5, s10, sha1__for_body_6
	j		sha1__for_merge_3

sha1__for_merge_3:
	lw		s6, 12(sp)
	mv		s8, s1
	lw		s5, 16(sp)
	lw		s10, 8(sp)
	li		s4, 0
	mv		s3, s11
	j		sha1__for_cond_6

sha1__for_cond_6:
	li		s9, 80
	blt		s4, s9, sha1__for_body_5
	j		sha1__for_merge_4

sha1__for_body_5:
	li		s9, 20
	blt		s4, s9, sha1__if_then_3
	j		sha1__if_else

sha1__if_else:
	li		s9, 40
	blt		s4, s9, sha1__if_then
	j		sha1__if_else_2

sha1__if_then:
	xor		s9, s6, s8
	xor		s9, s9, s5
	li		s0, 1859775393
	j		sha1__if_merge_2

sha1__if_merge_2:
	mv		a0, s3
	li		a1, 5
	call	rotate_left
	mv		a1, s10
	call	add
	mv		s10, a0
	mv		a0, s9
	mv		a1, s0
	call	add
	mv		a1, a0
	mv		a0, s10
	call	add
	li		s10, 4
	mul		s10, s2, s10
	addi	s10, s10, 4
	add		s10, s10, s7
	lw		s9, 0(s10)
	li		s10, 4
	mul		s10, s4, s10
	addi	s10, s10, 4
	add		s10, s10, s9
	lw		a1, 0(s10)
	call	add
	mv		s9, a0
	mv		s10, s5
	mv		s5, s8
	mv		a0, s6
	li		a1, 30
	call	rotate_left
	mv		s6, s3
	j		sha1__for_step_4

sha1__for_step_4:
	addi	s4, s4, 1
	mv		s3, s9
	mv		s8, a0
	j		sha1__for_cond_6

sha1__if_else_2:
	li		s9, 60
	blt		s4, s9, sha1__if_then_2
	j		sha1__if_else_3

sha1__if_else_3:
	xor		s9, s6, s8
	xor		s9, s9, s5
	li		a0, 49622
	li		a1, 51810
	call	lohi
	mv		s0, a0
	j		sha1__if_merge_2

sha1__if_then_2:
	and		s0, s6, s8
	and		s9, s6, s5
	or		s9, s0, s9
	and		s0, s8, s5
	or		s9, s9, s0
	li		a0, 48348
	li		a1, 36635
	call	lohi
	mv		s0, a0
	j		sha1__if_merge_2

sha1__if_then_3:
	and		s9, s6, s8
	xori	s0, s6, -1
	and		s0, s0, s5
	or		s9, s9, s0
	li		s0, 1518500249
	j		sha1__if_merge_2

sha1__for_merge_4:
	mv		a0, s11
	mv		a1, s3
	call	add
	mv		s11, a0
	lw		a0, 12(sp)
	mv		a1, s6
	call	add
	mv		s9, a0
	mv		a0, s1
	mv		a1, s8
	call	add
	mv		s1, a0
	lw		a0, 16(sp)
	mv		a1, s5
	call	add
	mv		s5, a0
	lw		a0, 8(sp)
	mv		a1, s10
	call	add
	j		sha1__for_step_5

sha1__for_step_5:
	addi	s2, s2, 1
	sw		s5, 16(sp)
	sw		s9, 12(sp)
	sw		a0, 8(sp)
	j		sha1__for_cond_4

sha1__for_body_6:
	li		s10, 4
	mul		s10, s2, s10
	addi	s10, s10, 4
	add		s6, s10, s7
	lw		s9, 0(s6)
	li		s10, 4
	mul		s10, s5, s10
	addi	s10, s10, 4
	add		s9, s10, s9
	addi	s3, s5, -3
	lw		s10, 0(s6)
	li		s8, 4
	mul		s3, s3, s8
	addi	s3, s3, 4
	add		s4, s3, s10
	addi	s3, s5, -8
	lw		s8, 0(s6)
	li		s10, 4
	mul		s10, s3, s10
	addi	s10, s10, 4
	add		s3, s10, s8
	lw		s10, 0(s4)
	lw		s3, 0(s3)
	xor		s8, s10, s3
	addi	s10, s5, -14
	lw		s4, 0(s6)
	li		s3, 4
	mul		s10, s10, s3
	addi	s10, s10, 4
	add		s10, s10, s4
	lw		s10, 0(s10)
	xor		s8, s8, s10
	addi	s10, s5, -16
	lw		s3, 0(s6)
	li		s6, 4
	mul		s10, s10, s6
	addi	s10, s10, 4
	add		s10, s10, s3
	lw		s10, 0(s10)
	xor		a0, s8, s10
	li		a1, 1
	call	rotate_left
	sw		a0, 0(s9)
	j		sha1__for_step_6

sha1__for_step_6:
	addi	s5, s5, 1
	j		sha1__for_cond_5

sha1__for_merge_5:
	li		s10, 0
	li		s5, 4
	mul		s5, s10, s5
	addi	s10, s5, 4
	lw		s5, 24(sp)
	add		s5, s10, s5
	sw		s11, 0(s5)
	li		s5, 1
	li		s10, 4
	mul		s5, s5, s10
	addi	s10, s5, 4
	lw		s5, 24(sp)
	add		s5, s10, s5
	lw		s10, 12(sp)
	sw		s10, 0(s5)
	li		s10, 2
	li		s5, 4
	mul		s5, s10, s5
	addi	s5, s5, 4
	lw		s10, 24(sp)
	add		s5, s5, s10
	sw		s1, 0(s5)
	li		s5, 3
	li		s10, 4
	mul		s5, s5, s10
	addi	s5, s5, 4
	lw		s10, 24(sp)
	add		s5, s5, s10
	lw		s10, 16(sp)
	sw		s10, 0(s5)
	li		s5, 4
	li		s10, 4
	mul		s5, s5, s10
	addi	s5, s5, 4
	lw		s10, 24(sp)
	add		s5, s5, s10
	lw		s10, 8(sp)
	sw		s10, 0(s5)
	lw		a0, 24(sp)
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

sha1__if_then_4:
	la		a0, __str_const_3
	call	__builtin_println
	li		a0, 0
	j		sha1_exit


	.globl	computeSHA1
	.p2align	2
	.type	computeSHA1, @function
computeSHA1:
	addi	sp, sp, -32
	sw		ra, 28(sp)
	sw		s1, 24(sp)
	sw		s3, 20(sp)
	sw		s6, 16(sp)
	sw		s10, 12(sp)
	mv		s10, a0
	lui		s1, %hi(inputBuffer)
	lw		s1, %lo(inputBuffer)(s1)
	li		s6, 0
	j		computeSHA1__for_cond

computeSHA1__for_cond:
	mv		a0, s10
	call	__builtin_string_length
	blt		s6, a0, computeSHA1__for_body_2
	j		computeSHA1__for_merge

computeSHA1__for_merge:
	mv		a0, s10
	call	__builtin_string_length
	mv		a1, a0
	mv		a0, s1
	call	sha1
	mv		s1, a0
	li		s10, 0
	j		computeSHA1__for_cond_2

computeSHA1__for_cond_2:
	lw		s3, 0(s1)
	blt		s10, s3, computeSHA1__for_body
	j		computeSHA1__for_merge_2

computeSHA1__for_body:
	li		s3, 4
	mul		s3, s10, s3
	addi	s3, s3, 4
	add		s3, s3, s1
	lw		a0, 0(s3)
	call	toStringHex
	call	__builtin_print
	j		computeSHA1__for_step

computeSHA1__for_step:
	addi	s10, s10, 1
	j		computeSHA1__for_cond_2

computeSHA1__for_merge_2:
	la		a0, __str_const_4
	call	__builtin_println
	lw		s10, 12(sp)
	lw		s6, 16(sp)
	lw		s3, 20(sp)
	lw		s1, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

computeSHA1__for_body_2:
	li		s3, 4
	mul		s3, s6, s3
	addi	s3, s3, 4
	add		s3, s3, s1
	mv		a0, s10
	mv		a1, s6
	call	__builtin_string_ord
	sw		a0, 0(s3)
	j		computeSHA1__for_step_2

computeSHA1__for_step_2:
	addi	s6, s6, 1
	j		computeSHA1__for_cond


	.globl	nextLetter
	.p2align	2
	.type	nextLetter, @function
nextLetter:
	li		a7, 122
	beq		a0, a7, nextLetter__if_then
	j		nextLetter__if_merge

nextLetter__if_then:
	li		a7, 1
	sub		a0, zero, a7
	j		nextLetter_exit

nextLetter_exit:
	jr		ra

nextLetter__if_merge:
	li		a7, 90
	beq		a0, a7, nextLetter__if_then_2
	j		nextLetter__if_merge_2

nextLetter__if_then_2:
	li		a0, 97
	j		nextLetter_exit

nextLetter__if_merge_2:
	li		a7, 57
	beq		a0, a7, nextLetter__if_then_3
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
	sw		s2, 8(sp)
	sw		s4, 4(sp)
	sw		s7, 0(sp)
	mv		s4, s8
	mv		s2, a0
	addi	s7, a1, -1
	j		nextText__for_cond

nextText__for_cond:
	li		s8, 0
	bge		s7, s8, nextText__for_body
	j		nextText__for_merge

nextText__for_merge:
	li		a0, 0
	j		nextText_exit

nextText_exit:
	mv		s8, s4
	lw		s7, 0(sp)
	lw		s4, 4(sp)
	lw		s2, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

nextText__for_body:
	li		s8, 4
	mul		s8, s7, s8
	addi	s8, s8, 4
	add		s8, s8, s2
	lw		a0, 0(s8)
	call	nextLetter
	sw		a0, 0(s8)
	li		a7, 1
	sub		a7, zero, a7
	lw		t1, 0(s8)
	beq		t1, a7, nextText__if_then
	j		nextText__if_else

nextText__if_else:
	li		a0, 1
	j		nextText_exit

nextText__if_then:
	li		a7, 48
	sw		a7, 0(s8)
	j		nextText__for_step

nextText__for_step:
	addi	s7, s7, -1
	j		nextText__for_cond


	.globl	array_equal
	.p2align	2
	.type	array_equal, @function
array_equal:
	lw		t1, 0(a0)
	lw		a7, 0(a1)
	bne		t1, a7, array_equal__if_then
	j		array_equal__if_merge

array_equal__if_then:
	li		a0, 0
	j		array_equal_exit

array_equal_exit:
	jr		ra

array_equal__if_merge:
	li		a7, 0
	j		array_equal__for_cond

array_equal__for_cond:
	lw		t1, 0(a0)
	blt		a7, t1, array_equal__for_body
	j		array_equal__for_merge

array_equal__for_body:
	li		t1, 4
	mul		t1, a7, t1
	addi	t1, t1, 4
	add		a3, t1, a0
	add		t1, t1, a1
	lw		a3, 0(a3)
	lw		t1, 0(t1)
	bne		a3, t1, array_equal__if_then_2
	j		array_equal__for_step

array_equal__for_step:
	addi	a7, a7, 1
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
	sw		s2, 20(sp)
	sw		s5, 16(sp)
	sw		s6, 12(sp)
	mv		s0, s9
	sw		s10, 8(sp)
	sw		s11, 4(sp)
	mv		s11, a0
	lui		s5, %hi(inputBuffer)
	lw		s6, %lo(inputBuffer)(s5)
	li		a0, 24
	call	malloc
	mv		s5, a0
	li		s10, 5
	sw		s10, 0(s5)
	mv		a0, s11
	call	__builtin_string_length
	li		s10, 40
	bne		a0, s10, crackSHA1__if_then_2
	j		crackSHA1__if_merge

crackSHA1__if_merge:
	li		s10, 0
	j		crackSHA1__for_cond

crackSHA1__for_cond:
	li		s9, 5
	blt		s10, s9, crackSHA1__for_body
	j		crackSHA1__for_merge

crackSHA1__for_body:
	li		s9, 4
	mul		s9, s10, s9
	addi	s9, s9, 4
	add		s2, s9, s5
	li		s9, 0
	sw		s9, 0(s2)
	j		crackSHA1__for_step

crackSHA1__for_step:
	addi	s10, s10, 1
	j		crackSHA1__for_cond

crackSHA1__for_merge:
	li		s10, 0
	mv		s2, s10
	j		crackSHA1__for_cond_2

crackSHA1__for_cond_2:
	li		s10, 40
	blt		s2, s10, crackSHA1__for_body_2
	j		crackSHA1__for_merge_2

crackSHA1__for_body_2:
	li		s10, 8
	div		s10, s2, s10
	li		s9, 4
	mul		s10, s10, s9
	addi	s10, s10, 4
	add		s9, s10, s5
	addi	s10, s2, 4
	mv		a0, s11
	mv		a1, s2
	mv		a2, s10
	call	__builtin_string_substring
	call	hex2int
	li		a7, 4
	div		s2, s2, a7
	li		a7, 2
	rem		a7, s2, a7
	li		s2, 1
	sub		a7, s2, a7
	li		s2, 16
	mul		s2, a7, s2
	sll		a7, a0, s2
	lw		s2, 0(s9)
	or		s2, s2, a7
	sw		s2, 0(s9)
	j		crackSHA1__for_step_2

crackSHA1__for_step_2:
	mv		s2, s10
	j		crackSHA1__for_cond_2

crackSHA1__for_merge_2:
	li		s10, 1
	j		crackSHA1__for_cond_3

crackSHA1__for_cond_3:
	li		s9, 4
	ble		s10, s9, crackSHA1__for_body_3
	j		crackSHA1__for_merge_4

crackSHA1__for_body_3:
	li		s9, 0
	j		crackSHA1__for_cond_4

crackSHA1__for_cond_4:
	blt		s9, s10, crackSHA1__for_body_4
	j		crackSHA1__while_body

crackSHA1__for_body_4:
	li		s11, 4
	mul		s11, s9, s11
	addi	s11, s11, 4
	add		s2, s11, s6
	li		s11, 48
	sw		s11, 0(s2)
	j		crackSHA1__for_step_3

crackSHA1__for_step_3:
	addi	s9, s9, 1
	j		crackSHA1__for_cond_4

crackSHA1__while_body:
	mv		a0, s6
	mv		a1, s10
	call	sha1
	mv		a1, s5
	call	array_equal
	bne		a0, zero, crackSHA1__if_then
	j		crackSHA1__if_merge_2

crackSHA1__if_merge_2:
	mv		a0, s6
	mv		a1, s10
	call	nextText
	bne		a0, zero, crackSHA1__while_body
	j		crackSHA1__for_step_4

crackSHA1__for_step_4:
	addi	s10, s10, 1
	j		crackSHA1__for_cond_3

crackSHA1__if_then:
	li		s5, 0
	j		crackSHA1__for_cond_5

crackSHA1__for_cond_5:
	blt		s5, s10, crackSHA1__for_body_5
	j		crackSHA1__for_merge_3

crackSHA1__for_merge_3:
	la		a0, __str_const_6
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1_exit:
	lw		s11, 4(sp)
	lw		s10, 8(sp)
	mv		s9, s0
	lw		s6, 12(sp)
	lw		s5, 16(sp)
	lw		s2, 20(sp)
	lw		s0, 24(sp)
	lw		ra, 28(sp)
	addi	sp, sp, 32
	jr		ra

crackSHA1__for_body_5:
	li		s9, 4
	mul		s9, s5, s9
	addi	s9, s9, 4
	add		s9, s9, s6
	lw		a0, 0(s9)
	call	int2chr
	call	__builtin_print
	j		crackSHA1__for_step_5

crackSHA1__for_step_5:
	addi	s5, s5, 1
	j		crackSHA1__for_cond_5

crackSHA1__for_merge_4:
	la		a0, __str_const_7
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__if_then_2:
	la		a0, __str_const_5
	call	__builtin_println
	j		crackSHA1_exit


	.globl	_main
	.p2align	2
	.type	_main, @function
_main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	j		main__while_body

main__while_body:
	call	__builtin_getInt
	li		a7, 0
	beq		a0, a7, main__while_merge
	j		main__if_merge

main__while_merge:
	li		a0, 0
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

main__if_merge:
	li		a7, 1
	beq		a0, a7, main__if_then
	j		main__if_else

main__if_then:
	call	__builtin_getString
	call	computeSHA1
	j		main__while_body

main__if_else:
	li		a7, 2
	beq		a0, a7, main__if_then_2
	j		main__while_body

main__if_then_2:
	call	__builtin_getString
	call	crackSHA1
	j		main__while_body


	.globl	main
	.p2align	2
	.type	main, @function
main:
	addi	sp, sp, -16
	sw		ra, 12(sp)
	sw		s3, 8(sp)
	sw		s7, 4(sp)
	sw		s9, 0(sp)
	li		a0, 404
	call	malloc
	mv		s9, a0
	li		s3, 100
	sw		s3, 0(s9)
	addi	s3, s9, 4
	addi	s7, s9, 404
	j		_init___array_loop_cond

_init___array_loop_cond:
	blt		s3, s7, _init___array_loop_body
	j		_init___array_loop_merge

_init___array_loop_merge:
	li		a0, 25284
	call	malloc
	mv		s3, a0
	li		s7, 6320
	sw		s7, 0(s3)
	li		a0, 24
	call	malloc
	li		s7, 5
	sw		s7, 0(a0)
	lui		a7, %hi(asciiTable)
	la		s7, __str_const_9
	sw		s7, %lo(asciiTable)(a7)
	lui		s7, %hi(outputBuffer)
	sw		a0, %lo(outputBuffer)(s7)
	lui		s7, %hi(MAXCHUNK)
	li		a7, 100
	sw		a7, %lo(MAXCHUNK)(s7)
	lui		s7, %hi(chunks)
	sw		s9, %lo(chunks)(s7)
	lui		s9, %hi(inputBuffer)
	sw		s3, %lo(inputBuffer)(s9)
	call	_main
	lw		s9, 0(sp)
	lw		s7, 4(sp)
	lw		s3, 8(sp)
	lw		ra, 12(sp)
	addi	sp, sp, 16
	jr		ra

_init___array_loop_body:
	li		a0, 324
	call	malloc
	li		a7, 80
	sw		a7, 0(a0)
	sw		a0, 0(s3)
	j		_init___array_loop_step

_init___array_loop_step:
	addi	s3, s3, 4
	j		_init___array_loop_cond


