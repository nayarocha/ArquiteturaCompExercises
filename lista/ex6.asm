#Desenvolva um programa que leia dois n�meros a e b e deixe-os em ordem
#crescente, ou seja, o menor dever� ficar armazenado na vari�vel a e o maior
#na vari�vel b.

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
   
   beq $10,$0,maior #se $10=0 o $8 � o maior
   
   addi $2,$0,1 
   add $4,$0,$9 #se $10=1 o $9 � o maior
   syscall 
   j fim
   
   maior: add $10,$0,$8
   	  add $8,$0,$9
   	  add $9,$0,$10
   	  
   	  addi $2,$0,1
   	  add $4,$0,$8
   	  syscall
   	  
   	  addi $2,$0,1
   	  add $4,$0,$9
   	  syscall
   	  j fim
   	  
   fim:nop
