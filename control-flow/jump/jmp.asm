section .data
    jmpmsg DB "Entering debug mode...", 0x0A
    devmsg DB "Entering dev mode...", 0x0A

section .text
    global _start

_start:
    mov rax, 1 ; sys_write call
    mov rdi, 1 ; stdout file descriptor
    mov rsi, devmsg ; address of devmsg
    mov rdx, 21 ; size type: devmsg
    syscall

    jmp _debug ; jump to _debug

    mov rax, 60
    mov rdi, 0
    syscall

_debug:
    mov rax, 1
    mov rdi, 1
    mov rsi, jmpmsg
    mov rdx, 23
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
