#exercituiul II.4 (verificare numar prim)

.data
	x:   .word 1
	user_message:   .asciiz "dati numarul: " 
	numarul: 	.asciiz "numarul " 
	este_prim:      .asciiz  " este prim"
	nu_prim:        .asciiz  " nu este prim"
	
.text
.globl main
	main:
	
		# valoare data de user
		
		li $v0, 4
		la $a0, user_message
		syscall
	
		li $v0, 5
		syscall
		
		move $t0, $v0
		li $9, 2
		
		loopPrime:
			beq $9, $t0, isPrime
			div $t0, $9
			mfhi $10
			beq $10, $0, isNotPrime
			addi $9, $9, 1
			
			b loopPrime
		
	blt $t0, 1, isNotPrime
	beq $t0, 1, isNotPrime
	beq $t0, 2, isPrime
	
	
		
	isPrime:
		li $v0, 4
		la $a0, numarul
		syscall
		
		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 4
		la $a0, este_prim
		syscall
		
		b exitLabel
		
	isNotPrime:
	
		li $v0, 1
		move $a0, $t0
		syscall
		
		li $v0, 4
		la $a0, nu_prim
		syscall
		
		b exitLabel
	exitLabel:
		li $v0, 10
		syscall
		
	
		
		
	
	
		
	
