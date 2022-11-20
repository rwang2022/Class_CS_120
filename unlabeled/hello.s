##### Ryan Wang
.data
str0: .asciiz "Hello world"
str1: .asciiz "This is a longer string."
nl: .asciiz "\n"
.text
main:
    addi $sp, $sp, -4
    sw $ra, 0($sp)  # Save return address

    la $a0, str0
    jal strlen   # Calculate the length of str0
    move $a0, $v0  # Print out the length
    li $v0, 1
    syscall
    la $a0, nl
    li $v0, 4
    syscall
    la $a0, str1   # Calculate the length of str1
    jal strlen
    move $a0, $v0
    li $v0, 1
    syscall
    la $a0, nl
    li $v0, 4
    syscall
    lw $ra, 0($sp)   # Restore return address
    jr $ra  # back to the OS

#### MY CODE FOR STRLEN HERE ####
strlen:
	