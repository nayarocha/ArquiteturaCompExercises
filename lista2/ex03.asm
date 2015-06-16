#Escreva um programa que leia 10 números e mostre-os na ordem em que foram lidos,
#dizendo se o número é par ou ímpar.

.data
   imparmsg: .asciiz " -Impar \n"
   parmsg: .asciiz " -par \n"
  .word 0  #0x10010000
  .word 0  #0x10010004
  .word 0  #0x10010008
  .word 0
  
.text
main:  addi $8,$0,0 #cont
       addi $9,$0,10 #parada
       addi $7,$0, 0x10040000 
       
       #inserindo os 10 numeros
       for: beq $8,$9, sai_for #if ($8==$9) 
            addi $2, $0, 5
      	    syscall
            sw $2, 0($7)
            addi $7,$7,4
            addi $8,$8,1
       	    j for 
 
sai_for: 
    addi $8,$0,0 #cont
    addi $9,$0,10 #parada
    addi $10,$0,2

    laco: beq $8,$9,sai_laco
          addi $2,$0,1
          lw $4,-40($7)
          syscall 
          
           div $4,$10
   	   mfhi $11
   
          
          beq $11,$0,par
          li $2,4
          la $4,imparmsg
          syscall 
          
          
          addi $7,$7,4 
          addi $8,$8,1
          j laco 


par:
  li $2,4
  la $4,parmsg
  syscall 
  addi $7,$7,4 
  addi $8,$8,1
  j laco
sai_laco:nop
    
               
       
               