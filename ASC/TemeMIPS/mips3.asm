.data
	.include "macrocombinari.asm"
	usr_inputn: .asciiz  "Introdu un numar n: "  # valoarea lui n data de utilizator
	usr_inputk: .asciiz  "introdu un numar k: "  # valoarea lui k data de utilizator
	
	
.text
	
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
			
			comb

			return1
			jal combinari
			cn1k
			jal combinari        #$v0=c(n-1, k-1) 
			cs2
		exitcombinari:
			excomb
				
				
		return1:
 			li $v0,1
 			j exitcombinari
 			