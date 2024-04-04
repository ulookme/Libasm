section .text
extern _malloc
extern _ft_strlen
extern _ft_strcpy
global _ft_strdup
_ft_strdup:
    ; Assume RDI contains the pointer to the string to duplicate
    call _ft_strlen          ; Get the length of the string
    inc rax                 ; Add space for the null terminator
    mov rdi, rax            ; Set size for malloc
    call _malloc             ; Allocate memory
    test rax, rax           ; Check if malloc failed
    je .alloc_fail          ; Jump if allocation failed
    mov rdi, rax            ; Set destination for strcpy
    mov rsi, [rsp + 8]      ; Set source as original string pointer
    call _ft_strcpy          ; Copy the string
    jmp .done               ; Jump to done
.alloc_fail:
    xor rax, rax            ; Clear RAX to signal error
.done:
    ret                     ; Return with new string pointer or null