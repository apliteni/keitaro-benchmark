# Keitaro Benchmark

## Установка тестового трекера
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

## Запуск тестов YandexTank

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
