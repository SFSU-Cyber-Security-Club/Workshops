Section .text:
        global _start

_start:
        xor rdi, rdi ; clears the registers of any leftover values
        xor rdx, rdx 
        xor rsi, rsi
        xor rax, rax

        lea rsi, [rel data] ; rel is special  syntax to refer to a location relative
                            ; to rip, we will use this along with lea to load the address
                            ; of the string "Hello World" into rsi
        mov rdi, 0x1        ; 1 refers to the file descriptor stdout
        mov rdx, 0xD        ; 0xD refers to 13 characters to print out
        mov rax, 0x1        ; 1 refers to the system call specifying that
                            ; we want the write syscall
        syscall             ; perform the syscall!

        ret                 ; go back to the callee to avoid crash

data:
        db "Hello World\n"

