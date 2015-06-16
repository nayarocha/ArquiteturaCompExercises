#Desenvolva um programa que dada uma data, representada através três
#números inteiros, um para o dia, um para o mês e outro para o ano, informe
#a data do dia seguinte.

.data 
erromsg: .asciiz "data invalida"
okmsg: .asciiz "data OK"
.text

 main:
   addi $2,$0,5 
   syscall  #ler dia
   add $8,$0,$2 
   
   addi $2,$0,5 
   syscall  #ler mes
   add $9,$0,$2 
   
   addi $2,$0,5 
   syscall  #ler ano
   add $10,$0,$2 
   # $8=dia | $9= mes | $10=ano
   
   blez $8,erro #verifica se dia <=0
   blez $9,erro #verifica se mes <=0
   blez $10,erro #verifica se ano <=0
   
   #adicionando os meses
   addi $16,$0,1
   addi $17,$0,2
   addi $18,$0,3
   addi $19,$0,4
   addi $20,$0,5
   addi $21,$0,6
   addi $22,$0,7
   addi $23,$0,8
   addi $24,$0,9
   addi $25,$0,10
   addi $26,$0,11
   addi $27,$0,12

    # $8=dia | $9= mes | $10=ano		
   #verificando os meses de acordo com a entrada
   beq $9,$16,mes31 # if $9 == 1 | janeiro 
   beq $9,$17,mes28 #fevereiro 
   beq $9,$18,mes31 # if $9 == 3 | marco
   beq $9,$19,mes30 
   beq $9,$20,mes31 #maio
   beq $9,$21,mes30 
   beq $9,$22,mes31 #julho
   beq $9,$23,mes31 #agosto
   beq $9,$24,mes30  
   beq $9,$25,mes31 #outubro
   beq $9,$26,mes30 
   beq $9,$27,mes31 #dezembro


  # $8=dia | $9= mes | $10=ano
mes28:
   addi $11,$0,28
   bgt $8,$11 erro # se dia>28
   beq $8,$11,finalmes
   
   
   addi $11,$8,1 # somando dia+1
   
   add $4,$0,$11
   addi $2,$0,1
   syscall #imprime o proximo dia
   
   add $4,$0,$9
   addi $2,$0,1
   syscall #imprime mes
   
   add $4,$0,$10
   addi $2,$0,1
   syscall#imprime ano 
   j fim
  # $8=dia | $9= mes | $10=ano   
  
mes30:
  addi $11,$0,30
  bgt $8,$11,erro # se dia>30
  beq $8,$11,finalmes
 
  addi $11,$8,1 # somando dia+1
   
   add $4,$0,$11
   addi $2,$0,1
   syscall #imprime o proximo dia
   
   add $4,$0,$9
   addi $2,$0,1
   syscall #imprime mes
   
   add $4,$0,$10
   addi $2,$0,1
   syscall#imprime ano 
   j fim
    # $8=dia | $9= mes | $10=ano  


dez:
  addi $11,$0,31
  beq $8,$11,novo
  
   addi $11,$8,1 # somando dia+1
   
   add $4,$0,$11
   addi $2,$0,1
   syscall #imprime o proximo dia
   
   add $4,$0,$9
   addi $2,$0,1
   syscall #imprime mes
   
   add $4,$0,$10
   addi $2,$0,1
   syscall#imprime ano 
   j fim
  
  
mes31:
  addi $11,$0,31
  bgt $8,$11,erro # se dia>31
  beq $9,$27,dez
  beq $8,$11,finalmes 

  addi $11,$8,1 # somando dia+1
   
   add $4,$0,$11
   addi $2,$0,1
   syscall #imprime o proximo dia
   
   add $4,$0,$9
   addi $2,$0,1
   syscall #imprime mes
   
   add $4,$0,$10
   addi $2,$0,1
   syscall#imprime ano 
   j fim
    
  
finalmes:
  addi $11,$0,1 #dia 1 do mes
  add $12,$9,1 #somando mes+1
  
  add $4,$0,$11
  addi $2,$0,1
  syscall #imprime dia 1
   
   add $4,$0,$12
   addi $2,$0,1
   syscall #imprime prox mes
   
   add $4,$0,$10
   addi $2,$0,1
   syscall#imprime ano 
novo:
   addi $11,$0,1
   addi $12,$0,1
   addi $13,$10,1
   
   add $4,$0,$11
   addi $2,$0,1
   syscall #imprime o proximo dia
   
   add $4,$0,$12
   addi $2,$0,1
   syscall #imprime mes
   
   add $4,$0,$13
   addi $2,$0,1
   syscall#imprime ano 
   j fim

erro:
      li $2,4
      la $4,erromsg
      syscall 
      j fim
      
fim:nop
   
   