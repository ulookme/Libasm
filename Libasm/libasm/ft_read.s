section .text
global ft_read
extern __errno_location    ; Obtient un pointeur vers errno

ft_read:
    mov rax, 0             ; syscall number for read
    syscall                ; perform the syscall
    cmp rax, 0
    jl   set_errno         ; saute si le flag signe est défini (erreur)
    ret                    ; retourne avec le nombre de bytes lus

set_errno:
    neg  rax               ; convertit le code d'erreur en valeur positive
    push  rax
    call __errno_location wrt ..plt ; appelle __errno_location pour obtenir un pointeur vers errno
    pop  rcx
    mov  [rax], rcx        ; met à jour errno avec le code d'erreur
    mov  rax, -1           ; met à jour la valeur de retour à -1 pour indiquer une erreur
    ret                    ; retourne