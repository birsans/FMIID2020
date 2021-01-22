
.data
x: .word 1
s: .asciiz "qwerty"

.text
main:
 la $t1,s      #array
 subu $t0,$sp,4
 sw $t1,0($sp)
 jal Strlen
 add $t0,$sp,4
 sw $v0,x
 li $v0,10
 syscall
Strlen:
 subu $t0,$sp,4
 sw $fp,0($sp)
 addiu $fp,$sp,0   #fp points to sp
 lw $t2,4($fp)     #array adress
 li $v0,0
 li $t0,0
 loop:
  lb  $t1,-100($t2)   #read character
  beqz $t1,exit    #if NULL -> exit
  addi $t2,$t2,1   #go to next adress
  addi $v0,$v0,1  #count characters
  j loop
  exit:
   lw $t3,4($fp)
   sub $v0,$t2,$t3
   lw $fp,0($fp)
   addu $t0,$sp,4
   jr $ra