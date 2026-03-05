; in_out.asm - библиотека для ввода/вывода

; Вычисление длины строки
slen:
    push ebx
    mov ebx, eax
nextchar:
    cmp byte [eax], 0
    jz finish
    inc eax
    jmp nextchar
finish:
    sub eax, ebx
    pop ebx
    ret

; Вывод строки
sprint:
    push edx
    push ecx
    push ebx
    push eax
    call slen
    mov edx, eax
    pop eax
    mov ecx, eax
    mov ebx, 1
    mov eax, 4
    int 80h
    pop ebx
    pop ecx
    pop edx
    ret

; Вывод строки с переводом строки
sprintLF:
    call sprint
    push eax
    mov eax, 0Ah
    push eax
    mov eax, esp
    call sprint
    pop eax
    pop eax
    ret

; Ввод строки
sread:
    push ebx
    push ecx
    push edx
    mov edx, eax
    mov ecx, ebx
    mov ebx, 0
    mov eax, 3
    int 80h
    pop edx
    pop ecx
    pop ebx
    ret

; Преобразование ASCII в число
atoi:
    push ebx
    push ecx
    push edx
    push esi
    mov esi, eax
    mov eax, 0
    mov ecx, 0
.next_digit:
    xor ebx, ebx
    mov bl, [esi+ecx]
    cmp bl, 48
    jl .end_atoi
    cmp bl, 57
    jg .end_atoi
    sub bl, 48
    add eax, ebx
    mov ebx, 10
    mul ebx
    inc ecx
    jmp .next_digit
.end_atoi:
    pop esi
    pop edx
    pop ecx
    pop ebx
    ret

; Вывод числа
iprint:
    push eax
    push ecx
    push edx
    push esi
    mov ecx, 0
divide_loop:
    inc ecx
    mov edx, 0
    mov esi, 10
    idiv esi
    add edx, 48
    push edx
    cmp eax, 0
    jnz divide_loop
print_loop:
    dec ecx
    mov eax, esp
    call sprint
    pop eax
    cmp ecx, 0
    jnz print_loop
    pop esi
    pop edx
    pop ecx
    pop eax
    ret

; Вывод числа с переводом строки
iprintLF:
    call iprint
    push eax
    mov eax, 0Ah
    push eax
    mov eax, esp
    call sprint
    pop eax
    pop eax
    ret

; Завершение программы
quit:
    mov ebx, 0
    mov eax, 1
    int 80h
    ret
