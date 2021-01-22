#####################################################################
# Perfect number check                                              #
# @param int the number you would like to check                     #
# @result int 0 if the number is not perfect, otherwise 1           #
#####################################################################

.data
   n: .word 21
.text


main: 
# Initialise variables
  lw $v0 , n    
  move $s0 , $v0      # => stocheaza n in $s0
  li $s1 , 0          
  li $s2 , 1          

s:  bgeu $s2, $s0, exit # daca $s2 < $s0
    rem $t0, $s0, $s2   # $t0 = $s0 % $s2
    bne $t0, $0, w
    addu $s1, $s1, $s2  # $s1 += $s2
w:  addi $s2, $s2, 1    # $s2++
    j s              


    move $a0 , $s0      # |
    syscall             # |=> Print $s0
    jr $ra
    
exit:
 li $v0, 10   #finalul programului
 syscall