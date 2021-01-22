.data
	.include "macrocombinari.asm"
	usr_inputn: .asciiz  "Introdu un numar n: "  # valoarea lui n data de utilizator
	usr_inputk: .asciiz  "introdu un numar k: "  # valoarea lui k data de utilizator
	
	
.text
	
		usrinput
		
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

			return1		#return 1
			jal combinari
			cn1k		 #  $s2 = c(n-1, k)
			jal combinari        
			cs2		#$v0=c(n-1, k-1) 
		exitcombinari:
			excomb		#exitcombinari
				
				
		return1:
 			li $v0,1
 			j exitcombinari
 			