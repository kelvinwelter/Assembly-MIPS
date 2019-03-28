    .text
    .globl main

main:
    la $a0, digit
    li $v0, 4
    syscall
    li $v0, 5
    syscall
    addi $s0, $v0, 0
    beq $s0, $zero, end
    j parImpar

parImpar:
    li $t0, 2
    div $s0, $t0
    mfhi $t0
    beq $t0, $zero, par
    j impar

par:
    la $a0, printpar
    li $v0, 4
    syscall
    j main

impar:
    la $a0, printimpar
    li $v0, 4
    syscall
    j main

end:
    li $v0, 10
    syscall
    .data

digit: .asciiz "Input a number: "
printpar: .asciiz "Even number\n"
printimpar: .asciiz "Odd number\n"
