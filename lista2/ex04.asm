#Escreva um programa que leia 20 números e diga quantos são pares e quais são.

.data
   imparmsg: .asciiz " -Impar \n"
   parmsg: .asciiz " -par \n"
     quant: .asciiz " -Quantidade \n"
  .word 0  #0x10010000
  .word 0  #0x10010004
  .word 0  #0x10010008
  .word 0
  
.text
main:  addi $8,$0,0 #cont
       addi $9,$0,20 #parada
       addi $7,$0, 0x10040000 
       
       #inserindo os 20 numeros
       for: beq $8,$9, sai_for #if ($8==$9) 
            addi $2, $0, 5
      	    syscall
            sw $2, 0($7)
            addi $7,$7,4
            addi $8,$8,1
       	    j for 
 
sai_for: 
    addi $8,$0,0 #cont
    addi $9,$0,20 #parada
    addi $10,$0,2
    addi $12,$0,0 #quantPares

    laco: beq $8,$9,sai_laco
          #addi $2,$0,1
          lw $4,-80($7)
          #syscall 
          
           div $4,$10
   	   mfhi $11
   
          
          beq $11,$0,par
          #li $2,4
          #la $4,imparmsg
          #syscall 
          
          
          addi $7,$7,4 
          addi $8,$8,1
          j laco 


par:
  addi $2,$0,1
  lw $4,-80($7)
  syscall 
  li $2,4
  la $4,parmsg
  syscall 
  addi $12,$12,1 #quantPares
  addi $7,$7,4 
  addi $8,$8,1
  j laco
sai_laco:
   li $2,4
   la $4,quant
   syscall
   
  add $4,$0,$12
  addi $2,$0,1
  syscall
   
   
    
               