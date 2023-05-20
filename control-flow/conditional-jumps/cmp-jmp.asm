section .data
    myint DB 1 ; define 1 as myint

    ; define string buffer
    gestr DB "myint is greater than or equal 1"
    lestr DB "myint is less than or equal 1"

section .text
    global _start

_start:
    cmp byte [myint], 2 ; compare value of myint with 2
    jge _cmpgeresult ; jge (jump greater equal). jump to _cmpgeresult if myint is greater or equal 2
    jl _cmpleresult ; jle (jump less equal). jump to _cmpleresult if myint is less or equal 2

    ; sys_exit
    mov rax, 60
    mov rdi, 0
    syscall

_cmpgeresult:
    mov rax, 1 ; sys_write code
    mov rdi, 1 ; stdout file descriptor code
    mov rsi, gestr ; address of gestr buffer
    mov rdx, 32 ; size of gestr buffer
    syscall

    ; sys_exit
    mov rax, 60
    mov rdi, 0
    syscall

_cmpleresult:
    ; sys_write call
    mov rax, 1 ; sys_write code
    mov rdi, 1 ; stdout file descriptor code
    mov rsi, lestr ; address of lestr buffer
    mov rdx, 29 ; size of lestr buffer
    syscall

    ; sys_exit
    mov rax, 60
    mov rdi, 0
    syscall

; compile
; nasm cmp-jmp.asm -o cmp-jmp.o

; link
; ld cmp-jmp.o -o cmp-jmp

; execute
; ./cmp-jmp
