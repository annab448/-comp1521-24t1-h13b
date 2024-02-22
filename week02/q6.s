# $t0	x

main:

	# printf("Enter a number: ");
	li	$v0, 4
	la	$a0, prompt
	syscall

	# scanf("%d", &x);
	li	$v0, 5
	syscall
	move	$t0, $v0

	# if (x <= 100) goto x_small_big;
	ble	$t0, 100, x_small_big

	# if (x >= 1000) goto x_small_big;
	bge	$t0, 1000, x_small_big

x_medium:
	# printf("medium\n");
        li      $v0, 4
        la      $a0, med_msg
        syscall

	b	epilogue

x_small_big:
	# printf("small/big\n");
        li      $v0, 4
        la      $a0, small_big_msg
        syscall

epilogue:
	li	$v0, 0
	jr	$ra

	.data
prompt:
	.asciiz "Enter a number: "
small_big_msg:
	.asciiz "small/big\n"
med_msg:
	.asciiz "medium\n"



