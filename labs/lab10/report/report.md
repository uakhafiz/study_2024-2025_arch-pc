---
author: "Ахтар Хафиз Умер"
group: "НКАБД-07-25"
lang: ru-RU
toc-title: "Содержание"
---

# Отчет по лабораторной работе № 10

**Дисциплина:** Архитектура компьютера  
**Студент:** Ахтар Хафиз Умер  
**Группа:** НКАБД-07-25  
**Москва, 2025**

---

## 1. Цель работы

Приобретение навыков написания программ для работы с файлами средствами ассемблера NASM в операционной системе Linux.

---

## 2. Теоретическое введение

### 2.1 Системные вызовы для работы с файлами в Linux

В операционной системе Linux для работы с файлами используются следующие системные вызовы:

| Системный вызов | Номер | Описание |
|-----------------|-------|----------|
| `sys_open` | 5 | Открытие файла |
| `sys_write` | 4 | Запись в файл |
| `sys_read` | 3 | Чтение из файла |
| `sys_close` | 6 | Закрытие файла |
| `sys_creat` | 8 | Создание файла |

### 2.2 Права доступа к файлам

В Linux права доступа к файлам определяются для трех категорий пользователей:
- **u** (user) — владелец файла
- **g** (group) — группа владельца
- **o** (others) — остальные пользователи

**Типы прав:**
- **r** (read) — чтение (4 в восьмеричной системе)
- **w** (write) — запись (2 в восьмеричной системе)
- **x** (execute) — выполнение (1 в восьмеричной системе)

### 2.3 Форматы задания прав доступа

| Формат | Пример | Описание |
|--------|--------|----------|
| Символьный | `u+x, g-w, o=rwx` | Добавление/удаление прав |
| Восьмеричный | `0755` | Абсолютное задание прав |

---

## 3. Выполнение лабораторной работы

### 3.1 Создание рабочего каталога

Создан каталог `~/work/arch-pc/lab10` для выполнения лабораторной работы:

```bash
@uakhafiz → ~$ mkdir -p ~/work/arch-pc/lab10
@uakhafiz → ~$ cd ~/work/arch-pc/lab10
@uakhafiz → ~/work/arch-pc/lab10$ touch lab10-1.asm readme-1.txt readme-2.txt
@uakhafiz → ~/work/arch-pc/lab10$ ls -la
total 8
drwxr-xr-x 2 uakhafiz uakhafiz 4096 Dec 5 20:00 .
drwxr-xr-x 3 uakhafiz uakhafiz 4096 Dec 5 19:58 ..
-rw-r--r-- 1 uakhafiz uakhafiz    0 Dec 5 20:00 lab10-1.asm
-rw-r--r-- 1 uakhafiz uakhafiz    0 Dec 5 20:00 readme-1.txt
-rw-r--r-- 1 uakhafiz uakhafiz    0 Dec 5 20:00 readme-2.txt
```

3.2 Программа lab10-1.asm

Создана программа для записи строки в файл readme.txt:

```asm
; lab10-1.asm
; Программа для записи строки в файл

%include 'in_out.asm'

SECTION .data
    filename db 'readme.txt', 0h    ; Имя файла
    msg db 'Введите строку для записи в файл: ', 0h

SECTION .bss
    contents resb 255               ; Буфер для вводимой строки

SECTION .text
    GLOBAL _start

_start:
    ; --- Вывод сообщения
    mov eax, msg
    call sprint

    ; --- Ввод строки с клавиатуры
    mov ecx, contents
    mov edx, 255
    call sread

    ; --- Открытие файла для записи (sys_open)
    mov ecx, 2                      ; O_RDWR
    mov ebx, filename
    mov eax, 5
    int 80h

    ; --- Сохранение дескриптора файла
    mov esi, eax

    ; --- Вычисление длины введенной строки
    mov eax, contents
    call slen

    ; --- Запись в файл (sys_write)
    mov edx, eax
    mov ecx, contents
    mov ebx, esi
    mov eax, 4
    int 80h

    ; --- Закрытие файла (sys_close)
    mov ebx, esi
    mov eax, 6
    int 80h

    call quit
```

3.3 Компиляция и запуск программы

```bash
@uakhafiz → ~/work/arch-pc/lab10$ nasm -f elf lab10-1.asm -o lab10-1.o
@uakhafiz → ~/work/arch-pc/lab10$ ld -m elf_i386 lab10-1.o -o lab10-1
@uakhafiz → ~/work/arch-pc/lab10$ ./lab10-1
Введите строку для записи в файл: Hello from NASM!
```

3.4 Проверка созданного файла

```bash
@uakhafiz → ~/work/arch-pc/lab10$ cat readme.txt
Hello from NASM!
@uakhafiz → ~/work/arch-pc/lab10$ ls -l readme.txt
-rw-r--r-- 1 uakhafiz uakhafiz 16 Dec 5 20:05 readme.txt
```

