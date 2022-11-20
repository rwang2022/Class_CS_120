    # Ryan Wang
    .data
x:  
    .word 3, 10, 4, 25, 33, 6, 2, 0
text:
    .asciiz "The total of things less than 10 is "
newline:
    .asciiz "\n"

    .text
main: 
    li $t0, 0
    la $t1, x
    li $t3, 10
    j while
while:
    lw $t2, 0($t1)
    beq $t2, $0, done
    blt $t2, $t3, update
    continue:
        addi $t1, $t1, 4
        j while
update:
    add $t0, $t0, $t2
    j continue
done:
    la $a0, text
    li $v0, 4
    syscall

    move $a0, $t0
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    li $v0, 10
    syscall