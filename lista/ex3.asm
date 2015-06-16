#Desenvolva um programa que leia dois números e mostre o maior
.text
main:
    #---Ler primeiro numero---#
   addi $2,$0,5 
   syscall  
   add $8,$0,$2 #numero 1 no $8
   
   #---Ler segundo numero---#
   addi $2,$0,5 
   syscall  
   add $9,$0,$2 #numero 2 no $9
   
   slt $10,$8,$9 #compara se $8 < $9 | $10=1
   
   beq $10,$0,maior #se $10=0 o $8 é o maior
   
   addi $2,$0,1 
   add $4,$0,$9 #se $10=1 o $9 é o maior
   syscall 
   j fim
   
   maior: addi $2,$0,1
   	  add $4,$0,$8
   	  syscall
   	  j fim
   fim:nop
   
   
  
   