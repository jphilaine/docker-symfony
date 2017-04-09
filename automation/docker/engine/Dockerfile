FROM php:fpm

COPY date_timezone.ini /usr/local/etc/php/conf.d/date_timezone.ini
COPY uploads.ini /usr/local/etc/php/conf.d/uploads.ini
COPY opcache.ini /usr/local/etc/php-fpm.d/opcache.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

RUN apt-get update && apt-get install -y git

RUN docker-php-ext-install pdo_mysql exif opcache

# Install GD
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd

# Install intl
RUN apt-get install -y libicu-dev
RUN pecl install intl
RUN docker-php-ext-install intl

RUN usermod -u 1000 www-data

WORKDIR /home/admin/www
