# Ryan Wang
.data
str: .asciiz "This HAS UPPER and lower CASE letters."

.text
main:
    addi    $sp,        $sp,        -4
    sw      $ra,        0($sp)
    la      $a0,        str
    jal     lowercase                       # Now we print the string, which lowercase has modified
    la      $a0,        str
    li      $v0,        4
    syscall 
    lw      $ra,        0($sp)
    addi    $sp,        $sp,        4
    jr      $ra

# YOUR CODE for lowercase here
lowercase:
    li      $v0,        4
    li      $t0,        0

loop:
    lb      $t1,        str($t0)
    beq     $t1,        0,          exit
    blt     $t1,        'A',        case
    bgt     $t1,        'Z',        case
    addi    $t1,        $t1,        32
    sb      $t1,        str($t0)

case:
    addi    $t0,        $t0,        1
    j       loop

exit:
    jr      $ra