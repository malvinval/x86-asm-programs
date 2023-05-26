## Sections

We will have 3 sections in our program:

1. `section .data`
2. `section .bss`
3. `section .text`

> section .data : define constant variables, string, numbers, etc.

> section .bss : reserve memory space for future data

> section .text : our actual programs. contains labels: _start or main

**What is label ?**
They are simply symbols for addresses.
Example : label your jump target instruction and the assembler will resolve the correct address when you build the machine code.

**When to use _start and main label ?**
ld linker requires `_start` label.
gcc linker requires `main` label.
So, it depends on your linker.

## Registers

Registers is hardware implemented variables.

![regs](./img/x86-registers.png)

## Arithmetics Operations

```asm
; addition
add rax, 12 ; rax = rax + 12

; substraction
sub rax, 1 ; rax = rax - 1

; multiply (rax * rbx), then store the result to rax
mov rax, 12
mul rbx

; divide (rax / rbx), then store the result to rax
mov rax, 12
div rbx
```