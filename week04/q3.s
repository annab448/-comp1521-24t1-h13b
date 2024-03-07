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
        #   - ...
        #
        # Structure:
        #   main
        #   -> [prologue]
        #     -> body
        #   -> [epilogue]
main__prologue:
main__body:
main__epilogue:


max:
        # Args:	    $a0: int *array
	#	    $a1: int length
        #
        # Returns:  $v0: int
        #
        # Frame:    [$ra, $s0]
        # Uses:     [$ra, $s0, $a0, $a1, $v0]
        # Clobbers: [$v0, $a0, $a1]
        #
        # Locals:
        #   - $s0: first_element
        #
        # Structure:
        #   max
        #   -> [prologue]
        #     -> body
        #   -> [epilogue]
max__prologue:
	begin
	push	$ra
	push	$s0
max__body:
	lw	$s0, ($a0)	# int first_element = array[0];
	
	move	$v0, $s0	# return first_element
	beq	$a1, 1, max__epilogue	# if (length == 1) {

	add	$a0, $a0, 4	# &array[1]
	sub	$a1, $a1, 1	# length - 1
	jal	max		# int max_so_far = max(&array[1], length - 1);

	# max_so_far $v0
	bgt	$v0, $s0, max__epilogue

	move	$v0, $s0

	

max__epilogue:
	pop	$s0
	pop	$ra
	end

	jr	$ra
	
	.data
# int numbers[10] = {12, 5, ...}
numbers:	.word 12, 5, 6, 7, 15, 7, -9, 3, 55, 2
