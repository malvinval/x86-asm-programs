section .data
    res DB "equal", 0x0A

section .text
    global _start

_start:
    mov r13, 88
    mov r14, 88
    cmp r13, r14 ; compare r13 and r14
    je _isEqual ; jump if they r equal

    mov rax, 60
    mov rdi, 0
    syscall

_isEqual:
    mov rax, 1
    mov rdi, 1
    mov rsi, res
    mov rdx, 6

    syscall

    mov rax, 60
    mov rdi, 0
    syscall