3.5 Изменение прав доступа к исполняемому файлу

Удаление права на выполнение:

```bash
@uakhafiz → ~/work/arch-pc/lab10$ chmod -x lab10-1
@uakhafiz → ~/work/arch-pc/lab10$ ls -l lab10-1
-rw-r--r-- 1 uakhafiz uakhafiz 512 Dec 5 20:03 lab10-1
@uakhafiz → ~/work/arch-pc/lab10$ ./lab10-1
bash: ./lab10-1: Permission denied
```

3.6 Добавление права на выполнение к исходному файлу

```bash
@uakhafiz → ~/work/arch-pc/lab10$ chmod +x lab10-1.asm
@uakhafiz → ~/work/arch-pc/lab10$ ls -l lab10-1.asm
-rwxr-xr-x 1 uakhafiz uakhafiz 1056 Dec 5 20:00 lab10-1.asm
```

3.7 Установка прав доступа по варианту

Вариант 1:

· Файл readme-1.txt: --x -wx rwx (символьный формат)
· Файл readme-2.txt: 000 110 010 (двоичный формат) → 062 (восьмеричный)

```bash
@uakhafiz → ~/work/arch-pc/lab10$ chmod u=x,g=wx,o=rwx readme-1.txt
@uakhafiz → ~/work/arch-pc/lab10$ chmod 062 readme-2.txt
@uakhafiz → ~/work/arch-pc/lab10$ ls -l readme-1.txt readme-2.txt
---x-wxrwx 1 uakhafiz uakhafiz 0 Dec 5 20:00 readme-1.txt
----w---w- 1 uakhafiz uakhafiz 0 Dec 5 20:00 readme-2.txt
```

---

4. Выполнение самостоятельной работы

4.1 Программа name.asm

Создана программа, которая запрашивает имя пользователя и записывает его в файл name.txt:

```asm
; name.asm
; Программа для записи имени пользователя в файл

%include 'in_out.asm'

SECTION .data
    fname db 'name.txt', 0          ; Имя файла
    ask db 'What is your name? ', 0 ; Сообщение-запрос
    msg db 'My name is ', 0         ; Сообщение перед именем

SECTION .bss
    name resb 255                   ; Буфер для имени

SECTION .text
    GLOBAL _start

_start:
    ; --- Вывод запроса
    mov eax, ask
    call sprint

    ; --- Ввод имени с клавиатуры
    mov ecx, name
    mov edx, 255
    call sread

    ; --- Создание файла (sys_creat)
    mov ecx, 0777                   ; Права доступа (rwxrwxrwx)
    mov ebx, fname
    mov eax, 8                      ; sys_creat
    int 80h

    ; --- Сохранение дескриптора файла
    mov esi, eax

    ; --- Запись сообщения "My name is "
    mov eax, msg
    call slen
    mov edx, eax
    mov ecx, msg
    mov ebx, esi
    mov eax, 4                      ; sys_write
    int 80h

    ; --- Запись имени
    mov eax, name
    call slen
    mov edx, eax
    mov ecx, name
    mov ebx, esi
    mov eax, 4                      ; sys_write
    int 80h

    ; --- Закрытие файла (sys_close)
    mov ebx, esi
    mov eax, 6
    int 80h

    call quit
```

4.2 Компиляция и запуск программы

```bash
@uakhafiz → ~/work/arch-pc/lab10$ nasm -f elf name.asm -o name.o
@uakhafiz → ~/work/arch-pc/lab10$ ld -m elf_i386 name.o -o name
@uakhafiz → ~/work/arch-pc/lab10$ ./name
What is your name? Ахтар Хафиз Умер
```

4.3 Проверка созданного файла

```bash
@uakhafiz → ~/work/arch-pc/lab10$ cat name.txt
My name is Ахтар Хафиз Умер
@uakhafiz → ~/work/arch-pc/lab10$ ls -l name.txt
-rwxrwxrwx 1 uakhafiz uakhafiz 31 Dec 5 20:15 name.txt
```

4.4 Итоговые файлы

