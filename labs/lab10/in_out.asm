; in_out.asm
; Библиотека функций ввода-вывода для NASM
; Студент: Ахтар Хафиз Умер
; Группа: НКАБД-07-25

%ifndef IN_OUT_ASM
%define IN_OUT_ASM

;--- 
; Вывод строки на экран
; eax = адрес строки
;---
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

;--- 
; Вывод строки на экран с переводом строки
; eax = адрес строки
;---
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

;--- 
; Вычисление длины строки
; eax = адрес строки
; Возвращает: eax = длина строки
;---
slen:
    push ebx
    mov ebx, eax
.next:
    cmp byte [ebx], 0
    je .finish
    inc ebx
    jmp .next
.finish:
    sub ebx, eax
    mov eax, ebx
    pop ebx
    ret

;--- 
; Ввод строки с клавиатуры
; ecx = адрес буфера
; edx = размер буфера
;---
sread:
    push eax
    push ebx
    mov eax, 3
    mov ebx, 0
    int 80h
    pop ebx
    pop eax
    ret

;--- 
; Преобразование числа в строку (десятичное)
; eax = число
; Возвращает: eax = адрес строки
;---
iprint:
    push eax
    push ecx
    push edx
    push esi
    mov ecx, 0
.divide:
    inc ecx
    mov edx, 0
    mov esi, 10
    idiv esi
    add edx, 48
    push edx
    cmp eax, 0
    jnz .divide
.print:
    dec ecx
    mov eax, esp
    call sprint
    pop eax
    cmp ecx, 0
    jnz .print
    pop esi
    pop edx
    pop ecx
    pop eax
    ret

;--- 
; Преобразование числа в строку с переводом строки
; eax = число
;---
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

;--- 
; Завершение программы
;---
quit:
    mov ebx, 0
    mov eax, 1
    int 80h
    ret

%endif
