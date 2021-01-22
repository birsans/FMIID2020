.data
v: .word 1, 2, 3, 4, 5
n: .word 5
i: .space 4
max: .space 4

newline: .asciiz "\n"

.text
main:
	li		$t0, 0
	sw		$t0, i
	
	lw		$t0, v
	sw		$t0, max
	
#loop	
start:	
	lw		$t0, i
	addi		$t0, $t0, 1	# $t0 = $t0 + 1
	sw		$t0, i
	
	lw		$t1, n
	bge		$t0, $t1, end	# if $t0 >= $t1 then end
	
	add		$t0, $t0, $t0		# $t0 = $t0 + $t0
	add		$t0, $t0, $t0		# $t0 = $t0 + $t0
	
	lw		$t0, v($t0)
	lw		$t1, max
	ble		$t0, $t1, start		# daca $t0 <= $t1 atunci start
	sw		$t0, max
	
	j start
	
end:
	li		$v0, 1		# syscall pt print int
	lw		$a0, max
	syscall				# executie
	
	li		$v0, 4		# syscall pt print string
	la		$a0, newline
	syscall				# executie
	
	li		$v0, 10
	syscall