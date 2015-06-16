.data
  msgmaior: .asciiz "\n maior numero: "
.text
main:  addi $8,$0,0 #cont
       addi $9,$0,10 #parada
       addi $7,$0, 0x10040000 
       
      
       
       #inserindo as 10 notas
       for: beq $8,$9, sai_for #if ($8==$9) 
            addi $2, $0, 5
      	    syscall
            sw $2, 0($7)
            addi $7,$7,4
            addi $8,$8,1
       	    j for 
 
sai_for: 
	 bgt $4,$5,maior1 #if($4>$5) 
         #senao
         add $10,$0,$5
    	   
    
         addi $8,$0,0 #cont
         addi $9,$0,10 #parada
         addi $10,$0,0 #maior numero
   
     maior2: beq $8,$9,fim1
           lw $4,-40($7) #ultimo num
           lw $5,-36($7) #anterior 
           
           bgt $4,$10,maior3 #if($4>$10-maior)
    	   
    	   addi $7,$7,4
           addi $8,$8,1 #incremento
           j maior2 
    
   
maior1: add $10,$0,$4 #num maior 
         
        j maior2
  
   
maior3:
  add $10,$0,$4 #num maior 
addi $8,$8,1 #cont
 j maior2

fim1:
li $2,4 
la $4,msgmaior
syscall
 add $4,$0,$10
 addi $2,$0,1
 syscall
   lw $11,0($7)
   sw $10,0($7)
   

 