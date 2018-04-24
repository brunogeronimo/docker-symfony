#!/bin/bash

#updateing environment
apt-get update

#installing essencial dependencies
apt-get install -y libxml2-dev libedit-dev curl libpng-dev

#installing git
apt-get install -y git

#installing PHP required extensions
docker-php-ext-install gd &&
docker-php-ext-install json &&
docker-php-ext-install mbstring &&
docker-php-ext-install opcache &&
docker-php-ext-install readline &&
docker-php-ext-install xml &&
docker-php-ext-install zip &&
docker-php-ext-install pdo &&
docker-php-ext-install pdo_mysql &&
docker-php-ext-install mysqli