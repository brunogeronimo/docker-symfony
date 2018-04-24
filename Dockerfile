FROM php:5.6-apache

ADD build_environment.sh /usr/bin/build_environment.sh
RUN build_environment.sh