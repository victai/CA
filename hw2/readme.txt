Step 4
	If the result of subtraction is less than 0, or the divisor is 0 ==> jump to ret	
	else put the calculation result in $s4
	
Step 5
	Divide the answer by 10 every time, store the remainder in $s5, convert it to ascii code, store $s5 in output_ascii.
	For example, if the answer is 1234, $s5 would be 4, 3, 2, 1 during the four steps.
	I thus put 4 in output_ascii[3], 3 in output_ascii[2], 2 in output_ascii[1], 1 in output_ascii[0]



Coding platform: Ubuntu 16.04
