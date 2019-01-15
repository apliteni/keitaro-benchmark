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

## Запуск тестов YandexTank

Установка Docker

    ./bin/install-docker

Установка токена с overload.yandex.net

    ./bin/token.sh

Скопируйте конфиг теста

    cp tests/test1.example.yml tests/test1.yml

Пропишите в файлах tests/ вместо `TRACKER_URL` домен/ip трекера.


Запуск контейнера

    ./bin/yandex-tank.sh

Запуск теста

    yandex-tank -c tests/test1.yml
