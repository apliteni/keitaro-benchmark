# Keitaro Benchmark

## Установка тестового трекера

Выполняется на сестовом сервере.

Загрузите перед установкой нового трекера дамп базы

    curl -sL https://github.com/apliteni/keitaro-benchmark/raw/master/datasets/dataset1.sql.gz > dump.gz


Установка определенной сборки

    yum update -y && curl keitaro.io/install.sh > run && bash run -a http://domain/some_release.zip

Во время установки:

    Укажите путь к файлу c SQL дампом > dump.gz
    Проверяем SQL дамп . OK
    Укажите значение параметра salt из старой конфигурации (application/config/config.ini.php) > test

Данные для входа

    admin
    1l5NyFFbm9f0Jcfs

Загрузка локального лендинга

    git clone https://github.com/apliteni/keitaro-benchmark.git
    ./bin/install-lp.sh


Ключ для авторизациии с Telegraf

    openssl genrsa -out ssh/id_rsa 2048
    ssh-keygen -f ssh/id_rsa -y > ssh/id_rsa.pub
    ssh-copy-id -i ssh/id_rsa root@server_ip
    chmod 400 ssh/id_rsa

## Запуск тестов YandexTank

YandexTank запускается на локальной машине.

Установка Docker

    ./bin/install-docker

Установка токена с overload.yandex.net

    ./bin/token.sh

Скопируйте конфиг теста

    cp tests/example.yml tests/test1.yml

Пропишите в файлах tests/ вместо `TRACKER_URL` домен/ip трекера.

Запуск контейнера

    ./bin/yandex-tank.sh

Запуск теста

    yandex-tank -c tests/test1.yml

## Blackfire

    ./bin/install-blackfire.sh

Во время установки будут запрашиваться параметры со страницы [https://blackfire.io/docs/up-and-running/installation].

## Установка Telegraf на тестовый сервер (не обязательно)

    ansible-galaxy install rossmcdonald.telegraf
    curl -sL https://github.com/apliteni/keitaro-benchmark/raw/master/telegraf/telegraf.yml > telegraf.yml
    ansible-playbook telegraf.yml -i ,localhost
