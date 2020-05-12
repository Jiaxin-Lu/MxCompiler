        .text
        .globl  __builtin_print
        .p2align    2
        .type   __builtin_print, @function
__builtin_print:
        mv      a1,a0
        lui     a0,%hi(.LC0)
        addi    a0,a0,%lo(.LC0)
        tail    printf

        .globl  __builtin_println
        .p2align    2
        .type   __builtin_println, @function
__builtin_println:
        tail    puts

        .globl  __builtin_printInt
        .p2align    2
        .type   __builtin_printInt, @function
__builtin_printInt:
        mv      a1,a0
        lui     a0,%hi(.LC1)
        addi    a0,a0,%lo(.LC1)
        tail    printf

        .globl  __builtin_printlnInt
        .p2align    2
        .type   __builtin_printlnInt, @function
__builtin_printlnInt:
        mv      a1,a0
        lui     a0,%hi(.LC2)
        addi    a0,a0,%lo(.LC2)
        tail    printf

        .globl  __builtin_getString
        .p2align    2
        .type   __builtin_getString, @function
__builtin_getString:
        addi    sp,sp,-16
        li      a0,1000
        sw      ra,8(sp)
        sw      s0,0(sp)
        call    malloc
        mv      s0,a0
        mv      a1,a0
        lui     a0,%hi(.LC0)
        addi    a0,a0,%lo(.LC0)
        call    __isoc99_scanf
        mv      a0,s0
        lw      ra,8(sp)
        lw      s0,0(sp)
        addi    sp,sp,16
        jr      ra

        .globl  __builtin_getInt
        .p2align    2
        .type   __builtin_getInt, @function
__builtin_getInt:
        addi    sp,sp,-32
        lui     a0,%hi(.LC1)
        addi    a1,sp,12
        addi    a0,a0,%lo(.LC1)
        sw      ra,24(sp)
        call    __isoc99_scanf
        lw      ra,24(sp)
        lw      a0,12(sp)
        addi    sp,sp,32
        jr      ra

        .globl  __builtin_toString
        .p2align    2
        .type   __builtin_toString, @function
__builtin_toString:
        addi    sp,sp,-32
        sw      s1,8(sp)
        mv      s1,a0
        li      a0,12
        sw      ra,24(sp)
        sw      s0,16(sp)
        call    malloc
        lui     a1,%hi(.LC1)
        mv      a2,s1
        addi    a1,a1,%lo(.LC1)
        mv      s0,a0
        call    sprintf
        mv      a0,s0
        lw      ra,24(sp)
        lw      s0,16(sp)
        lw      s1,8(sp)
        addi    sp,sp,32
        jr      ra

        .globl  __builtin_string_length
        .p2align    2
        .type   __builtin_string_length, @function
__builtin_string_length:
        tail    strlen

        .globl  __builtin_string_substring
        .p2align    2
        .type   __builtin_string_substring, @function
__builtin_string_substring:
        addi    sp, sp, -32
        sw      ra, 28(sp)
        sw      s0, 24(sp)
        sw      s1, 20(sp)
        sw      s2, 16(sp)
        sw      s3, 12(sp)
        add     s3, zero, a1
        add     s2, zero, a0
        sub     s1, a2, a1
        addi    a0, s1, 1
        call    malloc
        add     s0, zero, a0
        add     a1, s2, s3
        add     a2, zero, s1
        call    memcpy
        add     a0, s0, s1
        sb      zero, 0(a0)
        add     a0, zero, s0
        lw      s3, 12(sp)
        lw      s2, 16(sp)
        lw      s1, 20(sp)
        lw      s0, 24(sp)
        lw      ra, 28(sp)
        addi    sp, sp, 32
        ret

        .globl  __builtin_string_parseInt
        .p2align    2
        .type   __builtin_string_parseInt, @function
__builtin_string_parseInt:
        addi    sp,sp,-32
        lui     a1,%hi(.LC1)
        addi    a2,sp,12
        addi    a1,a1,%lo(.LC1)
        sw      ra,24(sp)
        call    __isoc99_sscanf
        lw      ra,24(sp)
        lw      a0,12(sp)
        addi    sp,sp,32
        jr      ra

        .globl  __builtin_string_ord
        .p2align    2
        .type   __builtin_string_ord, @function
__builtin_string_ord:
        add     a1,a0,a1
        lbu     a0,0(a1)
        ret

        .globl  __builtin_string_add
        .p2align    2
        .type   __builtin_string_add, @function
__builtin_string_add:
        addi    sp, sp, -16
        sw      ra, 12(sp)
        sw      s0, 8(sp)
        sw      s1, 4(sp)
        sw      s2, 0(sp)
        add     s2, zero, a1
        add     s1, zero, a0
        call    strlen
        add     s0, zero, a0
        add     a0, zero, s2
        call    strlen
        add     a0, a0, s0
        addi    a0, a0, 1
        call    malloc
        add     s0, zero, a0
        add     a1, zero, s1
        call    strcpy
        add     a0, zero, s0
        add     a1, zero, s2
        lw      s2, 0(sp)
        lw      s1, 4(sp)
        lw      s0, 8(sp)
        lw      ra, 12(sp)
        addi    sp, sp, 16
        tail    strcat

        .globl  __builtin_string_eq
        .p2align    2
        .type   __builtin_string_eq, @function
__builtin_string_eq:
        addi    sp,sp,-16
        sw      ra,8(sp)
        call    strcmp
        lw      ra,8(sp)
        seqz    a0,a0
        addi    sp,sp,16
        jr      ra

        .globl  __builtin_string_neq
        .p2align    2
        .type   __builtin_string_neq, @function
__builtin_string_neq:
        addi    sp,sp,-16
        sw      ra,8(sp)
        call    strcmp
        lw      ra,8(sp)
        snez    a0,a0
        addi    sp,sp,16
        jr      ra

        .globl  __builtin_string_lt
        .p2align    2
        .type   __builtin_string_lt, @function
__builtin_string_lt:
        addi    sp,sp,-16
        sw      ra,8(sp)
        call    strcmp
        lw      ra,8(sp)
        srli    a0,a0,31
        addi    sp,sp,16
        jr      ra

        .globl  __builtin_string_leq
        .p2align    2
        .type   __builtin_string_leq, @function
__builtin_string_leq:
        addi    sp,sp,-16
        sw      ra,8(sp)
        call    strcmp
        lw      ra,8(sp)
        slti    a0,a0,1
        addi    sp,sp,16
        jr      ra

        .globl  __builtin_string_req
        .p2align    2
        .type   __builtin_string_req, @function
__builtin_string_req:
        addi    sp,sp,-16
        sw      ra,8(sp)
        call    strcmp
        lw      ra,8(sp)
        not     a0,a0
        srli   a0,a0,31
        addi    sp,sp,16
        jr      ra

        .globl  __builtin_string_rt
        .p2align    2
        .type   __builtin_string_rt, @function
__builtin_string_rt:
        addi    sp,sp,-16
        sw      ra,8(sp)
        call    strcmp
        lw      ra,8(sp)
        sgt     a0,a0,zero
        addi    sp,sp,16
        jr      ra

        .data
.LC0:
        .string "%s"
.LC1:
        .string "%d"
.LC2:
        .string "%d\n"