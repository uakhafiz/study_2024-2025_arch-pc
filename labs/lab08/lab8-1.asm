; lab8-1.asm - простой цикл
%include "in_out.asm"

SECTION .data
msg1 db "Введите N: ",0
msg2 db "Счетчик: ",0

SECTION .bss
N: resb 10

SECTION .text
global _start

_start:
    ; Вывод приглашения
    mov eax, msg1
    call sprint

    ; Ввод N
    mov ecx, N
    mov edx, 10
    call sread

    ; Преобразование N в число
    mov eax, N
    call atoi
    mov ecx, eax      ; ecx = N

    ; Простой цикл с счетчиком
    mov ebx, 1        ; начинаем с 1

loop_start:
    cmp ebx, ecx      ; сравниваем ebx с N
    jg loop_end       ; если ebx > N, выходим

    push ecx
    push ebx

    mov eax, msg2
    call sprint
    pop eax
    call iprintLF
    pop ecx

    inc ebx           ; ebx = ebx + 1
    jmp loop_start    ; повторяем цикл

loop_end:
    call quit
