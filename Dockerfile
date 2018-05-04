FROM php:5.6

RUN mkdir -p /app/

COPY ./scripts/ /usr/bin
COPY ./settings/ /app/environment/settings/php/

RUN build.sh

WORKDIR /app/