section .text
global _ft_write
_ft_write:
    mov rax, 1               ; Syscall number for sys_write
    syscall                 ; Perform the syscall
    ret                     ; Return to caller