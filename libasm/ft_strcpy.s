section .text
global ft_strcpy
ft_strcpy:
    xor rax, rax            ; Clear RAX to use as index
.copy_loop:
    movzx rcx, byte [rsi + rax] ; Move byte from source to RCX
    mov [rdi + rax], cl        ; Move byte from RCX to destination
    test rcx, rcx              ; Test if byte is null
    je .done                   ; If zero (end of string), we're done
    inc rax                    ; Increment index
    jmp .copy_loop             ; Repeat
.done:
    ret                        ; Return with destination in RDI