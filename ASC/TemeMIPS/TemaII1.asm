.data
 n: .word 12
 z: .space 4
.text
	main:
 		lw $t0,n
 		blt $t0,$zero,exit    # n<0 se duce catre exit
 		li $t1,3
 	
 	
 		li $t4,1
 		blt $t0,$t1,memz  
 		li $t2,1    
 		         
 		li $t3,1
 		add $t4,$t2,$t3
 	fib:    # Fibonacci
 			
 			beq $t1,$t0,memz   #daca $t0 cu $t1  sunt egale avanseaza la memz
  			add $t2,$t3,$0     #aduna in $t2 valoarea din $t3 si $0
 			add $t3,$t4,$0      
  			add $t4,$t2,$t3     
  			addi $t1,$t1,1      
  		j fib
 	memz:  
  		 sw $t4,z          
  		 j exit
  

exit:
 li $v0, 10   #finalul programului
 syscall
