.data
li $t1,2
li $t2,3
li $t3,2
	
	et: 
		add $t1,$t2,$t3
		sub $t3,$t1,$t3
		beq $t2,$t2,et
		
		