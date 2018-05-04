#!/bin/bash
COLOR='\033[1;33m'
END_COLOR='\033[0m'

printf "${COLOR}Updating repositories...${END_COLOR}\n"
apt-get update
printf "${COLOR}Finished${END_COLOR}\n"

printf "${COLOR}Intalling NPM ...${END_COLOR}\n"
apt-get install -y npm
printf "${COLOR}Finished${END_COLOR}\n"

printf "${COLOR}Intalling  wget...${END_COLOR}\n"
apt-get install -y wget
printf "${COLOR}Finished${END_COLOR}\n"

printf "${COLOR}Intalling  Git...${END_COLOR}\n"
apt-get install -y git
printf "${COLOR}Finished${END_COLOR}\n"

printf "${COLOR}Intalling  linpng12-dev...${END_COLOR}\n"
apt-get install -y libpng12-dev
printf "${COLOR}Finished${END_COLOR}\n"

printf "${COLOR}Installing zip PHP extension...${END_COLOR}\n"
docker-php-ext-install zip && docker-php-ext-enable zip
printf "${COLOR}Finished${END_COLOR}\n"

printf "${COLOR}Installing bower...${END_COLOR}\n"
npm install -g bower
printf "${COLOR}Finished${END_COLOR}\n"

printf "${COLOR}Preparing binary files${END_COLOR}\n"
mkdir -p /bin/
printf "${COLOR}Downloading composer 1.6.4...${END_COLOR}\n"
wget --output-document=/bin/composer.phar https://getcomposer.org/download/1.6.4/composer.phar
printf "${COLOR}Download has finished${END_COLOR}\n"
printf "${COLOR}Downloading Symfony command line helper...${END_COLOR}\n"
wget --output-document=/bin/symfony.phar https://symfony.com/installer
printf "${COLOR}Download has finished${END_COLOR}\n"

printf "${COLOR}Giving execution access for all binaries above...${END_COLOR}\n"
chmod -R +x /bin/*
printf "${COLOR}Granted.${END_COLOR}\n"

printf "${COLOR}Making symbolic links${END_COLOR}\n"
ln -s /bin/composer.phar /usr/bin/composer
ln -s /bin/symfony.phar /usr/bin/symfony
ln -s /usr/bin/nodejs /usr/bin/node
printf "${COLOR}Finished${END_COLOR}\n"

printf "${COLOR}Removing default /var/www folder${END_COLOR}\n"
rm -rf /var/www/
printf "${COLOR}The folder has been removed${END_COLOR}\n"
printf "${COLOR}Creating a link on /var/www pointing to /app folder${END_COLOR}\n"
ln -s /app/ /var/www
printf "${COLOR}Link created${END_COLOR}\n"

printf "${COLOR}Creating required empty folders${END_COLOR}\n"
mkdir -p /app/var/cache/prod/sessions/
mkdir -p /app/var/cache/prod/logs/
mkdir -p /app/var/cache/prod/cache/
mkdir -p /app/var/cache/dev/sessions/
mkdir -p /app/var/cache/dev/logs/
mkdir -p /app/var/cache/dev/cache/
printf "${COLOR}Finished${END_COLOR}\n"
printf "${COLOR}Giving ownership to www-data group${END_COLOR}\n"
chown -R www-data:www-data /app/var/cache/*
printf "${COLOR}The ownership has been given${END_COLOR}\n"

printf "${COLOR}Copying default PHP settings files${END_COLOR}\n"
cp -R /app/environment/settings/php/* /usr/local/etc/php/conf.d/
printf "${COLOR}Copied${END_COLOR}\n"

printf "${COLOR}Container is now built. You must create your own script to populate /app folder and download its dependencies. Have a good work! :)${END_COLOR}\n"