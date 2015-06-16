#Escreva um programa que leia 10 números e mostre-os na ordem inversa a que foram lidos.

#Escreva um programa que leia 10 n?meros e mostre-os na ordem em que foram lidos.
.data
  .word 0  #0x10010000
  .word 0  #0x10010004
  .word 0  #0x10010008
  .word 0
  
.text
main:  addi $8,$0,0 #cont
       addi $9,$0,10 #parada
       lui $7, 0x1001
       
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

    laco: beq $8,$9,sai_laco
          addi $2,$0,1
          lw $4,-4($7)
          syscall 
          sub $7,$7,4 
          addi $8,$8,1
          j laco 

sai_laco:nop
    
       