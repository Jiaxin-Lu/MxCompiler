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
	.string	newString

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
	.type	hex2int, @function
hex2int:
	addi	sp,sp,-16
	sw		ra,12(sp)
	sw		s2,8(sp)
	sw		s3,4(sp)
	sw		s6,0(sp)
	mv		s3,a0
	mv		s6,zero
	mv		s2,zero
	mv		a6,s2
	mv		a6,s6
	j		hex2int__for_cond

hex2int__for_cond:
	mv		a0,s3
	call	__builtin_string_length
	blt		s6,a0,hex2int__for_body
	j		hex2int__for_merge

hex2int__for_merge:
	mv		a0,s2
	j		hex2int_exit

hex2int_exit:
	lw		s6,0(sp)
	lw		s3,4(sp)
	lw		s2,8(sp)
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra

hex2int__for_body:
	mv		a0,s3
	mv		a1,s6
	call	__builtin_string_ord
	li		a6,48
	bge		a0,a6,hex2int__lhs_and_then_3
	j		hex2int__if_else

hex2int__if_else:
	li		a6,65
	bge		a0,a6,hex2int__lhs_and_then_2
	j		hex2int__if_else_2

hex2int__if_else_2:
	li		a6,97
	bge		a0,a6,hex2int__lhs_and_then
	j		hex2int__if_else_3

hex2int__if_else_3:
	mv		a0,zero
	j		hex2int_exit

hex2int__lhs_and_then:
	li		a6,102
	ble		a0,a6,hex2int__if_then
	j		hex2int__if_else_3

hex2int__if_then:
	li		a6,16
	mul		s2,s2,a6
	add		s2,s2,a0
	addi	s2,s2,-97
	addi	s2,s2,10
	j		hex2int__for_step

hex2int__for_step:
	addi	s6,s6,1
	mv		a6,s2
	mv		a6,s6
	j		hex2int__for_cond

hex2int__lhs_and_then_2:
	li		a6,70
	ble		a0,a6,hex2int__if_then_2
	j		hex2int__if_else_2

hex2int__if_then_2:
	li		a6,16
	mul		s2,s2,a6
	add		s2,s2,a0
	addi	s2,s2,-65
	addi	s2,s2,10
	j		hex2int__for_step

hex2int__lhs_and_then_3:
	li		a6,57
	ble		a0,a6,hex2int__if_then_3
	j		hex2int__if_else

hex2int__if_then_3:
	li		a6,16
	mul		s2,s2,a6
	add		s2,s2,a0
	addi	s2,s2,-48
	j		hex2int__for_step


	.globl	int2chr
	.type	int2chr, @function
int2chr:
	addi	sp,sp,-16
	sw		ra,12(sp)
	lw		a6,0(asciiTable)
	li		t6,32
	bge		a0,t6,int2chr__lhs_and_then
	j		int2chr__if_merge

int2chr__lhs_and_then:
	li		t6,126
	ble		a0,t6,int2chr__if_then
	j		int2chr__if_merge

int2chr__if_merge:
	la		a0, __str_const_1
	j		int2chr_exit

int2chr_exit:
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra

int2chr__if_then:
	addi	a1,a0,-32
	addi	a2,a0,-31
	mv		a0,a6
	call	__builtin_string_substring
	j		int2chr_exit


	.globl	toStringHex
	.type	toStringHex, @function
toStringHex:
	addi	sp,sp,-16
	sw		ra,12(sp)
	sw		s1,8(sp)
	sw		s3,4(sp)
	sw		s7,0(sp)
	mv		s7,s10
	mv		s3,a0
	la		a6, __str_const_2
	li		s10,28
	mv		s1,s10
	mv		s10,a6
	mv		a6,s1
	mv		a6,s10
	j		toStringHex__for_cond

toStringHex__for_cond:
	bge		s1,zero,toStringHex__for_body
	j		toStringHex__for_merge

toStringHex__for_body:
	sra		a6,s3,s1
	andi	a6,a6,15
	li		t6,10
	blt		a6,t6,toStringHex__if_then
	j		toStringHex__if_else

