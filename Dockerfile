FROM php:7.1

RUN mkdir -p /app/

COPY ./scripts/ /usr/bin
COPY ./settings/ /app/environment/settings/php/

RUN build.sh

WORKDIR /app/