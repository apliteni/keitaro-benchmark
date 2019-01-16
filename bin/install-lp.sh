sudo -u nginx mkdir -p -m 777 /var/www/keitaro/landers/local-land
curl -sL https://github.com/apliteni/keitaro-benchmark/raw/master/datasets/lp.zip > /var/www/keitaro/landers/local-land/lp.zip
cd  /var/www/keitaro/landers/local-land/
sudo -u nginx unzip lp.zip
sudo -u nginx php /var/www/keitaro/bin/cli.php  system:reload_cache