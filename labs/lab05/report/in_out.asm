; in_out.asm
; Библиотека подпрограмм для ввода/вывода

%ifndef IN_OUT_ASM
%define IN_OUT_ASM

; Подпрограмма для вывода строки
sprint:
    push eax
    push ebx
    push ecx
    push edx
    mov ecx, eax
    mov edx, 0
.loop:
    cmp byte [ecx], 0
    je .done
    inc edx
    inc ecx
    jmp .loop
.done:
    mov eax, 4
    mov ebx, 1
    pop edx
    pop ecx
    pop ebx
    pop eax
    int 80h
    ret

; Подпрограмма для вывода строки с переводом строки
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

; Подпрограмма для чтения строки
sread:
    push eax
    push ebx
    push ecx
    push edx
    mov eax, 3
    mov ebx, 0
    pop edx
    pop ecx
    pop ebx
    pop eax
    int 80h
    ret

; Подпрограмма для завершения программы
quit:
    mov eax, 1
    mov ebx, 0
    int 80h
    ret

%endif
