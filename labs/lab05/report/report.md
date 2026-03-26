---
author: "Ахтар Хафиз Умер"
group: "НКАБД-07-25"
lang: ru-RU
toc-title: "Содержание"
---

# Отчет по лабораторной работе № 5

**Дисциплина:** Архитектура компьютера  
**Студент:** Ахтар Хафиз Умер  
**Группа:** НКАБД-07-25  
**Москва, 2025**

---

## 1. Цель работы

Приобретение практических навыков работы в Midnight Commander. Освоение инструкций языка ассемблера `mov` и `int`.

---

## 2. Теоретическое введение

### 2.1 Основы работы с Midnight Commander

Midnight Commander (mc) — это программа, которая позволяет просматривать структуру каталогов и выполнять основные операции по управлению файловой системой. Midnight Commander позволяет сделать работу с файлами более удобной и наглядной.

### 2.2 Структура программы на языке ассемблера NASM

Программа на языке ассемблера NASM состоит из трёх секций:

| Секция | Описание |
|--------|----------|
| `SECTION .text` | Секция кода программы |
| `SECTION .data` | Секция инициированных данных |
| `SECTION .bss` | Секция неинициализированных данных |

### 2.3 Основные инструкции ассемблера

| Инструкция | Описание |
|------------|----------|
| `mov` | Дублирование данных источника в приёмник |
| `int` | Вызов прерывания с указанным номером |
| `int 80h` | Вызов ядра Linux |

---

## 3. Выполнение лабораторной работы

### 3.1 Создание рабочего каталога

```bash
@uakhafiz → ~/lab05 $ mkdir -p ~/lab05
@uakhafiz → ~/lab05 $ cd ~/lab05
```

3.2 Программа lab5-1.asm (без использования in_out.asm)

Код программы lab5-1.asm:

```asm
; lab5-1.asm
; Программа выводит приглашение, читает строку и выводит её

SECTION .data
    msg: DB 'Введите строку: ',10
    msgLen: EQU $-msg

SECTION .bss
    buf: RESB 80
    bufLen: EQU $-buf

SECTION .text
    GLOBAL _start

_start:
    ; Вывод приглашения
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 80h

    ; Чтение строки
    mov eax, 3
    mov ebx, 0
    mov ecx, buf
    mov edx, bufLen
    int 80h

    ; Вывод введённой строки
    mov eax, 4
    mov ebx, 1
    mov ecx, buf
    mov edx, bufLen
    int 80h

    ; Завершение программы
    mov eax, 1
    mov ebx, 0
    int 80h
```

3.3 Компиляция и запуск lab5-1.asm

```bash
@uakhafiz → ~/lab05 $ nasm -f elf lab5-1.asm
@uakhafiz → ~/lab05 $ ld -m elf_i386 -o lab5-1 lab5-1.o
@uakhafiz → ~/lab05 $ ./lab5-1
Введите строку: Ахтар Хафиз Умер
Ахтар Хафиз Умер
```

3.4 Программа lab5-2.asm (с использованием in_out.asm)

Файл in_out.asm был скачан и помещён в рабочую директорию:

```bash
@uakhafiz → ~/lab05 $ ls -la in_out.asm
-rw-rw-r-- 1 uakhafiz uakhafiz 3942 Nov 7 23:34 in_out.asm
```

Код программы lab5-2.asm:

```asm
; lab5-2.asm
; Программа с использованием подпрограмм из in_out.asm

%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите строку: ',0

SECTION .bss
    buf: RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax, msg
    call sprint

    mov ecx, buf
    mov edx, 80
    call sread

    mov eax, buf
    call sprint

    call quit
```

3.5 Компиляция и запуск lab5-2.asm

```bash
@uakhafiz → ~/lab05 $ nasm -f elf lab5-2.asm
@uakhafiz → ~/lab05 $ ld -m elf_i386 -o lab5-2 lab5-2.o
@uakhafiz → ~/lab05 $ ./lab5-2
Введите строку: Ахтар Хафиз Умер
Ахтар Хафиз Умер
```

---

4. Выполнение самостоятельной работы

4.1 Программа lab5-1-home.asm (без in_out.asm)

Модифицированная программа, которая выводит введённую строку обратно на экран:

```asm
; lab5-1-home.asm
; Программа выводит приглашение, читает строку и выводит её

SECTION .data
    msg: DB 'Введите строку: ',10
    msgLen: EQU $-msg

SECTION .bss
    buf: RESB 80
    bufLen: EQU $-buf

SECTION .text
    GLOBAL _start

_start:
    ; Вывод приглашения
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, msgLen
    int 80h

    ; Чтение строки
    mov eax, 3
    mov ebx, 0
    mov ecx, buf
    mov edx, bufLen
    int 80h

    ; Вывод введённой строки
    mov eax, 4
    mov ebx, 1
    mov ecx, buf
    mov edx, bufLen
    int 80h

    ; Завершение программы
    mov eax, 1
    mov ebx, 0
    int 80h
```

Тестирование программы:

```bash
@uakhafiz → ~/lab05 $ ./lab5-1-home
Введите строку: Ахтар Хафиз Умер
Ахтар Хафиз Умер
```

4.2 Программа lab5-2-home.asm (с in_out.asm)

Модифицированная программа с использованием подпрограмм из in_out.asm:

```asm
; lab5-2-home.asm
; Программа с использованием подпрограмм из in_out.asm

%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите строку: ',0

SECTION .bss
    buf: RESB 80

SECTION .text
    GLOBAL _start

_start:
    mov eax, msg
    call sprint

    mov ecx, buf
    mov edx, 80
    call sread

    mov eax, buf
    call sprint

    call quit
```

Тестирование программы:

```bash
@uakhafiz → ~/lab05 $ ./lab5-2-home
Введите строку: Ахтар Хафиз Умер
Ахтар Хафиз Умер
```

4.3 Итоговые файлы

```bash
@uakhafiz → ~/lab05 $ ls -la *.asm
-rw-rw-r-- 1 uakhafiz uakhafiz 3942 Nov 7 23:34 in_out.asm
-rw-rw-r-- 1 uakhafiz uakhafiz  400 Nov 7 11:10 lab5-1.asm
-rw-rw-r-- 1 uakhafiz uakhafiz  505 Nov 7 23:54 lab5-1-home.asm
-rw-rw-r-- 1 uakhafiz uakhafiz  253 Nov 7 23:16 lab5-2.asm
-rw-rw-r-- 1 uakhafiz uakhafiz  287 Nov 8 00:05 lab5-2-home.asm
```

---

5. Выводы

В ходе лабораторной работы:

· Освоены основы работы с ассемблером NASM
· Изучены инструкции mov и int
· Приобретены навыки использования системных вызовов Linux
· Освоена работа с внешними файлами (in_out.asm)
· Написаны программы для ввода/вывода данных

Работа выполнена успешно, все программы работают корректно. Полученные навыки позволяют создавать базовые программы на языке ассемблера и являются основой для дальнейшего изучения архитектуры компьютера.

---

Приложение: Использованные команды

Команда Описание
mkdir -p Создание каталога
nasm -f elf file.asm Трансляция в объектный файл
ld -m elf_i386 file.o -o file Компоновка в исполняемый файл
./file Запуск программы
ls -la *.asm Просмотр всех asm файлов
git add Добавление файлов в Git
git commit -m Фиксация изменений
git push Отправка на GitHub

```

---
