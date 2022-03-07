FROM ubuntu
LABEL maintainer="admodevcodes@outlook.com"
LABEL application="ubuntu-apache-server"
ARG UBUNTU_FRONTEND=noninteractive
ENV TZ=America/Argentina/Buenos_Aires
RUN apt-get update
RUN apt-get update && apt-get install -y --no-install-recommends tzdata \
    && rm -rf /var/lib/apt/lists/*
RUN ln -fs /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime \
    && dpkg-reconfigure --frontend noninteractive tzdata

FROM php:7.2-apache
RUN apt-get update
RUN apt-get install -qq -y apache2 bash
RUN pecl install xdebug-2.6.0
RUN docker-php-ext-enable xdebug
RUN docker-php-ext-install pdo pdo_mysql
ADD . /var/www/html

# CMD ["/bin/bash", "-c", "hostnamectl set-hostname ubuntuserver.com"]