toStringHex__if_else:
	addi	a6,a6,65
	addi	a0,a6,-10
	call	int2chr
	mv		a1,a0
	mv		a0,s10
	call	__builtin_string_add
	j		toStringHex__for_step

toStringHex__for_step:
	addi	s10,s1,-4
	mv		s1,s10
	mv		s10,a0
	mv		a6,s1
	mv		a6,s10
	j		toStringHex__for_cond

toStringHex__if_then:
	addi	a0,a6,48
	call	int2chr
	mv		a1,a0
	mv		a0,s10
	call	__builtin_string_add
	j		toStringHex__for_step

toStringHex__for_merge:
	mv		a0,s10
	mv		s10,s7
	lw		s7,0(sp)
	lw		s3,4(sp)
	lw		s1,8(sp)
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra


	.globl	rotate_left
	.type	rotate_left, @function
rotate_left:
	li		a6,1
	beq		a1,a6,rotate_left__if_then
	j		rotate_left__if_merge

rotate_left__if_then:
	li		a6,2147483647
	and		a6,a0,a6
	slli	t6,a6,1
	srai	a6,a0,31
	andi	a6,a6,1
	or		a0,t6,a6
	j		rotate_left_exit

rotate_left_exit:
	jr		ra

rotate_left__if_merge:
	li		a6,31
	beq		a1,a6,rotate_left__if_then_2
	j		rotate_left__if_merge_2

rotate_left__if_merge_2:
	li		a6,32
	sub		t6,a6,a1
	li		a6,1
	sll		a6,a6,t6
	addi	a6,a6,-1
	and		a6,a0,a6
	sll		a5,a6,a1
	sra		t6,a0,t6
	li		a6,1
	sll		a6,a6,a1
	addi	a6,a6,-1
	and		a6,t6,a6
	or		a0,a5,a6
	j		rotate_left_exit

rotate_left__if_then_2:
	andi	a6,a0,1
	slli	a6,a6,31
	srai	t6,a0,1
	li		a5,2147483647
	and		t6,t6,a5
	or		a0,a6,t6
	j		rotate_left_exit


	.globl	add
	.type	add, @function
add:
	li		a6,65535
	and		t6,a0,a6
	li		a6,65535
	and		a6,a1,a6
	add		a5,t6,a6
	srai	t6,a0,16
	li		a6,65535
	and		t1,t6,a6
	srai	a6,a1,16
	li		t6,65535
	and		a6,a6,t6
	add		t6,t1,a6
	srai	a6,a5,16
	add		t6,t6,a6
	li		a6,65535
	and		a6,t6,a6
	slli	t6,a6,16
	li		a6,65535
	and		a6,a5,a6
	or		a0,t6,a6
	jr		ra


	.globl	lohi
	.type	lohi, @function
lohi:
	slli	a6,a1,16
	or		a0,a0,a6
	jr		ra


	.globl	sha1
	.type	sha1, @function
sha1:
	addi	sp,sp,-80
	sw		ra,76(sp)
	sw		s0,72(sp)
	sw		s1,68(sp)
	sw		s2,64(sp)
	sw		s3,60(sp)
	sw		s4,56(sp)
	sw		s5,52(sp)
	sw		s6,48(sp)
	sw		s7,44(sp)
	sw		s8,40(sp)
	sw		s9,36(sp)
	sw		s10,32(sp)
	sw		s11,28(sp)
	lw		s0,0(chunks)
	lw		s11,0(outputBuffer)
	sw		s11,24(sp)
	lw		s3,0(MAXCHUNK)
	addi	s11,a1,64
	addi	s10,s11,-56
	li		s11,64
	div		s11,s10,s11
	addi	s11,s11,1
	sw		s11,20(sp)
	bgt		s11,s3,sha1__if_then
	j		sha1__if_merge

sha1__if_then:
	la		a0, __str_const_3
	call	__builtin_println
	mv		a0,zero
	j		sha1_exit

