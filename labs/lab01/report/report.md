---
author: "Ахтар Хафиз Умер"
group: "НКАБД-07-25"
lang: ru-RU
toc-title: "Содержание"
---

# Отчет по лабораторной работе № 1

**Дисциплина:** Архитектура компьютера  
**Студент:** Ахтар Хафиз Умер  
**Группа:** НКАБД-07-25  
**Москва, 2025**

---

## 1. Цель работы

Приобретение практических навыков работы с операционной системой на уровне командной строки (организация файловой системы, навигация по файловой системе, создание и удаление файлов и директорий).

---

## 2. Теоретическое введение

### 2.1 Введение в GNU Linux

Операционная система (ОС) — это комплекс взаимосвязанных программ, предназначенных для управления ресурсами компьютера и организации взаимодействия с пользователем. Сегодня наиболее известными операционными системами являются ОС семейства Microsoft Windows и UNIX-подобные системы.

**GNU Linux** — семейство переносимых, многозадачных и многопользовательских операционных систем, на базе ядра Linux, включающих тот или иной набор утилит и программ проекта GNU, и, возможно, другие компоненты. Как и ядро Linux, системы на его основе, как правило, создаются и распространяются в соответствии с моделью разработки свободного и открытого программного обеспечения (Open-Source Software). Linux-системы распространяются в основном бесплатно в виде различных дистрибутивов.

**Дистрибутив GNU Linux** — общее определение ОС, использующих ядро Linux и набор библиотек и утилит, выпускаемых в рамках проекта GNU, а также графическую оконную подсистему X Window System. Дистрибутив готов для конечной установки на пользовательское оборудование.

Существуют дистрибутивы, разрабатываемые как при коммерческой поддержке (Red Hat / Fedora, SLED / OpenSUSE, Ubuntu), так и исключительно усилиями добровольцев (Debian, Slackware, Gentoo, ArchLinux).

### 2.2 Файловая структура GNU Linux: каталоги и файлы

Файловая система определяет способ организации, хранения и именования данных на носителях информации в компьютерах и представляет собой иерархическую структуру в виде вложенных друг в друга каталогов (директорий), содержащих все файлы.

В ОС Linux каталог, который является "вершиной" файловой системы, называется **корневым каталогом**, обозначается символом `/` и содержит все остальные каталоги и файлы.

#### Виды путей к файлу:

| Тип пути | Описание | Пример |
|----------|----------|--------|
| **Абсолютный путь** | Начинается от корня `/` | `/home/user/documents/file.txt` |
| **Относительный путь** | Начинается от текущего каталога | `documents/file.txt` |

В Linux любой пользователь имеет **домашний каталог**. Для обозначения домашнего каталога используется знак тильды (`~`).

### 2.3 Базовые команды bash

Общий формат команд:
```bash
<имя_команды> <разделитель> <аргументы>
```

Для получения подробной информации по командам используется man.

---

3. Выполнение лабораторной работы

3.1 Навигация по файловой системе

Переход в домашний каталог и определение текущего пути:

```bash
@uakhafiz → $ cd ~
@uakhafiz → $ pwd
/home/codespace
```

Просмотр содержимого домашнего каталога:

```bash
@uakhafiz → $ ls -la
total 112
drwxr-xr-x 1 codespace 4096 Mar  5 08:10 .
drwxr-xr-x 1 root      root  4096 Mar  5 08:08 ..
-rw-r--r-- 1 codespace  220 Mar 31 2024 .bash_logout
-rw-r--r-- 1 codespace 5885 Nov 27 10:33 .bashrc
drwxr-xr-x 1 codespace 4096 Mar  5 08:10 .cache
drwxr-xr-x 2 codespace 4096 Nov 27 10:36 .conda
drwxr-xr-x 1 codespace 4096 Mar  5 08:11 .config
lrwxrwxrwx 1 root      root    47 Mar  5 08:10 .docker -> /workspaces/.codespaces/.persistedshare/.docker
lrwxrwxrwx 1 root      root    17 Nov 27 10:50 .dotnet -> /usr/share/dotnet
-rw-r--r-- 1 codespace  126 Mar  5 08:10 .gitconfig
drwxr-xr-x 2 root      root  4096 Nov 27 10:50 .hugo
drwxr-xr-x 2 codespace 4096 Nov 27 10:50 .jupyter
drwxr-xr-x 1 codespace 4096 Nov 27 10:50 .local
drwxr-xr-x 2 root      root  4096 Nov 27 10:50 .maven
drwxr-xr-x 2 codespace 4096 Nov 27 10:44 .minikube
drwxr-xr-x 2 root      root  4096 Nov 27 10:36 .nvs
drwxr-xr-x 1 codespace 4096 Nov 27 10:44 .oh-my-zsh
drwxr-xr-x 2 codespace 4096 Nov 27 10:50 .php
-rw-r--r-- 1 codespace  807 Mar 31 2024 .profile
drwxr-xr-x 2 root      root  4096 Nov 27 10:50 .python
drwxrwsr-x 3 codespace rvm   4096 Nov 27 10:42 .rbenv
drwxr-xr-x 2 root      root  4096 Nov 27 10:50 .ruby
-rw-r--r-- 1 codespace   39 Mar  5 08:08 .rvmrc
drwxr-xr-x 5 codespace 4096 Mar  5 08:10 .vscode-remote
-rw-r--r-- 1 codespace   22 Nov 27 10:33 .zprofile
-rw-r--r-- 1 codespace 4018 Nov 27 10:33 .zshrc
lrwxrwxrwx 1 root      root    33 Nov 27 10:50 java -> /usr/local/sdkman/candidates/java
lrwxrwxrwx 1 root      root    20 Nov 27 10:50 nvm -> /usr/local/share/nvm
```

