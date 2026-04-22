## Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

## Задание 1

### Пункт 4
- var.cloud_id переменная определена а значение нет, даже по default, аналогично folder_id
- platform_id = "standart-v4" (опечатка standart => standard), v4 такой платформы нет, также core_fraction = 5 нет такого. Уровни производительности 5% имеются только standard-v1/v2
- cores = 1 (CPU) нет такого, расчет начинается с 2 при 5% производительности.
-serial-port-enable = 1 => serial-port-enable = "1"

### Пункт 6
preemptible = true  - параметр прерывания VM, VM может быть остановлена в любой момент и core_fraction=5  - уровень производительности vCPU. Может быть использовано для тестовых стендов, CI/CD сборка образов, выполнение тестов, вообщем там где не будет критичной если VM перейдет в режим down. 
- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;
- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;
- ответы на вопросы.

### Задание 4
Скрин 4

## Дополнительное задание

### Задание 7
1. Команда вывода **второго** элемента из списка test_list.
```tf 
local.test_list[1]
```
2. Длина списка test_list length = 3
```tf 
length(local.test_list)
```
3. interpolation выражение, c результатом вывода: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks
скриншот

### Задание 8
2. Выражение в terraform console, которое позволит вычленить строку "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117"
```tf
var.test[0].dev1[0]
```
### Задание 9
скриншот