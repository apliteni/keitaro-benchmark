#!/usr/bin/env bash

sudo -u keitaro bash -c 'curl -fsL https://github.com/apliteni/keitaro-benchmark/raw/master/datasets/landers.tar.gz | tar -xzC /var/www/keitaro/'
sudo -u keitaro php /var/www/keitaro/bin/cli.php  system:reload_cache