3.2 Создание каталогов и файлов

Создание каталогов parentdir и newdir с вложенными структурами:

```bash
@uakhafiz → $ mkdir -p parentdir/dir1 parentdir/dir2
@uakhafiz → $ mkdir -p newdir/dir1/dir2
```

Проверка созданной структуры:

```bash
@uakhafiz → $ ls -R parentdir newdir
newdir:
dir1

newdir/dir1:
dir2

parentdir:
dir1 dir2

parentdir/dir1:

parentdir/dir2:
```

Создание файла test.txt в каталоге newdir/dir1/dir2/:

```bash
@uakhafiz → $ touch newdir/dir1/dir2/test.txt
@uakhafiz → $ ls -la newdir/dir1/dir2/
total 8
drwxr-xr-x 2 codespace 4096 Mar  5 08:13 .
drwxr-xr-x 3 codespace 4096 Mar  5 08:13 ..
-rw-r--r-- 1 codespace    0 Mar  5 08:13 test.txt
```

3.3 Удаление файлов

Удаление файла с запросом подтверждения:

```bash
@uakhafiz → $ rm -i newdir/dir1/dir2/*.txt
rm: remove regular empty file 'newdir/dir1/dir2/test.txt'? y
```

Проверка удаления:

```bash
@uakhafiz → $ ls newdir/dir1/dir2/
```

3.4 Создание, копирование и перемещение файлов

Создание структуры каталогов и файлов:

```bash
@uakhafiz → $ mkdir -p parentdir1/dir1 parentdir2/dir2 parentdir3
@uakhafiz → $ touch parentdir1/dir1/test1.txt parentdir2/dir2/test2.txt
```

Проверка созданных файлов:

```bash
@uakhafiz → $ ls -la parentdir1/dir1/ parentdir2/dir2/
parentdir1/dir1/:
total 8
drwxr-xr-x 2 codespace 4096 Mar  5 08:14 .
drwxr-xr-x 3 codespace 4096 Mar  5 08:14 ..
-rw-r--r-- 1 codespace    0 Mar  5 08:14 test1.txt

parentdir2/dir2/:
total 8
drwxr-xr-x 2 codespace 4096 Mar  5 08:14 .
drwxr-xr-x 3 codespace 4096 Mar  5 08:14 ..
-rw-r--r-- 1 codespace    0 Mar  5 08:14 test2.txt
```

Копирование и перемещение файлов:

```bash
@uakhafiz → $ cp parentdir2/dir2/test2.txt parentdir3/
@uakhafiz → $ mv parentdir1/dir1/test1.txt parentdir3/
```

Проверка результата:

```bash
@uakhafiz → $ ls -la parentdir3/
total 12
drwxr-xr-x 2 codespace 4096 Mar  5 08:14 .
drwxr-xr-x 3 codespace 4096 Mar  5 08:14 ..
-rw-r--r-- 1 codespace    0 Mar  5 08:14 test1.txt
-rw-r--r-- 1 codespace    0 Mar  5 08:14 test2.txt
```

3.5 Копирование и переименование файлов

Копирование с новым именем:

```bash
@uakhafiz → $ cp parentdir3/test2.txt parentdir3/subtest2.txt
```

Переименование файла:

```bash
@uakhafiz → $ mv parentdir3/test1.txt parentdir3/newtest.txt
```

Проверка результата:

