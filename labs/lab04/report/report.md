---
title: "Лабораторная работа №4"
author: "Ахтар Хафиз Умер"
group: "НКАбд-07-25"
lang: ru-RU
toc-title: "Содержание"
---

# Лабораторная работа №4
# Создание и процесс обработки программ на языке ассемблера NASM

## Цель работы

Освоение процедуры компиляции и сборки программ, написанных на ассемблере NASM.

## Выполнение работы

### 4.1 Программа Hello world!

```assembly
; hello.asm

SECTION .data
hello: DB "Hello world!",10
helloLen: EQU $-hello

SECTION .text
GLOBAL _start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,hello
    mov edx,helloLen
    int 80h

    mov eax,1
    mov ebx,0
    int 80h
```

### 4.2 Компиляция и запуск

```bash
$ nasm -f elf hello.asm
$ ld -m elf_i386 hello.o -o hello
$ ./hello
Hello world!
```
