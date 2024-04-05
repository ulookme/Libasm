section .text
global ft_write

; Prototype en C:
; ssize_t ft_write(int fd, const void *buf, size_t count);

ft_write:
    mov rax, 1              ; Numéro de l'appel système pour write sous Linux x86-64
    mov rdi, rdi            ; Le premier argument, fd, est déjà dans rdi
    mov rsi, rsi            ; Le deuxième argument, buf, est déjà dans rsi
    mov rdx, rdx            ; Le troisième argument, count, est déjà dans rdx
    syscall                ; Exécute l'appel système
    ret                     ; Retourne la valeur (nombre de bytes écrits ou -1 si erreur)