sha1_exit:
	lw		s11,28(sp)
	lw		s10,32(sp)
	lw		s9,36(sp)
	lw		s8,40(sp)
	lw		s7,44(sp)
	lw		s6,48(sp)
	lw		s5,52(sp)
	lw		s4,56(sp)
	lw		s3,60(sp)
	lw		s2,64(sp)
	lw		s1,68(sp)
	lw		s0,72(sp)
	lw		ra,76(sp)
	addi	sp,sp,80
	jr		ra

sha1__if_merge:
	mv		s3,zero
	j		sha1__for_cond

sha1__for_cond:
	lw		s11,20(sp)
	blt		s3,s11,sha1__for_body
	j		sha1__for_merge

sha1__for_body:
	mv		s11,zero
	j		sha1__for_cond_2

sha1__for_cond_2:
	li		s10,80
	blt		s11,s10,sha1__for_body_2
	j		sha1__for_step_2

sha1__for_body_2:
	li		s10,4
	mul		s10,s3,s10
	addi	s10,s10,4
	add		s10,s10,s0
	lw		s1,0(s10)
	li		s10,4
	mul		s10,s11,s10
	addi	s10,s10,4
	add		s10,s10,s1
	sw		zero,0(s10)
	j		sha1__for_step

sha1__for_step:
	addi	s11,s11,1
	j		sha1__for_cond_2

sha1__for_step_2:
	addi	s3,s3,1
	j		sha1__for_cond

sha1__for_merge:
	mv		s11,zero
	j		sha1__for_cond_3

sha1__for_cond_3:
	blt		s11,a1,sha1__for_body_3
	j		sha1__for_merge_2

sha1__for_body_3:
	li		s3,64
	div		s10,s11,s3
	li		s3,4
	mul		s3,s10,s3
	addi	s3,s3,4
	add		s5,s3,s0
	li		s3,64
	rem		s3,s11,s3
	li		s10,4
	div		s3,s3,s10
	lw		s1,0(s5)
	li		s10,4
	mul		s3,s3,s10
	addi	s3,s3,4
	add		s10,s3,s1
	lw		s1,0(s5)
	add		s4,s3,s1
	li		s3,4
	mul		s3,s11,s3
	addi	s3,s3,4
	add		s5,s3,a0
	li		s3,4
	rem		s3,s11,s3
	li		s1,3
	sub		s1,s1,s3
	li		s3,8
	mul		s1,s1,s3
	lw		s3,0(s5)
	sll		s1,s3,s1
	lw		s3,0(s4)
	or		s3,s3,s1
	sw		s3,0(s10)
	j		sha1__for_step_3

sha1__for_step_3:
	addi	s11,s11,1
	j		sha1__for_cond_3

sha1__for_merge_2:
	li		s3,64
	div		s10,s11,s3
	li		s3,4
	mul		s3,s10,s3
	addi	s3,s3,4
	add		s5,s3,s0
	li		s3,64
	rem		s3,s11,s3
	li		s10,4
	div		s1,s3,s10
	lw		s3,0(s5)
	li		s10,4
	mul		s10,s1,s10
	addi	s10,s10,4
	add		s1,s10,s3
	lw		s3,0(s5)
	add		s10,s10,s3
	li		s3,4
	rem		s11,s11,s3
	li		s3,3
	sub		s3,s3,s11
	li		s11,8
	mul		s3,s3,s11
	li		s11,128
	sll		s3,s11,s3
	lw		s11,0(s10)
	or		s11,s11,s3
	sw		s11,0(s1)
	lw		s11,20(sp)
	addi	s11,s11,-1
	li		s3,4
	mul		s11,s11,s3
	addi	s11,s11,4
	add		s3,s11,s0
	lw		s10,0(s3)
	li		s11,15
	li		s1,4
	mul		s11,s11,s1
	addi	s11,s11,4
	add		s11,s11,s10
	slli	s10,a1,3
	sw		s10,0(s11)
	lw		s10,0(s3)
	li		s3,14
	li		s11,4
	mul		s11,s3,s11
	addi	s11,s11,4
	add		s3,s11,s10
	srai	s11,a1,29
	andi	s11,s11,7
	sw		s11,0(s3)
	li		s10,1732584193
	li		a0,43913
	li		a1,61389
	call	lohi
	mv		s1,a0
	li		a0,56574
	li		a1,39098
	call	lohi
	mv		s11,a0
	li		s3,271733878
	li		a0,57840
	li		a1,50130
	call	lohi
	mv		s6,zero
	mv		s7,s3
	sw		a0,16(sp)
	sw		s1,12(sp)
	sw		s10,8(sp)
	mv		s3,s6
	mv		s3,s11
	mv		s3,s7
	lw		s3,16(sp)
	lw		s3,16(sp)
	sw		s3,16(sp)
	lw		s3,12(sp)
	lw		s3,12(sp)
	sw		s3,12(sp)
	lw		s3,8(sp)
	j		sha1__for_cond_4

