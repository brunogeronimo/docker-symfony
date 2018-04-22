FROM php:7.2.4-cli-stretch

ADD build_environment.sh /usr/bin/build_environment.sh
RUN build_environment.sh