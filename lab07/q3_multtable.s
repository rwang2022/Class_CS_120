# Ryan Wang
.data
newline:    .asciiz "\n"
space:	    .asciiz " "

.text
main:
    li      $a0,        3
    li      $a1,        4
    jal     multtable

    li      $a0,        5
    li      $a1,        7
    jal     multtable

# end the program
    li      $v0,        10
    syscall 

multtable:
    li      $t0,        1
    move    $t1,        $a0
loop_i:
    bgt     $t0,        $t1,        end_i   # print newline


# initialize j
    li      $t2,        1
    move    $t3,        $a1
loop_j:
    bgt     $t2,        $t3,        end_j

# =======================================================================================
# INNER LOOP HERE
# $t4 represents i*j, prints product too
    mult    $t0,        $t2
    mflo    $t4
    move    $a0,        $t4
    li      $v0,        1
    syscall 

# prints space
    la      $a0,        space
    li      $v0,        4
    syscall 

# INNER LOOP HERE
# =======================================================================================

    addi    $t2,        $t2,        1
    j       loop_j
end_j:

# PRINT NEWLINE
    la      $a0,        newline
    li      $v0,        4
    syscall 

    addi    $t0,        $t0,        1
    j       loop_i
end_i:
    jr      $ra