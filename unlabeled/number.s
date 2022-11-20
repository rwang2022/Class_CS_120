	# Ryan Wang
	.data
num:	.word 42
prompt:	.asciiz "The number is "
newline:	.asciiz "\n"

	.text
main:	la $a0, prompt
	li $v0, 4
	syscall

	la $t0, num
	lw $a0, 0($t0) # Get the number

	li $v0, 1 # System call to print
	syscall	  # a number

	la $a0, newline
	li $v0, 4
	syscall

	li $v0, 10
	syscall
