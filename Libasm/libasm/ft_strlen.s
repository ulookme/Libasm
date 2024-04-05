global ft_strlen

section .text
ft_strlen:
    xor rax, rax            ; RAX sert de compteur pour la longueur, initialisé à 0
loop_start:
    cmp byte [rdi + rax], 0 ; Compare le caractère actuel au terminateur de chaîne '\0'
    je end_loop             ; Si égal (trouve '\0'), saute à end_loop
    inc rax                 ; Sinon, incrémente le compteur (RAX)
    jmp loop_start          ; Revient au début de la boucle
end_loop:
    ret                     ; Retourne la valeur dans RAX (la longueur de la chaîne)