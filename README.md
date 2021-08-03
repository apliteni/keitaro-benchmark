# Keitaro Benchmark

## Установка тестового трекера

Выполняется на сестовом сервере.

Загрузите перед установкой нового трекера дамп базы

    curl -sL https://github.com/apliteni/keitaro-benchmark/raw/master/datasets/dataset1.sql.gz > dump.gz

Установка с указанием дампа (соль: test, ключ лицензии: AAAA-BBBB-CCCC-DDDD, ip: 123.234.34.45):

        curl -fsSL keitaro.io/install.sh > run && \
        bash run -F dump.gz -S test -A 123.234.34.45 -K AAAA-BBBB-CCCC-DDDD

Для установки определенной сборки нужно указать URL со сборкой через параметр `-a`

        curl -fsSL keitaro.io/install.sh > run && \
        bash run -F dump.gz -S test -A 123.234.34.45 -K AAAA-BBBB-CCCC-DDDD -a http://domain/some_release.zip

Данные для входа

    admin
    1l5NyFFbm9f0Jcfs

Загрузка локального лендинга

    curl -fsSL https://raw.githubusercontent.com/apliteni/keitaro-benchmark/master/bin/install-lp.sh | bash

Примеры кампаний:

    http://x.x.x.x/nxJKck
    http://x.x.x.x/VPGvy3Zs
    http://x.x.x.x/gjdzXsYV
    http://x.x.x.x/debug

Создайте локально ssh-ключ 

    openssl genrsa -out ssh/id_rsa 2048
    ssh-keygen -f ssh/id_rsa -y > ssh/id_rsa.pub
    chmod 400 ssh/id_rsa

## Устнаовка Telegraf (для сбора метрик с сервера)

Запустите на сервере:

    ansible-galaxy install rossmcdonald.telegraf
    curl -sL https://github.com/apliteni/keitaro-benchmark/raw/master/telegraf/telegraf.yml > telegraf.yml
    ansible-playbook telegraf.yml -i ,localhost

    
Установите ключ авторизации в authorized_keys или утилитой ssh-copy-id:

    ssh-copy-id -i ssh/id_rsa root@X.X.X.X


## Запуск benchmark-тестов YandexTank

YandexTank запускается с локальной машины.

Установка Docker

    ./bin/install-docker

Настройка токена доступа к overload.yandex.net

    ./bin/token.sh

Создайте свой тест

    cp tests/example.yml tests/my-test.yml

Пропишите в файлах tests/ вместо `TRACKER_URL` домен/ip сервера, где стоит Keitaro.

Запустите контейнер и зайдите в его терминал:

    ./bin/yandex-tank.sh

Запустите свой тест в контейнере

    yandex-tank -c tests/my-test.yml

## Blackfire.io

Этим скриптом можно поставить blackfire и настроить его:

    ./bin/install-blackfire.sh

Во время установки будут запрашиваться параметры со страницы [https://blackfire.io/docs/up-and-running/installation].
