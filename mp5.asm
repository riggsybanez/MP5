section .bss
    buffer resb 1

section .text
    global _start

_start:
    
    mov eax, 3           
    mov ebx, 0           
    mov ecx, buffer      
    mov edx, 1          
    int 80h             

    cmp byte [buffer], 'a'
    jl character_not_uppercase
    cmp byte [buffer], 'z'
    jg character_not_uppercase

    sub byte [buffer], 32 

    mov eax, 4           
    mov ebx, 1          
    mov ecx, buffer      
    mov edx, 1           
    int 80h 
    jmp system_exit

    character_not_uppercase:

    cmp byte [buffer], 'A'
    jl not_a_character
    cmp byte [buffer], 'Z'
    jg not_a_character

    add byte [buffer], 32


not_a_character:

    mov eax, 4           
    mov ebx, 1          
    mov ecx, buffer      
    mov edx, 1           
    int 80h      

system_exit:
    mov eax, 1           



