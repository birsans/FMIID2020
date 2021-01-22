		.macro usrinput
		li $v0, 4			# afisare mesaj pt valoarea n
		la $a0, usr_inputn
		syscall
		
		li $v0, 5			# preluarea input de la user
		syscall
		
		move $t0, $v0			# stocarea valorii data de user in $t0
		
		li $v0, 4			# afisare mesaj pt valoarea k
		la $a0, usr_inputk
		syscall
		
		li $v0, 5			# preluarea input de la user
		syscall	
			
		move $t1, $v0			# stocarea valorii data de user in $t1
		
		.end_macro 
		.macro comb
			addi $sp,$sp,-16

			sw $ra,0($sp)
			sw $s0,4($sp)
			sw $s1,8($sp)
			sw $s2,12($sp)

			add $s0, $a0, $zero
			add $s1, $a1, $zero
			.end_macro
	
	
	.macro return1
			beq $s0, $s1, return1   #if ( n == k ) return 1;
			beq $s0,$zero,return1  #if ( n == 1 ) return 1;
			beq $s1,$zero,return1  #if ( k == 1 ) return 1;

			addi $a0,$s0,-1
		.end_macro


		.macro cn1k
			add $s2,$zero,$v0     #  $s2 = c(n-1, k)
			addi $a0,$s0,-1
			addi $a1,$s1,-1
		.end_macro
			
			     .macro cs2     
			add $v0,$v0,$s2   	#v0=c(n-1, k - 1) + $s2  unde $s2 = c(n-1, k)   
			.end_macro 
			.macro excomb
				lw $ra,0($sp)       
				lw $s0,4($sp)
				lw $s1,8($sp)
				lw $s2,12($sp)
			addi $sp,$sp,16       
		jr $ra
			.end_macro
		


