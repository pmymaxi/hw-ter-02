## Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

## Задание 1

### Пункт 4
- var.cloud_id переменная определена а значение нет, даже по default, аналогично folder_id
- platform_id = "standart-v4" (опечатка standart => standard), v4 такой платформы нет, также core_fraction = 5 нет такого. Уровни производительности 5% имеются только standard-v1/v2
- cores = 1 (CPU) нет такого, расчет начинается с 2 при 5% производительности.
-serial-port-enable = 1 => serial-port-enable = "1"

### Пункт 6
preemptible = true  - параметр прерывания VM, VM может быть остановлена в любой момент и core_fraction=5  - уровень производительности vCPU. Может быть использовано для тестовых стендов, CI/CD сборка образов, выполнение тестов, вообщем там где не будет критичной если VM перейдет в режим down. 

Скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес и curl запрос.
  
  <img width="1882" height="429" alt="1" src="https://github.com/user-attachments/assets/c249d9ef-2c27-4f8a-935a-e42c6a353a60" />


## Задание 4

Вывод значений ip-адресов команды ```terraform output```

<img width="422" height="378" alt="4" src="https://github.com/user-attachments/assets/91b59627-c823-4078-b9c8-17a72c27cd5b" />


## Дополнительное задание

## Задание 7

1. Команда вывода **второго** элемента из списка test_list.
```tf 
local.test_list[1]
```
2. Длина списка test_list length = 3
```tf 
length(local.test_list)
```
3. interpolation выражение, c результатом вывода: "John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks

<img width="1628" height="143" alt="7" src="https://github.com/user-attachments/assets/b77fe337-848b-4be7-b04e-5c8c0a8620a0" />

```tf
"${local.test_map.admin} is ${keys(local.test_map)[0]} for ${local.test_list[2]} server based on OS ${local.servers.stage.image} with ${local.servers.stage.cpu + local.servers.production.cpu} vcpu, ${local.servers.stage.ram + local.servers.production.ram} ram and ${length(local.servers.stage.disks) + length(local.servers.production.disks)} virtual disks"
```

## Задание 8
2. Выражение в terraform console, которое позволит вычленить строку "ssh -o 'StrictHostKeyChecking=no' ubuntu@62.84.124.117"
```tf
var.test[0].dev1[0]
```
### Задание 9
Результат создания дполнительных ресурсов yandex_vpc_gateway (nat шлюз), yandex_vpc_route_table (таблица маршрутизации с stack nat) и дполнительным атрибутом (route_table_id ) присвоения таблицы маршрутизации к subnet.

<img width="1407" height="978" alt="9" src="https://github.com/user-attachments/assets/8dd31498-bc00-401b-a216-d0e8225329cb" />
