; lab8-2.asm - вывод аргументов командной строки
%include "in_out.asm"

SECTION .text
global _start

_start:
    pop ecx        ; количество аргументов
    pop edx        ; имя программы
    sub ecx, 1     ; уменьшаем на 1

next:
    cmp ecx, 0
    jz _end
    pop eax
    call sprintLF
    loop next

_end:
    call quit
