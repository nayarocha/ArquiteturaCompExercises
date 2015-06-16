#Desenvolva um programa que leia um número inteiro e informe se ele é
#positivo, negativo ou nulo. 
.text 
main: 
     addi $s2,$0,10 
     beq $s2,$0,nulo
     slti $s1,$s2,0 
     bne $s1,$0,negativo #if ($s1 == 1) negativo
     addi $4, $0, +1
     addi $2, $0, 1
   syscall 
   j sair 
negativo: 
   addi $4, $0,-1
   addi $2, $0, 1
   syscall
   j sair 
nulo:
  addi $4, $0,0
   addi $2, $0, 1
   syscall 
   j sair
sair: nop
     
     
      
    