sha1__for_cond_4:
	lw		s3,20(sp)
	blt		s6,s3,sha1__for_body_4
	j		sha1__for_merge_3

sha1__for_merge_3:
	li		s3,4
	mul		s3,zero,s3
	addi	s10,s3,4
	lw		s3,24(sp)
	add		s3,s10,s3
	lw		s10,8(sp)
	sw		s10,0(s3)
	li		s3,1
	li		s10,4
	mul		s3,s3,s10
	addi	s10,s3,4
	lw		s3,24(sp)
	add		s10,s10,s3
	lw		s3,12(sp)
	sw		s3,0(s10)
	li		s3,2
	li		s10,4
	mul		s3,s3,s10
	addi	s10,s3,4
	lw		s3,24(sp)
	add		s3,s10,s3
	sw		s11,0(s3)
	li		s3,3
	li		s11,4
	mul		s11,s3,s11
	addi	s3,s11,4
	lw		s11,24(sp)
	add		s11,s3,s11
	sw		s7,0(s11)
	li		s11,4
	li		s3,4
	mul		s11,s11,s3
	addi	s3,s11,4
	lw		s11,24(sp)
	add		s11,s3,s11
	lw		s3,16(sp)
	sw		s3,0(s11)
	lw		a0,24(sp)
	j		sha1_exit

sha1__for_body_4:
	li		s3,16
	j		sha1__for_cond_5

sha1__for_cond_5:
	li		s10,80
	blt		s3,s10,sha1__for_body_6
	j		sha1__for_merge_4

sha1__for_merge_4:
	lw		s1,8(sp)
	lw		s3,12(sp)
	mv		s5,s7
	lw		s10,16(sp)
	mv		s9,s11
	mv		s2,s3
	mv		s8,s1
	mv		s3,zero
	mv		s1,s9
	mv		s1,s10
	mv		s1,s2
	mv		s1,s8
	mv		s1,s5
	mv		s1,s3
	j		sha1__for_cond_6

sha1__for_cond_6:
	li		s1,80
	blt		s3,s1,sha1__for_body_5
	j		sha1__for_merge_5

sha1__for_body_5:
	li		s1,20
	blt		s3,s1,sha1__if_then_4
	j		sha1__if_else

sha1__if_else:
	li		s1,40
	blt		s3,s1,sha1__if_then_2
	j		sha1__if_else_2

sha1__if_then_2:
	xor		s1,s2,s9
	xor		a6,s1,s5
	li		s1,1859775393
	mv		s4,s1
	mv		s1,a6
	mv		a6,s4
	mv		a6,s1
	j		sha1__if_merge_2

sha1__if_merge_2:
	mv		a0,s8
	li		a1,5
	call	rotate_left
	mv		a1,s10
	call	add
	mv		s10,a0
	mv		a0,s1
	mv		a1,s4
	call	add
	mv		a1,a0
	mv		a0,s10
	call	add
	li		s10,4
	mul		s10,s6,s10
	addi	s10,s10,4
	add		s10,s10,s0
	lw		s1,0(s10)
	li		s10,4
	mul		s10,s3,s10
	addi	s10,s10,4
	add		s10,s10,s1
	lw		a1,0(s10)
	call	add
	mv		s10,a0
	mv		s1,s9
	mv		a0,s2
	li		a1,30
	call	rotate_left
	mv		s4,s8
	mv		s8,s10
	j		sha1__for_step_4

