sudo yum install pygpgme wget -y
wget -O - "http://packages.blackfire.io/fedora/blackfire.repo" | sudo tee /etc/yum.repos.d/blackfire.repo
sudo yum install blackfire-agent  -y
sudo blackfire-agent -register
sudo /etc/init.d/blackfire-agent restart
sudo yum install blackfire-php -y
blackfire config
