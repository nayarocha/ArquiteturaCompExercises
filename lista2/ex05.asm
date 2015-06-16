#Escreva um programa que leia notas de 30 alunos, depois mostre a média da turma,
#quantos alunos estão acima da média e liste todas as notas dos alunos acima da média.

.data
  msgmedia: .asciiz "\n Media da turma: "
   msgal: .asciiz "\n Alunos acima da media: "
  
  .word 0  #0x10010000
  .word 0  #0x10010004
  .word 0  #0x10010008
  .word 0
  
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
    addi $8,$0,0 #cont
    addi $9,$0,10 #parada
    addi $10,$0,0 #media da turma
    addi $11,$0,0 #quant alunos acima da media
    addi $12,$0,5 #media aluno
    

    media: beq $8,$9,sai_media     
           lw $4,-40($7)
           bgt $4,$12,aprov #if($4>5) acima da media
           
          add $10,$10,$4
          addi $7,$7,4 
          addi $8,$8,1
          j media 
          
       

aprov: addi $11,$11,1 #cont alunos acima da média
       add $4,$0,$4
       addi $2,$0,1
       syscall
       add $10,$10,$4
          addi $7,$7,4 
          addi $8,$8,1
       j media
 

sai_media:li $2,4 
          la $4,msgmedia
          syscall
	  
	 div $10,$10,10	#media da turma
	 add $4,$0,$10
  	 addi $2,$0,1
         syscall
         
         li $2,4 
          la $4,msgal
          syscall
          
        add $4,$0,$11 #alunos acima da media
       addi $2,$0,1
       syscall
         
         
	


