#Desenvolva um programa que leia dois nú?meros e informe se eles são iguais
#ou não.

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
   
   beq $8,$9,iguais #verifica se os numeros sao iguais
   addi $4,$0,0 #imprime falso[0] quando for diferentes
   addi $2,$0,1
   syscall 
   j fim
   
iguais:
  addi $4,$0,1 #imprime Verdadeiro[1] quando for igual
  addi $2,$0,1
  syscall
  j fim 
  
fim: nop

  
   
   
   

  
