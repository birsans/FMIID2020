

.data
.macro at
sub $sp, $sp,4
sw $ra, 0($sp)
move $t0, $a0
li $v0, 0
.end_macro

.macro nextt
lb $t1, ($t0)
blt $t1, 48, endloop
bgt $t1, 57, endloop
mul $v0, $v0, 10
add $v0, $v0, $t1
sub $v0, $v0, 48
add $t0, $t0, 1
.end_macro

string: .ascii "6"

.text
main: 
la $a0, string
jal atoi

move $a0, $v0
li $v0, 1
syscall
exit: # exit
li $v0, 10
syscall

atoi: 
	at #macro atoi
next: 
	nextt #macro Next
b next
endloop:
lw $ra, 0($sp)
add $sp, $sp, 4
# terminarea functiei
jr $ra



