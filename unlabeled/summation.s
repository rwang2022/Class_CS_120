	# Ryan Wang
	.text
main:
	li $a0, 0
	li $t0, 0
	li $t1, 10

while:
	beq $t0, $1, done

	add $a0, $a0, $t0
	add $t0, $t0, $t1

	j while

done:
	# assembly equivalent of:
	# printf("%d", a0)

	# system call 1 prints integer
	li $v0, 1
	syscall
