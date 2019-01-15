# Keitaro Benchmark

## Установка тестового трекера

Выполняется на сестовом сервере.

Загрузите перед установкой нового трекера дамп базы

    curl -sL https://github.com/apliteni/keitaro-benchmark/raw/master/datasets/dataset1.sql.gz > dump.gz

Во время установки:

    Укажите путь к файлу c SQL дампом > dump.gz
    Проверяем SQL дамп . OK
    Укажите значение параметра salt из старой конфигурации (application/config/config.ini.php) > test

Данные для входа

    admin
    1l5NyFFbm9f0Jcfs

Локальный лендинг
    sudo -u nginx mkdir -p -m 777 /var/www/keitaro/landers/local-land
    curl -sL https://github.com/apliteni/keitaro-benchmark/raw/master/datasets/lp.zip > /var/www/keitaro/landers/local-land/lp.zip
    cd  /var/www/keitaro/landers/local-land/
    sudo -u nginx unzip lp.zip
    sudo -u nginx php /var/www/keitaro/bin/cli.php  system:reload_cache


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



## Установка Telegraf на тестовый сервер (не обязательно)

    ansible-galaxy install rossmcdonald.telegraf
    curl -sL https://github.com/apliteni/keitaro-benchmark/raw/master/telegraf/telegraf.yml > telegraf.yml
    ansible-playbook telegraf.yml -i ,localhost