__builtin_print:
        mv      a1,a0
        lui     a0,%hi(.LC0)
        addi    a0,a0,%lo(.LC0)
        tail    printf
__builtin_println:
        tail    puts
__builtin_printInt:
        mv      a1,a0
        lui     a0,%hi(.LC1)
        addi    a0,a0,%lo(.LC1)
        tail    printf
__builtin_printlnInt:
        mv      a1,a0
        lui     a0,%hi(.LC2)
        addi    a0,a0,%lo(.LC2)
        tail    printf
__builtin_getString:
        addi    sp,sp,-16
        li      a0,1000
        sd      ra,8(sp)
        sd      s0,0(sp)
        call    malloc
        mv      s0,a0
        mv      a1,a0
        lui     a0,%hi(.LC0)
        addi    a0,a0,%lo(.LC0)
        call    __isoc99_scanf
        mv      a0,s0
        ld      ra,8(sp)
        ld      s0,0(sp)
        addi    sp,sp,16
        jr      ra
__builtin_getInt:
        addi    sp,sp,-32
        lui     a0,%hi(.LC1)
        addi    a1,sp,12
        addi    a0,a0,%lo(.LC1)
        sd      ra,24(sp)
        call    __isoc99_scanf
        ld      ra,24(sp)
        lw      a0,12(sp)
        addi    sp,sp,32
        jr      ra
__builtin_toString:
        addi    sp,sp,-32
        sd      s1,8(sp)
        mv      s1,a0
        li      a0,12
        sd      ra,24(sp)
        sd      s0,16(sp)
        call    malloc
        lui     a1,%hi(.LC1)
        mv      a2,s1
        addi    a1,a1,%lo(.LC1)
        mv      s0,a0
        call    sprintf
        mv      a0,s0
        ld      ra,24(sp)
        ld      s0,16(sp)
        ld      s1,8(sp)
        addi    sp,sp,32
        jr      ra
__builtin_string_length:
        addi    sp,sp,-16
        sd      ra,8(sp)
        call    strlen
        ld      ra,8(sp)
        sext.w  a0,a0
        addi    sp,sp,16
        jr      ra
__builtin_string_substring:
        addi    sp,sp,-32
        sd      s0,16(sp)
        subw    s0,a2,a1
        sd      s2,0(sp)
        mv      s2,a0
        addiw   a0,s0,1
        sd      ra,24(sp)
        sd      s1,8(sp)
        mv      s1,a1
        call    malloc
        add     a1,s2,s1
        mv      a2,s0
        call    memcpy
        add     s0,a0,s0
        sb      zero,0(s0)
        ld      ra,24(sp)
        ld      s0,16(sp)
        ld      s1,8(sp)
        ld      s2,0(sp)
        addi    sp,sp,32
        jr      ra
__builtin_string_parseInt:
        addi    sp,sp,-32
        lui     a1,%hi(.LC1)
        addi    a2,sp,12
        addi    a1,a1,%lo(.LC1)
        sd      ra,24(sp)
        call    __isoc99_sscanf
        ld      ra,24(sp)
        lw      a0,12(sp)
        addi    sp,sp,32
        jr      ra
__builtin_string_ord:
        add     a1,a0,a1
        lbu     a0,0(a1)
        ret
__builtin_string_add:
        addi    sp,sp,-48
        sd      ra,40(sp)
        sd      s0,32(sp)
        sd      s1,24(sp)
        sd      s2,16(sp)
        sd      s3,8(sp)
        sd      s4,0(sp)
        mv      s2,a1
        mv      s4,a0
        call    strlen
        mv      s0,a0
        mv      a0,s2
        call    strlen
        mv      s3,a0
        addw    a0,s0,a0
        addiw   a0,a0,1
        call    malloc
        mv      a2,s0
        mv      a1,s4
        mv      s1,a0
        call    memcpy
        add     a0,s1,s0
        addi    a2,s3,1
        mv      a1,s2
        call    memcpy
        ld      ra,40(sp)
        ld      s0,32(sp)
        mv      a0,s1
        ld      s2,16(sp)
        ld      s1,24(sp)
        ld      s3,8(sp)
        ld      s4,0(sp)
        addi    sp,sp,48
        jr      ra
__builtin_string_eq:
        addi    sp,sp,-16
        sd      ra,8(sp)
        call    strcmp
        ld      ra,8(sp)
        seqz    a0,a0
        addi    sp,sp,16
        jr      ra
__builtin_string_neq:
        addi    sp,sp,-16
        sd      ra,8(sp)
        call    strcmp
        ld      ra,8(sp)
        snez    a0,a0
        addi    sp,sp,16
        jr      ra
__builtin_string_lt:
        addi    sp,sp,-16
        sd      ra,8(sp)
        call    strcmp
        ld      ra,8(sp)
        srliw   a0,a0,31
        addi    sp,sp,16
        jr      ra
__builtin_string_leq:
        addi    sp,sp,-16
        sd      ra,8(sp)
        call    strcmp
        ld      ra,8(sp)
        slti    a0,a0,1
        addi    sp,sp,16
        jr      ra
__builtin_string_req:
        addi    sp,sp,-16
        sd      ra,8(sp)
        call    strcmp
        ld      ra,8(sp)
        not     a0,a0
        srliw   a0,a0,31
        addi    sp,sp,16
        jr      ra
__builtin_string_rt:
        addi    sp,sp,-16
        sd      ra,8(sp)
        call    strcmp
        ld      ra,8(sp)
        sgt     a0,a0,zero
        addi    sp,sp,16
        jr      ra
.LC0:
        .string "%s"
        .zero   5
.LC1:
        .string "%d"
        .zero   5
.LC2:
        .string "%d\n"