sha1__for_step_4:
	addi	s3,s3,1
	mv		s9,a0
	mv		s10,s5
	mv		s2,s4
	mv		s5,s1
	mv		s1,s9
	mv		s1,s10
	mv		s1,s2
	mv		s1,s8
	mv		s1,s5
	mv		s1,s3
	j		sha1__for_cond_6

sha1__if_else_2:
	li		s1,60
	blt		s3,s1,sha1__if_then_3
	j		sha1__if_else_3

sha1__if_then_3:
	and		s4,s2,s9
	and		s1,s2,s5
	or		s1,s4,s1
	and		s4,s9,s5
	or		s1,s1,s4
	li		a0,48348
	li		a1,36635
	call	lohi
	mv		s4,a0
	mv		a6,s4
	mv		a6,s1
	j		sha1__if_merge_2

sha1__if_else_3:
	xor		s1,s2,s9
	xor		s1,s1,s5
	li		a0,49622
	li		a1,51810
	call	lohi
	mv		s4,a0
	mv		a6,s4
	mv		a6,s1
	j		sha1__if_merge_2

sha1__if_then_4:
	and		s4,s2,s9
	xori	s1,s2,-1
	and		s1,s1,s5
	or		a6,s4,s1
	li		s1,1518500249
	mv		s4,s1
	mv		s1,a6
	mv		a6,s4
	mv		a6,s1
	j		sha1__if_merge_2

sha1__for_merge_5:
	lw		a0,8(sp)
	mv		a1,s8
	call	add
	mv		s1,a0
	lw		a0,12(sp)
	mv		a1,s2
	call	add
	mv		s4,a0
	mv		a0,s11
	mv		a1,s9
	call	add
	mv		s3,a0
	mv		a0,s7
	mv		a1,s5
	call	add
	mv		s5,a0
	lw		a0,16(sp)
	mv		a1,s10
	call	add
	j		sha1__for_step_5

sha1__for_step_5:
	addi	s11,s6,1
	mv		s6,s11
	mv		s11,s3
	mv		s7,s5
	sw		a0,16(sp)
	sw		s4,12(sp)
	sw		s1,8(sp)
	mv		s3,s6
	mv		s3,s11
	mv		s3,s7
	lw		s3,16(sp)
	lw		s3,16(sp)
	sw		s3,16(sp)
	lw		s3,12(sp)
	lw		s3,12(sp)
	sw		s3,12(sp)
	lw		s3,8(sp)
	j		sha1__for_cond_4

sha1__for_body_6:
	li		s10,4
	mul		s10,s6,s10
	addi	s10,s10,4
	add		s9,s10,s0
	lw		s10,0(s9)
	li		s1,4
	mul		s1,s3,s1
	addi	s1,s1,4
	add		s1,s1,s10
	addi	s4,s3,-3
	lw		s10,0(s9)
	li		s5,4
	mul		s5,s4,s5
	addi	s5,s5,4
	add		s10,s5,s10
	addi	s8,s3,-8
	lw		s5,0(s9)
	li		s4,4
	mul		s4,s8,s4
	addi	s4,s4,4
	add		s5,s4,s5
	lw		s4,0(s10)
	lw		s10,0(s5)
	xor		s5,s4,s10
	addi	s10,s3,-14
	lw		s8,0(s9)
	li		s4,4
	mul		s10,s10,s4
	addi	s10,s10,4
	add		s10,s10,s8
	lw		s10,0(s10)
	xor		s8,s5,s10
	addi	s10,s3,-16
	lw		s5,0(s9)
	li		s4,4
	mul		s10,s10,s4
	addi	s10,s10,4
	add		s10,s10,s5
	lw		s10,0(s10)
	xor		a0,s8,s10
	li		a1,1
	call	rotate_left
	sw		a0,0(s1)
	j		sha1__for_step_6

sha1__for_step_6:
	addi	s3,s3,1
	j		sha1__for_cond_5


	.globl	computeSHA1
	.type	computeSHA1, @function
computeSHA1:
	addi	sp,sp,-32
	sw		ra,28(sp)
	sw		s2,24(sp)
	sw		s6,20(sp)
	sw		s7,16(sp)
	mv		s7,s8
	sw		s11,12(sp)
	mv		s11,a0
	lw		s2,0(inputBuffer)
	mv		s6,zero
	j		computeSHA1__for_cond

