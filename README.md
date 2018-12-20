[![Build Status](https://gitlab.gettwifi.com/DevOps/terraform/badges/master/pipeline.svg)](https://gitlab.gettwifi.com/DevOps/terraform/commits/master)

terraform
=========

В данном проекте описана вся инфрастукрура созданная на DO

структура проекта
-----------------

    dns.tf
    
Описаны все записи DNS сервера на DO

    firewall.tf
    
Описаны правила firewall

    lb.tf
    
Описание load balancer

    main.tf
    
Описаны все сервера 

    tags.tf
    
Создание всех тегов используемых в серверах

    variables.tf
    
Заданы все переменные использумые в коде

    terraform.tfvars
    
Заданы ключи для доступа к API DO и серверам

    provider.tf

Указание испоьзуемого провайдера

    gettwifi.com
    
Директория с SSL сертификатами для балансировщика

    cloud_init
    
Директория с cloud init скриптами

Структура файла variables.tf
----------------------------

    *_cout
    
Количество соответствующих серверов

    main_region
    
Регион создания серверов

    main_image
    
Базовый образ используемый на серверах

    do_token
    
API token

    my_key_private
    
SSH key для доступа к серверам (сейчас используется cloud init)

    my_key_public
    vlad_key_public
    
Публичные ключи добавляемые на сервера

Пример использования
====================

    terraform init
    terraform plan
    terraform apply