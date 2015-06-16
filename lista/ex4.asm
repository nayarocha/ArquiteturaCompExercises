#Desenvolva um programa que leia três números e mostre o maior

main:
    #---Ler primeiro numero---#
   addi $2,$0,5 
   syscall  
   add $8,$0,$2 #numero 1 no $8
   
   #---Ler segundo numero---#
   addi $2,$0,5 
   syscall  
   add $9,$0,$2 #numero 2 no $9
   
    #---Ler terceiro numero---#
   addi $2,$0,5 
   syscall  
   add $10,$0,$2 #numero 2 no $9
   
   slt $11,$8,$9 #compara se $8 < $9 | $11=1
   beq $11,$0,maior1 #se $11=0 o $8 é o maior
   
   slt $11,$9,$10 #compara se $9<$10
   beq $11,$0,maior3 #se $11=0 o $9 é o maior
   
   maior3:
   	addi $2,$0,1
   	add $4,$0,$9
   	syscall
   	j fim 
   
   maior1: 
   	  slt $11,$8,$10 #compara se $8<$10 | $11=1
   	  beq $11,$0,maior2
   	  
   	  addi $2,$0,1
   	  add $4,$0,$10
   	  syscall
   	  j fim
   	  
   
   maior2:
   	addi $2,$0,1
   	add $4,$0,$8
   	syscall
   	j fim
   	  	  
   fim:nop
   
     
    
   
   
   