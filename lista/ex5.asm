#Desenvolva um programa que leia as duas notas de um aluno nota1 e nota2
#e informe se o aluno passou, considerando o cálculo da média do IFRN

.text 

main:   
   addi  $10,$0,2 #peso 01
   addi $11,$0,3 #peso 02 
   addi $15,$0,5 #num divisao
   
   #---Ler primeiro numero---#
   addi $2,$0,5 
   syscall  #1 nota
   add $8,$0,$2
   
   #---Ler segundo numero---#
   addi $2,$0,5 
   syscall #2 nota 
   add $9,$0,$2 
   
   mul $12,$8,$10 #mult 1 nota
   mul $13,$9,$11 #mult 2 nota  
   
   add $14,$12,$13 #soma-> mult1+mult2
   div $14,$14,$15 # div-> soma/5 
   addi  $10,$0,6 #media
   
   slt $14,$14,$10 #verifica se media < 6
   beq  $14,$0,aprovado 
   
    addi $4, $0,-1 
   addi $2, $0, 1
   syscall#REPROVADO
   j fim
   
   
   aprovado:
   	addi $2,$0,+1
   	add $4,$0,1	
   	syscall#APROVADO
   	j fim
   
   fim: nop
  
   
   
   