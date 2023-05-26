; simple program to get user input

; btw, what is ret ?
; The ret instruction is used to end a subroutine, and return execution control to the address of the subroutine's caller.

section .data
    askstr DB "Enter your name: "
    ansstr DB "Hello, "

; reserve memory space for user input using resb (reserve bytes)
; name_of_memory_label resb size_of_reserved_bytes
section .bss
    uname resb 32

section .text
    global _start

_start:
    ; show input prompt
    call _show_prompt
    call _get_input
    call _show_answer
    call _show_name

    ; sys_exit kernel call
    mov rax, 60
    mov rdi, 0
    syscall

; get user input using sys_read kernel call, and stdin file descriptor.
; stdin : 0, stdout: 1, stderr: 2
_get_input:
    mov rax, 0 ; sys_read call
    mov rdi, 0 ; stdin fd
    mov rsi, uname ; memory address
    mov rdx, 32 ; size of buffer
    syscall
    ret

; "Enter your name: "
_show_prompt:
    mov rax, 1
    mov rdi, 1
    mov rsi, askstr
    mov rdx, 17
    syscall
    ret

; show ansstr
_show_answer:
    mov rax, 1
    mov rdi, 1
    mov rsi, ansstr
    mov rdx, 7
    syscall
    ret

; show inputted name
_show_name:
    mov rax, 1
    mov rdi, 1
    mov rsi, uname
    mov rdx, 32
    syscall
    ret