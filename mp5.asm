section .bss
    input_char resb 1

section .text
    global _start

_start:
    
    mov eax, 3           
    mov ebx, 0           
    mov ecx, input_char      
    mov edx, 1          
    int 80h             

    cmp byte [input_char], 'a'
    jl character_not_uppercase
    cmp byte [input_char], 'z'
    jg character_not_uppercase

    sub byte [input_char], 32 

    mov eax, 4           
    mov ebx, 1          
    mov ecx, input_char      
    mov edx, 1           
    int 80h 
    jmp system_exit

    character_not_uppercase:

    cmp byte [input_char], 'A'
    jl not_a_character
    cmp byte [input_char], 'Z'
    jg not_a_character

    add byte [input_char], 32

    mov eax, 4           
    mov ebx, 1          
    mov ecx, input_char      
    mov edx, 1           
    int 80h 
    jmp system_exit

not_a_character:

    mov eax, 4           
    mov ebx, 1          
    mov ecx, input_char      
    mov edx, 1           
    int 80h      

system_exit:
    mov eax, 1           