computeSHA1__for_cond:
	mv		a0,s11
	call	__builtin_string_length
	blt		s6,a0,computeSHA1__for_body
	j		computeSHA1__for_merge

computeSHA1__for_body:
	li		s8,4
	mul		s8,s6,s8
	addi	s8,s8,4
	add		s8,s8,s2
	mv		a0,s11
	mv		a1,s6
	call	__builtin_string_ord
	sw		a0,0(s8)
	j		computeSHA1__for_step

computeSHA1__for_step:
	addi	s6,s6,1
	j		computeSHA1__for_cond

computeSHA1__for_merge:
	mv		a0,s11
	call	__builtin_string_length
	mv		a1,a0
	mv		a0,s2
	call	sha1
	mv		s11,a0
	j		computeSHA1__for_cond_2

computeSHA1__for_cond_2:
	lw		s6,0(s11)
	blt		zero,s6,computeSHA1__for_body_2
	j		computeSHA1__for_merge_2

computeSHA1__for_body_2:
	li		s6,4
	mul		s6,zero,s6
	addi	s6,s6,4
	add		s6,s6,s11
	lw		a0,0(s6)
	call	toStringHex
	call	__builtin_print
	j		computeSHA1__for_step_2

computeSHA1__for_step_2:
	addi	zero,zero,1
	j		computeSHA1__for_cond_2

computeSHA1__for_merge_2:
	la		a0, __str_const_4
	call	__builtin_println
	lw		s11,12(sp)
	mv		s8,s7
	lw		s7,16(sp)
	lw		s6,20(sp)
	lw		s2,24(sp)
	lw		ra,28(sp)
	addi	sp,sp,32
	jr		ra


	.globl	nextLetter
	.type	nextLetter, @function
nextLetter:
	li		a6,122
	beq		a0,a6,nextLetter__if_then
	j		nextLetter__if_merge

nextLetter__if_then:
	li		a6,1
	sub		a0,zero,a6
	j		nextLetter_exit

nextLetter_exit:
	jr		ra

nextLetter__if_merge:
	li		a6,90
	beq		a0,a6,nextLetter__if_then_2
	j		nextLetter__if_merge_2

nextLetter__if_then_2:
	li		a0,97
	j		nextLetter_exit

nextLetter__if_merge_2:
	li		a6,57
	beq		a0,a6,nextLetter__if_then_3
	j		nextLetter__if_merge_3

nextLetter__if_then_3:
	li		a0,65
	j		nextLetter_exit

nextLetter__if_merge_3:
	addi	a0,a0,1
	j		nextLetter_exit


	.globl	nextText
	.type	nextText, @function
nextText:
	addi	sp,sp,-16
	sw		ra,12(sp)
	sw		s5,8(sp)
	sw		s6,4(sp)
	sw		s10,0(sp)
	mv		s5,a0
	addi	s10,a1,-1
	j		nextText__for_cond

nextText__for_cond:
	bge		s10,zero,nextText__for_body
	j		nextText__for_merge

nextText__for_body:
	li		s6,4
	mul		s6,s10,s6
	addi	s6,s6,4
	add		s6,s6,s5
	lw		a0,0(s6)
	call	nextLetter
	sw		a0,0(s6)
	li		a6,1
	sub		a6,zero,a6
	lw		t6,0(s6)
	beq		t6,a6,nextText__if_then
	j		nextText__if_else

nextText__if_else:
	addi	zero,zero,1
	j		nextText_exit

nextText_exit:
	mv		a0,zero
	lw		s10,0(sp)
	lw		s6,4(sp)
	lw		s5,8(sp)
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra

nextText__if_then:
	li		a6,48
	sw		a6,0(s6)
	j		nextText__for_step

nextText__for_step:
	addi	s10,s10,-1
	j		nextText__for_cond

nextText__for_merge:
	j		nextText_exit


	.globl	array_equal
	.type	array_equal, @function
array_equal:
	lw		a6,0(a0)
	lw		t6,0(a1)
	bne		a6,t6,array_equal__if_then
	j		array_equal__if_merge