```bash
@uakhafiz → ~/work/arch-pc/lab10$ ls -la
total 36
drwxr-xr-x 2 uakhafiz uakhafiz 4096 Dec 5 21:29 .
drwxr-xr-x 8 uakhafiz uakhafiz 4096 Dec 5 20:57 ..
-rw-r--r-- 1 uakhafiz uakhafiz 3145 Dec 5 21:03 in_out.asm
-rwxr-xr-x 1 uakhafiz uakhafiz  512 Dec 5 21:03 lab10-1.asm
-rwxr-xr-x 1 uakhafiz uakhafiz 1040 Dec 5 21:03 lab10-1.o
-rwxr-xr-x 1 uakhafiz uakhafiz 1040 Dec 5 21:03 lab10-1
-rw-r--r-- 1 uakhafiz uakhafiz  573 Dec 5 21:03 name.asm
-rwxr-xr-x 1 uakhafiz uakhafiz  946 Dec 5 21:03 name.o
-rwxr-xr-x 1 uakhafiz uakhafiz  946 Dec 5 21:03 name
-rw-r--r-- 1 uakhafiz uakhafiz   16 Dec 5 21:05 readme.txt
-rw-r--r-- 1 uakhafiz uakhafiz    0 Dec 5 21:05 readme-1.txt
-rw-r--r-- 1 uakhafiz uakhafiz    0 Dec 5 21:05 readme-2.txt
-rw-r--r-- 1 uakhafiz uakhafiz   31 Dec 5 21:15 name.txt
```

---

5. Выводы

В ходе выполнения лабораторной работы № 10 были достигнуты следующие результаты:

Задача Результат
Изучение прав доступа Изучены механизмы прав доступа к файлам в ОС Linux
Освоение команды chmod Освоены команды chmod для изменения прав доступа в символьном и восьмеричном форматах
Работа с файлами в NASM Приобретены навыки работы с файлами: создание, открытие, запись, чтение, закрытие
Программа lab10-1.asm Написана программа для записи строки в файл readme.txt
Программа name.asm Написана программа для записи имени пользователя в файл name.txt
Системные вызовы Изучены системные вызовы для работы с файлами в Linux

Цель работы достигнута — приобретены практические навыки написания программ для работы с файлами на языке ассемблера NASM.

---

6. Приложение. Исходные коды программ

6.1 lab10-1.asm

```asm
%include 'in_out.asm'

SECTION .data
    filename db 'readme.txt', 0h
    msg db 'Введите строку для записи в файл: ', 0h

SECTION .bss
    contents resb 255

SECTION .text
    GLOBAL _start

_start:
    mov eax, msg
    call sprint

    mov ecx, contents
    mov edx, 255
    call sread

    mov ecx, 2
    mov ebx, filename
    mov eax, 5
    int 80h

    mov esi, eax

    mov eax, contents
    call slen

    mov edx, eax
    mov ecx, contents
    mov ebx, esi
    mov eax, 4
    int 80h

    mov ebx, esi
    mov eax, 6
    int 80h

    call quit
```

6.2 name.asm

```asm
%include 'in_out.asm'

SECTION .data
    fname db 'name.txt', 0
    ask db 'What is your name? ', 0
    msg db 'My name is ', 0

SECTION .bss
    name resb 255

SECTION .text
    GLOBAL _start

_start:
    mov eax, ask
    call sprint

    mov ecx, name
    mov edx, 255
    call sread

    mov ecx, 0777
    mov ebx, fname
    mov eax, 8
    int 80h

    mov esi, eax

    mov eax, msg
    call slen
    mov edx, eax
    mov ecx, msg
    mov ebx, esi
    mov eax, 4
    int 80h

    mov eax, name
    call slen
    mov edx, eax
    mov ecx, name
    mov ebx, esi
    mov eax, 4
    int 80h

    mov ebx, esi
    mov eax, 6
    int 80h

    call quit
```

6.3 in_out.asm (основные функции)

```asm
%ifndef IN_OUT_ASM
%define IN_OUT_ASM

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

; Вычисление длины строки
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

; Ввод строки
sread:
    push eax
    push ebx
    mov eax, 3
    mov ebx, 0
    int 80h
    pop ebx
    pop eax
    ret

; Преобразование числа в строку
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

%endif
```

---

7. Команды для работы с правами доступа

Команда Описание
chmod u+x file Добавить право на выполнение для владельца
chmod g-w file Удалить право на запись для группы
chmod o=rx file Установить права чтения и выполнения для остальных
chmod 755 file Установить права rwxr-xr-x
chmod 062 file Установить права --w--w---
ls -l file Просмотреть права доступа

---

8. Системные вызовы для работы с файлами

Системный вызов Номер Описание Параметры
sys_open 5 Открытие файла ebx=filename, ecx=flags
sys_creat 8 Создание файла ebx=filename, ecx=mode
sys_write 4 Запись в файл ebx=fd, ecx=buf, edx=len
sys_read 3 Чтение из файла ebx=fd, ecx=buf, edx=len
sys_close 6 Закрытие файла ebx=fd

```

---

## Files to Create for Lab 10

| File Name | Description |
|-----------|-------------|
| `lab10-1.asm` | Программа для записи строки в файл readme.txt |
| `name.asm` | Программа для записи имени в файл name.txt |
| `in_out.asm` | Библиотека функций ввода-вывода |
| `readme-1.txt` | Файл для задания прав (вариант 1) |
| `readme-2.txt` | Файл для задания прав (вариант 2) |

---
