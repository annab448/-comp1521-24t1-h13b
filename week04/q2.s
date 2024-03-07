FLAG_ROWS=6
FLAG_COLS=12
	.text
main:
        # Args:     None
        #
        # Returns:  $v0: int
        #
        # Frame:    [...]
        # Uses:     [...]
        # Clobbers: [...]
        #
        # Locals:
        #   - row	$t0
	#   - col	$t1
        #
        # Structure:
        #   main
        #   -> [prologue]
        #     -> body
        #   -> [epilogue]
main__prologue:

main__body:
main__row_loop_init:
	li	$t0, 0	# row = 0
main__row_loop_cond:
	bge	$t0, FLAG_ROWS, main__row_loop_end	#  for (int row = 0; row < FLAG_ROWS; row++) {


main__col_loop_init:
	li	$t1, 0
main__col_loop_cond:
	bge	$t1, FLAG_COLS, main__col_loop_end

	# &flag[row][col]
	la	$t2, flag
	mul	$t3, $t0, FLAG_COLS
	add	$t2, $t2, $t3		# $t2 = &flag[row][0]

	add	$t2, $t2, $t1		# $t2 = &flag[row][col]

	lb	$t3, ($t2)		# $t3 = flag[row][col]

	move	$a0, $t3
	li	$v0, 11
	syscall

	add	$t1, $t1, 1
	b	main__col_loop_cond
main__col_loop_end:

	# print('\n')
	li	$v0, 11
	li	$a0, '\n'
	syscall

	add	$t0, $t0, 1	# row++
	b main__row_loop_cond

main__row_loop_end:


main__epilogue:
	li	$v0, 0
	jr	$ra



	.data
# This label inside the data region refers to the bytes of the flag.
# Note that even thought the bytes are listed on separate lines,
# they are actually stored as a single contiguous chunk or 'string' in memory.
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
