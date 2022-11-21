# Ryan Wang
.data
str: .asciiz "# squared is #\n"

.text
main:
    addi    $sp,        $sp,        -4
    sw      $ra,        0($sp)

    # allocating space on the stack
    addi    $sp,        $sp,        -8
    li      $t0,        1
    sw      $t0,        4($sp)
    la      $t0,        str
    sw      $t0,        0($sp)

    jal     printf

    # return the pointer
    addi    $sp,        $sp,        8
    lw      $ra,        0($sp)
    addi    $sp,        $sp,        4
    jr      $ra

printf:
    # self-explanatory store
    addi    $sp,        $sp,        -12
    sw      $ra,        0($sp)
    sw      $s0,        4($sp)
    sw      $s1,        8($sp)

    lw      $s0,        12($sp)
    addi    $s1,        $sp,        16

    # s0 points to str
    # s1 points to 1st arg after
    li      $t5,        0
    lw      $a1,        0($s1)

loop:
    # do char checks
    lb      $a3,        0($s0)
    beq     $a3,        $0,         end_of_str
    li      $t0,        '#'
    beq     $a3,        $t0,        else
    move    $a0,        $a3
    li      $v0,        11
    syscall 
    b       if_done

else:
    # prints i 
    move    $a0,        $a1
    beq     $t5,        $0,         printi

    # prints i squared
    mult    $a0,        $a0
    mflo    $a0
    li      $v0,        1
    syscall 

    li      $t5,        0
    addi    $a1,        $a1,        1
    li      $t4,        99
    bgt     $a0,        $t4,        done

if_done:
    addi    $s0,        $s0,        1
    b       loop

printi:
    li      $v0,        1
    syscall 

    addi    $t5,        $t5,        1
    b       if_done

done:
    lw      $ra,        0($sp)
    lw      $s0,        4($sp)
    lw      $s1,        8($sp)
    addi    $sp,        $sp,        12

    jr      $ra

end_of_str:
    li      $t4,        99
    bgt     $a0,        $t4,        done
    lw      $s0,        12($sp)
    b       loop
