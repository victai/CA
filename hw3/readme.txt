(line 80 ~ line 108)

store n in $a0

[functions]
T: 
	if $a0 > 1 ==> Recursion
	store $a0 in $v0
	multiply $v0 by 2
	return
Recursion:
	allocate a memory space of size-8-bytes ($sp -= 8)
	store $ra in 0($sp)
	store $a0 in 4($sp)
	$a0 /= 2
	jal T
	calculate the given formula by $v0 and $a0
	store the answer in $s4
	retrieve $ra	(lw $ra, 0($sp))
	move the stack pointer back	($sp += 8)
	jr $ra
	
Coding platform: Ubuntu 16.04
	
