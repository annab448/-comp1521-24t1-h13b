# $t0	x
# $t1	y

	.text

main:
	# printf("Enter a number: ");
	li	$v0, 4
	la	$a0, prompt
	syscall

	# scanf("%d", &x);
	li	$v0, 5
	syscall
	move	$t0, $v0

	# y = x * x;
	mul	$t1, $t0, $t0

	# printf("%d\n", y);
	li	$v0, 1
	move	$a0, $t1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

	# return 0;
	li	$v0, 0
	jr	$ra

	.data
prompt:
	.asciiz "Enter a number: "
