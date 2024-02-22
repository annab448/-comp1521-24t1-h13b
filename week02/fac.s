# n	$t0
# fac	$t1
# i	$t2

main:
	# print ("n = "
	li	$v0, 4
	la	$a0, prompt
	syscall

	# scanf("%d", &n)
	li	$v0, 5
	syscall
	move	$t0, $v0

	li	$t1, 1		# int fac = 1;
	li	$t2, 1		# int i = 1;

fac_loop_cond:
	# if (i > n) goto fac_loop_end;
	bgt	$t2, $t0, fac_loop_end

	# fac *= i
	mul	$t1, $t1, $t2

	# i++
	add	$t2, $t2, 1
	b	fac_loop_cond


fac_loop_end:
	#printf("n! =")
	li	$v0, 4
	la	$a0, output
	syscall

	print fac (%d)
	li	$v0, 1
	move	$a0, $t1
	syscall

	print '\n'
	li	$v0, 11
	li	$a0, '\n'
	syscall

	# return 0
	li	$v0, 0
	jr	$ra

	.data
prompt:
	.asciiz "n = "
output:
	.asciiz	"n! ="
