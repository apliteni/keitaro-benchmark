#!/usr/bin/env bash

sudo -u keitaro mkdir -p -m 777 /var/www/keitaro/landers/local-land
curl -sL https://github.com/apliteni/keitaro-benchmark/raw/master/datasets/lp.zip > /var/www/keitaro/landers/local-land/lp.zip
cd  /var/www/keitaro/landers/local-land/
sudo -u keitaro unzip lp.zip
sudo -u keitaro php /var/www/keitaro/bin/cli.php  system:reload_cache
