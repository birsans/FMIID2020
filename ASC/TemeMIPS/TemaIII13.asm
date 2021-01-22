
.macro functia
 subu $t0,$sp,4
 sw $fp,0($sp)
 addiu $fp,$sp,0  
 lw $t2,4($fp)    
 li $v0,0
 li $t0,0
 .end_macro 
.data
x: .word 1
s: .asciiz "florin"

.text
main:
 la $t1,s     
 subu $t0,$sp,4
 sw $t1,0($sp)
 jal Strlen
 add $t0,$sp,4
 sw $v0,x
 li $v0,10
 syscall
 
	Strlen:
		functia
 	bucla:
  		lb  $t1,-100($t2)   #citeste caracterul
 	        beqz $t1,exit       #if null -> exit
  		addi $t2,$t2,1      #urmatoarea adresa
  		addi $v0,$v0,1      #  numarare caractere
 	 j bucla
  exit:
   lw $t3,4($fp)
   sub $v0,$t2,$t3
   lw $fp,0($fp)
   addu $t0,$sp,4
   jr $ra