array_equal__if_then:
	mv		a0,zero
	j		array_equal_exit

array_equal_exit:
	jr		ra

array_equal__if_merge:
	mv		a6,zero
	j		array_equal__for_cond

array_equal__for_cond:
	lw		t6,0(a0)
	blt		a6,t6,array_equal__for_body
	j		array_equal__for_merge

array_equal__for_body:
	li		t6,4
	mul		t6,a6,t6
	addi	t6,t6,4
	add		a5,t6,a0
	add		t1,t6,a1
	lw		t6,0(a5)
	lw		a5,0(t1)
	bne		t6,a5,array_equal__if_then_2
	j		array_equal__for_step

array_equal__for_step:
	addi	a6,a6,1
	j		array_equal__for_cond

array_equal__if_then_2:
	mv		a0,zero
	j		array_equal_exit

array_equal__for_merge:
	addi	a0,zero,1
	j		array_equal_exit


	.globl	crackSHA1
	.type	crackSHA1, @function
crackSHA1:
	addi	sp,sp,-32
	sw		ra,28(sp)
	sw		s0,24(sp)
	sw		s1,20(sp)
	sw		s3,16(sp)
	sw		s7,12(sp)
	sw		s8,8(sp)
	mv		s7,s9
	sw		s11,4(sp)
	mv		s9,a0
	lw		s8,0(inputBuffer)
	li		a0,24
	call	malloc
	mv		s3,a0
	li		s11,5
	sw		s11,0(s3)
	mv		a0,s9
	call	__builtin_string_length
	li		s11,40
	bne		a0,s11,crackSHA1__if_then
	j		crackSHA1__if_merge

crackSHA1__if_then:
	la		a0, __str_const_5
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1_exit:
	lw		s11,4(sp)
	mv		s9,s7
	lw		s8,8(sp)
	lw		s7,12(sp)
	lw		s3,16(sp)
	lw		s1,20(sp)
	lw		s0,24(sp)
	lw		ra,28(sp)
	addi	sp,sp,32
	jr		ra

crackSHA1__if_merge:
	mv		s11,zero
	j		crackSHA1__for_cond

crackSHA1__for_cond:
	li		s1,5
	blt		s11,s1,crackSHA1__for_body_5
	j		crackSHA1__for_merge

crackSHA1__for_merge:
	mv		s0,zero
	mv		s11,s0
	j		crackSHA1__for_cond_2

crackSHA1__for_cond_2:
	li		s11,40
	blt		s0,s11,crackSHA1__for_body
	j		crackSHA1__for_merge_2

crackSHA1__for_body:
	li		s11,8
	div		s1,s0,s11
	li		s11,4
	mul		s11,s1,s11
	addi	s11,s11,4
	add		s11,s11,s3
	addi	s1,s0,4
	mv		a0,s9
	mv		a1,s0
	mv		a2,s1
	call	__builtin_string_substring
	call	hex2int
	li		a6,4
	div		s0,s0,a6
	li		a6,2
	rem		a6,s0,a6
	li		s0,1
	sub		s0,s0,a6
	li		a6,16
	mul		s0,s0,a6
	sll		s0,a0,s0
	lw		a6,0(s11)
	or		s0,a6,s0
	sw		s0,0(s11)
	j		crackSHA1__for_step

crackSHA1__for_step:
	mv		s11,s1
	mv		s0,s11
	mv		s11,s0
	j		crackSHA1__for_cond_2

crackSHA1__for_merge_2:
	li		s1,1
	j		crackSHA1__for_cond_3

crackSHA1__for_cond_3:
	li		s11,4
	ble		s1,s11,crackSHA1__for_body_2
	j		crackSHA1__for_merge_3

crackSHA1__for_merge_3:
	la		a0, __str_const_7
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__for_body_2:
	mv		s11,zero
	j		crackSHA1__for_cond_4

crackSHA1__for_cond_4:
	blt		s11,s1,crackSHA1__for_body_4
	j		crackSHA1__while_body

