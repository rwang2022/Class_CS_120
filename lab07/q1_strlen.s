# Ryan Wang
.data
str0: .asciiz "Hello world"
str1: .asciiz "This is a longer string."
nl: .asciiz "\n"
.text
main:
    addi    $sp,    $sp,    -4
    la      $a0,    str0
    jal     strlen              # Calculate the length of str0
    move    $a0,    $v0         # Print out the length
    li      $v0,    1
    syscall 
    la      $a0,    nl
    li      $v0,    4
    syscall 
    la      $a0,    str1        # Calculate the length of str1
    jal     strlen
    move    $a0,    $v0
    li      $v0,    1
    syscall 
    la      $a0,    nl
    li      $v0,    4
    syscall 
    li      $v0,    10
    syscall 

# YOUR CODE FOR STRLEN HERE ####
# $t0 is the count of characters
# $v0 represents count
# $t1 is next character
# $a0 is string pointer
strlen:
    li      $v0,    0
loop:
    lb      $t1,    0($a0)
    beqz    $t1,    exit
    addi    $a0,    $a0,    1
    addi    $v0,    $v0,    1
    j       loop
exit:
    jr      $ra
