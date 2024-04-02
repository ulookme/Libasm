section .text
global _ft_read
_ft_read:
    mov rax, 0               ; Syscall number for sys_read
    syscall                  ; Perform the syscall
    ret                      ; Return to caller