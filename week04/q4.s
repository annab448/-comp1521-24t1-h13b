
	.text

main:
main__prologue:
main__body:
main__epilogue:

change:
        # Args:     $a0: int nrows
	#	    $a1: int ncols
	#	    $a2: int M[nrows][ncols]
	#	    $a3: int factors
        #
        # Returns:  $v0: none
        #
        # Frame:    [None]
        # Uses:     [$a0, $a1, $a2, $a3, $t0-3, $t4]
        # Clobbers: [$t0-4]
        #
        # Locals:
        #   - $t0 row
	#   - $t1 col
	#   - $t2 &M[row][col]
	#   - $t3 M[row][col]
        #
        # Structure:
        #   change
        #   -> [prologue]
        #     -> body
	#        ->row_init
	#	 ->row_cond
	#	   ->col_init
	#	   ->col_cond
      	#	   -> col_end
	#	 -> row_end
        #   -> [epilogue]
change__prologue:
change__body:
change__row_init:
	li	$t0, 0
change__row_cond:
	bge	$t0, $a0, change__row_end:
	
change__col_init:
	li	$t1, 0

change__col_cond:
	bge	$t1, $a1, change__col_end

	# get &M[row][col]
	mul	$t4, $a1, 4
	mul	$t4, $t4, $t0
	add	$t2, $t4, $a3	# &M[row][0]

	mul	$t4, $t1, 4
	add	$t2, $t2, $t4	# $t2 = &M[row][col]

	lw	$t3, ($t2)	# $t3 = value

	mul	$t3, $t3, $a3	#  M[row][col] = factor * M[row][col];

	sw	$t3, ($t2)

	add	$t1, $t1, 1
	b	change__col_cond
change__col_end:
	add	$t0, $t0, 1
	b	change__row_cond
change__row_end:
change__epilogue:
	jr	$ra

	.data
matrix:	.word 1, 2, 3, 4
	.word 3, 4, 5, 6
	.word 5, 6, 7, 8
