#Desenvolva um programa que dado um número inteiro n, informe se o
#número é par ou ímpar.
.data 
parmsg: .asciiz "Par"
imparmsg: .asciiz "Impar"
.text
main:
    addi $9,$0,2
    #---Ler primeiro numero---#
   addi $2,$0,5 
   
   syscall  #INSERIR NUMERO
   add $8,$0,$2 
   
   div $8,$9
   mfhi $10
   
   beq $10,$0, par 
   
   li $2,4
   la $4,imparmsg
   syscall 
   j fim

   
   par: 
      li $2,4
      la $4,parmsg
      syscall 
      j fim
   
   fim: nop
      
   
   
   
   
   
 