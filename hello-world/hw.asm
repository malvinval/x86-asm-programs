section .data
    hw db "Hello, world!", 0x0A
    ; 0x0A is hexadecimal representing decimal 10. 10 is an instruction to print "\n" (newline)

section .text
    global _start ; start entry point must be prefixed by _

_start:
    mov rax, 1 ; move sys_write syscall code to rax
    mov rdi, 1 ; move stdout file descriptor code to rdi
    mov rsi, hw ; move the address of hw data to rsi
    mov rdx, 14 ; move size of hw data string to rdx
    syscall

    mov rax, 60 ; move sys_exit syscall code to rax
    mov rdi, 0 ; move exit status code as first parameter of sys_exit syscall to rdi
    syscall

    ; compile
    ; nasm hw.asm -o hw.o

    ; link
    ; ld hw.o -o hw
    
    ; execute
    ; ./hw