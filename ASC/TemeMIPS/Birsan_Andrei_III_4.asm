.data
	usr_inputn: .asciiz  "Introdu un numar n: "
	usr_inputk: .asciiz  "introdu un numar k: "
	
	
.text
	
		li $v0, 4
		la $a0, usr_inputn
		syscall
		
		li $v0, 5
		syscall
		
		move $t0, $v0
		
		li $v0, 4
		la $a0, usr_inputk
		syscall
		
		li $v0, 5
		syscall	
			
		move $t1, $v0
		
	main:
		move $a0, $t0
		move $a1, $t1
		jal combinari

		add $a0,$v0,$zero
			li $v0,1
			syscall

			li $v0,10
			syscall

		combinari:

			addi $sp,$sp,-16

			sw $ra,0($sp)
			sw $s0,4($sp)
			sw $s1,8($sp)
			sw $s2,12($sp)

			add $s0, $a0, $zero
			add $s1, $a1, $zero

			beq $s0, $s1, return1   #if( n == k ) return 1;
			beq $s0,$zero,return1  #if ( n == 1 ) return 1;
			beq $s1,$zero,return1  #if ( k == 1 ) return 1;

			addi $a0,$s0,-1

			jal combinari
			add $s2,$zero,$v0    
			addi $a0,$s0,-1
			addi $a1,$s1,-1

			jal combinari             
			add $v0,$v0,$s2       
		exitcombinari:

lw $ra,0($sp)       
lw $s0,4($sp)
lw $s1,8($sp)
lw $s2,12($sp)
addi $sp,$sp,16       
jr $ra

return1:
 li $v0,1
 j exitcombinari