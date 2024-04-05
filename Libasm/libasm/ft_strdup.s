section .text
extern ft_strlen, ft_strcpy
global ft_strdup

ft_strdup:
    ; Sauvegarde RDI (l'adresse source) dans RBX au début
    mov rbx, rdi

    ; Appelle ft_strlen pour obtenir la longueur de la chaîne
    call ft_strlen
    inc rax                 ; Ajoute de l'espace pour le terminateur null

    ; Prépare les arguments pour mmap
    mov rdi, 0              ; L'adresse (NULL, donc le noyau choisit l'adresse de la page)
    mov rsi, rax            ; La longueur (taille de la mémoire à allouer)
    mov rdx, 7              ; prot (PROT_READ | PROT_WRITE | PROT_EXEC)
    mov r10, 0x22           ; flags (MAP_PRIVATE | MAP_ANONYMOUS)
    mov r8, -1              ; fd (-1 because we are not mapping a file)
    mov r9, 0               ; offset (0, because no file)

    ; Appel système pour mmap
    mov rax, 9
    syscall

    ; Vérifie si mmap a échoué
    cmp rax, -1
    je .alloc_fail

    ; À ce stade, RAX contient l'adresse de la mémoire allouée
    ; Restaure l'adresse de destination (mémoire allouée) dans RDI pour ft_strcpy
    mov rdi, rax            
    ; Restaure RSI à l'adresse source de la chaîne à partir de RBX
    mov rsi, rbx            
    call ft_strcpy

    ; Avant de terminer, place l'adresse de la mémoire allouée (dans RDI) dans RAX pour le retour
    mov rax, rdi

    jmp .done
.alloc_fail:
    xor rax, rax            ; En cas d'échec, assurez-vous que RAX est 0 pour signaler l'échec proprement
.done:
    ret