crackSHA1__while_body:
	mv		a0,s8
	mv		a1,s1
	call	sha1
	mv		a1,s3
	call	array_equal
	bne		a0,zero,crackSHA1__if_then_2
	j		crackSHA1__if_merge_2

crackSHA1__if_then_2:
	j		crackSHA1__for_cond_5

crackSHA1__for_cond_5:
	blt		zero,s1,crackSHA1__for_body_3
	j		crackSHA1__for_merge_4

crackSHA1__for_merge_4:
	la		a0, __str_const_6
	call	__builtin_println
	j		crackSHA1_exit

crackSHA1__for_body_3:
	li		s11,4
	mul		s11,zero,s11
	addi	s11,s11,4
	add		s11,s11,s8
	lw		a0,0(s11)
	call	int2chr
	call	__builtin_print
	j		crackSHA1__for_step_2

crackSHA1__for_step_2:
	addi	zero,zero,1
	j		crackSHA1__for_cond_5

crackSHA1__if_merge_2:
	mv		a0,s8
	mv		a1,s1
	call	nextText
	bne		a0,zero,crackSHA1__while_body
	j		crackSHA1__for_step_3

crackSHA1__for_step_3:
	addi	s1,s1,1
	j		crackSHA1__for_cond_3

crackSHA1__for_body_4:
	li		s0,4
	mul		s0,s11,s0
	addi	s0,s0,4
	add		s0,s0,s8
	li		s9,48
	sw		s9,0(s0)
	j		crackSHA1__for_step_4

crackSHA1__for_step_4:
	addi	s11,s11,1
	j		crackSHA1__for_cond_4

crackSHA1__for_body_5:
	li		s1,4
	mul		s1,s11,s1
	addi	s1,s1,4
	add		s1,s1,s3
	sw		zero,0(s1)
	j		crackSHA1__for_step_5

crackSHA1__for_step_5:
	addi	s11,s11,1
	j		crackSHA1__for_cond


	.globl	_main
	.type	_main, @function
_main:
	addi	sp,sp,-16
	sw		ra,12(sp)
	j		main__while_body

main__while_body:
	call	__builtin_getInt
	beq		a0,zero,main__while_merge
	j		main__if_merge

main__while_merge:
	mv		a0,zero
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra

main__if_merge:
	li		a6,1
	beq		a0,a6,main__if_then_2
	j		main__if_else

main__if_else:
	li		a6,2
	beq		a0,a6,main__if_then
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
	.type	main, @function
main:
	addi	sp,sp,-16
	sw		ra,12(sp)
	sw		s1,8(sp)
	sw		s2,4(sp)
	sw		s5,0(sp)
	lw		s1,0(chunks)
	lw		s1,0(asciiTable)
	lw		s1,0(outputBuffer)
	lw		s1,0(inputBuffer)
	lw		s1,0(MAXLENGTH)
	lw		s1,0(MAXCHUNK)
	li		a0,404
	call	malloc
	mv		s1,a0
	li		s5,100
	sw		s5,0(s1)
	addi	s2,s1,4
	addi	s5,s1,404
	j		_init___array_loop_cond

_init___array_loop_cond:
	blt		s2,s5,_init___array_loop_body
	j		_init___array_loop_merge

_init___array_loop_body:
	li		a0,324
	call	malloc
	li		a6,80
	sw		a6,0(a0)
	sw		a0,0(s2)
	j		_init___array_loop_step

_init___array_loop_step:
	addi	s2,s2,4
	j		_init___array_loop_cond

_init___array_loop_merge:
	li		a0,25284
	call	malloc
	mv		s5,a0
	li		s2,6320
	sw		s2,0(s5)
	li		a0,24
	call	malloc
	li		s2,5
	sw		s2,0(a0)
	li		s2,100
	sw		s2,0(MAXCHUNK)
	sw		s5,0(inputBuffer)
	sw		a0,0(outputBuffer)
	la		s5, __str_const_9
	sw		s5,0(asciiTable)
	sw		s1,0(chunks)
	call	_main
	lw		s5,0(sp)
	lw		s2,4(sp)
	lw		s1,8(sp)
	lw		ra,12(sp)
	addi	sp,sp,16
	jr		ra


