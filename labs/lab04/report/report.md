---
author: "Ахтар Хафиз Умер"
group: "НКАБД-07-25"
lang: ru-RU
toc-title: "Содержание"
---

# Отчет по лабораторной работе № 4

**Дисциплина:** Архитектура компьютера  
**Студент:** Ахтар Хафиз Умер  
**Группа:** НКАБД-07-25  
**Москва, 2025**

---

## 1. Цель работы

Освоение процедуры компиляции и сборки программ, написанных на ассемблере NASM. Приобретение практических навыков работы с транслятором NASM и компоновщиком LD.

---

## 2. Теоретическое введение

Язык ассемблера (assembly language) — это машинно-ориентированный язык низкого уровня, который позволяет получить более полный доступ к архитектуре ЭВМ и её аппаратным возможностям.

**Процесс создания ассемблерной программы включает четыре основных этапа:**

| Этап | Описание | Команда |
|------|----------|---------|
| 1 | Написание исходного кода | Редактор (nano, vim) |
| 2 | Трансляция в объектный файл | `nasm -f elf file.asm` |
| 3 | Компоновка в исполняемый файл | `ld -m elf_i386 file.o -o file` |
| 4 | Запуск программы | `./file` |

---

## 3. Выполнение лабораторной работы

### 3.1 Создание рабочего каталога

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ pwd
/workspaces/study_2024-2025_arch-pc/labs/lab04
```

3.2 Установка и проверка NASM

Обновление пакетов и установка NASM:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ sudo apt update
Get:1 http://archive.ubuntu.com/ubuntu noble InRelease [256 kB]
Get:2 https://packages.microsoft.com/repos/microsoft-ubuntu-noble-prod noble InRelease [3600 B]
Get:3 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]
...
Reading package lists... Done

@uakhafiz → ~/work/arch-pc/lab04 $ sudo apt install -y nasm
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  nasm
0 upgraded, 1 newly installed, 0 to remove and 131 not upgraded.
Need to get 459 kB of archives.
After this operation, 3407 kB of additional disk space will be used.
Get:1 http://archive.ubuntu.com/ubuntu noble/universe amd64 nasm amd64 2.16.01-1build1 [459 kB]
Fetched 459 kB in 1s (776 kB/s)
Selecting previously unselected package nasm.
Unpacking nasm (2.16.01-1build1) ...
Setting up nasm (2.16.01-1build1) ...
Processing triggers for man-db (2.12.0-4build2) ...
```

Проверка версии NASM:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ nasm --version
NASM version 2.16.01
```

3.3 Создание исходного файла hello.asm

Содержимое файла hello.asm:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ cat hello.asm
; hello.asm

SECTION .data
hello: DB 'Hello world!',10
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

3.4 Трансляция и компоновка программы

Трансляция исходного кода в объектный файл:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ nasm -f elf hello.asm
```

Проверка созданного объектного файла:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ ls -la
total 16
drwxr-xr-x 2 codespace 4096 Mar  5 08:32 .
drwxr-xr-x 3 codespace 4096 Mar  5 08:31 ..
-rw-r--r-- 1 codespace  235 Mar  5 08:31 hello.asm
-rw-r--r-- 1 codespace  656 Mar  5 08:32 hello.o
```

Компоновка объектного файла в исполняемый:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ ld -m elf_i386 hello.o -o hello
```

Проверка созданного исполняемого файла:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ ls -la
total 28
drwxr-xr-x 2 codespace 4096 Mar  5 08:33 .
drwxr-xr-x 3 codespace 4096 Mar  5 08:31 ..
-rwxr-xr-x 1 codespace 8668 Mar  5 08:33 hello
-rw-r--r-- 1 codespace  235 Mar  5 08:31 hello.asm
-rw-r--r-- 1 codespace  656 Mar  5 08:32 hello.o
```

3.5 Запуск программы "Hello World"

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ ./hello
Hello world!
```

Вывод: Программа успешно выполнилась и вывела на экран сообщение "Hello world!", что подтверждает корректность всего процесса разработки.

3.6 Создание модифицированной программы

Копирование исходного файла:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ cp hello.asm lab4.asm
```

Модификация текста сообщения (замена на имя студента):

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ sed -i 's/Hello world!/Ахтар Хафиз Умер/' lab4.asm
```

Просмотр модифицированного файла:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ cat lab4.asm
; hello.asm

SECTION .data
hello: DB 'Ахтар Хафиз Умер',10
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

3.7 Трансляция, компоновка и запуск модифицированной программы

Трансляция:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ nasm -f elf lab4.asm
```

Компоновка:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ ld -m elf_i386 lab4.o -o lab4
```

Запуск:

```bash
@uakhafiz → ~/work/arch-pc/lab04 $ ./lab4
Ахтар Хафиз Умер
```

Вывод: Модифицированная программа успешно выполнилась и вывела на экран имя студента "Ахтар Хафиз Умер".

3.8 Загрузка файлов в GitHub

Добавление файлов в репозиторий:

```bash
@uakhafiz → /workspaces/study_2024-2025_arch-pc (main) $ git add labs/lab04/
@uakhafiz → /workspaces/study_2024-2025_arch-pc (main) $ git commit -m "Add lab04 assembly programs"
[main 581bfd3] Add lab04 assembly programs
 3 files changed, 78 insertions(+), 0 deletions(-)
 create mode 100644 labs/lab04/hello.asm
 create mode 100644 labs/lab04/lab4.asm
 create mode 100644 labs/lab04/report/report.md

@uakhafiz → /workspaces/study_2024-2025_arch-pc (main) $ git push
Enumerating objects: 8, done.
Counting objects: 100% (8/8), done.
Delta compression using up to 2 threads
Compressing objects: 100% (4/4), done.
Writing objects: 100% (6/6), 738 bytes | 738.00 KiB/s, done.
Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/uakhafiz/study_2024-2025_arch-pc
   fac2ed9..581bfd3 main -> main
```

---

4. Структура файлов в репозитории

```
study_2024-2025_arch-pc/
└── labs/
    └── lab04/
        ├── hello.asm          # Исходный код программы Hello World
        ├── lab4.asm           # Модифицированная программа с именем студента
        └── report/
            └── report.md      # Отчет по лабораторной работе
```

---

5. Выводы

В ходе выполнения лабораторной работы были освоены:

Навык Описание
Установка NASM Установка транслятора ассемблера в Ubuntu
Написание кода на ассемблере Создание программы вывода сообщения
Трансляция Преобразование .asm в объектный файл .o
Компоновка Создание исполняемого файла из объектного
Запуск программы Выполнение скомпилированной программы
Модификация кода Изменение выводимого сообщения
Работа с Git Сохранение файлов в репозитории

Все этапы создания ассемблерной программы были успешно выполнены:

1. Написание исходного кода в редакторе nano
2. Трансляция с помощью NASM (nasm -f elf)
3. Компоновка с помощью LD (ld -m elf_i386)
4. Запуск программы и проверка результата

---

Приложение: Использованные команды

Команда Описание
sudo apt update Обновление списка пакетов
sudo apt install nasm Установка NASM
nasm --version Проверка версии NASM
nasm -f elf file.asm Трансляция в объектный файл
ld -m elf_i386 file.o -o file Компоновка в исполняемый файл
./file Запуск программы
cat file.asm Просмотр содержимого файла
cp hello.asm lab4.asm Копирование файла
sed -i 's/old/new/' file Замена текста в файле
git add Добавление файлов в Git
git commit -m "message" Фиксация изменений
git push Отправка на GitHub

```

---