```bash
@uakhafiz → $ ls -la parentdir3/
total 12
drwxr-xr-x 2 codespace 4096 Mar  5 08:15 .
drwxr-xr-x 3 codespace 4096 Mar  5 08:15 ..
-rw-r--r-- 1 codespace    0 Mar  5 08:15 newtest.txt
-rw-r--r-- 1 codespace    0 Mar  5 08:15 subtest2.txt
-rw-r--r-- 1 codespace    0 Mar  5 08:14 test2.txt
```

Вывод: Команда mv может быть использована для переименования файлов и каталогов, а команда cp позволяет сделать копию файла с новым именем.

---

4. Выполнение самостоятельной работы

Задание 1-2: Создание каталогов temp и labs

```bash
@uakhafiz → $ cd ~
@uakhafiz → $ mkdir -p temp labs/lab1 labs/lab2 labs/lab3
@uakhafiz → $ touch temp/text1.txt temp/text2.txt temp/text3.txt
```

Задание 3: Запись данных в файлы

```bash
@uakhafiz → $ echo "Ахтар" > temp/text1.txt
@uakhafiz → $ echo "Хафиз Умер" > temp/text2.txt
@uakhafiz → $ echo "НКАБД-07-25" > temp/text3.txt
```

Проверка содержимого файлов:

```bash
@uakhafiz → $ cat temp/text1.txt temp/text2.txt temp/text3.txt
Ахтар
Хафиз Умер
НКАБД-07-25
```

Задание 4: Копирование файлов в каталог labs

```bash
@uakhafiz → $ cp temp/*.txt labs/
```

Задание 5: Переименование и перемещение файлов

```bash
@uakhafiz → $ cd labs
@uakhafiz → $ mv text1.txt firstname.txt
@uakhafiz → $ mv firstname.txt lab1/
@uakhafiz → $ mv text2.txt lastname.txt
@uakhafiz → $ mv lastname.txt lab2/
@uakhafiz → $ mv text3.txt id-group.txt
@uakhafiz → $ mv id-group.txt lab3/
```

Проверка результатов:

```bash
@uakhafiz → $ ls lab1/
firstname.txt
@uakhafiz → $ ls lab2/
lastname.txt
@uakhafiz → $ ls lab3/
id-group.txt
@uakhafiz → $ cat lab1/firstname.txt lab2/lastname.txt lab3/id-group.txt
Ахтар
Хафиз Умер
НКАБД-07-25
```

Задание 6: Удаление всех созданных файлов и каталогов

```bash
@uakhafiz → $ rm -rf temp labs parentdir parentdir1 parentdir2 parentdir3 newdir
```

Проверка удаления:

```bash
@uakhafiz → $ ls
```

Задание 7: Сохранение работы в репозитории

```bash
@uakhafiz → /workspaces/study_2024-2025_arch-pc (main) $ git add labs/lab01/
@uakhafiz → /workspaces/study_2024-2025_arch-pc (main) $ git commit -m "Add Lab 1 report and practice"
[main fac2ed9] Add Lab 1 report and practice
 1 file changed, 10 insertions(+)
 create mode 100644 labs/lab01/report/report.md

@uakhafiz → /workspaces/study_2024-2025_arch-pc (main) $ git push
Enumerating objects: 7, done.
Counting objects: 100% (7/7), done.
Delta compression using up to 2 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (6/6), 618 bytes | 618.00 KiB/s, done.
Total 6 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/uakhafiz/study_2024-2025_arch-pc
   7b50150..fac2ed9 main -> main
```

---

5. Выводы

В ходе выполнения лабораторной работы были закреплены практические навыки работы с операционной системой посредством командной строки. Освоены основные приёмы:

· Навигация по файловой системе (cd, pwd, ls)
· Создание каталогов и файлов (mkdir, touch)
· Копирование и перемещение файлов (cp, mv)
· Удаление файлов и каталогов (rm, rm -r)
· Работа с текстовыми файлами (echo, cat)
· Использование относительных и абсолютных путей

Полученные навыки позволяют уверенно управлять файловой системой без графического интерфейса и являются базой для дальнейшего изучения администрирования Linux.

---

Приложение: Использованные команды

Команда Описание
pwd Показать текущий каталог
ls -la Показать все файлы с подробной информацией
mkdir -p Создать каталог с родительскими каталогами
touch Создать пустой файл
cp Копировать файл
mv Переместить или переименовать файл
rm -i Удалить файл с запросом подтверждения
rm -rf Рекурсивно удалить каталог без подтверждения
echo Записать текст в файл
cat Вывести содержимое файла
git add Добавить файлы в индекс Git
git commit Зафиксировать изменения
git push Отправить изменения в удаленный репозиторий

```
---
