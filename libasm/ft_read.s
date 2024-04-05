section .text
global ft_read

; Prototype en C:
; ssize_t ft_read(int fd, void *buf, size_t count);

ft_read:
    mov rax, 0              ; Numéro de l'appel système pour read sous Linux x86-64
    mov rdi, rdi            ; Le premier argument, fd, est déjà dans rdi
    mov rsi, rsi            ; Le deuxième argument, buf, est déjà dans rsi
    mov rdx, rdx            ; Le troisième argument, count, est déjà dans rdx
    syscall                ; Exécute l'appel système
    ret                     ; Retourne la valeur (nombre de bytes lus ou -1 si erreur)