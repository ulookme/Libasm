section .text
global _ft_strcmp
_ft_strcmp:
    xor rax, rax            ; Clear RAX for use as index
.compare_loop:
    movzx rcx, byte [rdi + rax] ; Load byte from first string
    movzx rdx, byte [rsi + rax] ; Load byte from second string
    cmp cl, dl                 ; Compare the two bytes
    jne .not_equal             ; Jump if not equal
    test cl, cl                ; Check if we've reached a null terminator
    je .equal                  ; If zero, strings are equal
    inc rax                    ; Increment index
    jmp .compare_loop          ; Loop
.not_equal:
    sub rcx, rdx               ; Subtract to set return value
    mov rax, rcx
    ret
.equal:
    xor rax, rax               ; Equal, so return 0
    ret