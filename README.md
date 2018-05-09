# Introduction
Hi there! :D
This docker image is responsible to install everything that you'll need to create your project using Symfony 4.

## Including
- PHP 7.1;
- Composer `1.0.6`;
- Symfony console application;
- NPM;
- wget;
- Git;
- libpng12-dev;
- Zip;
- Bower

## Hey, your image is not doing anything :(, why?
This image is using `Apache` as webserver. This image creates a symbolic link on `/var/www/html` which points to `/app`. You must create a `Dockerfile` to put your project inside `/app`file, and create a build script to download its dependencies, and so on.

## Can I make a question directly to you?
You can create an issue for that. If you really need to, you can also send me an e-mail. Just get it in my profile! :)